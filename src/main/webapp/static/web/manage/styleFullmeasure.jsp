<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="com.seeyoui.kensite.common.util.*"%>
<%@ include file="/WEB-INF/view/taglib/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title></title>
	<%@ include file="/WEB-INF/view/taglib/header.jsp" %>
	<%
		String id = request.getParameter("id");
		String popupID = request.getParameter("popupID");
	%>
	<link type="text/css" rel="stylesheet" href="${ctx_web}/css/manage.min.css?v=201601041813"/>
	<script type="text/javascript" src="${ctx_web}/js/comm/jquery/jquery-core.min.js?v=201503161711"></script>
	<script type="text/javascript" src="${ctx_web}/js/comm/fai.min.js?v=201512071738"></script>
	<script type="text/javascript" src="${ctx_web}/js/comm/jquery/jquery-ui-core.min.js?v=201511231730"></script>
	<script type="text/javascript" src="${ctx_web}/js/comm/pinyin.min.js?v=201306041217"></script>
	<script type="text/javascript" src="${ctx_web}/js/comm/faiui.min.js?v=201601111801"></script>
	<script type="text/javascript" src="${ctx_web}/js/site.min.js?v=201601131153"></script>
	<script type="text/javascript" src="${ctx_web}/js/manage.min.js?v=201601121610"></script>
	<script type="text/javascript">
	try {
		Fai.top = parent.Fai.top;
	} catch (e) {
	}
	</script>
	<link type="text/css" href="${ctx_web}/css/site/styleFullmeasure.min.css" rel="stylesheet"/>

<script type="text/javascript">
var addMode = <%=StringUtils.isBlank(id)%>;
var g_id = <%=StringUtils.isBlank(id)?0:id%>;
var g_initing = true;
var file_size_limit = 1;
var initPattern = Site.getModuleAttrPattern(g_id);
var moduleStyleNum = addMode ? 10 : initPattern.systemFullmeasure;
var moduleBg = addMode ? {"y":0} : initPattern.fullmeasurePattern.mb;
var contentBg = addMode ? {"y":0} : initPattern.fullmeasurePattern.cb;
var contentWidth = addMode ? -1 : initPattern.fullmeasurePattern.cw;
var inner = addMode ? {"y":0} : initPattern.fullmeasurePattern.i;
var border = addMode ? {"y":0} : initPattern.fullmeasurePattern.b;
var cusNowContentWidth = 960;
var $option;
var popupID = <%=popupID%>;

