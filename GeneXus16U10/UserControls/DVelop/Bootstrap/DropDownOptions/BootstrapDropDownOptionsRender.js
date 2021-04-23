function BootstrapDropDownOptions() {

	this.DropDownOptionsTitleSettingsIcons_IsFI = true;

	this.SetDropDownOptionsData = function (data) {

		this.DropDownOptionsTitleSettingsIcons_IsFI = (this.DropDownOptionsTitleSettingsIcons != null && this.DropDownOptionsTitleSettingsIcons["def"] != null && this.DropDownOptionsTitleSettingsIcons["def"].length > 0);
		if (this.DropDownOptionsType == "GridTitleSettings") {
			this.FilteredText_get = this.FilteredText_set;
			this.FilteredText = this.FilteredText_get;
			this.FilteredTextTo_get = this.FilteredTextTo_set;
			this.FilteredTextTo = this.FilteredTextTo_get;
			this.SelectedValue_get = this.SelectedValue_set;
			this.SelectedValue = this.SelectedValue_get;
			this.SelectedText_get = this.SelectedText_set;
			this.SelectedText = this.SelectedText_get;
			this.UseAsGridTitleSetting = true;
			if (data != undefined) {
				this.IncludeSortASC = WWP_FixBooleanProperty(this.IncludeSortASC);
				this.IncludeSortDSC = WWP_FixBooleanProperty(this.IncludeSortDSC);
				this.AllowGroup = WWP_FixBooleanProperty(this.AllowGroup);
				var dataEmpty = (data.length == 0);
				if (this.AllowGroup && (dataEmpty || !this.DataHasEventKey(data, "<#Group#>"))) {
					var dataObj = {};
					dataObj.EventKey = "<#Group#>";
					dataObj.FontIcon = (this.DropDownOptionsTitleSettingsIcons_IsFI ? this.DropDownOptionsTitleSettingsIcons["osasc"] : '');
					dataObj.Icon = (this.DropDownOptionsTitleSettingsIcons_IsFI ? '' : gx.util.resolveUrl(this.DropDownOptionsTitleSettingsIcons["OptionSortASC"]));
					dataObj.Icon_GXI = '';
					dataObj.IsDivider = false;
					dataObj.JSonclickEvent = '';
					dataObj.Link = '';
					dataObj.Title = gx.getMessage(this.AllowGroupText);
					dataObj.Tooltip = '';
					data.push(dataObj);
				}
				if (this.IncludeSortASC && (dataEmpty || !this.DataHasEventKey(data, "<#OrderASC#>"))) {
					var dataObj = {};
					dataObj.EventKey = "<#OrderASC#>";
					dataObj.FontIcon = (this.DropDownOptionsTitleSettingsIcons_IsFI ? this.DropDownOptionsTitleSettingsIcons["osasc"] : '');
					dataObj.Icon = (this.DropDownOptionsTitleSettingsIcons_IsFI ? '' : gx.util.resolveUrl(this.DropDownOptionsTitleSettingsIcons["OptionSortASC"]));
					dataObj.Icon_GXI = '';
					dataObj.IsDivider = false;
					dataObj.JSonclickEvent = '';
					dataObj.Link = '';
					dataObj.Title = gx.getMessage(this.SortASC);
					dataObj.Tooltip = '';
					data.push(dataObj);
				}
				if (this.IncludeSortDSC && (dataEmpty || !this.DataHasEventKey(data, "<#OrderDSC#>"))) {
					var dataObj = {};
					dataObj.EventKey = "<#OrderDSC#>";
					dataObj.FontIcon = (this.DropDownOptionsTitleSettingsIcons_IsFI ? this.DropDownOptionsTitleSettingsIcons["osdsc"] : '');
					dataObj.Icon = (this.DropDownOptionsTitleSettingsIcons_IsFI ? '' : gx.util.resolveUrl(this.DropDownOptionsTitleSettingsIcons["OptionSortDSC"]));
					dataObj.Icon_GXI = '';
					dataObj.IsDivider = false;
					dataObj.JSonclickEvent = '';
					dataObj.Link = '';
					dataObj.Title = gx.getMessage(this.SortDSC);
					dataObj.Tooltip = '';
					data.push(dataObj);
				}
				if ((this.IncludeFilter || this.IncludeDataList || this.FixedFilters != '') && (dataEmpty || !this.DataHasEventKey(data, "<#FilterOptions#>"))) {
					if (this.IncludeSortASC || this.IncludeSortDSC) {
						var dataObj = {};
						dataObj.EventKey = "";
						dataObj.Icon = "";
						dataObj.Icon_GXI = '';
						dataObj.IsDivider = true;
						dataObj.JSonclickEvent = '';
						dataObj.Link = '';
						dataObj.Title = '';
						dataObj.Tooltip = '';
						data.push(dataObj);
					}
					var dataObj = {};
					dataObj.EventKey = "<#FilterOptions#>";
					dataObj.Icon = "";
					dataObj.Icon_GXI = '';
					dataObj.IsDivider = false;
					dataObj.JSonclickEvent = '';
					dataObj.Link = '';
					dataObj.Title = gx.getMessage(this.LoadingData);
					dataObj.Tooltip = '';
					data.push(dataObj);
				}
			}
		} else {
			this.UseAsGridTitleSetting = false;
			if (this.DropDownOptionsType == "ExtendedComboBox") {
				this.SelectedValue_get = this.SelectedValue_set;
				this.SelectedValue = this.SelectedValue_get;
				if (this.DataListProc == null || this.DataListProc == '') {
					this.SelectedText_get = '';
					this.SelectedText = '';
				} else {
					this.SelectedText_get = this.SelectedText_set;
					this.SelectedText = this.SelectedText_get;
				}
				this.DDOInternalName = this.ContainerName + "_btnGroupDrop";
			}
		}
		var dataUndefined = true;
		if (data != undefined) {
			if (data.length != null && (data.length > 0 || this.updating) || this.DropDownOptionsType == "ExtendedComboBox") {
				delete this.updating;
				if (this.DropDownOptionsData == null
					|| this.my_dropDownOptions == null
					|| this.DropDownOptionsData.length != data.length
					|| $("#" + this.my_dropDownOptions.containerToDrawName).find('.Errorbtn').length == 0
					|| JSON.stringify(this.DropDownOptionsData, null, 2) != JSON.stringify(data, null, 2)) {
					this.DropDownOptionsData = data;
					dataUndefined = false;
				}
			} else if (this.DropDownOptionsType == "GridColumnsSelector"
						&& (data.VisibleColumns != undefined ? data.VisibleColumns.length : 0) + (data.InvisibleColumns != undefined ? data.InvisibleColumns.length : 0) + (data.Columns != undefined ? data.Columns.length : 0) > 0) {
				this.DropDownOptionsData = data;
				this.DropDownOptionsData_VisibleColumns = this.DropDownOptionsData.VisibleColumns;
				this.DropDownOptionsData_InvisibleColumns = this.DropDownOptionsData.InvisibleColumns;
				this.DropDownOptionsData_Columns = this.DropDownOptionsData.Columns;
				if (this.DropDownOptionsData_VisibleColumns != undefined || this.DropDownOptionsData_VisibleColumns != undefined) {
					if (this.DropDownOptionsData_VisibleColumns == undefined) {
						this.DropDownOptionsData_VisibleColumns = [];
					}
					if (this.DropDownOptionsData_InvisibleColumns == undefined) {
						this.DropDownOptionsData_InvisibleColumns = [];
					}
				}
				dataUndefined = false;
			}
		}
		if (this.my_dropDownOptions != undefined && !dataUndefined) {
			this.my_dropDownOptions.render();
		}
	}

	this.onPopupClose = function () {
		if (this.isNew) {
			this.isNew = false;
			this.my_dropDownOptions.SetSelectedValue('<#POPUP_CLOSED#>');
			this.my_dropDownOptions.SetSelectedText('');
			this.my_dropDownOptions.updatedExtendedComboCaption(null);
			if (!this.AllowMultipleSelection) {
				var attFound = false;
				var attName = null;
				var wcName = '';
				if (DV_endsWith(this.ContainerName, 'Container') && (this.ContainerName.startsWith('COMBO_')
																		|| this.ContainerName.startsWith('W0') && this.ContainerName.substring(5).startsWith('COMBO_'))) {
					if (this.ContainerName.startsWith('COMBO_')) {
						attName = this.ContainerName.substring(6, this.ContainerName.length - 9);
					} else {
						wcName = this.ContainerName.substring(0, 5);
						attName = this.ContainerName.substring(11, this.ContainerName.length - 9);
					}
					if ($('#' + wcName + 'vCOMBO' + attName).length == 1 && $('#' + wcName + 'vCOMBO' + attName).parent().attr('id') == wcName + 'SECTIONATTRIBUTE_' + attName) {
						attFound = true;
					}
				}
				if (attFound) {
					var thisC = this;
					$('#' + wcName + 'vCOMBO' + attName).parent().one("DOMSubtreeModified", function () {
						$('#' + wcName + attName).val($('#' + wcName + 'vCOMBO' + attName).val());
						thisC.my_dropDownOptions.updatedExtendedComboCaption(null);
						var gxO = gx.O;
						var ctrlid = wcName + attName;
						var controlValidStructFld = gxO.getValidStructFld(ctrlid);
						if (controlValidStructFld != null) {
							gx.csv.validControls(controlValidStructFld.id, controlValidStructFld.id + 1, true, gxO);
						}
					})
				}
				this.OnOptionClicked();
				if (!attFound) {
					this.updatedExtendedComboCaptionAfterPopupClose(10);
				}
			}
			$('#' + this.ContainerName).find('button').focus();
		}
	}

	this.updatedExtendedComboCaptionAfterPopupClose = function (retries) {
		var currentCaption = this.Caption;
		this.my_dropDownOptions.updatedExtendedComboCaption(null);
		if (currentCaption == this.Caption && retries > 0) {
			retries--;
			var thisC = this;
			window.setTimeout(function () {
				thisC.updatedExtendedComboCaptionAfterPopupClose(retries);
			}, retries <= 1 ? 1000 : 100);
		}
	}

	this.DataHasEventKey = function (data, eventKey) {
		for (var index = 0; index < data.length; index += 1) {
			if (data[index]["EventKey"] == eventKey) {
				return true;
			}
		}
		return false;
	}

	this.GetDropDownOptionsData = function () {
		return this.DropDownOptionsData;
	}

	this.SetDropDownOptionsTitleSettingsIcons = function (icons) {
		if (icons != undefined && icons.Default != '') {
			this.DropDownOptionsTitleSettingsIcons = icons;
		}
	}

	this.GetDropDownOptionsTitleSettingsIcons = function () {
		return this.DropDownOptionsTitleSettingsIcons;
	}

	this.onaftereventx = function (control) {
		var controlRender = false;
		if ($("#" + control.containerToDrawName).attr("class") == null || $("#" + control.containerToDrawName).attr("class").length == 0) {
			controlRender = true;
		} else {
			controlRender = true;
			try {
				if ($("#" + control.containerToDrawName).children().length == 2 && !(this.IsM && this.MControl.IsFS)) {
					var ul = $("#" + control.containerToDrawName).children()[1];
					for (var i = 0; i < ul.children.length; i++) {
						if (ul.children[i].children.length == 1) {
							var elem = ul.children[i].children[0];
							var ev = $._data(elem, 'events');
							if (ev != null) {
								controlRender = false;
								break;
							}
						}
					}
				}
			} catch (err) {
				console.log("onaftereventx - error verifying if controlRender is necessary: " + err.message);
			}
		}
		if (controlRender && $("#" + control.containerToDrawName).find('.Errorbtn').length == 0) {
			control.render();
		}
	}

	this.Update = function (caption, icon) {
		this.Caption = caption;
		this.Icon = icon;
		this.updating = true;
		if (this.my_dropDownOptions != undefined) {
			this.my_dropDownOptions.render();
		} else {
			this.show();
		}
	}

	this.show = function () {
		if (this.my_dropDownOptions == undefined) {
			this.my_dropDownOptions = new DVelopBootstrapDropDownOptions(this);
			this.my_dropDownOptions.render();

			if (this.my_dropDownOptions.IsDate()) {
				$("#" + this.my_dropDownOptions.containerToDrawName).off('hide.bs.dropdown').on('hide.bs.dropdown', function (ddo) {
					return function (e) {
						return ddo.OnDDOClosing();
					}
				}(this.my_dropDownOptions));
			}

			if (!this.IsM) {

				gx.fx.obs.addObserver("gx.onafterevent", window, function (thisC) {
					return function (e) {
						thisC.onaftereventx(thisC.my_dropDownOptions);
					}
				}(this));

				gx.fx.obs.addObserver("gx.onload", window, function (thisC) {
					return function (e) {
						thisC.onaftereventx(thisC.my_dropDownOptions);
					}
				}(this));

				gx.fx.obs.addObserver('popup.afterclose', this, this.onPopupClose);
			}
		}
	}
}

