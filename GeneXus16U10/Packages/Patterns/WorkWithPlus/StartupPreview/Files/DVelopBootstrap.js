//Version 9.2.2

function DVelopBootstrapPanel(userControl) {

	this.control = userControl;
	this.containerName = userControl.ContainerName;
	this.header = userControl.ShowHeader;
	this.title = userControl.Title;

	this.render = function () {
		var panelDiv = document.createElement('div');
		panelDiv.id = 'DVelopBootstrapPanel_' + this.containerName;
		panelDiv.className = 'panel';
		if (this.control.Cls)
			panelDiv.className += ' ' + this.control.Cls;

		if (this.header) {
			var panelHeader = document.createElement('div');
			panelHeader.id = 'PanelHeader_' + this.containerName;
			panelHeader.className = 'panel-heading';

			if (this.control.Cls)
				panelHeader.className += ' ' + this.control.Cls + '_Header';

			var h3 = document.createElement('h3');
			h3.className = 'panel-title';

			var titleSpan = document.createElement('span');
			titleSpan.id = "Title_" + this.containerName;
			titleSpan.innerHTML = gx.getMessage(this.title);

			if (this.control.Collapsible) {
				var ref = document.createElement('a');
				ref.href = "#PanelBody_" + this.containerName;
				ref.className = 'accordion-toggle';
				ref.setAttribute("data-parent", "#PanelHeader_" + this.containerName);
				if (!navigator.appVersion.toLowerCase().match('msie 8') && !navigator.appVersion.toLowerCase().match('msie 7') && !navigator.appVersion.toLowerCase().match('msie 9')) {
					ref.setAttribute("data-toggle", "collapse");
				}
				var id = this.containerName;
				ref.onclick = function () {
					$(this)[$("#PanelBody_" + id).hasClass('in') ? 'addClass' : 'removeClass']('collapsed');
					if ($("#PanelBody_" + id).hasClass('in'))
						$("#PanelBody_" + id).collapse('hide');
					else
						$("#PanelBody_" + id).collapse('show');

					if ($("#" + id).parent().is('td') && (navigator.appVersion.toLowerCase().match('msie 8') || navigator.appVersion.toLowerCase().match('msie 7'))) {
						$(function () {
							$("#" + id).parent().height($("#" + id).height());
							$("#" + id).parent().css('vertical-align', 'top');
						})
					}
				}

				if (this.control.Collapsed)
					ref.className += ' collapsed';

				if (this.control.ShowCollapseIcon) {
					var toggleContainer = document.createElement('div');
					toggleContainer.className = 'toggle-container';

					var toggleIcon = document.createElement('div');
					toggleIcon.id = 'Toggle_' + this.containerName;
					toggleIcon.className = 'toggle-icon';

					ref.appendChild(toggleIcon);
					toggleContainer.appendChild(ref);

					if (this.control.IconPosition == 'right') {
						titleSpan.className = 'left';
						toggleIcon.className += ' toggle-icon-right';
						h3.appendChild(titleSpan);
						h3.appendChild(toggleContainer);
					} else {
						if (this.title != "")
							toggleContainer.className += ' left';
						h3.appendChild(toggleContainer);
						h3.appendChild(titleSpan);
					}
				} else {
					ref.appendChild(titleSpan);
					h3.appendChild(ref);
				}

				panelHeader.appendChild(h3);
			} else {
				h3.appendChild(titleSpan);
				panelHeader.appendChild(h3);
			}

			panelDiv.appendChild(panelHeader);
		}

		var panelBody = document.createElement('div');
		panelBody.id = 'PanelBody_' + this.containerName;
		panelBody.className = 'panel-collapse';

		if (this.control.AutoScroll)
			panelBody.className += ' panel-autoscroll';

		if (this.control.Cls)
			panelBody.className += ' ' + this.control.Cls + '_Body';

		if (this.control.Collapsed) {
			panelBody.className += ' collapse';
		} else {
			panelBody.className += ' in';
		}

		var body = document.getElementById(this.containerName + 'Body');
		if (!body) {
			var num = this.containerName.substring(this.containerName.length - 5);
			body = document.getElementById(this.containerName.substring(0, this.containerName.length - 5) + 'Body' + num);
		}

		if (body) {
			body.className = 'panel-body';
			body.style.display = 'block';

			panelBody.appendChild(body);
		}

		panelDiv.appendChild(panelBody);

		jQuery("#" + this.containerName).addClass('panel-group');
		jQuery("#" + this.containerName).append(panelDiv);


		//Set width and height
		if (!this.control.AutoWidth) {
			var width = this.control.Width;
			if (width.substring(width.length - 1) == '%') {
				panelDiv.style.width = width;
				jQuery("#" + this.containerName).width(width);
			} else if (width.substring(width.length - 2) == 'px') {
				panelDiv.style.width = width;
			} else {
				panelDiv.style.width = width + 'px';
			}
		}

		if (!this.control.AutoHeight) {
			var height = this.control.Height;
			if (height.substring(height.length - 1) == '%') {
				body.style.height = height;
				jQuery("#" + this.containerName).height(height);
			} else if (height.substring(height.length - 2) == 'px') {
				body.style.height = height;
			} else {
				body.style.height = height + 'px';
			}
		}

		if (this.control.Collapsible && (this.control.AutoWidth || width.substring(width.length - 1) == '%')) {
			var panel = this;
			var headerWidth = this.control.Width;
			if (this.control.Width.substring(this.control.Width.length - 2) != 'px' && this.control.Width.substring(this.control.Width.length - 1) != '%')
				headerWidth = headerWidth + 'px';
			var setWidth = !this.control.AutoWidth;
			$(window).bind("load", function () {
				var body = jQuery("#PanelBody_" + panel.containerName);
				if (jQuery("#PanelBody_" + panel.containerName).width() <= 0) {
					if (setWidth) {
						jQuery("#PanelHeader_" + panel.containerName).css("width", headerWidth);
					} else {
						var parent = jQuery("#PanelBody_" + panel.containerName).parent();
						body.appendTo("body");
						if (jQuery("#PanelHeader_" + panel.containerName).width() < body.width()) {
							var padding = parseInt(jQuery("#PanelHeader_" + panel.containerName).css("padding-left")) + parseInt(jQuery("#PanelHeader_" + panel.containerName).css("padding-right"));
							var newWidth = body.width() - padding;
							jQuery("#PanelHeader_" + panel.containerName).width(newWidth);
							$(window).bind("resize", function () {
								var padding = parseInt(jQuery("#PanelHeader_" + panel.containerName).css("padding-left")) + parseInt(jQuery("#PanelHeader_" + panel.containerName).css("padding-right"));
								var newWidth = body.width() - padding;
								jQuery("#PanelHeader_" + panel.containerName).width(newWidth);
							});
						}
						$("#PanelBody_" + panel.containerName).remove();
						parent.append(body);
					}
				}
				else {
					if (jQuery("#PanelHeader_" + panel.containerName).width() < body.width()) {
						if (($(window).width() - (jQuery("#" + panel.containerName).position().left + body.width())) < 20) {
							jQuery("#PanelHeader_" + panel.containerName).css("width", headerWidth);
						} else {
							var body = jQuery("#PanelBody_" + panel.containerName);
							var padding = parseInt(jQuery("#PanelHeader_" + panel.containerName).css("padding-left")) + parseInt(jQuery("#PanelHeader_" + panel.containerName).css("padding-right"));
							var newWidth = body.width() - padding;
							jQuery("#PanelHeader_" + panel.containerName).width(newWidth);
							$(window).bind("resize", function () {
								var body = jQuery("#PanelBody_" + panel.containerName);
								var padding = parseInt(jQuery("#PanelHeader_" + panel.containerName).css("padding-left")) + parseInt(jQuery("#PanelHeader_" + panel.containerName).css("padding-right"));
								var newWidth = body.width() - padding;
								jQuery("#PanelHeader_" + panel.containerName).width(newWidth);
							});
						}
					}
				}
			});
		}

		var control = this.control;
		var contName = this.containerName;
		$(function () {
			var actions = $("#" + contName + " a.change-action").each(function (i) {
				$(this).click(function () {
					$("#DVelopBootstrapPanel_" + contName).css("overflow", "visible");
					$("#PanelBody_" + contName).css("overflow", "visible");
					$(".PopupBorder .PopupContent :button").each(
						function (i) {
							$(this).click(function () {
								$("#DVelopBootstrapPanel_" + contName).css("overflow", "");
								$("#PanelBody_" + contName).css("overflow", "");
							});
						}
					);

					$(".PopupBorder .PopupHeaderButton").each(
						function (i) {
							$(this).click(function () {
								$("#DVelopBootstrapPanel_" + contName).css("overflow", "");
								$("#PanelBody_" + contName).css("overflow", "");
							});
						}
					);
				});
			});
			//overflow visible when showing drop down list's options - overflow hidden when click on any control to hide drop down.
			if (!control.AutoScroll) {
				$("#" + contName).find(".dropdown-toggle").each(function (i) {
					$(this).click(function () {
						if ($(this).parent().hasClass("open")) {
							$('#DVelopBootstrapPanel_' + contName).css("overflow", "hidden");
						} else {
							$('#DVelopBootstrapPanel_' + contName).css("overflow", "visible");
						}
					});

					$("*").click(function (e) {
						if (!$(e.target.offsetParent).hasClass("dropdown-toggle") && !$(e.target).hasClass("dropdown-toggle")) {
							if ($('#DVelopBootstrapPanel_' + contName).css("overflow") == "visible") {
								$('#DVelopBootstrapPanel_' + contName).css("overflow", "hidden");
							}
						}
					});
				});
			}
		})
	}
	this.refresh = function () {
		$("#Title_" + this.containerName).html(gx.getMessage(this.control.Title));
	}
};

function DVelopBootstrapTabs(userControl) {

	this.control = userControl;
	this.containerName = userControl.ContainerName;
	this.designTabs = JSON.parse(userControl.DesignTimeTabs);
	this.tabs = new Array();
	this.tabCount = 0;
	this.openTabsCount = 0;

	if (this.designTabs != undefined && this.designTabs.length != undefined)
		this.tabCount = this.designTabs.length;

	for (var i = 0; i < this.tabCount; i++) {
		this.tabs[i] = new BootstrapTab(this.designTabs[i]["id"], this.containerName);
		this.openTabsCount += 1;
	}

	this.render = function () {
		var tabContainer = document.createElement('ul');
		tabContainer.id = 'DVelopBootstrapTabsContainer_' + this.containerName;
		tabContainer.className = 'nav nav-tabs';

		if (this.control.Cls)
			tabContainer.className += ' ' + this.control.Cls;

		var tabsTable = document.createElement('table');
		tabsTable.className = 'tabs-table';

		var tabContent = document.createElement('div');
		tabContent.id = 'DVelopBootstrapTabsContent_' + this.containerName;
		tabContent.className = 'tab-content';

		for (var i = 0; i < this.tabCount; i++) {
			var designTab = this.designTabs[i];
			var selected = false;

			if (this.control.SelectedTabIndex == i)
				selected = true;

			var tab = document.createElement('li');
			tab.id = this.containerName + '_' + designTab['id'];

			var ref = document.createElement('a');
			ref.href = "#" + this.containerName + designTab['id'];
			ref.setAttribute("data-toggle", "tab");

			if (navigator.appVersion.toLowerCase().match('msie 8') || navigator.appVersion.toLowerCase().match('msie 7')) {
				ref.style.minHeight = "22px";
			}

			var tabContent_div = document.getElementById(this.containerName + designTab['id']);
			tabContent_div.style.display = '';
			tabContent_div.className = 'tab-pane fade';

			if (!this.control.AutoHeight) {
				var height = this.control.Height;
				if (height.substring(height.length - 1) == '%' || height.substring(height.length - 2) == 'px') {
					tabContent_div.style.height = height;
					tabsTable.style.height = height;
				} else {
					tabContent_div.style.height = height + 'px';
					tabsTable.style.height = height + 'px';
				}
			}

			if (selected) {
				this.setActiveTabId(designTab['id']);
				tab.className = 'active';
				tabContent_div.className += ' active in';
			}

			tab.appendChild(ref);
			tabContainer.appendChild(tab);
			tabContent.appendChild(tabContent_div)
		}

		var container = jQuery("#" + this.containerName);

		if (!this.control.AutoWidth) {
			container.width(this.control.Width);

			if (this.control.Width.substring(this.control.Width.length - 1) == '%' || this.control.Width.substring(this.control.Width.length - 2) == 'px') {
				tabsTable.style.width = this.control.Width;
			} else {
				tabsTable.style.width = this.control.Width + 'px';
			}
		}

		if (this.control.AutoScroll) {
			container.addClass('tab-container-scroll');
		} else {
			container.addClass('tab-container');
		}

		//create table cell
		r = document.createElement('tr');
		c = document.createElement('td');
		c.appendChild(tabContainer);
		c.appendChild(tabContent);
		r.appendChild(c);
		tabsTable.appendChild(r);
		container.append(tabsTable);

		var tabsPanel = this;
		$(function () {
			tabsPanel.loadTabHeaders();
		});
	}

	this.loadTabHeaders = function () {
		var maxHeight = 0;

		for (var i = 0; i < this.tabCount; i++) {
			var tab = this.getTab(this.designTabs[i]['id']);

			var tabHeader = jQuery("#" + this.containerName + '_' + tab.id + " a:first-child");
			var tabTitle = jQuery("#" + this.containerName + 'Title' + tab.id);
			tabTitle.css("display", "block");

			if (tabTitle.height() > maxHeight)
				maxHeight = tabTitle.height();

			tabHeader.append(tabTitle);

			if (tab.title != "")
				tab.setTitle(tab.title);

			if (!tab.show)
				tab.hideTab();

			//set onclick handlers
			var tabsPanel = this;
			var clickedTabId = tab.id;
			tabHeader.bind("click", function (c) { return function () { tabsPanel.setActiveTabId(c); } }(clickedTabId));

			if (this.control.TabClicked)
				tabHeader.bind("click", this.control.TabClicked);
		}

		for (var i = 0; i < this.tabCount; i++) {
			var tab = this.getTab(this.designTabs[i]['id']);
			tab.setHeightToTab(maxHeight);
		}
		//IE8 hack for table heights
		if ($("#" + this.containerName).parent().is('td') && (navigator.appVersion.toLowerCase().match('msie 8') || navigator.appVersion.toLowerCase().match('msie 7'))) {
			$("#" + this.containerName).parent().css("_min-height: auto !important;");
			$("#" + this.containerName).parent().css("_height: auto !important;");
		}
	}

	this.setActiveTabId = function (tabId) {
		this.control.ActiveTabId = tabId;
		if ($("#" + this.containerName).parent().is('td') && (navigator.appVersion.toLowerCase().match('msie 8') || navigator.appVersion.toLowerCase().match('msie 7'))) {
			$("#" + this.containerName).parent().css("_min-height: auto !important;");
			$("#" + this.containerName).parent().css("_height: auto !important;");
		}
	}

	this.setActiveTabWhenHideClose = function (tabId) {
		var tabIndex = this.getTabIndex(tabId);
		for (var i = 0; i < this.openTabsCount; i++) {
			if (tabIndex != i) {
				if (this.tabs[i].show && !this.tabs[i].closed) {
					this.SelectTab(this.tabs[i].id);
					break;
				}
			}
		}
	}

	this.getTab = function (tabId) {
		for (var i = 0; i < this.openTabsCount; i++) {
			if (tabId == this.tabs[i].id) {
				return this.tabs[i];
			}
		}

		return null;
	}

	this.getTabIndex = function (tabId) {
		for (var i = 0; i < this.openTabsCount; i++) {
			if (tabId == this.tabs[i].id) {
				return i;
			}
		}
	}

	//METHODS

	this.setTabTitle = function (tabId, title) {
		var tab = this.getTab(tabId);
		if (tab)
			tab.setTitle(title);
	}

	this.SelectTab = function (tabId) {
		var tab = this.getTab(tabId);
		if (tab) {
			if (!tab.show)
				tab.showTab();

			var tabHeader = jQuery("#" + this.containerName + '_' + tab.id + " a:first-child");
			tabHeader.trigger('click');
		}
	}

	this.showTab = function (tabId) {
		var tab = this.getTab(tabId);
		if (tab) {
			tab.showTab();
		}
	}

	this.hideTabById = function (tabId) {
		var tab = this.getTab(tabId);
		if (tab) {
			tab.hideTab();

			if (this.control.ActiveTabId == tabId) {
				this.setActiveTabWhenHideClose(tabId);
			}
		}
	}

	this.hideTabByIndex = function (tabIndex) {
		if (tabIndex < this.tabs.length) {
			var tab = this.tabs[tabIndex];
			if (tab) {
				tab.hideTab();

				if (this.control.ActiveTabId == tab.id) {
					this.setActiveTabWhenHideClose(tab.id);
				}
			}
		}
	}

}