$(function(){
	Fai.addPopupWindowBtn(popupID, {id:'save', extClass:'saveButton', text:'确 定', click:save});
	Fai.addPopupWindowBtn(popupID, {id:'close', extClass:'cancelButton', text:'取 消', click:'close'});
	
	$('#tabs').tabs({ selected:0 });

	//绑定颜色控件
   $("#moduleBgColorPicker").faiColorPicker({
        onchange:onModuleBgColorChange,
        defaultcolor: typeof moduleBg.c == "undefined" ?  "" : moduleBg.c,
        showInTop:true
    });
	
	$("#moduleContentBgColorPicker").faiColorPicker({
        onchange:onModuleContentBgColorChange,
        defaultcolor: typeof contentBg.c == "undefined" ? "" : contentBg.c,
        showInTop:true
    });
	
	$("#moduleBorderColorPicker").faiColorPicker({
        onchange:onModuleBorderColorChange,
        defaultcolor: typeof border.c == "undefined" ?  "" : border.c,
        showInTop:true
    });
	
	//图片上传
	var fileUpload_settings = {title:"添加图片", maxSize:parseInt(file_size_limit), type:['jpg','jpeg','gif','png'], from:"bg", entry:"fullmeasureBg"};
	Site.fileUpload2("#moduleBgFileButton", fileUpload_settings, callbackFullmeasureBgUpload);
	
	var fileUpload_settings2 = {title:"添加图片", maxSize:parseInt(file_size_limit), type:['jpg','jpeg','gif','png'], from:"bg", entry:"fullmeasureContentBg"};
	Site.fileUpload2("#moduleContentBgFileButton", fileUpload_settings2, callbackFullmeasureContentBgUpload);
	
	//内容区宽度-拖动条
	var cusMaxWidth = 1440;
	var cusMinWidth = 800;
	var defaultSiteWidth = parseInt( top.$(top.document).find("#container").width() ) || 960; //新添加模块的宽度
	cusNowContentWidth = contentWidth > -1 ? contentWidth : defaultSiteWidth;
	var sliderDefault = {
		animate: true,
		max: cusMaxWidth,
		min: cusMinWidth,
		orientation: "horizontal",
		step: 10,
		value: cusNowContentWidth,
		start: slideStart,
		slide: slideing,
		stop : slideStop
	};
	$("#setFullMeasureWidth").slider(sliderDefault);
	$("#setFullMeasureWidthContainer").append("<span id='ui-slider-value'>"+cusNowContentWidth+"px</span>");
	
	function slideStart(event, ui){
		$("#setFullMeasureWidth").addClass("w-resize");
		cusNowContentWidth = ui.value;
		contentWidth = ui.value;
		refreshContentWidth();
		if(!addMode){
			Site.adjustPhotoCard(Fai.top.$("#module" + g_id));
		}
	}
	
	function slideing(event, ui){
		$("#ui-slider-value").text(ui.value+'px');
		cusNowContentWidth = ui.value;
		contentWidth = ui.value;
		refreshContentWidth();
		if(!addMode){
			Site.adjustPhotoCard(Fai.top.$("#module" + g_id));
		}
	}
	
	function slideStop(event, ui){
		$("#setFullMeasureWidth").removeClass("w-resize");
		$("#ui-slider-value").text(ui.value+'px');
		cusNowContentWidth = ui.value;
		contentWidth = ui.value;
		refreshContentWidth();
		enableSaveBtn();
	}
    
	var maxOpacity = 90,
		minOpacity = 0;
		stepOpacity = 1;

	//通栏模块背景透明度设置
	var sliderBgDefault = {
		animate: true,
		max: maxOpacity,
		min: minOpacity,
		orientation: "horizontal",
		step: stepOpacity,
		value: moduleBg.o || 0,
		start: bgSlideStart,
		slide: bgSlideing,
		stop : bgSlideStop
	};
	$("#setBgOpacity").slider(sliderBgDefault);
	$("#bgOpacityText").append("<span id='bgOpacityVal'>" + (moduleBg.o || 0) + "%" + "</span>");

	function bgSlideStart(event, ui){
		$("#bgOpacityVal").text(ui.value + "%");
	}

	function bgSlideing(event, ui){
		var opacity = ui.value,
			saveOpacity = 100 - opacity;
		$("#bgOpacityVal").text(ui.value + "%");
		setFullMeasureBgOpacity(saveOpacity, "outer");
	}

	function bgSlideStop(event, ui){
		var opacity = ui.value,
			saveOpacity = 100 - opacity;

		$("#bgOpacityVal").text(ui.value + "%");
		if(ui.value == 0){
			removeFullMeasureBgOpacity("outer");
		}
		moduleBg.o = opacity;
		enableSaveBtn();
	}

	//内容区背景透明度设置
	var sliderContentBgDefault = {
		animate: true,
		max: maxOpacity,
		min: minOpacity,
		orientation: "horizontal",
		step: stepOpacity,
		value: contentBg.o || 0,
		start: contentBgSlideStart,
		slide: contentBgSlideing,
		stop : contentBgSlideStop
	};
	$("#setContentBgOpacity").slider(sliderContentBgDefault);
	$("#contentBOpacitygText").append("<span id='contentbgOpacityVal'>" + (contentBg.o || 0) + "%" + "</span>");

	function contentBgSlideStart(event, ui){
		$("#contentbgOpacityVal").text(ui.value);
	}
	function contentBgSlideing(event, ui){
		var opacity = ui.value,
			saveOpacity = 100 - opacity;
		$("#contentbgOpacityVal").text(ui.value + "%");
		setFullMeasureBgOpacity(saveOpacity, "content");
	}
	function contentBgSlideStop(event, ui){
		var opacity = ui.value,
			saveOpacity = 100 - opacity;
		$("#contentbgOpacityVal").text(ui.value + "%");
		setFullMeasureBgOpacity(saveOpacity, "content");
		contentBg.o = opacity;
		enableSaveBtn();

	}
	$option = $(".moduleStyleChoiceOption");
	
	initPage();

	g_initing = false;
	$('#moduleTitle').focus();
	$('#moduleTitle').select();
});

function initPage(){
	$("#moduleStyleChoiceOption"+moduleStyleNum).addClass("checkedStyle");
	$('#moduleTitle').focus();
	$('#moduleTitle').select();
	//模块背景
	if(moduleBg.y == 0){
		$("#sysModuleBg").attr("checked","checked");
		changeBlockStatus(false,'cusModuleBgSetting');
	}else{
		$("#cusModuleBg").attr("checked","checked");
	}
	if(typeof moduleBg.r != "undefined"){
		$("#moduleBgRepeat").val(moduleBg.r);
	}else{
		$("#moduleBgRepeat").val(-1);
	}
	if(typeof moduleBg.f != "undefined"){
		$("#moduleBgFileView").html("<a href='javascript:;' onclick='view(\""+ moduleBg.f + "\");return false;'>查看</a>");
	}
	
	//中间背景
	if(contentBg.y == 0){
		$("#sysModuleContentBg").attr("checked","checked");
		changeBlockStatus(false,'cusModuleContentBgSetting');
	}else{
		$("#cusModuleContentBg").attr("checked","checked");
	}
	if(typeof contentBg.r != "undefined"){
		$("#moduleContentBgRepeat").val(contentBg.r);
	}else{
		$("#moduleContentBgRepeat").val(-1);
	}
	if(typeof contentBg.f != "undefined"){
		$("#moduleContentBgFileView").html("<a href='javascript:;' onclick='view(\""+ contentBg.f + "\");return false;'>查看</a>");
	}
	
	//内容区宽度
	if(contentWidth > -1){
		$("#cusContentWidth").attr("checked", "checked");
	}else{
		$("#sysContentWidth").attr("checked", "checked");
		changeBlockStatus(false,'cusContentWidthSetting');
	}
	
	//内边距
	if(inner.y == 0){
		$("#sysContentPadding").attr("checked", "checked");
		changeBlockStatus(false,'cusContentPaddingSetting');
	}else{
		$("#cusContentPadding").attr("checked", "checked");
	}
	$("#padding_top").val(inner.t || 0);
	$("#padding_bottom").val(inner.b || 0);
	$("#padding_left").val(inner.l || 0);
	$("#padding_right").val(inner.r || 0);
	
	if(border.y == 0){
		$("#sysModuleBorder").attr("checked", "checked");
		changeBlockStatus(false,'cusModuleBorderSetting');
	}else if(border.y == 1){
		$("#hideModuleBorder").attr("checked", "checked");
		changeBlockStatus(false,'cusModuleBorderSetting');
	}else{
		$("#cusModuleBorder").attr("checked", "checked");
	}
	$("#moduleBorderWidth").val(border.w || 1);
	$("#moduleBorderStyle").val(border.s || 0);
	$("#moduleBorderPosition").val(border.p || 1);
}


