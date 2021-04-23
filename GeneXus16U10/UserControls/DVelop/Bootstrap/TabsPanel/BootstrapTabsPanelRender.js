function BootstrapTabsPanel() {
	this.DesignTimeTabs;
	this.SelectedTabIndex;
	this.Width;
	this.Height;
	this.AutoWidth;
	this.AutoHeight;
	this.AutoScroll;
	this.Cls;
	this.ActiveTabId;

	this.show = function () {
		if (this.my_tabsPanel == undefined) {
			this.my_tabsPanel = new DVelopBootstrapTabs(this);
			this.my_tabsPanel.render();
			var n = $('#DVelopBootstrapTabsContent_' + this.ContainerName).get(0);
			while (n.parentElement.tagName != 'HTML' && !$(n).hasClass('CellWCSplitScreenWithTabs')) {
				$(n).css('height', '100%');
				n = n.parentElement;
			}
		}
	}

	this.SetTabTitle = function (tabId, title) {
		if (this.my_tabsPanel != undefined) {
			this.my_tabsPanel.setTabTitle(tabId, title);
		}
	}

	this.AddIFrameTab = function (url, title) {
		if (this.my_tabsPanel != undefined) {
			this.my_tabsPanel.addIFrameTab(url, title);
		}
	}

	this.UpdateIFrameTabCaption = function (url, title) {
		if (this.my_tabsPanel != undefined) {
			this.my_tabsPanel.UpdateIFrameTabCaption(url, title);
		}
	}

	this.ReplaceIFrameTab = function (oldUrl, newUrl, title) {
		if (this.my_tabsPanel != undefined) {
			this.my_tabsPanel.ReplaceIFrameTab(oldUrl, newUrl, title);
		}
	}

	this.CloseIFrameTab = function (url) {
		if (this.my_tabsPanel != undefined) {
			this.my_tabsPanel.CloseIFrameTab(url);
		}
	}

	this.SelectTab = function (tabId) {
		if (this.my_tabsPanel != undefined) {
			this.my_tabsPanel.SelectTab(tabId);
		}
	}

	this.ShowTab = function (tabId) {
		if (this.my_tabsPanel != undefined) {
			this.my_tabsPanel.showTab(tabId);
		}
	}

	this.HideTabById = function (tabId) {
		if (this.my_tabsPanel != undefined) {
			this.my_tabsPanel.hideTabById(tabId);
		}
	}

	this.HideTab = function (tabIndex) {
		if (this.my_tabsPanel != undefined) {
			this.my_tabsPanel.hideTabByIndex(tabIndex);
		}
	}
}
