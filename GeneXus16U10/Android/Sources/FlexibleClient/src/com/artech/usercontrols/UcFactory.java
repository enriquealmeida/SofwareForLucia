
package com.artech.usercontrols;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;

import android.content.Context;
import androidx.annotation.NonNull;

import com.artech.base.metadata.layout.ControlInfo;
import com.artech.base.metadata.layout.GridDefinition;
import com.artech.base.metadata.layout.LayoutItemDefinition;
import com.artech.base.utils.NameMap;
import com.artech.base.utils.ReflectionHelper;
import com.artech.controls.GxListView;
import com.artech.controls.IGridView;
import com.artech.ui.Coordinator;
import com.artech.utils.Cast;

public class UcFactory {
	private static final Class<?>[] CONSTRUCTOR_SIGNATURE_1 = new Class[] {Context.class, Coordinator.class, LayoutItemDefinition.class};
	private static final Class<?>[] CONSTRUCTOR_SIGNATURE_2 = new Class[] {Context.class, LayoutItemDefinition.class};
	private static final Class<?>[] CONSTRUCTOR_SIGNATURE_3 = new Class[] {Context.class, Coordinator.class, GridDefinition.class};

	private static final NameMap<UserControlDefinition> DEFINITIONS = new NameMap<>();
	private static final HashMap<Class<?>, Constructor<?>> CONSTRUCTORS = new HashMap<>();

	public static void addControl(UserControlDefinition def) {
		DEFINITIONS.put(def.Name, def);
	}

	public static UserControlDefinition getControlDefinition(String controlName) {
		return DEFINITIONS.get(controlName);
	}

	@NonNull
	public static Object createUserControl(Class<?> clazz, Context context, Coordinator coordinator, LayoutItemDefinition layoutItemDefinition) {
		try {
			Constructor<?> constructor = CONSTRUCTORS.get(clazz);

			// We accept alternate signatures, try to get any of them.
			if (constructor == null)
				constructor = ReflectionHelper.getConstructor(clazz, CONSTRUCTOR_SIGNATURE_1);

			if (constructor == null)
				constructor = ReflectionHelper.getConstructor(clazz, CONSTRUCTOR_SIGNATURE_2);

			if (constructor == null && layoutItemDefinition instanceof GridDefinition)
				constructor = ReflectionHelper.getConstructor(clazz, CONSTRUCTOR_SIGNATURE_3);

			if (constructor == null) {
				throw new IllegalArgumentException(String.format("User control class '%s' does not have an appropriate constructor.", clazz.getName()));
			}

			CONSTRUCTORS.put(clazz, constructor);

			// We accept two constructors; one receiving Coordinator, and one without. Build arguments accordingly.
			Object[] constructorArgs = (constructor.getParameterTypes().length == 3) ?
					new Object[] {context, coordinator, layoutItemDefinition}
					: new Object[] {context, layoutItemDefinition};

			return constructor.newInstance(constructorArgs);
		} catch (IllegalAccessException | InstantiationException | InvocationTargetException ex) {
			throw new IllegalArgumentException("Exception raised while creating UserControl.", ex);
		}
	}

	@NonNull
	public static IGxUserControl createUserControl(Context context, Coordinator coordinator, LayoutItemDefinition layoutItemDefinition) {
		ControlInfo controlInfo = layoutItemDefinition.getControlInfo();
		String controlName = controlInfo.getControl();

		UserControlDefinition ucDefinition = DEFINITIONS.get(controlName);
		if (ucDefinition == null) {
			throw new IllegalArgumentException(String.format("User control with name %s is not registered.", controlName));
		}

		IGxUserControl uc = ucDefinition.getFactory().create(context, coordinator, layoutItemDefinition);
		if (uc == null) {
			throw new IllegalArgumentException(String.format("failed to create uc type: %s", layoutItemDefinition.getControlType()));
		}

		return uc;
	}

	@NonNull
	public static IGridView createGrid(Context context, Coordinator coordinator, GridDefinition item) {
		if (item.getControlInfo() != null) {
			IGxUserControl gridControl = createUserControl(context, coordinator, item);
			if (Cast.as(IGridView.class, gridControl) != null) {
				return (IGridView) gridControl;
			}
		}

		return new GxListView(context, coordinator, item);
	}
}
