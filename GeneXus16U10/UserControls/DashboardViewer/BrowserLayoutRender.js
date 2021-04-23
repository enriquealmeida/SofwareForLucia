var ElementType={Dashboard:"Dashboard",Layout:"Layout",Table:"Table",Row:"Row",Cell:"Cell",Widget:"Widget"},OutputType={Card:"Card",Chart:"Chart",PivotTable:"PivotTable",Table:"Table"},DropZone={Top:"Top",Bottom:"Bottom",Left:"Left",Right:"Right",Outside:"Outside",Inside:"Inside"},TableMode={Bootstrap:"Bootstrap",Grid:"Grid",Flex:"Flex"},Command={AddElement:"GX_DASHBOARD_ADDELEMENT",MoveElement:"GX_DASHBOARD_MOVEELEMENT",MoveElements:"GX_DASHBOARD_MOVEELEMENTS"},TableBootstrap={Mode:TableMode.Bootstrap},
ResponsiveScale={ExtraSmall:"xs",Small:"sm",Medium:"md",Large:"lg"},ElementCssClass={Selected:"Selected",NotSelected:"NotSelected",DependsOn:"DependsOn",Impacts:"Impacts"};
function BrowserLayout(f){this.ReturnSampleData=!1;this.SelectedElementIds=[];this.Initialize=function(){this.DashboardDefaults(f.dashboard)};this.SelfInitialize=function(a,b){a.ElementType=b;a.Selected=!1};this.ParentInitialize=function(a,b){a.ParentElement=b};this.AddElement=function(a,b){a.AllElements.push(b);b.ElementType==ElementType.Widget&&(a.AllWidgets.push(b),f.onAddElement(a,b))};this.RemoveElement=function(a,b){this.RemoveElementById(a.AllElements,b.ElementId);b.ElementType==ElementType.Widget&&
(this.RemoveElementById(a.AllWidgets,b.ElementId),f.onRemoveElement(a,b))};this.RemoveElementById=function(a,b){for(var c=0;c<a.length;c++)if(a[c].ElementId==b)return a.splice(c,1),!0;return!1};this.DashboardDefaults=function(a){this.SelfInitialize(a,ElementType.Dashboard);this.ParentInitialize(a,null);a.AllWidgets=[];var b=a.Layout;b&&(this.ParentInitialize(b,a),this.LayoutDefaults(b,a))};this.LayoutDefaults=function(a,b){this.SelfInitialize(a,ElementType.Layout);f.layoutDefaults(a);b.AllElements=
[a];var c=a.MainTable;this.ParentInitialize(c,a);this.TableDefaults(c,b,f.getMessage("GX_Dashboard_DropElementsHere"));if(c=a.FiltersTable)this.ParentInitialize(c,a),this.TableDefaults(c,b,f.getMessage("GX_Dashboard_DropFiltersHere"))};this.TableDefaults=function(a,b,c){this.SelfInitialize(a,ElementType.Table);f.tableDefaults(a);a.CellEmptyMessage=c;f.isEditor()&&f.addExtraRow(b.Layout,a)&&a.Rows.push({ElementId:a.ElementId+"_NEWROW",Cells:[]});for(c=0;c<a.Rows.length;c++){var d=a.Rows[c];this.ParentInitialize(d,
a);this.RowDefaults(d,b)}this.AddElement(b,a)};this.RowDefaults=function(a,b){this.SelfInitialize(a,ElementType.Row);f.rowDefaults(a);f.isEditor()&&0==a.Cells.length&&a.Cells.push({ElementId:a.ElementId+"_NEWCELL",IsEmpty:!0});for(var c=0;c<a.Cells.length;c++){var d=a.Cells[c];this.ParentInitialize(d,a);this.CellDefaults(d,b)}this.AddElement(b,a)};this.CellDefaults=function(a,b){this.SelfInitialize(a,ElementType.Cell);f.cellDefaults(a);if(!a.IsEmpty){var c=a[a.ChildType];this.ParentInitialize(c,a);
if(a.HasTable){var d=f.isMainTableLayoutTable(c)?f.getMessage("GX_Dashboard_DropElementsHere"):"";this.TableDefaults(c,b,d)}else this.WidgetDefaults(c,b,a.ChildType),this.AddElement(b,c)}this.AddElement(b,a)};this.WidgetDefaults=function(a,b,c){this.SelfInitialize(a,ElementType.Widget);f.widgetDefaults(a,b,c);if(a.Tables)for(c=0;c<a.Tables.length;c++)this.ParentInitialize(a.Tables[c],a),this.TableDefaults(a.Tables[c],b,"")};this.TableClass=function(a,b){var c;f.isEditor()?(c="gx-db-flex-table"+(""!=
b?" "+b:""),a&&(c+=" gx-db-no-border")):c="container-fluid gx-db-no-margin gx-db-no-padding"+(""!=b?" "+b:"");return c};this.RowClass=function(a){return f.isEditor()?"gx-db-flex-row"+(""!=a?" "+a:""):"row gx-db-no-margin"+(""!=a?" "+a:"")};this.CellClass2=function(a,b,c,d,e){if(f.isEditor()){var g=" gx-db-dropTarget-outside";d.IsEmpty&&(g+=" gx-db-cell-empty");var h=this.GetBootstrapClasses(a,c,e);return this.CellClass(h,c<a.Rows.length-1,e<b.Cells.length-1,""!=d.CellClass?d.CellClass:"gx-db-cell")+
g}h="";a.Mode==TableMode.Bootstrap&&(h=this.GetBootstrapClasses(a,c,e));return this.CellClass(h,c<a.Rows.length-1,e<b.Cells.length-1,""!=d.CellClass?d.CellClass:"gx-db-cell")};this.CellClass=function(a,b,c,d){f.isEditor()?(a=(""!=a?a+" ":"")+(""!=d?" "+d:""),b&&(a+=" gx-db-bottom-border"),c&&(a+=" gx-db-right-border")):a=(""!=a?a+" ":"")+"gx-db-no-padding"+(""!=d?" "+d:"");return a};this.GetBootstrapClasses=function(a,b,c){function d(a,b,c,d){function e(a,b){if(void 0==b)return!0;if(void 0!=a.Visible[b])return a.Visible[b];
var c=void 0;switch(b){case ResponsiveScale.Small:c=ResponsiveScale.ExtraSmall;break;case ResponsiveScale.Medium:c=ResponsiveScale.Small;break;case ResponsiveScale.Large:c=ResponsiveScale.Medium}return e(a,c)}var a=a.Rows[b],c=a.Cells[c].ResponsiveSizes,b=[],f;void 0!=c.Width[d]?f=c.Width[d]:d==ResponsiveScale.ExtraSmall?f=12:d==ResponsiveScale.Small&&(f=parseInt(12/a.Cells.length));void 0!=f&&b.push("col-"+d+"-"+f.toString());void 0!=c.Offset[d]&&b.push("col-"+d+"-offset-"+c.Offset[d].toString());
e(c,d)||b.push("hidden-"+d);void 0!=c.Push[d]&&b.push("col-"+d+"-push-"+c.Push[d].toString());void 0!=c.Pull[d]&&b.push("col-"+d+"-pull-"+c.Pull[d].toString());return b.join(" ")}var e;if(f.isEditor())e="gx-db-flex-cell gx-db-flex-cell-"+parseInt(12/a.Rows[b].Cells.length).toString();else{e=d(a,b,c,ResponsiveScale.ExtraSmall);var g=d(a,b,c,ResponsiveScale.Small),h=d(a,b,c,ResponsiveScale.Medium),a=d(a,b,c,ResponsiveScale.Large),b=[];""!=e&&b.push(e);""!=g&&b.push(g);""!=h&&b.push(h);""!=a&&b.push(a);
e=b.join(" ")}return e};this.TwoRowsTableHTML=function(a,b,c,d,e,g){var h=this.TableClass(null==a,""),j=this.RowClass(""),i=this.CellClass(f.isEditor()?"gx-db-flex-cell gx-db-flex-cell-12":"col-xs-12",!1,!1,""),a=this.DIVStart(a,b,h,"height:"+c+";width:"+d,!1,!0,!1),a=a+('<div class="'+j+'"><div class="'+i+' gx-db-selectors-container">'+e+"</div></div>"),a=f.isEditor()?a+('<div class="'+j+' gx-db-flex-row-100"><div class="'+i+'">'+g+"</div></div>"):a+('<div class="'+j+' gx-db-controls-container"><div class="'+
i+'" style="height:100%">'+g+"</div></div>");return a+"</div>"};this.GetTableHTML=function(a,b,c,d,e){var g=this.GetDOMElementId(b.ElementId);d.push(g);var h=f.isMainTableLayoutTable(b),j=this.TableClass(h,""!=b.Class?b.Class:"gx-db-table"),i="";if(b.Mode==TableMode.Grid){var i="display:grid;",k;(k=1==b.Rows.length?"1fr":f.getGridRowsHeight(b))&&(i+="grid-template-rows:"+k+";");(k=f.getGridColumnsWidth(b))&&(i+="grid-template-columns:"+k+";")}else b.Mode==TableMode.Flex&&(i="display:flex;"+f.getFlexTableStyle(b));
c=this.DIVStart(b,g,j,i,c,!h,e);c=""+c;for(e=0;e<b.Rows.length;e++)c+=this.GetRowHTML(a,b,b.Rows[e],e,d);return c+"</div>"};this.GetRowHTML=function(a,b,c,d,e){var g="",h="";f.isEditor()&&(h=" gx-db-dropTarget-outside",f.isHeight100Percent(a.Layout.MainTableLayout,d,b)&&(h+=" gx-db-flex-row-100"));var h=this.RowClass(""!=c.RowClass?c.RowClass:"gx-db-row")+h,j=this.GetDOMElementId(c.ElementId);e.push(j);b.Mode==TableMode.Bootstrap&&(g+='<div id="'+j+'" class="'+h+'">');for(h=0;h<c.Cells.length;h++)j=
c.Cells[h],f.cellHasVisibleContent(f.isEditor(),j)&&(g+=this.GetCellHTML(a,b,c,d,j,h,"",e));b.Mode==TableMode.Bootstrap&&(g+="</div>");return g};this.GetCellHTML=function(a,b,c,d,e,g,h,j){var i="",k="",m="",n="",l="";f.isEditor()&&(k=' ondragover="'+f.getMe()+'.DragOver(event)"',m=' ondrop="'+f.getMe()+'.Drop(event)"',n=' ondragleave="'+f.getMe()+'.DragLeave(event)"',l='<span class="gx-db-widget-placeholder">{0}</span>');b.Mode==TableMode.Grid&&(h="grid-column:"+(g+1)+"/span 1;grid-row:"+(d+1)+"/span 1;",
f.endsWith(e.ElementId,"_NEWROW_NEWCELL")&&(h="grid-column:1/span "+b.Rows[0].Cells.length+";grid-row:"+(d+1)+"/span 1"),h=' style="'+h+'"');c=this.CellClass2(b,c,d,e,g);d=this.GetDOMElementId(e.ElementId);j.push(d);i+='<div id="'+d+'" class="'+c+'"'+h+k+m+n+">";e.IsEmpty?i=f.endsWith(e.ElementId,"_NEWROW_NEWCELL")?i+l.replace("{0}",b.CellEmptyMessage):i+l.replace("{0}",""):(h=e[e.ChildType],i=e.HasTable?i+this.GetTableHTML(a,h,!0,j,!1):i+this.GetWidgetHTML(a,b,e,h,j));return i+"</div>"};this.SetBorder=
function(a,b){function c(a,b,c){function d(a,b){if(!a.classList.contains(b)){for(var c=a.classList.length-1;0<=c;c--){var e=a.classList.item(c);if(f.startsWith(e,"gx-db-dropTarget")){a.classList.remove(e);"gx-db-dropTarget-right-middle"==e&&a.nextSibling.classList.remove("gx-db-dropTarget-left-middle");"gx-db-dropTarget-left-middle"==e&&a.previousSibling.classList.remove("gx-db-dropTarget-right-middle");"gx-db-dropTarget-bottom-middle"==e&&a.nextSibling.classList.remove("gx-db-dropTarget-top-middle");
"gx-db-dropTarget-top-middle"==e&&a.previousSibling.classList.remove("gx-db-dropTarget-bottom-middle");break}}a.classList.add(b)}}if(null!=a)switch(b){case DropZone.Inside:d(a,"gx-db-dropTarget-inside");break;case DropZone.Right:null==a.nextSibling||c?d(a,"gx-db-dropTarget-right"):(d(a,"gx-db-dropTarget-right-middle"),d(a.nextSibling,"gx-db-dropTarget-left-middle"));break;case DropZone.Left:null==a.previousSibling||c?d(a,"gx-db-dropTarget-left"):(d(a,"gx-db-dropTarget-left-middle"),d(a.previousSibling,
"gx-db-dropTarget-right-middle"));break;case DropZone.Top:null==a.previousSibling||c?d(a,"gx-db-dropTarget-top"):(d(a,"gx-db-dropTarget-top-middle"),d(a.previousSibling,"gx-db-dropTarget-bottom-middle"));break;case DropZone.Bottom:null==a.nextSibling||c?d(a,"gx-db-dropTarget-bottom"):(d(a,"gx-db-dropTarget-bottom-middle"),d(a.nextSibling,"gx-db-dropTarget-top-middle"));break;default:d(a,"gx-db-dropTarget-outside")}}var d=!0;b!=DropZone.Outside&&(d="grid"==a.parentElement.style.display||a.parentElement.classList.contains("gx-db-widget"));
switch(b){case DropZone.Top:case DropZone.Bottom:d?(c(a.parentNode,DropZone.Outside,!0),c(a,b,!0)):(c(a.parentNode,b,!1),c(a,DropZone.Outside,!1));break;case DropZone.Inside:case DropZone.Right:case DropZone.Left:c(a.parentNode,DropZone.Outside,d);c(a,b,d);break;case DropZone.Outside:c(a.parentNode,b,!0),c(a,b,!0)}};this.DraggableParents=function(){this._DraggableParents||(this._DraggableParents=[]);return this._DraggableParents};this.RemoveDraggableAttributes=function(a){for(var b=this.DraggableParents(),
a=document.getElementById(this.GetDOMElementId(a));null!=a&&!(a instanceof HTMLDocument);)a.getAttribute("draggable")&&(b.push(a.id),a.setAttribute("draggable",!1)),a=a.parentNode};this.RestoreDraggableAttributes=function(){for(var a=this.DraggableParents(),b=0;b<a.length;b++)document.getElementById(a[b]).setAttribute("draggable",!0);a.splice(0,a.length)};this.GetDropZone=function(a){var b=f.get("#"+a.currentTarget.id).offset(),c=a.pageX-b.left,b=a.pageY-b.top,d=a.currentTarget.offsetWidth,e=a.currentTarget.offsetHeight,
g=c*e/d,h=parseInt(e-c*e/d);if(0>c||0>b||c>=d||b>=e)return DropZone.Outside;if(1==a.currentTarget.childNodes.length&&a.currentTarget.childNodes[0].classList.contains("gx-db-widget-placeholder"))return DropZone.Inside;if(b<g&&b<h)return DropZone.Top;if(b>g&&b>h)return DropZone.Bottom;if(b>g&&b<h)return DropZone.Left;if(b<g&&b>h)return DropZone.Right};this.DropInfo=function(){this._DropInfo||(this._DropInfo={DropTarget:null,DropZone:DropZone.Outside,DragUpperMostAncestorId:null});return this._DropInfo};
this.DragOver=function(a){var b=this.DropInfo();this.CompatibleDropZone(a,b)&&(b=this.DropInfo(),a.preventDefault(),a.stopPropagation(),b.DropTarget!=a.currentTarget&&(null!=b.DropTarget&&this.SetBorder(b.DropTarget,DropZone.Outside),b.DropTarget=a.currentTarget),a=this.GetDropZone(a),b.DropZone=a,this.SetBorder(b.DropTarget,b.DropZone))};this.DragStart=function(a,b){a.stopPropagation();a.ctrlKey?this.SelectElement(a,b,!0,!0):0>this.SelectedElementIds.indexOf(b)&&this.SelectElement(a,b,!1,!0);var c=
this.DropInfo(),d=this.GetElement(b),d=f.getUpperMostAncestorElementId(d);c.DragUpperMostAncestorId=d;1==this.SelectedElementIds.length?a.dataTransfer.setData("text",Command.MoveElement+","+this.SelectedElementIds[0]):a.dataTransfer.setData("text",Command.MoveElements+","+this.SelectedElementIds)};this.DragEnd=function(){this.DropInfo().DragUpperMostAncestorId=null};this.DragLeave=function(a){this.GetDropZone(a)==DropZone.Outside&&this.SetBorder(a.currentTarget,DropZone.Outside)};this.Drop=function(a){a.preventDefault();
a.stopPropagation();var b=this.DropInfo();this.SetBorder(b.DropTarget,DropZone.Outside);var a=a.dataTransfer.getData("text").split(","),c=b.DropTarget.id.replace(RegExp(this.GetDOMElementId("")),"");1==a.length?f.callbacks.addKBObjects(a[0],b.DropZone,c):2==a.length&&a[0]==Command.AddElement?f.callbacks.addElement(a[1],b.DropZone,c):2==a.length&&a[0]==Command.MoveElement?f.callbacks.moveElement(a[1],b.DropZone,c):2<=a.length&&a[0]==Command.MoveElements&&f.callbacks.moveElements(a.splice(1,a.length-
1).join(),b.DropZone,c);this.DeselectAll()};this.CompatibleDropZone=function(a,b){var c=this.GetDOMElementId(""),c=this.GetElement(a.currentTarget.id.replace(RegExp(c),""));return f.getUpperMostAncestorElementId(c)==b.DragUpperMostAncestorId||null==b.DragUpperMostAncestorId};this.GetDOMElementId=function(a){return f.getContainerControlId()+"_element_"+a};this.GetPanelBodyId=function(a){return f.getContainerControlId()+"_panel_body_"+a};this.GetPanelCollapsibleId=function(a){return f.getContainerControlId()+
"_panel_collapsible_"+a};this.GetDOMElementSelectorId=function(){return f.getContainerControlId()+"_selector"};this.GetErrorDiv=function(){return document.getElementById("gx-dashboard-error-placeholder")};this.DIVStart=function(a,b,c,d,e,g,h){var j="",i="",k="",m="",n="",l=c,o;f.isEditor()&&null!=a&&(j=e?' draggable="true"':"",i=e?' ondragstart="'+f.getMe()+".DragStart(event,'"+a.ElementId+"');\"":"",k=e?' ondragend="'+f.getMe()+'.DragEnd();"':"",m=!g?"":' onclick="'+f.getMe()+".SelectElementClicking(event, '"+
a.ElementId+'\');" onmouseover="'+f.getMe()+".MouseOver(event, '"+a.ElementId+'\');" onmouseout="'+f.getMe()+".MouseOut(event, '"+a.ElementId+"');\"",n=!h?"":' onkeyup="'+f.getMe()+'.KeyUp(event);"',l+=(""==c?"":" ")+this.NotSelectedElementClass(a),o=!h?"":' tabindex="0"');return"<div"+(""!=b?' id="'+b+'"':"")+(""!=l?' class="'+l+'"':"")+(""!=d?' style="'+d+'"':"")+o+j+m+n+i+k+">"};this.GetWidgetHTML=function(a,b,c,d,e){var a=this.GetWidgetContentHTML(a,d,e),g=this.GetDOMElementId(d.ElementId);e.push(g);
b=b.Mode==TableMode.Grid?f.getGridCellStyle(c):f.widgetOverflowStr(d);return a=this.DIVStart(d,g,""==d.ContainerClass?"gx-db-widget":d.ContainerClass,b,!0,!0,!1)+a+"</div>"};this.GetWidgetContentHTML=function(a,b,c){var d;if(b.Tables){d=[];for(var e=0;e<b.Tables.length;e++)d.push(this.GetTableHTML(a,b.Tables[e],!1,c,!1))}if(f.widgetsExpanded()){c=f.getWidgetContentHTML(a,b);if(b.FrameVisible){d="";var e=this.GetPanelBodyId(b.ElementId),g=this.GetPanelCollapsibleId(b.ElementId),h=""==b.FrameClass?
"gx-db-widget-frame":b.FrameClass,j=""==b.FrameTitleClass?"gx-db-widget-frame-title":b.FrameTitleClass,i=""==b.FrameBodyClass?"gx-db-widget-frame-body":b.FrameBodyClass,k="";b.FrameTitle&&""!=b.FrameTitle&&(k="",b.FrameAllowCollapsing&&(k=b.FrameCollapsed?" collapsed":"",k='<div><span class="gx-db-widget-frame-collapse-image'+k+'" data-toggle="collapse" data-target="#'+g+'" onclick="'+f.getMe()+".ToggleFrameCollapsed('"+b.ElementId+"');\"></span></div>"),k='<div class="panel-heading '+j+'"><div>'+
f.replaceVariablesValuesInText(b.FrameTitle,a.Variables.Filters)+"</div>"+k+"</div>");a="position:relative;"+f.widgetOverflowStr(b);d=d+('<div class="panel panel-default gx-db-no-margin '+h+'">')+k;b.FrameAllowCollapsing&&(k=b.FrameCollapsed?"":" in",d+='<div id="'+g+'" class="panel-collapse collapse'+k+'">');d=d+('<div id="'+e+'" class="panel-body '+i+'" style="'+a+'">')+c+"</div>";b.FrameAllowCollapsing&&(d+="</div>");return d+"</div>"}return c}return this.GetCollapsedWidgetHTML(b,d)};this.GetCollapsedWidgetHTML=
function(a,b){var c="";if(b){for(var c=c+('<div class="gx-db-collapse-container"><div>'+this.GetElementIcon(a)+a.ControlName+"</div><div>"),d=0;d<b.length;d++)c+='<div style="grid-column:'+(d+1)+'/span 1">'+b[d]+"</div>";c+="</div></div>"}else c+='<div class="gx-db-collapsed">'+this.GetElementIcon(a)+a.ControlName+"</div>";f.isEditor()&&(c+=f.getHamburgerMenuHTML(a));return c};this.SelectElementClicking=function(a,b){this.SelectElement(a,b,a.ctrlKey,!0)};this.ImpactsElementClass=function(){return"gx-db-impacts-element"};
this.DependsOnElementClass=function(){return"gx-db-dependsOn-element"};this.NotSelectedElementClass=function(a){return a.ElementType==ElementType.Table?"gx-db-not-selected-table":"gx-db-not-selected-element"};this.SelectedElementClass=function(a){return a.ElementType==ElementType.Table?"gx-db-selected-table":"gx-db-selected-element"};this.NotMouseOverElementClass=function(a){return a.ElementType==ElementType.Table?"gx-db-not-mouseover-table":"gx-db-not-mouseover-element"};this.MouseOverElementClass=
function(a){return a.ElementType==ElementType.Table?"gx-db-mouseover-table":"gx-db-mouseover-element"};this.GetElement=function(a){for(var b=f.dashboard,c=0;c<b.AllElements.length;c++)if(element=b.AllElements[c],element.ElementId==a)return element;return null};this.SelectObjectItem=function(a,b,c){a.stopPropagation();f.callbacks.selectObjectItem(b,c)};this.ToggleFrameCollapsed=function(a){var b=this.GetElement(a);b.FrameCollapsed=!b.FrameCollapsed;f.isEditor()&&window.external.SetFrameCollapsed(a,
b.FrameCollapsed)};this.SelectElement=function(a,b,c,d){if(!(null!=a&&a.SelectElementExecuted)){var e=null;if(c)(c=0>this.SelectedElementIds.indexOf(b))&&this.SelectedElementIds.push(b);else{if(c=this.SelectedElementIds!=[b])this.SelectedElementIds=[b];e=this.GetElement(b)}if(c){b="";for(c=0;c<this.SelectedElementIds.length;c++)b+=(""==b?"":",")+this.SelectedElementIds[c];f.callbacks.selectElements(b);this.UpdateSelection()}d&&null!=e&&this.UpdateSelectedElementPath(e);null!=a&&(a.SelectElementExecuted=
!0)}};this.SelectAll=function(){var a=f.dashboard;this.SelectedElementIds.splice(0,this.SelectedElementIds.length);for(var b=0;b<a.AllElements.length;b++)element=a.AllElements[b],(element.ElementType==ElementType.Widget||element.ElementType==ElementType.Table&&element.ParentElement.ElementType!=ElementType.Layout)&&this.SelectedElementIds.push(element.ElementId);this.UpdateSelection()};this.DeselectAll=function(){this.SelectedElementIds.splice(0,this.SelectedElementIds.length);this.UpdateSelection()};
this.AddElementClass=function(a,b,c){this.RemoveAllElementClasses(a,b);var d;switch(c){case ElementCssClass.Selected:d=this.SelectedElementClass(b);break;case ElementCssClass.NotSelected:d=this.NotSelectedElementClass(b);break;case ElementCssClass.DependsOn:d=this.DependsOnElementClass();break;case ElementCssClass.Impacts:d=this.ImpactsElementClass()}a.classList.add(d)};this.RemoveAllElementClasses=function(a,b){a.classList.remove(this.SelectedElementClass(b));a.classList.remove(this.NotSelectedElementClass(b));
a.classList.remove(this.DependsOnElementClass());a.classList.remove(this.ImpactsElementClass())};this.UpdateSelection=function(){for(var a=f.dashboard,b=0;b<a.AllElements.length;b++){var c=a.AllElements[b];if(c.ElementType!=ElementType.Row&&c.ElementType!=ElementType.Cell){var d=document.getElementById(this.GetDOMElementId(c.ElementId));0>this.SelectedElementIds.indexOf(c.ElementId)?(c.Selected=!1,null!=d&&this.AddElementClass(d,c,ElementCssClass.NotSelected)):(c.Selected=!0,null!=d&&this.AddElementClass(d,
c,ElementCssClass.Selected))}}if(1==this.SelectedElementIds.length){c=this.GetElement(this.SelectedElementIds[0]);for(b=0;b<a.AllElements.length;b++)if(d=a.AllElements[b],c!=d&&(d.ElementType==ElementType.Widget||d.ElementType==ElementType.Layout)){var e=document.getElementById(this.GetDOMElementId(d.ElementId));if(null!=e)if(1>=this.SelectedElementIds.length){var g=f.dependsOnElement(c,d),h=f.impactsElement(c,d);g?this.AddElementClass(e,d,ElementCssClass.DependsOn):h?this.AddElementClass(e,d,ElementCssClass.Impacts):
this.AddElementClass(e,d,ElementCssClass.NotSelected)}else this.AddElementClass(e,d,ElementCssClass.NotSelected)}this.ShowReferences(c)}else this.HideReferences()};this.GetReferencesDiv=function(){return document.getElementById("gx-dashboard-references-placeholder")};this.ShowReferences=function(a){function b(a){a.classList.add("gx-db-dependencies");a.classList.remove("gx-db-impact")}function c(a){a.classList.add("gx-db-impact");a.classList.remove("gx-db-dependencies")}function d(){if(window.event){for(var a=
["gx-db-filter-value","gx-db-object-menu","gx-db-object-menu-icon"],b=0;b<a.length;b++)if(window.event.target.classList.contains(a[b]))return!0;return!1}return!0}if((a.ElementType==ElementType.Widget||a.ElementType==ElementType.Layout)&&!d()){var e=f.getElementReferences(a);if(""!=e.DependenciesHTML||""!=e.ImpactHTML){var g=this.GetReferencesDiv();""!=e.DependenciesHTML&&""==e.ImpactHTML?(b(g),e=e.DependenciesHTML):""==e.DependenciesHTML&&""!=e.ImpactHTML?(c(g),e=e.ImpactHTML):a.WidgetType==WidgetType.Filter?
(c(g),e=e.ImpactHTML+"<br>"+e.DependenciesHTML):(b(g),e=e.DependenciesHTML+"<br>"+e.ImpactHTML);g.innerHTML=e;g.style.display="block";g.style.left=window.event.x+(a.WidgetType==WidgetType.Filter&&f.dashboard.Layout.FiltersPosition==FiltersPosition.Right?-g.offsetWidth:0)+"px";g.style.top=window.event.y+"px";g.classList.remove("gx-db-fade");this._referencesFadeTimeout&&clearTimeout(this._referencesFadeTimeout);a=f.getMe()+".FadeReferences();";this._referencesFadeTimeout=setTimeout(a,5E3)}else this.HideReferences()}else this.HideReferences()};
this.HideReferences=function(){this.GetReferencesDiv().style.display="none"};this.FadeReferences=function(){this.GetReferencesDiv().classList.add("gx-db-fade")};this.UpdateSelectedElementPath=function(a){var b=document.getElementById(this.GetDOMElementSelectorId()),a=this.GetElementSelectorHTML(a);b.innerHTML=a};this.MouseOver=function(a,b){this.MouseCrossElementBorder(a,b,!0)};this.MouseOut=function(a,b){this.MouseCrossElementBorder(a,b,!1)};this.KeyUp=function(a){a.stopPropagation();46==a.keyCode&&
window.external.DeleteSelectedElements()};this.MouseCrossElementBorder=function(a,b,c){null!=a&&a.stopPropagation();void 0==this._MouseOverElement&&!c||void 0!=this._MouseOverElement&&this._MouseOverElement.ElementId==b&&c||(a=this.GetElement(b),this._MouseOverElement=c?a:void 0,null!=a&&(b=document.getElementById(this.GetDOMElementId(a.ElementId)),null!=b&&(c?(b.classList.remove(this.NotMouseOverElementClass(a)),b.classList.add(this.MouseOverElementClass(a))):(b.classList.remove(this.MouseOverElementClass(a)),
b.classList.add(this.NotMouseOverElementClass(a))))))};this.GetElementIcon=function(a){if(a.ElementType==ElementType.Widget)source=f.getElementIcon(a);else switch(a.ElementType){case ElementType.Layout:source="Layout.ico";break;case ElementType.Table:source="Table.ico";break;case ElementType.Row:source="Row.ico";break;case ElementType.Cell:source="Cell.ico"}return'<img height="16" width="16" src="dashboardviewer/images/'+source+'">&nbsp;'};this.GetElementSelectorHTML=function(a){for(var b='<div class="'+
this.TableClass(!0,"")+'">',c=this.CellClass(f.isEditor()?"gx-db-flex-cell gx-db-flex-cell-12":"col-xs-12",!1,!1,""),d=this.RowClass(""),c='<div id="'+this.GetDOMElementSelectorId()+'" class="'+d+'"><div class="'+c+'">',d="";null!=a;){var e;if(a.ElementType==ElementType.Row||a.ElementType==ElementType.Cell||a.ElementType==ElementType.Dashboard)e="";else{e=a;var g=f.getMe(),h=this.GetElementIcon(e);e='<button type="button" class="btn btn-default" onclick="'+g+".SelectElement(event,'"+e.ElementId+'\', false, false);" onmouseover="'+
g+".MouseOver(event,'"+e.ElementId+'\');"  onmouseout="'+g+".MouseOut(event,'"+e.ElementId+"');\">"+h+(e.ElementType==ElementType.Layout?e.ElementType:e.ControlName)+"</button>"}d=e+d;a=a.ParentElement}return b+c+d+"</div></div></div>"};this.Initialize()};
