package com.artech.android.layout;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

import android.content.Context;
import android.graphics.Typeface;
import android.os.Build;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.LinearLayout.LayoutParams;

import com.artech.R;
import com.artech.android.layout.SectionsLayoutVisitor.LayoutSection;
import com.artech.base.metadata.DataTypeName;
import com.artech.base.metadata.DetailDefinition;
import com.artech.base.metadata.IDataViewDefinition;
import com.artech.base.metadata.Properties;
import com.artech.base.metadata.RelationDefinition;
import com.artech.base.metadata.enums.ControlTypes;
import com.artech.base.metadata.enums.LayoutItemsTypes;
import com.artech.base.metadata.enums.LayoutModes;
import com.artech.base.metadata.layout.AllContentDefinition;
import com.artech.base.metadata.layout.CellDefinition;
import com.artech.base.metadata.layout.ComponentDefinition;
import com.artech.base.metadata.layout.ContentDefinition;
import com.artech.base.metadata.layout.GridDefinition;
import com.artech.base.metadata.layout.ILayoutContainer;
import com.artech.base.metadata.layout.LayoutActionDefinition;
import com.artech.base.metadata.layout.LayoutDefinition;
import com.artech.base.metadata.layout.LayoutItemDefinition;
import com.artech.base.metadata.layout.TabControlDefinition;
import com.artech.base.metadata.layout.TableDefinition;
import com.artech.base.metadata.loader.MetadataLoader;
import com.artech.base.metadata.rules.PromptRuleDefinition;
import com.artech.base.metadata.theme.ThemeClassDefinition;
import com.artech.base.services.Services;
import com.artech.base.utils.Strings;
import com.artech.common.LayoutHelper;
import com.artech.common.PhoneHelper;
import com.artech.common.PromptHelper;
import com.artech.common.TrnHelper;
import com.artech.controls.DataBoundControl;
import com.artech.controls.DynamicSpinnerControl;
import com.artech.controls.GxAudioView;
import com.artech.controls.GxButton;
import com.artech.controls.GxEditText;
import com.artech.controls.GxImageViewData;
import com.artech.controls.GxImageViewStatic;
import com.artech.controls.GxSectionLink;
import com.artech.controls.GxTableLayout;
import com.artech.controls.GxTextBlockTextView;
import com.artech.controls.GxTextInputLayout;
import com.artech.controls.GxTextView;
import com.artech.controls.GxWebView;
import com.artech.controls.IGxEdit;
import com.artech.controls.IGxThemeable;
import com.artech.controls.IHandleSemanticDomain;
import com.artech.controls.ads.Ads;
import com.artech.controls.ads.IAdsViewController;
import com.artech.controls.tabs.GxTabControl;
import com.artech.controls.video.GxVideoView;
import com.artech.fragments.ComponentContainer;
import com.artech.fragments.GridContainer;
import com.artech.resources.StandardImages;
import com.artech.ui.Coordinator;
import com.artech.usercontrols.TableLayoutFactory;
import com.artech.usercontrols.UcFactory;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.core.content.ContextCompat;

public class LayoutControlFactory {
	/**
	 * Creates the root AndroidView
	 */
	public static IGxRootLayout createRootView(Context context, LayoutDefinition layoutDefinition, Coordinator coordinator) {
		IGxRootLayout layout;
		// if has not layout, return an empty root to show the no layout message
		if (layoutDefinition == null) {
			return new GxRootLayout(context, null);
		}
		if (layoutDefinition.getTable().isFlex() && Services.Application.getTableLayoutFactory().hasControl(TableLayoutFactory.ROOTFLEX)) {
			layout = (IGxRootLayout) Services.Application.getTableLayoutFactory().createControl(TableLayoutFactory.ROOTFLEX, new Object[]{context, layoutDefinition, coordinator});
		} else {
			layout = new GxRootLayout(context, layoutDefinition, coordinator);
		}
		return layout;
	}