function BootstrapTab(tabIdParm, containerNameParm) {
	this.containerName = containerNameParm;
	this.id = tabIdParm;
	this.title = "";
	this.show = true;
	this.closed = false;

	this.setTitle = function (titleParm) {
		this.title = gx.getMessage(titleParm);
		var tabTitle = jQuery("#" + this.containerName + '_' + this.id + " a:first-child span:first-child");

		if (tabTitle.length != 0) {
			tabTitle.text(this.title);
		} else {
			var tabTitleDiv = jQuery("#" + this.containerName + 'Title' + this.id);
			if (tabTitleDiv.length != 0) {
				var titleSpan = document.createElement('span');
				titleSpan.innerHTML = this.title;

				tabTitleDiv.prepend(titleSpan);
			}
		}
	}

	this.setHeightToTab = function (height) {
		jQuery("#" + this.containerName + 'Title' + this.id).height(height);
	}

	this.showTab = function () {
		this.show = true;

		var tab = jQuery("#" + this.containerName + '_' + this.id);
		tab.css("display", "block");

		var tabBody = jQuery("#" + this.containerName + this.id);
		tabBody.css("display", "block");
	}

	this.hideTab = function () {
		this.show = false;

		var tab = jQuery("#" + this.containerName + '_' + this.id);
		tab.css("display", "none");

		var tabBody = jQuery("#" + this.containerName + this.id);
		tabBody.css("display", "none");
	}

	this.closeTab = function () {
		this.closed = true;
	}
}

function DVelopBootstrapConfirmPanel(userControl) {

	this.control = userControl;
	this.containerName = userControl.ContainerName;

	this.render = function () {
		var myModal = jQuery("#" + this.containerName);
		myModal.addClass('modal fade');
		myModal.attr('tabindex', '-1');
		myModal.attr('role', 'dialog');
		myModal.attr('aria-labelledby', this.containerName + "_Title");
		myModal.attr('aria-hidden', 'true');

		var modalDialog = document.createElement('div');
		modalDialog.className = 'modal-dialog';

		var modalContent = document.createElement('div');
		modalContent.className = 'modal-content';

		var modalHeader = document.createElement('div');
		modalHeader.className = 'modal-header';

		var closeButton = this.createButton('CloseButton', 'close', '&times', 2);
		closeButton.setAttribute('aria-hidden', 'true');

		var modalTitle = document.createElement('h4');
		modalTitle.id = this.containerName + "_Title";
		modalTitle.className = 'modal-title';

		var modalBody = document.createElement('div');
		modalBody.className = 'modal-body';

		var confirmationText = document.createElement('span');
		confirmationText.id = this.containerName + "_ConfirmationText";
		if (this.control.TextType == 1) {
			modalTitle.innerText = gx.getMessage(this.control.Title);
			confirmationText.innerText = gx.getMessage(this.control.ConfirmationText);
		}
		else {
			modalTitle.innerHTML = gx.getMessage(this.control.Title);
			confirmationText.innerHTML = gx.getMessage(this.control.ConfirmationText);
		}

		var body = document.getElementById(this.containerName + "Body");
		body.style.display = 'block';

		var modalFooter = document.createElement('div');
		modalFooter.className = 'modal-footer';

		var saveButton = this.createButton('SaveButton', 'btn btn-primary btn-yes-DVelop', this.control.YesButtonCaption, this.control.TextType);
		var dismissButton;
		var cancelButton;

		if (this.control.ConfirmType == '1' || this.control.ConfirmType == '2')
			dismissButton = this.createButton('DismissButton', 'btn btn-default', this.control.NoButtonCaption, this.control.TextType);

		if (this.control.ConfirmType == '2')
			cancelButton = this.createButton('CancelButton', 'btn btn-default', this.control.CancelButtonCaption, this.control.TextType);

		if (this.control.YesButtonPosition == 'right') {
			if (this.control.ConfirmType == '2')
				modalFooter.appendChild(cancelButton);

			if (this.control.ConfirmType == '1' || this.control.ConfirmType == '2')
				modalFooter.appendChild(dismissButton);

			modalFooter.appendChild(saveButton);
		}
		else {
			modalFooter.appendChild(saveButton);

			if (this.control.ConfirmType == '1' || this.control.ConfirmType == '2')
				modalFooter.appendChild(dismissButton);

			if (this.control.ConfirmType == '2')
				modalFooter.appendChild(cancelButton);
		}

		modalHeader.appendChild(closeButton);
		modalHeader.appendChild(modalTitle);
		modalBody.appendChild(confirmationText);
		modalBody.appendChild(body);
		modalContent.appendChild(modalHeader);
		modalContent.appendChild(modalBody);
		modalContent.appendChild(modalFooter);
		modalDialog.appendChild(modalContent);
		myModal.append(modalDialog);

		var confirmPanel = this;
		$(function () {
			var yesBtn = $("#" + confirmPanel.containerName + "_" + "SaveButton");
			confirmPanel.bindClickHandlers(yesBtn, "Yes", confirmPanel.control.onYes, confirmPanel.control.Close);

			var closeBtn = $("#" + confirmPanel.containerName + "_" + "CloseButton");
			confirmPanel.bindClickHandlers(closeBtn, "Close", null, confirmPanel.control.Close);

			if (confirmPanel.control.ConfirmType == '1' || confirmPanel.control.ConfirmType == '2') {
				var noBtn = $("#" + confirmPanel.containerName + "_" + "DismissButton");
				confirmPanel.bindClickHandlers(noBtn, "No", confirmPanel.control.onNo, confirmPanel.control.Close);
			}

			if (confirmPanel.control.ConfirmType == '2') {
				var cancelBtn = $("#" + confirmPanel.containerName + "_" + "CancelButton");
				confirmPanel.bindClickHandlers(cancelBtn, "Cancel", confirmPanel.control.onCancel, confirmPanel.control.Close);
			}
		});
	}

	this.createButton = function (id, className, caption, textType) {
		var button = document.createElement('button');
		button.id = this.containerName + "_" + id;
		button.className = className;
		button.setAttribute('type', 'button');
		button.setAttribute('data-dismiss', 'modal');
		if (textType == 1)
			button.innerText = gx.getMessage(caption);
		else
			button.innerHTML = gx.getMessage(caption);

		return button;
	}

	this.bindClickHandlers = function (btn, result, btnHandler, closeHandler) {
		var confirmPanel = this;
		btn.bind("click", function (r) { return function () { confirmPanel.seResult(r); } }(result));
		if (btnHandler)
			btn.bind("click", btnHandler);
		if (closeHandler)
			btn.bind("click", closeHandler);
	}

	this.seResult = function (result) {
		this.control.Result = result;
	}

	//METHODS

	this.openModal = function () {
		if (this.control.TextType == 1) {
			$("#" + this.containerName + "_Title").text(gx.getMessage(this.control.Title));
			$("#" + this.containerName + "_ConfirmationText").text(gx.getMessage(this.control.ConfirmationText));
		}
		else {
			$("#" + this.containerName + "_Title").html(gx.getMessage(this.control.Title));
			$("#" + this.containerName + "_ConfirmationText").html(gx.getMessage(this.control.ConfirmationText));
		}
		$("#" + this.containerName).modal('show');
	}

	this.closeModal = function () {
		$("#" + this.containerName).modal('hide');
	}
}

