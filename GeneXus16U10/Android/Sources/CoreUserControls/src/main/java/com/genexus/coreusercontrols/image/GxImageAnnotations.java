package com.genexus.coreusercontrols.image;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.os.AsyncTask;
import android.view.MotionEvent;

import androidx.annotation.NonNull;

import com.artech.base.controls.IGxControlRuntime;
import com.artech.base.controls.IGxEditThemeable;
import com.artech.base.metadata.enums.Alignment;
import com.artech.base.metadata.enums.ImageScaleType;
import com.artech.base.metadata.expressions.Expression;
import com.artech.base.metadata.layout.LayoutItemDefinition;
import com.artech.base.metadata.theme.ThemeClassDefinition;
import com.artech.base.services.Services;
import com.artech.base.utils.Strings;
import com.artech.controls.GxImageViewBase;
import com.artech.controls.IGxEdit;
import com.artech.ui.Coordinator;
import com.artech.utils.BitmapUtils;

import java.util.ArrayList;
import java.util.List;

@SuppressLint("ViewConstructor")
public class GxImageAnnotations extends GxImageViewBase implements IGxEditThemeable, IGxControlRuntime {

	public static final String NAME = "SDImageAnnotations";

	private static final String PROPERTY_TRACE_THICKNESS = "TraceThickness";
	private static final String PROPERTY_TRACE_COLOR = "TraceColor";

	private static final String METHOD_GET_ANNOTATED_IMAGE = "getannotatedimage";
	private static final String METHOD_GET_ANNOTATIONS = "getannotations";
	private static final String METHOD_UNDO = "Undo";
	private static final String METHOD_REDO = "Redo";

	private static final float TOUCH_TOLERANCE = 4;
	private static final float DEFAULT_WIDTH = 3.0f;
	private static final int DEFAULT_COLOR = 0x00000000;

	private final GxImageAnnotationsDefinition mDefinition;
	private final Context mContext;

	private ThemeClassDefinition mThemeClassDefinition;
	private ImageScaleType mScaleType;
	private String mTag;
	private String mUri;
	private float mLastPositionX;
	private float mLastPositionY;
	private boolean mShouldScreenBeCleared = false;
	private boolean mShouldDrawImage = false;

	private Bitmap mCanvasBitmap;
	private Bitmap mImageBitmap;
	private Canvas mCanvas;
	private Path mPath;
	private Paint mDrawPaint;
	private Paint mClearPaint;
	private Paint mBitmapPaint;
	private Matrix mTransformation;

	private List<DrawItem> mDrawHistory;
	private List<DrawItem> mUndoHistory;
	private int mCurrentHistoryIndex = 0;

	public GxImageAnnotations(Context context, Coordinator coordinator, LayoutItemDefinition def) {
		super(context, null);
		mContext = context;
		mDefinition = new GxImageAnnotationsDefinition(def);
		mScaleType = ImageScaleType.FIT;
		setWillNotDraw(false);
		setupDrawing();
	}

	@Override
	public Expression.Value getPropertyValue(String propertyName) {
		switch (propertyName) {
			case PROPERTY_TRACE_THICKNESS:
				return Expression.Value.newInteger(mDefinition.getTraceThickness());
			case PROPERTY_TRACE_COLOR:
				return Expression.Value.newString(mDefinition.getTraceColor());
		}
		return null;
	}

	@Override
	public void setPropertyValue(String propertyName, Expression.Value value) {
		switch (propertyName) {
			case PROPERTY_TRACE_THICKNESS:
				setTraceThickness(value.coerceToInt());
				break;
			case PROPERTY_TRACE_COLOR:
				setTraceColor(value.coerceToString());
				break;
			default:
				Services.Log.warning(NAME, "Unsupported property: " + propertyName);
		}
	}

	@Override
	public Expression.Value callMethod(String methodName, List<Expression.Value> parameters) {
		switch (methodName) {
			case METHOD_GET_ANNOTATIONS:
				Bitmap annotationsBitmap = computeFinalBitmap(false);
				String annotationsOnly = GxImageAnnotationsHelper.getCurrentCanvasImage(mContext, annotationsBitmap);
				return Expression.Value.newString(annotationsOnly);
			case METHOD_GET_ANNOTATED_IMAGE:
				Bitmap annotatedImageBitmap = computeFinalBitmap(true);
				String annotatedImage = GxImageAnnotationsHelper.getCurrentCanvasImage(mContext, annotatedImageBitmap);
				return Expression.Value.newString(annotatedImage);
			case METHOD_UNDO:
				undoDrawing();
				break;
			case METHOD_REDO:
				redoDrawing();
				break;
		}
		return null;
	}

