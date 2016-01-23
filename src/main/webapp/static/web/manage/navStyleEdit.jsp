<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/taglib/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title></title>
	<%@ include file="/WEB-INF/view/taglib/header.jsp"%>
	<%
		String id = request.getParameter("id");
		String popupID = request.getParameter("popupID");
	%>
	<link href="${ctx_web}/css/manage.css" rel="stylesheet" type="text/css" />
	<link href="${ctx_web}/css/navStyleEdit.css" type="text/css" rel="stylesheet"/>
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
<script type="text/javascript">
var allowedPattern = true;
var allowedStyle = true;
var allowedOldStyle = true;
var siteTemplateFree = 0;
var g_id = 0;
var g_initing = true;
var g_navTextColor = "#000";
var g_navHoverTextColor = "#000";
var g_navBgColor = "#000";
var g_navItemBgColor = "#000";
var g_navItemHoverBgColor = "#000";
var g_navItemSpacingBgColor = "#000";
var g_navSecItemTextColor = "#000";
var g_navSecItemHoverTextColor = "#000";
var g_navSecItemBgColor = "#000";
var g_navSecItemHoverBgColor = "#000";
var g_contentBgColor = "#000";

var templateList = [{"id":0,"styleName":"默认","colorType":0,"screenType":0},{"id":43,"styleName":"N043","colorType":0,"screenType":0},{"id":44,"styleName":"N044","colorType":4,"screenType":0},{"id":45,"styleName":"N045","colorType":16,"screenType":0},{"id":46,"styleName":"N046","colorType":1,"screenType":0},{"id":47,"styleName":"N047","colorType":16,"screenType":0},{"id":48,"styleName":"N048","colorType":4,"screenType":0},{"id":49,"styleName":"N049","colorType":8,"screenType":0},{"id":50,"styleName":"N050","colorType":2,"screenType":0},{"id":51,"styleName":"N051","colorType":16,"screenType":0},{"id":52,"styleName":"N052","colorType":1,"screenType":0},{"id":53,"styleName":"N053","colorType":4,"screenType":0},{"id":54,"styleName":"N054","colorType":1,"screenType":0},{"id":55,"styleName":"N055","colorType":16,"screenType":0},{"id":56,"styleName":"N056","colorType":4,"screenType":0},{"id":57,"styleName":"N057","colorType":32,"screenType":0},{"id":58,"styleName":"N058","colorType":8,"screenType":0},{"id":59,"styleName":"N059","colorType":1,"screenType":0},{"id":60,"styleName":"N060","colorType":8,"screenType":0},{"id":61,"styleName":"N061","colorType":32,"screenType":0},{"id":62,"styleName":"N062","colorType":16,"screenType":0},{"id":63,"styleName":"N063","colorType":4,"screenType":0},{"id":64,"styleName":"N064","colorType":1,"screenType":0},{"id":65,"styleName":"N065","colorType":8,"screenType":0},{"id":66,"styleName":"N066","colorType":32,"screenType":0},{"id":67,"styleName":"N067","colorType":16,"screenType":0},{"id":68,"styleName":"N068","colorType":4,"screenType":0},{"id":1,"styleName":"N001","colorType":16,"screenType":0},{"id":2,"styleName":"N002","colorType":8,"screenType":0},{"id":3,"styleName":"N003","colorType":16,"screenType":0},{"id":4,"styleName":"N004","colorType":16,"screenType":0},{"id":5,"styleName":"N005","colorType":2,"screenType":0},{"id":6,"styleName":"N006","colorType":4,"screenType":0},{"id":7,"styleName":"N007","colorType":1,"screenType":0},{"id":8,"styleName":"N008","colorType":8,"screenType":0},{"id":9,"styleName":"N009","colorType":32,"screenType":0},{"id":10,"styleName":"N010","colorType":4,"screenType":0},{"id":11,"styleName":"N011","colorType":32,"screenType":0},{"id":12,"styleName":"N012","colorType":4,"screenType":0},{"id":13,"styleName":"N013","colorType":8,"screenType":0},{"id":14,"styleName":"N014","colorType":16,"screenType":0},{"id":15,"styleName":"N015","colorType":32,"screenType":0},{"id":16,"styleName":"N016","colorType":1,"screenType":0},{"id":17,"styleName":"N017","colorType":3,"screenType":0},{"id":18,"styleName":"N018","colorType":2,"screenType":0},{"id":19,"styleName":"N019","colorType":1,"screenType":0},{"id":20,"styleName":"N020","colorType":0,"screenType":0},{"id":21,"styleName":"N021","colorType":16,"screenType":0},{"id":22,"styleName":"N022","colorType":4,"screenType":0},{"id":23,"styleName":"N023","colorType":4,"screenType":0},{"id":24,"styleName":"N024","colorType":16,"screenType":0},{"id":25,"styleName":"N025","colorType":16,"screenType":0},{"id":26,"styleName":"N026","colorType":1,"screenType":0},{"id":27,"styleName":"N027","colorType":2,"screenType":0},{"id":28,"styleName":"N028","colorType":16,"screenType":0},{"id":29,"styleName":"N029","colorType":8,"screenType":0},{"id":30,"styleName":"N030","colorType":8,"screenType":0},{"id":31,"styleName":"N031","colorType":6,"screenType":0},{"id":32,"styleName":"N032","colorType":16,"screenType":0},{"id":33,"styleName":"N033","colorType":32,"screenType":0},{"id":34,"styleName":"N034","colorType":16,"screenType":0},{"id":35,"styleName":"N035","colorType":8,"screenType":0},{"id":36,"styleName":"N036","colorType":4,"screenType":0},{"id":37,"styleName":"N037","colorType":16,"screenType":0},{"id":38,"styleName":"N038","colorType":1,"screenType":0},{"id":39,"styleName":"N039","colorType":2,"screenType":0},{"id":40,"styleName":"N040","colorType":16,"screenType":0},{"id":41,"styleName":"N041","colorType":32,"screenType":0},{"id":42,"styleName":"N042","colorType":32,"screenType":0},{"id":69,"styleName":"N069","colorType":4,"screenType":1},{"id":70,"styleName":"N070","colorType":2,"screenType":1},{"id":71,"styleName":"N071","colorType":1,"screenType":1},{"id":72,"styleName":"N072","colorType":4,"screenType":1},{"id":73,"styleName":"N073","colorType":0,"screenType":1},{"id":74,"styleName":"N074","colorType":32,"screenType":1},{"id":75,"styleName":"N075","colorType":16,"screenType":1},{"id":76,"styleName":"N076","colorType":16,"screenType":1},{"id":77,"styleName":"N077","colorType":8,"screenType":1},{"id":78,"styleName":"N078","colorType":8,"screenType":1},{"id":79,"styleName":"N079","colorType":0,"screenType":1},{"id":80,"styleName":"N080","colorType":32,"screenType":1}];

var g_arrayPattern = [];
var g_arrayPagenation = [];
var g_selectColor = 0;
var g_selectScreen = "";

var file_size_limit = 1;

var popupID = <%=popupID%>;
$(function(){
	Fai.addPopupWindowBtn(popupID, {id:'close', text:'确 定', extClass:'saveButton', click:closeNav});
	Fai.addPopupWindowBtn(popupID, {id:'default', text:'恢复默认', click:resetDefault});
	
	//初始化数据显示
	initNavStyleData();
	
	if (!allowedStyle && (top._templateType == siteTemplateFree)) {
		$('.freeDisable').attr('disabled', true);
	} else {
		$('.freeDisable').removeAttr('disabled');
	}
	if (!allowedOldStyle && (top._templateType == siteTemplateFree)) {
		$('.freeDisableOld').attr('disabled', true);
	} else {
		$('.freeDisableOld').removeAttr('disabled');
	}
	
	//当前模板为付费模板，允许设置样式
	if(!allowedPattern){
		$('#systemTabTypeChange').before("<div class='clear itemlist viptips'>\u201C系统样式\u201D为<a title='点击查看详细功能列表' class='siteGroupBtn siteGroupStd' href='http://jz.faisco.com/proFunc.jsp' target='_blank'>&nbsp;<\/a>网站标准版功能，选择付费主题可试用。</div>");
	} else{
		$('#styleSettingFrame').css('margin-top',20+'px');
	}
	
	//加载栏目导航条背景上传对象
	//文件上传2.0 导航
	var fileUpload2_settings1 = {title:"添加图片", maxSize:parseInt(file_size_limit), type:['jpg','jpeg','gif','png'], from:"nav"};
	Site.fileUpload2("#navBgFileButton", fileUpload2_settings1, callbackNavBg);
	
	//加载栏目项背景上传
	//文件上传2.0 栏目项背景
	var fileUpload2_settings2 = {title:"添加图片", maxSize:parseInt(file_size_limit), type:['jpg','jpeg','gif','png'], from:"nav"};
	Site.fileUpload2("#navItemBgFileButton", fileUpload2_settings2, callbackNavItemBg);
	
	//文件上传2.0 栏目项选中背景
	var fileUpload2_settings3 = {title:"添加图片", maxSize:parseInt(file_size_limit), type:['jpg','jpeg','gif','png'], from:"nav"};
	Site.fileUpload2("#navItemHoverBgFileButton", fileUpload2_settings3, callbackNavItemHoverBg);
	
	//文件上传2.0 栏目项间隔背景
	var fileUpload2_settings4 = {title:"添加图片", maxSize:parseInt(file_size_limit), type:['jpg','jpeg','gif','png'], from:"nav"};
	Site.fileUpload2("#navItemSpacingBgFileButton", fileUpload2_settings4, callbackNavItemSpacingBg);
	
	//文件上传2.0 二级菜单背景
	var fileUpload2_settings5 = {title:"添加图片", maxSize:parseInt(file_size_limit), type:['jpg','jpeg','gif','png'], from:"nav"};
	Site.fileUpload2("#navSecItemBgFileButton", fileUpload2_settings5, callbackNavSecItemBg);
	
	//文件上传2.0 二级菜单选中背景
	var fileUpload2_settings6 = {title:"添加图片", maxSize:parseInt(file_size_limit), type:['jpg','jpeg','gif','png'], from:"nav"};
	Site.fileUpload2("#navSecItemHoverBgFileButton", fileUpload2_settings6, callbackNavSecItemHoverBg);
	
	//文件上传2.0 内容区背景
	var fileUpload2_settings7 = {title:"添加图片", maxSize:parseInt(file_size_limit), type:['jpg','jpeg','gif','png'], from:"nav"};
	Site.fileUpload2("#contentBgFileButton", fileUpload2_settings7, callbackContentBg);
	
	$('#tabs').tabs({selected:0}).bind('tabsshow',function(event, ui){
		var _sid = parseInt($(ui.tab).attr("_sid"));
		if(_sid !== NaN){
			switch (_sid) {
				case 0 : Site.logDog(100069, 0); break;
				case 1 : Site.logDog(100069, 1); break;
				case 2 : Site.logDog(100069, 2); break;
				case 3 : Site.logDog(100069, 3); break;
				case 4 : Site.logDog(100069, 4); break;
				default : break;
			}
		}
	});
	Site.logDog(100069, 5);
	
	//放到初始化最后才调checkBroadAction。放在initNavStyle最后会有两个input disabled不了
	var isBroad = false;
	$.each(templateList,function(i,t){
		if( t.id === top._navStyleData.s && t.screenType === 1 ){
			isBroad = true;
			return false;
		}
	});
	checkBroadAction( isBroad );
	g_initing = false;
});

function closeNav(){
	Fai.closePopupWindow(popupID);
	Site.showNavItemContainer();
}

//文件上传2.0返回事件 1
function callbackNavBg(back){
	if(back){
		var resultBack = $.parseJSON(back);
		var fileData = resultBack.data[0]||{};
		var navBg = top._navStyleData.nb;
		navBg.f = fileData.fileId;
		navBg.p = fileData.filePath;
		if( fileData.isMatBg ){
			//自动选上完全平铺
			navBg.r = 3;
			$("#navBgRepeat option[value=3]").attr("selected",true);
		}
		refreshNavBg();
		onStyleChange();
		$("#uploadmsg1").html('<a href="javascript:view(\'' + fileData.fileId + '\');">查看</a>');
	}
}

function callbackContentBg(back){
	if(back){
		var resultBack = $.parseJSON(back);
		var fileData = resultBack.data[0]||{};
		var contentBg = top._navStyleData.cb;
		contentBg.f = fileData.fileId;
		contentBg.p = fileData.filePath;
		if( fileData.isMatBg ){
			//自动选上完全平铺
			contentBg.r = 3;
			$("#contentBgRepeat option[value=3]").attr("selected",true);
		}
		refreshContentBg();
		onStyleChange();
		$("#contentuploadmsg1").html('<a href="javascript:view(\'' + fileData.fileId + '\');">查看</a>');
	}
}

//文件上传2.0返回事件 2
function callbackNavItemBg(back){
	if(back){
		var resultBack = $.parseJSON(back);
		var fileData = resultBack.data[0]||{};
		var navItemBg = top._navStyleData.nib;
		navItemBg.f = fileData.fileId;
		navItemBg.p = fileData.filePath;
		if( fileData.isMatBg ){
			//自动选上完全平铺
			navItemBg.r = 3;
			$("#navItemBgRepeat option[value=3]").attr("selected",true);
		}
		refreshNavItemBg();
		onStyleChange();
		$("#uploadmsg2").html('<a href="javascript:view(\'' + fileData.fileId + '\');">查看</a>');
	}
}

//文件上传2.0返回事件 3
function callbackNavItemHoverBg(back){
	if(back){
		var resultBack = $.parseJSON(back);
		var fileData = resultBack.data[0]||{};
		var navItemHoverBg = top._navStyleData.nihb;
		navItemHoverBg.f = fileData.fileId;
		navItemHoverBg.p = fileData.filePath;
		if( fileData.isMatBg ){
			//自动选上完全平铺
			navItemHoverBg.r = 3;
			$("#navItemHoverBgRepeat option[value=3]").attr("selected",true);
		}
		refreshNavItemHoverBg();
		onStyleChange();
		$("#uploadmsg3").html('<a href="javascript:view(\'' + fileData.fileId + '\');">查看</a>');
	}
}


//文件上传2.0返回事件 4
function callbackNavItemSpacingBg(back){
	if(back){
		var resultBack = $.parseJSON(back);
		var fileData = resultBack.data[0];
		var navItemSpBg = top._navStyleData.nisb;
		navItemSpBg.f = fileData.fileId;
		navItemSpBg.p = fileData.filePath;
		if( fileData.isMatBg ){
			//自动选上完全平铺
			navItemSpBg.r = 3;
			$("#navItemSpacingBgRepeat option[value=3]").attr("selected",true);
		}
		refreshNavItemSpacingBg();
		onStyleChange();
		$("#uploadmsg4").html('<a href="javascript:view(\'' + fileData.fileId + '\');">查看</a>');
	}
}

//文件上传2.0返回事件 5
function callbackNavSecItemBg(back){
	if(back){
		var resultBack = $.parseJSON(back);
		var fileData = resultBack.data[0];
		var navSecItemBg = top._navStyleData.nsib;
		navSecItemBg.f = fileData.fileId;
		navSecItemBg.p = fileData.filePath;
		if( fileData.isMatBg ){
			//自动选上完全平铺
			navSecItemBg.r = 3;
			$("#navSecItemBgRepeat option[value=3]").attr("selected",true);
		}
		refreshNavSecItemBg();
		onStyleChange();
		$("#uploadmsg5").html('<a href="javascript:view(\'' + fileData.fileId + '\');">查看</a>');
	}
}

//文件上传2.0返回事件 6
function callbackNavSecItemHoverBg(back){
	if(back){
		var resultBack = $.parseJSON(back);
		var fileData = resultBack.data[0];
		var navSecItemHovBg = top._navStyleData.nsihb;
		navSecItemHovBg.f = fileData.fileId;
		navSecItemHovBg.p = fileData.filePath;
		if( fileData.isMatBg ){
			//自动选上完全平铺
			navSecItemHovBg.r = 3;
			$("#navSecItemHoverBgRepeat option[value=3]").attr("selected",true);
		}
		refreshNavSecItemHoverBg();
		onStyleChange();
		$("#uploadmsg6").html('<a href="javascript:view(\'' + fileData.fileId + '\');">查看</a>');
	}
}


function initNavStyleData(){
	// 导航宽高
	initNavSize();
	// 导航普通文字
	initNavGeneralText();
	// 导航高亮文字
	initNavHoverText();
	// 导航内容内部位置
	initNavCntPosition();
	// 导航条背景
	initNavBg();
	
	// 内容宽高
	initContentSize();
	// 内容位置
	initContentCntPosition();
	// 内容背景
	initContentBg();
	
	// 栏目项宽高
	initNavItemSize();
	// 栏目项背景
	initNavItemBg();
	// 栏目项选中高亮背景
	initNavItemHoverBg();
	// 栏目间隔
	initNavItemSpacingSize();
	// 栏目间隔背景
	initNavItemSpacingBg();
	
	// 二级菜单普通文字
	initNavSecItemGeneralText();
	// 二级菜单高亮文字
	initNavSecItemHoverText();
	// 二级菜单宽度
	initNavSecItemSize();
	// 二级菜单背景
	initNavSecItemBg();
	// 二级菜单高亮背景
	initNavSecItemHoverBg();
	// 二级菜单-有二级菜单的一级栏目不可点击
	initNavFirstItemNoClick();
	//二三级菜单透明度
	initNavSecItemOpacity();
	//导航栏固定在顶部
	initNavPositionFixTop();
	
	// 导航栏系统样式
	initNavSystem();
}

