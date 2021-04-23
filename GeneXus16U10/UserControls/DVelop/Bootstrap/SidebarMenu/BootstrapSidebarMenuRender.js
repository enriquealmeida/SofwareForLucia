function BootstrapSidebarMenu($) {
	this.SearchServiceUrl;
	this.SearchMinChars;
	this.SearchHelperDescription;
	this.SidebarMainClass;
	this.HeaderClass;
	this.SearchInputClass;
	this.SearchIconClass;
	this.SearchHelperClass;
	this.SearchResultClass;
	this.SidebarMenuClass;
	this.SidebarMenuOptionsData;
	this.SidebarMenuUserData;
	this.GAMOAuthToken;
	this.SelectedItem = 0;
	this.HasMenuSearch;
	this.ScrollWidth;
	this.AllMenuItemsVisibleAtLoad;
	this.ScrollAlwaysVisible = false;
	this.HideScrollInCompactMenu = true;
	this.FirstLevelIsGrouping = false;
	ucSidebar = this;

	this.scrollTop = 0;
	this.needExecShow = true;

	// Databinding for property SidebarMenuOptionsData

	this.ResetSelectedOption = function () {

		this.setActiveItem(1);
		var activeItem = this.getActiveItem();
		this.openItem(activeItem);
	}

	this.SetSidebarMenuOptionsDataOptionsData = function (data) {
		///UserCodeRegionStart:[SetSidebarMenuOptionsDataOptionsData] (do not remove this comment.)

		if (data != undefined && data.length > 0) {
			jQuery.each(data,
				function (key, val) {
					_trimItemsIds(key, val);
				}
			);
			if (!this.needExecShow) {
				if (this.SidebarMenuOptionsData == undefined || this.SidebarMenuOptionsData.length != data.length || JSON.stringify(this.SidebarMenuOptionsData, null, 2) != JSON.stringify(data, null, 2)) {
					this.needExecShow = true;
				}
			}
			this.SidebarMenuOptionsData = data;
		}

		///UserCodeRegionEnd: (do not remove this comment.)
	}

	// Databinding for property SidebarMenuOptionsData
	this.GetSidebarMenuOptionsDataOptionsData = function () {
		///UserCodeRegionStart:[GetSidebarMenuOptionsDataOptionsData] (do not remove this comment.)

		return this.SidebarMenuOptionsData;

		///UserCodeRegionEnd: (do not remove this comment.)
	}

	this.SetSidebarMenuUserData = function (data) {
		///UserCodeRegionStart:[SetSidebarMenuOptionsDataOptionsData] (do not remove this comment.)

		if (data != undefined) {
			if (!this.needExecShow) {
				if (this.SidebarMenuUserData == undefined || JSON.stringify(this.SidebarMenuUserData, null, 2) != JSON.stringify(data, null, 2)) {
					this.needExecShow = true;
				}
			}
			this.SidebarMenuUserData = data;
		}

		///UserCodeRegionEnd: (do not remove this comment.)
	}

	// Databinding for property SidebarMenuOptionsData
	this.GetSidebarMenuUserData = function () {
		///UserCodeRegionStart:[GetSidebarMenuOptionsDataOptionsData] (do not remove this comment.)

		return this.SidebarMenuUserData;

		///UserCodeRegionEnd: (do not remove this comment.)
	}

	this._sidebarMenuClass;

	this.show = function () {
		///UserCodeRegionStart:[show] (do not remove this comment.)

		this.HasMenuSearch = (this.SearchServiceUrl && this.SearchServiceUrl != "");
		if (this.needExecShow || !this.IsPostBack || $(window).width() <= 767) {
			try {
				this.needExecShow = false;
				var _idCount = 0,
				container = this.getContainerControl(),
				containerId = container.id,
				containerName = this.ContainerName;

				var _sidebarMainClass = this.SidebarMainClass || "page-sidebar",
				_headerClass = this.HeaderClass || "sidebar-header-wrapper",
				_headerSearchInputClass = this.SearchInputClass || "searchinput",
				_headerSearchIconClass = this.SearchIconClass || "searchicon fa fa-search",
				_headerSearchHelperClass = this.SearchHelperClass || "searchhelper",
				_headerSearchResultClass = this.SearchResultClass || "searchresult";
				this._sidebarMenuClass = this.SidebarMenuClass || "nav sidebar-menu";

				if (readCookie("DVelopBootstrap_SidebarMenu_State") == 'C') {
					_sidebarMainClass += ' menu-compact';
				}

				var buffer = '<div class="' + _sidebarMainClass + '" id="sidebar">'

				buffer += '<div class="sidebar-header">'

				//User info
				if (this.SidebarMenuUserData != "") {

					buffer += '<div class="' + _headerClass + ' user-info">'
					if (this.SidebarMenuUserData.PhotoUri != "") {
						buffer += '<div><img src="' + this.SidebarMenuUserData.PhotoUri + '"></img></div>'
					}
					buffer += '<div class="user-text">'
					buffer += '<span class="user-info-first">' + this.SidebarMenuUserData.FirstLine + '</span><br>'
					buffer += '<span class="user-info-second">' + this.SidebarMenuUserData.SecondLine + ' </span>'
					buffer += '</div>'
					buffer += '</div>'
				}

				//Page Sidebar Header 
				if (this.HasMenuSearch) {
					buffer += '<div class="' + _headerClass + '">'
					+ '<input type="text" id="sidebar_search_input"  autocomplete="false" autocorrect="off" autocapitalize="off"  class="' + _headerSearchInputClass + '" placeholder="' + gx.getMessage(this.SearchHelperDescription) + '" />'
					+ '<i class="' + _headerSearchIconClass + '"></i>'
					+ '<i class="searchreset fa-fw fa fa-times"></i>'
					buffer += '</div>';
				}

				buffer += '</div>'

				buffer += '<ul id="sidebar_ul" class="' + this._sidebarMenuClass + '">';

				//load menu items
				if (this.SidebarMenuOptionsData != undefined && this.SidebarMenuOptionsData.length > 0) {
					var thisC = this;
					var groupAdded = false;
					var isFirst = true;
					jQuery.each(this.SidebarMenuOptionsData,
						function (key, val) {
							if (thisC.FirstLevelIsGrouping) {
								if (groupAdded) {
									buffer += '<li class="menuGroupTitleDivider"></li>';
								}
								var value = val['subItems'];
								if (value instanceof Object && value.length > 0) {
									if (!groupAdded && !isFirst) {
										buffer += '<li class="menuGroupTitleDivider"></li>';
									}
									buffer += '<li class="menuGroupTitle">' + val.caption + '</li>';
									$.each(value, function (key2, val2) {
										buffer += '<li>' + _sidebarMenuRecursiveLoad(key2, val2) + '</li>';
									});
									groupAdded = true;
								}
								else {
									buffer += '<li>'
										+ _sidebarMenuRecursiveLoad(key, val)
										+ '</li>';
									groupAdded = false;
								}
								isFirst = false;
							}
							else {
								buffer += '<li>'
									+ _sidebarMenuRecursiveLoad(key, val)
									+ '</li>';
							}
						}
					);
				}
				buffer += '</ul>';
				buffer += '</div>';

				container.innerHTML = buffer;

				if (this.ScrollWidth > 0) {
					$('#sidebar_ul > li').hover(function () {
						$(this).closest('.slimScrollDiv').addClass('liExpanded');
					}, function () {
						$(this).closest('.slimScrollDiv').removeClass('liExpanded');
					});
				}

				//----------------------------
				// Sidebar Menu Click Handler
				//----------------------------
				jQuery(".sidebar-menu")
					.on('click', function (ev) {
						var menuLink = $(ev.target).closest("a");
						return ucSidebar._clickHandler(menuLink, ev);
					});

				var activeItem = this.getActiveItem();
				if (activeItem && activeItem != "") {
					this.openItem(activeItem);
				}

				if (this.HasMenuSearch) {
					//----------------------------
					// search handler	
					//----------------------------				
					jQuery('#sidebar_search_input')
						.on("input", function (ev) {
							if (this.value.length >= ucSidebar.SearchMinChars) {
								return ucSidebar.onSearchExec(this.value);
							}
							else {
								ucSidebar.onSearchExec('');
							}
						});


					$($('#sidebar_search_input').get(0)).keydown(function (event) {
						if (event.keyCode == 13) {
							event.preventDefault();
							return false;
						}
					});

					$(".page-sidebar .sidebar-header-wrapper .searchreset")
						.on('click', function () {
							$('#sidebar_search_input').get(0).value = '';
							ucSidebar.onSearchExec('');
						});
				}

				var pageContainer = jQuery("div.page-container");
				var pageSidebar = jQuery("div.page-sidebar");

				if (pageContainer.length > 0 && pageSidebar.length > 0) {
					var child = pageContainer.children().get(0);
					if (child && child.id != 'sidebar') {
						//replace first child with sidebar...
						var jChild = $(child);
						pageSidebar.detach().prependTo(pageContainer);
						jChild.remove();
					}
				}


				var ul = $('#sidebar_ul').get(0);
				var found = 0;
				for (var i = 0; i < ul.childNodes.length; i++) {
					var ul_i = ul.childNodes[i];
					$(ul_i).bind("transitionend webkitTransitionEnd oTransitionEnd MSTransitionEnd", function (ul_iC) {

						if ($(ul_iC).css('opacity') == '1') {
							ul_iC.removeAttribute('ch');
							$(ul_iC).css("height", "");
						}
					}(ul_i));
				}

				$(".page-content").removeClass("hideMenu");
				this.display();
				$(".page-content").addClass("sidebarmenu-transtion");
				$("#sidebar").addClass("sidebarmenu-transtion");

				if (this.AllMenuItemsVisibleAtLoad) {
					OpenAllMenuOptions();
				}

				if (this.ScrollWidth > 0) {
					var thisC = this;
					$(window).resize(function () {
						if (thisC.HideScrollInCompactMenu) {
							var state = readCookie("DVelopBootstrap_SidebarMenu_State");
							if (state != "C") {
								thisC.updateSlimscroll(false);
							}
						}
						else {
							thisC.updateSlimscroll(false);
						}
					});
				}

				//notification for other UCs
				gx.fx.obs.notify('dvelop.extuc.sidebar.init', null);
			}
			catch (ex) {
				gx.dbg.write(ex.toString());
			}
		} else {
			var itemId = readCookie("DVelopBootstrap_SidebarMenuSelected") || 0;
			var activeItem = this.getActiveItem();
			if (itemId != activeItem) {
				this.setInactiveItem(itemId);
				this.setActiveItem(this.SelectedItem);
				if (activeItem && activeItem != "") {
					this.openItem(activeItem);
				}
				if (this.IsScrollVisible()) {
					this.scrollTop = -1;
					this.updateSlimscroll(true);
				}
			}
		}

		///UserCodeRegionEnd: (do not remove this comment.)
	}

	this.IsScrollVisible = function () {
		return (this.ScrollWidth > 0 && (!$("#sidebar").hasClass("menu-compact") || !this.HideScrollInCompactMenu));
	}

	this.updateScrollBottomSpace = function () {
		var marginBottom = 0;
		var container = this.getContainerControl();
		var lastOption = $(container).find('div>ul.nav.sidebar-menu>li:last-child').get(0);
		if (lastOption != null) {
			var marginBottomVal = '';
			if ($("#sidebar").hasClass("menu-compact")) {
				var lastOptionUL = $(lastOption).find('>ul').get(0);
				if (lastOptionUL != null) {
					marginBottom = $(lastOptionUL).height();
					if (marginBottom > parseInt($(lastOption).css('margin-bottom'))) {
						marginBottomVal = marginBottom;
					}
				}
			}
			$(lastOption).css('transition', 'margin-bottom 0.2s');
			$(lastOption).css('margin-bottom', marginBottomVal);
		}
	}

	///UserCodeRegionStart:[User Functions] (do not remove this comment.)
	this._clickHandler = function (menuLink, ev) {
		if (!menuLink || menuLink.length == 0)
			return;

		var b = $("#sidebar").hasClass("menu-compact");
		if (!menuLink.hasClass("menu-dropdown")) {
			if (b && menuLink.get(0).parentNode.parentNode == this) {
				var menuText = menuLink.find(".menu-text").get(0);
				if (ev && ev.target != menuText && !$.contains(menuText, ev.target)) {
					return false;
				}
			}
			if (ev)
				ucSidebar.onSelectedItemExec(ev, menuLink.get(0));
			return;
		}
		var submenu = menuLink.next().get(0);
		if (!$(submenu).is(":visible")) {
			var c = $(submenu.parentNode).closest("ul");
			if (b && c.hasClass("sidebar-menu"))
				return;
			c.find("> .open > .submenu")
				.each(function () {
					if (this != submenu && !$(this.parentNode).hasClass("active"))
						$(this).slideUp(200).parent().removeClass("open");
				});
		}
		if (b && $(submenu.parentNode.parentNode).hasClass("sidebar-menu"))
			return false;
		if (window.navigator.userAgent.indexOf("MSIE ") >= 0 || window.navigator.userAgent.indexOf('Edge') >= 0 || (!!window.MSInputMethodContext && !!document.documentMode)) {
			$(submenu).slideToggle(200, function () {
				$(submenu).parent().toggleClass("open");
			});
		} else {
			$(submenu).slideToggle(200).parent().toggleClass("open");
		}
		return false;
	}

	function _trimItemsIds(key, val) {
		var value = val['subItems'];
		val.id = jQuery.trim(val.id);
		if (value instanceof Object && value.length > 0) {
			//recursive call
			$.each(value, function (key, val) {
				_trimItemsIds(key, val);
			});
		} else {
			val.subItems = [];
		}
	}

	function _sidebarMenuRecursiveLoad(key, val) {

		//actualFunction(key, val); 
		_buffer = "";
		var value = val['subItems'];
		if (value instanceof Object && value.length > 0) {
			//add submenu item
			_buffer += '<a href="#" class="menu-dropdown">'
				+ '<i class="' + val.iconClass + '"></i>'
				+ '<span class="menu-text">' + val.caption + ' </span>'
				+ '<i class="menu-expand"></i>'
			+ '</a>'
			+ '<ul class="submenu">';

			//recursive call
			$.each(value, function (key, val) {
				_buffer += '<li>' + _sidebarMenuRecursiveLoad(key, val) + '</li>';
			});

			//close sub menu item
			_buffer += '</ul>';

		} else {
			//link/click action available
			_link = val.link || "#";
			_linkTarget = val.linkTarget || "";
			val.id = jQuery.trim(val.id);

			_activeClass = "";

			if (val.id === jQuery.trim(ucSidebar.getActiveItem()))
				_activeClass = "active";


			//add menu item
			_buffer += '<li class="' + _activeClass + '">'
				+ '<a href="' + _link + '"' + ' id="' + val.id + '"';
			//target link
			if (_link != "#")
				_buffer += ' target="' + _linkTarget + '"';
			//else
			//data click
			//_buffer += ' data-click="true"';

			_buffer += '>'
			if (val.iconClass && val.iconClass != "")
				_buffer += '<i class="' + val.iconClass + '"></i>'

			_buffer += '<span class="menu-text">' + val.caption + '</span>'
				+ '</a>'
			+ '</li>';
		}
		return _buffer;
	}

	this.onSelectedItemExec = function (ev, a) {
		try {
			//inactive 
			this.setInactiveItem(this.getActiveItem());

			//active
			this.SelectedItem = a.id || 0;
			this.setActiveItem(this.SelectedItem);

			//execute gx event or link
			if (!$("#sidebar").hasClass("menu-compact")) {
				if (this.HasMenuSearch && $('#sidebar_search_input').get(0).value != '') {
					$('#sidebar_search_input').get(0).value = '';
					ucSidebar.onSearchExec('');
				}
				var activeItem = this.getActiveItem();
				if (activeItem && activeItem != "") {
					this.openItem(activeItem);
				}
			}
			if (this.IsScrollVisible()) {
				this.scrollTop = -1;
				this.updateSlimscroll(true);
			}

			if (a && $(a).attr("href") != "#")
				return false;
			this.OnSelectedItem();  //gx event

		} catch (ex) {
			gx.dbg.write(ex.toString());
		}
		return true;
	}

	this.onSearchExec = function (searchTxt) {
		try {
			var ul = $('#sidebar_ul').get(0);
			var state = readCookie("DVelopBootstrap_SidebarMenu_State");
			var found = 0;
			var groupAdded = false;
			var isFirst = true;
			var lastGroupTitleVisible = false;
			var lastGroupTitleIndex = -1;
			var cleaningSearch = !(searchTxt != null && searchTxt.length > 0);
			if (!cleaningSearch) {
				searchTxt = searchTxt.normalize('NFD').replace(/[\u0300-\u036f]/g, "");
			}
			for (var i = 0; i < ul.childNodes.length; i++) {
				var ul_i = ul.childNodes[i];
				if (ul_i.childNodes.length > 0 && $(ul_i).find('> a > span').length > 0) {
					if (this.onSearchOptionMatches(ul_i, searchTxt)) {
						if (lastGroupTitleIndex != -1) {
							if (!isFirst || $(ul.childNodes[lastGroupTitleIndex]).hasClass("menuGroupTitle")) {
								$(ul.childNodes[lastGroupTitleIndex]).slideDown(200);
							}
							else {
								$(ul.childNodes[lastGroupTitleIndex]).slideUp(200);
							}
							if (this.LiIsGroupTitle(ul, lastGroupTitleIndex + 1)) {
								$(ul.childNodes[lastGroupTitleIndex + 1]).slideDown(200);
							}
							lastGroupTitleIndex = -1;
						}
						isFirst = false;
					}
				}
				else if (this.LiIsGroupTitle(ul, i)) {
					if (cleaningSearch) {
						if (state == 'C' && $(ul_i).hasClass("menuGroupTitle")) {
							$(ul_i).slideUp(200);
						}
						else {
							$(ul_i).slideDown(200);
						}
					} else {
						if (lastGroupTitleIndex != -1) {
							$(ul.childNodes[lastGroupTitleIndex]).slideUp(200);
							if (this.LiIsGroupTitle(ul, lastGroupTitleIndex + 1)) {
								$(ul.childNodes[lastGroupTitleIndex + 1]).slideUp(200);
							}
						}
						lastGroupTitleIndex = i;
						if (this.LiIsGroupTitle(ul, i + 1)) {
							i++;
						}
					}
				}
			}
			if (lastGroupTitleIndex != -1) {
				$(ul.childNodes[lastGroupTitleIndex]).slideUp(200);
				if (this.LiIsGroupTitle(ul, lastGroupTitleIndex + 1)) {
					$(ul.childNodes[lastGroupTitleIndex + 1]).slideUp(200);
				}
			}
			if (this.AllMenuItemsVisibleAtLoad) {
				OpenAllMenuOptions();
			}
		} catch (ex) {
			gx.dbg.write(ex.toString());
		}
		return true;
	}

	this.LiIsGroupTitle = function (ul, i) {
		return (i < ul.childNodes.length && ($(ul.childNodes[i]).hasClass("menuGroupTitleDivider") || $(ul.childNodes[i]).hasClass("menuGroupTitle")));
	}

	this.onSearchOptionMatches = function (ul_i, searchTxt) {
		var ul_i_a = ul_i.getElementsByTagName('a')[0];
		var spanNode = ul_i_a.getElementsByTagName('span')[0];
		var title = $(spanNode).text();
		if (searchTxt != null && searchTxt.length > 0) {
			var ind = title.normalize('NFD').replace(/[\u0300-\u036f]/g, "").toLowerCase().indexOf(searchTxt.toLowerCase());
			if (ind >= 0) {
				title = title.substring(0, ind) + '<strong>' + title.substring(ind, ind + searchTxt.length) + '</strong>' + title.substring(ind + searchTxt.length);
				var dscSufix = spanNode.getAttribute('dscSuffix');
				if (dscSufix != null) {
					spanNode.innerHTML = title + dscSufix;
				} else {
					spanNode.innerHTML = title;
				}
				if (this.onSearchSubMenuOptionMatches(ul_i_a, searchTxt)) {
					if (!$(ul_i).hasClass("open")) {
						var ul_subMenu = ul_i_a.parentNode.getElementsByTagName('ul')[0];
						$(ul_subMenu).slideDown(200);
						$(ul_i).addClass("open");
						$(ul_i).slideDown(200);
					}
				}
				else if ($(ul_i_a).hasClass("menu-dropdown")) {
					$(ul_i).removeClass("open");
					this.onSearchSubMenuOptionMatches(ul_i_a, '');
					var ul_subMenu = ul_i_a.parentNode.getElementsByTagName('ul')[0];
					$(ul_subMenu).slideUp(200);
				}
				$(ul_i).slideDown(200);
				return true;
			} else {
				//verify if a submenu option matches
				spanNode.innerHTML = title;
				if (this.onSearchSubMenuOptionMatches(ul_i_a, searchTxt)) {
					var ul_subMenu = ul_i_a.parentNode.getElementsByTagName('ul')[0];
					$(ul_subMenu).slideDown(200);
					$(ul_i).addClass("open");
					$(ul_i).slideDown(200);
					return true;
				}
				else {
					$(ul_i).slideUp(200);
					return false;
				}
			}
		} else {
			spanNode.innerHTML = title;
			$(ul_i).slideDown(200);
			if ($(ul_i_a).hasClass("menu-dropdown")) {
				$(ul_i).removeClass("open");
				var ul_subMenu = ul_i_a.parentNode.getElementsByTagName('ul')[0];
				$(ul_subMenu).slideUp(200);
				this.onSearchSubMenuOptionMatches(ul_i_a, searchTxt);
			}
			return true;
		}
	}

	function OpenAllMenuOptions() {
		$(".page-sidebar ul").each(function (text) {
			$(this).css("display", "block");
			var li = $(this).closest("li");
			li.addClass("open");
		});
	}

	this.onSearchSubMenuOptionMatches = function (ul_i_a, searchTxt) {
		var ret = false;
		if ($(ul_i_a).hasClass("menu-dropdown")) {
			var ul_subMenu = ul_i_a.parentNode.getElementsByTagName('ul')[0];
			for (var i = 0; i < ul_subMenu.childNodes.length; i++) {
				var ul_subMenu_i = ul_subMenu.childNodes[i];
				if (ul_subMenu_i.childNodes.length > 0) {
					if (this.onSearchOptionMatches(ul_subMenu_i, searchTxt)) {
						ret = true;
					}
				}
			}
		}
		return ret;
	}

	function _requestAnimation(start) {
		if (start) //start
			$('.page-sidebar .sidebar-header-wrapper .searchicon')
				.removeClass('fa-search')
				.addClass('fa-spinner fa-spin');
		else //stop
			$('.page-sidebar .sidebar-header-wrapper .searchicon')
				.removeClass('fa-spinner fa-spin')
				.addClass('fa-search');
	}

	this.getActiveItem = function () {
		if (this.getActiveItem_loaded == window.location.href) {
			var itemId = readCookie("DVelopBootstrap_SidebarMenuSelected") || 0;
			ucSidebar.SelectedItem = itemId; /*used in gx uc*/
			return itemId;
		} else {
			this.getActiveItem_loaded = window.location.href;
			if (this.SidebarMenuOptionsData != undefined && this.SidebarMenuOptionsData.length > 0) {
				this.findActiveItemByUrlRecursive(this.SidebarMenuOptionsData);
			}
			return this.getActiveItem();
		}
	}

	this.findActiveItemByUrlRecursive = function (data) {
		var thisC = this;
		jQuery.each(data,
			function (key, val) {
				var value = val['subItems'];
				if (value instanceof Object && value.length > 0) {
					thisC.findActiveItemByUrlRecursive(value);
				}
				else if (val != null && val.link != null) {
					var valL = val.link.split(' ').join('%20');
					if (valL.indexOf('/') == -1) {
						valL = '/' + valL;
					}
					if (window.location.href.length >= valL.length && window.location.href.substring(window.location.href.length - valL.length, window.location.href.length).toLowerCase() == valL.toLowerCase()) {
						createCookie("DVelopBootstrap_SidebarMenuSelected", val.id);
						return false;
					}
				}
			}
		);
	}

	this.setActiveItem = function (id) {
		var a = $(".page-sidebar a[id='" + jQuery.trim(id) + "']");
		if (a && a.length > 0) {
			//remember active item
			createCookie("DVelopBootstrap_SidebarMenuSelected", id);
			//add active class to item
			a.closest("li").addClass("active");
		}
	}
	this.setInactiveItem = function (id) {
		var a = $(".page-sidebar a[id='" + jQuery.trim(id) + "']");
		if (a && a.length > 0) {
			//remove active
			a.closest("li").removeClass("active");
			createCookie("DVelopBootstrap_SidebarMenuSelected", "");
		}
		$(".page-sidebar li.active").each(function () {
			$(this).removeClass("active");
		});
	}
	this.openItem = function (id) {
		if (id && id != "") {

			var a = $(".page-sidebar a[id='" + jQuery.trim(id) + "']");
			var isCompact = $("#sidebar").hasClass("menu-compact");

			if (!isCompact && a && a.length == 1) {
				var submenus = a.parents("ul");
				$.each(submenus, function (i, submenu) {
					submenu = $(submenu);
					if (submenu.hasClass("submenu")) {
						var li = submenu.closest("li");
						li.addClass("open");
						submenu = submenu.closest("ul");
					} else {
						if (submenu.hasClass("sidebar-menu"))
							return false;
					}
				});
			}

			if (this.IsScrollVisible()) {
				this.scrollTop = -1;
			}
		}
	}
	this.getA_scrollTop = function (id) {
		var a = $(".page-sidebar a[id='" + jQuery.trim(id) + "']");
		if (a.length > 0) {
			var scrollMenuHeight = $(window).height() - $(".sidebar-menu").offset().top + $(window).scrollTop();
			a.is(':visible')
			var a_top = a.offset().top;
			if (a_top == 0 || !a.is(':visible')) {
				//item not visible (menu-compact)
				return 0;
			} else {
				var scrollTop = ($('.sidebar-menu').scrollTop() + a_top - $('.sidebar-menu').offset().top);
				if (scrollTop + a[0].scrollHeight + 10 <= scrollMenuHeight) {
					//item visible without scrolling
					return 0;
				} else {
					return scrollTop - (scrollMenuHeight - a[0].scrollHeight) / 2;
				}
			}
		} else {
			return 0;
		}
	}

	this.display = function () {


		if ($(window).width() <= 500) {
			$("#sidebar").addClass("hide");
			$(".page-content").addClass("hideMenu");
			$(".page-content").addClass("menu-compact");
			$(".sidebar-toggler").toggleClass("active");
			createCookie("DVelopBootstrap_SidebarMenu_State", "C");
		}

		var state = readCookie("DVelopBootstrap_SidebarMenu_State");

		if (state == "C") {
			ucSidebar.CollapseAux(true);
		} else if (state == "H") {
			ucSidebar.hide();
		} else {
			ucSidebar.ExpandAux(true);
		}

	}
	this.Expand = function () {
		this.ExpandAux(false);
	}

	this.ExpandAux = function (firstLoad) {

		createCookie("DVelopBootstrap_SidebarMenu_State", "E");

		if (!firstLoad && this.FirstLevelIsGrouping) {
			ucSidebar.onSearchExec('');
		}

		$(".page-content").removeClass("hideMenu");

		var b = $("#sidebar").hasClass("menu-compact");

		if (!$('#sidebar').is(':visible'))
			$("#sidebar").removeClass("hide");
		$(".sidebar-collapse").removeClass("active");
		$(".sidebar-toggler").removeClass("active");
		$(".page-content").removeClass("menu-compact");
		$('.page-sidebar').removeClass("menu-compact");

		if (this.ScrollWidth > 0) {
			this.updateScrollBottomSpace();
			this.updateSlimscroll(true);
		}

		//Update Pagination Bar Sizes
		var hasTransition = $(".page-content").css('transition-duration') != '0s, 0s, 0s';
		var totalizerGrids = $('table.GridWithTotalizer').length;
		var paginationBars = $('table.GridWithPaginationBar').length;
		if (hasTransition) {
			if (typeof (ClearMinWidthPaginationBars) === 'function') {
				ClearMinWidthPaginationBars();
			}

			$(".page-content").one("transitionend webkitTransitionEnd oTransitionEnd MSTransitionEnd", function () {
				//Update Pagination Bar Sizes
				if (typeof (SetMinWidthPaginationBars) === 'function') {
					SetMinWidthPaginationBars();
				}
			});
		}
		else {
			if (typeof (SetMinWidthPaginationBars) === 'function') {
				SetMinWidthPaginationBars();
			}
		}
		if (!firstLoad) {
			var activeItem = this.getActiveItem();
			if (activeItem && activeItem != "") {
				this.openItem(activeItem);
			}
			this.scrollTop = -1;
		}
	}
	this.CollapseExpand = function () {

		var state = readCookie("DVelopBootstrap_SidebarMenu_State");
		if (state == "C") {
			ucSidebar.Expand();
		}
		else if (state == "E") {
			ucSidebar.Collapse();
		}
	}

	this.Collapse = function () {
		this.CollapseAux(false);
	}
	this.CollapseAux = function (firstLoad) {

		createCookie("DVelopBootstrap_SidebarMenu_State", "C");

		if (this.HasMenuSearch) {
			$('#sidebar_search_input').get(0).value = '';
			ucSidebar.onSearchExec('');
		}


		//Sidebar Collapse
		var b = $("#sidebar").hasClass("menu-compact");

		if (!$('#sidebar').is(':visible'))
			$("#sidebar").addClass("hide");
		$("#sidebar").addClass("menu-compact");
		$(".sidebar-collapse").toggleClass("active");
		b = $("#sidebar").hasClass("menu-compact");

		$(".page-content").addClass("menu-compact");

		if (this.ScrollWidth > 0) {
			this.updateScrollBottomSpace();
			if (this.HideScrollInCompactMenu) {
				this.removeSlimscroll();
			}
			else {
				this.updateSlimscroll(true);
			}
		}

		if (b) {
			$(".open > .submenu")
				.removeClass("open");
		}

		//Update Pagination Bar Sizes
		if (typeof (SetMinWidthPaginationBars) === 'function') {
			SetMinWidthPaginationBars();
		}

		if (!firstLoad) {
			var activeItem = this.getActiveItem();
			if (activeItem && activeItem != "") {
				this.openItem(activeItem);
			}
		}
	}


	this.updateSlimscroll = function (animate) {
		if (this.timeoutSlimscroll != null) {
			clearTimeout(this.timeoutSlimscroll);
		}
		var thisC = this;
		this.timeoutSlimscroll = setTimeout(function () { thisC.createSlimscroll(animate); }, 400);
	}

	this.removeSlimscroll = function () {
		var sb = $('.sidebar-menu');
		if (sb.closest("div").hasClass("slimScrollDiv")) {
			sb.slimScroll({ destroy: true });
			sb.attr('style', '');
			sb.parent().find('>.slimScrollRail').remove();
			sb.parent().find('>.slimScrollBar').remove();
		}
	}

	this.createSlimscroll = function (animate) {
		var uc = this;
		var sb = $('.sidebar-menu');
		if (sb.length > 0) {
			var scrollHeight = $(window).height() - sb.offset().top + $(window).scrollTop();
			if (sb.closest("div").hasClass("slimScrollDiv")) {
				sb.height(scrollHeight - parseInt(sb.css('padding-bottom')));
				$('.slimScrollDiv').height(scrollHeight);
			} else {
				var sbParentPosition = sb.parent().position();
				var scrollPosition = sbParentPosition != null && sbParentPosition.left != null && sbParentPosition.left > (window.innerWidth / 2) ? 'right' : 'left';
				sb.slimscroll({
					height: scrollHeight,
					position: scrollPosition,
					size: uc.ScrollWidth + 'px',
					alwaysVisible: uc.ScrollAlwaysVisible
				});
			}
			a = sb.get(0);
			a.style.setProperty("overflow", "hidden", "important");
			sb.slimScroll().bind('slimscrolling', function (e, pos) {
				uc.scrollTop = sb.scrollTop();
			});
			sb.trigger('mouseenter');

			if (uc.scrollTop == -1) {
				uc.scrollTop = 0;
				var activeItem = uc.getActiveItem();
				if (activeItem && activeItem != "") {
					uc.scrollTop = uc.getA_scrollTop(activeItem);
				}
			}

			uc.scrollContent(uc.scrollTop, animate);
		}
	}
	this.scrollContent = function (y, animate) {
		var delta = y;
		var me = $('.sidebar-menu');
		var bar = $('.slimScrollBar');
		var maxTop = me.outerHeight() - bar.outerHeight();

		var offsetTop = delta / me[0].scrollHeight * me.outerHeight();
		offsetTop = Math.min(Math.max(offsetTop, 0), maxTop) + 'px';

		if (animate) {
			bar.animate({ top: offsetTop }, 200);
			var thisC = this;
			me.animate({ scrollTop: delta }, 200, 'swing', function () {
				thisC.scrollTop = $(".sidebar-menu").scrollTop();
			});
		} else {
			bar.css({ top: offsetTop });
			me.scrollTop(delta);
		}
	}

	this.hide = function () {
		createCookie("DVelopBootstrap_SidebarMenu_State", "H");
		$("#sidebar").addClass("hide");
		$(".sidebar-toggler").addClass("active");
		$(".page-content").addClass("hideMenu");
	}

	$(window).on('load', function () {

		//External UC handlers
		//Sidebar header Toggler : <-> header button
		$(".sidebar-toggler").on('click', function () {
			var h = $("#sidebar").hasClass("hide");
			//set state
			if (h)
				ucSidebar.Expand();
			else
				ucSidebar.hide();
			return false;
		});
		//End Sidebar header Toggler 

	});

	///UserCodeRegionEnd: (do not remove this comment.):
}
