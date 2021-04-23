function DVelop_GridTitlesCategories() {

	this.GridInternalName;
	this.GridTitlesCategories;
	this.GridInternalNameFixed = false;

	this.resizeHandler;
	this.initialized = false;

	this.show = function () {

		if (!this.initialized) {
			this.initialized = true;

			gx.fx.obs.addObserver("gx.onafterevent", window, function (thisC) {
				return function (e) {
					thisC.updateGridTitlesCategories();
				}
			}(this));

			gx.fx.obs.addObserver("gx.onload", window, function (thisC) {
				return function (e) {
					thisC.updateGridTitlesCategories();
				}
			}(this));

			gx.fx.obs.addObserver("grid.onafterrender", window, function (thisC) {
				return function (e) {
					thisC.updateGridTitlesCategories();
				}
			}(this));

			gx.fx.obs.addObserver("webcom.all_rendered", window, function (thisC) {
				return function (e) {
					thisC.updateGridTitlesCategories();
				}
			}(this));

			this.resizeHandler = function () {
				this.updateGridTitlesCategories();
			}.closure(this);

			gx.evt.attach(window, "resize", this.resizeHandler);
		}
	}

	this.destroy = function () {
		gx.evt.detach(window, "resize", this.resizeHandler);
	}

	this.updateGridTitlesCategories = function () {
		if (!this.GridInternalNameFixed) {
			var grids = $('gx-grid');
			var thisC = this;
			$('.gx-grid').each(function (i, obj) {
				if (obj.id.toUpperCase() == thisC.GridInternalName + 'CONTAINERDIV') {
					thisC.GridInternalName = obj.id;
					this.GridInternalNameFixed = true;
				}
			});
		}

		var groupTitlesVisibles = "";
		var grid = $('#' + this.GridInternalName).get(0);
		if (grid != null && grid.childNodes.length > 0) {
			var thead = grid.childNodes[0].childNodes[0];
			var origRow = thead.childNodes[thead.childNodes.length - 1];
			for (var i = 0; i < origRow.childNodes.length; i++) {
				if (groupTitlesVisibles != '') {
					groupTitlesVisibles += ";";
				}
				var thOrig = origRow.childNodes[i];
				groupTitlesVisibles += ($(thOrig).css('display') != 'none' ? '1' : '0');
			}
			var groupTitlesVisiblesSplitted = groupTitlesVisibles.split(';');
			var thsAlreadyCreated = (thead.childNodes.length > 1);

			var newTr = (thsAlreadyCreated ? thead.childNodes[0] : document.createElement('tr'));

			var groupTitlesSplitted = this.GridTitlesCategories.split(';');
			var currentThIndex = 0;
			for (var index = 0; index < groupTitlesSplitted.length; index += 1) {
				var groupTitle = groupTitlesSplitted[index];
				if (index == 0 || groupTitle != groupTitlesSplitted[index - 1]) {
					var index2 = index;
					var visibles = (groupTitlesVisiblesSplitted[index] == '1' ? 1 : 0);
					while (index < groupTitlesSplitted.length - 1 && groupTitle == groupTitlesSplitted[index2 + 1]) {
						index2++;
						if (groupTitlesVisiblesSplitted[index2] == '1') {
							visibles++;
						}
					}
					var newTh = (thsAlreadyCreated ? newTr.childNodes[currentThIndex] : document.createElement('th'));
					if (visibles > 0) {
						newTh.setAttribute("colspan", visibles);
						$(newTh).css("display", "");
					} else {
						$(newTh).css("display", "none");
					}
					if (!thsAlreadyCreated) {
						newTh.setAttribute("class", "GridGroupTitle" + (groupTitle == '' ? ' NoTitle' : ''));
						$(newTh).css("color", "black");
						$(newTh).css("text-align", "-webkit-center");
						newTh.innerHTML = "<div>" + groupTitle + "</div>";
						newTr.appendChild(newTh);
					}
					currentThIndex++;
				}
			}

			if (!thsAlreadyCreated) {
				thead.insertBefore(newTr, thead.childNodes[0]);
				newTr.setAttribute("class", "GridGroupTitleRow");
			}
		}
	}
}

