
function DVelop_DynamicWebCanvas() {
	this.Width;
	this.Height;
	this.BackgroundImage;
	this.BackgroundScaleType;
	this.CreatedImageBase64Data;
	this.ItemClickedId;

	this.Canvas;
	this.HiddenCanvas;
	this.BGHiddenCanvas;
	this.BGHiddenCanvasLoaded = false;
	this.Items = [];
	this.ImageDrawn = false;

	this.show = function () {
		this.Canvas = document.createElement("canvas");
		this.HiddenCanvas = document.createElement("canvas");
		this.HiddenCanvas.style.display = 'none';
		this.BGHiddenCanvas = document.createElement("canvas");
		this.BGHiddenCanvas.style.display = 'none';
		this.BackupCanvas = document.createElement("canvas");
		this.BackupCanvas.style.display = 'none';
		this.Canvas.width = this.Width;
		this.Canvas.height = this.Height;
		this.HiddenCanvas.width = this.Width;
		this.HiddenCanvas.height = this.Height;
		this.BGHiddenCanvas.width = this.Width;
		this.BGHiddenCanvas.height = this.Height;
		this.DrawBackgound(true, this.Canvas);

		$('#' + this.ContainerName).append(this.Canvas)
									.append(this.HiddenCanvas)
									.append(this.BackupCanvas)
									.append(this.BGHiddenCanvas);

		var thisC = this;
		this.Canvas.addEventListener('click', function (event) {
			var x = event.offsetX;
			var y = event.offsetY;

			for (var i = thisC.Items.length - 1; i >= 0; i--) {
				var element = thisC.Items[i];
				if (y > element.y && y < element.y + element.height
					&& x > element.x && x < element.x + element.width) {
					thisC.ItemClickedId = element.id;
					thisC.OnItemClicked();
					break;
				}
			}

		}, false);

		$(this.Canvas).on("mousemove", function (event) {
			if (thisC.disableHover == null || !thisC.disableHover) {
				var x = event.offsetX;
				var y = event.offsetY;

				var lastHoverItem = thisC.hoverItem;
				var cursor = '';
				var found = false;
				for (var i = thisC.Items.length - 1; i >= 0; i--) {
					var element = thisC.Items[i];
					if (y > element.y && y < element.y + element.height
						&& x > element.x && x < element.x + element.width) {
						if (thisC.hoverItem != element) {
							if (thisC.hoverItem != null) {
								thisC.UndoHoverItem(thisC.hoverItem);
							}
							if (element.hoverEffect) {
								thisC.SaveItemToUndoHover(element);
							}
						}
						thisC.hoverItem = element;
						cursor = 'pointer';
						found = true;
						break;
					}
				}
				$(thisC.Canvas).css('cursor', thisC.hoverItem != null ? thisC.hoverItem.cursor : '');
				thisC.Canvas.title = thisC.hoverItem != null ? thisC.hoverItem.tooltip : '';
				if (thisC.hoverItem != null && thisC.hoverItem.hoverEffect) {
					if (found) {
						if (thisC.hoverItem != lastHoverItem) {
							thisC.DrawItemHovered(thisC.hoverItem);
						}
					}
					else {
						thisC.UndoHoverItem(thisC.hoverItem);
						thisC.hoverItem = null;
					}
				} else {
					thisC.hoverItem = null;
				}
			}
		});
	}
	this.SaveItemToUndoHover = function (itemToRepaint) {
		var hidden_ctx = this.BackupCanvas.getContext('2d');
		this.BackupCanvas.width = itemToRepaint.width;
		this.BackupCanvas.height = itemToRepaint.height;
		hidden_ctx.drawImage(
			this.Canvas,
			itemToRepaint.x,
			itemToRepaint.y,
			itemToRepaint.width,
			itemToRepaint.height,
			0,
			0,
			itemToRepaint.width,
			itemToRepaint.height
		);
	}
	this.UndoHoverItem = function (itemToRepaint) {
		var ctx = this.Canvas.getContext('2d');
		ctx.drawImage(
			this.BackupCanvas,
			0,
			0,
			itemToRepaint.width,
			itemToRepaint.height,
			itemToRepaint.x,
			itemToRepaint.y,
			itemToRepaint.width,
			itemToRepaint.height
		);
	}
	this.CopyHoveredItem = function (itemToRepaint) {

		var img = new Image();
		var ctx = this.Canvas.getContext('2d');
		ctx.drawImage(
			this.HiddenCanvas,
			itemToRepaint.x,
			itemToRepaint.y,
			itemToRepaint.width,
			itemToRepaint.height,
			itemToRepaint.x,
			itemToRepaint.y,
			itemToRepaint.width,
			itemToRepaint.height
		);
	}

	this.AdvancedAddOrUpdateImage = function (id, x, y, z, imageURL, width, height, cursor, tooltip, hoverEffect) {
		var obj = { id: id, x: x, y: y, z: z, imageURL: imageURL, width: width, height: height, cursor: cursor, tooltip: tooltip, hoverEffect: hoverEffect };

		var redrawCanvas = this.RemoveItemFromItems(id);
		redrawCanvas = this.AddItem(obj) || redrawCanvas || this.hoverItem != null;
		this.hoverItem = null;
		if (redrawCanvas) {
			this.WaitAndRedrawCanvas();
		} else {
			this.AddImageObj(obj, this.Canvas, null);
		}
	}

	this.AddOrUpdateImage = function (id, x, y, z, imageURL, width, height) {
		var obj = { id: id, x: x, y: y, z: z, imageURL: imageURL, width: width, height: height, cursor: 'pointer', tooltip: '', hoverEffect: true };

		var redrawCanvas = this.RemoveItemFromItems(id);
		redrawCanvas = this.AddItem(obj) || redrawCanvas || this.hoverItem != null;
		this.hoverItem = null;
		if (redrawCanvas) {
			this.WaitAndRedrawCanvas();
		} else {
			this.AddImageObj(obj, this.Canvas, null);
		}
	}
	this.AddItem = function (obj) {
		var newItemIndex = 0;
		while (newItemIndex < this.Items.length && this.Items[newItemIndex].z <= obj.z) {
			newItemIndex++;
		}
		this.Items.splice(newItemIndex, 0, obj);
		return (newItemIndex < this.Items.length - 1);
	}
	this.RemoveItem = function (id) {
		if (this.RemoveItemFromItems(id)) {
			this.WaitAndRedrawCanvas();
		}
	}

	this.RemoveItemFromItems = function (id) {
		this.hoverItem = null;
		var itemIndex = -1;
		for (var i = 0; i < this.Items.length; i++) {
			if (this.Items[i].id == id) {
				itemIndex = i;
				break;
			}
		}
		if (itemIndex != -1) {
			this.Items.splice(itemIndex, 1);
			return true;
		}
		return false;
	}

	this.WaitAndRedrawCanvas = function () {
		this.disableHover = true;
		var thisC = this;
		console.log('disabling hoverItem');
		if (this.disableHoverTimer != null) {
			clearTimeout(this.disableHoverTimer);
		}

		if (this.reDrawTimer != null) {
			clearTimeout(this.reDrawTimer);
		}
		this.reDrawTimer = setTimeout(function () {
			thisC.RedrawCanvas();
		}, 100);
	}
	this.EnableHover = function () {
		this.disableHover = false;
	}
	this.DrawItemHovered = function (hoverItem) {
		this.DrawBackgound(false, this.HiddenCanvas);
		for (var i = 0; i < this.Items.length; i++) {
			var element = this.Items[i];
			if (hoverItem.y <= element.y + element.height
				&& hoverItem.y + hoverItem.height >= element.y
				&& hoverItem.x <= element.x + element.width
				&& hoverItem.x + hoverItem.width >= element.x) {
				this.AddImageObj(element, this.HiddenCanvas, hoverItem);
			}
		}
	}

	this.RedrawCanvas = function () {
		this.ImageDrawn = false;
		var canvas = this.Canvas;
		this.DrawBackgound(false, canvas);
		for (var i = 0; i < this.Items.length; i++) {
			this.AddImageObj(this.Items[i], canvas, null);
		}
		var thisC = this;
		this.disableHoverTimer = setTimeout(function () {
			thisC.EnableHover();
		}, 100);
	}

	this.AddImageObj = function (obj, canvas, hoverItem) {
		var img = new Image();
		var thisC = this;
		img.onload = function () {
			thisC.ImageDrawn = true;
			if (canvas == null) {
				var t = 0;
			}
			var ctx = canvas.getContext("2d");
			ctx.globalAlpha = 1;
			if (hoverItem != null && hoverItem.id != null && hoverItem.id == obj.id) {
				ctx.globalAlpha = 0.7;
			}
			if (obj.width > 0 || obj.height > 0) {
				ctx.drawImage(img, obj.x, obj.y, obj.width, obj.height);
			} else {
				obj.width = this.width;
				obj.height = this.height;
				ctx.drawImage(img, obj.x, obj.y);
			}
			if (hoverItem != null && hoverItem == thisC.hoverItem) {
				thisC.CopyHoveredItem(hoverItem);
			}
		};
		img.src = obj.imageURL;
	}

	this.SaveImage = function () {
		this.CreatedImageBase64Data = this.Canvas.toDataURL();
		if (this.CreatedImageBase64Data.length > 22) {
			this.CreatedImageBase64Data = this.CreatedImageBase64Data.substring(22);
		}
		this.OnImageSaved();
	}

	this.ResetCanvas = function () {
		this.Canvas.width = this.Width;
		this.Canvas.height = this.Height;
		this.HiddenCanvas.width = this.Width;
		this.HiddenCanvas.height = this.Height;
		this.BGHiddenCanvas.width = this.Width;
		this.BGHiddenCanvas.height = this.Height;
		this.BGHiddenCanvasLoaded = false;
		this.ImageDrawn = false;
		this.DrawBackgound(false, this.Canvas);
		this.Items = [];
	}

	this.DrawBackgound = function (isFirstLoad, canvas) {
		var ctx = canvas.getContext('2d');
		/*if (!isFirstLoad) {
			ctx.clearRect(0, 0, canvas.width, canvas.height);
		}*/
		if (this.BackgroundImage != '') {
			var ctx = canvas.getContext("2d");
			ctx.globalAlpha = 1;
			if (this.BGHiddenCanvasLoaded) {
				ctx.drawImage(
					this.BGHiddenCanvas,
					0,
					0,
					canvas.width,
					canvas.height,
					0,
					0,
					canvas.width,
					canvas.height
				);
			}
			else {
				var thisC = this;
				var img = new Image();
				img.onload = function () {
					console.log('loafing bg');
					if (!(this.width > 0 && this.height > 0) || thisC.BackgroundScaleType == 'NoScale') {
						var x = (thisC.Canvas.width - this.width) / 2;
						var y = (thisC.Canvas.height - this.height) / 2;
						ctx.drawImage(img, x, y);
						thisC.BGHiddenCanvas.getContext("2d").drawImage(img, x, y);
					}
					else if (thisC.BackgroundScaleType == 'Tile') {
						var y = 0;
						while (y < thisC.Canvas.height) {
							var x = 0;
							while (x < thisC.Canvas.width) {
								ctx.drawImage(img, x, y);
								thisC.BGHiddenCanvas.getContext("2d").drawImage(img, x, y);
								x += this.width;
							}
							y += this.height;
						}
					}
					else if (thisC.BackgroundScaleType == 'Fill') {
						ctx.drawImage(img, 0, 0, thisC.Canvas.width, thisC.Canvas.height);
						thisC.BGHiddenCanvas.getContext("2d").drawImage(img, 0, 0, thisC.Canvas.width, thisC.Canvas.height);
					}
					else if (thisC.BackgroundScaleType == 'FillKeepingAspectRatio') {
						var w = this.width;
						var h = this.height;
						if (thisC.Canvas.width * h / w >= thisC.Canvas.height) {
							h = thisC.Canvas.width * h / w;
							w = thisC.Canvas.width;
						} else {
							w = thisC.Canvas.height * w / h;
							h = thisC.Canvas.height;
						}
						var x = (thisC.Canvas.width - w) / 2;
						var y = (thisC.Canvas.height - h) / 2;
						ctx.drawImage(img, x, y, w, h);
						thisC.BGHiddenCanvas.getContext("2d").drawImage(img, x, y, w, h);
					}
					else {
						var w = this.width;
						var h = this.height;
						if (thisC.Canvas.width * h / w <= thisC.Canvas.height) {
							h = thisC.Canvas.width * h / w;
							w = thisC.Canvas.width;
						} else {
							w = thisC.Canvas.height * w / h;
							h = thisC.Canvas.height;
						}
						var x = (thisC.Canvas.width - w) / 2;
						var y = (thisC.Canvas.height - h) / 2;
						ctx.drawImage(img, x, y, w, h);
						thisC.BGHiddenCanvas.getContext("2d").drawImage(img, x, y, w, h);
					}
					thisC.BGHiddenCanvasLoaded = true;
					if (isFirstLoad && thisC.ImageDrawn && canvas == thisC.Canvas) {
						thisC.WaitAndRedrawCanvas();
					}
				};
				img.src = this.BackgroundImage;
			}
		}
	}
}