function initNavSize() {
	// 栏目导航宽
	if(top._navStyleData.ns.w == "" || top._navStyleData.ns.w == -1){
		$("#navWidthDefault").attr("checked", "checked");
		$("#navWidthInput").hide();
	}else{
		$("#navWidthFix").attr("checked", "checked");
		$("#navWidthInput").show();
		if(top._navStyleData.ns.w == -1){
			top._navStyleData.ns.w = top.$("#nav .navContent").width();
		}
		$("#navWidthInput").val(top._navStyleData.ns.w);
	}
	
	// 栏目导航高
	if(top._navStyleData.ns.h == "" || top._navStyleData.ns.h == -1){
		$("#navHeightDefault")[0].click();
	}else{
		$("#navHeightFix")[0].click();
	}
}

function initContentSize() {
	// 栏目内容宽
	if(top._navStyleData.cs.w == "" || top._navStyleData.cs.w == -1){
		$("#contentWidthDefault")[0].click();
	}else{
		$("#contentWidthFix")[0].click();
	}
	
	// 栏目内容高
	if(top._navStyleData.cs.h == "" || top._navStyleData.cs.h == -1){
		$("#contentHeightDefault")[0].click();
	}else{
		$("#contentHeightFix")[0].click();
	}
}

function initNavItemSize() {
	// 栏目导航宽
	if(top._navStyleData.nis.w == "" || top._navStyleData.nis.w == -1){
		$("#navItemWidthDefault")[0].click();
	}else{
		$("#navItemWidthFix")[0].click();
	}
	// 栏目导航高
	if(top._navStyleData.nis.h == "" || top._navStyleData.nis.h == -1){
		$("#navItemHeightDefault")[0].click();
	}else{
		$("#navItemHeightFix")[0].click();
	}
}

function changeNavCntPositionDefault(){
	if(parseInt(Fai.top._templateLayout) !== 4){
		if(top._navStyleData.ns.w === -1){
			top.Site.initTemplateLayout(Fai.top._templateLayout);	
			top._navStyleData.nmove = 0;
		}else{
			Fai.top.Fai.removeCtrlStyleCssList('stylenav', 'nav', [
				{cls:'', key:'left'},
				{cls:'', key:'top'}
			]);
			Fai.top.Fai.removeCtrlStyleCssList('stylenav', '', [
				{cls:'.webNav .nav', key:'left'},
				{cls:'.webNav .nav', key:'top'}
			]);
			var nav = Fai.top.$("#nav");
			nav.css("top","")
					 .css("left","");

			top.Site.initTemplateLayout(Fai.top._templateLayout);
			top.Site.navAppendToWebNav(nav);
		}
	}
}

function changeNavCntPositionComm(){
	if(parseInt(Fai.top._templateLayout) !== 4){
		if(parseInt(Fai.top._wideNav) === 1 && top._navStyleData.ns.w !== -1){
			Fai.top.$("#webNav").addClass("webNavDefault");
		}
		top.Site.WebNavAppendToNav();
	}
}
function changeNavCntPosition(type) {
	if (type == 0) {
		changeNavCntPositionDefault();
		$("#navCntPositionDefault").attr("checked", true);
		$("#navCntPositionPanel").hide();
	} else {
		changeNavCntPositionComm();
		$("#navCntPositionFix").attr("checked", true);
		$("#navCntPositionPanel").show();
		
		var tmpTop = top.$("#nav").position().top;
		var tmpLeft = top.$("#nav").position().left;
		
		if(typeof top._navStyleData.ncp.t != 'undefined' && top._navStyleData.ncp.t != -1){
			$("#navCntPositionTopInput").val(top._navStyleData.ncp.t);
		}else{
			$("#navCntPositionTopInput").val(tmpTop);
		}
		
		if(typeof top._navStyleData.ncp.l != 'undefined' && top._navStyleData.ncp.l != -1){
			$("#navCntPositionLeftInput").val(top._navStyleData.ncp.l);
		}else{
			$("#navCntPositionLeftInput").val(tmpLeft);
		}
		//多次点击会造成多次访问此函数，导致引入Fai.setCtrlStyleCssList函数正则匹配错误
		if(top._navStyleData.ncp.type){
			return;
		}
		
	}
	if (g_initing) {
		return;
	}
	
	if (type == 0) {
		var nav = Fai.top.$("#nav");
		onStyleChange();
		top._navStyleData.ncp.type = false;
		//恢复原来内容位置
		top._navStyleData.ncp.y = 0;
		Site.autoNavCntPosition();
		
		Site.refreshNavContainer();

		nav.css({"top": "", "left": "", "position": "", "Width": ""});
		Fai.top._navStyleData.ncp.l = parseInt(nav.css("left").replace("px", ""));
		Fai.top._navStyleData.ncp.t = parseInt(nav.css("top").replace("px", ""));
		if($('#keepNavFixTop').prop('checked')){
			Site.onNavCntPositionFixTop();
		}
		onStyleChange();
	} else {
		top._navStyleData.ncp.y = 1;
		top._navStyleData.ncp.type = true;
		onNavCntPositionChange();
	}
}

function changeWidthDefault( isBroad ){
	//只有通栏情况下才将nav移动到webNav下面
	if(parseInt(Fai.top._wideNav) === 1){
		if(top._navStyleData.ncp.y === 0){
			//通栏的情况下 isBroad 的值就是navMove的值 
			top.Site.initTemplateLayout(Fai.top._templateLayout, isBroad);	
			top._navStyleData.nmove = 0;
		}else{
			//通栏的情况下 isBroad 的值就是navMove的值 
			top.Site.initTemplateLayout(Fai.top._templateLayout, isBroad);	
			top.Site.WebNavAppendToNav();
		}
		if(parseInt(top._wideNav) === 1 &&
			top.$("#webNav").hasClass("webNavDefault")){
				top.$("#webNav").removeClass("webNavDefault");
		}
	}
}

function changeWidthComm( isBroad ){
	//在通栏或者拖拽导航模块浮动的情况下才将nav移动到webNav下面
	if(parseInt(Fai.top._wideNav) === 1 || isBroad ){
		top.Site.navWidthAndPositionChange();
		top.Site.absoluteNavDraggableAndResize();
	}
	
}

function changeNavWidth(type, isBroad) {
	if (type == 0) {
		changeWidthDefault( isBroad );
		$("#navWidthDefault").attr("checked", true);
		$("#navWidthInput").hide();
		top._navStyleData.ns.w = -1;
	} else {

		$("#navWidthFix").attr("checked", true);
		$("#navWidthInput").show();
		if(top._navStyleData.ns.w == -1){
			top._navStyleData.ns.w = top.$("#nav .navContent").width();
		}
		$("#navWidthInput").val(top._navStyleData.ns.w);
		
		changeWidthComm();
	}
	if (g_initing) {
		return;
	}
	
	if (type == 0) {
		//恢复原来宽度
		Site.autoNavWidth();
		Site.refreshNavContainer();
		
		onStyleChange();
	} else {
		onNavWidthChange();
		
	}
	
}

function changeContentWidth(type) {
	if (type == 0) {
		$("#contentWidthDefault").attr("checked", true);
		$("#contentWidthInput").hide();
		top._navStyleData.cs.w = -1;
	} else {
		$("#contentWidthFix").attr("checked", true);
		$("#contentWidthInput").show();
		if(top._navStyleData.cs.w == -1){
			top._navStyleData.cs.w = top.$("#nav .navContent").width();
		}
		$("#contentWidthInput").val(top._navStyleData.cs.w);
	}
	if (g_initing) {
		return;
	}
	
	if (type == 0) {
		//恢复原来宽度
		Site.autoContentWidth();
		
		Site.refreshNavContainer();
		
		onStyleChange();
	} else {
		onContentWidthChange();
	}
}

function changeNavHeight(type) {
	if (type == 0) {
		$("#navHeightDefault").attr("checked", true);
		$("#navHeightInput").hide();
		top._navStyleData.ns.h = -1;
	} else {
		$("#navHeightFix").attr("checked", true);
		$("#navHeightInput").show();
		if(top._navStyleData.ns.h == -1){
			top._navStyleData.ns.h = top.$("#nav").height();
		}
		
		$("#navHeightInput").val(top._navStyleData.ns.h);
	}
	
	top._navHeightChange = true;
	
	if (g_initing) {
		return;
	}
	
	if (type == 0) {
		//恢复原来高度
		Site.autoNavHeight();
		Site.autoNavBgSize();
		changeContentHeight(0);
		
		Site.refreshNavContainer();
		
		onStyleChange();
	} else {
		onNavHeightChange();
	}
}

function changeContentHeight(type) {
	if (type == 0) {
		$("#contentHeightDefault").attr("checked", true);
		$("#contentHeightInput").hide();
		top._navStyleData.cs.h = -1;
	} else {
		$("#contentHeightFix").attr("checked", true);
		$("#contentHeightInput").show();
		if(top._navStyleData.cs.h == -1){
			top._navStyleData.cs.h = top.$("#nav .navContent").height();
		}
		
		$("#contentHeightInput").val(top._navStyleData.cs.h);
	}
	top._navHeightChange = true;
	
	if (g_initing) {
		return;
	}
	
	if (type == 0) {
		//恢复原来高度
		Site.autoContentHeight();
		changeNavItemHeight(0);
		Site.autoNavContentBgSize();
		Site.refreshNavContainer();

		
		onStyleChange();
	} else {
		onContentHeightChange();
	}
}
function initNavCntPosition(){
	//是否固定顶部
	if(top._navStyleData.ncp.f){
		top.$("#keepNavFixTop").attr("checked", true);
	}
	// 栏目导航内容区位置
	if (top._navStyleData.ncp.y == 0) {
		$("#navCntPositionDefault").attr("checked", true);
		$("#navCntPositionPanel").hide();
	} else {
		$("#navCntPositionFix").attr("checked", true);
		$("#navCntPositionPanel").show();
		
		var tmpTop = top.$("#nav").position().top;
		var tmpLeft = top.$("#nav").position().left;
		
		if(typeof top._navStyleData.ncp.t != 'undefined' && top._navStyleData.ncp.t != -1){
			$("#navCntPositionTopInput").val(top._navStyleData.ncp.t);
		}else{
			$("#navCntPositionTopInput").val(tmpTop);
		}
		
		if(typeof top._navStyleData.ncp.l != 'undefined' && top._navStyleData.ncp.l != -1){
			$("#navCntPositionLeftInput").val(top._navStyleData.ncp.l);
		}else{
			$("#navCntPositionLeftInput").val(tmpLeft);
		}
		top._navStyleData.ncp.type = true;
	}
	
}

function initContentCntPosition(){
	// 栏目导航内容区位置
	if (top._navStyleData.cp.y == 0) {
		$("#contentCntPositionDefault").click();
	} else {
		$("#contentCntPositionFix").click();
		top._navStyleData.cp.type = true;
	}
	
}



function changeContentCntPosition(type) {
	if (type == 0) {
		$("#contentCntPositionDefault").attr("checked", true);
		$("#contentCntPositionPanel").hide();
	} else {
		
		$("#contentCntPositionFix").attr("checked", true);
		$("#contentCntPositionPanel").show();
		
		var tmpTop = 0;
		var tmpLeft = 0;
		
		if(top._navStyleData.cp.t && top._navStyleData.cp.t != -1){
			$("#contentCntPositionTopInput").val(top._navStyleData.cp.t);
		}else{
			$("#contentCntPositionTopInput").val(tmpTop);
		}
		
		if(top._navStyleData.cp.l && top._navStyleData.cp.l != -1){
			$("#contentCntPositionLeftInput").val(top._navStyleData.cp.l);
		}else{
			$("#contentCntPositionLeftInput").val(tmpLeft);
		}
		//多次点击会造成多次访问此函数，导致引入Fai.setCtrlStyleCssList函数正则匹配错误
		if(top._navStyleData.cp.type){
			return;
		}
		
	}
	if (g_initing) {
		return;
	}
	
	if (type == 0) {
		onStyleChange();
		top._navStyleData.cp.type = false;
		//恢复原来内容位置
		top._navStyleData.cp.y = 0;
		Site.autoContentCntPosition();
		
		Site.refreshNavContainer();

		onStyleChange();
	} else {
		top._navStyleData.cp.y = 1;
		top._navStyleData.cp.type = true;
		onContentCntPositionChange();
	}
}

function onNavCntPositionChange() {
	var navCntPositionLeft = $("#navCntPositionLeftInput").val();
	
	if (navCntPositionLeft == '') {
		return;
	}
	
	navCntPositionLeft = parseInt(navCntPositionLeft);
	
	if (navCntPositionLeft < -999 || navCntPositionLeft > 999) {
		Fai.ing("请输入大于-1000小于1000的数值", true);
		return;
	}

	var navCntPositionTop = $("#navCntPositionTopInput").val();
	if (navCntPositionTop == '') {
		return;
	}
	navCntPositionTop = parseInt(navCntPositionTop);
	if (navCntPositionTop < -999 || navCntPositionTop > 999) {
		Fai.ing("请输入大于-1000小于1000的数值", true);
		return;
	}
	top._navStyleData.ncp.l = navCntPositionLeft;
	top._navStyleData.ncp.t = navCntPositionTop;
	
	Site.setNavCntPosition(top._navStyleData.ncp);
	
	if($('#keepNavFixTop').prop('checked')){
		Site.onNavCntPositionFixTop();
	}
	
	onStyleChange();
}

function onContentCntPositionChange() {
	var contentCntPositionLeft = $("#contentCntPositionLeftInput").val();
	
	if (contentCntPositionLeft == '') {
		return;
	}
	
	contentCntPositionLeft = parseInt(contentCntPositionLeft);
	
	if (contentCntPositionLeft < -999 || contentCntPositionLeft > 999) {
		Fai.ing("请输入大于-1000小于1000的数值", true);
		return;
	}
	

	var contentCntPositionTop = $("#contentCntPositionTopInput").val();
	if (contentCntPositionTop == '') {
		return;
	}
	contentCntPositionTop = parseInt(contentCntPositionTop);
	if (contentCntPositionTop < -999 || contentCntPositionTop > 999) {
		Fai.ing("请输入大于-1000小于1000的数值", true);
		return;
	}
	
	top._navStyleData.cp.l = contentCntPositionLeft;
	top._navStyleData.cp.t = contentCntPositionTop;
	
	Site.setContentCntPosition(top._navStyleData.cp);
	onStyleChange();
}

function changeNavItemWidth(type) {
	if (type == 0) {
		$("#navItemWidthDefault").attr("checked", true);
		$("#navItemWidthInput").hide();
		top._navStyleData.nis.w = -1;
	} else {
		$("#navItemWidthFix").attr("checked", true);
		$("#navItemWidthInput").show();
		if(top._navStyleData.nis.w == -1){
			var firstNavItem = top.$("#nav .item");
			if(firstNavItem.length > 0){
				top._navStyleData.nis.w = firstNavItem.first().width();
			}else{
				top._navStyleData.nis.w = 80;
			}

		}
		$("#navItemWidthInput").val(top._navStyleData.nis.w);
	}
	if (g_initing) {
		return;
	}
	
	if (type == 0) {
		//恢复原来宽度
		Site.autoNavItemWidth();
		
		Site.refreshNavContainer();
		
		onStyleChange();
	} else {
		onNavItemWidthChange();
	}
}

function changeNavItemHeight(type) {
	if (type == 0) {
		$("#navItemHeightDefault").attr("checked", true);
		$("#navItemHeightInput").hide();
		top._navStyleData.nis.h = -1;
	} else {
		$("#navItemHeightFix").attr("checked", true);
		$("#navItemHeightInput").show();
		if(top._navStyleData.nis.h == -1){
			var firstNavItem = top.$("#nav .item");
			if(firstNavItem.length > 0){
				top._navStyleData.nis.h = firstNavItem.first().height();
			}else{
				top._navStyleData.nis.h = 25;
			}

		}
		$("#navItemHeightInput").val(top._navStyleData.nis.h);
	}
	top._navHeightChange = true;
	if (g_initing) {
		return;
	}
	
	if (type == 0) {
		//恢复原来宽度
		Site.autoNavItemHeight();
		Site.autoNavItemBgSize();
		Site.autoNavItemCenterBgSize();
		Site.refreshNavContainer();
		if(top._navStyleData.niss.h != 0){
			top._navStyleData.niss.h = -1;
			Site.autoNavItemSpacingHeight();
		}
		
		onStyleChange();
	} else {
		onNavItemHeightChange();
	}
}

function onNavWidthChange() {
	var width = $("#navWidthInput").val();
	if (width == '') {
		Fai.ing("导航宽度不能为空", true);
		return;
	}
	if (width <= 0 || width >= 1500) {
		Fai.ing("请输入大于0小于1500的数值宽度", true);
		return;
	}
	if(!isNaN(parseInt(width))){
		top._navStyleData.ns.w = parseInt(width);
	
		Site.setNavWidth(parseInt(width));
		
		Site.refreshNavContainer();
	}
	onStyleChange();
}

function onNavHeightChange() {
	var height = $("#navHeightInput").val();
	if (height == '') {
		Fai.ing("导航高度不能为空", true);
		return;
	}
	if (height <= 0 || height >= 1000) {
		Fai.ing("请输入大于0小于1000的数值高度", true);
		return;
	}
	top._navHeightChange = true;
	
	var heightNum = parseInt(height);
	if(!isNaN(heightNum)){
		top._navStyleData.ns.h = heightNum;
		Site.setNavHeight(heightNum);
		
		changeContentHeight(1)
		top._navStyleData.cs.h = heightNum;	
		Site.setContentHeight(heightNum);
		
		changeNavItemHeight(1);	
		top._navStyleData.nis.h = heightNum;
		top._navStyleData.niss.h = heightNum;
		Site.setNavItemHeight(heightNum);
		Site.setNavItemSpacingHeight(heightNum);
		changeNavItemSpacingWidth(2);
		
		Site.refreshNavContainer();
	}
	onStyleChange();
}