function DVelopBootstrapDropDownOptions(userControl) {

	this.control = userControl;
	this.containerName = userControl.ContainerName;
	this.containerToDrawName = this.containerName;
	this.myT = null;
	this.calendarOpened = false;
	this.dateFilterVarName = '';
	this.m_UlDropDown;
	this.m_triggerButton;
	this.SelectedValue_getAUX = '';
	this.SelectedText_getAUX = '';

	this.ColumnsSelectorData_Aux;

	this.IsDate = function () {
		return this.control.FilterType == 'Date';
	}

	this.AddLoadingOption = function (liDropDownItem) {
	}

	this.render = function () {

		this.control.AllowMultipleSelection = this.control.AllowMultipleSelection && this.control.IncludeDataList;
		if (this.control.IncludeDataList && this.control.DataListType.indexOf("Dynamic") == 0 && this.control.DataListProc.trim() == "") {
			this.control.IncludeDataList = false;
		}
		if (this.control.AllowMultipleSelection && this.control.SelectedValue_get == '') {
			this.control.SelectedValue_get = '[]';
			this.control.SelectedText_get = '[]';
		}
		if (this.control.FilterIsRange && this.control.DataListType == "Dynamic (with fixedValues)") {
			this.control.FilterIsRange = false;
		}
		if (this.control.TitleControlIdToReplace != '') {
			this.containerToDrawName = this.control.TitleControlIdToReplace;
			if ($("#" + this.containerToDrawName).length == 0) {
				var objsByName = document.getElementsByName(this.containerToDrawName);
				if (objsByName.length == 1) {
					if (objsByName[0].nodeName == 'INPUT') {
						//case of gx button
						var btnElement = objsByName[0];
						var btnParent = btnElement.parentElement;
						var btnDivForDDO = document.createElement('div');
						btnDivForDDO.setAttribute('id', this.containerToDrawName);
						btnParent.insertBefore(btnDivForDDO, btnElement);
						btnElement.remove();
					} else {
						objsByName[0].setAttribute('id', this.containerToDrawName);
					}
				}
			}
		}
		$("#" + this.containerToDrawName).html('');
		$("#" + this.containerToDrawName).addClass(this.control.Cls);
		if ($("#" + this.containerToDrawName).parent().parent().parent().css("text-align") == 'right') {
			$("#" + this.containerToDrawName).parent().addClass(this.control.Cls + 'AlignTitleRight');
		}
		$("#" + this.containerToDrawName).addClass("drop-down-options btn-group");

		var triggerButton = document.createElement('button');
		var triggerButtonId = this.containerName + "_btnGroupDrop";
		triggerButton.id = triggerButtonId;
		triggerButton.className = "btn btn-default dropdown-toggle";
		triggerButton.setAttribute("type", "button");
		triggerButton.setAttribute("data-toggle", "dropdown");

		var triggerButtonIcon = null;
		if (this.control.UseAsGridTitleSetting) {
			if (this.control.DropDownOptionsTitleSettingsIcons == null) {
				this.control.DropDownOptionsTitleSettingsIcons = {};
			}
			var filtered = false;
			if (!this.control.AllowMultipleSelection || this.control.TitleControlIdToReplace != '') {
				filtered = (this.control.IncludeDataList && !this.IsValueEmpty(this.control.SelectedValue))
						|| (this.control.IncludeFilter && (!this.IsValueEmpty(this.control.FilteredText) || (this.control.FilterIsRange && !this.IsValueEmpty(this.control.FilteredTextTo))))
						|| (this.control.SelectedFixedFilter != '');
			}
			triggerButtonIcon = this.control.DropDownOptionsTitleSettingsIcons["Default_GXI"];
			if (this.control.IncludeSortASC && this.control.SortedStatus == 'ASC') {
				if (filtered) {
					triggerButtonIcon = this.control.DropDownOptionsTitleSettingsIcons["FilteredSortedASC_GXI"];
					$(triggerButton).addClass('FilteredSortedASC');
				} else {
					triggerButtonIcon = this.control.DropDownOptionsTitleSettingsIcons["SortedASC_GXI"];
					$(triggerButton).addClass('SortedASC');
				}
			} else if (this.control.IncludeSortDSC && this.control.SortedStatus == 'DSC') {
				if (filtered) {
					triggerButtonIcon = this.control.DropDownOptionsTitleSettingsIcons["FilteredSortedDSC_GXI"];
					$(triggerButton).addClass('FilteredSortedDSC');
				} else {
					triggerButtonIcon = this.control.DropDownOptionsTitleSettingsIcons["SortedDSC_GXI"];
					$(triggerButton).addClass('SortedDSC');
				}
			} else if (filtered) {
				triggerButtonIcon = this.control.DropDownOptionsTitleSettingsIcons["Filtered_GXI"];
				$(triggerButton).addClass('Filtered');
			}
		}

		if (this.control.Tooltip.length > 0)
			triggerButton.setAttribute("title", gx.getMessage(this.control.Tooltip));

		var caretTriggerButton = document.createElement('span');
		caretTriggerButton.className = "caret";

		var ulDropDown = document.createElement('ul');
		ulDropDown.className = "dropdown-menu";
		ulDropDown.setAttribute("role", "menu");
		ulDropDown.setAttribute("aria-labelledby", this.containerName + "_btnGroupDrop");

		//check if some option has image
		var images = false;
		for (var index = 0; this.control.DropDownOptionsData != null && index < this.control.DropDownOptionsData.length; index += 1) {
			if (this.control.DropDownOptionsData[index]["Icon"] != null && this.control.DropDownOptionsData[index]["Icon"].length > 0
				|| this.control.DropDownOptionsData[index]["FontIcon"] != null && this.control.DropDownOptionsData[index]["FontIcon"].length > 0) {

				images = true;
				break;
			}
		}
		this.m_UlDropDown = ulDropDown;
		this.m_triggerButton = triggerButton;

		if (this.control.TitleControlAlign != 'Right') {
			$("#" + this.containerToDrawName).bind('shown.bs.dropdown', function (thisC) {
				return function (e) {
					if (thisC.control.TitleControlAlign == 'Automatic') {
						dropdownAutoPosition("#" + thisC.containerToDrawName, ulDropDown, triggerButton);
					} else {
						$(ulDropDown).css("margin-left", "-" + ($(ulDropDown).outerWidth() - $(triggerButton).outerWidth()) + "px");
					}
				}
			}(this));
		}
		$("#" + this.containerToDrawName).bind('hidden.bs.dropdown', function (thisC) {
			return function (e) {
				thisC.setSectionGridMinHeight(false);
			}
		}(this));
		$("#" + this.containerToDrawName).bind('shown.bs.dropdown', function (thisC) {
			return function (e) {
				thisC.setSectionGridMinHeight(true);
			}
		}(this));

		for (var index = 0; index < this.control.DropDownOptionsData.length; index += 1) {
			var item = this.control.DropDownOptionsData[index];
			var liDropDownItem = document.createElement('li');
			var filterInput = null;
			var filterInputTo = null;

			if (item["IsDivider"]) {
				liDropDownItem.className = "divider";
				//disable onclick close
				$(liDropDownItem).bind("click", function (e) {
					e.stopPropagation();
				});
			}
			else {
				if (item["EventKey"] == '<#RawHTML#>') {
					$(liDropDownItem).html(item["Title"]);
				} else if (item["EventKey"] == '<#FilterOptions#>') {

					//remove filter LI - Start
					var liRemoveFilter = document.createElement('li');
					if (!filtered) {
						$(liRemoveFilter).css("display", "none");
					}
					var aRemoveFilter = document.createElement('a');
					var spanRemoveFilter = document.createElement('span');
					spanRemoveFilter.innerHTML = gx.getMessage(this.control.CleanFilter);

					$(aRemoveFilter).bind("click", function (thisC) {
						return function (e) {
							if (thisC.IsDate()) {
								thisC.DetachAuxDateVariable(thisC.GetDateFilterVariable() + "_dp_container");
								if (thisC.control.FilterIsRange) {
									thisC.DetachAuxDateVariable(thisC.GetDateFilterVariableTo() + "_dp_container");
								}
							}
							thisC.SetActiveEventKey('<#Filter#>');
							thisC.SetFilteredText('');
							if (thisC.control.FilterIsRange) {
								thisC.SetFilteredTextTo('');
							}
							var emptyVal = '';
							if (thisC.control.AllowMultipleSelection) {
								emptyVal = '[]';
							}
							thisC.SetSelectedValue(emptyVal);
							thisC.SetSelectedText(emptyVal);
						}
					}(this));
					if (this.control.OnOptionClicked) {
						if (this.IsDate()) {
							$(aRemoveFilter).bind("click", function (thisC) {
								return function (e) {
									thisC.calendarOpened = false;
								}
							}(this));
						}
						$(aRemoveFilter).bind("click", this.control.OnOptionClicked);
					}

					aRemoveFilter.setAttribute("href", "#");
					//to keep URLs
					if (!navigator.appVersion.toLowerCase().match('msie 8') && !navigator.appVersion.toLowerCase().match('msie 7') && !navigator.appVersion.toLowerCase().match('msie 9')) {
						aRemoveFilter.setAttribute("data-toggle", "dropdown");
					}

					aRemoveFilter.className = "image";
					aRemoveFilter.setAttribute("style", "margin-bottom:10px");
					var imgRemoveFilter = document.createElement('img');
					imgRemoveFilter.setAttribute("src", this.control.DropDownOptionsTitleSettingsIcons["OptionCleanFilters_GXI"]);
					aRemoveFilter.appendChild(imgRemoveFilter);

					aRemoveFilter.appendChild(spanRemoveFilter);
					liRemoveFilter.appendChild(aRemoveFilter);
					ulDropDown.appendChild(liRemoveFilter);

					if (filtered) {
						var liRemoveFilterDivider = document.createElement('li');
						liRemoveFilterDivider.className = "divider";
						//disable onclick close
						$(liRemoveFilterDivider).bind("click", function (e) {
							e.stopPropagation();
						});
						ulDropDown.appendChild(liRemoveFilterDivider);
					}
					//remove filter LI - End

					if (this.control.FixedFilters.trim() != '') {
						var liFixedFilters = document.createElement('li');
						ulDropDown.appendChild(liFixedFilters);
						this.LoadFixedFilters(liFixedFilters);

						var liFixedFiltersDivider = document.createElement('li');
						liFixedFiltersDivider.className = "divider";
						//disable onclick close
						$(liFixedFiltersDivider).bind("click", function (e) {
							e.stopPropagation();
						});
						ulDropDown.appendChild(liFixedFiltersDivider);
					}

					if (this.control.AllowMultipleSelection) {
						this.SelectedValue_getAUX = this.control.SelectedValue_get != null && this.control.SelectedValue_get != '' ? JSON.parse(this.control.SelectedValue_get) : [];
						this.SelectedText_getAUX = this.control.SelectedText_get != null && this.control.SelectedText_get != '' ? JSON.parse(this.control.SelectedText_get) : [];
					}

					//input search LI - Start
					if (this.control.IncludeFilter) {
						var liFilterInput = document.createElement('li');

						var divInput = document.createElement('div');
						divInput.setAttribute("style", "display: block; margin-right:10px;margin-left:10px;padding-bottom:10px");
						var searchAsButton = true;

						if (this.IsDate()) {
							var dDate = document.createElement('div');
							dDate.setAttribute("id", this.control.ControlName + "DateDiv");
							dDate.setAttribute("class", "ColumnSettingsRangeContainerDiv");
							if (this.control.FilterIsRange) {
								var divDateFrom = document.createElement('div');
								divDateFrom.setAttribute("class", "ColumnSettingsRangeContainer");
								var spanFrom = document.createElement('span');
								spanFrom.setAttribute("class", "ColumnSettingsRangeContainerSpan");
								spanFrom.innerHTML = gx.getMessage(this.control.RangeFilterFrom);
								divInput.appendChild(divDateFrom);
								divDateFrom.appendChild(spanFrom);
								divDateFrom.appendChild(dDate);
								$(ulDropDown).css("min-width", "195px");
							}
							else {
								divInput.appendChild(dDate);
							}
							if (this.control.FilterIsRange) {
								var divDateTo = document.createElement('div');
								divDateTo.setAttribute("class", "ColumnSettingsRangeContainer");
								var spanTo = document.createElement('span');
								spanTo.setAttribute("class", "ColumnSettingsRangeContainerSpan");
								spanTo.innerHTML = gx.getMessage(this.control.RangeFilterTo);
								divInput.appendChild(divDateTo);
								divDateTo.appendChild(spanTo);

								var dDateTo = document.createElement('div');
								dDateTo.setAttribute("id", this.control.ControlName + "DateDivTo");
								dDateTo.setAttribute("class", "ColumnSettingsRangeContainerDiv");
								divDateTo.appendChild(dDateTo);
							}
						} else {
							var searchElementId = "search_" + this.control.ControlName;
							var isRange = false;
							if (this.control.FilterIsRange) {
								var divFrom = document.createElement('div');
								divFrom.setAttribute("class", "ColumnSettingsRangeContainer");
								var spanFrom = document.createElement('span');
								spanFrom.setAttribute("class", "ColumnSettingsRangeContainerSpan");
								spanFrom.innerHTML = gx.getMessage(this.control.RangeFilterFrom);
								divFrom.appendChild(spanFrom);
								divInput.appendChild(divFrom);

								filterInput = document.createElement('input');
								divFrom.appendChild(filterInput);
								$(ulDropDown).css("min-width", "197px");
							} else {
								var divContainer = document.createElement('div');
								divContainer.setAttribute("class", "gx-attribute");
								divContainer.setAttribute("style", "margin-right:10px");
								var divInputGroup = document.createElement('div');
								divInputGroup.setAttribute("class", "input-group");
								divInputGroup.setAttribute("style", "width:123px");
								divContainer.appendChild(divInputGroup);
								divInput.appendChild(divContainer);

								searchAsButton = false;

								filterInput = document.createElement('input');
								divInputGroup.appendChild(filterInput);
							}
							if (this.control.FilterIsRange) {
								var divTo = document.createElement('div');
								divTo.setAttribute("class", "ColumnSettingsRangeContainer");
								var spanTo = document.createElement('span');
								spanTo.setAttribute("class", "ColumnSettingsRangeContainerSpan");
								spanTo.innerHTML = gx.getMessage(this.control.RangeFilterTo);
								divTo.appendChild(spanTo);
								divInput.appendChild(divTo);

								filterInputTo = document.createElement('input');
								divTo.appendChild(filterInputTo);
								this.CreateFilterInput(this.control.FilteredTextTo, liDropDownItem, filterInputTo, filterInput, filterInputTo, true, searchElementId, triggerButtonId);
								isRange = true;
							}
							this.CreateFilterInput(this.control.FilteredText, liDropDownItem, filterInput, filterInput, filterInputTo, isRange, searchElementId, triggerButtonId);
						}

						if (!this.control.IncludeDataList || this.control.DataListType == "Dynamic" && this.control.TitleControlIdToReplace != '') {
							var inputButtonFind = document.createElement('input');
							if (!searchAsButton) {
								var spanSearchContainer = document.createElement('span');
								spanSearchContainer.setAttribute("class", "input-group-btn");
								divInputGroup.appendChild(spanSearchContainer);
								var aSearchContainer = document.createElement('a');
								aSearchContainer.setAttribute("id", searchElementId);
								aSearchContainer.setAttribute("class", "btn btn-default");
								spanSearchContainer.appendChild(aSearchContainer);
								var imgSearchContainer = document.createElement('img');
								imgSearchContainer.setAttribute("src", this.control.DropDownOptionsTitleSettingsIcons["OptionApplyFilter_GXI"]);
								imgSearchContainer.setAttribute("class", "Image");
								aSearchContainer.appendChild(imgSearchContainer);

								$(aSearchContainer).bind("click", function (thisC) {
									return function (e) {
										thisC.SetActiveEventKey('<#Filter#>');
										if (thisC.IsDate()) {
											thisC.DetachAuxDateVariable(thisC.GetDateFilterVariable() + "_dp_container");
											thisC.SetSelectedValue('');
											thisC.SetSelectedText('');
											thisC.SetFilteredText($('#' + thisC.GetDateFilterVariable()).val());
											if (thisC.control.FilterIsRange) {
												thisC.DetachAuxDateVariable(thisC.GetDateFilterVariableTo() + "_dp_container");
												thisC.SetFilteredTextTo($('#' + thisC.GetDateFilterVariableTo()).val());
											}
										} else {
											var emptyVal = '';
											if (thisC.control.AllowMultipleSelection) {
												emptyVal = '[]';
											}
											thisC.SetSelectedValue(emptyVal);
											thisC.SetSelectedText(emptyVal);
											thisC.SetFilteredText($(filterInput).val());
											if (thisC.control.FilterIsRange) {
												thisC.DetachAuxDateVariable(thisC.GetDateFilterVariableTo() + "_dp_container");
												thisC.SetFilteredTextTo($(filterInputTo).val());
											}
										}
									}
								}(this));
								if (this.control.OnOptionClicked)
									$(aSearchContainer).bind("click", this.control.OnOptionClicked);
							}
							else {
								inputButtonFind.setAttribute("id", searchElementId);
								inputButtonFind.setAttribute("type", "button");
								inputButtonFind.setAttribute("value", gx.getMessage(this.control.SearchButtonText));
								inputButtonFind.setAttribute("class", "btn btn-default Button");

								$(inputButtonFind).bind("click", function (thisC) {
									return function (e) {
										thisC.SetActiveEventKey('<#Filter#>');
										if (thisC.IsDate()) {
											thisC.DetachAuxDateVariable(thisC.GetDateFilterVariable() + "_dp_container");
											thisC.SetSelectedValue('');
											thisC.SetSelectedText('');
											thisC.SetFilteredText($('#' + thisC.GetDateFilterVariable()).val());
											if (thisC.control.FilterIsRange) {
												thisC.DetachAuxDateVariable(thisC.GetDateFilterVariableTo() + "_dp_container");
												thisC.SetFilteredTextTo($('#' + thisC.GetDateFilterVariableTo()).val());
											}
										} else {
											if (thisC.control.AllowMultipleSelection) {
												thisC.SetSelectedValue(JSON.stringify(thisC.SelectedValue_getAUX, null, 2));
												thisC.SetSelectedText(JSON.stringify(thisC.SelectedText_getAUX, null, 2));
											} else {
												thisC.SetSelectedValue('');
												thisC.SetSelectedText('');
												thisC.SetFilteredText($(filterInput).val());
												if (thisC.control.FilterIsRange) {
													thisC.DetachAuxDateVariable(thisC.GetDateFilterVariableTo() + "_dp_container");
													thisC.SetFilteredTextTo($(filterInputTo).val());
												}
											}
										}
									}
								}(this));
								if (this.control.OnOptionClicked)
									$(inputButtonFind).bind("click", this.control.OnOptionClicked);
								divInput.appendChild(inputButtonFind);
							}


						}

						liFilterInput.appendChild(divInput);
						ulDropDown.appendChild(liFilterInput);
					}
					//input search LI - End

					//List Fixed Values - Start
					if (this.control.IncludeDataList && this.control.DataListType == "FixedValues") {
						this.LoadListFixedValues(liDropDownItem, false);
					}
					//List Fixed Values - End

					var liLisItem = liDropDownItem;
					if (this.control.AllowMultipleSelection) {
						//input search checked LI - Start
						var inputButtonFind = document.createElement('input');
						inputButtonFind.setAttribute("type", "button");
						inputButtonFind.setAttribute("value", gx.getMessage(this.control.SearchButtonText));
						inputButtonFind.setAttribute("class", "btn btn-default Button");

						$(inputButtonFind).bind("click", function (thisC) {
							return function (e) {
								thisC.SetActiveEventKey('<#Filter#>');
								thisC.SetSelectedValue(JSON.stringify(thisC.SelectedValue_getAUX, null, 2));
								thisC.SetSelectedText(JSON.stringify(thisC.SelectedText_getAUX, null, 2));
								thisC.SetFilteredText('');
							}
						}(this));
						if (this.control.OnOptionClicked)
							$(inputButtonFind).bind("click", this.control.OnOptionClicked);

						var liFindSelected = document.createElement('li');
						liFindSelected.setAttribute("class", "LiFilterSelected");
						liFindSelected.appendChild(inputButtonFind);

						ulDropDown.appendChild(liDropDownItem);
						liDropDownItem = null;

						ulDropDown.appendChild(liFindSelected);
						//input search checked LI - End
					}

					$(triggerButton).bind("click", function (thisC) {
						return function (e) {
							if ($("#" + thisC.containerToDrawName).attr('class').indexOf(' open') == -1) {
								var inputVal;
								var inputValTo;
								if (thisC.control.AllowMultipleSelection) {
									thisC.SelectedValue_getAUX = thisC.control.SelectedValue_get != null && thisC.control.SelectedValue_get != '' ? JSON.parse(thisC.control.SelectedValue_get) : [];
									thisC.SelectedText_getAUX = thisC.control.SelectedText_get != null && thisC.control.SelectedText_get != '' ? JSON.parse(thisC.control.SelectedText_get) : [];
									try {
										//specific code for dynamic fitler
										if ($("#" + thisC.containerToDrawName).parent().next().children()[0].childNodes[1].className == "bootstrap-tagsinput") {
											var tagsInput = $("#" + thisC.containerToDrawName).parent().next().children()[0].childNodes[1];
											if ($(tagsInput).css("min-width") == "0px") {
												$(tagsInput).css("min-width", "150px");
												$("#" + thisC.containerToDrawName).off('hide.bs.dropdown').on('hide.bs.dropdown', function (thisC) {
													return function (e) {
														$(tagsInput).css("min-width", "0px");
														return true;
													}
												}(thisC));
											}

										}
									} catch (e) { }
								}
								if (thisC.control.IncludeFilter) {
									if (thisC.IsDate()) {
										$("#" + thisC.containerToDrawName).off('hide.bs.dropdown').on('hide.bs.dropdown', function (thisC) {
											return function (e) {
												return thisC.OnDDOClosing();
											}
										}(thisC));
										if (thisC.control.FilteredText == "") {
											var inputValDate = $('#' + thisC.GetDateFilterVariable()).get(0);
											thisC.control.FilteredText = $(inputValDate).val();
											for (var dig = 0; dig < 10; dig += 1) {
												thisC.control.FilteredText = replaceAll(thisC.control.FilteredText, dig.toString(), ' ');
											}
										}
										var auxDate = thisC.AttachAuxDateVariable(liRemoveFilter, thisC.GetDateFilterVariable(), thisC.control.ControlName + "DateDiv", thisC.control.FilteredText, searchElementId, triggerButtonId);
										inputVal = auxDate;
										inputValTo = null;
										if (thisC.control.FilterIsRange) {
											if (thisC.control.FilteredTextTo == "") {
												var inputValDate = $('#' + thisC.GetDateFilterVariable()).get(0);
												thisC.control.FilteredTextTo = $(inputValDate).val();
												for (var dig = 0; dig < 10; dig += 1) {
													thisC.control.FilteredTextTo = replaceAll(thisC.control.FilteredTextTo, dig.toString(), ' ');
												}
											}
											auxDate = thisC.AttachAuxDateVariable(liRemoveFilter, thisC.GetDateFilterVariableTo(), thisC.control.ControlName + "DateDivTo", thisC.control.FilteredTextTo, searchElementId, triggerButtonId);
											inputValTo = auxDate;
										}
									} else {
										inputVal = filterInput;
										inputValTo = null;
										if (thisC.control.IncludeDataList && thisC.control.DataListType == "FixedValues") {
											$(filterInput).val('');
											if (thisC.control.AllowMultipleSelection) {
												thisC.LoadListFixedValues(liLisItem, true);
											} else {
												thisC.updateFixedValuesList2(liLisItem, '');
											}
										} else {
											var filterdText = thisC.control.FilteredText.trim();
											if (thisC.control.DataListType == "Dynamic (with fixedValues)") {
												$(filterInput).val('');
											} else {
												$(filterInput).val(filterdText);
											}
										}
										if (thisC.control.FilterIsRange) {
											$(filterInputTo).val(thisC.control.FilteredTextTo.trim());
											inputValTo = filterInputTo;
										}
									}
								} else if (thisC.reloadListFixedValuesOnDDOOpen || thisC.includeFirstSelectedItem) {
									if (thisC.control.AllowMultipleSelection) {
										thisC.LoadListFixedValues(liLisItem, true);
									} else {
										thisC.updateFixedValuesList2(liLisItem, '');
									}
								}
								if (thisC.control.IncludeDataList && thisC.control.DataListType.indexOf("Dynamic") == 0) {
									thisC.updateFilterList(liLisItem, inputVal, inputValTo, false);
								}
							}
						}
					}(this));
				} else {
					var aDropDownItem = document.createElement('a');
					var spanDropDownItem = document.createElement('span');
					$(spanDropDownItem).text(item["Title"]);
					if (this.control.UseAsGridTitleSetting && ((this.control.IncludeSortASC && item["EventKey"] == "<#OrderASC#>" && this.control.SortedStatus == "ASC")
															|| (this.control.IncludeSortASC && item["EventKey"] == "<#OrderDSC#>" && this.control.SortedStatus == "DSC"))) {
						spanDropDownItem.innerHTML = '<strong>' + spanDropDownItem.innerHTML + '</strong>';
					}

					var dropDownOptions = this;

					//set onclick event
					var aJSonclickEvent = item["JSonclickEvent"];
					if (aJSonclickEvent.length > 0) {
						$(aDropDownItem).bind("click", function (oc) {
							return function (e) {
								var result = eval(oc);
								if (!result) {
									e.stopImmediatePropagation();
									$("#" + dropDownOptions.containerToDrawName).removeClass('open');
								}
							}
						}(aJSonclickEvent));
					}

					//set link url
					if (item["Link"].length > 0) {
						aDropDownItem.setAttribute("href", item["Link"]);
					}
						//or set event key and onclick handler
					else {
						aDropDownItem.setAttribute("href", "#");
						//to keep URLs
						if (!navigator.appVersion.toLowerCase().match('msie 8') && !navigator.appVersion.toLowerCase().match('msie 7') && !navigator.appVersion.toLowerCase().match('msie 9')) {
							aDropDownItem.setAttribute("data-toggle", "dropdown");
						}
						var eventKey = item["EventKey"];
						$(aDropDownItem).bind("click", function (ek) {
							return function () {
								if (dropDownOptions.control.IncludeDataList && dropDownOptions.ajaxCall != null) {
									dropDownOptions.ajaxCall.abort();
								}
								if (dropDownOptions.control.IncludeDataList && dropDownOptions.ajaxCall2 != null) {
									dropDownOptions.ajaxCall2.abort();
								}
								dropDownOptions.SetActiveEventKey(ek);
								if (dropDownOptions.control.OnOptionClicked
									&& dropDownOptions.control.IncludeFilter
									&& dropDownOptions.IsDate()) {
									dropDownOptions.DetachAuxDateVariable(dropDownOptions.GetDateFilterVariable() + "_dp_container");
									if (dropDownOptions.control.FilterIsRange) {
										dropDownOptions.DetachAuxDateVariable(dropDownOptions.GetDateFilterVariableTo() + "_dp_container");
									}
								}
							}
						}(eventKey));
						if (this.control.OnOptionClicked)
							$(aDropDownItem).bind("click", this.control.OnOptionClicked);
					}

					if (item["Tooltip"].length > 0)
						aDropDownItem.setAttribute("title", item["Tooltip"]);

					if (images) {
						aDropDownItem.className = "image";
						if (item["Icon"] != null && item["Icon"].length > 0) {
							var imgDropDownItem = document.createElement('img');
							imgDropDownItem.setAttribute("src", item["Icon"]);
							aDropDownItem.appendChild(imgDropDownItem);
						}
						else if (item["FontIcon"] != null && item["FontIcon"].length > 0) {
							var imgDropDownItem = document.createElement('i');
							imgDropDownItem.className = item["FontIcon"];
							aDropDownItem.appendChild(imgDropDownItem);
						}
						else {
							spanDropDownItem.className = "no-image";
						}
					}

					if (item["ThemeClass"] != null && item["ThemeClass"].length > 0) {
						liDropDownItem.className = item["ThemeClass"];
					}

					aDropDownItem.appendChild(spanDropDownItem);
					liDropDownItem.appendChild(aDropDownItem);
				}
			}
			if (liDropDownItem != null) {
				ulDropDown.appendChild(liDropDownItem);
			}
		}

		if (this.control.DropDownOptionsType == "GridColumnsSelector") {
			var liDropDownItem = document.createElement('li');

			var divInput = document.createElement('div');
			divInput.setAttribute("style", "display: block; margin-right:10px;margin-left:10px;padding-bottom:10px");

			var divContainer = document.createElement('div');
			divContainer.setAttribute("class", "gx-attribute");
			divContainer.setAttribute("style", "margin-right:10px");
			var divInputGroup = document.createElement('div');
			divInputGroup.setAttribute("class", "input-group");
			divInputGroup.setAttribute("style", "width:123px");
			divContainer.appendChild(divInputGroup);
			divInput.appendChild(divContainer);

			searchAsButton = false;

			filterInput = document.createElement('input');
			divInputGroup.appendChild(filterInput);
			liDropDownItem.appendChild(divInput);
			ulDropDown.appendChild(liDropDownItem);

			liDropDownItem = document.createElement('li');

			this.CreateFilterInput(this.control.FilteredText, liDropDownItem, filterInput, filterInput, filterInputTo, isRange, searchElementId, triggerButtonId);
			var divFixedValues = document.createElement('div');
			divFixedValues.className = "FilterOptions FilterOptionsMultiSelection";
			var ulColumns = document.createElement('ul');

			this.loadColumnsSelectorValues(ulColumns);

			divFixedValues.appendChild(ulColumns);

			liDropDownItem.appendChild(divFixedValues);
			ulDropDown.appendChild(liDropDownItem);

			liDropDownItem = document.createElement('li');
			var inputButtonFind = document.createElement('input');
			inputButtonFind.setAttribute("type", "button");
			inputButtonFind.setAttribute("value", gx.getMessage(this.control.UpdateButtonText));
			inputButtonFind.setAttribute("class", "btn btn-default Button");

			$(inputButtonFind).bind("click", function (thisC) {
				return function (e) {
					thisC.control.ColumnsSelectorValues = JSON.stringify(thisC.ColumnsSelectorData_Aux, null, 2)
					thisC.control.DropDownOptionsData = thisC.ColumnsSelectorData_Aux;
				}
			}(this));
			if (this.control.OnColumnsChanged)
				$(inputButtonFind).bind("click", this.control.OnColumnsChanged);

			var liFindSelected = document.createElement('li');
			liFindSelected.setAttribute("class", "LiFilterSelected");
			liFindSelected.appendChild(inputButtonFind);

			ulDropDown.appendChild(liDropDownItem);
			liDropDownItem = null;

			ulDropDown.appendChild(liFindSelected);


			$(triggerButton).bind("click", function (thisC) {
				return function (e) {
					thisC.ColumnsSelectorData_Aux = JSON.parse(JSON.stringify(thisC.control.DropDownOptionsData, null, 2));
					$(filterInput).val('');
					thisC.loadColumnsSelectorValues(ulColumns);
				}
			}(this));
		}
		if (triggerButtonIcon != null || this.control.Icon.length > 0) {
			var triggerButtonImage = document.createElement('img');
			if (triggerButtonIcon != null) {
				triggerButtonImage.setAttribute("src", triggerButtonIcon);
			} else {
				triggerButtonImage.setAttribute("src", this.control.Icon);
			}
			triggerButton.appendChild(triggerButtonImage);
		}
		if (this.control.Caption.length > 0) {
			var triggerButtonSpan = document.createElement('span');
			triggerButtonSpan.innerHTML = this.control.Caption;
			triggerButton.appendChild(triggerButtonSpan);
		}
		triggerButton.appendChild(caretTriggerButton);
		$("#" + this.containerToDrawName).append(triggerButton);
		$("#" + this.containerToDrawName).append(ulDropDown);

		this.ShowHideControl();

	}

	this.loadColumnsSelectorValues = function (ulColumns) {
		$(ulColumns).html('')
		for (var index1 = 0; index1 < 2; index1 += 1) {
			var coll;
			if (index1 == 0) {
				coll = this.control.DropDownOptionsData.VisibleColumns;
			}
			else {
				coll = this.control.DropDownOptionsData.InvisibleColumns;
			}
			for (var index2 = 0; index2 < coll.length; index2 += 1) {
				var option = coll[index2];
				var optionVal = option.ColumnName;
				var optionText = optionVal;
				var liFilters = document.createElement('li');
				var aLiFilters = document.createElement('a');
				var spanLiFilters = document.createElement('span');
				var optionTextOriginal = optionText;
				optionText = gx.getMessage(optionTextOriginal);
				spanLiFilters.setAttribute('dsc', optionText);
				var isSelected = (index1 == 0);
				if (isSelected) {
					aLiFilters.setAttribute('sel', 'T');
				}
				spanLiFilters.innerHTML = optionText;

				if (isSelected) {
					$(aLiFilters).css("background-image", "url(" + this.control.DropDownOptionsTitleSettingsIcons["MultiselSelOption_GXI"] + ")");
				} else {
					$(aLiFilters).css("background-image", "url(" + this.control.DropDownOptionsTitleSettingsIcons["MultiselOption_GXI"] + ")");
				}
				$(aLiFilters).css("background-repeat", "no-repeat");
				$(aLiFilters).css("background-position", "5px 60%");

				aLiFilters.setAttribute("href", "#");
				//to keep URLs
				if (!navigator.appVersion.toLowerCase().match('msie 8') && !navigator.appVersion.toLowerCase().match('msie 7') && !navigator.appVersion.toLowerCase().match('msie 9')) {
					aLiFilters.setAttribute("data-toggle", "dropdown");
				}

				var thisC = this;
				$(aLiFilters).bind("click", function (ek, txt) {
					return function () {
						if (this.getAttribute('sel') == 'T') {
							this.setAttribute('sel', '');
							var selItemIndex = -1;
							for (var k = 0; k < thisC.ColumnsSelectorData_Aux.VisibleColumns.length; k += 1) {
								if (thisC.ColumnsSelectorData_Aux.VisibleColumns[k].ColumnName == ek) {
									selItemIndex = k;
									break;
								}
							}
							if (selItemIndex >= 0) {
								thisC.ColumnsSelectorData_Aux.VisibleColumns.splice(selItemIndex, 1)
								thisC.ColumnsSelectorData_Aux.InvisibleColumns.push({ ColumnName: ek })
								$(this).css("background-image", "url(" + thisC.control.DropDownOptionsTitleSettingsIcons["MultiselOption_GXI"] + ")");
							}
						} else {
							this.setAttribute('sel', 'T');
							var selItemIndex = -1;
							for (var k = 0; k < thisC.ColumnsSelectorData_Aux.InvisibleColumns.length; k += 1) {
								if (thisC.ColumnsSelectorData_Aux.InvisibleColumns[k].ColumnName == ek) {
									selItemIndex = k;
									break;
								}
							}
							if (selItemIndex >= 0) {
								thisC.ColumnsSelectorData_Aux.InvisibleColumns.splice(selItemIndex, 1)
								thisC.ColumnsSelectorData_Aux.VisibleColumns.push({ ColumnName: ek })
								$(this).css("background-image", "url(" + thisC.control.DropDownOptionsTitleSettingsIcons["MultiselSelOption_GXI"] + ")");
							}
						}
					}
				}(optionVal, optionText));

				$(aLiFilters).bind("click", function (e) {
					e.stopPropagation();
				});

				aLiFilters.appendChild(spanLiFilters);
				liFilters.appendChild(aLiFilters);
				ulColumns.appendChild(liFilters);
			}
		}
	}

	this.IsValueEmpty = function (val) {
		return val == '' || this.IsDate() && val.replace('/', '').replace('/', '').trim() == ''
			|| this.control.AllowMultipleSelection && val == '[]';
	}

	this.minIndexForSelectedItemFirst = 4;
	this.includeFirstSelectedItem = false;
	this.reloadListFixedValuesOnDDOOpen = false;
	this.LoadListFixedValues = function (liDropDownItem, isReload) {
		var divFixedValues;
		if (isReload) {
			divFixedValues = liDropDownItem.childNodes[0];
			divFixedValues.removeChild(divFixedValues.childNodes[0]);
		} else {
			divFixedValues = document.createElement('div');
			if (this.control.AllowMultipleSelection) {
				divFixedValues.className = "FilterOptions FilterOptionsMultiSelection";
			}
			else {
				divFixedValues.className = "FilterOptions";
			}
		}
		var optionsText = this.control.DataListFixedValues;
		optionsText = replaceAll(optionsText, '\\\\', '[\\\\]');
		optionsText = replaceAll(optionsText, '\\,', '[\\\\\\]');
		if (optionsText.trim() == '') {
			optionsText = "Error\\: Filter with Data List as 'Filter Values' must have a non empty Filter Value."
		}
		var optionsTextSplitted = optionsText.split(',');
		var ulFixedValues = document.createElement('ul');

		if (optionsTextSplitted.length > this.minIndexForSelectedItemFirst && !this.control.AllowMultipleSelection) {
			this.reloadListFixedValuesOnDDOOpen = true;
			this.includeFirstSelectedItem = true;
			var liFilters = document.createElement('li');
			var aLiFilters = document.createElement('a');
			var spanLiFilters = document.createElement('span');
			$(aLiFilters).css("background-image", "url(" + this.control.DropDownOptionsTitleSettingsIcons["SelectedOption_GXI"] + ")");
			$(aLiFilters).css("background-repeat", "no-repeat");
			$(aLiFilters).css("background-position", "10px 60%");
			$(liFilters).css("display", "none");

			aLiFilters.setAttribute("href", "#");
			//to keep URLs
			if (!navigator.appVersion.toLowerCase().match('msie 8') && !navigator.appVersion.toLowerCase().match('msie 7') && !navigator.appVersion.toLowerCase().match('msie 9')) {
				aLiFilters.setAttribute("data-toggle", "dropdown");
			}

			var dropDownOptions = this;
			$(aLiFilters).bind("click", function (ek) {
				return function () {
					dropDownOptions.SetActiveEventKey('<#Filter#>');
				}
			}(null));
			if (this.control.OnOptionClicked)
				$(aLiFilters).bind("click", this.control.OnOptionClicked);

			aLiFilters.appendChild(spanLiFilters);
			liFilters.appendChild(aLiFilters);
			ulFixedValues.appendChild(liFilters);
		} else if (this.control.IncludeFilter || this.control.AllowMultipleSelection) {
			this.reloadListFixedValuesOnDDOOpen = true;
		}

		var positionToInsert = 0;
		for (var index2 = 0; index2 < optionsTextSplitted.length; index2 += 1) {
			var option = optionsTextSplitted[index2];
			option = replaceAll(option, '[\\\\\\]', ',');
			option = replaceAll(option, '\\:', '[\\\\\\]');
			var optionTextSplitted = option.split(':');
			var optionVal = optionTextSplitted[0];
			optionVal = replaceAll(optionVal, '[\\\\\\]', ':');
			optionVal = replaceAll(optionVal, '[\\\\]', '\\');
			var optionText;
			if (optionTextSplitted.length > 1) {
				optionText = optionTextSplitted[1];
				optionText = replaceAll(optionText, '[\\\\\\]', ':');
				optionText = replaceAll(optionText, '[\\\\]', '\\');
			} else {
				optionText = optionVal;
			}
			var liFilters = document.createElement('li');
			var aLiFilters = document.createElement('a');
			var spanLiFilters = document.createElement('span');
			var optionTextOriginal = optionText;
			optionText = gx.getMessage(optionTextOriginal);
			spanLiFilters.setAttribute('dsc', optionText);
			var isSelected = false;
			if (this.control.AllowMultipleSelection) {
				for (var k = 0; k < this.SelectedValue_getAUX.length; k += 1) {
					if (this.SelectedValue_getAUX[k] == optionVal) {
						isSelected = true;
						break;
					}
				}
			} else {
				isSelected = (optionVal == this.control.SelectedValue.trim());
			}
			if (isSelected) {
				aLiFilters.setAttribute('sel', 'T');
				if (this.control.AllowMultipleSelection) {
					spanLiFilters.innerHTML = optionText;
				} else {
					spanLiFilters.innerHTML = '<strong>' + optionText + '</strong>';
					if (!this.includeFirstSelectedItem) {
						$(aLiFilters).css("background-image", "url(" + this.control.DropDownOptionsTitleSettingsIcons["SelectedOption_GXI"] + ")");
						$(aLiFilters).css("background-repeat", "no-repeat");
						$(aLiFilters).css("background-position", "10px 60%");
					}
				}
			} else {
				spanLiFilters.innerHTML = optionText;
			}

			if (this.control.AllowMultipleSelection) {
				if (isSelected) {
					$(aLiFilters).css("background-image", "url(" + this.control.DropDownOptionsTitleSettingsIcons["MultiselSelOption_GXI"] + ")");
				} else {
					$(aLiFilters).css("background-image", "url(" + this.control.DropDownOptionsTitleSettingsIcons["MultiselOption_GXI"] + ")");
				}
				$(aLiFilters).css("background-repeat", "no-repeat");
				$(aLiFilters).css("background-position", "5px 60%");
			}

			aLiFilters.setAttribute("href", "#");
			//to keep URLs
			if (!navigator.appVersion.toLowerCase().match('msie 8') && !navigator.appVersion.toLowerCase().match('msie 7') && !navigator.appVersion.toLowerCase().match('msie 9')) {
				aLiFilters.setAttribute("data-toggle", "dropdown");
			}

			var thisC = this;
			$(aLiFilters).bind("click", function (ek, txt) {
				return function () {
					if (thisC.control.AllowMultipleSelection) {
						if (this.getAttribute('sel') == 'T') {
							this.setAttribute('sel', '');
							var selItemIndex = -1;
							for (var k = 0; k < thisC.SelectedValue_getAUX.length; k += 1) {
								if (thisC.SelectedValue_getAUX[k] == ek) {
									selItemIndex = k;
									break;
								}
							}
							if (selItemIndex >= 0) {
								thisC.SelectedValue_getAUX.splice(selItemIndex, 1);
								thisC.SelectedText_getAUX.splice(selItemIndex, 1);
							}
							$(this).css("background-image", "url(" + thisC.control.DropDownOptionsTitleSettingsIcons["MultiselOption_GXI"] + ")");
						} else {
							this.setAttribute('sel', 'T');
							thisC.SelectedValue_getAUX.push(ek);
							thisC.SelectedText_getAUX.push(txt);
							$(this).css("background-image", "url(" + thisC.control.DropDownOptionsTitleSettingsIcons["MultiselSelOption_GXI"] + ")");
						}
					} else {
						thisC.SetActiveEventKey('<#Filter#>');
						thisC.SetSelectedValue(ek);
						thisC.SetSelectedText(txt);
						thisC.SetFilteredText('');
						if (thisC.control.FilterIsRange) {
							thisC.SetFilteredTextTo('');
						}
					}
				}
			}(optionVal, optionText));

			if (this.control.AllowMultipleSelection) {
				$(aLiFilters).bind("click", function (e) {
					e.stopPropagation();
				});
			} else if (this.control.OnOptionClicked) {
				$(aLiFilters).bind("click", this.control.OnOptionClicked);
			}

			aLiFilters.appendChild(spanLiFilters);
			liFilters.appendChild(aLiFilters);
			if (isSelected && this.control.AllowMultipleSelection && optionsTextSplitted.length > this.minIndexForSelectedItemFirst) {
				ulFixedValues.insertBefore(liFilters, ulFixedValues.childNodes[positionToInsert]);
				positionToInsert++;
			}
			else {
				ulFixedValues.appendChild(liFilters);
			}
		}
		if (this.control.IncludeFilter) {
			var liFilters = document.createElement('li');
			var aLiFilters = document.createElement('a');
			var spanLiFilters = document.createElement('span');
			spanLiFilters.innerHTML = gx.getMessage(this.control.NoResultsFound);
			$(liFilters).css("display", "none");

			aLiFilters.setAttribute("href", "#");
			//to keep URLs
			if (!navigator.appVersion.toLowerCase().match('msie 8') && !navigator.appVersion.toLowerCase().match('msie 7') && !navigator.appVersion.toLowerCase().match('msie 9')) {
				aLiFilters.setAttribute("data-toggle", "dropdown");
			}

			$(aLiFilters).bind("click", function (e) {
				e.stopPropagation();
			});

			aLiFilters.appendChild(spanLiFilters);
			liFilters.appendChild(aLiFilters);
			ulFixedValues.appendChild(liFilters);
		}
		divFixedValues.appendChild(ulFixedValues);
		if (!isReload) {
			liDropDownItem.appendChild(divFixedValues);
		}
	}

	this.LoadFixedFilters = function (liDropDownItem) {
		var divFixedValues = document.createElement('div');
		divFixedValues.className = "FilterOptions";
		var optionsText = this.control.FixedFilters;
		optionsText = replaceAll(optionsText, '\\\\', '[\\\\]');
		optionsText = replaceAll(optionsText, '\\,', '[\\\\\\]');
		var optionsTextSplitted = optionsText.split(',');

		var ulFixedValues = document.createElement('ul');
		for (var index2 = 0; index2 < optionsTextSplitted.length; index2 += 1) {
			var option = optionsTextSplitted[index2];
			option = replaceAll(option, '[\\\\\\]', ',');
			option = replaceAll(option, '\\:', '[\\\\\\]');
			var optionTextSplitted = option.split(':');
			var optionVal = optionTextSplitted[0];
			optionVal = replaceAll(optionVal, '[\\\\\\]', ':');
			optionVal = replaceAll(optionVal, '[\\\\]', '\\');
			var optionText;
			if (optionTextSplitted.length > 1) {
				optionText = optionTextSplitted[1];
				optionText = replaceAll(optionText, '[\\\\\\]', ':');
				optionText = replaceAll(optionText, '[\\\\]', '\\');
			} else {
				optionText = optionVal;
			}
			var liFilters = document.createElement('li');
			var aLiFilters = document.createElement('a');
			var spanLiFilters = document.createElement('span');
			spanLiFilters.setAttribute('dsc', optionText);
			var isSelected = (optionVal == this.control.SelectedFixedFilter.trim());
			if (isSelected) {
				aLiFilters.setAttribute('sel', 'T');
				spanLiFilters.innerHTML = '<strong>' + optionText + '</strong>';
				if (!this.includeFirstSelectedItem) {
					$(aLiFilters).css("background-image", "url(" + this.control.DropDownOptionsTitleSettingsIcons["SelectedOption_GXI"] + ")");
					$(aLiFilters).css("background-repeat", "no-repeat");
					$(aLiFilters).css("background-position", "10px 60%");
				}
			} else {
				spanLiFilters.innerHTML = optionText;
			}

			aLiFilters.setAttribute("href", "#");
			//to keep URLs
			if (!navigator.appVersion.toLowerCase().match('msie 8') && !navigator.appVersion.toLowerCase().match('msie 7') && !navigator.appVersion.toLowerCase().match('msie 9')) {
				aLiFilters.setAttribute("data-toggle", "dropdown");
			}

			var thisC = this;
			$(aLiFilters).bind("click", function (ek, txt) {
				return function () {
					thisC.control.SelectedFixedFilter = ek;
					thisC.SetActiveEventKey('<#FixedFilter:' + ek + '#>');
					thisC.SetSelectedValue('');
					thisC.SetSelectedText('');
					thisC.SetFilteredText('');
					if (thisC.control.FilterIsRange) {
						thisC.SetFilteredTextTo('');
					}
				}
			}(optionVal, optionText));

			$(aLiFilters).bind("click", this.control.OnOptionClicked);

			aLiFilters.appendChild(spanLiFilters);
			liFilters.appendChild(aLiFilters);
			ulFixedValues.appendChild(liFilters);
		}
		divFixedValues.appendChild(ulFixedValues);
		liDropDownItem.appendChild(divFixedValues);
	}

	this.OnDDOClosing = function () {
		var calendarV = false;
		var cals = $('.calendar');
		for (var i = 0; i < cals.length; i++) {
			if ($(cals[i]).is(":visible")) {
				calendarV = true;
				break;
			}
		}
		if (calendarV) {
			return false;
		} else {
			if (this.calendarOpened) {
				this.calendarOpened = false;
				return false;
			}
		}
		this.DetachAuxDateVariable(this.GetDateFilterVariable() + "_dp_container");
		if (this.control.FilterIsRange) {
			this.DetachAuxDateVariable(this.GetDateFilterVariableTo() + "_dp_container");
		}
		return true;
	}

	this.AttachAuxDateVariable = function (liRemoveFilter, varName, dateDivName, dateVal, idSearchButton, idOptions) {
		var dateContainer = $("#" + varName + "_dp_container").detach();
		dateContainer.appendTo("#" + dateDivName);
		var inputVal = $('#' + varName).get(0);
		$(inputVal).prop("class", "form-control AttributeDate")
		$(inputVal).val(dateVal);

		$(inputVal).bind("click", function (e) {
			e.stopPropagation();
		});

		$(inputVal).keydown(function (event) {

			if (event.keyCode == 13) {
				event.stopPropagation();
				var btnSearch = document.getElementById(idSearchButton);
				$(btnSearch).click();
				document.getElementById(idOptions).focus();
			}
		});

		$('#' + varName + '_dp_trigger').bind("click", function (thisC) {
			return function () {
				$('.calendar').css("z-index", "1001");
				thisC.calendarOpened = true;
			}
		}(this));
		return inputVal;
	}

	this.CreateFilterInput = function (filteredText, liDropDownItem, filterInput, filterInputFrom, filterInputTo, isRange, elemSearchId, idOptions) {
		filterInput.className = "form-control Attribute";
		filterInput.setAttribute("type", "text");
		filterInput.setAttribute("maxlength", "40");
		if (isRange) {
			filterInput.setAttribute("style", "width: 125px;padding-right: 0px;height: 28px;float: right;");
		}
		if (this.control.DataListType.indexOf("Dynamic") == 0) {
			filterInput.setAttribute("value", filteredText);
		}

		$(filterInput).bind("click", function (e) {
			e.stopPropagation();
		});

		$(filterInput).keydown(function (event) {

			if (event.keyCode == 13) {
				event.stopPropagation();
				var elemSearch = document.getElementById(elemSearchId);
				$(elemSearch).click();
				document.getElementById(idOptions).focus();
			}
		});

		if (this.control.IncludeDataList || this.control.DropDownOptionsType == "GridColumnsSelector") {
			$(filterInput).on("input", function (thisC) {
				return function (e) {
					if (thisC.myT != null) {
						clearInterval(thisC.myT);
					}
					thisC.myT = setInterval(function () {
						clearInterval(thisC.myT);
						if (thisC.control.DropDownOptionsType == "GridColumnsSelector") {
							thisC.updateColumnsSelectorList(liDropDownItem, $(filterInput).val());
						} else if (thisC.control.DataListType == "Dynamic") {
							thisC.updateFilterList(liDropDownItem, filterInputFrom, filterInputTo, true);
						} else if (thisC.control.DataListType == "Dynamic (with fixedValues)") {
							if (thisC.procResult == null) {
								thisC.updateFilterList(liDropDownItem, null, null, true);
							}
							thisC.ProcessProcResult(thisC.procResult, liDropDownItem, null, null, $(filterInputFrom).val(), true);
						} else if (!thisC.control.FilterIsRange) {
							thisC.updateFixedValuesList(liDropDownItem, filterInput);
						}
					}, 300);
				}
			}(this));
		}
		if (this.control.FilterType == 'Numeric' && this.control.DataListType != "Dynamic (with fixedValues)" && this.control.DataListType != "FixedValues") {
			$(filterInput).keypress(function (e) {
				//if the letter is not digit then don't type anything
				if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
					return false;
				}
			});
		}
	}

	this.updateFixedValuesList = function (liDropDownItem, filterInput) {
		var searchTxt = $(filterInput).val();
		this.updateFixedValuesList2(liDropDownItem, searchTxt);
	}

	this.updateFixedValuesList2 = function (liDropDownItem, searchTxt) {
		var ulNode = liDropDownItem.childNodes[0].childNodes[0];
		var found = 0;
		var selTitle = '';
		var showSelectedItemFirst = false;
		var index = 0;
		if (this.includeFirstSelectedItem) {
			index += 1;
		}
		var length = ulNode.childNodes.length;
		var isDynamic = (this.control.DataListType.indexOf("Dynamic") == 0);
		if (this.control.IncludeFilter) {
			length -= 1;
		}
		for (; index < length; index += 1) {
			var aLiFilters = ulNode.childNodes[index].childNodes[0]
			var spanNode = aLiFilters.childNodes[0];
			var title = spanNode.getAttribute('dsc');
			if (searchTxt != null && searchTxt.length > 0) {
				var ind = title.toLowerCase().indexOf(searchTxt.toLowerCase());
				if (ind >= 0) {
					title = title.substring(0, ind) + '<strong>' + title.substring(ind, ind + searchTxt.length) + '</strong>' + title.substring(ind + searchTxt.length);
					var dscSufix = spanNode.getAttribute('dscSuffix');
					if (dscSufix != null) {
						spanNode.innerHTML = title + dscSufix;
					} else {
						spanNode.innerHTML = title;
					}
					$(spanNode.parentNode.parentNode).css("display", "");
					found++;
				} else {
					$(spanNode.parentNode.parentNode).css("display", "none");
				}
			} else {
				var isSelected = (aLiFilters.getAttribute('sel') == 'T');
				if (this.control.AllowMultipleSelection) {
					$(spanNode.parentNode.parentNode).css("display", "");
					var dscSufix = spanNode.getAttribute('dscSuffix');
					if (dscSufix != null) {
						spanNode.innerHTML = title + dscSufix;
					} else {
						spanNode.innerHTML = title;
					}
					if (isSelected) {
						$(aLiFilters).css("background-image", "url(" + this.control.DropDownOptionsTitleSettingsIcons["MultiselSelOption_GXI"] + ")");
					} else {
						$(aLiFilters).css("background-image", "url(" + this.control.DropDownOptionsTitleSettingsIcons["MultiselOption_GXI"] + ")");
					}
				} else {
					if (isSelected) {
						spanNode.innerHTML = '<strong>' + title + '</strong>';
						if (index - 1 >= this.minIndexForSelectedItemFirst) {
							$(spanNode.parentNode.parentNode).css("display", "none");
							showSelectedItemFirst = true;
							selTitle = spanNode.innerHTML;
						} else {
							$(spanNode.parentNode.parentNode).css("display", "");
							$(spanNode.parentNode).css("background-image", "url(" + this.control.DropDownOptionsTitleSettingsIcons["SelectedOption_GXI"] + ")");
							$(spanNode.parentNode).css("background-repeat", "no-repeat");
							$(spanNode.parentNode).css("background-position", "10px 60%");
						}
					} else {
						var dscSufix = spanNode.getAttribute('dscSuffix');
						if (dscSufix != null) {
							spanNode.innerHTML = title + dscSufix;
						} else {
							spanNode.innerHTML = title;
						}
						$(spanNode.parentNode.parentNode).css("display", "");
						if (index - 1 >= this.minIndexForSelectedItemFirst) {
							$(spanNode.parentNode).css("background-image", "");
							$(spanNode.parentNode).css("background-repeat", "");
							$(spanNode.parentNode).css("background-position", "");
						}
					}
				}
				found++;
			}
		}
		if (showSelectedItemFirst) {
			var selNode = ulNode.childNodes[0];
			$(selNode).css("display", "");
			selNode.childNodes[0].childNodes[0].innerHTML = selTitle;
		} else if (this.includeFirstSelectedItem) {
			$(selNode).css("display", "none");
		}
		if (this.control.IncludeFilter) {
			var noResultsNode = ulNode.childNodes[ulNode.childNodes.length - 1];
			if (found == 0) {
				$(noResultsNode).css("display", "");
			} else {
				$(noResultsNode).css("display", "none");
			}
		}
	}

	this.updateColumnsSelectorList = function (liDropDownItem, searchTxt) {
		var ulNode = liDropDownItem.childNodes[0].childNodes[0];
		var found = 0;
		var selTitle = '';
		var index = 0;
		var length = ulNode.childNodes.length;
		for (; index < length; index += 1) {
			var aLiFilters = ulNode.childNodes[index].childNodes[0]
			var spanNode = aLiFilters.childNodes[0];
			var title = spanNode.getAttribute('dsc');
			if (searchTxt != null && searchTxt.length > 0) {
				var ind = title.toLowerCase().indexOf(searchTxt.toLowerCase());
				if (ind >= 0) {
					title = title.substring(0, ind) + '<strong>' + title.substring(ind, ind + searchTxt.length) + '</strong>' + title.substring(ind + searchTxt.length);
					var dscSufix = spanNode.getAttribute('dscSuffix');
					if (dscSufix != null) {
						spanNode.innerHTML = title + dscSufix;
					} else {
						spanNode.innerHTML = title;
					}
					$(spanNode.parentNode.parentNode).css("display", "");
					found++;
				} else {
					$(spanNode.parentNode.parentNode).css("display", "none");
				}
			} else {
				var isSelected = (aLiFilters.getAttribute('sel') == 'T');
				$(spanNode.parentNode.parentNode).css("display", "");
				var dscSufix = spanNode.getAttribute('dscSuffix');
				if (dscSufix != null) {
					spanNode.innerHTML = title + dscSufix;
				} else {
					spanNode.innerHTML = title;
				}
				if (isSelected) {
					$(aLiFilters).css("background-image", "url(" + this.control.DropDownOptionsTitleSettingsIcons["MultiselSelOption_GXI"] + ")");
				} else {
					$(aLiFilters).css("background-image", "url(" + this.control.DropDownOptionsTitleSettingsIcons["MultiselOption_GXI"] + ")");
				}
				found++;
			}
		}
	}

	this.DetachAuxDateVariable = function (varName) {

		var varContainer = $("#" + varName).detach();
		varContainer.appendTo("#" + this.GetWebComponentPrefix() + this.control.ControlName.toUpperCase() + "AUXDATES");
	}

	this.GetDateFilterVariable = function () {
		if (this.dateFilterVarName == null || this.dateFilterVarName == '') {
			this.dateFilterVarName = this.GetWebComponentPrefix() + 'v' + this.control.ControlName.toUpperCase() + 'AUXDATE';
		}
		return this.dateFilterVarName;
	}

	this.GetWebComponentPrefix = function () {
		return this.containerName.replace(this.control.ControlName.toUpperCase() + 'Container', '');
	}

	this.GetDateFilterVariableTo = function () {
		return this.GetDateFilterVariable() + 'TO';
	}

	this.ajaxCall2;
	this.ajaxCall;
	this.procResult;
	this.updateFilterList = function (liDropDownItem, filterInput, filterInputTo, typing) {

		var originalSearchTxt = '';
		var searchTxt = '';
		var searchTxtTo = '';
		var updateList = true;
		if (this.control.DataListType != "Dynamic (with fixedValues)") {
			if (this.control.IncludeFilter) {
				if (filterInput != null) {
					originalSearchTxt = $(filterInput).val();
					searchTxt = originalSearchTxt;
					if (this.control.FilterType == 'Character' && searchTxt.length < this.control.DataListUpdateMinimumCharacters) {
						updateList = false;
					}
					if (searchTxt != null && searchTxt.length > 0) {
						searchTxt = replaceAll(searchTxt, '\\', '[\\]');
						searchTxt = replaceAll(searchTxt, '"', '\\"');
						searchTxt = replaceAll(searchTxt, '[\\]', '\\\\');
					}
				}
				else {
					searchTxt = '';
					if (this.control.FilterType == 'Character' && this.control.DataListUpdateMinimumCharacters > 0) {
						updateList = false;
					}
				}
				if (this.control.FilterIsRange) {
					searchTxtTo = $(filterInputTo).val();
					if (!updateList && searchTxtTo.length >= this.control.DataListUpdateMinimumCharacters) {
						updateList = true;
					}
					if (searchTxtTo != null && searchTxtTo.length > 0) {
						searchTxtTo = replaceAll(searchTxtTo, '\\', '[\\]');
						searchTxtTo = replaceAll(searchTxtTo, '"', '\\"');
						searchTxtTo = replaceAll(searchTxtTo, '[\\]', '\\\\');
					}
				}
			}
		}
		if (updateList) {
			//add Loading icon - start
			liDropDownItem.innerHTML = '';
			var aDropDownItem2 = document.createElement('a');
			var spanDropDownItem2 = document.createElement('span');
			spanDropDownItem2.innerHTML = gx.getMessage(this.control.LoadingData);

			//disable onclick close
			$(aDropDownItem2).bind("click", function (e) {
				e.stopPropagation();
			});

			aDropDownItem2.setAttribute("href", "#");
			//to keep URLs
			if (!navigator.appVersion.toLowerCase().match('msie 8') && !navigator.appVersion.toLowerCase().match('msie 7') && !navigator.appVersion.toLowerCase().match('msie 9')) {
				aDropDownItem2.setAttribute("data-toggle", "dropdown");
			}

			aDropDownItem2.className = "image";
			var imgDropDownItem2 = document.createElement('img');
			imgDropDownItem2.setAttribute("src", this.control.DropDownOptionsTitleSettingsIcons["OptionFilteringData_GXI"]);
			aDropDownItem2.appendChild(imgDropDownItem2);

			aDropDownItem2.appendChild(spanDropDownItem2);
			liDropDownItem.appendChild(aDropDownItem2);
			//add Loading icon - end

			if (this.control.TitleControlAlign == 'Left') {
				$(liDropDownItem).parent().css("margin-left", "-" + ($(liDropDownItem).parent().outerWidth() - $($(liDropDownItem).parent().parent().children()[0]).outerWidth()) + "px");
			}

			var thisC = this;
			var restURL = window.location.href;
			restURL = restURL.substring(0, restURL.length - window.location.search.length);
			restURL = restURL.substring(0, restURL.lastIndexOf('/'));
			var lastIndexOfQ = restURL.lastIndexOf('?');
			if (lastIndexOfQ >= 0) {
				restURL = restURL.substring(0, lastIndexOfQ);
				restURL = restURL.substring(0, restURL.lastIndexOf('/'));
			}
			if (restURL.lastIndexOf('/servlet') == restURL.length - 8) {
				restURL = restURL.substring(0, restURL.length - 8);
			}
			restURL = restURL + '/rest/' + replaceAll(this.control.DataListProc, ".", "/");
			this.ajaxCall = $.ajax({
				async: true,
				type: "POST",
				url: restURL,
				headers: {
					"Authorization": this.control.GAMOAuthToken
				},
				contentType: "application/json",
				data: '{"DDOName": "' + this.control.ControlName + '", "SearchTxt": "' + searchTxt + '", "SearchTxtTo": "' + searchTxtTo + '"}',
				success: function (result) {
					result.Options = JSON.parse(result.OptionsJson);
					result.OptionsDesc = JSON.parse(result.OptionsDescJson);
					result.OptionIndexes = JSON.parse(result.OptionIndexesJson);
					if (thisC.control.DataListType == "Dynamic (with fixedValues)") {
						thisC.procResult = result;
					}
					thisC.ProcessProcResult(result, liDropDownItem, filterInput, filterInputTo, originalSearchTxt, typing);
					thisC.setSectionGridMinHeight(true);
				},
				error: function (jqXHR, textStatus, errorThrown) {
					console.log("jqXHR statusCode" + jqXHR.statusCode());
					console.log("textStatus " + textStatus);
					console.log("errorThrown " + errorThrown);
					if (jqXHR != null && jqXHR.status == 401) {
						//401 (Not Authorized) -> Reload page so the user will be redirected to login
						window.location.reload();
					}
				}
			});
		} else {
			liDropDownItem.innerHTML = '';
		}
	}

	this.setSectionGridMinHeight = function (setMinHeight) {
		var ul = $("#" + this.containerToDrawName)[0].children[$("#" + this.containerToDrawName)[0].children.length - 1];
		var sectionGridElement = ul.parentElement;
		for (var i = 0; i < 15; i++) {
			if ($(sectionGridElement).hasClass("SectionGrid")) {
				break;
			}
			else {
				sectionGridElement = sectionGridElement.parentElement;
			}
		}
		if ($(sectionGridElement).hasClass("SectionGrid")) {
			var overflowEl = sectionGridElement.children[0];
			if (setMinHeight) {
				var minH = ul.offsetTop + ul.offsetHeight + 12;//12 = shadow
				$(overflowEl).css({ 'min-height': minH + "px" });
				if ($(overflowEl).height() > overflowEl.scrollHeight) {
					//has horizontal scroll visible
					minH += $(overflowEl).height() - overflowEl.scrollHeight;
					$(overflowEl).css({ 'min-height': minH + "px" });
				}
			}
			else {
				$(overflowEl).css({ 'min-height': "" });
			}
		}
	}

	this.getOptionCount = function (optionVal, liDropDownItem, filterInput, filterInputTo, typing) {

		this.getOptionCountResult = 0;
		try {
			var originalSearchTxt = '';
			var searchTxt = '';
			var searchTxtTo = '';
			var updateList = true;
			if (this.control.DataListType != "Dynamic (with fixedValues)") {
				if (this.control.IncludeFilter) {
					if (filterInput != null) {
						originalSearchTxt = optionVal;
						searchTxt = originalSearchTxt;
						if (this.control.FilterType == 'Character' && searchTxt.length < this.control.DataListUpdateMinimumCharacters) {
							updateList = false;
						}
						if (searchTxt != null && searchTxt.length > 0) {
							searchTxt = replaceAll(searchTxt, '\\', '[\\]');
							searchTxt = replaceAll(searchTxt, '"', '\\"');
							searchTxt = replaceAll(searchTxt, '[\\]', '\\\\');
						}
					}
					else {
						searchTxt = '';
						if (this.control.FilterType == 'Character' && this.control.DataListUpdateMinimumCharacters > 0) {
							updateList = false;
						}
					}
					if (this.control.FilterIsRange) {
						searchTxtTo = optionVal;
						if (!updateList && searchTxtTo.length >= this.control.DataListUpdateMinimumCharacters) {
							updateList = true;
						}
						if (searchTxtTo != null && searchTxtTo.length > 0) {
							searchTxtTo = replaceAll(searchTxtTo, '\\', '[\\]');
							searchTxtTo = replaceAll(searchTxtTo, '"', '\\"');
							searchTxtTo = replaceAll(searchTxtTo, '[\\]', '\\\\');
						}
					}
				}
			}
			if (updateList) {
				var thisC = this;
				var restURL = window.location.href;
				restURL = restURL.substring(0, restURL.length - window.location.search.length);
				restURL = restURL.substring(0, restURL.lastIndexOf('/'));
				var lastIndexOfQ = restURL.lastIndexOf('?');
				if (lastIndexOfQ >= 0) {
					restURL = restURL.substring(0, lastIndexOfQ);
					restURL = restURL.substring(0, restURL.lastIndexOf('/'));
				}
				if (restURL.lastIndexOf('/servlet') == restURL.length - 8) {
					restURL = restURL.substring(0, restURL.length - 8);
				}
				restURL = restURL + '/rest/' + replaceAll(this.control.DataListProc, ".", "/");
				this.ajaxCall2 = $.ajax({
					async: false,
					type: "POST",
					url: restURL,
					headers: {
						"Authorization": this.control.GAMOAuthToken
					},
					contentType: "application/json",
					data: '{"DDOName": "' + this.control.ControlName + '", "SearchTxt": "' + searchTxt + '", "SearchTxtTo": "' + searchTxtTo + '"}',
					success: function (result) {
						var options = JSON.parse(result.OptionsJson);
						var optionIndexes = JSON.parse(result.OptionIndexesJson);

						for (var index = 0; index < options.length; index += 1) {
							if (options[index] == optionVal) {
								thisC.getOptionCountResult = optionIndexes[index];
								return;
							}
						}
					},
					error: function (jqXHR, textStatus, errorThrown) {
						console.log("jqXHR statusCode" + jqXHR.statusCode());
						console.log("textStatus " + textStatus);
						console.log("errorThrown " + errorThrown);
						if (jqXHR != null && jqXHR.status == 401) {
							//401 (Not Authorized) -> Reload page so the user will be redirected to login
							window.location.reload();
						}
					}
				});
			} else {
				liDropDownItem.innerHTML = '';
			}
		} catch (e) {
		}
		return this.getOptionCountResult;
	}

	this.ProcessProcResult = function (result, liDropDownItem, filterInput, filterInputTo, searchTxt, typing) {
		if (typing && searchTxt == '') {
			typing = false;
		}
		var divFilters = document.createElement('div');
		divFilters.className = "FilterOptions";
		var ulFilters = document.createElement('ul');
		var selectedFound = false;
		var hasSelected = !this.IsValueEmpty(this.control.SelectedValue);
		var selectedFoundCount = 0;
		var selectedValue_getAUX2;
		var selectedText_getAUX2;
		if (this.control.AllowMultipleSelection) {
			divFilters.className = "FilterOptions FilterOptionsMultiSelection";
			selectedValue_getAUX2 = this.SelectedValue_getAUX.slice(0);
			if (this.SelectedValue_getAUX.length == this.SelectedText_getAUX.length) {
				selectedText_getAUX2 = this.SelectedText_getAUX.slice(0);
			} else {
				selectedText_getAUX2 = this.SelectedValue_getAUX.slice(0);
			}
		}
		if (hasSelected && !typing && result.Options != null && result.Options.length > 0) {
			if (this.control.AllowMultipleSelection) {
				hasSelected = (selectedValue_getAUX2.length > 0);
				for (var k = 0; k < selectedValue_getAUX2.length; k += 1) {
					selectedFound = false;
					for (var index = 0; index < result.Options.length; index += 1) {
						if (result.Options[index] == selectedValue_getAUX2[k]) {
							selectedFound = true;
							break;
						}
					}
					if (selectedFound) {
						selectedValue_getAUX2.splice(k, 1);
						selectedText_getAUX2.splice(k, 1);
						k--;
					}
				}
				selectedFound = (selectedValue_getAUX2.length == 0);
			} else {
				for (var index = 0; index < result.Options.length; index += 1) {
					if (result.Options[index] == this.control.SelectedValue) {
						selectedFound = true;
						break;
					}
				}
			}
		}
		var ulRedrawn = false;
		if (result.Options == null) {
			result.Options = [];
		}
		var visibleItems = 0;
		if ((result.Options != null && result.Options.length > 0) || (hasSelected && !selectedFound && !typing)) {
			if (result.OptionsDesc == null || result.OptionsDesc.length == 0) {
				result.OptionsDesc = result.Options;
			}
			var index = 0;
			if (hasSelected && !selectedFound && !typing) {
				if (this.control.AllowMultipleSelection) {
					index = (selectedValue_getAUX2.length * -1);
				} else {
					index = -1;
				}
				visibleItems = index;
			}
			var positionToInsert = 0;
			for (; index < result.Options.length; index += 1) {
				visibleItems += 1;
				var liFilters = document.createElement('li');
				var aLiFilters = document.createElement('a');
				var spanLiFilters = document.createElement('span');
				var optionVal, optionText;
				if (index < 0) {
					if (this.control.AllowMultipleSelection) {
						optionVal = selectedValue_getAUX2[0];
						optionText = selectedText_getAUX2[0];
						selectedValue_getAUX2.splice(0, 1);
						selectedText_getAUX2.splice(0, 1);
					} else {
						optionVal = this.control.SelectedValue;
						optionText = (this.control.SelectedText != null && this.control.SelectedText != '' ? this.control.SelectedText : optionVal);
					}
				} else {
					optionVal = result.Options[index];
					optionText = result.OptionsDesc[index].trim();
				}
				var isDynWithFixedValues = (this.control.DataListType == "Dynamic (with fixedValues)");
				var isSelected = false;
				if (this.control.AllowMultipleSelection) {
					for (var k = 0; k < this.SelectedValue_getAUX.length; k += 1) {
						if (this.SelectedValue_getAUX[k] == optionVal) {
							isSelected = true;
							break;
						}
					}
				} else {
					if (hasSelected && !isDynWithFixedValues || isDynWithFixedValues && searchTxt == '') {
						isSelected = (optionVal == this.control.SelectedValue);
					}
				}
				var title = optionText + '';
				var addDots = false;
				if (title.length > 100) {
					title = title.substring(0, 97).trim();
					addDots = true;
				}
				if (isSelected) {
					if (addDots) {
						title += '...';
					}
					if (this.control.AllowMultipleSelection) {
						aLiFilters.setAttribute('sel', 'T');
					} else {
						title = '<strong>' + title + '</strong>';
						$(aLiFilters).css("background-image", "url(" + this.control.DropDownOptionsTitleSettingsIcons["SelectedOption_GXI"] + ")");
						$(aLiFilters).css("background-repeat", "no-repeat");
						$(aLiFilters).css("background-position", "10px 60%");
					}
				} else if (searchTxt != null && searchTxt.length > 0 && !this.control.FilterIsRange && (this.control.FilterType == 'Character' || isDynWithFixedValues)) {
					var ind = title.toLowerCase().indexOf(searchTxt.toLowerCase());
					if (ind >= 0) {
						title = title.substring(0, ind) + '<strong>' + title.substring(ind, ind + searchTxt.length) + '</strong>' + title.substring(ind + searchTxt.length);
					} else if (isDynWithFixedValues) {
						visibleItems -= 1;
						$(liFilters).css("display", "none");
					}
					if (addDots) {
						title += '...';
					}
				}
				if (index < 0) {
					var auxCount = 0;
					if (result.Options.length == 50) {
						auxCount = this.getOptionCount(optionVal, liDropDownItem, filterInput, filterInputTo, typing);
					}
					title = title.trim() + ' (' + auxCount + ')';
				} else if (result.OptionIndexes.length == result.Options.length) {
					title = title.trim() + ' (' + result.OptionIndexes[index] + ')';
				}
				spanLiFilters.innerHTML = title;

				aLiFilters.setAttribute("href", "#");
				//to keep URLs
				if (!navigator.appVersion.toLowerCase().match('msie 8') && !navigator.appVersion.toLowerCase().match('msie 7') && !navigator.appVersion.toLowerCase().match('msie 9')) {
					aLiFilters.setAttribute("data-toggle", "dropdown");
				}

				if (this.control.AllowMultipleSelection) {
					if (isSelected) {
						$(aLiFilters).css("background-image", "url(" + this.control.DropDownOptionsTitleSettingsIcons["MultiselSelOption_GXI"] + ")");
					} else {
						$(aLiFilters).css("background-image", "url(" + this.control.DropDownOptionsTitleSettingsIcons["MultiselOption_GXI"] + ")");
					}
					$(aLiFilters).css("background-repeat", "no-repeat");
					$(aLiFilters).css("background-position", "5px 60%");
				}

				var thisC = this;
				$(aLiFilters).bind("click", function (ek, txt) {
					return function () {
						if (thisC.control.AllowMultipleSelection) {
							if (this.getAttribute('sel') == 'T') {
								this.setAttribute('sel', '');
								var selItemIndex = -1;
								for (var k = 0; k < thisC.SelectedValue_getAUX.length; k += 1) {
									if (thisC.SelectedValue_getAUX[k] == ek) {
										selItemIndex = k;
										break;
									}
								}
								if (selItemIndex >= 0) {
									thisC.SelectedValue_getAUX.splice(selItemIndex, 1);
									thisC.SelectedText_getAUX.splice(selItemIndex, 1);
								}
								$(this).css("background-image", "url(" + thisC.control.DropDownOptionsTitleSettingsIcons["MultiselOption_GXI"] + ")");
							} else {
								this.setAttribute('sel', 'T');
								thisC.SelectedValue_getAUX.push(ek);
								thisC.SelectedText_getAUX.push(txt);
								$(this).css("background-image", "url(" + thisC.control.DropDownOptionsTitleSettingsIcons["MultiselSelOption_GXI"] + ")");
							}
						} else {
							thisC.SetActiveEventKey('<#Filter#>');
							thisC.SetFilteredText($(filterInput).val());
							thisC.SetSelectedValue(ek);
							thisC.SetSelectedText(txt);
							if (thisC.control.FilterIsRange) {
								thisC.SetFilteredTextTo($(filterInputTo).val());
							}
						}
					}
				}(optionVal, optionText));


				if (this.control.AllowMultipleSelection) {
					$(aLiFilters).bind("click", function (e) {
						e.stopPropagation();
					});
				} else if (this.control.OnOptionClicked) {
					$(aLiFilters).bind("click", this.control.OnOptionClicked);
				}

				aLiFilters.appendChild(spanLiFilters);
				liFilters.appendChild(aLiFilters);
				if (isSelected && (this.control.AllowMultipleSelection
									|| ulFilters.childNodes.length > 0 && index >= this.minIndexForSelectedItemFirst)) {
					ulFilters.insertBefore(liFilters, ulFilters.childNodes[positionToInsert]);
					if (this.control.AllowMultipleSelection) {
						positionToInsert++;
					}
				} else {
					ulFilters.appendChild(liFilters);
				}
			}
		}
		if (visibleItems == 0) {
			var liFilters = document.createElement('li');
			var aLiFilters = document.createElement('a');
			var spanLiFilters = document.createElement('span');
			if (result.Options != null && result.Options.length == 0 && result.OptionsDesc != null && result.OptionsDesc.length == 1) {
				spanLiFilters.innerHTML = result.OptionsDesc[0];
			} else {
				spanLiFilters.innerHTML = gx.getMessage(this.control.NoResultsFound);
			}

			aLiFilters.setAttribute("href", "#");
			//to keep URLs
			if (!navigator.appVersion.toLowerCase().match('msie 8') && !navigator.appVersion.toLowerCase().match('msie 7') && !navigator.appVersion.toLowerCase().match('msie 9')) {
				aLiFilters.setAttribute("data-toggle", "dropdown");
			}

			$(aLiFilters).bind("click", function (e) {
				e.stopPropagation();
			});

			aLiFilters.appendChild(spanLiFilters);
			liFilters.appendChild(aLiFilters);
			ulFilters.appendChild(liFilters);
		}
		if (!ulRedrawn) {
			liDropDownItem.innerHTML = '';
			divFilters.appendChild(ulFilters);
			liDropDownItem.appendChild(divFilters);
		}
		if (this.control.TitleControlAlign == 'Automatic') {
			dropdownAutoPosition(null, "#" + this.containerToDrawName, this.m_UlDropDown, this.m_triggerButton);
		} else if (this.control.TitleControlAlign == 'Left') {
			$(liDropDownItem).parent().css("margin-left", "-" + ($(liDropDownItem).parent().outerWidth() - $($(liDropDownItem).parent().parent().children()[0]).outerWidth()) + "px");
		}
	}

	this.SetActiveEventKey = function (eventKey) {
		if (eventKey == '<#Filter#>') {
			this.control.SelectedFixedFilter = '';
		}
		this.control.ActiveEventKey = eventKey;
	}

	this.SetFilteredText = function (filteredText) {
		this.control.FilteredText_get = filteredText != null ? filteredText : "";
		this.control.FilteredText_set = this.control.FilteredText_get
		this.control.FilteredText = this.control.FilteredText_get
	}

	this.SetFilteredTextTo = function (filteredText) {
		this.control.FilteredTextTo_get = filteredText != null ? filteredText : "";
		this.control.FilteredTextTo_set = this.control.FilteredTextTo_get;
		this.control.FilteredTextTo = this.control.FilteredTextTo_get;
	}

	this.SetSelectedValue = function (selectedValue) {
		this.control.SelectedValue_get = selectedValue != null ? selectedValue : "";
		this.control.SelectedValue_set = this.control.SelectedValue_get;
		this.control.SelectedValue = this.control.SelectedValue_get;
	}

	this.SetSelectedText = function (selectedValue) {
		this.control.SelectedText_get = selectedValue != null ? selectedValue : "";
		this.control.SelectedText_set = this.control.SelectedText_get;
		this.control.SelectedText = this.control.SelectedText_get;
	}

	this.ShowHideControl = function () {
		if (this.control.Visible == "false") {
			$("#" + this.containerToDrawName).css("display", "none");
		} else {
			$("#" + this.containerToDrawName).css("display", "inline-block");
		}
	}
}