//页面值改变
function setPageChange(){
	Site.setPageChange(true,popupID);	
}
//保存时reset
function reSetPageChange(){
	Site.setPageChange(false,popupID);	
}

function enableSaveBtn(){
	Fai.enablePopupWindowBtn(popupID, 'save', true);
	Site.styleChanged();
	if(!addMode){
		var pattern = {};
		var name = $('#moduleTitle').val();
		var minlen = 0;
		var maxlen = 50;
		if( name.length > maxlen ){
			Fai.ing( '模块标题文字长度不能超过' + maxlen + '。', true );
			$('#moduleTitle').focus();
			return;
		}
		
		var params = new Array();
		params.push( 'name=' + Fai.encodeUrl(name) );
		
		if(!Fai.isNumber(moduleStyleNum)){
			Fai.ing('样式参数错误', false);
			return;
		}
		pattern.fms = parseInt(moduleStyleNum); 
		
		var tmpData = {};
		tmpData.mb = moduleBg;
		tmpData.cb = contentBg;
		tmpData.cw = parseInt(contentWidth);
		tmpData.i = inner;
		tmpData.b = border;
		pattern.fmp = tmpData;
		
		Site.getModuleAttrPattern(g_id).systemFullmeasure = pattern.fms;
		Site.getModuleAttrPattern(g_id).fullmeasurePattern = pattern.fmp;
		Site.getModuleAttrPattern(g_id).changed = true;
	}
}

function save(){
	var pattern = {};
	var name = $('#moduleTitle').val();
	var minlen = 0;
	var maxlen = 50;
	if( name.length > maxlen ){
		Fai.ing( '模块标题文字长度不能超过' + maxlen + '。', true );
		$('#moduleTitle').focus();
		return;
	}
	
	var params = new Array();
	params.push( 'name=' + Fai.encodeUrl(name) );
	
	if(!Fai.isNumber(moduleStyleNum)){
		Fai.ing('样式参数错误', false);
		return;
	}
	pattern.fms = parseInt(moduleStyleNum); 
	
	var tmpData = {};
	tmpData.mb = moduleBg;
	tmpData.cb = contentBg;
	tmpData.cw = parseInt(contentWidth);
	tmpData.i = inner;
	tmpData.b = border;
	pattern.fmp = tmpData;
	
	if(!addMode){
		Site.getModuleAttrPattern(g_id).systemFullmeasure = pattern.fms;
		Site.getModuleAttrPattern(g_id).fullmeasurePattern = pattern.fmp;
		Site.getModuleAttrPattern(g_id).changed = true;
	}

	params.push( '&pattern=' + Fai.encodeUrl($.toJSON(pattern)) );
	
	Fai.ing( '正在保存...', false );
	$.ajax({
		type: 'post',
		url: '../ajax/module_h.jsp?cmd=add&style=80&colId=2&extId=0',
		data: params.join(''),
		error: function(){ 
			Fai.ing( '服务繁忙，请稍候重试',false ); 
			Fai.enablePopupWindowBtn(popupID, 'save', true);
		},
		success: function(data){
			Fai.enablePopupWindowBtn(popupID, 'save', true);
			var res = $.parseJSON(data);
			reSetPageChange();
			
			if(Fai.successHandle(data, '修改成功', '系统错误', "", 3, 1)){
				if( addMode ){
					if(Fai.top._appendLayout != 24 && Fai.top._appendLayout != 25){
						Fai.top._appendLayout = 24;
					}
					if(!Fai.top.draggableDiv_out){
						Fai.top._appendModule = -1;
					}
					Site.addNewModule(res.id, res.div,null,null,{"returnModuledata":res.moduleData});
				}else{
					Site.triggerGobalEvent("site_refreshModule", res.id); 
				}
				Fai.closePopupWindow( popupID );
			}
		}
	});
	
}

//输入框
function changeBlockStatus(flag,id){
	flag ? $("#"+id).show() : $("#"+id).hide();
}

function onModuleBgColorChange(color){
	moduleBg.c = color;
	refreshModuleBgStyle();
	enableSaveBtn();
}

function onModuleContentBgColorChange(color){
	contentBg.c = color;
	refreshContentBgStyle();
	enableSaveBtn();
}

function onModuleBorderColorChange(color){
	border.c = color;
	refreshBorderStyle();
	enableSaveBtn();
}

function callbackFullmeasureBgUpload(back){
	if(back){
		var resultBack = $.parseJSON(back);
		var fileId = resultBack.data[0].fileId;
		var filePath = resultBack.data[0].filePath;
		var fileWidth = resultBack.data[0].fileWidth;
		var fileHeight = resultBack.data[0].fileHeight;
		
		moduleBg.f = fileId;
		moduleBg.p = filePath;		
		$("#moduleBgFileView").html("<a href='javascript:;' onclick='view(\""+ fileId + "\");return false;'>查看</a>");
		refreshModuleBgStyle();
		enableSaveBtn();
	}
}

