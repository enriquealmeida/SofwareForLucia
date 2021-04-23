var qv = { collection: {} }

qv.util = {

	color: {

		getHtmlColor: function (color) {
			var htmlColor;
			if ((typeof (color) == "string") || (typeof (color) == "number")) {
				if (gx.color.toHex) {
					if (color == -1) // -1 = null color
						htmlColor = "";
					else htmlColor = "#" + gx.color.toHex(color); // GeneXus X Ev. 1
				} else htmlColor = "#" + gxToHex(color) // GeneXus X
			} else htmlColor = (color == undefined ? "#000000" : color.Html);
			return htmlColor;
		},

		parseCSSColor: function (color) {
			if (color.substring(0, 3) == "rgb") {
				var values = color.replace("rgb", "").replace("(", "").replace(")", "").split(",");
				var numColor = gx.color.rgb(parseInt(values[0]), parseInt(values[1]), parseInt(values[2]));
				return this.getHtmlColor(numColor);
			} else return color;
		},

		convertValueToColor: function (value) {
			var valueColor;
			if (value.indexOf("#") == -1)
				valueColor = "#" + value;
			else
				valueColor = value;
			var vColor = valueColor.substring(1, valueColor.length);
			while (vColor.length < 6)
				vColor = "0" + vColor;
			return "#" + vColor;
		}

	},

	css: (function () {

		var CSSStyles = {}

		function getCSSStyle(className) {
			if (CSSStyles[className] != undefined)
				return CSSStyles[className];
			else {
				styleObj = loadCSSStyle(className);
				if (styleObj != undefined) {
					styleTransformed = transformCSSStyle(styleObj)
					CSSStyles[className] = styleTransformed;
					return styleTransformed;
				} else return "";
			}
		}

		function loadCSSStyle(className) {
			var css;
			var cssName = gx.theme + ".css";
			var cssFound = false;
			var styleObj;
			for (var i = 0; i < document.styleSheets.length; i++)
				if (document.styleSheets[i].href != null && document.styleSheets[i].href.indexOf(cssName) >= 0) {
					cssFound = true;
					css = document.styleSheets[i];
					break;
				}
			if (cssFound) if (css.cssRules) crossRules = css.cssRules;
			else if (css.rules) crossRules = css.rules;
			var lengthRuleSelected = Number.MAX_SAFE_INTEGER;
			for (var i = 0; i < crossRules.length; i++) {
				var rule = crossRules[i];
				if (rule.selectorText != undefined)
					if (rule.selectorText.toLowerCase().indexOf("." + className.toLowerCase()) == 0 && rule.selectorText.length < lengthRuleSelected) {
						styleObj = rule.style;
						lengthRuleSelected = rule.selectorText.length;
					}
			}
			return styleObj;
		}

		function transformCSSStyle(styleObj) {
			var strAux = "";
			if (styleObj.color != "") strAux += (strAux == "" ? "" : ";") + "color:" + qv.util.color.parseCSSColor(styleObj.color);
			if (styleObj.backgroundColor != "") strAux += (strAux == "" ? "" : ";") + "backgroundColor:" + qv.util.color.parseCSSColor(styleObj.backgroundColor);
			if (styleObj.borderStyle != "") strAux += (strAux == "" ? "" : ";") + "borderStyle:" + styleObj.borderStyle;
			if (styleObj.borderWidth != "") strAux += (strAux == "" ? "" : ";") + "borderThickness:" + styleObj.borderWidth.replace("pt", "").replace("px", "");
			if (styleObj.borderColor != "") strAux += (strAux == "" ? "" : ";") + "borderColor:" + qv.util.color.parseCSSColor(styleObj.borderColor);
			//if (styleObj.paddingLeft != "")        strAux += (strAux == "" ? "" : ";") + "paddingLeft:"      + styleObj.paddingLeft.replace("pt", "").replace("px", "");
			//if (styleObj.paddingRight != "")       strAux += (strAux == "" ? "" : ";") + "paddingRight:"     + styleObj.paddingRight.replace("pt", "").replace("px", "");
			//if (styleObj.paddingTop != "")         strAux += (strAux == "" ? "" : ";") + "paddingTop:"       + styleObj.paddingTop.replace("pt", "").replace("px", "");
			//if (styleObj.paddingBottom != "")      strAux += (strAux == "" ? "" : ";") + "paddingBottom:"    + styleObj.paddingBottom.replace("pt", "").replace("px", "");
			if (styleObj.fontFamily != "") strAux += (strAux == "" ? "" : ";") + "fontFamily:" + styleObj.fontFamily.replace(/"/g, "").replace(/'/g, "");
			if (styleObj.fontSize != "") strAux += (strAux == "" ? "" : ";") + "fontSize:" + styleObj.fontSize.replace("pt", "").replace("px", "");
			if (styleObj.fontWeight != "") strAux += (strAux == "" ? "" : ";") + "fontWeight:" + styleObj.fontWeight;
			if (styleObj.fontStyle != "") strAux += (strAux == "" ? "" : ";") + "fontStyle:" + styleObj.fontStyle;
			if (styleObj.textDecoration != "") strAux += (strAux == "" ? "" : ";") + "textDecoration:" + styleObj.textDecoration;
			//if (styleObj.textAlign != "")          strAux += (strAux == "" ? "" : ";") + "textAlign:"        + styleObj.textAlign;

			// Faltan
			//    backgroundAlpha   = "1"     // 0 .. 1
			//    cornerRadius    = "0"       // 0 .. n
			//    dropShadowEnabled = "true"    // true | false
			//    shadowDirection   = "right"   // left | right | center
			return strAux;
		}
	
		return {

			replaceCssClasses: function (xml) {
				var replaceMarker = "gxpl_cssReplace(";
				while ((posIni = xml.indexOf(replaceMarker)) >= 0) {
					posFin = xml.indexOf(")", posIni);
					className = xml.substring(posIni + replaceMarker.length, posFin);
					style = getCSSStyle(className);
					toReplace = xml.substring(posIni, posFin + 1);
					xml = xml.replace(toReplace, style);
				}
				return xml;
			},

			parseStyle: function (style) {
				var cssStyle = "";
				if (style != "" && style != undefined) {
					if (style.indexOf(":") < 0)
						return style;	// No se parsea pues el el nombre de una clase
					else {
						var arr = style.split(";");
						for (var i = 0; i < arr.length; i++) {
							var arr2 = arr[i].split(":");
							var key = arr2[0];
							var value = arr2[1];
							var key2 = (key == "borderThickness" ? "borderWidth" : key);
							var units = (key == "borderThickness" || key == "fontSize" ? "px" : "");
							cssStyle += (cssStyle == "" ? "" : ",") + '"' + key2 + '":"' + value + units + '"';
						}
					}
					return "{" + cssStyle + "}";
				}
				return "{}";
			}

		}

	})(),

	autorefresh: (function () {

		return {

			UpdateLayoutSameGroup: function (qViewer, xml) {

				function ParseParametersXML(qViewer, xml) {
					var xmlDoc = qv.util.dom.xmlDocument(xml);
					var rootElement = qv.util.dom.getSingleElementByTagName(xmlDoc, "gxpl_ParameterCollection");
					if (qViewer.Metadata == undefined)
						qViewer.Metadata = {};
					qViewer.Metadata.Parameters = [];
					var parameters = qv.util.dom.getMultipleElementsByTagName(rootElement, "gxpl_Parameter");
					for (var i = 0; i < parameters.length; i++) {
						var parameter = {};
						parameter.Name = qv.util.dom.getValueNode(qv.util.dom.getSingleElementByTagName(parameters[i], "Name"));
						parameter.Type = qv.util.dom.getValueNode(qv.util.dom.getSingleElementByTagName(parameters[i], "Type"));
						parameter.IsCollection = gx.lang.gxBoolean(qv.util.dom.getValueNode(qv.util.dom.getSingleElementByTagName(parameters[i], "IsCollection")));
						qViewer.Metadata.Parameters.push(parameter);
					}
				}

				function UpdateTargetAxesAndParametersFromSourceAxes(qViewer, sourceAxes, sourceTableType) {
					
					function GetFieldInQuery(qViewer, fieldName) {

						function GetFieldInCollection(col, property, fieldName) {
							for (var i = 0 ; i < col.length; i++) {
								var field = col[i];
								if (field[property] == fieldName)
									return field;
							}
							return null;
						}

						function GetAxisInQuery(qViewer, fieldName) {
							return GetFieldInCollection(qViewer.Metadata.Axes, "Name", fieldName);
						}

						function GetDatumInQuery(qViewer, fieldName) {
							return GetFieldInCollection(qViewer.Metadata.Data, "Name", fieldName);
						}

						var field = GetAxisInQuery(qViewer, fieldName);
						if (field == null)
							field = GetDatumInQuery(qViewer, fieldName);
						return field;

					}

					function GetRuntimeAxis(qViewer, axisName) {
						var runtimeAxis = null;
						for (var i = 0; i < qViewer.Axes.length; i++) {
							if (qViewer.Axes[i].Name == axisName) {
								runtimeAxis = qViewer.Axes[i];
								break;
							}
						}
						return runtimeAxis;
					}

					function CopyAxisInfo(sourceAxis, targetAxis) {
						if (targetAxis.Title == undefined)
							targetAxis.Title = "";		// porque sino pone "undefined"
						if (targetAxis.Visible == undefined)
							targetAxis.Visible = true;
						if (targetAxis.Aggregation == undefined)
							targetAxis.Aggregation = "";		// porque sino pone "undefined"
						if (targetAxis.AxisOrder == undefined)
							targetAxis.AxisOrder = { Type: "None" };
						if (targetAxis.Format == undefined)
							targetAxis.Format = { Subtotals: "Yes", CanDragToPages: true };
						if (targetAxis.Actions == undefined)
							targetAxis.Actions = { RaiseItemClick: true };
						qv.util.MergeFields(targetAxis, sourceAxis);
					}

					function GetParameterInQuery(qViewer, axisName) {
						for (var i = 0 ; i < qViewer.Metadata.Parameters.length; i++) {
							var parameter = qViewer.Metadata.Parameters[i];
							if (parameter.IsCollection && parameter.Name == axisName)
								return [i, parameter];
						}
						return [null, null];
					}

					function GetRuntimeParameter(qViewer, axisName) {
						var runtimeParameter = null;
						for (var i = 0; i < qViewer.Parameters.length; i++) {
							if (qViewer.Parameters[i].Name == axisName) {
								runtimeParameter = qViewer.Parameters[i];
								break;
							}
						}
						return runtimeParameter;
					}

					function GetRuntimeParameterValue(sourceAxis, parameter) {
						var valueList = "";
						var delimiter = (parameter.Type == "I" || parameter.Type == "R" || parameter.Type == "B" ? "" : "\"");
						for (var i = 0; i < sourceAxis.Filter.Values.length; i++) {
							valueList += (valueList == "" ? "" : ",") + delimiter + sourceAxis.Filter.Values[i] + delimiter;
						}
						valueList = "[" + valueList + "]";
						return valueList;
					}

					var fields = [];
					if (!qViewer._parametersCloned) {
						// Clono la collection de parámetros pues aunque se carguen en los eventos con la misma variable el autorefresh agrega diferente a la collection dependiendo de si es chart o no chart
						qViewer._parametersCloned = true;
						qViewer.Parameters = qv.util.cloneObject(qViewer.Parameters);
					}
					var keys = qv.util.GetOrderedAxesKeys(axes);
					for (var i = 0; i < keys.length; i++) {
						var index = parseInt(keys[i].substr(5, 4));
						sourceAxis = sourceAxes[index];
						var parameterArray = GetParameterInQuery(qViewer, sourceAxis.Name);
						var parameterPosition = parameterArray[0];
						var parameter = parameterArray[1];
						var field = GetFieldInQuery(qViewer, sourceAxis.Name);
						var applyToAxis = (field != null);
						var applyToParameter = !applyToAxis;
						if (applyToAxis) {
							var runtimeAxis = GetRuntimeAxis(qViewer, sourceAxis.Name);
							if (runtimeAxis == null) {
								runtimeAxis = {};
								runtimeAxis.Name = sourceAxis.Name;
							}
							if (sourceTableType == "Table" && qViewer.RealType != "Table" && sourceAxis.AxisType == "Row" && field.AxisType != "Hidden")
								sourceAxis.AxisType = qv.util.ToQueryViewerAxisType(field.AxisType);	// Porque la tabla no tiene la distinción de filas, columnas o páginas
							CopyAxisInfo(sourceAxis, runtimeAxis);
							fields.push(runtimeAxis);
						}
						if (applyToParameter) {
							// no existe un eje para aplicar los cambios, busco si puedo aplicarlos en un parametro
							if (parameter != null) {
								// existe un parámetro en la query destino, aplico los cambios ahí
								var runtimeParameterValue = GetRuntimeParameterValue(sourceAxis, parameter);
								if (qViewer.Object) {
									var array = eval(qViewer.Object);
									array[parameterPosition + 2] = runtimeParameterValue;
									qViewer.Object = JSON.stringify(array);
								}
								else {
									var runtimeParameter = GetRuntimeParameter(qViewer, sourceAxis.Name);
									if (runtimeParameter == null) {
										runtimeParameter = {};
										runtimeParameter.Name = sourceAxis.Name;
										qViewer.Parameters.push(runtimeParameter);
									}
									runtimeParameter.Value = runtimeParameterValue;
								}
							}
						}
					}
					qViewer.Axes = fields;
				}

				function UpdateQueryViewer(qViewer, axes, sourceTableType) {
					UpdateTargetAxesAndParametersFromSourceAxes(qViewer, axes, sourceTableType);
					qViewer.RememberLayout = false;
					qViewer.AllowChangeAxesOrder = true;
					qv.util.autorefresh.SaveAxesAndParametersState(qViewer);
					qViewer.realShow();
				}

				if ((qViewer.AutoRefreshGroup != undefined) && (qViewer.AutoRefreshGroup != null) && (qViewer.AutoRefreshGroup != "") && (qv.util.trim(qViewer.AutoRefreshGroup) != "")) {

					qv.util.autorefresh.DeleteAxesAndParametersState(qViewer);
					var axes = qv.pivot.GetRuntimeMetadata(xml, qViewer.RealType);
					var sourceTableType = qViewer.RealType;

					for (index in qv.collection) {
						qViewerOther = qv.collection[index];
						if (qv.services.IsObjectSet(qViewerOther))
							if (qViewerOther.userControlId() != qViewer.userControlId()) {
								if (qViewer.AutoRefreshGroup == qViewerOther.AutoRefreshGroup) {
									// In same Refresh Group
									qViewerOther._isAutorefresh = true;
									if (qViewerOther.Metadata != undefined && qViewerOther.Metadata.Parameters != undefined)
										UpdateQueryViewer(qViewerOther, axes, sourceTableType);
									else
										qViewerOther.getQueryParameters(function (parametersXML, qViewer) {
											ParseParametersXML(qViewer, parametersXML);
											UpdateQueryViewer(qViewer, axes, sourceTableType);
										});
								}
							}
					}
				}

			},

			LoadAxesAndParametersState: function (qViewer) {
				var path = window.location.pathname + "_" + qViewer.userControlId() + "_" + qViewer.ObjectId + "_" + qViewer.ObjectName + "_";
				var cookieparameterID = path + "Parameters";
				var cookieAxesID = path + "Axes";
				var parametersString = qv.util.storage.getItem(cookieparameterID);
				var AxesString = qv.util.storage.getItem(cookieAxesID);
				if (parametersString != null && parametersString != "") {
					qViewer.Parameters = JSON.parse(parametersString);
					qViewer.RememberLayout = false;
				}
				if (AxesString != null && AxesString != "") {
					qViewer.Axes = JSON.parse(AxesString);
					qViewer.RememberLayout = false;
				}
			},

			SaveAxesAndParametersState: function (qViewer) {
				var path = window.location.pathname + "_" + qViewer.userControlId() + "_" + qViewer.ObjectId + "_" + qViewer.ObjectName + "_";
				var cookieparameterID = path + "Parameters";
				var cookieAxesID = path + "Axes";
				qv.util.storage.setItem(cookieparameterID, JSON.stringify(qViewer.Parameters));
				qv.util.storage.setItem(cookieAxesID, JSON.stringify(qViewer.Axes));
			},

			DeleteAxesAndParametersState: function (qViewer) {
				var path = window.location.pathname + "_" + qViewer.userControlId() + "_" + qViewer.ObjectId + "_" + qViewer.ObjectName + "_";
				var cookieparameterID = path + "Parameters";
				var cookieAxesID = path + "Axes";
				qv.util.storage.removeItem(cookieparameterID);
				qv.util.storage.removeItem(cookieAxesID);
			}

		}

	})(),        
	
	dom: {

		getSingleElementByTagName: function (parent, name) {
			var nodes;
			var node;
			nodes = this.getMultipleElementsByTagName(parent, name);
			node = (nodes.length > 0 ? nodes[0] : null);
			return node;
		},

		getMultipleElementsByTagName: function (parent, name) {
			var nodes;
			var node;
			if (!gx.util.browser.isIE() || gx.util.browser.ieVersion() >= 12)
				nodes = parent.getElementsByTagName(name);
			else // Internet Explorer
				nodes = parent.selectNodes(name);
			return nodes;
		},

		getBooleanAttribute: function (element, attName, defaultValue) {
			var attValue = element.getAttribute(attName);
			if (attValue == null)
				return defaultValue;
			else
				return attValue.toLowerCase() == "true";
		},

		getValueNode: function (node) {
			if ((node == null) || (node == undefined))
				return null;
			if ((node.firstChild != null) && (node.firstChild != undefined))
				return node.firstChild.nodeValue;
			else
				return null;
		},

		selectXPathNode: function (xmlDoc, xpath) {
			var nodes;
			var node;
			if (xmlDoc.evaluate) { // Firefox, Chrome, Opera and Safari
				nodes = xmlDoc.evaluate(xpath, xmlDoc, null, XPathResult.ANY_TYPE, null);
				node = nodes.iterateNext();
			} else {			// Internet Explorer
				nodes = xmlDoc.selectNodes(xpath);
				node = (nodes.length > 0 ? nodes[0] : null);
			}
			return node;
		},

		xmlDocument: function (text) {
			var xmlDoc;
			if (!gx.util.browser.isIE() || gx.util.browser.ieVersion() >= 12) {
				parser = new DOMParser();
				xmlDoc = parser.parseFromString(text, "text/xml");
			} else // Internet Explorer
			{
				xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
				xmlDoc.async = "false";
				xmlDoc.loadXML(text);
			}
			return xmlDoc;
		},

		getEmptyContainer: function (qViewer) {
			var container = qViewer.getContainerControl();
			while (container.firstChild) container.removeChild(container.firstChild);
			return container;
		},

		setStyle: function (element, styleObj) {
			for (key in styleObj)
				element.style[key] = styleObj[key];
		},

		createText: function (parent, text) {
			var textNode = document.createTextNode(text);
			parent.appendChild(textNode);
			return textNode;
		},

		createElement: function (parent, tagName, id, className, styleObj, onClick, text) {
			var element = document.createElement(tagName);
			if (id != "")
				element.id = id;
			if (className != "")
				element.className = className;
			qv.util.dom.setStyle(element, styleObj);
			if (typeof onClick == 'function')
				element.onclick = onClick;
			if (text != "")
				var textNode = qv.util.dom.createText(element, text);
			if (parent != null)
				parent.appendChild(element);
			return element;
		},

		createTable: function (parent, className, styleObj) {
			var table = qv.util.dom.createElement(parent, "TABLE", "", className, styleObj, null, "");
			var tBody = document.createElement("TBODY");
			table.appendChild(tBody);
			return tBody;
		},

		createRow: function (parentTable) {
			return qv.util.dom.createElement(parentTable, "TR", "", "", {}, null, "");
		},

		createCell: function (parentRow, colSpan, align, styleObj, text) {
			var cell = qv.util.dom.createElement(parentRow, "TD", "", "", styleObj, null, text);
			if (colSpan != 1)
				cell.colSpan = colSpan;
			if (align != "")
				cell.align = align;
			return cell;
		},

		createSpan: function (parent, id, className, title, styleObj, onClick, text) {
			var span = qv.util.dom.createElement(parent, "SPAN", id, className, styleObj, onClick, text);
			if (title != "")
				span.title = title;
			return span;
		},

		createDiv: function (parent, id, className, title, styleObj, text) {
			var div = qv.util.dom.createElement(parent, "DIV", id, className, styleObj, null, text);
			if (title != "")
				div.title = title;
			return div;
		},

		createAnchor: function (parent, id, styleObj, text) {
			return qv.util.dom.createElement(parent, "A", id, "", styleObj, null, text);
		},

		createInput: function (parent, id, type, styleObj) {
			var input = qv.util.dom.createElement(parent, "INPUT", id, "", styleObj, null, "");
			if (type != "")
				input.type = type;
			return input;
		},

		createSelect: function (parent, id) {
			return qv.util.dom.createElement(parent, "SELECT", id, "", {}, null, "");
		},

		createOption: function (parent, value, selected, text) {
			var option = qv.util.dom.createElement(parent, "OPTION", "", "", {}, null, text);
			if (value != "")
				option.value = value;
			if (selected)
				option.selected = true;
			return option;
		},

		createIcon: function (parent, title, styleObj, text) {
			var icon = qv.util.dom.createElement(parent, "I", "", "material-icons", styleObj, null, text);
			if (title != "")
				icon.title = title;
			return icon;
		}

	},

	storage: (function() {

		function createCookie(name, value, days) {
			if (days) {
				var date = new Date();
				date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
				var expires = "; expires=" + date.toGMTString();
			} else
				var expires = "";
			document.cookie = name + "=" + value + expires + "; path=/";
		}

		function readCookie(name) {
			var nameEQ = name + "=";
			var ca = document.cookie.split(';');
			for (var i = 0; i < ca.length; i++) {
				var c = ca[i];
				while (c.charAt(0) == ' ') c = c.substring(1, c.length);
				if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length, c.length);
			}
			return null;
		}

		function eraseCookie(name) {
			createCookie(name, "", -1);
		}

		return {

			setItem: function (key, data) {
				if (!!localStorage)
					localStorage.setItem(key, data);
				else
					createCookie(key, data, 365);
			},

			getItem: function (key) {
				if (!!localStorage)
					return localStorage.getItem(key);
				else
					return readCookie(key);
			},

			removeItem: function (key) {
				if (!!localStorage)
					localStorage.removeItem(key);
				else
					eraseCookie(key);
			}
		}

	})(),

	ExecuteTracker: function (trackerId, trackerData) {
		var trackers = Array();
		for (var i = 0; i < gx.fx.ctx.trackers.length; i++)
			if (gx.fx.ctx.trackers[i].types[0] == trackerId) trackers[trackers.length] = gx.fx.ctx.trackers[i];
		for (var i = 0; i < trackers.length; i++) {
			var tgxO = gx.O;
			gx.O = trackers[i].obj;
			var tCmp = gx.csv.cmpCtx;
			gx.csv.cmpCtx = trackers[i].obj.CmpContext;
			gx.evt.setProcessing(false);
			trackers[i].hdl.call(trackers[i].obj, null, null, trackerData);
			gx.O = tgxO;
			gx.csv.cmpCtx = tCmp;
		}
	},

	satisfyStyle: function (value, conditionalStyle) {
		switch (conditionalStyle.Operator) {
			case "EQ":
				return value == conditionalStyle.Value1;
			case "GT":
				return value > conditionalStyle.Value1;
			case "LT":
				return value < conditionalStyle.Value1;
			case "GE":
				return value >= conditionalStyle.Value1;
			case "LE":
				return value <= conditionalStyle.Value1;
			case "NE":
				return value != conditionalStyle.Value1;
			case "IN":
				return value >= conditionalStyle.Value1 && value <= conditionalStyle.Value2;
		}
	},

	isGeneXusPreview: function () {
		return IsQueryObjectPreview();
	},

	getGenerator: function () {
		var gen;
		if (gx.gen.isDotNet())
			gen = "C#";
		else if (gx.gen.isJava())
			gen = "Java";
		else
			gen = "";
		return gen;
	},

	getErrorFromText: function (resultText) {
		if (resultText == "<Result OK=\"True\"></Result>")
			return ""; // No hubo error
		else
			return resultText.replace("<Result OK=\"False\"><Dsc>", "").replace("</Dsc></Result>", "");
	},

	trim: function (str) {
		if (typeof str != 'string')
			return null;
		return str.replace(/^[\s]+/, '').replace(/[\s]+$/, '').replace(/[\s]{2,}/, ' ');
	},

	capitalize: function (str) {
		return str.charAt(0).toUpperCase() + str.slice(1);
	},

	decapitalize: function (str) {
		return str.charAt(0).toLowerCase() + str.slice(1);
	},

	dateToString: function (date, includeTime) {
		var dateStr = date.getStringWithFmt("Y4MD").replace(/\//g, "-");
		if (includeTime) {
			date.TimeFmt = 24;
			dateStr += " " + date.getTimeString(true, true);
		}
		return dateStr;
	},

	cloneObject: function (obj) {
		return JSON.parse(JSON.stringify(obj));
	},

	endsWith: function (string, subString) {
		return string.substr(string.length - subString.length, subString.length) == subString;
	},

	startsWith: function (string, subString) {
		return string.substr(0, subString.length) == subString;
	},

	formatNumber: function (number, decimalPrecision, picture, removeTrailingZeroes) {

		var formattedNumber = gx.num.formatNumber(number, decimalPrecision, picture, 0, true, false);
		if (removeTrailingZeroes) {
			if (formattedNumber.indexOf(".") >= 0 || formattedNumber.indexOf(",") >= 0) {
				while (qv.util.endsWith(formattedNumber, "0"))
					formattedNumber = formattedNumber.slice(0, -1);
				if (qv.util.endsWith(formattedNumber, ".") || qv.util.endsWith(formattedNumber, ","))
					formattedNumber = formattedNumber.slice(0, -1);
			}
		}
		return formattedNumber;
	},

	formatDateTime: function (date, dataType, dateFormat, includeHours, includeMinutes, includeSeconds, includeMilliseconds) {
		var gxDate = new gx.date.gxdate(date, "Y4MD");
		var formattedDate = gxDate.getStringWithFmt(dateFormat);
		if (dataType == "datetime") {
			gxDate.TimeFmt = 24;
			formattedDate += " " + gxDate.getTimeString(includeMinutes, includeSeconds, includeHours, includeMilliseconds);
		}
		return formattedDate;
	},

	seconsdToText: function (seconds) {
		var text;
		var picture = "ZZZZZZZZZZZZZZ9";
		var decimalPrecision = 0;
		if (seconds < 60)							// less than 1 minute
			text = qv.util.formatNumber(Math.round(seconds), decimalPrecision, picture, false) + " " + qv.util.decapitalize(gx.getMessage("GXPL_QViewerSeconds"));
		else if (seconds < 60 * 60)					// less than 1 hour
			text = qv.util.formatNumber(Math.round(seconds / 60), decimalPrecision, picture, false) + " " + qv.util.decapitalize(gx.getMessage("GXPL_QViewerMinutes"));
		else if (seconds < 60 * 60 * 24)			// less than 1 day
			text = qv.util.formatNumber(Math.round(seconds / 60 / 60), decimalPrecision, picture, false) + " " + qv.util.decapitalize(gx.getMessage("GXPL_QViewerHours"));
		else if (seconds < 60 * 60 * 24 * 30.44)	// less than 1 month
			text = qv.util.formatNumber(Math.round(seconds / 60 / 60 / 24), decimalPrecision, picture, false) + " " + qv.util.decapitalize(gx.getMessage("GXPL_QViewerDays"));
		else if (seconds < 60 * 60 * 24 * 365.25)	// less than 1 year
			text = qv.util.formatNumber(Math.round(seconds / 60 / 60 / 24 / 30.44), decimalPrecision, picture, false) + " " + qv.util.decapitalize(gx.getMessage("GXPL_QViewerMonths"));
		else										// more than 1 year
			text = qv.util.formatNumber(Math.round(seconds / 60 / 60 / 24 / 365.25), decimalPrecision, picture, false) + " " + qv.util.decapitalize(gx.getMessage("GXPL_QViewerYears"));
		return text;
	},

	ParseNumericPicture: function (dataType, picture) {
		var decimalPrecision;
		var useThousandsSeparator;
		var prefix = "";
		var suffix = "";
		if (picture == "") {
			decimalPrecision = (dataType == "integer" ? 0 : 2);
			useThousandsSeparator = false;
		}
		else {			// Saco los datos de la picture
			if (picture.indexOf(".") < 0 && picture.indexOf(",") < 0) {		// No tiene ni punto ni coma
				decimalPrecision = 0;
				useThousandsSeparator = false;
			} else if (picture.indexOf(".") >= 0 && picture.indexOf(",") < 0) {	// Tiene solo punto
				decimalPrecision = (dataType == "integer" ? 0 : picture.length - picture.indexOf(".") - 1);
				useThousandsSeparator = false;
			} else if (picture.indexOf(".") < 0 && picture.indexOf(",") >= 0) {	// Tiene solo coma
				decimalPrecision = 0;
				useThousandsSeparator = true;
			} else {															// Tiene punto y coma
				decimalPrecision = (dataType == "integer" ? 0 : picture.length - picture.indexOf(".") - 1);
				useThousandsSeparator = true;
			}
			// Obtengo prefijo y sufijo.
			// pictureArea = 1 (prefijo), 2 (número) o 3 (sufijo)
			var pictureArea = 1;
			for (var i = 0; i < picture.length; i++) {
				var chr = picture.substr(i, 1);
				if ((chr == "." || chr == "," || chr == "9" || chr == "Z") && pictureArea == 1)
					pictureArea = 2;
				if ((chr != "." && chr != "," && chr != "9" && chr != "Z") && pictureArea == 2)
					pictureArea = 3;
				switch (pictureArea) {
					case 1:
						prefix += chr;
						break;
					case 3:
						suffix += chr;
						break;
				}
			}
		}
		return { DecimalPrecision: decimalPrecision, UseThousandsSeparator: useThousandsSeparator, Prefix: prefix, Suffix: suffix };
	},

	ParseDateTimePicture: function (dataType, picture) {
		var dateFormat = gx.dateFormat;
		var includeHours = dataType == "datetime";
		var includeMinutes = dataType == "datetime";
		var includeSeconds = dataType == "datetime";
		var includeMilliseconds = dataType == "datetime";
		if (picture != "") {
			if (picture.indexOf("9999") >= 0 && dateFormat.indexOf("Y4") < 0)
				dateFormat = dateFormat.replace("Y", "Y4");
			else if (picture.indexOf("9999") < 0 && dateFormat.indexOf("Y4") >= 0)
				dateFormat = dateFormat.replace("Y4", "Y");
			if (dataType == "datetime") {
				var posSeparator = picture.indexOf(" ");
				if (posSeparator >= 0) {
					var timePart = picture.substr(posSeparator + 1, picture.length - posSeparator);
					includeHours = timePart.length >= 2;
					includeMinutes = timePart.length >= 5;
					includeSeconds = timePart.length >= 8;
					includeMilliseconds = timePart.length == 12;
				}
				else {
					includeHours = false;
					includeMinutes = false;
					includeSeconds = false;
					includeMilliseconds = false;
				}
			}
		}
		return { DateFormat: dateFormat, IncludeHours: includeHours, IncludeMinutes: includeMinutes, IncludeSeconds: includeSeconds, IncludeMilliseconds: includeMilliseconds };
	},

	aggregate: function (aggregation, values, quantities) {
		aggregation = aggregation || "Sum";
		var sumValues = null;
		var sumQuantities = null;
		var minValue = null;
		var maxValue = null;
		switch (aggregation) {
			case "Sum":
				for (var i = 0; i < values.length; i++) {
					if (values[i] != null)
						sumValues += values[i];
				}
				return sumValues;
			case "Average":
				for (var i = 0; i < values.length; i++) {
					if (values[i] != null) {
						sumValues += values[i];
						sumQuantities += quantities[i];
					}
				}
				return sumValues != null ? sumValues / sumQuantities : null;
			case "Count":
				for (var i = 0; i < quantities.length; i++) { sumQuantities += quantities[i]; }
				return sumQuantities;
			case "Max":
				for (var i = 0; i < values.length; i++) { maxValue = (maxValue == null ? values[i] : (values[i] > maxValue ? values[i] : maxValue)); }
				return maxValue;
			case "Min":
				for (var i = 0; i < values.length; i++) { minValue = (minValue == null ? values[i] : (values[i] < minValue ? values[i] : minValue)); }
				return minValue;
		}
	},

	ToQueryViewerAxisType: function (axisType) {	// Convierte hacia el dominio QueryViewerAxisType
		switch (axisType) {
			case "Rows":
				return "Row";
			case "Columns":
				return "Column";
			case "Pages":
				return "Page";
			case "Data":
				return "Data";
			case "Hidden":
				return "NotShow";
			default:
				return "";
		}
	},

	anyError: function (resultText) {
		return (resultText.indexOf("<Result OK=\"False\"><Dsc>") == 0);
	},

	showActivityIndicator: function (qViewer) {
		var f = 'qv.util.showActivityIndicatorMain("' + qViewer.getContainerControl().id + '");';
		qViewer._fadeTimeout = setTimeout(f, 500);
	},

	showActivityIndicatorMain: function (containerId) {
		var container = document.getElementById(containerId);
		gx.dom.addClass(container, "gx-qv-loading");
		for (var i = 0; i < container.childNodes.length; i++)
			gx.dom.addClass(container.childNodes[i], "gx-qv-loading-children");
	},

	hideActivityIndicator: function (qViewer) {
		if (qViewer._fadeTimeout) {
			clearTimeout(qViewer._fadeTimeout);
			qViewer._fadeTimeout = undefined;
		}
		var container = qViewer.getContainerControl();
		gx.dom.removeClass(container, "gx-qv-loading");
		for (var i = 0; i < container.childNodes.length; i++)
			gx.dom.removeClass(container.childNodes[i], "gx-qv-loading-children");
	},

	renderError: function (qViewer, errMsg) {
		if (IsQueryObjectPreview() && !IsDashboardEdit()) // Preview en GeneXus (se muestra en el output)
			window.external.SendText(qViewer.ControlName, errMsg);
		else // Aplicación generada
		{
			var container = qv.util.dom.getEmptyContainer(qViewer);
			var div = qv.util.dom.createDiv(container, "", "gx-qv-centered-text", "", { width: gx.dom.addUnits(qViewer.Width), height: gx.dom.addUnits(qViewer.Height), borderColor: "silver", borderWidth: "thin", borderStyle: "solid" }, gx.getMessage("GXPL_QViewerError") + ": " + errMsg);
			qViewer._ControlRenderedTo = undefined;
			qv.util.hideActivityIndicator(qViewer);
		}
	},

	GetDesigntimeMetadata: function (qViewer) {

		var queryViewerAxes = [];
		// Agrego los ejes
		for (var i = 0; i < qViewer.Metadata.Axes.length; i++) {
			var axis = qViewer.Metadata.Axes[i];
			if (!axis.IsComponent) {
				var queryViewerAxis = {};
				queryViewerAxis.Name = axis.Name;
				queryViewerAxis.Title = axis.Title;
				queryViewerAxis.DataField = axis.DataField;
				queryViewerAxis.Visible = axis.Visible;
				queryViewerAxis.Type = qv.util.ToQueryViewerAxisType(axis.AxisType);
				queryViewerAxis.Filter = axis.Filter;
				queryViewerAxis.ExpandCollapse = axis.ExpandCollapse;
				queryViewerAxis.AxisOrder = axis.Order;
				queryViewerAxis.Format = {};
				queryViewerAxis.Format.Subtotals = axis.Subtotals;
				queryViewerAxis.Format.Picture = axis.Picture;
				queryViewerAxis.Format.CanDragToPages = axis.CanDragToPages;
				queryViewerAxis.Format.Style = axis.Style;
				if (axis.ValuesStyles.length > 0)
					queryViewerAxis.Format.ValuesStyles = axis.ValuesStyles;
				queryViewerAxis.Actions = {};
				queryViewerAxis.Actions.RaiseItemClick = axis.RaiseItemClick;
				queryViewerAxes.push(queryViewerAxis);
			}
		}
		// Agrego los datos
		for (var i = 0; i < qViewer.Metadata.Data.length; i++) {
			var datum = qViewer.Metadata.Data[i];
			if (!datum.IsComponent) {
				var queryViewerAxis = {};
				queryViewerAxis.Name = datum.Name;
				queryViewerAxis.Title = datum.Title;
				queryViewerAxis.DataField = datum.DataField;
				queryViewerAxis.Visible = datum.Visible;
				queryViewerAxis.Type = qv.util.ToQueryViewerAxisType(datum.AxisType);
				queryViewerAxis.Aggregation = datum.Aggregation;
				queryViewerAxis.Format = {};
				queryViewerAxis.Format.Picture = datum.Picture;
				queryViewerAxis.Format.Style = datum.Style;
				queryViewerAxis.Format.TargetValue = datum.TargetValue;
				queryViewerAxis.Format.MaximumValue = queryViewerAxis.Format.TargetValue;
				if (datum.ConditionalStyles.length > 0)
					queryViewerAxis.Format.ConditionalStyles = datum.ConditionalStyles;
				queryViewerAxis.Actions = {};
				queryViewerAxis.Actions.RaiseItemClick = datum.RaiseItemClick;
				queryViewerAxes.push(queryViewerAxis);
			}
		}
		return queryViewerAxes;
	},
	
	MergeFields: function (designtimeField, runtimeField) {
		if (designtimeField.Visible) {
			designtimeField.Type = runtimeField.AxisType;
			if (designtimeField.Type != "Data" && designtimeField.Type != "Hidden") {
				switch (designtimeField.AxisOrder.Type) {

					case "None":
					case "Ascending":
					case "Descending":
						designtimeField.AxisOrder.Type = runtimeField.Order;
						break;
					case "Custom":
						if (runtimeField.Order == "Descending")
							designtimeField.AxisOrder.Values.reverse();
						break;
				}
				if (designtimeField.Format.Subtotals != "No")
					if (runtimeField.Subtotals != undefined)
						designtimeField.Format.Subtotals = (runtimeField.Subtotals == "Yes" ? "Yes" : "Hidden");
				designtimeField.Filter = runtimeField.Filter;
				if (runtimeField.ExpandCollapse)
					designtimeField.ExpandCollapse = runtimeField.ExpandCollapse;
			}
		}
	},

	GetOrderedAxesKeys: function (axes) {

		function padLeft(nr, n, str) {
			return Array(n - String(nr).length + 1).join(str || '0') + nr;
		}

		var keys = [];
		for (var i = 0; i < axes.length; i++) {
			var axis = axes[i];
			var key;
			switch (axis.AxisType) {
				case "Row":
					key = "A" + padLeft(axis.AxisPosition, 4, "0") + padLeft(i, 4, "0");
					break;
				case "Column":
					key = "B" + padLeft(axis.AxisPosition, 4, "0") + padLeft(i, 4, "0");
					break;
				case "Page":
					key = "C" + padLeft(axis.AxisPosition, 4, "0") + padLeft(i, 4, "0");
					break;
				case "Hidden":
					key = "D" + padLeft(axis.AxisPosition, 4, "0") + padLeft(i, 4, "0");
					break;
				case "Data":
					key = "E" + padLeft(axis.AxisPosition, 4, "0") + padLeft(i, 4, "0");
					break;
				default:
					key = "Z" + padLeft(axis.AxisPosition, 4, "0") + padLeft(i, 4, "0");
					break;
			}
			keys.push(key);
		}
		keys.sort();
		return keys;

	},

	GetContainerControlClass: function (qViewer) {
		if (qViewer.Class != "") {
			var ucClass = qViewer.Class + "-" + qViewer.RealType.toLowerCase();
			return ucClass;
		}
		else
			return "";
	},

	GetContainerControlClasses: function (qViewer) {
		var ucCls = qv.util.GetContainerControlClass(qViewer);
		var classes;
		switch (qViewer.RealType) {
			case "Card":
				classes = "qv-card";
				break;
			case "Chart":
				classes = "qv-chart";
				break;
			case "PivotTable":
				classes = "qv-pivottable";
				break;
			case "Table":
				classes = "qv-table";
				break;
		}
		if (ucCls != "")
			classes += " " + ucCls;
		return classes;
	},

	SetUserControlClass: function (uc, className) {
		uc.getContainerControl().className = "gx_usercontrol " + className;
	}

}