function escapeRegExp(string) {
	return string.replace(/([.*+?^=!:${}()|\[\]\/\\])/g, "\\$1");
}

function replaceAll(string, find, replace) {
	return (!string) ? "" : string.replace(new RegExp(escapeRegExp(find), 'g'), replace);
}

function isTitleControlAlignLeft(containerToDrawName, ulDropDown, triggerButton) {
	var actualThElement = $(containerToDrawName).parent().parent().parent();
	var trElement = actualThElement.parent();
	var totalEmptyColumns = 0;
	var totalColumns = 0;
	var actualThIndex = actualThElement.index();
	var actualColumnNumber = -1;
	for (var thIndex = 0; thIndex < trElement.children().length; thIndex += 1) {
		var thElement = trElement.children()[thIndex];
		if (actualThIndex == thIndex) {
			actualColumnNumber = totalColumns;
		}
		if ($(thElement).css("display") != "none") {
			totalColumns++;
			if (thElement.innerHTML.trim() == "" || thElement.innerHTML.trim() == "&nbsp;") {
				totalEmptyColumns++;
			}
		}
	}
	totalColumns = totalColumns - totalEmptyColumns;
	actualColumnNumber = actualColumnNumber - totalEmptyColumns;
	if (actualColumnNumber >= 0 && (totalColumns > 5 && actualColumnNumber >= totalColumns - 2
											|| totalColumns > 2 && actualColumnNumber == totalColumns - 1)) {
		return true;
	} else {
		return false;
	}
}

