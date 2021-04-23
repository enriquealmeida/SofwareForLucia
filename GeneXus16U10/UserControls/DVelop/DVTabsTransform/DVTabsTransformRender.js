function DVelop_DVTabsTransform() {

	this.TabsInternalName;
	this.AllowStepTitleClick;//Yes|No|Only previous steps
	this.TransformType;//WizardBullet|WizardArrow

	this.WizardArrowSelectedUnSelectedImage;
	this.WizardArrowUnSelectedSelectedImage;

	this.show = function () {
		this.ProcessTabs();
	}

	if (gx != null) {
		gx.fx.obs.addObserver("gx.onafterevent", window, function (thisC) {
			return function (e) {
				thisC.ProcessTabs();
			}
		}(this));

		gx.fx.obs.addObserver("grid.onafterrender", window, function (thisC) {
			return function (e) {
				thisC.ProcessTabs();
			}
		}(this));

		gx.fx.obs.addObserver("gx.onload", window, function (thisC) {
			return function (e) {
				thisC.ProcessTabs();
				window.setTimeout(function () {
					//update in case some tab was hidden in Start Event
					thisC.UpdateTabsHtml($('#' + thisC.TabsInternalName.toUpperCase() + 'Container_tabs'));
				}, 1);
			}
		}(this));
	}

	this.ProcessTabs = function () {
		if (this.TabsInternalName != null && this.TabsInternalName != '') {
			var tabs = $('#' + this.TabsInternalName.toUpperCase() + 'Container_tabs');
			if (tabs == null || tabs.length == 0) {
				//code for preview
				tabs = $('#' + this.TabsInternalName);
			}
			if (tabs != null && tabs.length > 0 && !tabs.hasClass("WTabs_processed")) {
				var thisC = this;
				tabs.find('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
					thisC.UpdateTabsHtml($(e.target).closest('ul'));
				});

				this.UpdateTabsHtml(tabs);
			}
		}
	}

	this.UpdateTabsHtml = function (tabs) {
		tabs.toggleClass("WTabs_processed", true);
		var selectedStepNumber = tabs.find('li.active').index();
		var totalVisibleTabs = tabs.find('>li:visible').length;
		var totalTabs = tabs.find('>li').length;
		if (this.TransformType == 'WizardBullet') {
			var labelWidth = totalVisibleTabs > 0 ? 100 / totalVisibleTabs : 100;
			tabs.find('>li:visible').each(function (i) {
				$(this).css('width', labelWidth + '%');
			});
		}
		var nextToSelectedStepNumber = selectedStepNumber +1;
		while (nextToSelectedStepNumber <= totalTabs && tabs.find('>li:nth-child(' + (nextToSelectedStepNumber + 1) + '):visible>a').length == 0) {
			nextToSelectedStepNumber++;
		}
		var firstTab = 0;
		while (firstTab <= totalTabs && tabs.find('>li:nth-child(' + (firstTab + 1) + '):visible>a').length == 0) {
			firstTab++;
		}
		var lastTab = (totalTabs - 1);
		while (lastTab >= 0 && tabs.find('>li:nth-child(' + (lastTab + 1) + '):visible>a').length == 0) {
			lastTab--;
		}
		var thisC = this;
		tabs.find('>li:visible>a').each(function (i) {
			var stepNumber = $(this.parentElement).index();
			var caption = $(this).attr('tab-caption');
			if (caption == null) {
				caption = this.innerHTML;
				$(this).attr('tab-caption', caption);
			}
			var addWizardClickDisabledClass = (stepNumber != selectedStepNumber && (thisC.AllowStepTitleClick == 'No' || stepNumber > selectedStepNumber && thisC.AllowStepTitleClick != 'Yes'));
			$(this).toggleClass('WizardClickDisabled', addWizardClickDisabledClass);
			if (thisC.TransformType == 'WizardArrow') {
				var tblContainerStep_Class = 'TableContainerStep';
				var stepImg_Class;
				var tblStep_Class;
				var stepNumber_Class;
				var wizardStepsAux__Title_Class;
				var stepImg_Src;

				if (stepNumber == selectedStepNumber) {
					wizardStepsAux__Title_Class = 'ReadonlyAttributeStepSelected';
					stepImg_Src = thisC.WizardArrowUnSelectedSelectedImage;
					stepImg_Class = 'StepImage';
					tblContainerStep_Class = 'TableContainerStepSelected';
					stepNumber_Class = 'StepNumberSelected';
					tblStep_Class = 'TableStepSelected';
				} else {
					stepImg_Src = thisC.WizardArrowSelectedUnSelectedImage;
					if (stepNumber == nextToSelectedStepNumber) {
						stepImg_Class = 'StepImage';
					} else {
						stepImg_Class = 'StepImageUnSelected';
					}
					stepNumber_Class = 'StepNumber';
					tblStep_Class = 'TableStep';
					wizardStepsAux__Title_Class = 'ReadonlyAttributeStep';
				}
				if (stepNumber == firstTab) {
					tblContainerStep_Class = tblContainerStep_Class + " TableContainerStepFirst";
				} else if (stepNumber == lastTab) {
					tblContainerStep_Class = tblContainerStep_Class + " TableContainerStepLast";
				}

				this.innerHTML = '<table><tbody><tr><td><table class="' + tblContainerStep_Class + '"><tbody><tr><td><img src="' + stepImg_Src + '" class="' + stepImg_Class + '"></td><td><div><div><div class="' + tblStep_Class + '"><div class="row"><div class="col-xs-12 StepNumberCell"><span class="' + stepNumber_Class + '">' + (i + 1) + '</span></div></div></div></div></div></td><td><span class="' + wizardStepsAux__Title_Class + '">' + caption + '</span></td></tr></tbody></table></td></tr></tbody></table>';
			}
			else {
				var tableStepBulletLineLeft_Class = 'TableStepBulletLine';
				var tableStepBulletLineRight_Class = 'TableStepBulletLine';
				var wizardStepsAux__Title_Class;
				var tableStepItem_Class;
				var stepNumber_Class = '';
				var tableContainerStepBulletClass = '';
				if (stepNumber < selectedStepNumber) {
					tableStepItem_Class = 'TableStepBulletChecked';
					tableStepBulletLineLeft_Class = 'TableStepBulletLineChecked';
					tableStepBulletLineRight_Class = 'TableStepBulletLineChecked';
					wizardStepsAux__Title_Class = 'ReadonlyAttributeStepBullet';
				} else if (stepNumber == selectedStepNumber) {
					stepNumber_Class = 'StepNumberBulletSelected';
					tableStepItem_Class = 'TableStepBulletSelected';
					tableStepBulletLineLeft_Class = 'TableStepBulletLineChecked';
					wizardStepsAux__Title_Class = 'ReadonlyAttributeStepBulletSelected';
				} else {
					stepNumber_Class = 'StepNumberBullet';
					tableStepItem_Class = 'TableStepBullet';
					wizardStepsAux__Title_Class = 'ReadonlyAttributeStepBulletUnSelected';
				}
				if (stepNumber == firstTab) {
					tableContainerStepBulletClass = " TableContainerStepBulletFirst";
				} else if (stepNumber == lastTab) {
					tableContainerStepBulletClass = " TableContainerStepBulletLast";
				}
				this.innerHTML = '<table class="TableContainerStepBullet' + tableContainerStepBulletClass + '"><tbody><tr><td><table><tbody><tr><td><table class="' + tableStepBulletLineLeft_Class + '"><tbody><tr><td>&nbsp;</span></td></tr></tbody></table></td><td><div><div><div class="' + tableStepItem_Class + '"><div class="row"><div class="col-xs-12 StepNumberBulletCell"><span class="' + stepNumber_Class + '">' + (i + 1) + '</span></div></div></div></div></div></td><td><table class="' + tableStepBulletLineRight_Class + '"><tbody><tr><td>&nbsp;</span></td></tr></tbody></table></td></tr></tbody></table></td></tr><tr><td><span class="' + wizardStepsAux__Title_Class + '">' + caption + '</span></td></tr></tbody></table>';
			}
		});
		if (this.AllowStepTitleClick != 'Yes') {
			tabs.find('>li>a[data-toggle="tab"]').off('click').on('click', function (e) {
				if ($(this).hasClass('WizardClickDisabled')) {
					e.preventDefault();
					e.stopPropagation();
				}
			});
		}
	}
}
