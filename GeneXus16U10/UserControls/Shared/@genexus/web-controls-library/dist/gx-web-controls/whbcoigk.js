/*! Built with http://stenciljs.com */
/*! Built with http://stenciljs.com */
const {h: e} = window.GxWebControls;

import { a as t } from "./chunk-e6709a3b.js";

class a extends(function(t) {
  return class extends t {
    constructor() {
      super(...arguments), this.disabled = !1, this.revealed = !1;
    }
    getNativeInputId() {
      return this.innerEdit.getNativeInputId();
    }
    getValueFromEvent(e) {
      return e.target && e.target.value;
    }
    handleChange(e) {
      this.value = this.getValueFromEvent(e), this.onChange.emit(e);
    }
    handleInput(e) {
      this.value = this.getValueFromEvent(e), this.onInput.emit(e);
    }
    handleTriggerClick() {
      this.innerEdit.type = this.revealed ? "text" : "password";
    }
    /**
         * Update the native input element when the value changes
         */    valueChanged() {
      const e = this.innerEdit;
      e && e.value !== this.value && (e.value = this.value);
    }
    componentDidUnload() {
      this.innerEdit = null;
    }
    render() {
      return e("gx-edit", {
        ref: e => this.innerEdit = e,
        "css-class": this.cssClass,
        disabled: this.disabled,
        id: this.id,
        placeholder: this.placeholder,
        readonly: this.readonly,
        "show-trigger": !this.readonly && this.showRevealButton,
        "trigger-class": this.revealed ? "active" : "",
        "trigger-text": this.revealed ? this.revealButtonTextOff : this.revealButtonTextOn,
        type: this.revealed ? "text" : "password",
        value: this.value,
        onChange: this.handleChange.bind(this),
        onInput: this.handleInput.bind(this)
      }, e("i", {
        class: "fa fa-eye" + (this.revealed ? "-slash" : ""),
        slot: "trigger-content"
      }));
    }
  };
}(t)){
  constructor() {
    super(...arguments), 
    /**
         * This attribute lets you specify how this element will behave when hidden.
         *
         * | Value        | Details                                                                     |
         * | ------------ | --------------------------------------------------------------------------- |
         * | `keep-space` | The element remains in the document flow, and it does occupy space.         |
         * | `collapse`   | The element is removed form the document flow, and it doesn't occupy space. |
         */
    this.invisibleMode = "collapse", 
    /**
         * This attribute lets you specify if the element is disabled.
         * If disabled, it will not fire any user interaction related event
         * (for example, click event).
         */
    this.disabled = !1, this.revealed = !1;
  }
  /**
     * Returns the id of the inner `input` element (if set).
     */  getNativeInputId() {
    return super.getNativeInputId();
  }
  valueChanged() {
    super.valueChanged();
  }
  handleTriggerClick() {
    this.revealed = !this.revealed, super.handleTriggerClick();
  }
  static get is() {
    return "gx-password-edit";
  }
  static get properties() {
    return {
      cssClass: {
        type: String,
        attr: "css-class"
      },
      disabled: {
        type: Boolean,
        attr: "disabled"
      },
      element: {
        elementRef: !0
      },
      getNativeInputId: {
        method: !0
      },
      id: {
        type: String,
        attr: "id"
      },
      invisibleMode: {
        type: String,
        attr: "invisible-mode"
      },
      placeholder: {
        type: String,
        attr: "placeholder"
      },
      readonly: {
        type: Boolean,
        attr: "readonly"
      },
      revealButtonTextOff: {
        type: String,
        attr: "reveal-button-text-off"
      },
      revealButtonTextOn: {
        type: String,
        attr: "reveal-button-text-on"
      },
      revealed: {
        state: !0
      },
      showRevealButton: {
        type: Boolean,
        attr: "show-reveal-button"
      },
      value: {
        type: String,
        attr: "value",
        mutable: !0,
        watchCallbacks: [ "valueChanged" ]
      }
    };
  }
  static get events() {
    return [ {
      name: "onChange",
      method: "onChange",
      bubbles: !0,
      cancelable: !0,
      composed: !0
    }, {
      name: "onInput",
      method: "onInput",
      bubbles: !0,
      cancelable: !0,
      composed: !0
    } ];
  }
  static get listeners() {
    return [ {
      name: "gxTriggerClick",
      method: "handleTriggerClick"
    } ];
  }
  static get style() {
    return "gx-edit{display:block}gx-edit[hidden]{display:none}gx-edit[hidden][invisible-mode=keep-space]{display:block;visibility:hidden}";
  }
}

export { a as GxPasswordEdit };