function DVelop_DVGroupBy() {

	this.GridInternalName;
	this.ColumnIndex;
	this.TotalizerColumnIndexes;
	this.AllowCollapse;

	this.show = function () {

		this.ProcessGroup();
	}

	gx.fx.obs.addObserver("gx.onafterevent", window, function (thisC) {
		return function (e) {
			thisC.ProcessGroup();
		}
	}(this));

	gx.fx.obs.addObserver("grid.onafterrender", window, function (thisC) {
		return function (e) {
			thisC.ProcessGroup();
		}
	}(this));

	gx.fx.obs.addObserver("gx.onload", window, function (thisC) {
		return function (e) {
			thisC.ProcessGroup();
		}
	}(this));

	this.RealGridInternalName = null;
	this.ProcessGroup = function () {

		if (this.ColumnIndex == -1 || this.GridInternalName == null || this.GridInternalName == '') {
			return;
		}

		var thisC = this;
		if (this.RealGridInternalName == null) {
			$('.gx-grid').each(function (i) {
				if (this.id.toLowerCase() == thisC.GridInternalName.toLowerCase() + 'containerdiv') {
					thisC.RealGridInternalName = $(this).find('>')[0].id;
				}
			});
		}

		if (!$('#' + this.RealGridInternalName).hasClass('groupProcessed')) {
			$('#' + this.RealGridInternalName).addClass('groupProcessed');

			var totalizerColsIndex = JSON.parse('[' + this.TotalizerColumnIndexes + ']');
			this.BtnColumnIndex = this.ColumnIndex - 1;

			totalizerColsIndex.sort(function (a, b) { return a - b; });

			var tdColSpans = [0];
			for (var i = 1; i < totalizerColsIndex.length; i++) {
				tdColSpans.push(0);
			}

			var visibleColumns = 0;
			var ths = $('#' + this.RealGridInternalName).find('thead>tr>th');
			var currentColIndex = 0;
			var currentTotColIndex = 0;
			ths.each(function () {
				if ($(this).css('display') != 'none') {
					visibleColumns++;
					if (currentTotColIndex < totalizerColsIndex.length && totalizerColsIndex[currentTotColIndex] > currentColIndex) {
						tdColSpans[currentTotColIndex]++;
					}
					if (currentTotColIndex < totalizerColsIndex.length && totalizerColsIndex[currentTotColIndex] == currentColIndex) {
						currentTotColIndex++;
					}
				} else if (currentTotColIndex < totalizerColsIndex.length && totalizerColsIndex[currentTotColIndex] == currentColIndex) {
					if (tdColSpans.length > currentTotColIndex + 1) {
						tdColSpans[currentTotColIndex + 1] += tdColSpans[currentTotColIndex];
					}
					totalizerColsIndex.splice(currentTotColIndex, 1);
					tdColSpans.splice(currentTotColIndex, 1);
				}
				currentColIndex++;
			});
			if (totalizerColsIndex.length == 0) {
				tdColSpans = [visibleColumns];
			}


			var gridBody = $('#' + this.RealGridInternalName).find('tbody')[0];
			for (var i = 0; i < gridBody.children.length; i++) {

				if (i == 0 || gridBody.children[i].children[this.ColumnIndex].innerText != gridBody.children[i - 1].children[this.ColumnIndex].innerText) {
					if ($(gridBody.children[i].children[this.BtnColumnIndex]).hasClass('WWPExpand')) {
						$(gridBody.children[i]).css('display', 'none');
					}

					var row = document.createElement('tr');
					$(row).addClass('DVGroupByRow');
					var expandBtnHtml = null;
					if (this.AllowCollapse) {
						$(row).addClass('DVGroupByRowAllowCollapse');
						expandBtn = $(gridBody.children[i].children[this.BtnColumnIndex]).find('a').length == 1 ? $(gridBody.children[i].children[this.BtnColumnIndex]).find('a')[0] : $(gridBody.children[i].children[this.BtnColumnIndex]).find('img')[0].parentNode;
						if (expandBtn != null) {
							expandBtnHtml = '<div class="DVGroupByBtn">' + expandBtn.innerHTML + '</div>';
						}
					}
					row.innerHTML = '<td class="DVGroupByCell" colspan="' + tdColSpans[0] + '">' + (expandBtnHtml != null && tdColSpans[0] == visibleColumns ? '<table><tbody><tr><td>' : '') + '<span class="DVGroupByTitle">' + gridBody.children[i].children[this.ColumnIndex].innerText + '</span>' + (expandBtnHtml != null && tdColSpans[0] == visibleColumns ? '</td><td>' + expandBtnHtml + '</td></tr></tbody></table>' : '') + '</td>';
					var remainingVisibleCols = visibleColumns - tdColSpans[0];
					if (totalizerColsIndex.length > 0) {
						for (var t = 0; t < totalizerColsIndex.length; t++) {
							if (t > 0 && tdColSpans[t] > 0) {
								row.innerHTML += '<td class="DVGroupByCell" colspan="' + tdColSpans[t] + '" />'
								remainingVisibleCols -= tdColSpans[t];
							}
							remainingVisibleCols--;
							var totValueColIndex = totalizerColsIndex[t] + 1;
							if (($(gridBody.children[i].children[totValueColIndex]).find('span').attr('id') + '').indexOf('_GROUPTOTALIZER') == -1 && gridBody.children[i].children.length > totValueColIndex + 1) {
								if (($(gridBody.children[i].children[totValueColIndex + 1]).find('span').attr('id') + '').indexOf('_GROUPTOTALIZER') != -1) {
									totValueColIndex++;
								}
								else if (gridBody.children[i].children.length > totValueColIndex + 2 && ($(gridBody.children[i].children[totValueColIndex + 2]).find('span').attr('id') + '').indexOf('_GROUPTOTALIZER') != -1) {
									totValueColIndex += 2;
								}
							}
							row.innerHTML += '<td class="DVGroupByCell" ><span class="DVGroubByTotalizer">' + gridBody.children[i].children[totValueColIndex].innerText + '</span></td>'
							var textAl = $($('#' + this.RealGridInternalName).find('thead>tr>th')[totalizerColsIndex[t]]).css('text-align');
							if (textAl != null && textAl != '') {
								$(row.children[row.children.length - 1]).css({ 'text-align': textAl });
							}
						}
					}
					if (remainingVisibleCols > 0) {
						row.innerHTML += '<td class="DVGroupByCell" colspan="' + remainingVisibleCols + '" >' + (expandBtnHtml != null ? expandBtnHtml : '') + '</td>';
					}
					$(row).find('td>.DVGroupByBtn>img').css('display', '');
					gridBody.insertBefore(row, gridBody.children[i]);

					if (this.AllowCollapse) {
						var thisC = this;
						$(row).on("click", function (e) {
							var btnCol = $($(this).next()[0].children[thisC.BtnColumnIndex]);
							if (btnCol.find('span').length > 0) {
								btnCol.find('span').click();
							} else {
								btnCol.find('img').click();
								e.preventDefault();
								e.stopPropagation();
							}
						});
					}
					i++;
				}
			}
		}
	}
}