function onContentWidthChange() {
	var width = $("#contentWidthInput").val();
	if (width == '') {
		Fai.ing("内容区宽度不能为空", true);
		return;
	}
	if (width <= 0 || width >= 1500) {
		Fai.ing("请输入大于0小于1500的数值宽度", true);
		return;
	}
	if(!isNaN(parseInt(width))){
		top._navStyleData.cs.w = parseInt(width);
	
		Site.setContentWidth(parseInt(width));
		
		Site.refreshNavContainer();
	}
	onStyleChange();
}

function onContentHeightChange() {
	var height = $("#contentHeightInput").val();
	if (height == '') {
		Fai.ing("内容区高度不能为空", true);
		return;
	}
	if (height <= 0 || height >= 1000) {
		Fai.ing("请输入大于0小于1000的数值高度", true);
		return;
	}
	top._navHeightChange = true;
	
	var heightNum = parseInt(height);
	if(!isNaN(heightNum)){
		top._navStyleData.cs.h = heightNum;
		Site.setContentHeight(heightNum);

		changeNavItemHeight(1);
		top._navStyleData.nis.h = heightNum;
		top._navStyleData.niss.h = heightNum;
		Site.setNavItemHeight(heightNum);
		Site.setNavItemSpacingHeight(heightNum);
		changeNavItemSpacingWidth(2);
		
		Site.refreshNavContainer();
	}
	onStyleChange();
}

function onNavItemWidthChange() {
	var width = $("#navItemWidthInput").val();
	if (width == '') {
		Fai.ing("栏目项宽度不能为空", true);
		return;
	}
	if (width <= 0 || width >= 1000) {
		Fai.ing("请输入大于0小于1000的数值宽度", true);
		return;
	}
	if(!isNaN(parseInt(width))){
		top._navStyleData.nis.w = parseInt(width);
	
		Site.setNavItemWidth(parseInt(width));
		
		Site.refreshNavContainer();
		
		onStyleChange();
	}
}

function onNavItemHeightChange() {
	var height = $("#navItemHeightInput").val();
	if (height == '') {
		Fai.ing("栏目项高度不能为空", true);
		return;
	}
	if (height <= 0 || height >= 1000) {
		Fai.ing("请输入大于0小于1000的数值高度", true);
		return;
	}
	top._navHeightChange = true;
	
	var heightNum = parseInt(height);
	if(!isNaN(heightNum)){
		top._navStyleData.nis.h = heightNum;
		top._navStyleData.niss.h = heightNum;
		Site.setNavItemHeight(heightNum);
		Site.setNavItemSpacingHeight(heightNum);
		changeNavItemSpacingWidth(2);
		Site.refreshNavContainer();

		onStyleChange();
	}
}

function initNavGeneralText(){

	if (top._navStyleData.gt.y == 1) {
		$("#navText1").click();
	} else {
		$("#navText0").click();
	}
	if (Fai.isNull(top._navStyleData.gt.s)) {
		top._navStyleData.gt.s = 12;
	}
	$("#navTextSize").val(top._navStyleData.gt.s);
	if (Fai.isNull(top._navStyleData.gt.f)) {
		top._navStyleData.gt.f = "宋体";
	}
	$("#navTextFamily").val(top._navStyleData.gt.f);
	var ntf_select = $("#navTextFamily"); // cache
	if( ntf_select.val() == null && ntf_select.children('option').length > 0 ){
		ntf_select[0].selectedIndex = 0;
	}
	if (Fai.isNull(top._navStyleData.gt.w)) {
		top._navStyleData.gt.w = 0;
	}
	if (top._navStyleData.gt.w == 1) {
		$("#navTextBold").attr("checked", true);
	}
	if (Fai.isNull(top._navStyleData.gt.c)) {
		top._navStyleData.gt.c = "#000";
	}
	g_navTextColor = top._navStyleData.gt.c;
	//$.showcolor('navTextColorPicker', onNavTextColorChange, -138, 28, g_navTextColor);
    $("#navTextColorPicker").faiColorPicker({
        onchange:onNavTextColorChange,
        defaultcolor:g_navTextColor,
        showInTop:true
    });
}

function initNavHoverText(){
	if (Fai.isNull(top._navStyleData.ht.c)) {
		top._navStyleData.ht.c = "#000";
	}
	g_navHoverTextColor = top._navStyleData.ht.c;
	//$.showcolor('navHoverTextColorPicker', onNavHoverTextColorChange, -138, 28, g_navHoverTextColor);
    $("#navHoverTextColorPicker").faiColorPicker({
        onchange:onNavHoverTextColorChange,
        defaultcolor:g_navHoverTextColor,
        showInTop:true
    })
}


function onNavTextColorChange(color) {
	
	g_navTextColor = color;
	refreshNavText();
	onStyleChange();
}

function onNavHoverTextColorChange(color) {
	
	g_navHoverTextColor = color;
	refreshNavHoverText();
	onStyleChange();
}

function changeNavTextType(type) {
	if (type == 1) {
		$(".navTextCus").show();
		$(".navHoverTextCus").show();
	} else {
		$(".navTextCus").hide();
		$(".navHoverTextCus").hide();
	}
	if (g_initing) {
		return;
	}
	
	top._navStyleData.gt.y = parseInt(type);
	top._navStyleData.ht.y = parseInt(type);

	if (type == 1) {
		refreshNavText();
		refreshNavHoverText();
	} else {
		Site.autoNavGeneralText();
		Site.autoNavHoverText();
	}


	onStyleChange();
}


function changeNavHoverTextType(type) {
	if (type == 1) {
		$(".navHoverTextCus").show();
	} else {
		$(".navHoverTextCus").hide();
	}
	if (g_initing) {
		return;
	}
	
	top._navStyleData.ht.y = parseInt(type);

	if (type == 1) {
		refreshNavHoverText();
	} else {
		Site.autoNavHoverText();
	}


	onStyleChange();
}


function refreshNavText() {
	var weight = 'normal';
	if ($('#navTextBold').attr('checked')) {
		top._navStyleData.gt.w = 1;
		top._navStyleData.ht.w = 1;
		weight = "bolder";
	} else {
		top._navStyleData.gt.w = 0;
		top._navStyleData.ht.w = 0;
	}
	top._navStyleData.gt.s = parseInt($('#navTextSize').val());
	top._navStyleData.gt.f = $('#navTextFamily').val();
	top._navStyleData.gt.c = g_navTextColor;

	Site.setNavGeneralText([
		{cls:'a', key:'display', value:'block'},
		{cls:'a', key:'font-size', value:top._navStyleData.gt.s + "px"},
		{cls:'a', key:'font-family', value:top._navStyleData.gt.f},
		{cls:'a', key:'font-weight', value:weight},
		{cls:'a', key:'color', value:g_navTextColor},
		{cls:'a', key:'text-decoration', value:'none'},
		{cls:'a', key:'text-shadow', value:'none'},
		{cls:'a', key:'-webkit-text-shadow', value:'none'},
		{cls:'a', key:'-o-text-shadow', value:'none'},
		{cls:'a', key:'-ms-text-shadow', value:'none'},
		{cls:'a', key:'-moz-text-shadow', value:'none'}
	]);
}


function refreshNavHoverText() {
	top._navStyleData.ht.c = g_navHoverTextColor;

	Site.setNavGeneralText([
		{cls:'.itemHover a', key:'color', value:g_navHoverTextColor}
	]);
	
	Site.setNavGeneralText([
		{cls:'.itemSelected a', key:'color', value:g_navHoverTextColor}
	]);
}


function navTextSizeChange(e) {
	refreshNavText();
	onStyleChange();
}

function navTextBoldCheck(e){
	refreshNavText();
	onStyleChange();
}

function navTextFamilyChange(e){
	refreshNavText();
	onStyleChange();
	
	//2015-11-01 统计site字体使用频率 
	Site && Site.logFontFamilyUse && Site.logFontFamilyUse($('#navTextFamily').val());
}

function navHoverTextSizeChange(e) {
	refreshNavHoverText();
	onStyleChange();
}

function navHoverTextBoldCheck(e){
	refreshNavHoverText();
	onStyleChange();
}

function navHoverTextFamilyChange(e){
	refreshNavHoverText();
	onStyleChange();
}



function initNavBg() {
	if (top._navStyleData.nb.y == 1) {
		$('#navBg1').click();
	} else if (top._navStyleData.nb.y == 2) {
		$('#navBg2').click();
	} else {
		$('#navBg0').click();
	}
	if (Fai.isNull(top._navStyleData.nb.r)) {
		top._navStyleData.nb.r = 0;
	}
	$('#navBgRepeat').val(top._navStyleData.nb.r);
	if (Fai.isNull(top._navStyleData.nb.c)) {
		top._navStyleData.nb.c = "#000";
	}
	g_navBgColor = top._navStyleData.nb.c;
	//$.showcolor('navBgColorPicker', onNavBgColorChange, -138, 28, g_navBgColor, true);
    $('#navBgColorPicker').faiColorPicker({
       onchange:onNavBgColorChange,
       defaultcolor:g_navBgColor,
       showInTop:true
    });
	
	if(top._navStyleData.nb.f){
		$("#uploadmsg1").html('<a href="javascript:view(\'' + top._navStyleData.nb.f + '\');">查看</a>');
	}
}

function initContentBg() {
	if (top._navStyleData.cb.y == 1) {
		$('#contentBg1').click();
	} else if (top._navStyleData.cb.y == 2) {
		$('#contentBg2').click();
	} else {
		$('#contentBg0').click();
	}
	if (Fai.isNull(top._navStyleData.cb.r)) {
		top._navStyleData.cb.r = 0;
	}
	$('#contentBgRepeat').val(top._navStyleData.cb.r);
	if (Fai.isNull(top._navStyleData.cb.c)) {
		top._navStyleData.cb.c = "#000";
	}
	g_contentBgColor = top._navStyleData.cb.c;
	//$.showcolor('contentBgColorPicker', onContentBgColorChange, -138, 28, g_contentBgColor, true);
    //onchange 传递颜色修改触发的事件
    //defalutcolor 用来初始化 contentBgColorPicker 背景(默认background-color)颜色
    //showInTop  因为JSP是在iframe中加载的, 所以这个选项必须要写 true. 否则dom结构会生成的iframe内层
    $('#contentBgColorPicker').faiColorPicker({
        onchange:onContentBgColorChange,
        defaultcolor:g_contentBgColor,
        showInTop:true
    });
	
	if(top._navStyleData.cb.f){
		$("#contentuploadmsg1").html('<a href="javascript:view(\'' + top._navStyleData.cb.f + '\');">查看</a>');
	}
}

function initNavItemBg() {
	if (top._navStyleData.nib.y == 1) {
		$('#navItemBg1').click();
	} else if (top._navStyleData.nib.y == 2) {
		$('#navItemBg2').click();
	} else {
		$('#navItemBg0').click();
	}
	if (Fai.isNull(top._navStyleData.nib.r)) {
		top._navStyleData.nib.r = 0;
	}
	$('#navItemBgRepeat').val(top._navStyleData.nib.r);
	if (Fai.isNull(top._navStyleData.nib.c)) {
		top._navStyleData.nib.c = "#000";
	}
	g_navItemBgColor = top._navStyleData.nib.c;
	//$.showcolor('navItemBgColorPicker', onNavItemBgColorChange, -138, 28, g_navItemBgColor, true);
	$("#navItemBgColorPicker").faiColorPicker({
        onchange:onNavItemBgColorChange,
        defaultcolor:g_navItemBgColor,
        showInTop:true
    });
	if(top._navStyleData.nib.f){
		$("#uploadmsg2").html('<a href="javascript:view(\'' + top._navStyleData.nib.f + '\');">查看</a>');
	}
}

function initNavItemHoverBg() {
	if (top._navStyleData.nihb.y == 1) {
		$('#navItemHoverBg1').click();
	} else if (top._navStyleData.nihb.y == 2) {
		$('#navItemHoverBg2').click();
	} else {
		$('#navItemHoverBg0').click();
	}
	if (Fai.isNull(top._navStyleData.nihb.r)) {
		top._navStyleData.nihb.r = 0;
	}
	$('#navItemHoverBgRepeat').val(top._navStyleData.nihb.r);
	if (Fai.isNull(top._navStyleData.nihb.c)) {
		top._navStyleData.nihb.c = "#000";
	}
	g_navItemHoverBgColor = top._navStyleData.nihb.c;
	//$.showcolor('navItemHoverBgColorPicker', onNavItemHoverBgColorChange, -138, 28, g_navItemHoverBgColor, true);
	$("#navItemHoverBgColorPicker").faiColorPicker({
        onchange:onNavItemHoverBgColorChange,
        defaultcolor:g_navItemHoverBgColor,
        showInTop:true
    });
	if(top._navStyleData.nihb.f){
		$("#uploadmsg3").html('<a href="javascript:view(\'' + top._navStyleData.nihb.f + '\');">查看</a>');
	}
}

function onNavBgColorChange(color) {
	g_navBgColor = color;
	refreshNavBg();
	onStyleChange();
}

function onContentBgColorChange(color) {
	g_contentBgColor = color;
	refreshContentBg();
	onStyleChange();
}

function onNavItemBgColorChange(color) {
	g_navItemBgColor = color;
	refreshNavItemBg();
	onStyleChange();
}

function onNavItemHoverBgColorChange(color) {
	g_navItemHoverBgColor = color;
	refreshNavItemHoverBg();
	onStyleChange();
}

function onNavItemSpacingBgColorChange(color) {
	g_navItemSpacingBgColor = color;
	refreshNavItemSpacingBg();
	onStyleChange();
}

function refreshNavBg() {

	top._navStyleData.nb.c = g_navBgColor;
	var r = top._navStyleData.nb.r;

	var background = '';
	background += g_navBgColor;
	var bgfile = top._navStyleData.nb.p;
	if (bgfile) {
		if (r != -1) {
			var bgRepeat = "";
			if(r == 0 || r == 6 || r == 7 || r == 8 || r == 9 || r == 13 || r == 14 || r == 15 || r == 16){bgRepeat = "no-repeat";}
			if(r == 1 || r == 11 || r == 12 ){bgRepeat = "repeat-x";}
			if(r == 2 || r == 21 || r == 22){bgRepeat = "repeat-y";}
			if(r == 3){bgRepeat = "repeat";}
			if(r == 4 || r == 5){bgRepeat = "repeat";}
			var bgPosition = "center";
			if(r == 9 || r == 12){bgPosition = "bottom";}
			if(r == 6 || r == 21){bgPosition = "left";}
			if(r == 7 || r == 22){bgPosition = "right";}
			if(r == 4 || r == 5 || r == 8 || r == 11){bgPosition = "top";}
			if(r == 13){bgPosition = "left top";}
			if(r == 14){bgPosition = "right top";}
			if(r == 15){bgPosition = "left bottom";}
			if(r == 16){bgPosition = "right bottom";}
			background += ' ' + "url(" + bgfile + ") " + bgRepeat + " " + bgPosition;
		}
	}
	
	Site.setNavBg(background);
	
}

function refreshContentBg() {

	top._navStyleData.cb.c = g_contentBgColor;
	var r = top._navStyleData.cb.r

	var background = '';
	background += g_contentBgColor;
	var bgfile = top._navStyleData.cb.p;
	if (bgfile) {
		if (r != -1) {
			var bgRepeat = "";
			if(r == 0 || r == 6 || r == 7 || r == 8 || r == 9 || r == 13 || r == 14 || r == 15 || r == 16){bgRepeat = "no-repeat";}
			if(r == 1 || r == 11 || r == 12 ){bgRepeat = "repeat-x";}
			if(r == 2 || r == 21 || r == 22){bgRepeat = "repeat-y";}
			if(r == 3){bgRepeat = "repeat";}
			if(r == 4 || r == 5){bgRepeat = "repeat";}
			var bgPosition = "center";
			if(r == 9 || r == 12){bgPosition = "bottom";}
			if(r == 6 || r == 21){bgPosition = "left";}
			if(r == 7 || r == 22){bgPosition = "right";}
			if(r == 4 || r == 5 || r == 8 || r == 11){bgPosition = "top";}
			if(r == 13){bgPosition = "left top";}
			if(r == 14){bgPosition = "right top";}
			if(r == 15){bgPosition = "left bottom";}
			if(r == 16){bgPosition = "right bottom";}
			background += ' ' + "url(" + bgfile + ") " + bgRepeat + " " + bgPosition;
		}
	}
	background += ' !important';
	Site.setNavContentBg(background);
	
}

function refreshNavItemBg() {

	top._navStyleData.nib.c = g_navItemBgColor;
	var r = top._navStyleData.nib.r;

	var background = '';
	background += g_navItemBgColor;
	var bgfile = top._navStyleData.nib.p;
	if (bgfile) {
		if (r != -1) {
			var bgRepeat = "";
				if(r == 0 || r == 6 || r == 7 || r == 8 || r == 9 || r == 13 || r == 14 || r == 15 || r == 16){bgRepeat = "no-repeat";}
				if(r == 1 || r == 11 || r == 12 ){bgRepeat = "repeat-x";}
				if(r == 2 || r == 21 || r == 22){bgRepeat = "repeat-y";}
				if(r == 3){bgRepeat = "repeat";}
				if(r == 4 || r == 5){bgRepeat = "repeat";}
				var bgPosition = "center";
				if(r == 9 || r == 12){bgPosition = "bottom";}
				if(r == 6 || r == 21){bgPosition = "left";}
				if(r == 7 || r == 22){bgPosition = "right";}
				if(r == 4 || r == 5 || r == 8 || r == 11){bgPosition = "top";}
				if(r == 13){bgPosition = "left top";}
				if(r == 14){bgPosition = "right top";}
				if(r == 15){bgPosition = "left bottom";}
				if(r == 16){bgPosition = "right bottom";}
			background += ' ' + "url(" + bgfile + ") " + bgRepeat + " " + bgPosition;
		}
	}
	
	Site.setNavItemBg(background);
	
}

