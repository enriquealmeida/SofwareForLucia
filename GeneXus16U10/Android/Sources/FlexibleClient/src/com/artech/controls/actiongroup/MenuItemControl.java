package com.artech.controls.actiongroup;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ObjectAnimator;
import android.animation.ValueAnimator;
import android.content.Context;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.view.MenuItem;

import com.artech.base.metadata.expressions.Expression.Value;
import com.artech.base.metadata.layout.ActionGroupItemDefinition;
import com.artech.base.metadata.theme.ThemeClassDefinition;
import com.artech.base.services.Services;
import com.artech.utils.BadgeDrawable;

public class MenuItemControl extends ActionGroupBaseItemControl<MenuItemControl>
{
	private MenuItem mMenuItem;
	private final int mMenuId;
	private OnRequestLayoutListener mOnRequestLayoutListener;

	public MenuItemControl(ActionGroupItemDefinition definition, int menuId)
	{
		super(definition);
		mMenuId = menuId;
	}

	public int getMenuId()
	{
		return mMenuId;
	}

	public void setMenuItem(MenuItem menuItem)
	{
		mMenuItem = menuItem;
	}

	public interface OnRequestLayoutListener
	{
		void onRequestLayout(MenuItemControl item);
	}

	public void setOnRequestLayoutListener(OnRequestLayoutListener listener)
	{
		mOnRequestLayoutListener = listener;
	}

	@Override
	public void requestLayout()
	{
		super.requestLayout();
		if (mOnRequestLayoutListener != null)
			mOnRequestLayoutListener.onRequestLayout(this);
	}

	@Override
	public void setEnabled(boolean enabled)
	{
		super.setEnabled(enabled);
		if (mMenuItem != null)
			mMenuItem.setEnabled(enabled);
	}

	@Override
	public void setVisible(boolean visible)
	{
		super.setVisible(visible);
		if (mMenuItem != null)
			mMenuItem.setVisible(visible);
	}

	@Override
	public void setCaption(String caption)
	{
		super.setCaption(caption);
		if (mMenuItem != null)
			mMenuItem.setTitle(caption);
	}

	private static final String PROPERTY_BADGETEXT = "BadgeText";
	private static final String BADGE_ANIMATION_PROPERTY = "zoom";
	private static final float BADGE_ANIMATION_ZOOM = 1.5f;
	private static final float BADGE_ANIMATION_NO_ZOOM = 1f;
	private String mBadgeText;
	private String mOldBadgeText;
	private ThemeClassDefinition mBadgeThemeClass;

	public void setIcon(Context context, MenuItem menuItem, Drawable icon) {

		if (mBadgeText != null && mBadgeText.trim().length() > 0) {
			BadgeDrawable badge = new BadgeDrawable(context);
			badge.setText(mBadgeText);
			badge.setThemeClass(mBadgeThemeClass);

			if (mBadgeThemeClass != null && mBadgeThemeClass.isAnimated()) {
				ValueAnimator zoomOut = ObjectAnimator.ofFloat(badge, BADGE_ANIMATION_PROPERTY, BADGE_ANIMATION_ZOOM, BADGE_ANIMATION_NO_ZOOM);
				zoomOut.setDuration(mBadgeThemeClass.getAnimationDuration());
				zoomOut.addUpdateListener(updatedAnimation -> badge.invalidateSelf());
				zoomOut.start();
			}

			LayerDrawable iconDraw = new LayerDrawable(new Drawable[] { icon, badge });
			menuItem.setIcon(iconDraw);
		}
		else if (mOldBadgeText != null && mOldBadgeText.trim().length() > 0 && mBadgeThemeClass != null && mBadgeThemeClass.isAnimated()) {
			BadgeDrawable badge = new BadgeDrawable(context);
			badge.setText(mOldBadgeText);
			badge.setThemeClass(mBadgeThemeClass);

			ValueAnimator zoomOut = ObjectAnimator.ofFloat(badge, BADGE_ANIMATION_PROPERTY, BADGE_ANIMATION_NO_ZOOM, 0f);
			zoomOut.setDuration(mBadgeThemeClass.getAnimationDuration());
			zoomOut.addUpdateListener(updatedAnimation -> badge.invalidateSelf());
			zoomOut.addListener(new AnimatorListenerAdapter() {
				@Override
				public void onAnimationEnd(Animator animation) {
					badge.setVisible(false, false);
				}
			});
			zoomOut.start();

			LayerDrawable iconDraw = new LayerDrawable(new Drawable[] { icon, badge });
			menuItem.setIcon(iconDraw);
		}
		else {
			menuItem.setIcon(icon);
		}
		mOldBadgeText = mBadgeText;
	}

	@Override
	public void setPropertyValue(String name, Value value) {
		if (name.equalsIgnoreCase(PROPERTY_BADGETEXT)) {
			if (value == null)
				mBadgeText = null;
			else
				mBadgeText = value.coerceToString();
		}
		else {
			super.setPropertyValue(name, value);
		}
	}

	@Override
	public Value getPropertyValue(String name) {
		if (name.equalsIgnoreCase(PROPERTY_BADGETEXT)) {
			return Value.newString(mBadgeText);
		}
		return super.getPropertyValue(name);
	}

	@Override
	public void setThemeClass(ThemeClassDefinition themeClass) {
		super.setThemeClass(themeClass);
		if (themeClass == null)
			mBadgeThemeClass = null;
		else
			mBadgeThemeClass = Services.Themes.getThemeClass(themeClass.getName() + "_Badge");
	}
}