	private void setupDrawing() {
		mTransformation = new Matrix();
		mUndoHistory = new ArrayList<>();
		mDrawHistory = new ArrayList<>();
		mPath = new Path();
		mClearPaint = new Paint();
		mClearPaint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.CLEAR));
		mBitmapPaint = new Paint();
		mBitmapPaint.setFilterBitmap(true);
		mDrawPaint = new Paint(Paint.DITHER_FLAG);
		mDrawPaint.setAntiAlias(true);
		mDrawPaint.setDither(true);
		mDrawPaint.setStyle(Paint.Style.STROKE);
		mDrawPaint.setStrokeJoin(Paint.Join.ROUND);
		mDrawPaint.setStrokeCap(Paint.Cap.ROUND);
		mDrawPaint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.SRC_OVER));

		if (mDefinition.getTraceColor().isEmpty())
			mDrawPaint.setColor(DEFAULT_COLOR);
		else
			mDrawPaint.setColor(GxImageAnnotationsHelper.parseHexColor(mDefinition.getTraceColor()));

		if (mDefinition.getTraceThickness() == 0)
			mDrawPaint.setStrokeWidth(DEFAULT_WIDTH);
		else
			mDrawPaint.setStrokeWidth(Services.Device.dipsToPixels(mDefinition.getTraceThickness()));
	}

	@Override
	protected void onSizeChanged(int width, int height, int oldWidth, int oldHeight) {
		super.onSizeChanged(width, height, oldWidth, oldHeight);
		mCanvasBitmap = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888);
		createCanvasFromBitmap(mCanvasBitmap);
	}

	private void createCanvasFromBitmap(Bitmap bitmap) {
		mImageBitmap = bitmap;
		mCanvasBitmap = Bitmap.createBitmap(this.getWidth(), this.getHeight(), Bitmap.Config.ARGB_8888);
		mCanvas = new Canvas(mCanvasBitmap);

		float originalWidth = mImageBitmap.getWidth();
		float originalHeight = mImageBitmap.getHeight();

		Services.Log.debug("image size: " + originalHeight + "x" + originalWidth);
		Services.Log.debug("control size: " + this.getHeight() + "x" + this.getWidth());

		// we cannot handle null or TILE
		if (mScaleType == null || mScaleType == ImageScaleType.TILE) {
			mScaleType = ImageScaleType.FIT;
		}

		BitmapUtils.computeScalingMatrix(originalWidth, originalHeight, getWidth(), getHeight(), mScaleType, Alignment.CENTER, mTransformation);
		mShouldDrawImage = true;

		invalidate();
	}

	private Bitmap computeFinalBitmap(boolean withImage) {
		Bitmap finalBitmap = Bitmap.createBitmap(this.getWidth(), this.getHeight(), Bitmap.Config.ARGB_8888);
		Canvas finalCanvas = new Canvas(finalBitmap);

		if (withImage && mImageBitmap != null) {
			finalCanvas.drawBitmap(mImageBitmap, mTransformation, mBitmapPaint);
		}

		for (DrawItem drawItem : mDrawHistory) {
			mDrawPaint.setColor(drawItem.mColor);
			mDrawPaint.setStrokeWidth(drawItem.mStrokeWidth);
			finalCanvas.drawPath(drawItem.mPath, mDrawPaint);
		}

		return finalBitmap;
	}

	@Override
	protected void onDraw(Canvas canvas) {
		canvas.save();

		if (mShouldScreenBeCleared) {
			mCanvas.drawPaint(mClearPaint);
			mShouldScreenBeCleared = false;
			if (mImageBitmap != null) mShouldDrawImage = true;
		}

		if (mShouldDrawImage) {
			mCanvas.drawBitmap(mImageBitmap, mTransformation, mBitmapPaint);
			mShouldDrawImage = false;
		}

		for (DrawItem drawItem : mDrawHistory) {
			mDrawPaint.setColor(drawItem.mColor);
			mDrawPaint.setStrokeWidth(drawItem.mStrokeWidth);
			mCanvas.drawPath(drawItem.mPath, mDrawPaint);
		}

		canvas.drawBitmap(mCanvasBitmap, 0, 0, mDrawPaint);
		canvas.restore();
	}

	@Override
	public boolean onTouchEvent(MotionEvent event) {
		float touchX = event.getX();
		float touchY = event.getY();

		switch (event.getAction()) {
			case MotionEvent.ACTION_DOWN:
				touchStart(touchX, touchY);
				invalidate();
				break;
			case MotionEvent.ACTION_MOVE:
				touchMove(touchX, touchY);
				invalidate();
				break;
			case MotionEvent.ACTION_UP:
				touchUp();
				invalidate();
				break;
		}

		return true;
	}

	private void touchStart(float x, float y) {
		mPath = new Path();
		mPath.reset();
		mPath.moveTo(x, y);

		addDrawingToHistory();

		mLastPositionX = x;
		mLastPositionY = y;
	}

	private void touchMove(float x, float y) {
		float dx = Math.abs(x - mLastPositionX);
		float dy = Math.abs(y - mLastPositionY);

		if (dx >= TOUCH_TOLERANCE || dy >= TOUCH_TOLERANCE) {
			mPath.quadTo(mLastPositionX, mLastPositionY, (x + mLastPositionX) / 2, (y + mLastPositionY) / 2);
			mLastPositionX = x;
			mLastPositionY = y;
		}
	}

	private void touchUp() {
		mPath.lineTo(mLastPositionX, mLastPositionY);
	}

	private void setTraceThickness(int newThickness) {
		mDefinition.setTraceThickness(newThickness);
		mDrawPaint.setStrokeWidth(Services.Device.dipsToPixels(newThickness));
	}

	private void setTraceColor(String newColor) {
		mDefinition.setTraceColor(newColor);
		mDrawPaint.setColor(GxImageAnnotationsHelper.parseHexColor(newColor));
	}

	public void clear() {
		mShouldScreenBeCleared = true;
		mDrawHistory.clear();
		invalidate();
	}

	private void addDrawingToHistory() {
		DrawItem drawItem = new DrawItem(GxImageAnnotationsHelper.parseHexColor(mDefinition.getTraceColor()),
			Services.Device.dipsToPixels(mDefinition.getTraceThickness()), mPath);

		mDrawHistory.add(drawItem);
		if (mDrawHistory.size() == 1)
			mCurrentHistoryIndex = 0;
		else
			mCurrentHistoryIndex += 1;

		clearUndoHistory();
	}

	private void clearUndoHistory() {
		mUndoHistory.clear();
	}

	private void undoDrawing() {
		if (mDrawHistory.size() > 0) {
			DrawItem undoDrawItem = mDrawHistory.get(mCurrentHistoryIndex);
			mUndoHistory.add(undoDrawItem);
			mDrawHistory.remove(mCurrentHistoryIndex);
			mCurrentHistoryIndex -= 1;
			mShouldScreenBeCleared = true;
			invalidate();
		}
	}

	private void redoDrawing() {
		if (mUndoHistory.size() > 0) {
			DrawItem redoDrawItem = mUndoHistory.get(mUndoHistory.size() - 1);
			mDrawHistory.add(redoDrawItem);
			mUndoHistory.remove(mUndoHistory.size() - 1);
			mCurrentHistoryIndex += 1;
			invalidate();
		}
	}

	static class DrawItem {

		final int mColor;
		final int mStrokeWidth;
		final Path mPath;

		DrawItem(int color, int strokeWidth, Path path) {
			this.mColor = color;
			this.mStrokeWidth = strokeWidth;
			this.mPath = path;
		}
	}

	@Override
	public void applyEditClass(@NonNull ThemeClassDefinition themeClass) {
		mThemeClassDefinition = themeClass;
		mScaleType = themeClass.getImageScaleType();
		setImageScaleType(mScaleType);
	}

	@Override
	public void setGxValue(String value) {
		mUri = value;
		if (Strings.hasValue(mUri)) {
			//Running async to avoid NetworkOnMainThreadException
			ImageLoadingTask task = new ImageLoadingTask();
			task.execute(mUri);
		}
	}

	private class ImageLoadingTask extends AsyncTask<String, String, Bitmap> {

		@Override
		protected Bitmap doInBackground(String... strings) {
			return Services.Images.getBitmap(mContext, mUri);
		}

		@Override
		protected void onPostExecute(Bitmap bitmap) {
			super.onPostExecute(bitmap);
			createCanvasFromBitmap(bitmap);
		}
	}

	@Override
	public String getGxValue() {
		return mUri;
	}

	@Override
	public String getGxTag() {
		return mTag;
	}

	@Override
	public void setGxTag(String tag) {
		mTag = tag;
		this.setTag(tag);
	}

	@Override
	public void setValueFromIntent(Intent data) {
	}

	@Override
	public boolean isEditable() {
		return true;
	}

	@Override
	public IGxEdit getViewControl() {
		return this;
	}

	@Override
	public IGxEdit getEditControl() {
		return this;
	}

	@Override
	public ThemeClassDefinition getThemeClass() {
		return mThemeClassDefinition;
	}
}
