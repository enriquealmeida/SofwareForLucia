package com.genexus.coreusercontrols.matrixgrid;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.artech.base.metadata.theme.ThemeClassDefinition;
import com.artech.base.utils.Strings;

public class MatrixGridThemeClass
{
	private ThemeClassDefinition mBaseClass;

	public MatrixGridThemeClass(ThemeClassDefinition cls)
	{
		mBaseClass = cls;
	}
	
	public ThemeClassDefinition getCellClass()
	{
		return getReferencedClass("CellTableClassReference");
	}

	public ThemeClassDefinition getXAxisLabelClass()
	{
		return getReferencedClass("XAxisLabelClassReference");
	}

	public ThemeClassDefinition getYAxisTitleLabelClass()
	{
		return getReferencedClass("YAxisTitleLabelClassReference");
	}

	public ThemeClassDefinition getYAxisDescriptionLabelClass()
	{
		return getReferencedClass("YAxisDescriptionLabelClassReference");
	}

	public ThemeClassDefinition getYAxisTableClass() {

		return getReferencedClass("YAxisTableClassReference");
	}

	public ThemeClassDefinition getRowTableEvenClass()
	{
		return getReferencedClass("RowTableClassReferenceEven");
	}

	public ThemeClassDefinition getRowTableOddClass()
	{
		return getReferencedClass("RowTableClassReferenceOdd");
	}

	public ThemeClassDefinition getXAxisTableClass()
	{
		return getReferencedClass("XAxisTableClassReference");
	}

	public ThemeClassDefinition getSelectedRowClass() {

		return getReferencedClass("SelectedRowTableClassReference");
	}

	public ThemeClassDefinition getSelectedCellClass() {

		return getReferencedClass("SelectedCellTableClassReference");
	}

	@Nullable
	private ThemeClassDefinition getReferencedClass(@NonNull String referenceName)
	{
		if (mBaseClass != null)
		{
			String className = mBaseClass.optStringProperty(referenceName);
			if (Strings.hasValue(className))
				return mBaseClass.getTheme().getClass(className);
		}

		return null;
	}
}
