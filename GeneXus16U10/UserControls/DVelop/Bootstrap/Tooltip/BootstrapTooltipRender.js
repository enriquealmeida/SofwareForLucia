function BootstrapTooltip() {
	this.LabelsShowDelay;
	this.ButtonsShowDelay;
	this.InputsShowDelay;
	this.ImagesShowDelay;
	this.HideDelay;
	this.Width;
	this.Height;
	this.ClassSelector;
	this.DefaultPosition;
	this.Timer;

	this.show = function () {

		this.renderTooltip(null);

		var thisC = this;

		this.Timer = window.setTimeout(function () {
			thisC.renderTooltip(null);
		}, 1000);

		gx.fx.obs.addObserver("gx.onafterevent", window, function (thisC) {
			return function (e) {
				thisC.Timer = window.setTimeout(function () {
					thisC.renderTooltip(null);
				}, 500);
			}
		}(this));

		gx.fx.obs.addObserver("grid.onafterrender", window, function (thisC) {
			return function (e) {
				thisC.Timer = window.setTimeout(function () {
					thisC.renderTooltip(null);
				}, 500);
			}
		}(this));
	}

	this.renderTooltip = function (titleSelector) {
		clearTimeout(this.Timer);
		if (titleSelector == null || titleSelector == '') {
			titleSelector = 'title';
			var thisC = this;
			var timer2 = window.setTimeout(function () {
				thisC.renderTooltip('data-original-title');
			}, 1000);
		}
		if (this.ClassSelector.length < 1) {
			if (this.DefaultPosition.length > 0) {
				$("[" + titleSelector + "]").attr("data-placement", this.DefaultPosition);
			} else {
				$("[" + titleSelector + "]").attr("data-placement", "bottom");
			}
			$(".Top[" + titleSelector + "]").attr("data-placement", "top");
			$(".Left[" + titleSelector + "]").attr("data-placement", $('body').css('direction') == 'rtl' ? "right" : "left");
			$(".Right[" + titleSelector + "]").attr("data-placement", $('body').css('direction') == 'rtl' ? "left" : "right");
			$(".Bottom[" + titleSelector + "]").attr("data-placement", "bottom");

			//all dom elements with title
			$("[" + titleSelector + "]:not(span,input,img)").tooltip({ animation: 'true', html: 'true', delay: { hide: this.HideDelay } });
			//all inputs 
			$("input:not([type=button])[" + titleSelector + "]").tooltip({ animation: 'true', html: 'true', delay: { show: this.InputsShowDelay, hide: this.HideDelay } });
			//only inputs of type button 
			$("input[type=button][" + titleSelector + "]").tooltip({ animation: 'true', html: 'true', delay: { show: this.ButtonsShowDelay, hide: this.HideDelay } });
			//all spans 
			$("span[" + titleSelector + "]").tooltip({ animation: 'true', html: 'true', delay: { show: this.LabelsShowDelay, hide: this.HideDelay } });
			//all images 
			$("img[" + titleSelector + "]").tooltip({ animation: 'true', html: 'true', delay: { show: this.ImagesShowDelay, hide: this.HideDelay } });
		} else {
			$("." + this.ClassSelector + "Left[" + titleSelector + "]").attr("data-placement", $('body').css('direction') == 'rtl' ? "right" : "left");
			$("." + this.ClassSelector + "Top[" + titleSelector + "]").attr("data-placement", "top");
			$("." + this.ClassSelector + "Bottom[" + titleSelector + "]").attr("data-placement", "bottom");
			$("." + this.ClassSelector + "Right[" + titleSelector + "]").attr("data-placement", $('body').css('direction') == 'rtl' ? "left" : "right");
			if (this.DefaultPosition.length > 0) {
				$("." + this.ClassSelector + "[" + titleSelector + "]").attr("data-placement", this.DefaultPosition);
			} else {
				$("." + this.ClassSelector + "[" + titleSelector + "]").attr("data-placement", "bottom");
			}

			//all dom elements with title
			$("." + this.ClassSelector + "[" + titleSelector + "]:not(span,input,img)").tooltip({ animation: 'true', html: 'true', delay: { hide: this.HideDelay } });
			//all inputs 
			$("input." + this.ClassSelector + ":not([type=button])[" + titleSelector + "]").tooltip({ animation: 'true', html: 'true', delay: { show: this.InputsShowDelay, hide: this.HideDelay } });
			//only inputs of type button 
			$("input[type=button]." + this.ClassSelector + "[" + titleSelector + "]").tooltip({ animation: 'true', html: 'true', delay: { show: this.ButtonsShowDelay, hide: this.HideDelay } });
			//all spans 
			$("span." + this.ClassSelector + "[" + titleSelector + "]").tooltip({ animation: 'true', html: 'true', delay: { show: this.LabelsShowDelay, hide: this.HideDelay } });
			//all images 
			$("img." + this.ClassSelector + "[" + titleSelector + "]").tooltip({ animation: 'true', html: 'true', delay: { show: this.ImagesShowDelay, hide: this.HideDelay } });

			/*LEFT*/

			//all dom elements with title
			$("." + this.ClassSelector + "Left[" + titleSelector + "]:not(span,input,img)").tooltip({ animation: 'true', html: 'true', delay: { hide: this.HideDelay } });
			//all inputs 
			$("input." + this.ClassSelector + "Left:not([type=button])[" + titleSelector + "]").tooltip({ animation: 'true', html: 'true', delay: { show: this.InputsShowDelay, hide: this.HideDelay } });
			//only inputs of type button 
			$("input[type=button]." + this.ClassSelector + "Left[" + titleSelector + "]").tooltip({ animation: 'true', html: 'true', delay: { show: this.ButtonsShowDelay, hide: this.HideDelay } });
			//all spans 
			$("span." + this.ClassSelector + "Left[" + titleSelector + "]").tooltip({ animation: 'true', html: 'true', delay: { show: this.LabelsShowDelay, hide: this.HideDelay } });
			//all images 
			$("img." + this.ClassSelector + "Left[" + titleSelector + "]").tooltip({ animation: 'true', html: 'true', delay: { show: this.ImagesShowDelay, hide: this.HideDelay } });

			/*TOP*/

			//all dom elements with title
			$("." + this.ClassSelector + "Top[" + titleSelector + "]:not(span,input,img)").tooltip({ animation: 'true', html: 'true', delay: { hide: this.HideDelay } });
			//all inputs 
			$("input." + this.ClassSelector + "Top:not([type=button])[" + titleSelector + "]").tooltip({ animation: 'true', html: 'true', delay: { show: this.InputsShowDelay, hide: this.HideDelay } });
			//only inputs of type button 
			$("input[type=button]." + this.ClassSelector + "Top[" + titleSelector + "]").tooltip({ animation: 'true', html: 'true', delay: { show: this.ButtonsShowDelay, hide: this.HideDelay } });
			//all spans 
			$("span." + this.ClassSelector + "Top[" + titleSelector + "]").tooltip({ animation: 'true', html: 'true', delay: { show: this.LabelsShowDelay, hide: this.HideDelay } });
			//all images 
			$("img." + this.ClassSelector + "Top[" + titleSelector + "]").tooltip({ animation: 'true', html: 'true', delay: { show: this.ImagesShowDelay, hide: this.HideDelay } });

			/*RIGHT*/

			//all dom elements with title
			$("." + this.ClassSelector + "Right[" + titleSelector + "]:not(span,input,img)").tooltip({ animation: 'true', html: 'true', delay: { hide: this.HideDelay } });
			//all inputs 
			$("input." + this.ClassSelector + "Right:not([type=button])[" + titleSelector + "]").tooltip({ animation: 'true', html: 'true', delay: { show: this.InputsShowDelay, hide: this.HideDelay } });
			//only inputs of type button 
			$("input[type=button]." + this.ClassSelector + "Right[" + titleSelector + "]").tooltip({ animation: 'true', html: 'true', delay: { show: this.ButtonsShowDelay, hide: this.HideDelay } });
			//all spans 
			$("span." + this.ClassSelector + "Right[" + titleSelector + "]").tooltip({ animation: 'true', html: 'true', delay: { show: this.LabelsShowDelay, hide: this.HideDelay } });
			//all images 
			$("img." + this.ClassSelector + "Right[" + titleSelector + "]").tooltip({ animation: 'true', html: 'true', delay: { show: this.ImagesShowDelay, hide: this.HideDelay } });

			/*BOTTOM*/

			//all dom elements with title
			$("." + this.ClassSelector + "Bottom[" + titleSelector + "]:not(span,input,img)").tooltip({ animation: 'true', html: 'true', delay: { hide: this.HideDelay } });
			//all inputs 
			$("input." + this.ClassSelector + "Bottom:not([type=button])[" + titleSelector + "]").tooltip({ animation: 'true', html: 'true', delay: { show: this.InputsShowDelay, hide: this.HideDelay } });
			//only inputs of type button 
			$("input[type=button]." + this.ClassSelector + "Bottom[" + titleSelector + "]").tooltip({ animation: 'true', html: 'true', delay: { show: this.ButtonsShowDelay, hide: this.HideDelay } });
			//all spans
			$("span." + this.ClassSelector + "Bottom[" + titleSelector + "]").tooltip({ animation: 'true', html: 'true', delay: { show: this.LabelsShowDelay, hide: this.HideDelay } });
			//all images 
			$("img." + this.ClassSelector + "Bottom[" + titleSelector + "]").tooltip({ animation: 'true', html: 'true', delay: { show: this.ImagesShowDelay, hide: this.HideDelay } });
		}
	}
}