function refreshNavItemHoverBg() {

	top._navStyleData.nihb.c = g_navItemHoverBgColor;
	var r = top._navStyleData.nihb.r;

	var background = '';
	background += g_navItemHoverBgColor;
	var bgfile = top._navStyleData.nihb.p;
	if (bgfile) {
		if (r != -1) {
			var bgRepeat = "";
			if(r == 0 || r == 6 || r == 7 || r == 8 || r == 9 || r == 13 || r == 14 || r == 15 || r == 16){bgRepeat = "no-repeat";}
			if(r == 1 || r == 11 || r == 12 ){bgRepeat = "repeat-x";}
			if(r == 2 || r == 21 || r == 22){bgRepeat = "repeat-y";}
			if(r == 3){bgRepeat = "repeat";}
			if(r == 4 || r == 5){bgRepeat = "repeat";}
			var bgPosition = "center";
			if(r == 9 || r == 12){bgPosition = "bottom";}
			if(r == 6 || r == 21){bgPosition = "left";}
			if(r == 7 || r == 22){bgPosition = "right";}
			if(r == 4 || r == 5 || r == 8 || r == 11){bgPosition = "top";}
			if(r == 13){bgPosition = "left top";}
			if(r == 14){bgPosition = "right top";}
			if(r == 15){bgPosition = "left bottom";}
			if(r == 16){bgPosition = "right bottom";}
			background += ' ' + "url(" + bgfile + ") " + bgRepeat + " " + bgPosition;
		}
	}
	
	Site.setNavItemHoverBg(background);
}

function refreshNavItemSpacingBg() {

	top._navStyleData.nisb.c = g_navItemSpacingBgColor;
	var r = top._navStyleData.nisb.r;

	var background = '';
	background += g_navItemSpacingBgColor;
	var bgfile = top._navStyleData.nisb.p;
	if (bgfile) {
		if (r != -1) {
			var bgRepeat = "";
			if(r == 0 || r == 6 || r == 7 || r == 8 || r == 9 || r == 13 || r == 14 || r == 15 || r == 16){bgRepeat = "no-repeat";}
			if(r == 1 || r == 11 || r == 12 ){bgRepeat = "repeat-x";}
			if(r == 2 || r == 21 || r == 22){bgRepeat = "repeat-y";}
			if(r == 3){bgRepeat = "repeat";}
			if(r == 4 || r == 5){bgRepeat = "repeat";}
			var bgPosition = "center";
			if(r == 9 || r == 12){bgPosition = "bottom";}
			if(r == 6 || r == 21){bgPosition = "left";}
			if(r == 7 || r == 22){bgPosition = "right";}
			if(r == 4 || r == 5 || r == 8 || r == 11){bgPosition = "top";}
			if(r == 13){bgPosition = "left top";}
			if(r == 14){bgPosition = "right top";}
			if(r == 15){bgPosition = "left bottom";}
			if(r == 16){bgPosition = "right bottom";}
			background += ' ' + "url(" + bgfile + ") " + bgRepeat + " " + bgPosition;
		}
	}
	
	Site.setNavItemSpacingBg(background);
}

function navBgRepeatChange(that) {
	var repeat = parseInt($("#navBgRepeat").val());
	top._navStyleData.nb.r = repeat;

	if (!top._navStyleData.nb.f) {
		if(that.value != -1){
			Fai.ing("请先上传背景图片。",true);
			return;
		}
	}
	
	Site.showRepeatTip(repeat);
	refreshNavBg();
	onStyleChange();
}

function contentBgRepeatChange(that) {
	var repeat = parseInt($("#contentBgRepeat").val());
	top._navStyleData.cb.r = repeat;

	if (!top._navStyleData.cb.f) {
		if(that.value != -1){
			Fai.ing("请先上传背景图片。",true);
			return;
		}
	}
	
	Site.showRepeatTip(repeat);
	refreshContentBg();
	onStyleChange();
}

function navItemBgRepeatChange(that) {
	var repeat = parseInt($("#navItemBgRepeat").val());
	top._navStyleData.nib.r = repeat;

	if (!top._navStyleData.nib.f) {
		if(that.value != -1){
			Fai.ing("请先上传背景图片。",true);
			return;
		}
	}
	
	Site.showRepeatTip(repeat);
	refreshNavItemBg();
	onStyleChange();
}

function navItemHoverBgRepeatChange(that) {
	var repeat = parseInt($("#navItemHoverBgRepeat").val());
	top._navStyleData.nihb.r = repeat;

	if (!top._navStyleData.nihb.f) {
		if(that.value != -1){
			Fai.ing("请先上传背景图片。",true);
			return;
		}
	}
	
	Site.showRepeatTip(repeat);
	refreshNavItemHoverBg();
	onStyleChange();
}

function navItemSpacingBgRepeatChange(that) {
	var repeat = parseInt($("#navItemSpacingBgRepeat").val());
	top._navStyleData.nisb.r = repeat;

	if (!top._navStyleData.nisb.f) {
		if(that.value != -1){
			Fai.ing("请先上传背景图片。",true);
			return;
		}
	}
	
	Site.showRepeatTip(repeat);
	refreshNavItemSpacingBg();
	onStyleChange();
}

function navSecItemBgRepeatChange(that) {
	var repeat = parseInt($("#navSecItemBgRepeat").val());
	top._navStyleData.nsib.r = repeat;

	if (!top._navStyleData.nsib.f) {
		if(that.value != -1){
			Fai.ing("请先上传背景图片。",true);
			return;
		}
	}
	
	Site.showRepeatTip(repeat);
	refreshNavSecItemBg();
	onStyleChange();
}

function navSecItemHoverBgRepeatChange(that) {
	var repeat = parseInt($("#navSecItemHoverBgRepeat").val());
	top._navStyleData.nsihb.r = repeat;

	if (!top._navStyleData.nsihb.f) {
		if(that.value != -1){
			Fai.ing("请先上传背景图片。",true);
			return;
		}
	}
	
	Site.showRepeatTip(repeat);
	refreshNavSecItemHoverBg();
	onStyleChange();
}

function changeNavBgType(type) {
	if (type == 1) {
		$('.navBgCus').hide();
	} else if (type == 2) {
		$('.navBgCus').show();
	} else {
		$('.navBgCus').hide();
	}
	if (g_initing) {
		return;
	}

	if (type == 1) {
		top._navStyleData.nb.y = 1;
		Site.hideNavBg();
	} else if (type == 2) {
		top._navStyleData.nb.y = 2;
		Site.hideNavBg();
		refreshNavBg();
	} else {
		top._navStyleData.nb.y = 0;
		Site.autoNavBg();
		
		if(top._navStyleData.ns.h != -1){
			Site.setNavBgSize();
		}
	}
	if(type != 0){
		Site.autoNavBgSize();
	}

	onStyleChange();
}

function changeContentBgType(type) {
	if (type == 1) {
		$('.contentBgCus').hide();
	} else if (type == 2) {
		$('.contentBgCus').show();
	} else {
		$('.contentBgCus').hide();
	}
	if (g_initing) {
		return;
	}

	if (type == 1) {
		top._navStyleData.cb.y = 1;
		Site.hideNavContentBg();
	} else if (type == 2) {
		top._navStyleData.cb.y = 2;
		Site.hideNavContentBg();
		refreshContentBg();
	} else {
		top._navStyleData.cb.y = 0;
		Site.autoNavContentBg();
		if(top._navStyleData.cs.h != -1){
			Site.setNavContentBgSize();
		}
	}
	if(type != 0){
		Site.autoNavContentBgSize();
	}

	onStyleChange();
}

function changeNavItemBgType(type) {
	if (type == 1) {
		$('.navItemBgCus').hide();
	} else if (type == 2) {
		$('.navItemBgCus').show();
	} else {
		$('.navItemBgCus').hide();
	}
	if (g_initing) {
		return;
	}

	if (type == 1) {
		top._navStyleData.nib.y = 1;
		Site.hideNavItemBg();
	} else if (type == 2) {
		top._navStyleData.nib.y = 2;
		Site.hideNavItemBg();
		refreshNavItemBg();

	} else {
		top._navStyleData.nib.y = 0;
		Site.autoNavItemBg();
		
		if(top._navStyleData.nis.h != -1){
			Site.setNavItemBgSize();
			Site.setNavItemCenterBgSize();
			Site.setNavItemSepBgPosition();
		}
	}
	if(type == 0){
		Site.autoNavItemBgSize();
		Site.autoNavItemCenterBgSize();
		Site.autoNavItemSepBgPosition();
	}

	onStyleChange();
}

function changeNavItemHoverBgType(type) {
	if (type == 1) {
		$('.navItemHoverBgCus').hide();
	} else if (type == 2) {
		$('.navItemHoverBgCus').show();
	} else {
		$('.navItemHoverBgCus').hide();
	}
	if (g_initing) {
		return;
	}

	if (type == 1) {
		top._navStyleData.nihb.y = 1;
		Site.hideNavItemHoverBg();
	} else if (type == 2) {
		top._navStyleData.nihb.y = 2;
		Site.hideNavItemHoverBg();
		refreshNavItemHoverBg();
	} else {
		top._navStyleData.nihb.y = 0;
		Site.autoNavItemHoverBg();
	}

	onStyleChange();
}


function onStyleChange() {
	if (g_initing) {
		return;
	}
	top._navStyleChanged ++;
	Site.styleChanged();
	Site.setRefreshInfo("moduleStyle", true);
}

function initNavItemSpacingSize(){
	// 栏目项间隔
	
	if(top._navStyleData.niss.w == 0) {
		$("#navItemSpacingWidthHide")[0].click();
	} else if(top._navStyleData.niss.w == "" || top._navStyleData.niss.w == -1){
		$("#navItemSpacingWidthDefault")[0].click();
	} else{
		$("#navItemSpacingWidthFix")[0].click();
	}
	
}

function changeNavItemSpacingWidth(type) {
	if (type == 0) {
		$("#navItemSpacingWidthDefault").attr("checked", true);
		$("#navItemSpacingSizeInput").hide();
		top._navStyleData.niss.w = -1;
		top._navStyleData.niss.h = -1;
	} else if(type == 1){
		$("#navItemSpacingWidthHide").attr("checked", true);
		$("#navItemSpacingSizeInput").hide();
		top._navStyleData.niss.w = 0;
		top._navStyleData.niss.h = 0;
	} else {
		$("#navItemSpacingWidthFix").attr("checked", true);
		$("#navItemSpacingSizeInput").show();
		
		var firstNavItemSep = top.$("#nav .itemSep");
		if(top._navStyleData.niss.w == -1){
			if(firstNavItemSep.length > 0){
				top._navStyleData.niss.w = firstNavItemSep.first().width();
			}else{
				top._navStyleData.niss.w = 5;
			}

		}
		if(top._navStyleData.niss.w == 0){
			top._navStyleData.niss.w = 2;
		}
		
		if(top._navStyleData.niss.h == -1){
			if(firstNavItemSep.length > 0){
				top._navStyleData.niss.h = firstNavItemSep.first().height();
			}else{
				top._navStyleData.niss.h = 20;
			}

		}
		if(top._navStyleData.niss.h == 0){
			top._navStyleData.niss.h = 20;
		}
		
		$("#navItemSpacingWidthInput").val(top._navStyleData.niss.w);
		$("#navItemSpacingHeightInput").val(top._navStyleData.niss.h);
		
	}
	if (g_initing) {
		return;
	}
	
	if (type == 0) {
		//恢复原来宽度
		Site.autoNavItemSpacingWidth();
		//恢复原来高度
		if(top._navStyleData.nis.h != -1){
			Site.setNavItemSpacingHeight(top._navStyleData.nis.h);
			Site.setNavItemSepBgPosition();
		}else{
			Site.autoNavItemSpacingHeight();
		}
		
		Site.refreshNavContainer();
		
		onStyleChange();
	} else if(type == 1){
		Site.hideNavItemSpacingWidthAndHeight();
		onStyleChange();
	} else {
		onNavItemSpacingWidthChange();
		onNavItemSpacingHeightChange();
	}
}


function onNavItemSpacingWidthChange() {
	var width = $("#navItemSpacingWidthInput").val();
	if (width == '') {
		Fai.ing("间隔宽度不能为空", true);
		return;
	}
	if (width <= 0 || width >= 1000) {
		Fai.ing("请输入大于0小于1000的数值宽度", true);
		return;
	}
	if(!isNaN(parseInt(width))){
		top._navStyleData.niss.w = parseInt(width);
	
		Site.setNavItemSpacingWidth(parseInt(width));
		
		Site.refreshNavContainer();
		
		onStyleChange();
	}
}

function onNavItemSpacingHeightChange() {
	var height = $("#navItemSpacingHeightInput").val();
	if (height == '') {
		Fai.ing("间隔高度不能为空", true);
		return;
	}
	if (height <= 0 || height >= 1000) {
		Fai.ing("请输入大于0小于1000的数值高度", true);
		return;
	}
	if(!isNaN(parseInt(height))){
		top._navStyleData.niss.h = parseInt(height);
	
		Site.setNavItemSpacingHeight(parseInt(height));

		Site.refreshNavContainer();
		onStyleChange();
	}
}

function initNavItemSpacingBg() {
	if (top._navStyleData.nisb.y == 1) {
		$('#navItemSpacingBg1').click();
	} else if (top._navStyleData.nisb.y == 2) {
		$('#navItemSpacingBg2').click();
	} else {
		$('#navItemSpacingBg0').click();
	}
	if (Fai.isNull(top._navStyleData.nisb.r)) {
		top._navStyleData.nisb.r = 0;
	}
	$('#navItemSpacingBgRepeat').val(top._navStyleData.nisb.r);
	if (Fai.isNull(top._navStyleData.nisb.c)) {
		top._navStyleData.nisb.c = "#000";
	}
	g_navItemSpacingBgColor = top._navStyleData.nisb.c;
	//$.showcolor('navItemSpacingBgColorPicker', onNavItemSpacingBgColorChange, -138, 28, g_navItemSpacingBgColor, true);
	$('#navItemSpacingBgColorPicker').faiColorPicker({
        onchange:onNavItemSpacingBgColorChange,
        defaultcolor:g_navItemSpacingBgColor,
        showInTop:true
    });
	if(top._navStyleData.nisb.f){
		$("#uploadmsg4").html('<a href="javascript:view(\'' + top._navStyleData.nisb.f + '\');">查看</a>');
	}
}

function changeNavItemSpacingBgType(type) {
	if (type == 1) {
		$('.navItemSpacingBgCus').hide();
	} else if (type == 2) {
		$('.navItemSpacingBgCus').show();
	} else {
		$('.navItemSpacingBgCus').hide();
	}
	if (g_initing) {
		return;
	}

	if (type == 1) {
		top._navStyleData.nisb.y = 1;
		Site.hideNavItemSpacingBg();
	} else if (type == 2) {
		top._navStyleData.nisb.y = 2;
		Site.hideNavItemSpacingBg();
		refreshNavItemSpacingBg();
	} else {
		top._navStyleData.nisb.y = 0;
		Site.autoNavItemSpacingBg();
	}

	onStyleChange();
}

function initNavSecItemSize() {
	// 二级菜单导航宽
	if(top._navStyleData.nsis.w == "" || top._navStyleData.nsis.w == -1){
		$("#navSecItemWidthDefault")[0].click();
	}else{
		$("#navSecItemWidthFix")[0].click();
	}
	
	// 二级菜单导航高
	if(top._navStyleData.nsis.h == "" || top._navStyleData.nsis.h == -1){
		$("#navSecItemHeightDefault")[0].click();
	}else{
		$("#navSecItemHeightFix")[0].click();
	}
}

function changeNavSecItemWidth(type) {
	if (type == 0) {
		$("#navSecItemWidthDefault").attr("checked", true);
		$("#navSecItemWidthInput").hide();
		top._navStyleData.nsis.w = -1;
	} else {
		$("#navSecItemWidthFix").attr("checked", true);
		$("#navSecItemWidthInput").show();
		if(top._navStyleData.nsis.w == -1){
			var firstNavSecItem = top.$("#g_menunav4SubMenu .item");
			if(firstNavSecItem.length > 0){
				top._navStyleData.nsis.w = firstNavSecItem.first().width();
			}else{
				top._navStyleData.nsis.w = 80;
			}

		}
		$("#navSecItemWidthInput").val(top._navStyleData.nsis.w);
	}
	if (g_initing) {
		return;
	}
	
	if (type == 0) {
		//恢复原来宽度
		Site.autoNavSecItemWidth();
		
		Site.refreshNavContainer();
		
		onStyleChange();
	} else {
		onNavSecItemWidthChange();
	}
}

function changeNavSecItemHeight(type) {
	if (type == 0) {
		$("#navSecItemHeightDefault").attr("checked", true);
		$("#navSecItemHeightInput").hide();
		top._navStyleData.nsis.h = -1;
	} else {
		$("#navSecItemHeightFix").attr("checked", true);
		$("#navSecItemHeightInput").show();
		if(top._navStyleData.nsis.h == -1){
			var firstNavSecItem = top.$("#g_menunav4SubMenu .item");
			if(firstNavSecItem.length > 0){
				top._navStyleData.nsis.h = firstNavSecItem.first().height();
			}else{
				top._navStyleData.nsis.h = 25;
			}

		}
		$("#navSecItemHeightInput").val(top._navStyleData.nsis.h);
	}
	if (g_initing) {
		return;
	}
	
	if (type == 0) {
		//恢复原来宽度
		Site.autoNavSecItemHeight();
		
		Site.refreshNavContainer();
		
		onStyleChange();
	} else {
		onNavSecItemHeightChange();
	}
}

function onNavSecItemWidthChange() {
	var width = $("#navSecItemWidthInput").val();
	if (width == '') {
		Fai.ing("二级菜单宽度不能为空", true);
		return;
	}
	if (width <= 0 || width >= 1000) {
		Fai.ing("请输入大于0小于1000的数值宽度", true);
		return;
	}
	if(!isNaN(parseInt(width))){
		top._navStyleData.nsis.w = parseInt(width);
	
		Site.setNavSecItemWidth(parseInt(width));
		
		Site.refreshNavContainer();
		
		onStyleChange();
	}
}