function callbackFullmeasureContentBgUpload(back){
	if(back){
		var resultBack = $.parseJSON(back);
		var fileId = resultBack.data[0].fileId;
		var filePath = resultBack.data[0].filePath;
		var fileWidth = resultBack.data[0].fileWidth;
		var fileHeight = resultBack.data[0].fileHeight;
		
		contentBg.f = fileId;
		contentBg.p = filePath;
		$("#moduleContentBgFileView").html("<a href='javascript:;' onclick='view(\""+ fileId + "\");return false;'>查看</a>");
		refreshContentBgStyle();
		enableSaveBtn();
	}
}
//模块系统样式
function changeModuleStyle(num){
	var oldStyleNum = moduleStyleNum;
	moduleStyleNum = parseInt(num);
	$option.removeClass("checkedStyle");
	$("#moduleStyleChoiceOption"+num).addClass("checkedStyle");
	
	if(!addMode){
		Fai.top.$("#module"+g_id).find(".fullmeasureOuterContentBg"+g_id).removeClass("fullmeasureStyle"+oldStyleNum).addClass("fullmeasureStyle"+moduleStyleNum);
	}
	enableSaveBtn();
}

function changeModuleBgType(type){
	moduleBg.y = parseInt(type);
	refreshModuleBgStyle();
	enableSaveBtn();
}

function changeModuleBgRepeat(){
	moduleBg.r = parseInt($("#moduleBgRepeat").val());
	if(!moduleBg.f){
		Fai.ing("请先添加背景图片。",true);
	}
	Site.showRepeatTip(moduleBg.r);
	refreshModuleBgStyle();
	enableSaveBtn();
}

function changeContentBgType(type){
	contentBg.y = parseInt(type);
	refreshContentBgStyle();
	enableSaveBtn();
}

function changeContentBgRepeat(){
	contentBg.r = parseInt($("#moduleContentBgRepeat").val());
	if(!contentBg.f){
		Fai.ing("请先添加背景图片。",true);
	}
	
	Site.showRepeatTip(contentBg.r);
	
	refreshContentBgStyle();
	enableSaveBtn();
}

function changeSysContentWidth(){
	contentWidth = -1;
	refreshContentWidth();
	enableSaveBtn();
}

function changeCusContentWidth(){
	contentWidth = cusNowContentWidth;
	refreshContentWidth();
	enableSaveBtn();
}

function changeInner(pos){
	var num = parseInt($("#padding_"+pos).val());
	if(isNaN(num) || num < 0 || num > 999){
		$("#padding_"+pos).val("");
		Fai.ing('请输入0到999之间的数值', false);
		return;
	}
	switch(pos){
		case "left": inner.l = num;break;
		case "right": inner.r = num;break;
		case "top": inner.t = num;break;
		case "bottom": inner.b = num;break;
	}
	refreshInner();
	enableSaveBtn();
}

function changeInnerType(type){
	inner.y = parseInt(type);
	refreshInner();
	enableSaveBtn();
}

function changeModuleBorderType(type){
	border.y = parseInt(type);
	refreshBorderStyle();
	enableSaveBtn();
}

function changeModuleBorderWidth(){
	border.w = parseInt($("#moduleBorderWidth").val());
	refreshBorderStyle();
	enableSaveBtn();
}

function changeModuleBorderStyle(){
	border.s = parseInt($("#moduleBorderStyle").val());
	refreshBorderStyle();
	enableSaveBtn();
}

function changeModuleBorderPosition(){
	border.p = parseInt($("#moduleBorderPosition").val());
	refreshBorderStyle();
	enableSaveBtn();
}

function view(fileId){
	var url = "../view.jsp?fileID="+fileId;
	window.open(url);
}

function refreshModuleBgStyle(){
	if(addMode){
		return;
	}
	if(moduleBg.y == 0){
		Site.removeModuleStyleCssList(g_id, [
				{cls:".fullmeasureOuterContentBg"+g_id, key:'background'},
				{cls:".fullmeasureOuterContentBg"+g_id, key:'background-size'}
			]);
		removeFullMeasureBgOpacity("outer");
	}else if(moduleBg.y == 2){
		buildBgStyle(moduleBg, "outer");
	}
}

function refreshContentBgStyle(){
	if(addMode){
		return;
	}
	if(contentBg.y == 0){
		Site.removeModuleStyleCssList(g_id, [
				{cls:".fullmeasureContentBg"+g_id, key:'background'},
				{cls:".fullmeasureContentBg"+g_id, key:'background-size'}
			]);
		removeFullMeasureBgOpacity("content");
	}else if(contentBg.y == 2){
		buildBgStyle(contentBg, "content");
	}
}

function refreshContentWidth(){
	if(addMode){
		return;
	}
	if(contentWidth > -1){
		Site.setModuleStyleCss(g_id, ".fullmeasureContent", "width", contentWidth+"px");
	}else{
		Site.removeModuleStyleCss(g_id, ".fullmeasureContent", "width");
	}
}

function refreshInner(){
	if(addMode){
		return;
	}
	if(inner.y == 0){
		Site.removeModuleStyleCss(g_id, ".fullmeasureContent", "padding");
	}else if(inner.y == 2){
		var paddingStr = "";
		typeof inner.t != "undefined" ? paddingStr += (inner.t+"px ") : paddingStr +="0 ";
		typeof inner.r != "undefined" ? paddingStr += (inner.r+"px ") : paddingStr +="0 ";
		typeof inner.b != "undefined" ? paddingStr += (inner.b+"px ") : paddingStr +="0 ";
		typeof inner.l != "undefined" ? paddingStr += (inner.l+"px") : paddingStr +="0";
		Site.setModuleStyleCss(g_id, ".fullmeasureContent", "padding", paddingStr);
	}
}