function DDOGridTitleSettingsM() {

	this.SetDropDownOptionsData = function (icons) {
		this.InitializeColTitleOptions();
		for (var index = 0; index < this.ColumnIndexesObj.length; index += 1) {
			this.my_dropDownOptions[index].SetDropDownOptionsData(icons == null ? null : []);
		}
	}

	this.SetDropDownOptionsTitleSettingsIcons = function (icons) {
		if (icons != undefined && icons.Default != '') {
			this.DropDownOptionsTitleSettingsIcons = icons;
		}
		this.InitializeColTitleOptions();
		for (var index = 0; index < this.ColumnIndexesObj.length; index += 1) {
			this.my_dropDownOptions[index].SetDropDownOptionsTitleSettingsIcons(icons);
		}
		this.SetDropDownOptionsData(icons);
	}

	this.GetDropDownOptionsTitleSettingsIcons = function () {
		return this.DropDownOptionsTitleSettingsIcons;
	}

	this.onaftereventx = function () {
		if (this.ColumnIndexesObj != null) {
			this.LoadColTitleDynProperties();
			for (var index = 0; index < this.ColumnIndexesObj.length; index += 1) {
				this.my_dropDownOptions[index].onaftereventx(this.my_dropDownOptions[index].my_dropDownOptions);
			}
			if (typeof (SetMinWidthTotalizers) === 'function') {
				SetMinWidthTotalizers();
			}
		}
	}

	this.show = function () {
		this.InitializeColTitleOptions();
		for (var index = 0; index < this.ColumnIndexesObj.length; index += 1) {
			this.my_dropDownOptions[index].show();
		}

		if (!this.eventsAttached) {
			this.eventsAttached = true;

			var thisC = this;
			gx.fx.obs.addObserver("gx.onafterevent", window, function (thisC) {
				return function (e) {
					thisC.onaftereventx();
				}
			}(this));

			gx.fx.obs.addObserver("gx.onload", window, function (thisC) {
				return function (e) {
					thisC.onaftereventx();
				}
			}(this));
		}
	}
	this.IncludeDivInGridTitles = function () {
		if (this.GridObjId == null) {
			if (this.GridInternalName == 'GRID') {
				this.GridObjId = 'GridContainerDiv';
				if ($('#' + this.GridObjId).length == 0) {
					this.GridObjId = null;
				}
			}
			if (this.GridObjId == null) {
				var thisC = this;
				$(".gx-grid").each(function (i) {
					if (this.id != null && this.id.toUpperCase() == thisC.GridInternalName + 'CONTAINERDIV') {
						thisC.GridObjId = this.id;
						return false;
					}
				});
			}
		}
		if (this.GridObjId != null && $('#' + this.GridObjId).length == 1) {
			var theadTr = $('#' + this.GridObjId).find('>table>thead>tr:last-child()')[0];
			if (theadTr != null && $(theadTr).find('.ColumnSettingsContainer').length == 0) {
				for (var index = 0; index < this.ColumnIndexesObj.length; index += 1) {
					var indexAdd = 0;
					if (this.ColumnIndexesObj[index].IsInLineEditableWithTags
						&& !$(theadTr.children[this.ColumnIndexesObj[index].i]).is(':visible')
						&& $(theadTr.children[this.ColumnIndexesObj[index].i + 1]).is(':visible')) {
						//Grid with Edit in line and tag
						indexAdd = 1;
					}
					var titleSpan = $(theadTr.children[this.ColumnIndexesObj[index].i + indexAdd]).find('span')[0];
					if (titleSpan != null) {
						titleSpan.innerHTML = "<div class='ColumnSettingsContainer'>" + titleSpan.outerHTML + "<div id='" + this.my_dropDownOptions[index].TitleControlIdToReplace + "'></div>"
					}
				}
			}
		}
	}

	this.InitializeColTitleOptions = function () {
		if (this.ColumnIndexesObj == null) {
			this.IsFS = (this.ColumnIds[0] == ':');
			this.ColumnIndexesObj = JSON.parse('[{"i":' + (this.IsFS ? '-1' : '') + replaceAll(replaceAll(this.ColumnIds, ':', ',"n":"'), '|', '"},{"i":' + (this.IsFS ? '-1' : '')) + '"}]');

			if (this.ColumnsSortValues != null && this.ColumnsSortValues != '') {
				this.ColumnsSortValuesObj = JSON.parse('["' + replaceAll(this.ColumnsSortValues, '|', '","') + '"]');
			}

			this.my_dropDownOptions = [];
			for (var index = 0; index < this.ColumnIndexesObj.length; index += 1) {
				if (this.ColumnIndexesObj[index].n.length > 2 && this.ColumnIndexesObj[index].n.substring(this.ColumnIndexesObj[index].n.length - 2) == '-E') {
					this.ColumnIndexesObj[index].n = this.ColumnIndexesObj[index].n.substring(0, this.ColumnIndexesObj[index].n.length - 2);
					this.ColumnIndexesObj[index].IsInLineEditableWithTags = true;
				}

				var colTitleOptions = new BootstrapDropDownOptions();
				colTitleOptions.IsM = true;
				colTitleOptions.MName = this.ColumnIndexesObj[index].n;
				colTitleOptions.TitleControlIdToReplace = (this.IsFS ? replaceAll(this.ContainerName, 'Container', '').toUpperCase() + '_' + colTitleOptions.MName.toUpperCase() : this.GridInternalName + '_TF_' + (index + 1));
				colTitleOptions.ContainerName = this.ContainerName + '_TF_' + (index + 1);
				colTitleOptions.ControlName = this.ControlName + '_TF_' + (index + 1);
				colTitleOptions.OnOptionClicked = this.OnOptionClicked;
				colTitleOptions.MControl = this;
				colTitleOptions.DropDownOptionsType = 'GridTitleSettings';

				this.my_dropDownOptions.push(colTitleOptions);
			}
			this.LoadColTitleBaseProperties();
		}
		this.LoadColTitleDynProperties();
	}

	this.LoadColTitleBaseProperties = function () {

		this.SetPropValueToDDOs('Icon', false, true, '');
		this.SetPropValueToDDOs('Caption', false, true, '');
		this.SetPropValueToDDOs('Tooltip', false, true, 'WWP_TSColumnOptions');
		this.SetPropValueToDDOs('Cls', false, true, 'ColumnSettings');
		this.SetPropValueToDDOs('TitleControlAlign', true, true, 'Automatic');

		this.SetPropValueToDDOs('IncludeSortASC', true, true, false);
		if (this['IncludeSortDSC'] == null || this['IncludeSortDSC'] == '') {
			this['IncludeSortDSC'] = this['IncludeSortASC'];
		}
		this.SetPropValueToDDOs('IncludeSortDSC', true, true, false);
		this.SetPropValueToDDOs('AllowGroup', true, true, false);
		this.SetPropValueToDDOs('IncludeFilter', true, true, false);
		this.SetPropValueToDDOs('FilterType', false, true, 'Character');
		this.SetPropValueToDDOs('FilterIsRange', true, true, false);
		this.SetPropValueToDDOs('IncludeDataList', true, true, false);
		this.SetPropValueToDDOs('DataListType', false, true, 'Dynamic');
		this.SetPropValueToDDOs('DataListProc', false, true, '');
		this.SetPropValueToDDOs('DataListUpdateMinimumCharacters', false, true, 0);
		this.SetPropValueToDDOs('AllowMultipleSelection', true, true, false);

		this.SetPropValueToDDOsWithoutDecode('GAMOAuthToken');

		this.SetPropValueToDDOs('AllowGroupText', false, true, 'WWP_GroupByOption');
		this.SetPropValueToDDOs('SortASC', false, true, 'WWP_TSSortASC');
		this.SetPropValueToDDOs('SortDSC', false, true, 'WWP_TSSortDSC');
		this.SetPropValueToDDOs('LoadingData', false, true, 'WWP_TSLoading');
		this.SetPropValueToDDOs('CleanFilter', false, true, 'WWP_TSCleanFilter');
		this.SetPropValueToDDOs('RangeFilterFrom', false, true, 'WWP_TSFrom');
		this.SetPropValueToDDOs('RangeFilterTo', false, true, 'WWP_TSTo');
		this.SetPropValueToDDOs('NoResultsFound', false, true, 'WWP_TSNoResults');
		this.SetPropValueToDDOs('SearchButtonText', false, true, 'WWP_TSSearchButtonCaption');
	}

	this.LoadColTitleDynProperties = function () {
		this.IncludeDivInGridTitles();

		this.SetPropValueToDDOs('Visible', true, true, true);
		this.SetPropValueToDDOs('DataListFixedValues', false, true, '');
		this.SetPropValueToDDOs('FixedFilters', false, true, '');

		this.SetPropValueToDDOs('SelectedFixedFilter', false, true, '');
		this.SetPropValueToDDOs('FilteredText_set', false, true, '');
		this.SetPropValueToDDOs('FilteredTextTo_set', false, true, '');
		this.SetPropValueToDDOs('SelectedValue_set', false, true, '');
		this.SetPropValueToDDOs('SelectedText_set', false, true, '');

		if (this.SortedStatus != null && this.SortedStatus != '' && this.ColumnsSortValuesObj != null) {
			var sortedColumnVal = this.SortedStatus.substring(0, this.SortedStatus.indexOf(':'));
			var sortType = this.SortedStatus.substring(this.SortedStatus.indexOf(':') + 1);
			for (var index = 0; index < this.ColumnIndexesObj.length; index += 1) {
				if (this.ColumnsSortValuesObj[index] == sortedColumnVal) {
					this.my_dropDownOptions[index].SortedStatus = sortType;
				} else {
					this.my_dropDownOptions[index].SortedStatus = '';
				}
				this.my_dropDownOptions[index].MSortValue = this.ColumnsSortValuesObj[index];
			}
		} else {
			this.SetPropValueToDDOs('SortedStatus', false, true, '');
		}
	}

	this.UpdateColPropValueFromDDOs = function (name) {
		this[name] = '';
		for (var index = 0; index < this.my_dropDownOptions.length; index += 1) {
			if (index > 0) {
				this[name] += '|';
			}
			this[name] += replaceAll(replaceAll(replaceAll(this.my_dropDownOptions[index][name], "\\", "\\\\"), "|", "\\|"), '\n', '');
		}
		this[name] += '';
	}

	this.SetPropValueToDDOsWithoutDecode = function (name) {
		var fixedVal = this[name];
		for (var index = 0; index < this.ColumnIndexesObj.length; index += 1) {
			this.my_dropDownOptions[index][name] = fixedVal;
		}
	}

	this.SetPropValueToDDOs = function (name, isBool, tryCollection, defVal) {
		var val = this[name];
		var valuesCol = null;
		var fixedVal = null;
		if (tryCollection && val != null && replaceAll(replaceAll(val, "\\\\", ""), "\\|", "").indexOf('|') >= 0) {
			valuesCol = this.decodePropValueCollection(val);
		} else {
			if (val == null || val == '') {
				fixedVal = defVal;
			} else {
				fixedVal = this.decodePropValue(val);
				if (isBool) {
					fixedVal = (fixedVal == 'T');
				}
			}
		}
		for (var index = 0; index < this.ColumnIndexesObj.length; index += 1) {
			if (valuesCol != null) {
				this.my_dropDownOptions[index][name] = valuesCol[index];
				if (isBool) {
					this.my_dropDownOptions[index][name] = (this.my_dropDownOptions[index][name] == 'T');
				}
			} else {
				this.my_dropDownOptions[index][name] = fixedVal;
			}
		}
	}

	this.decodePropValue = function (val) {
		val = replaceAll(val, "\\\\", "[\\\\]");
		val = replaceAll(val, "\\|", "|");
		val = replaceAll(val, "[\\\\]", "\\");
		return val;
	}

	this.decodePropValueCollection = function (val) {
		val = replaceAll(val, "\\\\", "[\\\\]");
		val = replaceAll(val, "\\|", "[\\\\P]");
		val = replaceAll(val, "\"", "\\\"");
		val = replaceAll(val, '|', '","');
		val = replaceAll(val, '[\\\\P]', '|');
		val = replaceAll(val, "[\\\\]", "\\\\");
		return JSON.parse('["' + val + '"]');
	}
}