function onNavSecItemHeightChange() {
	var height = $("#navSecItemHeightInput").val();
	if (height == '') {
		Fai.ing("二级菜单高度不能为空", true);
		return;
	}
	if (height <= 0 || height >= 1000) {
		Fai.ing("请输入大于0小于1000的数值高度", true);
		return;
	}
	if(!isNaN(parseInt(height))){
		top._navStyleData.nsis.h = parseInt(height);
	
		Site.setNavSecItemHeight(parseInt(height));
		
		Site.refreshNavContainer();
		
		onStyleChange();
	}
}

function initNavSecItemBg() {
	if (top._navStyleData.nsib.y == 1) {
		$('#navSecItemBg1').click();
	} else if (top._navStyleData.nsib.y == 2) {
		$('#navSecItemBg2').click();
	} else {
		$('#navSecItemBg0').click();
	}
	if (Fai.isNull(top._navStyleData.nsib.r)) {
		top._navStyleData.nsib.r = 0;
	}
	$('#navSecItemBgRepeat').val(top._navStyleData.nsib.r);
	if (Fai.isNull(top._navStyleData.nsib.c)) {
		top._navStyleData.nsib.c = "#000";
	}
	g_navSecItemBgColor = top._navStyleData.nsib.c;
	//$.showcolor('navSecItemBgColorPicker', onNavSecItemBgColorChange, -138, 28, g_navSecItemBgColor, true);
    $("#navSecItemBgColorPicker").faiColorPicker({
        onchange:onNavSecItemBgColorChange,
        defaultcolor:g_navSecItemBgColor,
        showInTop:true
    });
	
	if(top._navStyleData.nsib.f){
		$("#uploadmsg5").html('<a href="javascript:view(\'' + top._navStyleData.nsib.f + '\');">查看</a>');
	}
}

function onNavSecItemBgColorChange(color) {
	g_navSecItemBgColor = color;
	refreshNavSecItemBg();
	onStyleChange();
}

function changeNavSecItemBgType(type) {
	if (type == 1) {
		$('.navSecItemBgCus').hide();
	} else if (type == 2) {
		$('.navSecItemBgCus').show();
	} else {
		$('.navSecItemBgCus').hide();
	}
	if (g_initing) {
		return;
	}

	if (type == 1) {
		top._navStyleData.nsib.y = 1;
		Site.hideNavSecItemBg();
	} else if (type == 2) {
		top._navStyleData.nsib.y = 2;
		Site.hideNavSecItemBg();
		refreshNavSecItemBg();

	} else {
		top._navStyleData.nsib.y = 0;
		Site.autoNavSecItemBg();
	}

	onStyleChange();
}

function refreshNavSecItemBg() {

	top._navStyleData.nsib.c = g_navSecItemBgColor;
	var r = top._navStyleData.nsib.r;
	

	var background = '';
	background += g_navSecItemBgColor;
	var bgfile = top._navStyleData.nsib.p;
	if (bgfile) {
		if (r != -1) {
			var bgRepeat = "";
			if(r == 0 || r == 6 || r == 7 || r == 8 || r == 9 || r == 13 || r == 14 || r == 15 || r == 16){bgRepeat = "no-repeat";}
			if(r == 1 || r == 11 || r == 12 ){bgRepeat = "repeat-x";}
			if(r == 2 || r == 21 || r == 22){bgRepeat = "repeat-y";}
			if(r == 3){bgRepeat = "repeat";}
			if(r == 4 || r == 5){bgRepeat = "repeat";}
			var bgPosition = "center";
			if(r == 9 || r == 12){bgPosition = "bottom";}
			if(r == 6 || r == 21){bgPosition = "left";}
			if(r == 7 || r == 22){bgPosition = "right";}
			if(r == 4 || r == 5 || r == 8 || r == 11){bgPosition = "top";}
			if(r == 13){bgPosition = "left top";}
			if(r == 14){bgPosition = "right top";}
			if(r == 15){bgPosition = "left bottom";}
			if(r == 16){bgPosition = "right bottom";}
			background += ' ' + "url(" + bgfile + ") " + bgRepeat + " " + bgPosition;
		}
	}
	
	Site.setNavSecItemBg(background);
	
}

function refreshNavSecItemHoverBg() {

	top._navStyleData.nsihb.c = g_navSecItemHoverBgColor;
	var repeat = top._navStyleData.nsihb.r;

	var background = '';
	background += g_navSecItemHoverBgColor;
	var bgfile = top._navStyleData.nsihb.p;
	if (bgfile) {
		if (repeat != -1) {
			var bgRepeat = "";
			if(r == 0 || r == 6 || r == 7 || r == 8 || r == 9 || r == 13 || r == 14 || r == 15 || r == 16){bgRepeat = "no-repeat";}
			if(r == 1 || r == 11 || r == 12 ){bgRepeat = "repeat-x";}
			if(r == 2 || r == 21 || r == 22){bgRepeat = "repeat-y";}
			if(r == 3){bgRepeat = "repeat";}
			if(r == 4 || r == 5){bgRepeat = "repeat";}
			var bgPosition = "center";
			if(r == 9 || r == 12){bgPosition = "bottom";}
			if(r == 6 || r == 21){bgPosition = "left";}
			if(r == 7 || r == 22){bgPosition = "right";}
			if(r == 4 || r == 5 || r == 8 || r == 11){bgPosition = "top";}
			if(r == 13){bgPosition = "left top";}
			if(r == 14){bgPosition = "right top";}
			if(r == 15){bgPosition = "left bottom";}
			if(r == 16){bgPosition = "right bottom";}
			background += ' ' + "url(" + bgfile + ") " + bgRepeat + " " + bgPosition;
		}
	}
	
	Site.setNavSecItemHoverBg(background);
}

function initNavSecItemHoverBg() {
	if (top._navStyleData.nsihb.y == 1) {
		$('#navSecItemHoverBg1').click();
	} else if (top._navStyleData.nsihb.y == 2) {
		$('#navSecItemHoverBg2').click();
	} else {
		$('#navSecItemHoverBg0').click();
	}
	if (Fai.isNull(top._navStyleData.nsihb.r)) {
		top._navStyleData.nsihb.r = 0;
	}
	$('#navSecItemHoverBgRepeat').val(top._navStyleData.nsihb.r);
	if (Fai.isNull(top._navStyleData.nsihb.c)) {
		top._navStyleData.nsihb.c = "#000";
	}
	g_navSecItemHoverBgColor = top._navStyleData.nsihb.c;
	//$.showcolor('navSecItemHoverBgColorPicker', onNavSecItemHoverBgColorChange, -138, 28, g_navSecItemHoverBgColor, true);
    $("#navSecItemHoverBgColorPicker").faiColorPicker({
        onchange:onNavSecItemHoverBgColorChange,
        defaultcolor:g_navSecItemHoverBgColor,
        showInTop:true
    });
	
	if(top._navStyleData.nsihb.f){
		$("#uploadmsg6").html('<a href="javascript:view(\'' + top._navStyleData.nsihb.f + '\');">查看</a>');
	}
}

function onNavSecItemHoverBgColorChange(color) {
	g_navSecItemHoverBgColor = color;
	refreshNavSecItemHoverBg();
	onStyleChange();
}

function changeNavSecItemHoverBgType(type) {
	if (type == 1) {
		$('.navSecItemHoverBgCus').hide();
	} else if (type == 2) {
		$('.navSecItemHoverBgCus').show();
	} else {
		$('.navSecItemHoverBgCus').hide();
	}
	if (g_initing) {
		return;
	}

	if (type == 1) {
		top._navStyleData.nsihb.y = 1;
		Site.hideNavSecItemHoverBg();
	} else if (type == 2) {
		top._navStyleData.nsihb.y = 2;
		Site.hideNavSecItemHoverBg();
		refreshNavSecItemHoverBg();
	} else {
		top._navStyleData.nsihb.y = 0;
		Site.autoNavSecItemHoverBg();
	}

	onStyleChange();
}

function refreshNavSecItemHoverBg() {

	top._navStyleData.nsihb.c = g_navSecItemHoverBgColor;
	var repeat = parseInt($("#navSecItemHoverBgRepeat").val());
	top._navStyleData.nsihb.r = repeat;

	var background = '';
	background += g_navSecItemHoverBgColor;
	var bgfile = top._navStyleData.nsihb.p;
	if (bgfile) {
		if (repeat != -1) {
			var bgRepeat = "";
			if(repeat == 0){bgRepeat = "no-repeat";}
			if(repeat == 1 || repeat==11 || repeat==12 ){bgRepeat = "repeat-x";}
			if(repeat == 2 || repeat == 21 || repeat == 22){bgRepeat = "repeat-y";}
			if(repeat == 3){bgRepeat = "repeat";}
			var bgPosition = "center";
			if(repeat==11){bgPosition = "top";}
			if(repeat==12){bgPosition = "bottom";}
			if(repeat==21){bgPosition = "left";}
			if(repeat==22){bgPosition = "right";}
			background += ' ' + "url(" + bgfile + ") " + bgRepeat + " " + bgPosition;
		}
	}
	
	Site.setNavSecItemHoverBg(background);
}


function initNavSecItemGeneralText(){

	if (top._navStyleData.nsigt.y == 1) {
		$("#navSecItemText1").click();
	} else {
		$("#navSecItemText0").click();
	}
	if (Fai.isNull(top._navStyleData.nsigt.s)) {
		top._navStyleData.nsigt.s = 12;
	}
	$("#navSecItemTextSize").val(top._navStyleData.nsigt.s);
	if (Fai.isNull(top._navStyleData.nsigt.f)) {
		top._navStyleData.nsigt.f = "宋体";
	}
	$("#navSecItemTextFamily").val(top._navStyleData.nsigt.f);
	var ntf_select = $("#navSecItemTextFamily"); // cache
	if( ntf_select.val() == null && ntf_select.children('option').length > 0 ){
		ntf_select[0].selectedIndex = 0;
	}
	if (Fai.isNull(top._navStyleData.nsigt.w)) {
		top._navStyleData.nsigt.w = 0;
	}
	if (top._navStyleData.nsigt.w == 1) {
		$("#navSecItemTextBold").attr("checked", true);
	}
	if (Fai.isNull(top._navStyleData.nsigt.c)) {
		top._navStyleData.nsigt.c = "#000";
	}
	g_navSecItemTextColor = top._navStyleData.nsigt.c;
	//$.showcolor('navSecItemTextColorPicker', onNavSecItemTextColorChange, -110, 28, g_navSecItemTextColor);
    $("#navSecItemTextColorPicker").faiColorPicker({
        onchange:onNavSecItemTextColorChange,
        defaultcolor:g_navSecItemTextColor,
        showInTop:true
    });

	if ( Fai.isNull(top._navStyleData.nsigt.ta) || top._navStyleData.nsigt.ta == 0 ){
		$('#navSecItemTextCenter')[0].click();
	} else {
		$('#navSecItemTextLeft')[0].click();
	}
}

function initNavSecItemHoverText(){
	if (Fai.isNull(top._navStyleData.nsiht.c)) {
		top._navStyleData.nsiht.c = "#000";
	}
	g_navSecItemHoverTextColor = top._navStyleData.nsiht.c;
	//$.showcolor('navSecItemHoverTextColorPicker', onNavSecItemHoverTextColorChange, -138, 28, g_navSecItemHoverTextColor);
    $("#navSecItemHoverTextColorPicker").faiColorPicker({
        onchange:onNavSecItemHoverTextColorChange,
        defaultcolor:g_navSecItemHoverTextColor,
        showInTop:true
    })
}


function onNavSecItemTextColorChange(color) {
	
	g_navSecItemTextColor = color;
	refreshNavSecItemText();
	onStyleChange();
}

function onNavSecItemHoverTextColorChange(color) {
	
	g_navSecItemHoverTextColor = color;
	refreshNavSecItemHoverText();
	onStyleChange();
}

function changeNavSecItemTextType(type) {
	if (type == 1) {
		$(".navSecItemTextCus").show();
		$(".navSecItemHoverTextCus").show();
	} else {
		$(".navSecItemTextCus").hide();
		$(".navSecItemHoverTextCus").hide();
	}
	if (g_initing) {
		return;
	}
	
	top._navStyleData.nsigt.y = parseInt(type);
	top._navStyleData.nsiht.y = parseInt(type);

	if (type == 1) {
		refreshNavSecItemText();
		refreshNavSecItemHoverText();
	} else {
		Site.autoNavSecItemGeneralText();
		Site.autoNavSecItemHoverText();
	}


	onStyleChange();
}


function changeNavSecItemHoverTextType(type) {
	if (type == 1) {
		$(".navSecItemHoverTextCus").show();
	} else {
		$(".navSecItemHoverTextCus").hide();
	}
	if (g_initing) {
		return;
	}
	
	top._navStyleData.nsiht.y = parseInt(type);

	if (type == 1) {
		refreshNavSecItemHoverText();
	} else {
		Site.autoNavSecItemHoverText();
	}
	
	onStyleChange();
}


function refreshNavSecItemText() {
	if (g_initing) {
		return;
	}
	
	var weight = 'normal';
	if ($('#navSecItemTextBold').attr('checked')) {
		top._navStyleData.nsigt.w = 1;
		top._navStyleData.nsiht.w = 1;
		weight = "bolder";
	} else {
		top._navStyleData.nsigt.w = 0;
		top._navStyleData.nsiht.w = 0;
	}
	var textAlign = "center";
	if ( $('#navSecItemTextCenter').attr("checked") ){
		top._navStyleData.nsigt.ta = 0;
	} else {
		top._navStyleData.nsigt.ta = 1;
		textAlign = "left";
	}
	top._navStyleData.nsigt.s = parseInt($('#navSecItemTextSize').val());
	top._navStyleData.nsigt.f = $('#navSecItemTextFamily').val();
	top._navStyleData.nsigt.c = g_navSecItemTextColor;

	Site.setNavSecItemGeneralText([
		{cls:'.navSubMenu .item a', key:'display', value:'block'},
		{cls:'.navSubMenu .item a', key:'font-size', value:top._navStyleData.nsigt.s + "px!important"},
		{cls:'.navSubMenu .item a', key:'font-family', value:top._navStyleData.nsigt.f + "!important"},
		{cls:'.navSubMenu .item a', key:'font-weight', value:weight + "!important"},
		{cls:'.navSubMenu .item a', key:'color', value:g_navSecItemTextColor + "!important"},
		{cls:'.navSubMenu .item a', key:'text-decoration', value:'none'},
		{cls:'.navSubMenu .item a', key:'text-align', value:textAlign + " !important"}
	]);
	refreshNavSecItemHoverText();
}


function refreshNavSecItemHoverText() {
	top._navStyleData.nsiht.c = g_navSecItemHoverTextColor;

	Site.setNavSecItemGeneralText([
		{cls:'.navSubMenu .itemHover a', key:'color', value:g_navSecItemHoverTextColor + " !important"},
		{cls:'.navSubMenu .itemHover a', key:'text-decoration', value:'none !important'}
	]);
	
}

function navSecItemTextAlign(type){
	refreshNavSecItemText();
	onStyleChange();
}

function navSecItemTextSizeChange(e) {
	refreshNavSecItemText();
	onStyleChange();
}

function navSecItemTextBoldCheck(e){
	refreshNavSecItemText();
	onStyleChange();
}

function navSecItemTextFamilyChange(e){
	refreshNavSecItemText();
	onStyleChange();
	
	//2015-11-01 统计site字体使用频率 
	Site && Site.logFontFamilyUse && Site.logFontFamilyUse($('#navSecItemTextFamily').val());
}

function navSecItemHoverTextSizeChange(e) {
	refreshNavSecItemHoverText();
	onStyleChange();
}

function navSecItemHoverTextBoldCheck(e){
	refreshNavSecItemHoverText();
	onStyleChange();
}

function navSecItemHoverTextFamilyChange(e){
	refreshNavSecItemHoverText();
	onStyleChange();
}


//点击预览
function view(fileId){
	var url = "../view.jsp?fileID="+fileId;
	window.open(url);
}

//恢复默认
function resetDefault(){

	Site.resetNavStyleDefault(true);
	document.location.reload();
	onStyleChange();
	
}

//分页ID
function initPageNo(id){
	var p_id = 0;
	for(var i=0; i<templateList.length; i++){
		var v_id = templateList[i].id;
		if(v_id === id){
			break;
		}
		p_id ++;
	}
	return p_id;
}	

//样式
function initNavSystem(){
	var navSys = top._navStyleData.s;
	if (Fai.isNull(navSys)) {
		navSys = 0;
	}
	tabSystem(navSys, Fai.top._navStyleIsDefault);
	//当前显示页
	var currentPage = Math.floor(initPageNo(g_arrayPagenation[0])/g_pagecount) + 1;
	setPage(currentPage);
	var isBroad = false;
	$.each(templateList,function(i,t){
		if( t.id === navSys && t.screenType === 1 ){
			isBroad = true;
			return false;
		}
	});
	checkBroadAction( isBroad );
}