function refreshBorderStyle(){
	if(addMode){
		return;
	}
	
	var borderStyle = "",
		lineWidth = border.w || 1,
		lineStyle = border.s || 0,
		linePosition = border.p || 1,
		lineColor = border.c || "transparent",
		lineStyleStr = "solid";
	
	if(lineStyle == 1){
		lineStyleStr = "dotted";
	}else if(lineStyle == 2){
		lineStyleStr = "dashed";
	}
	
	if(border.y == 0){
		Site.removeModuleStyleCssList(g_id, [
			{cls:"", key:'border-top'},
			{cls:"", key:'border-bottom'}
		]);
	}else if(border.y == 1){
		Site.setModuleStyleCssList(g_id, [
			{cls:"", key:'border-top', value:"none"},
			{cls:"", key:'border-bottom', value:"none"}
		]);
	}else if(border.y == 2){
		borderStyle = lineWidth+"px "+ lineStyleStr +" "+lineColor;
		
		if(linePosition == 1){
			Site.setModuleStyleCssList(g_id, [
				{cls:"", key:'border-top', value:borderStyle},
				{cls:"", key:'border-bottom', value:"none"}
			]);
		}else if(linePosition == 2){
			Site.setModuleStyleCssList(g_id, [
				{cls:"", key:'border-top', value:"none"},
				{cls:"", key:'border-bottom', value:borderStyle}
			]);
		}else if(linePosition == 12){
			Site.setModuleStyleCssList(g_id, [
				{cls:"", key:'border-top', value:borderStyle},
				{cls:"", key:'border-bottom', value:borderStyle}
			]);
		}
	}
}

function buildBgStyle(data, dom){
	var bgSytleStr = "",
		bgRepeat = "",
		bgPosition = "center",
		useBgSizeStyle = false,
		bgSizeStyle = "";
		
	if(typeof data.c != "undefined"){
		bgSytleStr += data.c;
	}
	if(typeof data.f != "undefined"){
		if ( typeof data.r != "undefined" && data.r != -1 ) {
			if(data.r == 0 || data.r == 6 || data.r == 7 || data.r == 8 || data.r == 9 || data.r == 13 || data.r == 14 || data.r == 15 || data.r == 16){bgRepeat = "no-repeat";}
			if(data.r == 1 || data.r == 11 || data.r == 12 ){bgRepeat = "repeat-x";}
			if(data.r == 2 || data.r == 21 || data.r == 22){bgRepeat = "repeat-y";}
			if(data.r == 3){bgRepeat = "repeat";}
			if(data.r == 4 || data.r == 5){bgRepeat = "repeat";}
			
			if(data.r == 9 || data.r == 12){bgPosition = "bottom";}
			if(data.r == 6 || data.r == 21){bgPosition = "left";}
			if(data.r == 7 || data.r == 22){bgPosition = "right";}
			if(data.r == 4 || data.r == 5 || data.r == 8 || data.r == 11){bgPosition = "top";}
			if(data.r == 13){bgPosition = "left top";}
			if(data.r == 14){bgPosition = "right top";}
			if(data.r == 15){bgPosition = "left bottom";}
			if(data.r == 16){bgPosition = "right bottom";}
			bgSytleStr += " url("+ data.p +") " + bgRepeat + " " + bgPosition;
			
			if(data.r == 4){
				useBgSizeStyle = true;
				bgSizeStyle = "100% 100%";
			}else if(data.r == 5){
				useBgSizeStyle = true;
				bgSizeStyle = "100%";
			}
		}
	}
	
	if(dom == "outer"){
		Site.setModuleStyleCss(g_id, ".fullmeasureOuterContentBg"+g_id, "background", bgSytleStr);
		if(useBgSizeStyle){
			Site.setModuleStyleCss(g_id, ".fullmeasureOuterContentBg"+g_id, "background-size", bgSizeStyle);
		}
		if(moduleBg.o != 0){
			setFullMeasureBgOpacity(100 - moduleBg.o, "outer");
		}
	}else if(from = "content"){
		Site.setModuleStyleCss(g_id, ".fullmeasureContentBg"+g_id, "background", bgSytleStr);
		if(useBgSizeStyle){
			Site.setModuleStyleCss(g_id, ".fullmeasureContentBg"+g_id, "background-size", bgSizeStyle);
		}
		if(contentBg.o != 0){
			setFullMeasureBgOpacity(100 - contentBg.o, "content");
		}
	}
	
}


function setFullMeasureBgOpacity(opacity, dom){
	if(dom == "outer"){
		Fai.top.Site.setModuleStyleCss(g_id, ".fullmeasureOuterContentBg"+g_id, "opacity", (opacity / 100));
		Fai.top.Site.setModuleStyleCss(g_id, ".fullmeasureOuterContentBg"+g_id, "filter", "alpha(opacity=" + opacity + ")"); 
	}else if(dom == "content"){
		Fai.top.Site.setModuleStyleCss(g_id, ".fullmeasureContentBg"+g_id, "opacity", (opacity / 100));
		Fai.top.Site.setModuleStyleCss(g_id, ".fullmeasureContentBg"+g_id, "filter", "alpha(opacity=" + opacity + ")"); 
	}
}