	/**
	 * Creates an Android view for a layout item definition.
	 */
	@NonNull
	public static View createView(Context context, Coordinator coordinator, LayoutItemDefinition item, short layoutMode, short trnMode) {
		// Create the view.
		View view = createViewInternal(context, coordinator, item, layoutMode, trnMode);

		// Set the control's theme class
		setThemeClass(item, view);

		// Set special tags for later lookup.
		setTags(view, item, true);

		// Set properties that are common to all views.
		setGenericProperties(view, item);

		// Set event handlers.
		setImplicitTapHandlers(view, item, layoutMode, trnMode);

		return view;
	}

	private static void setThemeClass(LayoutItemDefinition item, View view) {
		ThemeClassDefinition themeClass = item.getThemeClass();

		if (view instanceof IGxThemeable && themeClass != null) {
			GxTheme.applyStyle((IGxThemeable) view, themeClass);
		}
	}

	public static void setTags(View view, LayoutItemDefinition definition, boolean isGenexusControl) {
		view.setTag(LayoutTag.CONTROL_DEFINITION, definition);
		if (isGenexusControl) {
			view.setTag(LayoutTag.CONTROL_GENEXUS, true);
		}

		// Consider special cases
		if (view instanceof DataBoundControl) {
			// For DataBoundControls, its Data Item control knows its definition
			DataBoundControl dataBoundControl = (DataBoundControl) view;
			setTags(dataBoundControl.getAttribute(), definition, false);
		} else if (view instanceof GridContainer) {
			// For GridContainer, so its Grid control knows its definition
			GridContainer gridContainer = (GridContainer) view;
			setTags(gridContainer.getGridView(), definition, false);
		}
	}

	private static void setGenericProperties(View view, LayoutItemDefinition definition) {
		if (!(view instanceof DataBoundControl))
			view.setTag(definition.getName()); // Data controls have a special tag.

		view.setVisibility(definition.isVisible() ? View.VISIBLE : View.INVISIBLE);

		// Enabled is only set when FALSE. Otherwise some controls (such as Checkbox) become
		// editable when enabled, disregarding the "ReadOnly" property.
		boolean enabled = definition.isEnabled();
		if (!enabled)
			view.setEnabled(definition.isEnabled());
	}

	private static void setImplicitTapHandlers(View view, LayoutItemDefinition definition, short layoutMode, short trnMode) {
		PromptRuleDefinition promptInfo = definition.getPrompt(layoutMode, trnMode);
		if (promptInfo != null)
			PromptHelper.setAssociatedPrompt(view, promptInfo);
	}