function dropdownAutoPosition(dropdownSelector, ulDropDown, triggerButton) {
	if (isTitleControlAlignLeft(dropdownSelector, ulDropDown, triggerButton)) {
		$(ulDropDown).css("margin-left", "-" + ($(ulDropDown).outerWidth() - $(triggerButton).outerWidth()) + "px");
		$(ulDropDown).css("margin-left", "-" + ($(ulDropDown).outerWidth() - $(triggerButton).outerWidth()) + "px");
	}
	//	var button = $(dropdownSelector + " > button");
	//	var dropdown = $('ul', $(dropdownSelector));
	//	var scrollable = dropdown.scrollParent(false);

	//	if (scrollable.length == 0)
	//		scrollable = $(window);

	//	//dropdown
	//	if (dropdown.length) {
	//		//fix position			
	//		dropdown.css("left", "");

	//		//dropdown content and trigger button
	//		var dropdownPositionLeft = button.position().left; //left position
	//		var dropdownWidth = dropdown.outerWidth(); 		//ul width

	//		//container scrollable element
	//		var docScrollLeft = scrollable.scrollLeft();
	//		var docHeight = scrollable.height();
	//		var docWidth = scrollable.outerWidth();

	//		//check visibility
	//		var isEntirelyVisible = dropdown.dvelopIsVisible(scrollable.get(0));

	//		//apply position
	//		if (!isEntirelyVisible) {
	//			dropdown.css("left", (dropdownPositionLeft + docScrollLeft - dropdownWidth + button.outerWidth()) + "px");
	//		} else {
	//			dropdown.css("left", "");
	//		}

	//		//notify
	//		try {
	//			dvelopDropdownOnShown(dropdown);
	//		} catch (e) {
	//		}
	//	}
}