function  removeFullMeasureBgOpacity(dom){
	if(dom == "outer"){
		Fai.top.Site.removeModuleStyleCss(g_id, ".fullmeasureOuterContentBg"+g_id, "opacity");
		Fai.top.Site.removeModuleStyleCss(g_id, ".fullmeasureOuterContentBg"+g_id, "filter"); 
	}else if(dom == "content"){
		Fai.top.Site.removeModuleStyleCss(g_id, ".fullmeasureContentBg"+g_id, "opacity");
		Fai.top.Site.removeModuleStyleCss(g_id, ".fullmeasureContentBg"+g_id, "filter"); 
	}
}
</script>

</head>

<body class="popupTabBody">
<div>
	<div class="ui-tabs ui-widget ui-widget-content ui-corner-all" id="tabs">
		<ul class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all">
			<li class="ui-state-default ui-corner-top ui-tabs-selected ui-state-active"><a href="#baseSetting">常规</a></li>
			<li class="ui-state-default ui-corner-top"><a href="#styleSetting">展示设置</a></li>
		</ul>
		<div id="baseSetting" class="baseSetting ui-tabs-panel ui-widget-content ui-corner-bottom">
			<ul>
				<li class="optionContainer"> 
					<p class="optionTitle">模块标题：</p>
					<div class="optionChoose">
						<input id="moduleTitle" value="通栏模块" maxlength="50" onkeypress="enableSaveBtn();" onkeyup="enableSaveBtn();" onchange="enableSaveBtn();" type="text">
					</div>
				</li>
				<li class="style-optionContainer"> 
					<p class="optionTitle">模块样式：</p>
					<div class="moduleStyleChoiceContainer">
						<ul class="moduleStyleChoice-box">
							<li><a id="moduleStyleChoiceOption0" class="moduleStyleChoiceOption" href="javascript:;" onclick="changeModuleStyle(0);return false;"><div class="moduleStyleChoice fullmeasureStyle0"><div class="checkedIcon"></div></div></a></li>
							
							<li><a id="moduleStyleChoiceOption1" class="moduleStyleChoiceOption" href="javascript:;" onclick="changeModuleStyle(1);return false;"><div class="moduleStyleChoice fullmeasureStyle1"><div class="checkedIcon"></div></div></a></li>
							
							<li><a id="moduleStyleChoiceOption2" class="moduleStyleChoiceOption" href="javascript:;" onclick="changeModuleStyle(2);return false;"><div class="moduleStyleChoice fullmeasureStyle2"><div class="checkedIcon"></div></div></a></li>
							
							<li><a id="moduleStyleChoiceOption3" class="moduleStyleChoiceOption" href="javascript:;" onclick="changeModuleStyle(3);return false;"><div class="moduleStyleChoice fullmeasureStyle3"><div class="checkedIcon"></div></div></a></li>
							
							<li><a id="moduleStyleChoiceOption4" class="moduleStyleChoiceOption" href="javascript:;" onclick="changeModuleStyle(4);return false;"><div class="moduleStyleChoice fullmeasureStyle4"><div class="checkedIcon"></div></div></a></li>
							
							<li><a id="moduleStyleChoiceOption5" class="moduleStyleChoiceOption" href="javascript:;" onclick="changeModuleStyle(5);return false;"><div class="moduleStyleChoice fullmeasureStyle5"><div class="checkedIcon"></div></div></a></li>
							
							<li><a id="moduleStyleChoiceOption6" class="moduleStyleChoiceOption" href="javascript:;" onclick="changeModuleStyle(6);return false;"><div class="moduleStyleChoice fullmeasureStyle6"><div class="checkedIcon"></div></div></a></li>
							
							<li><a id="moduleStyleChoiceOption7" class="moduleStyleChoiceOption" href="javascript:;" onclick="changeModuleStyle(7);return false;"><div class="moduleStyleChoice fullmeasureStyle7"><div class="checkedIcon"></div></div></a></li>
							
							<li><a id="moduleStyleChoiceOption8" class="moduleStyleChoiceOption" href="javascript:;" onclick="changeModuleStyle(8);return false;"><div class="moduleStyleChoice fullmeasureStyle8"><div class="checkedIcon"></div></div></a></li>
							
							<li><a id="moduleStyleChoiceOption9" class="moduleStyleChoiceOption" href="javascript:;" onclick="changeModuleStyle(9);return false;"><div class="moduleStyleChoice fullmeasureStyle9"><div class="checkedIcon"></div></div></a></li>
							
							<li><a id="moduleStyleChoiceOption10" class="moduleStyleChoiceOption checkedStyle" href="javascript:;" onclick="changeModuleStyle(10);return false;"><div class="moduleStyleChoice fullmeasureStyle10"><div class="checkedIcon"></div></div></a></li>
							
							<li><a id="moduleStyleChoiceOption11" class="moduleStyleChoiceOption" href="javascript:;" onclick="changeModuleStyle(11);return false;"><div class="moduleStyleChoice fullmeasureStyle11"><div class="checkedIcon"></div></div></a></li>
							
						</ul>
					</div>
				</li>
			</ul>
		</div>
		<!--baseSetting ends -->
		<div class="ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide" id="styleSetting">
			<ul>
				<li>
					<p class="title-bar">背景</p>
					<ul class="settingContentPadding">
						<li class="optionContainer">
							<p class="optionTitle">背景：</p>
							<div class="optionChoose">
								<input checked="checked" id="sysModuleBg" name="moduleBg" value="0" onclick="changeModuleBgType(0);changeBlockStatus(false,'cusModuleBgSetting');" type="radio"><label for="sysModuleBg">默认</label>
								<input id="cusModuleBg" name="moduleBg" value="2" onclick="changeModuleBgType(2);changeBlockStatus(true,'cusModuleBgSetting');" type="radio"><label for="cusModuleBg">自定义</label>
							</div>
						</li>
						<li style="display: none;" id="cusModuleBgSetting">
							<div class="settingContentSecond">
								<div class="optionRow">
									<label class="labelForLeftTitle">颜色：</label>
									<div id="moduleBgColorPicker" class="colorPicker floatLeft"></div>
								</div>
								<div class="optionRow">
									<label class="labelForLeftTitle">图片：</label>
									<input id="moduleBgFileButton" class="floatLeft faiButton" value="添加图片" type="button">
									<div id="moduleBgFileView" class="viewBox"></div>
								</div>
								<div class="optionRow">
									<label class="labelForLeftTitle">显示方式：</label>
									<select id="moduleBgRepeat" class="optionOfSelect floatLeft" onchange="changeModuleBgRepeat();return false;">
										<option selected="selected" value="-1">不使用背景图片</option>
										<option value="0">不平铺（居中）</option>
										<option value="3">完全平铺</option>
										<option value="4">拉伸平铺</option>
										<option value="5">缩放平铺（等比例）</option>
										<option value="21">纵向平铺（左边对齐）</option>
										<option value="2">纵向平铺（中间对齐）</option>
										<option value="22">纵向平铺（右边对齐）</option>
										<option value="11">横向平铺（顶部对齐）</option>
										<option value="1">横向平铺（中部对齐）</option>
										<option value="12">横向平铺（底部对齐）</option>
										<option value="6">不平铺（左对齐）</option>
										<option value="7">不平铺（右对齐）</option>
										<option value="8">不平铺（上对齐）</option>
										<option value="9">不平铺（下对齐）</option>
										<option value="13">不平铺（左上对齐）</option>
										<option value="14">不平铺（右上对齐）</option>
										<option value="15">不平铺（左下对齐）</option>
										<option value="16">不平铺（右下对齐）</option>
									</select>
								</div>
								<div class="optionRow">
									<label class="labelForLeftTitle">透明度：</label>
									<div id="setBgOpacity" class="setSliderBar ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all"><a style="left: 0%;" class="ui-slider-handle ui-state-default ui-corner-all" href="#"></a></div>
									<div id="bgOpacityText" class="setSliderLetter"><span id="bgOpacityVal">0%</span></div>
								</div>
							</div>
						</li>


						<li class="optionContainer">
							<p class="optionTitle">中间背景：</p>
							<div class="optionChoose">
								<input checked="checked" id="sysModuleContentBg" name="moduleContentBg" value="0" onclick="changeContentBgType(0);changeBlockStatus(false,'cusModuleContentBgSetting');" type="radio"><label for="sysModuleContentBg">默认</label>
								<input id="cusModuleContentBg" name="moduleContentBg" value="2" onclick="changeContentBgType(2);changeBlockStatus(true,'cusModuleContentBgSetting');" type="radio"><label for="cusModuleContentBg">自定义</label>
							</div>
						</li>
						<li style="display: none;" id="cusModuleContentBgSetting">
							<div class="settingContentSecond">
								<div class="optionRow">
									<label class="labelForLeftTitle">颜色：</label>
									<div id="moduleContentBgColorPicker" class="colorPicker floatLeft"></div>
								</div>
								<div class="optionRow">
									<label class="labelForLeftTitle">图片：</label>
									<input id="moduleContentBgFileButton" class="floatLeft faiButton" value="添加图片" type="button">
									<div id="moduleContentBgFileView" class="viewBox"></div>
								</div>
								<div class="optionRow">
									<label class="labelForLeftTitle">显示方式：</label>
									<select id="moduleContentBgRepeat" class="optionOfSelect floatLeft" onchange="changeContentBgRepeat();return false;">
										<option selected="selected" value="-1">不使用背景图片</option>
										<option value="0">不平铺（居中）</option>
										<option value="3">完全平铺</option>
										<option value="4">拉伸平铺</option>
										<option value="5">缩放平铺（等比例）</option>
										<option value="21">纵向平铺（左边对齐）</option>
										<option value="2">纵向平铺（中间对齐）</option>
										<option value="22">纵向平铺（右边对齐）</option>
										<option value="11">横向平铺（顶部对齐）</option>
										<option value="1">横向平铺（中部对齐）</option>
										<option value="12">横向平铺（底部对齐）</option>
										<option value="6">不平铺（左对齐）</option>
										<option value="7">不平铺（右对齐）</option>
										<option value="8">不平铺（上对齐）</option>
										<option value="9">不平铺（下对齐）</option>
										<option value="13">不平铺（左上对齐）</option>
										<option value="14">不平铺（右上对齐）</option>
										<option value="15">不平铺（左下对齐）</option>
										<option value="16">不平铺（右下对齐）</option>
									</select>
								</div>
								<div class="optionRow">
									<label class="labelForLeftTitle">透明度：</label>
									<div id="setContentBgOpacity" class="setSliderBar ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all"><a style="left: 0%;" class="ui-slider-handle ui-state-default ui-corner-all" href="#"></a></div>
									<div id="contentBOpacitygText" class="setSliderLetter"><span id="contentbgOpacityVal">0%</span></div>
								</div>
							</div>
						</li>
						<li class="optionContainer">
							<p class="optionTitle">边线：</p>
							<div class="optionChoose">
								<input checked="checked" id="sysModuleBorder" name="moduleBorder" value="0" onclick="changeModuleBorderType(0);changeBlockStatus(false,'cusModuleBorderSetting');" type="radio"><label for="sysModuleBorder">默认</label>
								<input id="hideModuleBorder" name="moduleBorder" value="1" onclick="changeModuleBorderType(1);changeBlockStatus(false,'cusModuleBorderSetting');" type="radio"><label for="hideModuleBorder">隐藏</label>
								<input id="cusModuleBorder" name="moduleBorder" value="2" onclick="changeModuleBorderType(2);changeBlockStatus(true,'cusModuleBorderSetting');" type="radio"><label for="cusModuleBorder">自定义</label>
							</div>
						</li>
						<li style="display: none;" id="cusModuleBorderSetting">
							<div class="settingContentSecond">
								<div class="optionRow">
									<label class="labelForLeftTitle">颜色：</label>
									<div id="moduleBorderColorPicker" class="colorPicker floatLeft"></div>
								</div>
								<div class="optionRow">
									<label class="labelForLeftTitle">宽度：</label>
									<select id="moduleBorderWidth" class="optionOfSelect floatLeft" onchange="changeModuleBorderWidth();return false;">
										<option selected="selected" value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
										<option value="8">8</option>
										<option value="9">9</option>
										<option value="10">10</option>
									</select>
								</div>
								<div class="optionRow">
									<label class="labelForLeftTitle">样式：</label>
									<select id="moduleBorderStyle" class="optionOfSelect floatLeft" onchange="changeModuleBorderStyle();return false;">
										<option selected="selected" value="0">实线</option>
										<option value="1">点线</option>
										<option value="2">虚线</option>
									</select>
								</div>
								<div class="optionRow">
									<label class="labelForLeftTitle">位置：</label>
									<select id="moduleBorderPosition" class="optionOfSelect floatLeft" onchange="changeModuleBorderPosition();return false;">
										<option selected="selected" value="1">上边线</option>
										<option value="2">下边线</option>
										<option value="12">上下边线</option>
									</select>
								</div>
							</div>
						</li>
					</ul>
				</li>
				<li class="containerPadding">
					<p class="title-bar">内容区</p>
					<ul class="settingContentPadding">
						<li class="optionContainer">
							<p class="optionTitle">宽度：</p>
							<div class="optionChoose">
								<input checked="checked" id="sysContentWidth" name="contentWidth" value="0" onclick="changeSysContentWidth();changeBlockStatus(false,'cusContentWidthSetting');" type="radio"><label for="sysContentWidth">默认</label>
								<input id="cusContentWidth" name="contentWidth" value="1" onclick="changeCusContentWidth();changeBlockStatus(true,'cusContentWidthSetting');" type="radio"><label for="cusContentWidth">自定义</label>
							</div>
						</li>
						<li style="display: none;" id="cusContentWidthSetting" class="optionContainer">
							<div class="settingContentSecond">
								<label class="labelForLeftTitle">大小：</label>
								<div class="optionChoose">
									<div id="setFullMeasureWidth" class="setSliderBar ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all"><a style="left: 31.25%;" class="ui-slider-handle ui-state-default ui-corner-all" href="#"></a></div>
									<div id="setFullMeasureWidthContainer" class="setSliderLetter"><span id="ui-slider-value">1000px</span></div>
								</div>
							</div>
						</li>
                        <li class="optionContainer">
							<p class="optionTitle">边距：</p>
							<div class="optionChoose">
								<input checked="checked" id="sysContentPadding" name="contentPadding" value="0" onclick="changeInnerType(0);changeBlockStatus(false,'cusContentPaddingSetting');" type="radio"><label for="sysContentPadding">默认</label>
								<input id="cusContentPadding" name="contentPadding" value="1" onclick="changeInnerType(2);changeBlockStatus(true,'cusContentPaddingSetting');" type="radio"><label for="cusContentPadding">自定义</label>
							</div>
						</li>
						<li>
							<div style="display: none;" id="cusContentPaddingSetting" class="posInputContainer">
								<label>上：</label><input value="0" id="padding_top" class="posInput" maxlength="3" onkeypress="javascript:return Fai.isNumberKey(event);" onkeyup="changeInner('top');" onchange="changeInner('top');" type="text">
								<label>下：</label><input value="0" id="padding_bottom" class="posInput" maxlength="3" onkeypress="javascript:return Fai.isNumberKey(event);" onkeyup="changeInner('bottom');" onchange="changeInner('bottom');" type="text">
								<label>左：</label><input value="0" id="padding_left" class="posInput" maxlength="3" onkeypress="javascript:return Fai.isNumberKey(event);" onkeyup="changeInner('left');" onchange="changeInner('left');" type="text">
								<label>右：</label><input value="0" id="padding_right" class="posInput" maxlength="3" onkeypress="javascript:return Fai.isNumberKey(event);" onkeyup="changeInner('right');" onchange="changeInner('right');" type="text">
							</div>
						</li>
					</ul>
				</li>
			</ul>
			
		</div>
		<!-- styleSetting ends-->
	</div>
	
</div>	

</body></html>