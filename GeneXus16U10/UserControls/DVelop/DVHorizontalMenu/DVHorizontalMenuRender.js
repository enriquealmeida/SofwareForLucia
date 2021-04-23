function DVelop_DVHorizontalMenu() {
	this.Menu;
	this.CollapsedTitle;
	this.ResizeWidth;
	this.Code;
	this.Cls;
	this.MenuType;
	this.MoreOptionEnabled;
	this.MoreOptionCaption;
	this.MoreOptionIcon;
	this.MoreOptionShowIconsOnInnerOptions;

	this.SetMenu = function (items) {
		this.Menu = items;
	};

	this.GetMenu = function () { };

	this.show = function () {
		this.IsPostBack || this.Refresh();

		if (!this.IsPostBack && this.MoreOptionEnabled && this.Menu.length > 0) {
			var thisC = this;
			$(window).resize(function () {
				thisC.UpdateMoreOption();
			});
			gx.fx.obs.addObserver("gx.onload", window, function (thisC) {
				return function (e) {
					thisC.UpdateMoreOption();
				}
			}(this));
			$(window).on('load', function () {
				thisC.UpdateMoreOption();
			});
			gx.fx.obs.addObserver("gx.onafterevent", window, function (thisC) {
				return function (e) {
					thisC.UpdateMoreOption();
				}
			}(this));
		}
	};

	this.Refresh = function () {
		var UserControl = this;
		$(document).ready(function ($) {
			var menuId = "slimmenu" + (new Date).getTime();
			var menuHtml = UserControl.processMenu(UserControl.Menu, null, true, true);
			if (menuHtml == null) {
				menuHtml = '';
			}
			if (UserControl.MoreOptionEnabled && UserControl.Menu.length > 0) {
				var moreIconItem = UserControl.MoreOptionIcon != "" ? '<i class="' + UserControl.MoreOptionIcon + '"></i> ' : '<i></i>';
				menuHtml += '<li class="moreOption"><a href="#">' + moreIconItem + gx.getMessage(UserControl.MoreOptionCaption) + "<\/a>" + UserControl.processMenu(UserControl.Menu, null, false, UserControl.MoreOptionShowIconsOnInnerOptions) + '<\/li>';
			}
			var buffer = new gx.text.stringBuffer;
			buffer.clear();
			buffer.append('<ul class="slimmenu' + (UserControl.Cls != null && UserControl.Cls != '' ? " " + UserControl.Cls : "") + '" id="' + menuId + '">' + menuHtml + "<\/ul>");
			UserControl.getContainerControl().innerHTML = buffer.toString();
			$("#" + menuId).slimmenu({
				resizeWidth: UserControl.ResizeWidth,
				collapserTitle: UserControl.CollapsedTitle,
				animSpeed: 0,
				indentChildren: !0,
				childrenIndenter: "&raquo;"
			});

			if (UserControl.MoreOptionEnabled && UserControl.Menu.length > 0) {
				UserControl.UpdateMoreOption();
			}

			$("ul.slimmenu a").click(function (event) {
				if ($("#" + menuId).hasClass("collapsed")) {
					$(".collapse-button").click()
				}

			});
			$(".smClick").click(function (event) {
				if (UserControl.ItemClick) {
					var r = $(this).attr("smcode");
					UserControl.Code = r;
					UserControl.ItemClick();
					var li = $(this).closest('li.has-submenu').get(0);
					if (li != null) {
						$(li).find('ul').css('display', 'none');
					}
				}
			});
			$(".smLink").click(function (event) {
				var li = $(this).closest('li.has-submenu').get(0);
				if (li != null) {
					$(li).find('ul').css('display', 'none');
				}
			});

		});
	};
	this.processMenu = function (n, submenuImage, isRoot, showIcons) {
		var r, u, i, e, iconItem;
		if (typeof n == "object" && n.length) {
			if (!isRoot && this.MenuType == "Mega") {
				r = [];
				var hasImage = (submenuImage != null && submenuImage != '');
				if (hasImage) {
					r.push('<li class="submenuImage"><img class="ObjectFitCover" src="' + submenuImage + '" ></li>');
				}
				r.push('<li style="" class="submenuOptions' + (hasImage ? "" : " NoMenuImage") + '">');
				this.processMenu_MegaAddItem(n, r, showIcons);
				r.push('</li>');
			}
			else {
				for (r = [], u = 0; u < n.length; u++) {
					i = n[u];
					iconItem = showIcons && i.iconClass != "" ? '<i class="' + i.iconClass + '"></i> ' : '<i></i>';
					if (i.link != "") {
						e = i.linkTarget != "" ? (e = ' target="' + i.linkTarget + '"') : "";
						r.push('<li><a href="' + i.link + '" ' + e + " class='smLink'>" + iconItem + gx.getMessage(i.caption) + "<\/a><\/li>");
					}
					else {
						if (i.subItems && i.subItems.length > 0) {
							r.push('<li><a href="#">' + iconItem + gx.getMessage(i.caption) + "<\/a>");
							r.push(this.processMenu(i.subItems, i.submenuImage, false, showIcons));
							r.push('<\/li>');
						}
						else {
							r.push('<li><a href="#" class="smClick" smcode="' + i.id + '" >' + iconItem + gx.getMessage(i.caption) + "<\/a><\/li>");
						}
					}
				}
			}
			return isRoot ? r.join("") : "<ul>" + r.join("") + "<\/ul>";
		}
	}

	this.processMenu_MegaAddItem = function (n, r, showIcons) {
		for (var u = 0; u < n.length; u++) {
			r.push('<div>');
			var i = n[u];
			var iconItem = showIcons && i.iconClass != "" ? '<i class="' + i.iconClass + '"></i> ' : '<i></i>';
			if (i.link != "") {
				e = i.linkTarget != "" ? (' target="' + i.linkTarget + '"') : "";
				r.push('<a href="' + i.link + '" ' + e + " class='smLink'>" + iconItem + gx.getMessage(i.caption) + "<\/a>");
			}
			else {
				if (i.subItems && i.subItems.length > 0) {
					r.push('<div class="submenuTitle"><span>' + iconItem + gx.getMessage(i.caption) + '</span></div>');
					this.processMenu_MegaAddItem(i.subItems, r);
				}
				else {
					r.push('<a href="#" class="smClick" smcode="' + i.id + '" >' + iconItem + gx.getMessage(i.caption) + "<\/a>");
				}
			}
			r.push('</div>');
		}
	}

	this.UpdateMoreOption = function () {
		var lis = $(this.getContainerControl()).find('> ul > li');
		var liCount = lis.length - 1;
		for (var i = 0; i < liCount; i++) {
			$(lis[i]).css('display', '');
		}
		var moreOptionsLI = $(lis[liCount]);
		moreOptionsLI.css('display', 'none');
		var moreOptionsLI_lis = moreOptionsLI.find('> ul > li' + (this.MenuType == "Mega" ? " > div" : ""));
		moreOptionsLI_lis.each(function () {
			$(this).css('display', 'none');
		});
		if (!$(this.getContainerControl()).find('>ul').hasClass('collapsed')) {
			var containerIsFlex = $(this.getContainerControl()).parent().parent().attr('data-gx-flex') == '';
			while (liCount > 0 && ((!containerIsFlex && $(this.getContainerControl()).parent().offset().top > $(this.getContainerControl()).parent().parent().offset().top + parseInt($(this.getContainerControl()).parent().parent().css('padding-top')))
								|| (containerIsFlex && $(this.getContainerControl()).find('>ul').height() > $(this.getContainerControl()).parent().height()))) {
				moreOptionsLI.css('display', '');
				$(lis[liCount - 1]).css('display', 'none');
				$(moreOptionsLI_lis[liCount - 1]).css('display', '');
				liCount--;
			}
		}
	}
}