function cleanJsonString(s) {
	s = s.replace(/\\n/g, "\\n")
	   .replace(/\\'/g, "\\'")
	   .replace(/\\"/g, '\\"')
	   .replace(/\\&/g, "\\&")
	   .replace(/\\r/g, "\\r")
	   .replace(/\\t/g, "\\t")
	   .replace(/\\b/g, "\\b")
	   .replace(/\\f/g, "\\f");
	// remove non-printable and other non-valid JSON chars
	s = s.replace(/[\u0000-\u0019]+/g, "");
	return s;
}

var cookieHash = {};
//Create Cookie Function
function createCookie(name, value, days) {
	cookieHash[name] = value;
}

//Read Cookie Function
function readCookie(name) {
	return cookieHash[name];
}

//Erase Cookie Function
function eraseCookie(name) {
	createCookie(name, "", -1);
}

//Remove Classes Function
function removeClass(elem, cls) {
	var str = " " + elem.className + " ";
	elem.className = str.replace(" " + cls, "").replace(/^\s+/g, "").replace(/\s+$/g, "");
}

//Remove Classes Function
function removeClass(elem, cls) {
	var str = " " + elem.className + " ";
	elem.className = str.replace(" " + cls, "").replace(/^\s+/g, "").replace(/\s+$/g, "");
}

//Has Classes Function
function hasClass(elem, cls) {
	var str = " " + elem.className + " ";
	var testCls = " " + cls + " ";
	return (str.indexOf(testCls) != -1);
}

//Add Classes Function
function addClass(elem, cls) {
	var oldCls = elem.className;
	if (oldCls) {
		oldCls += " ";
	}
	elem.className = oldCls + cls;
}

