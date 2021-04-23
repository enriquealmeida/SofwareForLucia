/*! Built with http://stenciljs.com */
var __extends = this && this.__extends || function() {
  var e = Object.setPrototypeOf || {
    __proto__: []
  } instanceof Array && function(e, t) {
    e.__proto__ = t;
  } || function(e, t) {
    for (var n in t) t.hasOwnProperty(n) && (e[n] = t[n]);
  };
  return function(t, n) {
    function __() {
      this.constructor = t;
    }
    e(t, n), t.prototype = null === n ? Object.create(n) : (__.prototype = n.prototype, 
    new __());
  };
}();

/*! Built with http://stenciljs.com */ import { h } from "./gx-web-controls.core.js";

import { a as BaseComponent } from "./chunk-e6709a3b.js";

var TabPage = /** @class */ function(e) {
  function TabPage() {
    return null !== e && e.apply(this, arguments) || this;
  }
  return __extends(TabPage, e), TabPage.prototype.componentWillLoad = function() {
    this.element.id || (this.element.id = "gx-tab-page-auto-id-" + autoTabId++);
  }, TabPage.prototype.hostData = function() {
    return {
      role: "tabpanel",
      tabindex: 0
    };
  }, TabPage.prototype.render = function() {
    return h("slot", null);
  }, Object.defineProperty(TabPage, "is", {
    get: function() {
      return "gx-tab-page";
    },
    enumerable: !0,
    configurable: !0
  }), Object.defineProperty(TabPage, "properties", {
    get: function() {
      return {
        element: {
          elementRef: !0
        }
      };
    },
    enumerable: !0,
    configurable: !0
  }), Object.defineProperty(TabPage, "style", {
    get: function() {
      return "gx-tab-page{display:block}gx-tab-page[hidden]{display:none}gx-tab-page[hidden][invisible-mode=keep-space]{display:block;visibility:hidden}";
    },
    enumerable: !0,
    configurable: !0
  }), TabPage;
}(BaseComponent), autoTabId = 0;

export { TabPage as GxTabPage };