	// create view for layout in View and List forms absolute layouts.
	@NonNull
	private static View createViewInternal(Context context, Coordinator coordinator, LayoutItemDefinition item, short layoutMode, short trnMode) {
		String itemTypeName = item.getType();

		View view;

		if (item instanceof LayoutActionDefinition) {
			LayoutActionDefinition layoutAction = (LayoutActionDefinition) item;
			view = new GxButton(context, coordinator, layoutAction);

		} else if (itemTypeName.equalsIgnoreCase(LayoutItemsTypes.DATA)) {
			IGxEdit data = (IGxEdit) createDataBoundView(context, coordinator, item, layoutMode, trnMode);
			data.setGxTag(item.getDataId());
			view = (View) data;

		} else if (itemTypeName.equalsIgnoreCase(LayoutItemsTypes.GROUP)) {
			ILayoutContainer itemContainer = (ILayoutContainer) item;
			view = new GxLayout(context, itemContainer.getContent(), coordinator);

		} else if (itemTypeName.equalsIgnoreCase(LayoutItemsTypes.IMAGE)) {
			String imageName = MetadataLoader.getObjectName(item.optStringProperty("@image"));
			GxImageViewStatic image = new GxImageViewStatic(context, coordinator, item);
			Services.Images.showStaticImage(context, image, imageName);
			view = image;
		} else if (itemTypeName.equalsIgnoreCase(LayoutItemsTypes.USER_CONTROL)) {
			view = (View) UcFactory.createUserControl(context, coordinator, item);

		} else if (itemTypeName.equalsIgnoreCase(LayoutItemsTypes.TAB)) {
			GxTabControl tabControl = new GxTabControl(context, coordinator, (TabControlDefinition) item);
			LayoutParams lp = new LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.MATCH_PARENT, 1);
			tabControl.setLayoutParams(lp);
			view = tabControl;

		} else if (itemTypeName.equalsIgnoreCase(LayoutItemsTypes.TABLE)) {
			//Temporary , table for ads
			if (isAdsTable(item)) {
				GxTableLayout table = new GxTableLayout(context);
				table.setGravity(item.getCellGravity());

				if (Ads.getDefaultProvider() != null) {
					IAdsViewController adsViewController = Ads.getDefaultProvider().createViewController(context, item);
					View adView = adsViewController.createView();
					if (adView != null) {
						adView.setVisibility(item.isVisible() ? View.VISIBLE : View.INVISIBLE);
						table.addView(adView, new LinearLayout.LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.MATCH_PARENT));
					}
				}
				view = table;
			} else if (((TableDefinition) item).isFlex() && Services.Application.getTableLayoutFactory().hasControl(TableLayoutFactory.FLEX)) {
				view = (View) Services.Application.getTableLayoutFactory().createControl(TableLayoutFactory.FLEX, new Object[]{context, item, coordinator});
			} else {
				// Standard table.
				view = new GxLayout(context, (TableDefinition) item, coordinator);
			}

		} else if (itemTypeName.equalsIgnoreCase(LayoutItemsTypes.TEXT_BLOCK)) {
			GxTextBlockTextView textBlock = new GxTextBlockTextView(context, item);
			textBlock.setCaption(item.getCaption());
			textBlock.setGravity(item.getCellGravity());
			if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O)
				textBlock.setJustificationMode(item.getJustificationMode());
			view = textBlock;

		} else if (itemTypeName.equalsIgnoreCase(LayoutItemsTypes.GRID)) {
			// Create wrapper for a grid control.
			view = new GridContainer(context, coordinator, (GridDefinition) item);

		} else if (itemTypeName.equalsIgnoreCase(LayoutItemsTypes.COMPONENT)) {
			view = new ComponentContainer(context, (ComponentDefinition) item);

		} else if (itemTypeName.equalsIgnoreCase(LayoutItemsTypes.ONE_CONTENT)) {
			ContentDefinition content = (ContentDefinition) item;
			if (content.getDisplayType().equalsIgnoreCase(Properties.ContentDisplayType.LINK_CONTENT)) {
				LayoutInflater inflater = (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
				GxSectionLink sectionLink = (GxSectionLink) inflater.inflate(R.layout.sectionlinkcontrol, null);
				sectionLink.setDefinition(content);
				view = sectionLink;
			} else {
				view = new ComponentContainer(context, content);
			}

		} else if (itemTypeName.equalsIgnoreCase(LayoutItemsTypes.ALL_CONTENT)) {
			// TODO: Create tab control with inline section inside it.
			if (item instanceof AllContentDefinition) {
				AllContentDefinition allContent = (AllContentDefinition) item;
				allContent.setTrnMode(trnMode);
			}

			//Create tab control here add create it definition.
			IDataViewDefinition dataView = item.getLayout().getParent();
			if (dataView instanceof DetailDefinition) {
				List<LayoutSection> tabsSections = LayoutHelper.getDetailSections((DetailDefinition) dataView, trnMode);

				if (tabsSections.size() == 1) {
					// Return this section as content
					ContentDefinition itemDef = LayoutHelper.getContentDefinition(item.getLayout(), item.getParent(), tabsSections);
					view = new ComponentContainer(context, itemDef);
				} else {
					// return a tab control with a section in each tab page
					TabControlDefinition tabDefinition = LayoutHelper.getTabControlDefinition(item.getLayout(), item.getParent(), tabsSections);
					GxTabControl tabControl = new GxTabControl(context, coordinator, tabDefinition);

					//set tab content size
					CellDefinition parentCell = (CellDefinition) item.getParent();
					tabDefinition.calculateBounds(parentCell.getAbsoluteWidth(), parentCell.getAbsoluteHeight());

					view = tabControl;
				}
			} else {
				throw new IllegalArgumentException("DataView is not an instance of DetailDefinition.");
			}

		} else {
			throw new IllegalArgumentException("Unknown layout item type: " + itemTypeName);
		}

		return view;
	}

	@NonNull
	private static View createDataBoundView(Context context, Coordinator coordinator, LayoutItemDefinition item, short layoutMode, short trnMode) {
		if (item.getDataItem() == null)
			return new GxTextView(context, item); // Layout data item without data item?

		// Calculate the read only using the layoutMode and att/var type for "Auto"
		boolean readonly = item.getReadOnly(layoutMode, trnMode);

		IGxEdit attrView = readonly ?
				createAttViewControl(context, coordinator, item, layoutMode)
				: createAttEditControl(context, coordinator, item);

		// Add domain action if exists
		ImageView domainActionView = null;
		if (readonly && (layoutMode != LayoutModes.LIST || item.getAutoLink())) { //in list only with auto link
			domainActionView = createDomainActionIconView(context, item, attrView);
		}

		// Add FK action if exists except for the "Dynamic Combo Box" control.
		ImageView promptIconView = null;
		if (item.hasPrompt(layoutMode, trnMode) && !(attrView instanceof DynamicSpinnerControl)) {
			promptIconView = new ImageView(context);
			StandardImages.setPromptImage(promptIconView);
		}

		ImageView actionImageView;
		if (domainActionView != null) {
			actionImageView = domainActionView;
		} else if (promptIconView != null) {
			actionImageView = promptIconView;
		} else {
			actionImageView = null;
		}

		GxTextView labelView = new GxTextView(context, (LayoutItemDefinition) null);

		return new DataBoundControl(context, coordinator, item, labelView, (View) attrView, actionImageView);
	}

	@NonNull
	private static IGxEdit createAttViewControl(Context context, Coordinator coordinator, LayoutItemDefinition item, short layoutMode) {
		// Don't use floating label for ready only attributes
		if (Properties.LabelPositionType.FLOATING.equalsIgnoreCase(item.getLabelPosition())) {
			item.setLabelPosition(Properties.LabelPositionType.TOP);
		}

		//Try to get user Control
		IGxEdit attView;
		IGxEdit userControlView = TrnHelper.createDataUserControl(context, coordinator, item);
		if (userControlView != null) {
			attView = userControlView.getViewControl();

			if (attView != userControlView && attView instanceof GxTextView)
				((GxTextView) attView).setGravity(item.getCellGravity());

			// TODO: Remove this; should be based on properties.
			if (layoutMode == LayoutModes.LIST && attView != null
				&& attView.getClass().getSimpleName().equals("RatingControl")) {
				try {
					Method method = attView.getClass().getDeclaredMethod("prepareForList");
					method.invoke(attView);
				} catch (NoSuchMethodException e) {
				} catch (IllegalAccessException e) {
				} catch (InvocationTargetException e) {
				}
			}
		} else {
			switch (item.getControlType()) {
				case ControlTypes.PHOTO_EDITOR:
					GxImageViewData gxImage = new GxImageViewData(context, item);
					LayoutParams lp = new LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.MATCH_PARENT, 1);
					gxImage.setLayoutParams(lp);
					attView = gxImage;
					break;
				case ControlTypes.WEB_VIEW:
					// Component / Html
					String domainDataType = Strings.EMPTY;
					if (item.getDataTypeName() != null)
						domainDataType = item.getDataTypeName().getDataType();

					boolean isHtml = domainDataType.equalsIgnoreCase(DataTypeName.HTML);

					GxWebView webView = new GxWebView(context, coordinator, item);
					webView.setMode(isHtml);

					if (layoutMode == LayoutModes.LIST) {
						// Set up the WebView so that the ListView's performItemClick() is fired.
						// See http://stackoverflow.com/questions/4973228/android-webview-inside-listview-onclick-event-issues
						webView.setEnabled(false);
						webView.setClickable(false);
						webView.setLongClickable(false);
						webView.setFocusable(false);
						webView.setFocusableInTouchMode(false);
					}

					if (isHtml)
						webView.setBackgroundColor(ContextCompat.getColor(context, android.R.color.transparent));

					attView = webView;

					break;
				case ControlTypes.VIDEO_VIEW:
					attView = new GxVideoView(context, item);
					break;
				case ControlTypes.AUDIO_VIEW: {
					GxAudioView textView = new GxAudioView(context, item);
					textView.setGravity(item.getCellGravity());
					attView = textView;
					break;
				}
				default: {
					GxTextView textView = new GxTextView(context, coordinator, item);
					textView.setGravity(item.getCellGravity());
					if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O)
						textView.setJustificationMode(item.getJustificationMode());
					attView = textView;
					break;
				}
			}
		}

		return attView;
	}

	@NonNull
	private static IGxEdit createAttEditControl(Context context, Coordinator coordinator, LayoutItemDefinition item) {
		ArrayList<IGxEdit> editables = new ArrayList<>();
		View editField = TrnHelper.createEditField(context, coordinator, item, editables);

		IGxEdit result;

		if (editField != null && editField instanceof IGxEdit) {
			IGxEdit edit = (IGxEdit) editField;
			result = edit.getEditControl();
		} else {
			// Default TextView
			GxTextView textView = new GxTextView(context, item);
			textView.setGravity(item.getCellGravity());
			if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O)
				textView.setJustificationMode(item.getJustificationMode());
			result = textView;
		}

		// Don't use floating label for non EditText controls
		if (Properties.LabelPositionType.FLOATING.equalsIgnoreCase(item.getLabelPosition()) && !(result instanceof EditText)) {
			item.setLabelPosition(Properties.LabelPositionType.TOP);
		} else {
			boolean wrapWithInput = false;
			boolean showPasswordHint = false;
			if (result instanceof GxEditText) {
				GxEditText view = (GxEditText) result;
				if (view.isPassword() && view.showPasswordHint()) {
					wrapWithInput = true;
					showPasswordHint = true;
				}

				if (Properties.LabelPositionType.FLOATING.equalsIgnoreCase(item.getLabelPosition()) || wrapWithInput) {
					GxTextInputLayout newAttrView = new GxTextInputLayout(context, view);
					newAttrView.addView(view, new LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.MATCH_PARENT));
					newAttrView.setPasswordVisibilityToggleEnabled(showPasswordHint);
					newAttrView.setHintEnabled(Properties.LabelPositionType.FLOATING.equalsIgnoreCase(item.getLabelPosition()));
					if (showPasswordHint) {
						// set typeface for input password as default. this way honor the theme class.
						view.setTypeface(Typeface.DEFAULT);
					}
					result = newAttrView;
				}
			}
		}

		return result;
	}

	@Nullable
	private static ImageView createDomainActionIconView(Context context, LayoutItemDefinition item, IGxEdit attView) {
		ImageView domainActionIconView = null;

		DataTypeName domainDefinition = item.getDataTypeName();
		RelationDefinition relDef = item.getFK();

		if (relDef != null && item.getAutoLink()) {
			domainActionIconView = new ImageView(context);
			domainActionIconView.setPadding(0, 0, Services.Device.dipsToPixels(8), 0);
			StandardImages.setLinkImage(domainActionIconView);
		} else if (domainDefinition != null && domainDefinition.getActions().size() > 0) {
			if (!(attView instanceof IHandleSemanticDomain)) {
				for (String domainAction : domainDefinition.getActions()) {
					// Because of the way it's shown and handled, we can only add one domain action
					// Pick the first one that the device supports.
					if (PhoneHelper.isDomainActionSupported(domainAction)) {
						domainActionIconView = new ImageView(context);
						StandardImages.setActionImage(domainActionIconView, domainAction);
						break;
					}
				}
			}
		}

		return domainActionIconView;
	}

	public static boolean isAdsTable(LayoutItemDefinition item) {
		//Temp , table for ads
		return item.getType().equalsIgnoreCase(LayoutItemsTypes.TABLE)
				&& item.getName().equalsIgnoreCase("GoogleAdsControl");
	}
}