function tabSystem(id, isDefault){
	$('#styleSettingFrame').find('.styleBlockSet').each(function(index, element) {
        if($(this).hasClass('panelChecked')){
			$(this).removeClass('panelChecked');
		}
    });
	$('#styleSettingFrame').find('.vipBottom').each(function(index, element) {
        if($(this).hasClass('vipBottomShow')){
			$(this).removeClass('vipBottomShow');
		}
    });
	$('#tabPattern' + id).parent().addClass('panelChecked');
	$('#vipBottom' + id).addClass('vipBottomShow');
	
	var navStyle = Fai.top.$("#nav");
	//判断模板是否是免费版
	if(!navStyle.hasClass('navStyle') && id != 0){
		navStyle.addClass('navStyle');
	}
	if(id == 0 && navStyle.hasClass('navStyle')){
		navStyle.removeClass('navStyle');
	}
		
	//重置
	if(id == 0 && (top._templateType == siteTemplateFree && isDefault)){
		//在IE6下面会有异常，设置定时器解决IE6下的BUG
		if(Fai.isIE6()){
			setTimeout(function(){
				navStyle.removeClass('navStyle');
			}, 10);
		}else{
			navStyle.removeClass('navStyle');
		}
	}
	if(g_arrayPattern.length > 0){
		navStyle.removeClass(g_arrayPattern.pop());
	}

	if(g_arrayPagenation.length > 0){
		g_arrayPagenation.pop();
	}

	if(id != 0){
		g_arrayPattern.push('navStyle' + id);
	}
	g_arrayPagenation.push(id);
	
	if (g_initing) {
		return;
	}
	
	if(!allowedPattern && (top._templateType == siteTemplateFree && !isDefault)){
		navStyle.removeClass('navStyle');
		Fai.ing("此为网站标准版功能，您可以先选择付费主题，再进行试用。", true);
		return;
	}
	if(id != 0 && (top._templateLayout == 2 || top._templateLayout == 3 || top._templateLayout == 4 || 
	top._templateLayout == 5 || top._templateLayout == 6)) {
		navStyle.removeClass('navStyle');
		Fai.ing("当前主题不支持使用系统样式，请切换主题再试用。", true);
		return;
	}

	if(top.$("link[href='${ctx_web}/css/navStyle0.min.css?v=201508252108']").length == 0 && id<60 && id>0 ){
		top.$('<link type="text/css" href="${ctx_web}/css/navStyle0.min.css?v=201508252108" rel="stylesheet">').appendTo(top.$("head"));
	}
	if(top.$("link[href='${ctx_web}/css/navStyle1.min.css?v=201506011730']").length == 0 && id>59){
		top.$('<link type="text/css" href="${ctx_web}/css/navStyle1.min.css?v=201506011730" rel="stylesheet">').appendTo(top.$("head"));
	}
	var navStyleName = g_arrayPattern.toString();
	navStyle.addClass(navStyleName);
	if(Fai.isIE6()){
		//IE6
		setTimeout(function(){
			Fai.refreshClass(navStyle);
		}, 10);
	}
	top._navStyleData.s = id;
	if((((Fai.top._templateFrame >= 4001 && Fai.top._templateFrame <= 4006) || 
		(Fai.top._templateFrame >= 24001 && Fai.top._templateFrame <= 24006)) && Fai.top._navStyleData.s == 0) ||
		((Fai.top._navStyleData.s >= 46 && Fai.top._navStyleData.s <= 50) || 
		(Fai.top._navStyleData.s >= 64 && Fai.top._navStyleData.s <= 68))
	){
		Site.autoNavItemCenterBgSize();
	}else if(top._navStyleData.nis.h != -1 && top._navStyleData.nib.y != 2){
		Site.setNavItemCenterBgSize();
	}
	
	var isBroad = false;
	$.each(templateList,function(i,t){
		if( t.id === id && t.screenType === 1 ){
			isBroad = true;
			return false;
		}
	});
	checkBroadAction( isBroad );
	onStyleChange();
}

function checkBroadAction( isBroad ){
	if( isBroad ){
		//设置“导航宽度”为默认
		changeNavWidth(0, isBroad);
		//隐藏导航宽度设置
		$("#navWidthItem").hide();
		//设置“内容区宽度”为默认并且disabled 默认和自定义选项
		//这里内容区要恢复默认。否则拖拽普通导航改变宽度时再切换宽屏导航然后再切换回普通导航时会有表现不一致的问题。内容区宽度会比导航区还要大。      //不过貌似正常操作也可以操作出内容区比导航区大的BUG。所以这个不算BUG，不处理这里
		//changeContentWidth(0);
		
		//限制导航位置 水平方向
		top._navStyleData.ncp.l = 0;
		$("#navCntPositionLeftInput").val(0).attr( "disabled", true );
		$("#navCntPositionDefault").hide();
		$("#navCntPositionDefaultLabel").hide();
		//移动nav的位置到webNav上 , add class, set top
		changeWidthComm( isBroad );
		var webNav = top.$("#webNav");
		top._navStyleData.ncp.t = top.$("#nav").position().top;
		$("#navCntPositionTopInput").val(top._navStyleData.ncp.t);
		
		$("#navCntPositionFix")[0].click();
		
		//移除webNav的webNavDefault
		if(webNav.hasClass("webNavDefault")){
			webNav.removeClass("webNavDefault");
		}
		//修改了nav的top left 调整一下展示
		onNavCntPositionChange();
	}else{
		//$("#navWidthDefault").removeAttr("disabled");
		//$("#navWidthFix").removeAttr("disabled");
		//显示导航宽度设置
		$("#navWidthItem").show();
		//$("#contentWidthDefault").removeAttr("disabled");
		//$("#contentWidthFix").removeAttr("disabled");
		
		$("#navCntPositionLeftInput").removeAttr("disabled");
		//$("#contentCntPositionLeftInput").removeAttr("disabled");
		
		$("#navCntPositionDefault").show();
		$("#navCntPositionDefaultLabel").show();
		
		//移动nav的位置到headerNav上 , remove class
		top.Site.WebNavAppendToNav();
		var webNav = top.$("#webNav");
		
		if(parseInt(top._wideNav) !== 1 && !webNav.hasClass("webNavDefault")){
			webNav.addClass("webNavDefault");
		}
	}
	top.Site.absoluteNavDraggableAndResize( Fai.top._templateLayout, isBroad );
}

var filterResult = templateList;//显示的图片集合
var g_pageno = 1;//第一页
var g_pagecount = 6;//每一页显示的条目
var g_total = templateList.length;//总的条目
//总的页数
var g_totalPage = Math.ceil(g_total/g_pagecount); 

function resetPage(){
	g_total = filterResult.length;//总的条目
	g_totalPage = Math.ceil(g_total/g_pagecount); 
	setPage(1);
}
//创建
function addDiv(template) {
	var divClick = g_arrayPagenation[0];
	if(!template){
		return;
	}
	var id = template.id, styleName = template.styleName, debug = template.debug;
	
	var addDivString = '<div class="styleBlockSet pointer '+(divClick == id ? 'panelChecked' : '')+'" onclick="tabSystem('+id+')">'+
						'<div class="styleImageFrame" id="tabPattern'+id+'" style="background-image:url(${ctx_web}/image/imageNavStyle/'+parseInt(id)+'.jpg);"></div>'+
						'<div class="vipBottom '+(divClick == id ? 'vipBottomShow' : '')+'" id="vipBottom'+id+'"><div class="vipBottomDiv"></div><div class="vipBottomDivStyle">'+( debug ? '设计中' : styleName)+'</div></div>'+
						'</div>';
	addDivString = $(addDivString).hover(function(){
						$(this).children('.vipBottom')[0].style.display = 'block';
						$(this).addClass('systemPatternHover');
					},function(){
						$(this).children('.vipBottom')[0].style.display = 'none';
						$(this).removeClass('systemPatternHover');
					});
	$("#styleSettingFrame").append(addDivString);
	
}
function setPage(pageno) {
	//后退
	if (pageno == -1) {
		g_pageno--;
	}
	//前进 
	else if (pageno == -2) {
		g_pageno++;
	} 
	//具体页数
	else {
		g_pageno = pageno;
	}
	//已经是第一页
	if (g_pageno <= 0) {
		g_pageno = 1;
	}
	//已经是最后一页
	if (g_pageno > g_totalPage) {
		g_pageno = g_totalPage;
	}
	pageno = g_pageno;
	
	//每次重置showContentResult的DIV
	$("#styleSettingFrame").html("");
	//每次显示六个DIV
	for(var i = (pageno-1)*g_pagecount; i<pageno*g_pagecount;i++){
		if(i == g_total){
			break;
		}
		addDiv(filterResult[i]);
	}
	//分页的标签
	var paginationTag = $(' <div class="page">'+
							   '<table class="pageMar"><tr><td align="center">'+
								   '<a href="javascript:;" id="turnLeft" class="leftclass" onclick="setPage(-1)"></a>'+
								   '<a href="javascript:;" id="turnRight" class="rightclass" onClick="setPage(-2)"></a>'+
							   '</td></tr></table>'+
						 '</div>');
	$("#styleSettingFrame").append(paginationTag);
	//动态添加分页号数
	for(var j=g_totalPage;j>0;j--){
		var pageNum = $('<a href="javascript:;" onClick="setPage(' + j + ')" id="link'+j+'">'+j+'</a>');
		
		$("#turnLeft").after(pageNum);
		if(j!=pageno){
			$("#link"+j).hover(function(){
					$(this).addClass("aHover");
				},function(){
					$(this).removeClass("aHover");
			});
		}
		
		//当前显示页数的样式
		if(j==pageno){
			var link = $("#link"+j);
			link.css("color","#666");
			link.css("cursor","default");
			link.removeAttr("onclick");
			link.css("background-image","url(${ctx_web}/image/hover.gif)");
			link.css("background-position","-138px 2px");
		}
		//第一页
		if(g_pageno==1){
			var turnLeft = $("#turnLeft");
			turnLeft.css("cursor","default");
			turnLeft.css("color","#356ca4");
			turnLeft.removeAttr("onclick");
		}else{
			$("#turnLeft").hover(function(){
					$(this).addClass("lHover");
				},function(){
					$(this).removeClass("lHover");
			});
		}
		//最后一页
		if(g_pageno == g_totalPage){
			var turnRight = $("#turnRight");
			turnRight.css("cursor","default");
			turnRight.css("color","#356ca4");
			turnRight.removeAttr("onclick");
		}else{
			$("#turnRight").hover(function(){
					$(this).addClass("rHover");
				},function(){
					$(this).removeClass("rHover");
			});
		}
	}
}
//查询
function queryPatternColorType(color) {
	queryPattern(color,g_selectScreen);
}
function queryPatternScreenType(screen) {
	queryPattern(g_selectColor,screen);
}
function queryPattern(_color,_screen) {

	g_selectColor = _color;
	g_selectScreen = _screen;
	
	
	$('.js_colora').removeClass('selecton');
	$('.js_screena').removeClass('selecton');
	$('#cid'+_color).addClass('selecton');
	$('#sid'+_screen).addClass('selecton');

	var  tmpResult = templateList;
	if(_color != 0){
		tmpResult = [];
		var power = 0;
		var checkFlag;
		for(var i = 0; i < 32; i++){
			checkFlag = 0x1 << i;
			if(checkFlag == _color) {
				power = i;
				break;
			}
		}
		for(var i = 0; i < templateList.length; i++){
			var colorType = templateList[i].colorType;
			if( $.flag(colorType, power) ) {
				tmpResult.push(templateList[i]);
			}
		}
	}
	filterResult = tmpResult;
	if( _screen !== "" && tmpResult.length > 0 ){
		filterResult=[];
		for(var i = 0; i < tmpResult.length; i++){
			var screenType = tmpResult[i].screenType;
			if( parseInt(_screen) === screenType ){
				filterResult.push( tmpResult[i] );
			}
		}
	}
	resetPage();
}

/* 有二级菜单时不可点击 */
function initNavFirstItemNoClick(){
	if(top._navItemOnCkOpen && ( allowedStyle || (top._templateType != siteTemplateFree) ) ){
		$('#navNoClick')[0].click();
	}
}
function navFirstItemNoClick(){
	
	var itemList = top.$('#nav').find('.item');
	if( $('#navNoClick').prop('checked') ) {
		$.each(itemList, function(i, n){
			var colId = $(n).attr('colid');
			var menuData = Fai.top['nav' + colId + 'SubMenu'];
			if( menuData.length > 0) {
				$(n).removeAttr('onclick');
				$(n).css('cursor', 'default');
				$(n).find('a').css('cursor', 'default');
			}
			$.each( menuData, function(j, m) {
				if( m.disable == null ) {
					return;
				}
				m.disable = true;
			});
		})
		top._navItemOnCkOpen = true;	
	} else {
		$.each(itemList, function(i, n){
			var colId = $(n).attr('colid');
			var menuData = Fai.top['nav' + colId + 'SubMenu'];
			if( menuData.length > 0) {
				$(n).attr('onclick', $(n).attr('_jump'));
				$(n).css('cursor', 'pointer');
				$(n).find('a').css('cursor', 'pointer');
			}
			$.each( menuData, function(j, m) {
				if( m.disable == null ) {
					return;
				}
				m.disable = false;
			});
		})
		top._navItemOnCkOpen = false;	
	}
	onStyleChange();
}
function initNavPositionFixTop(){
	if(top._navPositionFixTop){
		$('#keepNavFixTop')[0].click();
	}
}
function keepNavFixTop(){
	var nav = Fai.top.$("#nav");
	if( $('#keepNavFixTop').prop('checked') ){
		Fai.top.Site.onNavCntPositionFixTop();
		top._navPositionFixTop = true;
		top._navStyleData.ncp.f = true;
	} else {
		Fai.top.$("#g_main").off("scroll.nav");
		Fai.top.$(window).off("resize.nav");
		nav.removeClass("navfixtop");
		top._navStyleData.ncp.f = false;
		top._navPositionFixTop = false;
	}
	onStyleChange();
}

//透明度设置
function initNavSecItemOpacity(){
	var opacityBarOptions = { 
				initStartIndex:parseInt(top._navStyleData.nsiho), 
						initStart: 0, 
					   endStart: 90,
					  refreshFn:refreshOpacity,
			  styleChangeFn:onStyleChange
		};
	$('#opacityBar').initSlider(opacityBarOptions);
}

function refreshOpacity(opacity){
	top._navStyleData.nsiho = parseInt( opacity );
	var realOpacityForIE = 100 - top._navStyleData.nsiho;
	var realOpacity = (realOpacityForIE / 100).toFixed(2);
	Site.setNavSecItemOpacity(realOpacity, realOpacityForIE);
}
</script>


</head>
<body class="popupTabBody">
<div class="ui-tabs ui-widget ui-widget-content ui-corner-all" id="tabs">
	<!--tabs title-->
	<ul class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all">
    	<li class="ui-state-default ui-corner-top ui-tabs-selected ui-state-active"><a href="#styleSetting" _sid="0">样式</a></li>
        <li class="ui-state-default ui-corner-top"><a _sid="1" href="#basicSetting">导航</a></li>
        <li class="ui-state-default ui-corner-top"><a _sid="2" href="#contentSetting">内容区</a></li>
        <li class="ui-state-default ui-corner-top"><a _sid="3" href="#navSetting">栏目项</a></li>
        <li class="ui-state-default ui-corner-top"><a _sid="4" href="#secondaryMenuSetting">二级菜单</a></li>
	</ul>
    <!--// end tabs title-->
	
    <!--systemStyleSetting-->
    <div id="styleSetting" class="settingPanel ui-tabs-panel ui-widget-content ui-corner-bottom" style="height: 260px;">
    	<div id="systemTabTypeChange" class="clear itemlist2">
			<div class="systemPatternTypeChange">
	        	<span class="systemPatternTypeChangeTitle"> 颜色
					<div class="systemPatternTypeChangeTitleIco"></div>
				</span>
				<a href="javascript:void(0)" id="cid0" onclick="javascript:queryPatternColorType('0')" class="js_colora selecton">全部</a>
				<a href="javascript:void(0)" class="js_colora allco" id="cid1" onclick="javascript:queryPatternColorType('1')">棕黑</a>
				<a href="javascript:void(0)" class="js_colora allco" id="cid2" onclick="javascript:queryPatternColorType('2')">银灰</a>
				<a href="javascript:void(0)" class="js_colora allco" id="cid4" onclick="javascript:queryPatternColorType('4')">蓝调</a>
				<a href="javascript:void(0)" class="js_colora allco" id="cid8" onclick="javascript:queryPatternColorType('8')">青绿</a>
				<a href="javascript:void(0)" class="js_colora allco" id="cid16" onclick="javascript:queryPatternColorType('16')">红紫</a>
				<a href="javascript:void(0)" class="js_colora allco" id="cid32" onclick="javascript:queryPatternColorType('32')">黄橙</a>
	            <span class="systemPatternTypeChangeTitle"> 类型
					<div class="systemPatternTypeChangeTitleIco"></div>
				</span>
            	<a href="javascript:void(0)" id="sid" onclick="javascript:queryPatternScreenType('')" class="js_screena selecton">全部</a>
                <a href="javascript:void(0)" id="sid1" onclick="javascript:queryPatternScreenType('1')" class="js_screena">宽屏</a>
                <a href="javascript:void(0)" id="sid0" onclick="javascript:queryPatternScreenType('0')" class="js_screena">普通</a>
			</div>
        </div> 
    	<div id="styleSettingFrame" class="styleFrame" style="height: 155px; margin-top: 20px;"><div class="styleBlockSet pointer panelChecked" onclick="tabSystem(0)"><div class="styleImageFrame" id="tabPattern0" style="background-image:url(${ctx_web}/image/imageNavStyle/0.jpg);"></div><div style="display: none;" class="vipBottom vipBottomShow" id="vipBottom0"><div class="vipBottomDiv"></div><div class="vipBottomDivStyle">默认</div></div></div><div class="styleBlockSet pointer" onclick="tabSystem(43)"><div class="styleImageFrame" id="tabPattern43" style="background-image:url(${ctx_web}/image/imageNavStyle/43.jpg);"></div><div style="display: none;" class="vipBottom " id="vipBottom43"><div class="vipBottomDiv"></div><div class="vipBottomDivStyle">N043</div></div></div><div class="styleBlockSet pointer" onclick="tabSystem(44)"><div class="styleImageFrame" id="tabPattern44" style="background-image:url(${ctx_web}/image/imageNavStyle/44.jpg);"></div><div style="display: none;" class="vipBottom " id="vipBottom44"><div class="vipBottomDiv"></div><div class="vipBottomDivStyle">N044</div></div></div><div class="styleBlockSet pointer" onclick="tabSystem(45)"><div class="styleImageFrame" id="tabPattern45" style="background-image:url(${ctx_web}/image/imageNavStyle/45.jpg);"></div><div style="display: none;" class="vipBottom " id="vipBottom45"><div class="vipBottomDiv"></div><div class="vipBottomDivStyle">N045</div></div></div><div class="styleBlockSet pointer" onclick="tabSystem(46)"><div class="styleImageFrame" id="tabPattern46" style="background-image:url(${ctx_web}/image/imageNavStyle/46.jpg);"></div><div style="display: none;" class="vipBottom " id="vipBottom46"><div class="vipBottomDiv"></div><div class="vipBottomDivStyle">N046</div></div></div><div class="styleBlockSet pointer" onclick="tabSystem(47)"><div class="styleImageFrame" id="tabPattern47" style="background-image:url(${ctx_web}/image/imageNavStyle/47.jpg);"></div><div style="display: none;" class="vipBottom " id="vipBottom47"><div class="vipBottomDiv"></div><div class="vipBottomDivStyle">N047</div></div></div><div class="page"><table class="pageMar"><tbody><tr><td align="center"><a style="cursor: default; color: rgb(53, 108, 164);" href="javascript:;" id="turnLeft" class="leftclass"></a><a style="color: rgb(102, 102, 102); cursor: default; background-image: url(&quot;${ctx_web}/image/hover.gif&quot;); background-position: -138px 2px;" href="javascript:;" id="link1">1</a><a class="" href="javascript:;" onclick="setPage(2)" id="link2">2</a><a href="javascript:;" onclick="setPage(3)" id="link3">3</a><a href="javascript:;" onclick="setPage(4)" id="link4">4</a><a class="" href="javascript:;" onclick="setPage(5)" id="link5">5</a><a class="" href="javascript:;" onclick="setPage(6)" id="link6">6</a><a href="javascript:;" onclick="setPage(7)" id="link7">7</a><a href="javascript:;" onclick="setPage(8)" id="link8">8</a><a href="javascript:;" onclick="setPage(9)" id="link9">9</a><a href="javascript:;" onclick="setPage(10)" id="link10">10</a><a href="javascript:;" onclick="setPage(11)" id="link11">11</a><a href="javascript:;" onclick="setPage(12)" id="link12">12</a><a class="" href="javascript:;" onclick="setPage(13)" id="link13">13</a><a class="" href="javascript:;" onclick="setPage(14)" id="link14">14</a><a href="javascript:;" id="turnRight" class="rightclass" onclick="setPage(-2)"></a></td></tr></tbody></table></div></div>
    </div>
    <!--end     systemStyleSetting-->
    
	<!--导航项-->
	<div id="basicSetting" class="settingPanel ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide">
    	
        <!--文字:栏目导航普通文字-->

		<div class="itemlist">
			<div class="title">文字：</div>
			<div class="left">
				<input checked="checked" id="navText0" name="navText" onclick="changeNavTextType(0)" type="radio"/><label for="navText0">默认</label>
				<input class="freeDisableOld" id="navText1" name="navText" onclick="changeNavTextType(1)" type="radio"/><label for="navText1">自定义</label>
			</div>
		</div>

		<div style="display: none;" class="navTextCus itemlist">
        	<div class="title">&nbsp;</div>
			<div class="title2">大小：</div>
			<div class="left">
				<select id="navTextSize" onchange="navTextSizeChange(this);">
					<option selected="selected" value="12">12</option>
					<option value="13">13</option>
					<option value="14">14</option>
					<option value="15">15</option>
					<option value="16">16</option>
					<option value="17">17</option>
					<option value="18">18</option>
					<option value="19">19</option>
					<option value="20">20</option>
					<option value="21">21</option>
					<option value="22">22</option>
					<option value="23">23</option>
					<option value="24">24</option>
					<option value="25">25</option>
					<option value="26">26</option>
					<option value="27">27</option>
					<option value="28">28</option>
					<option value="29">29</option>
					<option value="30">30</option>
				</select>
			</div>

			<div class="title left">加粗：</div>
			<div class="left"><input id="navTextBold" onclick="navTextBoldCheck(this);" type="checkbox"/></div>
		</div>

		<div style="display: none;" class="navTextCus itemlist">
        	<div class="title">&nbsp;</div>
			<div class="title2">样式：</div>
			<div class="left">
				<select id="navTextFamily" onchange="navTextFamilyChange(this);">
	                <option selected="selected" value="SimSun">宋体</option>
	                <option value="PMingLiU">新细明体</option>
	                <option value="FangSong_GB2312">仿宋_GB2312</option>
	                <option value="微软雅黑">微软雅黑</option>
	                <option value="隶书">隶书</option>
	                <option value="幼圆">幼圆</option>
	                <option value="STKaiti">华文楷体</option>
	                <option value="方正舒体">方正舒体</option>
	                <option value="华文彩云">华文彩云</option>
	                <option value="华文行楷">华文行楷</option>
	                <option value="华文宋体">华文宋体</option>
	                <option value="楷体,楷体_GB2312, SimKai">楷体</option>
	                <option value="黑体, SimHei">黑体</option>
	                <option value="Arial">Arial</option>
	                <option value="Tahoma">Tahoma</option>
	                <option value="impact">impact</option>
	                <option value="Arial Serif">Arial Serif</option>
	                <option value="Georgia">Georgia</option>
	                <option value="Garamond">Garamond</option>
	                <option value="Times New Roman">Times New Roman</option>
	                <option value="andale mono">andale mono</option>
	                <option value="arial black,avant garde">arial black</option>
	               	<option value="comic sans ms">comic sans ms</option>
				</select>
			</div>
		</div>

		<div style="display: none;" class="navTextCus itemlist">
        	<div class="title">&nbsp;</div>
			<div class="title2">颜色：</div>
			<div class="left">
				<div style="background-color: rgb(0, 0, 0);" id="navTextColorPicker" class="colorPicker"></div>
			</div>
		</div>
        <!--//end 栏目导航普通文字-->
        
        <!--文字:栏目导航高亮文字-->
		<div style="display: none;" class="navHoverTextCus itemlist">
        	<div class="title">&nbsp;</div>
			<div class="title2">选中：</div>
			<div class="left">
				<div style="background-color: rgb(0, 0, 0);" id="navHoverTextColorPicker" class="colorPicker"></div>
			</div>
		</div>
        <!--//end 栏目导航高亮文字-->
        
        <!--导航宽度-->
		<div class="itemlist" id="navWidthItem">
			<div class="title">宽度：</div>
			<div class="left">
				<input checked="checked" id="navWidthDefault" name="navWidthCheck" onclick="changeNavWidth(0)" type="radio"/><label for="navWidthDefault">默认</label>
				<input class="freeDisable" id="navWidthFix" name="navWidthCheck" onclick="changeNavWidth(1)" type="radio"/><label for="navWidthFix">自定义</label>
				<input class="freeDisable input" id="navWidthInput" style="width: 50px; display: none;" onkeyup="onNavWidthChange()" onchange="onNavWidthChange()" onkeypress="javascript:return Fai.isNumberKey(event);" type="text"/>
			</div>
		</div>
        <!--//end 导航宽度-->
        
        <!--导航高度-->
		<div class="itemlist">
			<div class="title">高度：</div>
			<div class="left">
				<input checked="checked" id="navHeightDefault" name="navHeightCheck" onclick="changeNavHeight(0)" type="radio"/><label for="navHeightDefault">默认</label>
				<input class="freeDisable" id="navHeightFix" name="navHeightCheck" onclick="changeNavHeight(1)" type="radio"/><label for="navHeightFix">自定义</label>
				<input class="freeDisable input" id="navHeightInput" style="width: 50px; display: none;" onkeyup="onNavHeightChange()" onchange="onNavHeightChange()" onkeypress="javascript:return Fai.isNumberKey(event);" type="text"/>
			</div>
		</div>
        <!--//end 导航高度-->
        
        <!--栏目导航位置-->
        <div class="itemlist">
        	<div class="title">位置：</div>
			<div class="left">
				<input checked="checked" id="navCntPositionDefault" name="navCntPositionCheck" onclick="changeNavCntPosition(0)" type="radio"/><label id="navCntPositionDefaultLabel" for="navCntPositionDefault">默认</label>
				<input class="freeDisable" id="navCntPositionFix" name="navCntPositionCheck" onclick="changeNavCntPosition(1)" type="radio"/><label for="navCntPositionFix">自定义</label>
			</div>
        </div>
        
		<div style="display: none;" id="navCntPositionPanel" class="itemlist">
			<div class="title">&nbsp;</div>
			<div class="left">
				左：<input id="navCntPositionLeftInput" maxlength="4" style="width:30px;" class="input" onkeyup="onNavCntPositionChange()" onchange="onNavCntPositionChange()" onkeypress="javascript:return Fai.isNumberKey(event, true);" type="text"/>
             	上：<input id="navCntPositionTopInput" maxlength="4" style="width:30px;" class="input" onkeyup="onNavCntPositionChange()" onchange="onNavCntPositionChange()" onkeypress="javascript:return Fai.isNumberKey(event, true);" type="text"/>
			</div>
		</div>
        <!--//end 栏目导航位置-->

        <!--栏目导航条背景-->
		<div class="itemlist">
			<div class="title">背景：</div>
			<div class="left">
				<input checked="checked" id="navBg0" name="navBg" onclick="changeNavBgType(0)" type="radio"/><label for="navBg0">默认</label>
				<input class="freeDisableOld" id="navBg1" name="navBg" onclick="changeNavBgType(1)" type="radio"/><label for="navBg1">隐藏</label>
				<input class="freeDisable" id="navBg2" name="navBg" onclick="changeNavBgType(2)" type="radio"/><label for="navBg2">自定义</label>
			</div>
		</div>		

		<div style="display: none;" class="navBgCus itemlist">
        	<div class="title">&nbsp;</div>
			<div class="title2">颜色：</div>
			<div class="left">
				<div style="background-color: rgb(0, 0, 0);" id="navBgColorPicker" class="colorPicker"></div>
			</div>
		</div>

		<div style="display: none;" class="navBgCus itemlist disabled">
        	<div class="title">&nbsp;</div>
			<div class="title2">图片：</div>
			<div class="left">
				<div class="left"><input id="navBgFileButton" class="faiButton" value="添加图片" type="button"/></div>
                <div id="uploadmsg1" class="uploadmsg"></div>
			</div>
		</div>
    
		<div style="display: none;" class="navBgCus itemlist">
        	<div class="title">&nbsp;</div>
			<div class="title2">图片平铺：</div>
			<select class="left" id="navBgRepeat" onchange="navBgRepeatChange(this);">
				<option value="-1">不使用背景图片</option>
				<option selected="selected" value="0">不平铺（居中）</option>
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
        <!--//end 栏目导航条背景-->

		<div class="itemlist">
			<div class="title">导航栏目：</div>
			<div class="left">
				<input id="keepNavFixTop" name="keepNavFixTop" onclick="keepNavFixTop()" type="checkbox"/><label id="keepNavFixTopLabel" for="keepNavFixTop">固定在顶部</label>
			</div>
		</div>
	</div>
    <!--//end 导航项-->

    <!--内容项-->
	<div id="contentSetting" class="settingPanel ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide">

        <!--内容宽度-->
		<div class="itemlist">
			<div class="title">宽度：</div>
			<div class="left">
				<input checked="checked" id="contentWidthDefault" name="contentWidthCheck" onclick="changeContentWidth(0)" type="radio"/><label for="contentWidthDefault">默认</label>
				<input class="freeDisable" id="contentWidthFix" name="contentWidthCheck" onclick="changeContentWidth(1)" type="radio"/><label for="contentWidthFix">自定义</label>
				<input class="freeDisable input" id="contentWidthInput" style="width: 50px; display: none;" onkeyup="onContentWidthChange()" onchange="onContentWidthChange()" onkeypress="javascript:return Fai.isNumberKey(event);" type="text"/>
			</div>
		</div>
        <!--//end 内容宽度-->
        
        <!--内容高度-->
		<div class="itemlist">
			<div class="title">高度：</div>
			<div class="left">
				<input checked="checked" id="contentHeightDefault" name="contentHeightCheck" onclick="changeContentHeight(0)" type="radio"/><label for="contentHeightDefault">默认</label>
				<input class="freeDisable" id="contentHeightFix" name="contentHeightCheck" onclick="changeContentHeight(1)" type="radio"/><label for="contentHeightFix">自定义</label>
				<input class="freeDisable input" id="contentHeightInput" style="width: 50px; display: none;" onkeyup="onContentHeightChange()" onchange="onContentHeightChange()" onkeypress="javascript:return Fai.isNumberKey(event);" type="text"/>
			</div>
		</div>
        <!--//end 内容高度-->
        
        <!--栏目内容位置-->
        <div class="itemlist">
        	<div class="title">位置：</div>
			<div class="left">
				<input checked="checked" id="contentCntPositionDefault" name="contentCntPositionCheck" onclick="changeContentCntPosition(0)" type="radio"/><label for="contentCntPositionDefault">默认</label>
				<input class="freeDisable" id="contentCntPositionFix" name="contentCntPositionCheck" onclick="changeContentCntPosition(1)" type="radio"/><label for="contentCntPositionFix">自定义</label>
			</div>
        </div>
        
		<div style="display: none;" id="contentCntPositionPanel" class="itemlist">
			<div class="title">&nbsp;</div>
			<div class="left">
				左：<input id="contentCntPositionLeftInput" maxlength="4" style="width:30px;" class="input" onkeyup="onContentCntPositionChange()" onchange="onContentCntPositionChange()" onkeypress="javascript:return Fai.isNumberKey(event, true);" type="text"/>
				上：<input id="contentCntPositionTopInput" maxlength="4" style="width:30px;" class="input" onkeyup="onContentCntPositionChange()" onchange="onContentCntPositionChange()" onkeypress="javascript:return Fai.isNumberKey(event, true);" type="text"/>
			</div>
		</div>
        <!--//end 栏目内容位置-->

        <!--栏目内容背景-->
		<div class="itemlist">
			<div class="title">背景：</div>
			<div class="left">
				<input checked="checked" id="contentBg0" name="contentBg" onclick="changeContentBgType(0)" type="radio"/><label for="contentBg0">默认</label>
				<input class="freeDisableOld" id="contentBg1" name="contentBg" onclick="changeContentBgType(1)" type="radio"/><label for="contentBg1">隐藏</label>
				<input class="freeDisable" id="contentBg2" name="contentBg" onclick="changeContentBgType(2)" type="radio"/><label for="contentBg2">自定义</label>
			</div>
		</div>

		<div style="display: none;" class="contentBgCus itemlist">
        	<div class="title">&nbsp;</div>
			<div class="title2">颜色：</div>
			<div class="left">
				<div style="background-color: rgb(0, 0, 0);" id="contentBgColorPicker" class="colorPicker"></div>
			</div>
		</div>

		<div style="display: none;" class="contentBgCus itemlist disabled">
        	<div class="title">&nbsp;</div>
			<div class="title2">图片：</div>
			<div class="left">
				<div class="left"><input id="contentBgFileButton" class="faiButton" value="添加图片" type="button"/></div>
                <div id="contentuploadmsg1" class="uploadmsg"></div>
			</div>
		</div>
    
		<div style="display: none;" class="contentBgCus itemlist">
        	<div class="title">&nbsp;</div>
			<div class="title2">图片平铺：</div>
			<select class="left" id="contentBgRepeat" onchange="contentBgRepeatChange(this);">
				<option value="-1">不使用背景图片</option>
				<option selected="selected" value="0">不平铺（居中）</option>
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
        <!--//end 栏目内容背景-->
        
	</div>
    <!--//end 导航项-->
    
	<!--栏目项-->
	<div id="navSetting" class="settingPanel ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide">

        <!--栏目项宽度-->
		<div class="itemlist">
			<div class="title">宽度：</div>
			<div class="left">
				<input checked="checked" id="navItemWidthDefault" name="navItemWidthCheck" onclick="changeNavItemWidth(0)" type="radio"/><label for="navItemWidthDefault">默认</label>
				<input class="freeDisable" id="navItemWidthFix" name="navItemWidthCheck" onclick="changeNavItemWidth(1)" type="radio"/><label for="navItemWidthFix">自定义</label>
				<input class="freeDisable input" id="navItemWidthInput" style="width: 50px; display: none;" onkeyup="onNavItemWidthChange()" onchange="onNavItemWidthChange()" onkeypress="javascript:return Fai.isNumberKey(event);" type="text"/>
			</div>
		</div>
        <!--//end 栏目项宽度-->
        
        <!--栏目项高度-->
		<div class="itemlist">
			<div class="title">高度：</div>
			<div class="left">
				<input checked="checked" id="navItemHeightDefault" name="navItemHeightCheck" onclick="changeNavItemHeight(0)" type="radio"/><label for="navItemHeightDefault">默认</label>
				<input class="freeDisable" id="navItemHeightFix" name="navItemHeightCheck" onclick="changeNavItemHeight(1)" type="radio"/><label for="navItemHeightFix">自定义</label>
				<input class="freeDisable input" id="navItemHeightInput" style="width: 50px; display: none;" onkeyup="onNavItemHeightChange()" onchange="onNavItemHeightChange()" onkeypress="javascript:return Fai.isNumberKey(event);" type="text"/>
			</div>
		</div>
        <!--//end 栏目项高度-->
    
        <!--栏目项背景-->
		<div class="itemlist">
			<div class="title">背景：</div>
			<div class="left">
				<input checked="checked" id="navItemBg0" name="navItemBg" onclick="changeNavItemBgType(0)" type="radio"/><label for="navItemBg0">默认</label>
				<input class="freeDisableOld" id="navItemBg1" name="navItemBg" onclick="changeNavItemBgType(1)" type="radio"/><label for="navItemBg1">隐藏</label>
				<input class="freeDisable" id="navItemBg2" name="navItemBg" onclick="changeNavItemBgType(2)" type="radio"/><label for="navItemBg2">自定义</label>
			</div>
		</div>

		<div style="display: none;" class="navItemBgCus itemlist">
        	<div class="title">&nbsp;</div>
			<div class="title2">颜色：</div>
			<div class="left">
				<div style="background-color: rgb(0, 0, 0);" id="navItemBgColorPicker" class="colorPicker"></div>
			</div>
		</div>

		<div style="display: none;" class="navItemBgCus itemlist">
        	<div class="title">&nbsp;</div>
			<div class="title2">图片：</div>
			<div class="left">
				<div class="left"><input id="navItemBgFileButton" class="faiButton" value="添加图片" type="button"/></div>
                <div id="uploadmsg2" class="uploadmsg"></div>
			</div>
		</div>
    
		<div style="display: none;" class="navItemBgCus itemlist">
        	<div class="title">&nbsp;</div>
			<div class="title2">图片平铺：</div>
			<select class="left" id="navItemBgRepeat" onchange="navItemBgRepeatChange(this);">
				<option value="-1">不使用背景图片</option>
				<option selected="selected" value="0">不平铺（居中）</option>
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
        <!--//end 栏目项背景-->
    
        <!--栏目选中项高亮背景-->
		<div class="itemlist">
			<div class="title">鼠标移入背景：</div>
			<div class="left">
				<input id="navItemHoverBg0" name="navItemHoverBg" onclick="changeNavItemHoverBgType(0)" type="radio"/><label for="navItemHoverBg0">默认</label>
				<input checked="checked" class="freeDisableOld" id="navItemHoverBg1" name="navItemHoverBg" onclick="changeNavItemHoverBgType(1)" type="radio"/><label for="navItemHoverBg1">隐藏</label>
				<input class="freeDisable" id="navItemHoverBg2" name="navItemHoverBg" onclick="changeNavItemHoverBgType(2)" type="radio"/><label for="navItemHoverBg2">自定义</label>
			</div>
		</div>

		<div style="display: none;" class="navItemHoverBgCus itemlist">
        	<div class="title">&nbsp;</div>
			<div class="title2">颜色：</div>
			<div class="left">
				<div style="background-color: rgb(0, 0, 0);" id="navItemHoverBgColorPicker" class="colorPicker"></div>
			</div>
		</div>

		<div style="display: none;" class="navItemHoverBgCus itemlist disabled">
        	<div class="title">&nbsp;</div>
			<div class="title2">图片：</div>
			<div class="left">
				<div class="left"><input id="navItemHoverBgFileButton" class="faiButton" value="添加图片" type="button"/></div>
                <div id="uploadmsg3" class="uploadmsg"></div>
			</div>
		</div>
    
		<div style="display: none;" class="navItemHoverBgCus itemlist">
        	<div class="title">&nbsp;</div>
			<div class="title2">图片平铺：</div>
			<select class="left" id="navItemHoverBgRepeat" onchange="navItemHoverBgRepeatChange(this);">
				<option value="-1">不使用背景图片</option>
				<option selected="selected" value="0">不平铺（居中）</option>
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
        <!--//end 栏目选中项高亮背景-->
        
        <!--栏目项分隔宽高度-->
        <div class="itemlist">
        	<div class="title">项间隔：</div>
			<div class="left">
				<input checked="checked" id="navItemSpacingWidthDefault" name="navItemSpacingWidthCheck" onclick="changeNavItemSpacingWidth(0)" type="radio"/><label for="navItemSpacingWidthDefault">默认</label>
				<input class="freeDisableOld" id="navItemSpacingWidthHide" name="navItemSpacingWidthCheck" onclick="changeNavItemSpacingWidth(1)" type="radio"/><label for="navItemSpacingWidthHide">隐藏</label>
				<input class="freeDisable" id="navItemSpacingWidthFix" name="navItemSpacingWidthCheck" onclick="changeNavItemSpacingWidth(2)" type="radio"/><label for="navItemSpacingWidthFix">自定义宽高</label>
				<div style="display: none;" id="navItemSpacingSizeInput">
                    宽：<input class="freeDisable input" id="navItemSpacingWidthInput" maxlength="4" style="width:50px;" onkeyup="onNavItemSpacingWidthChange()" onchange="onNavItemSpacingWidthChange()" onkeypress="javascript:return Fai.isNumberKey(event);" type="text"/>
                    高：<input class="freeDisable input" id="navItemSpacingHeightInput" maxlength="4" style="width:50px;" onkeyup="onNavItemSpacingHeightChange()" onchange="onNavItemSpacingHeightChange()" onkeypress="javascript:return Fai.isNumberKey(event);" type="text"/>
                </div>
			</div>
        </div>
        <!--//end 栏目项分隔宽高度-->
        
        <!--栏目项分隔背景-->
        <div class="itemlist">
			<div class="title">项间隔背景：</div>
			<div class="left">
				<input checked="checked" id="navItemSpacingBg0" name="navItemSpacingBg" onclick="changeNavItemSpacingBgType(0)" type="radio"/><label for="navItemSpacingBg0">默认</label>
				<input class="freeDisableOld" id="navItemSpacingBg1" name="navItemSpacingBg" onclick="changeNavItemSpacingBgType(1)" type="radio"/><label for="navItemSpacingBg1">隐藏</label>
				<input class="freeDisable" id="navItemSpacingBg2" name="navItemSpacingBg" onclick="changeNavItemSpacingBgType(2)" type="radio"/><label for="navItemSpacingBg2">自定义</label>
			</div>
        </div>
        
		<div style="display: none;" class="navItemSpacingBgCus itemlist">
        	<div class="title">&nbsp;</div>
			<div class="title2">颜色：</div>
			<div class="left">
				<div style="background-color: rgb(0, 0, 0);" id="navItemSpacingBgColorPicker" class="colorPicker"></div>
			</div>
		</div>

		<div style="display: none;" class="navItemSpacingBgCus itemlist disabled">
        	<div class="title">&nbsp;</div>
			<div class="title2">图片：</div>
			<div class="left">
				<div class="left"><input id="navItemSpacingBgFileButton" class="faiButton" value="添加图片" type="button"/></div>
                <div id="uploadmsg4" class="uploadmsg"></div>
			</div>
		</div>
    
		<div style="display: none;" class="navItemSpacingBgCus itemlist">
        	<div class="title">&nbsp;</div>
			<div class="title2">图片平铺：</div>
			<select class="left" id="navItemSpacingBgRepeat" onchange="navItemSpacingBgRepeatChange(this);">
				<option value="-1">不使用背景图片</option>
				<option selected="selected" value="0">不平铺（居中）</option>
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
        <!--//end 栏目项分隔背景-->
    
    </div>
    <!--//end 栏目项-->
    
    <!--二级菜单-->
    <div id="secondaryMenuSetting" class="settingPanel ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide" style="position:relative;">

        <!--文字:二级菜单普通文字-->
		<div class="itemlist">
			<div class="title">文字：</div>
			<div class="left">
				<input checked="checked" id="navSecItemText0" name="navSecItemText" onclick="changeNavSecItemTextType(0)" type="radio"/><label for="navSecItemText0">默认</label>
				<input class="freeDisableOld" id="navSecItemText1" name="navSecItemText" onclick="changeNavSecItemTextType(1)" type="radio"/><label for="navSecItemText1">自定义</label>
			</div>
		</div>

		<div style="display: none;" class="navSecItemTextCus itemlist">
        	<div class="title">&nbsp;</div>
			<div class="title2">大小：</div>
			<div class="left">
				<select id="navSecItemTextSize" onchange="navSecItemTextSizeChange(this);">
					<option selected="selected" value="12">12</option>
					<option value="13">13</option>
					<option value="14">14</option>
					<option value="15">15</option>
					<option value="16">16</option>
					<option value="17">17</option>
					<option value="18">18</option>
					<option value="19">19</option>
					<option value="20">20</option>
					<option value="21">21</option>
					<option value="22">22</option>
					<option value="23">23</option>
					<option value="24">24</option>
					<option value="25">25</option>
					<option value="26">26</option>
					<option value="27">27</option>
					<option value="28">28</option>
					<option value="29">29</option>
					<option value="30">30</option>
				</select>
			</div>

			<div class="title left">加粗：</div>
			<div class="left"><input id="navSecItemTextBold" onclick="navSecItemTextBoldCheck(this);" type="checkbox"/></div>
		</div>

		<div style="display: none;" class="navSecItemTextCus itemlist">
        	<div class="title">&nbsp;</div>
			<div class="title2">样式：</div>
			<div class="left">
				<select id="navSecItemTextFamily" onchange="navSecItemTextFamilyChange(this);">
	                <option selected="selected" value="SimSun">宋体</option>
	                <option value="PMingLiU">新细明体</option>
	                <option value="FangSong_GB2312">仿宋_GB2312</option>
	                <option value="微软雅黑">微软雅黑</option>
	                <option value="隶书">隶书</option>
	                <option value="幼圆">幼圆</option>
	                <option value="STKaiti">华文楷体</option>
	                <option value="方正舒体">方正舒体</option>
	                <option value="华文彩云">华文彩云</option>
	                <option value="华文行楷">华文行楷</option>
	                <option value="华文宋体">华文宋体</option>
	                <option value="楷体,楷体_GB2312, SimKai">楷体</option>
	                <option value="黑体, SimHei">黑体</option>
	                <option value="Arial">Arial</option>
	                <option value="Tahoma">Tahoma</option>
	                <option value="impact">impact</option>
	                <option value="Arial Serif">Arial Serif</option>
	                <option value="Georgia">Georgia</option>
	                <option value="Garamond">Garamond</option>
	                <option value="Times New Roman">Times New Roman</option>
	                <option value="andale mono">andale mono</option>
	                <option value="arial black,avant garde">arial black</option>
	                <option value="comic sans ms">comic sans ms</option>
				</select>
			</div>
		</div>

		<div style="display: none;" class="navSecItemTextCus itemlist">
        	<div class="title">&nbsp;</div>
			<div class="title2">颜色：</div>
			<div class="left">
				<div style="background-color: rgb(0, 0, 0);" id="navSecItemTextColorPicker" class="colorPicker"></div>
			</div>
		</div>
        <!--//end 二级菜单普通文字-->
        
        <!--文字:二级菜单高亮文字-->
		<div style="display: none;" class="navSecItemHoverTextCus itemlist">
        	<div class="title">&nbsp;</div>
			<div class="title2">选中：</div>
			<div class="left">
				<div style="background-color: rgb(0, 0, 0);" id="navSecItemHoverTextColorPicker" class="colorPicker"></div>
			</div>
		</div>
        <!--end 二级菜单高亮文字-->
        
        <!--文字:二级菜单文字对齐方式-->
		<div style="display: none;" class="navSecItemHoverTextCus itemlist">
        	<div class="title">&nbsp;</div>
			<div class="title2">对齐方式：</div>
			<div class="left">
				<input checked="checked" id="navSecItemTextCenter" name="nsitRadio" onclick="navSecItemTextAlign(0)" type="radio"/><label for="navSecItemTextCenter">居中</label>
                <input id="navSecItemTextLeft" name="nsitRadio" onclick="navSecItemTextAlign(1)" type="radio"/><label for="navSecItemTextLeft">靠左</label>
			</div>
		</div>
        <!--end 二级菜单文字对齐方式-->
    
        <!--二级菜单宽度-->
		<div class="itemlist">
			<div class="title">宽度：</div>
			<div class="left">
				<input checked="checked" id="navSecItemWidthDefault" name="navSecItemWidthCheck" onclick="changeNavSecItemWidth(0)" type="radio"/><label for="navSecItemWidthDefault">默认</label>
				<input class="freeDisable" id="navSecItemWidthFix" name="navSecItemWidthCheck" onclick="changeNavSecItemWidth(1)" type="radio"/><label for="navSecItemWidthFix">自定义</label>
				<input class="freeDisable input" id="navSecItemWidthInput" style="width: 50px; display: none;" onkeyup="onNavSecItemWidthChange()" onchange="onNavSecItemWidthChange()" onkeypress="javascript:return Fai.isNumberKey(event);" type="text"/>
			</div>
		</div>
        <!--//end 二级菜单宽度-->
        
        <!--二级菜单高度-->
		<div class="itemlist">
			<div class="title">高度：</div>
			<div class="left">
				<input checked="checked" id="navSecItemHeightDefault" name="navSecItemHeightCheck" onclick="changeNavSecItemHeight(0)" type="radio"/><label for="navSecItemHeightDefault">默认</label>
				<input class="freeDisable" id="navSecItemHeightFix" name="navSecItemHeightCheck" onclick="changeNavSecItemHeight(1)" type="radio"/><label for="navSecItemHeightFix">自定义</label>
				<input class="freeDisable input" id="navSecItemHeightInput" style="width: 50px; display: none;" onkeyup="onNavSecItemHeightChange()" onchange="onNavSecItemHeightChange()" onkeypress="javascript:return Fai.isNumberKey(event);" type="text"/>
			</div>
		</div>
        <!--//end 二级菜单高度-->
        
        <!--二级菜单背景-->
		<div class="itemlist">
			<div class="title">背景：</div>
			<div class="left">
				<input checked="checked" id="navSecItemBg0" name="navSecItemBg" onclick="changeNavSecItemBgType(0)" type="radio"/><label for="navSecItemBg0">默认</label>
				<input class="freeDisableOld" id="navSecItemBg1" name="navSecItemBg" onclick="changeNavSecItemBgType(1)" type="radio"/><label for="navSecItemBg1">隐藏</label>
				<input class="freeDisable" id="navSecItemBg2" name="navSecItemBg" onclick="changeNavSecItemBgType(2)" type="radio"/><label for="navSecItemBg2">自定义</label>
			</div>
		</div>

		<div style="display: none;" class="navSecItemBgCus itemlist">
        	<div class="title">&nbsp;</div>
			<div class="title2">颜色：</div>
			<div class="left">
				<div style="background-color: rgb(0, 0, 0);" id="navSecItemBgColorPicker" class="colorPicker"></div>
			</div>
		</div>

		<div style="display: none;" class="navSecItemBgCus itemlist disabled">
        	<div class="title">&nbsp;</div>
			<div class="title2">图片：</div>
			<div class="left">
				<div class="left"><input id="navSecItemBgFileButton" class="faiButton" value="添加图片" type="button"/></div>
                <div id="uploadmsg5" class="uploadmsg"></div>
			</div>
		</div>
    
		<div style="display: none;" class="navSecItemBgCus itemlist">
        	<div class="title">&nbsp;</div>
			<div class="title2">图片平铺：</div>
			<select class="left" id="navSecItemBgRepeat" onchange="navSecItemBgRepeatChange(this);">
				<option value="-1">不使用背景图片</option>
				<option selected="selected" value="0">不平铺（居中）</option>
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
        <!--//end 二级菜单背景-->
        
        <!--二级菜单高亮背景-->
		<div class="itemlist">
			<div class="title">鼠标移入背景：</div>
			<div class="left">
				<input checked="checked" id="navSecItemHoverBg0" name="navSecItemHoverBg" onclick="changeNavSecItemHoverBgType(0)" type="radio"/><label for="navSecItemHoverBg0">默认</label>
				<input class="freeDisableOld" id="navSecItemHoverBg1" name="navSecItemHoverBg" onclick="changeNavSecItemHoverBgType(1)" type="radio"/><label for="navSecItemHoverBg1">隐藏</label>
				<input class="freeDisable" id="navSecItemHoverBg2" name="navSecItemHoverBg" onclick="changeNavSecItemHoverBgType(2)" type="radio"/><label for="navSecItemHoverBg2">自定义</label>
			</div>
		</div>

		<div style="display: none;" class="navSecItemHoverBgCus itemlist">
        	<div class="title">&nbsp;</div>
			<div class="title2">颜色：</div>
			<div class="left">
				<div style="background-color: rgb(0, 0, 0);" id="navSecItemHoverBgColorPicker" class="colorPicker"></div>
			</div>
		</div>

		<div style="display: none;" class="navSecItemHoverBgCus itemlist disabled">
        	<div class="title">&nbsp;</div>
			<div class="title2">图片：</div>
			<div class="left">
				<div class="left"><input id="navSecItemHoverBgFileButton" class="faiButton" value="添加图片" type="button"/></div>
                <div id="uploadmsg6" class="uploadmsg"></div>
			</div>
		</div>
    
		<div style="display: none;" class="navSecItemHoverBgCus itemlist">
        	<div class="title">&nbsp;</div>
			<div class="title2">图片平铺：</div>
			<select class="left" id="navSecItemHoverBgRepeat" onchange="navSecItemHoverBgRepeatChange(this);">
				<option value="-1">不使用背景图片</option>
				<option selected="selected" value="0">不平铺（居中）</option>
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
        <!--//end 二级菜单高亮背景-->
        <!--二级菜单 透明度-->
		<div class="itemlist" style="position:relative;">
			<div class="title">透明度：</div>
			<div id="opacityBar" style="position:absolute;top:0;left:110px;"><div class="slider_outside"><div class="slider_stay"><div class="slider_move ui-draggable" style="position: absolute; left: 0px;"></div></div><div class="slider_value">0%</div></div></div>		
		</div>
        <!--//end 二级菜单 透明度-->
        <!--二级菜单 导航栏目点击设置-->
		<div class="itemlist">
			<div class="title">导航栏目：</div>
			<div class="left">
				<input id="navNoClick" class="freeDisable" onclick="navFirstItemNoClick();" type="checkbox"/><label for="navNoClick" style="cursor:pointer;">有下级菜单时不可点击</label>
			</div>
		</div>
        <!--//end 二级菜单 一级栏目点击设置-->
    </div>
    <!--//end 二级菜单-->
    
</div>

</body></html>