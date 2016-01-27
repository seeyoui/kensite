<%@ page language="java" pageEncoding="UTF-8"%> <%@ include
file="/WEB-INF/view/taglib/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" class="g_htmlManage">

<head>
<title>智慧星河</title>
<%@ include file="/WEB-INF/view/taglib/header.jsp"%>
<meta name="renderer" content="webkit" />
<meta name="mobile-agent"
	content="format=html5;url=http://m.seeyoui.icoc.in/" />
<link href="${ctx_web}/css/manage.css" rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="${ctx_web}/js/comm/jquery/jquery-core.min.js?v=201503161711"></script>
<script type="text/javascript"
	src="${ctx_web}/js/comm/fai.min.js?v=201512071738"></script>
<script type="text/javascript"
	src="${ctx_web}/js/comm/jquery/jquery-ui-core.min.js?v=201511231730"></script>
<script type="text/javascript"
	src="${ctx_web}/js/comm/pinyin.min.js?v=201306041217"></script>
<script type="text/javascript"
	src="${ctx_web}/js/comm/faiui.min.js?v=201601111801"></script>
<script type="text/javascript"
	src="${ctx_web}/js/site.min.js?v=201601131153"></script>
<script type="text/javascript"
	src="${ctx_web}/js/manage.min.js?v=201601121610"></script>
<script type="text/javascript">
	try {
		Fai.top = parent.Fai.top;
	} catch (e) {
	}
	</script>
<link type="text/css" href="${ctx_web}/css/tip-yellowsimple.css"
	rel="stylesheet" />
<link type="text/css" href="${ctx_web}/css/styleTemplate.css"
	rel="stylesheet" />
<script type="text/javascript">
var usedArray=[];
var showTips = false;
var initing = true;
var newTemplateIdList = [{"id":475},{"id":487},{"id":478},{"id":429},{"id":531},{"id":428},{"id":514},{"id":489},{"id":461}];
var isNewUser = false;
var isShowTempTip = true;
var scrollScreenNum = 0;
var nowTempPosition = 0;
var nowTempId = "";
var tempTipInterValObj;
// 键盘 charcode
// left: 37, up: 38, right: 39, down: 40,
// spacebar: 32, pageup: 33, pagedown: 34, end: 35, home: 36
var keys = [32, 33, 34, 35, 36, 37, 38, 39, 40];
var inscroll = false;
var colorcheck = '<div class="innerColorChecked"></div>'

var oldThemesOpen = false;
var hoverTemplate = 0;

//保存最近试用的模板信息
function recentUsed(id){
	var item;

	for(var i = usedArray.length;i--;){
		var n = usedArray[i];
		if( n == id || n === +n )
			usedArray.splice(i,1);
	}
	usedArray.push(id);

	if(usedArray.length > 20)
		usedArray.shift();

	var cookietext = usedArray.join(",");

	//重写cookies
	$.cookie('recentTemplate',cookietext,{ expires: 30});
}


var demoTemplate = false;
var filter = {};
filter.colorType = 0;		// 过滤颜色
filter.tplType = -1;		// 过滤模板类型
filter.screen = -1;			// 过滤模板版式
var firstShow = true;
var usedTemplateClass = []; //记录所有hover过的主题（色调）

function changeTemplate(ctrl,type) {
	
	Site.showSalePromotionDl(Site.salePromotionDetail.salePromotionParam);
	
	var ctrl = $(ctrl);
	var	id = ctrl.attr('id')||'';
	var frameCss = id.replace(/[^\d]/g, "");

	//手动点击时，有选中效果的不能再点击
	if (type==="colorClick" && frameCss == top._templateFrame) {
		return true;
	}
	if(ctrl.length > 0 && (type==="colorClick" || type==="reColoClick")){
		// 全新主题 颜色块点击
		// 新选中效果
		var wrapThemebord = ctrl.parent();
		var wrapitem = wrapThemebord.parent();
		var wrapitemImg = wrapitem.find(".previewImg");   //quickDressTemplateItem

		
		$('.quickDressTemplateItem').removeClass("panelChecked");
		$('.themesColor').removeClass("themesColorChecked");
		ctrl.addClass("themesColorChecked");
		wrapitem.addClass("panelChecked");

		if( type!=="reColoClick" ){
			$(".vipBottom").hide();
		}
		ctrl.parent().show();
		ctrl.parent().prev().show();

		//替换外部属性

		wrapitem.attr("id",ctrl.attr("id").replace("color",""));
		wrapitem.attr("color",ctrl.attr("color"));
		wrapitem.attr("_tkey",ctrl.attr("_tkey"));
		wrapitem.attr("_path",ctrl.attr("_path"));
		wrapitem.attr("_widenav",ctrl.attr("_widenav"));
		wrapitem.attr("_layout",ctrl.attr("_layout"));
		wrapitem.attr("tpl",ctrl.attr("tpl"));
		wrapitem.attr("_bannerid",ctrl.attr("_bannerid"));
		wrapitem.attr("_screen",ctrl.attr("_screen"));

		wrapitemImg.attr("src",ctrl.attr("_pvimg"));
		wrapitemImg.attr("data-original",ctrl.attr("_pvimg"));

		$('.innerColorChecked').remove();
		ctrl.append(colorcheck);
	}else {
		// 选中效果
		var allPanel = ctrl.siblings();
		allPanel.removeClass('panelChecked');
		allPanel.find('.vipBottom').hide();
		ctrl.addClass('panelChecked');
		var vb = ctrl.find('.vipBottom');
		vb.show();
		
		//如果是新版主题 细节处理,优化
		$('.innerColorChecked').remove();
		$('.themesColor').removeClass("themesColorChecked");

		if(ctrl.attr("_tpltype")==="1"){
			ctrl.find(".newThemebord").find(".themesColor[_tkey='t" + frameCss +"']").addClass('themesColorChecked').append(colorcheck);
		}
		//ctrl.find('.themesFrameId').show();
		
		//添加上themesColorChecked后调整themesColor
		adjustThemesColor( vb );
	}

	var layout = ctrl.attr("_layout");
	var wideNav = ctrl.attr("_widenav");
	var frameType = ctrl.attr("tpl");
	var path = ctrl.attr("_path");
	var bannerId = ctrl.attr("_bannerId");
	var bannerWeight = ctrl.attr("_bannerWeight");
	
	if( type != "hover" ){
		//写入缓存 number,最近使用的主题
		recentUsed(frameCss);
		top._templateChanged++;
	}

	if (!demoTemplate && type!=="hover" && type!=="reColoClick" ) {
		Site.logClick(9, frameCss);
	}

	// banner add class
	updateBannerClass(frameCss);
	

	/*先把header的background:none;置空，再由css或者更换banner的时候写入banner*/
	//top.$("#header").css("background", "");
	var obj = '';
	var objStyle = '';
	/***************处理corp title ***************/
	obj = top.$('#corpTitle');
	objStyle = obj.attr('style');
	if( objStyle ) {
		obj.removeCss(["top", "left"]);
		if (objStyle == "" || objStyle == null) {
			obj.removeAttr("style");
		}
		top._titleChanged ++;
		top._titleData.t = -1;
		top._titleData.l = -1;
		if (top._useTemplateTitle) {
			top._templateTitleData.t = -1;
			top._templateTitleData.l = -1;
		}
	}
	//主标题
	obj = top.$('#subTitle');
	objStyle =obj.attr('style');
	if( objStyle ) {
		obj.removeCss(["color", "font-weight", "font-size", "font-family", "font-style", "text-decoration"]);
		if (objStyle == "" || objStyle == null) {
			obj.removeAttr("style");
		}
		top._titleChanged ++;
		top._titleData.st.y = 0;
		top._titleData.st.f = "";
		top._titleData.st.s = 0;
		top._titleData.st.w = 0;
		top._titleData.st.c ="";
		top._titleData.st.i = 0;
		top._titleData.st.u = 0;
		if (top._useTemplateTitle) {
			top._templateTitleData.st.y = 0;
			top._templateTitleData.st.f = "";
			top._templateTitleData.st.s = 0;
			top._templateTitleData.st.w = 0;
			top._templateTitleData.st.c ="";
			top._templateTitleData.st.i = 0;
			top._templateTitleData.st.u = 0;
		}
	}
	//副标题
	obj = top.$('#primaryTitle');
	objStyle =obj.attr('style');
	if( objStyle ) {
		obj.removeCss(["color", "font-weight", "font-size", "font-family", "font-style", "text-decoration"]);
		if (objStyle == "" || objStyle == null) {
			obj.removeAttr("style");
		}
		top._titleChanged ++;
		top._titleData.fp = false;
		top._titleData.f = "";
		top._titleData.s = -1;
		top._titleData.w = -1;
		top._titleData.c ="";
		top._titleData.i = 0;
		top._titleData.u = 0;
		if (top._useTemplateTitle) {
			top._templateTitleData.fp = false;
			top._templateTitleData.f = "";
			top._templateTitleData.s = -1;
			top._templateTitleData.w = -1;
			top._templateTitleData.c ="";
			top._templateTitleData.i = 0;
			top._templateTitleData.u = 0;
		}
	}

	/***************end of 处理corp title ***************/

		// 处理localer
	obj = top.$('#localer');
	if (obj.attr('style')) {
		obj.removeCss(["top", "left", "color", "font-weight", "font-size", "font-family", "bottom", "left"]);
		obj.find('a .text').attr('style', '');

		if (obj.attr('style') == "" || obj.attr('style') == null) {
			obj.removeAttr("style");
		}

		top._localeChanged ++;
		top._localeData.fp = false;
		top._localeData.t = -1;
		top._localeData.l = -1;
		top._localeData.f = "";
		top._localeData.s = -1;
		top._localeData.w = -1;
		top._localeData.c ="";
		if (top._useTemplateLocale) {
			top._templateLocaleData.fp = false;
			top._templateLocaleData.t = -1;
			top._templateLocaleData.l = -1;
			top._templateLocaleData.f = "";
			top._templateLocaleData.s = -1;
			top._templateLocaleData.w = -1;
			top._templateLocaleData.c ="";
		}
	}

	// 处理logo
	obj = top.$("#logo");
	if (obj.attr("style")) {
		obj.removeCss(["top", "left"]);
		if (obj.attr("style") == "" || obj.attr("style") == null) {
			obj.removeAttr("style");
		}

		top._logoChanged ++;
		top._logoData.t = -1;
		top._logoData.l = -1;
		if (top._useTemplateLogo) {
			top._templateLogoData.t = -1;
			top._templateLogoData.l = -1;
		}
	}

	//切换模板即切换banner
	if (top._bannerData.s == 0) {
		top._bannerChanged ++;
	}

	// 加载时加入popupBg背景,load 完毕后去掉popupBg。remove popupBG 的操作放在 siteTemplateChange.src.js 里边。
	if( top.$('#changeTemplatePopupBg').length <= 0){
		var ifrHeight = document.body.clientHeight;
		var popupBgHeight = top.document.body.clientHeight - document.body.clientHeight;
		var tabsWrapHeight = top.$('.tabsWrap').height();
		var topPos = ifrHeight +  tabsWrapHeight;
		var arr = [];
		//背景色定为白色
		arr.push("<div style='background-color:#fff;filter:alpha(opacity=0);opacity:0.0;height:"+ popupBgHeight +"px;top:"+ topPos +"px;' class='popupBg' id='changeTemplatePopupBg'><\/div>");
		arr.push("<table cellspacing='0' cellpadding='0' class='changeTemplateLoadingTable' style='height:"+ popupBgHeight +"px;top:"+ topPos +"px;' id='changeTemplateLoadingTable'><tbody><tr><td class='loadingImgTd'>");
		arr.push("<div class='ajaxLoading2' style='margin:0 auto;'></div>");
		arr.push("</td></tr></tbody></table>");
		top.$('body').append(arr.join(""));
		m = {
			"background-color" : "#7f7f7f",
			"filter" : "alpha(opacity=30)",
			"opacity" : "0.3",
			"transition-property" : "border-color,filter,opacity",
			"transition-duration" : "5s",
			"transition-timing-function" : "linear",
			"-webkit-transition-property" : "border-color,filter,opacity",
			"-webkit-transition-duration" : "5s",
			"-webkit-transition-timing-function" : "linear",
			"-moz-transition-property" : "border-color,filter,opacity",
			"-moz-transition-duration" : "5s",
			"-moz-transition-timing-function" : "linear"
			/*
			"-webkit-transition" : " background 5s linear",
			"-moz-transition" : "background 5s linear",
			"transition" : "background-color 5s linear"
			*/
		};
		top.$("#changeTemplatePopupBg").css( m );
	}
	
	top.$("#templateFrame").attr("href", path);
	if( type != "hover" ){
		top._templateFrame = frameCss;
		top._templateType = frameType;
		top._templateBannerId = bannerId;
		top._templateBannerWeight = bannerWeight;	
	}
	if (Fai.isIE6()) {
		Fai.refreshClass(top.$('.form .formBanner'));
	}
	if (top._bannerData.s != 0) {
		top.$("#banner").css("background", "none");
	}

	// change layout js
	top.Site.initTemplateLayout(layout);
	top._wideNav = wideNav;
	if (top._templateLayout != layout) {

		top._templateLayout = layout;

		var layoutLeft = 1;
		var layoutRight = 3;

		if (layout == 2 ||
				layout == 3 ||
				layout == 4 ||
				layout == 5 ||
				layout == 7) {

			// 只是界面上隐藏，这样下次在此打开这个区域时还有数据
			Site.hideLayout(layoutRight, true);
			Site.showLayout(layoutLeft);
		} else if (layout == 8) {

			// 只是界面上隐藏，这样下次在此打开这个区域时还有数据
			Site.hideLayout(layoutLeft, true);
			Site.showLayout(layoutRight);
		} else {
			// 其他版式，根据左右区域是否有模块，来展开和收起   注：(会员中心 切换模板 左区域无论是否有模块都隐藏)
			if (Site.isLayoutEmpty(layoutLeft) || top._colId == 24) {
				Site.hideLayout(layoutLeft);
			} else {
				Site.showLayout(layoutLeft);
			}
			if (Site.isLayoutEmpty(layoutRight)) {
				Site.hideLayout(layoutRight);
			} else {
				Site.showLayout(layoutRight);
			}
		}
		Fai.top._layoutChanged ++;
		Site.displayAddModule();
	}
	Site.styleChanged();
	
	Site.refreshAllAbsForms();

	//切换风格后加载执行
	top.$("#siteTemplateChange").remove();
	top.$("head").append("<script id='siteTemplateChange' src='${ctx_web}/js/siteTemplateChange.min.js?v=201409221731" + Math.random() + "' type='text/javascript' ><\/script>");

	// 切换风格后，设置顶部样式还原为默认
	//Site.autoHeaderTopHeight();
	//Site.removeHeaderBg();
	if (type=="hover" ){
		//log dbg site-hover切换主题
		Site.logDog(100091, 10000 + parseInt(frameCss));
	}else if( type!=="reColoClick" ){
		//log dbg site-网站设计-网站主题点击
		Site.logDog(100040, 10000 + parseInt(frameCss));
	}
	
	if(!Fai.top.faiFloatPanelReady){
		//如果浮动设置面板未加载，则执行以下操作
		Site.resetBackgroundStyleDefault(false);
	}
	Site.triggerGobalEvent("changeTemplateType","");
	Site.setRefreshInfo("siteTemp", true);
	
	//切换主题scrollTop
	Fai.top.$('#g_main').scrollTop('0px');
	
	//设置有限循环，更新banner边缘区域，防止样式渲染不及时造成边缘计算失误
	var intervalNum = 0;
	var edgeWidth = 0;
	var $edge = Fai.top.$("#banner").find(".defaultBannerEdgeRight");
	var bannerInterval = setInterval(function(){
		edgeWidth = $edge.width();
		Site.refreshDefaultBannerEdge();
		if(edgeWidth == $edge.width()){
			intervalNum += 1;
		}else{
			intervalNum += 0.5;
		}
		
		if(intervalNum > 5){
			clearInterval(bannerInterval);
		}
	}, 100);
	
	// 动态改变详情页促销活动相应颜色
	setTimeout(function(){
	   Site.changeSaleColor();
	},200);
	
}

function updateBannerClass(frameCss){
	var $banner = Fai.top.$('#banner');
	var $bannerMain = $banner.find(".defaultBannerMain");
	var bannerMainFlag = false;
	var k,len;
	if($bannerMain.length > 0){
			bannerMainFlag = true;
	}

	for(k = 0, len = usedTemplateClass.length; k < len; k++){
		$banner.removeClass('banner' + usedTemplateClass[k] + '_0');
		if(bannerMainFlag){
			$bannerMain.removeClass('banner' + usedTemplateClass[k] + '_0');
		}
	}
	
	$banner.removeClass('banner' + top._templateFrame + '_0');
	$banner.addClass('banner' + frameCss + '_0');
	if(bannerMainFlag){
		$bannerMain.removeClass('banner' + top._templateFrame + '_0');
		$bannerMain.addClass('banner' + frameCss + '_0');
	}
	
	usedTemplateClass.length = 0;
	usedTemplateClass.push( frameCss );
}

function cloneChoice(cloner){
	var id = $(cloner).attr("id").replace("copy-","");
	$(".cloneOn").removeClass("cloneOn");
	$(cloner).addClass("cloneOn");

	isColor = /color/g.test(id);
	
	changeTemplate($("#" + id).get(0),isColor?"colorClick":"");
}

function changeTemplateColor(color){
	if (!initing){
		switch (color) {
			case 0 : Site.logDog(100040, 1); break;
			case 1 : Site.logDog(100040, 2); break;
			case 2 : Site.logDog(100040, 3); break;
			case 4 : Site.logDog(100040, 4); break;
			case 8 : Site.logDog(100040, 5); break;
			case 32 : Site.logDog(100040, 6); break;
			case 64 : Site.logDog(100040, 7); break;
			case 16 : Site.logDog(100040, 8); break;
			default : break;
		}
	}
	var items = $(".quickDressTemplateItem[_tpltype='0']");
	$('#searchPanel').scrollTop(0);
	$(".searchClone").remove();
	filter.colorType = color;
	if ( $('#templateSearch').val() != "" ) {
		items.each(function(){
			var colorTmp = parseInt($(this).attr('color'));
			if ( (filter.colorType != 0) && (colorTmp & filter.colorType) == 0 ) {
				$(this).hide();
				return;
			}
			$(this).show();
		});
		filter.tplType = -1;
		$('#typeCheck').combobox("setInitVal", "全部", -1);
		$('#typeCheck2').combobox("setInitVal", "全部", -1);
		filter.screen = -1;
		$('.tplTypeMenu:first').addClass("tplTypeMenuOn");
		$('.screenMenu:first').addClass("screenMenuOn");
	} else {
		items.each(function(){
			var colorTmp = parseInt($(this).attr('color'));
			var tplTmpType = parseInt($(this).attr('tpl'));
			var screenTmp = parseInt($(this).attr('_screen'));
			if (((filter.tplType != -1) && (tplTmpType != filter.tplType)) || ((filter.colorType != 0) && (colorTmp & filter.colorType) == 0) || ((filter.screen != -1) && (screenTmp != filter.screen))) {
				$(this).hide();
				return;
			}
			$(this).show();
		});
	}
	// search clear
	var clearSearch = $('#clearSearch');
	if( clearSearch.hasClass('find') ){
		clearSearch.removeClass('find').addClass('unfind').removeAttr('title');
	}
	$('#templateSearch').val('');

	// 绑定延时加载
	lazyloadPreImg();
}

function getRecenVipBottom( id ){
	var tid = id.replace(/[^\d]/g, "");
	var vipBottomHtm = "<div class='vipBottom' style='display: block;'>[编号：T" + tid + "]</div>";
	return vipBottomHtm;
}

//最近试用过的模板
function recentTemplate(){

	Site.logDog(100040, 23);
	$(".searchClone").remove();
	$('#searchPanel').scrollTop(0);

	var items = $(".quickDressTemplateItem");

	tabCheck($('#latelyUse'));
	$('#panelMenu').hide();
	$('#panelMenuNull').show();

	 //Clone 主题逻辑
	 $(".recentUsedClone").remove();

	 for(var index = usedArray.length; index--; ){
		var id   = usedArray[index];
		var item = $("#item"+id);
		var prevImgSrc = item.find(".previewImg").attr("data-original");
		
		if(!item.length){
		 //新版主题
		 item = $("#coloritem"+id);
		 prevImgSrc = item.attr("_pvimg");
		}
		var _ttype = parseInt(item.attr("_ttype"));
		var ticon = getTemplateIcon( _ttype );
		
		var cloneOn      = id==top._templateFrame?"cloneOn":""
		var recentId     = item.attr("id");
		if( typeof recentId === 'undefined' ){
			continue; 
		}
		var vipBottomHtm = "";
		if( id==top._templateFrame ){
		 var tid = recentId.replace(/[^\d]/g, "");
		 vipBottomHtm = "<div class='vipBottom' style='display: block;'>[编号：T" + tid + "]</div>";
		}
		var template =   '<div id="copy-'+ recentId +'" class="recentUsedClone '+ cloneOn +'">'
					+ '   <div class="previewImgDiv">'
					+ '     <div class="innerImgDiv">'
					+ '         <img class="previewImg" src="'+ prevImgSrc +'" width="130" height="68" style="display: inline;">'
					+ '     </div>'
					+ '   </div>'
					+ '<div class=' + ticon + '></div>'
					+ vipBottomHtm
					+ '</div>';
		$('#searchPanel').append(template);
	 }
	 /* for(var c = usedArray.length;c--;){

	 }*/

	 $('.quickDressTemplateItem').hide();
	 $(".recentUsedClone").show();

	// 绑定延时加载
	lazyloadPreImg();
}

function getTemplateIcon( type ){
	if(false){
		switch(type){
			case 0:
				return "new_primaryIcon";
			case 1:
				return "new_intermediateIcon";
		}
	}
	return "";
}

function changeTemplateType(item){
	if (!initing){
		switch (item.key) {
			case -1: Site.logDog(100040, 11); break;
			case 0: Site.logDog(100040, 12); break;
			case 1: Site.logDog(100040, 13); break;
			case 3: Site.logDog(100040, 14); break;
			default : break;
		}
	}
	var whoInOpen = whoInOpened();
	var tpltype;
	var items;
	switch(whoInOpen){
		case "newThemes" : tpltype="1"; break;
		case "oldThemes" : tpltype="0"; break;
		default : break;
	}

	if(tpltype === "1"){
		items = $(".quickDressTemplateItem[_tpltype='1']");
	}else if(tpltype === "0"){
		items = $(".quickDressTemplateItem[_tpltype='0']");
	}


	$(".searchClone").remove();
	filter.tplType = item.key;
	if ( $('#templateSearch').val() != "" ) {
		items.each(function(){
			var tplTmpType = parseInt($(this).attr('tpl'));
			if ( (filter.tplType != -1) && (tplTmpType != filter.tplType) ) {
				$(this).hide();
				return;
			}
			$(this).show();
		});
		filter.colorType = 0;
		filter.screen = -1;
		$('.colorMenu:first').addClass("colorMenuOn");
		$('.screenMenu:first').addClass("screenMenuOn");
	} else {
		items.each(function(){
			var tplTmpType = parseInt($(this).attr('tpl'));
			var colorTmp = parseInt($(this).attr('color'));
			var screenTmp = parseInt($(this).attr('_screen'));
			if (((filter.tplType != -1) && (tplTmpType != filter.tplType)) || ((filter.colorType != 0) && (colorTmp & filter.colorType) == 0) || ((filter.screen != -1) && (screenTmp != filter.screen)) ) {
				$(this).hide();
				return;
			}
			$(this).show();
		});
	}

	// search clear
	var clearSearch = $('#clearSearch');
	if( clearSearch.hasClass('find') ){
		clearSearch.removeClass('find').addClass('unfind').removeAttr('title');
	}
	$('#templateSearch').val('');

	// 滚动到当前选择
	var checkNow = $('#item' + top._templateFrame);
	if(checkNow.length > 0){
		$('#searchPanel').scrollTop(checkNow[0].offsetTop);
	}

	// 绑定延时加载
	lazyloadPreImg();
}

function changeScreen(screen){
	//是处于全新主题状态下, 还是旧版主题下
	var whoInOpen = whoInOpened();

	var items;
	var tpltype;
	switch(whoInOpen){
		case "newThemes" : tpltype="1"; break;
		case "oldThemes" : tpltype="0"; break;
		default : break;
	}

	if (!initing){
		switch (screen) {
			case -1: Site.logDog(100040, 31); break;//全部
			case 0: Site.logDog(100040, 33); break;//普通
			case 1: Site.logDog(100040, 32); break;//宽屏
			case 2: Site.logDog(100040, 34); break;//窄屏
			default : break;
		}
	}

	if(tpltype === "1")
		items = $(".quickDressTemplateItem[_tpltype='1']");
	else if(tpltype === "0")
		items = $(".quickDressTemplateItem[_tpltype='0']");

	$('#panelMenu').show();
	$('#panelMenuNull').hide();

	$('#searchPanel').scrollTop(0);
	$(".searchClone").remove();

	filter.screen = screen;
	if ( $('#templateSearch').val() !== "" ) {
		items.each(function(){
			var screenTmp = parseInt($(this).attr('_screen'));
			if ( (filter.screen != -1) && (screenTmp != filter.screen)) {
				$(this).hide();
				return;
			}
			$(this).show();
		});
		filter.colorType = 0;
		filter.tplType = -1;
		$('#typeCheck').combobox("setInitVal", "全部", -1);
		$('#typeCheck2').combobox("setInitVal", "全部", -1);
		$('.tplTypeMenu:first').addClass("tplTypeMenuOn");
		$('.colorMenu:first').addClass("colorMenuOn");
	} else {
		items.each(function(){
			var screenTmp = parseInt($(this).attr('_screen'));
			var tplTmpType = parseInt($(this).attr('tpl'));
			var colorTmp = parseInt($(this).attr('color'));
			if ( ((filter.tplType != -1) && (tplTmpType != filter.tplType)) || ((filter.colorType != 0) && (colorTmp & filter.colorType) == 0) || ((filter.screen != -1) && (screenTmp != filter.screen)) ) {
				$(this).hide();
				return;
			}
			$(this).show();
		});
	}

	// search clear
	var clearSearch = $('#clearSearch');
	if( clearSearch.hasClass('find') ){
		clearSearch.removeClass('find').addClass('unfind').removeAttr('title');
	}
	$('#templateSearch').val('');

	// 绑定延时加载
	lazyloadPreImg();
}

function newThemesSwitch(){
	//修改li的状态
	var menus = $("#latelyUse,#oldThemes,#newThemes");
	$("#searchPanel").scrollTop(1);
	$(".recentUsedClone").remove();

	$(".quickDressTemplateItem").each(function () {
		// 获取 _tpltype  模版分类
		// 1 新版主题
		// 0 旧版主题
		var elm = $(this);
		var tplStyle = parseInt($(this).attr("_tpltype"));
		if (tplStyle === 0)
			elm.hide();
		else if (tplStyle === 1)
			elm.show()
	});

	$(this).attr("_open","1").siblings().attr("_open","0");

	menus.removeClass("menuCheck");
	$(this).addClass("menuCheck");

	$(".selectTypeMenu").addClass("panelMenuFix");
	$(".selectColorMenu , .colorMenu").hide();
	$(".searchClone").remove();
	$("#panelMenu").show();
	$("#panelMenuNull").hide();

	$("#templateSearch").val("");
	$("#clearSearch").removeClass("find");


	filter.colorType = 0;
	filter.tplType = -1;
	filter.screen = -1;
	$(".colorMenu").removeClass("colorMenuOn").first().addClass("colorMenuOn");
	$(".screenMenu").removeClass("screenMenuOn").first().addClass("screenMenuOn");
	
	$("#typeCheck").hide();
	$("#typeCheck2").show();
	
	if( $(".panelChecked").length > 0 ){
		$("#searchPanel").scrollTop($(".panelChecked").offset().top - 39);
	}
	$("#openOldThemes").show();
	
}

function oldThemesSwitch(){
	var menus = $("#latelyUse,#oldThemes,#newThemes");
	$(".recentUsedClone").remove();

	$(".quickDressTemplateItem").each(function () {
		// 获取 _tpltype  模版分类
		// 1 新版主题
		// 0 旧版主题
		var elm = $(this);
		var tplStyle = parseInt($(this).attr("_tpltype"));
		if (tplStyle === 1)
			elm.hide();
		else if (tplStyle === 0)
			elm.show()
	});

	$(this).attr("_open","1").siblings().attr("_open","0");

	menus.removeClass("menuCheck");
	$(this).addClass("menuCheck");


	$(".selectTypeMenu").removeClass("panelMenuFix");
	$(".selectColorMenu , .colorMenu").fadeIn("fast");
	$(".searchClone").remove();
	$("#panelMenu").show();
	$("#panelMenuNull").hide();

	$("#templateSearch").val("");
	$("#clearSearch").removeClass("find");


	filter.colorType = 0;
	filter.tplType = -1;
	filter.screen = -1;
	$(".colorMenu").removeClass("colorMenuOn").first().addClass("colorMenuOn");
	$(".screenMenu").removeClass("screenMenuOn").first().addClass("screenMenuOn");

	$("#typeCheck2").hide();
	$("#typeCheck").show();

	$("#searchPanel").scrollTop(1);
	if( $(".panelChecked").length > 0 ){
		$("#searchPanel").scrollTop($(".panelChecked").offset().top - 39);
	}
	$("#openOldThemes").hide();
}

// tab选择样式
function  tabCheck(ctrl){
	var allTab = $('.menu');
	if ( !ctrl.hasClass('menuHover') ){
		allTab.removeClass('menuCheck');
		ctrl.addClass('menuCheck');
	}
}

function bindItemHover(cls) {
	$("#searchPanel ." + cls).hover(function(){
		if ( $(this).hasClass('panelChecked') ){ return;}
		$(this).addClass('panelHover');
		var vb = $(this).find('.vipBottom');
		vb.show();
		adjustThemesColor( vb );
	}, function(){
		$(this).removeClass('panelHover');
		if ( $(this).hasClass('panelChecked') ){
			var imgsrc =  $(this).find("img").attr("data-original");
			$(this).find("img").attr("src",imgsrc);
			return;
		}
		var vb = $(this).find('.vipBottom');
		vb.hide();
		var imgsrc =  $(this).find("img").attr("data-original");

		$(this).find("img").attr("src",imgsrc);
	});
	//vipBottom hover out 时要settimeout 恢复到当前点击选中的主题。hoverin的时候假如settimeout未执行则clear。保证两个vipBottom之间可以连贯切换
	var vbHoverOutAction;
	$("#searchPanel ." + cls).find('.vipBottom').hover(function(){
		clearTimeout( vbHoverOutAction );
		var vbs = $(this).find(".themesColor");
		$.each( vbs, function( i, v ){
			$(v).show();
		});
	}, function(){
		adjustThemesColor( $(this) );
		vbHoverOutAction = setTimeout(function(){
			reClickColor();
		},300);
	});
}

function reClickColor(){
	if( hoverTemplate != 0 ){
		var reCtrl = $("#coloritem"+top._templateFrame);
		var type = "reColoClick";
		if( reCtrl.length < 1 ){
			reCtrl = $("#item"+top._templateFrame);
			type = "";
		}
		changeTemplate(reCtrl, type);
		hoverTemplate = 0;
	}
}

function adjustThemesColor( vb ){
	var vbs = $(vb).find(".themesColor");
	var isChecked = ($(vb).find(".themesColorChecked")).length > 0;
	//一行最多显示6个
	if( vbs.length <= 6 ){
		return;
	}
	var aline = [];
	//当前主题集有选中的，则lineChecked初始化为false，当前主题集没有选中的则lineChecked初始化为true，保证第一行显示
	var lineChecked = !isChecked;
	var clearAline = function(){
		//行没选中的隐藏
		$(aline).each(function(index, element) {
			if( !lineChecked ){
				$(element).hide();
			}else{
				$(element).show();
			}
		});
		lineChecked = false;
		aline = [];
	};
	//选中同行内的6个不隐藏，其余隐藏。都没选中的话，就第只有第一行不隐藏，hover上vipBottom的了话，就所有不隐藏。
	$.each( vbs, function( i, v ){
		//主题集没有选中，所以只显示前6个
		if( !isChecked && i > 5  ){
			$(v).hide();
			return;
		}
		if( !lineChecked ){
			lineChecked = $(v).hasClass("themesColorChecked");
		}
		aline.push( v );
		
		//只有最后一个或者是行数满的时候才遍历aline隐藏或者显示
		if( aline.length >= 6 || i >= vbs.length - 1 ){
			clearAline();
			return;
		}
	});
}

function advancedFilterShow(){
	var advFil = $('#advancedFilter');
	if ( advFil.is(':visible') ){
		advFil.hide();
		$('#advancedFilterBtn').addClass('advFilRight').removeClass('advFilLeft').removeClass('advFilLeft-hover');
		$('#advancedFilterBtn').attr('title', '使用高级筛选');
	} else {
		Site.logDog(100040, 21);
		advFil.show();
		$('#advancedFilterBtn').addClass('advFilLeft').removeClass('advFilRight').removeClass('advFilRight-hover');
		$('#advancedFilterBtn').attr('title', '收起高级筛选');
	}
}

function lazyloadPreImg(){
	$(".previewImg").lazyload({
		container: $("#searchPanel")
	});
}

function showRapidSite(){
	//极速建站不检查
	Site.logDog(100040, 24);
	Fai.closeTip("#rapidSite");
	Site.setCookieFlag(35, true);

	//AB类用户 合并：2015-06-18
	//Fai.top.Site.rapidSite.init();
}

function parentShow(){
	if ( firstShow ){
		lazyloadPreImg();
		firstShow = false;
	}
}

/*
//旧版主题 滚动主题弹出 选择提示。
function initTempTip() {
	if ( isNewUser ) {
		var cookieTmp = $.cookie("tempTipState");	// 滚动提示事件只出现一次

		if ( !cookieTmp || cookieTmp == "") {
			$.cookie("tempTipState", true, { expires: 365, path: '/' });

		}

		if ( cookieTmp != "false" ) {

			if ( $("#searchPanel").scrollTop() == 0 ) {
				nowTempId = $("#searchPanel").children().first().attr("id");
			}

			if (Fai.isIE()) {
				scrollScreenNum = 74 * 4 + 20;
			} else {
				scrollScreenNum = $("#" + nowTempId).height() * 4 + 20;		// 滚动的屏数
			}

			nowTempPosition = $("#" + nowTempId).offset().top;			// 当前使用主题的初始位置


			tempTipInterValObj = setInterval(function () {
				if ( isShowTempTip ) {
					var nowTempTop = $("#" + nowTempId).offset().top;
					if ( Math.abs(nowTempTop - nowTempPosition) >= scrollScreenNum ) {
						// 插入提示元素
						var tip = "<div class='tempTipSearchBar' tabIndex='-1'></div><div class='tempTipFloat' mouseIn=0></div>";
						$("#searchPanel").parent().append(tip);
						$(".tempTipSearchBar").focus();

						bindTempTipEvent();

						clearInterval(tempTipInterValObj);
						if ( isShowTempTip ) {
							$.cookie("tempTipState", false, { expires: 365, path: '/' });
							isShowTempTip = false;
						}
					}
				}
			}, 100);

		}

	}
}
function bindTempTipEvent () {
	$(".tempTipSearchBar").mouseenter(function () {
		$(".tempTipSearchBar").remove();
		$(".tempTipFloat").remove();

	}).blur(function () {
		$(".tempTipSearchBar").remove();
		$(".tempTipFloat").remove();

	});
}
*/


/*
 * 2014.11.27
 * Demon
 * 模版平滑滚动
 */
// 鼠标滚轮 + 键盘事件入口
function SlideScroll() {
	var isIE = !-[1,],  										// 小于等于ie8的浏览器(ie8 ie7 ie6), 都会是 true.
		isFF = /FireFox/gi.test(window.navigator.userAgent);

	var p = document.getElementById("searchPanel");

	if (isIE) {
		p.onmousewheel 		= 	WheelEvent;
		document.onkeydown  = 	keydown;
	} else if(isFF) {
		p.addEventListener('DOMMouseScroll', 	WheelEvent	,false);
		window.addEventListener('keydown', 		keydown 	,false);
	} else {
		p.addEventListener("mousewheel",		WheelEvent	,false);
		window.addEventListener("keydown", 		keydown 	,false);
	}
}

// 滚轮事件入口
function WheelEvent(e){
	//阻止鼠标滚轮条默认行为
	preventDefault(e);

	//查看动画状态,如果动画正在进行, 则不会触发下面的滚轮事件
	if(inscroll)
		return false;

	e = e || window.event;
	if(e.wheelDelta) {
		//IE Chrome
		if (e.wheelDelta > 0) {
			//IE Chrome 向上滚动 触发函数
			wheeldo(true);
		} else if (e.wheelDelta < 0) {
			//IE Chrome 向下滚动 触发函数
			wheeldo(false);
		}
	} else if(e.detail) {
		//FireFox
		if (e.detail < 0) {
			//FireFox 向上滚动 触发函数
			wheeldo(true);
		} else if (e.detail > 0) {
			//FireFox 向下滚动 触发函数
			wheeldo(false);
		}
	}
}

// 键盘事件入口
function keydown(e) {
	e = e || window.event;
	for (var i = keys.length; i--;) {
		if (e.keyCode === keys[i])
			preventDefault(e);
	}
	//查看动画状态,如果动画正在进行, 则不会触发下面的键盘事件
	if(inscroll)
		return false;

	if(e.keyCode === 38){
		//键盘方向键 : UP
		wheeldo(true);
	}else if(e.keyCode === 40){
		//键盘方向键 : DOWN
		wheeldo(false);
	}
}

// 阻止默认事件
function preventDefault(e) {
	e = e || window.event;
	if (e.preventDefault)
		e.preventDefault();
	e.returnValue = false;
}

// 鼠标滚动滚动时的动作
function wheeldo(isUp){
	//inscroll状态设置为true : 正在发生滚动
	inscroll = true;

	// e 获取一个 主题外框的高度
	// h 一次滚动的距离.
	// t 当前所处的位置.

	var e = $("#newThemes").hasClass("menuCheck")?$(".quickDressTemplateItem.new").first():$('.quickDressTemplateItem').first();
	var h = e.height() + parseInt(e.css("margin-top")) + parseInt(e.css("margin-bottom")) + 2;
	var t = $("#searchPanel").scrollTop();

	//向上滚动, 还是向下滚动?
	t = isUp? t-h:t+h;

	//求余,看计算出来的位置, 是否是h的整数倍.如果有余数.
	var y = t%h;

	//如果有余数.则说明滚动的幅度需要调整
	if(y){
		//向上滚动和向下滚动存在计算差异
		if(isUp){
			t=(t===y)?y:t+h-y;
		}else{
			t-=y;
		}
	}

	/*
	 * jQuery animate() [API]
	 * queue	: 是否插入动画队列
	 * duration	: 动画速度.默认400. 可选字符串参数 "slow", "fast" , "normal"
	 * complete	: 完成动画后的回调函数
	 *
	 * 最终使用 t 的数值来确定滚动的动画
	 */

	$('#searchPanel').animate({
		scrollTop 	: 	t
	},{
		queue		:	false,
		duration	:	200,
		complete	:	function(){
			//滚动动画结束后将 inscroll状态设置为 false 表示没有滚动
			inscroll = false;
		}
	});

}
function openOldThemes(){
	//新旧版主题开启逻辑
	if($("#otswitch").is(":checked")){
		$.cookie("openOldTheme","1");
		$("#oldThemes").show().trigger("click");
	}else if(!$("#otswitch").is(":checked")){
		$.cookie("openOldTheme","0");
		$("#newThemes").trigger("click");
		$("#oldThemes").hide();
	}
	Site.styleChanged();
}

function whoInOpened(){
	return $(".menuCheck").attr("id");
}

function cloneSearchTemplate(newThemes){
	//如果 index 是0, 则代表了新模版中, 颜色的第一个
	var theme = $(newThemes);
	var id = theme.attr("id"),
		prevImgsrc = theme.attr("_pvimg");
	if( typeof id === 'undefined' ){
		return;
	}
	
	var _ttype = parseInt(theme.attr("_ttype"));
	var ticon = getTemplateIcon( _ttype );
	
	var num = theme.attr("_tkey").replace("t","");
	var str = [];
		str.push('<div id="copy-'+id+'" class="searchClone" style="display: block;">');
		str.push(   '<div class="previewImgDiv">');
		str.push(       '<div class="innerImgDiv"><img class="previewImg" src="'+prevImgsrc+'" width="130" height="68" style="display: inline;"></div>');
		str.push(   '</div>');
		str.push(   '<div class=' + ticon + '></div>');
		str.push(   '<div class="vipBottom" style="display: block;">[编号：T' + num + ']</div>');
		str.push('</div>');

	return str.join("");
}

//初始化样板js
$(function(){
	var styleDesignHeight = ~~($.cookie( 'styleDesignHeight', { path:'/'} ));
	if(styleDesignHeight > 100){
		var tabsHeight = Fai.top.$("#styleDesign").children(".tabsWrap").height() || 37;
		var panelsHeight = styleDesignHeight - tabsHeight;
		$('#searchPanel').height((panelsHeight - 44)+"px");
		$('.panelLeft').height((panelsHeight - 20)+"px");
	}
	
	//当拖动设置面板调节显示区高度时触发
	Site.bindGobalEvent("styleDesignResize", function(event, option){
		$('#searchPanel').height((option - 44)+"px");
		$('.panelLeft').height((option - 20)+"px");
	});
	
	var $searchPanel = $('#searchPanel');
	
	$("#newThemes").bind("click",newThemesSwitch);
	$("#oldThemes").bind("click",oldThemesSwitch);
	$("#latelyUse").bind("click",recentTemplate);

	if ( showTips ){
		Site.showTip({ tid:"#rapidSite", content:'极速建站移到这里了！' }, 35);
	}
	var demo_template_flag = false;

	// 获取cookie中存储的“最近使用”模板，如果没有当前模板，添加
	var getCookie=$.cookie('recentTemplate');
	if(getCookie!=null){
		usedArray=$.cookie('recentTemplate').split(",");
	}
	var hasPanelUsed = false;
	for (i = 0 ; i < usedArray.length ; i++) {
		var str = usedArray[i];
		if (str === (top._templateFrame).toString()) {
			hasPanelUsed = true;
			usedArray.splice(i, 1);
			usedArray.splice(usedArray.length, 0, top._templateFrame);
		}
	}
	if (!hasPanelUsed) {
		usedArray.splice(usedArray.length, 0, top._templateFrame);
	}
	//Fai.delayLoadImg();

	bindItemHover("quickDressTemplateItem");

	/*
	 // 目前不提示
	 if(!demo_template_flag && !Site.getCookieFlag(4)){ // 不是样板网站的更换模板
	 top.Fai.showTip({
	 id: 'wbtt',
	 tid: '#webBannerTab',
	 content: '点击“网站横幅”可以选择横幅或上传自定义横幅。',
	 closeSwitch: true,
	 showMode: 'bottom',
	 beforeClose: function(){
	 Site.setCookieFlag(4, true);
	 }
	 })
	 }
	 */
	// 二级tab的hover和check
	$('.menu').hover(function(){
		$(this).addClass('menuHovor');
	}, function(){
		$(this).removeClass('menuHovor');
	});

	/*var templateScreenList = new Array();
	 {
	 templateScreenList.push({label:"全部", key:-1});
	 templateScreenList.push({label:"宽屏", key:1});
	 templateScreenList.push({label:"标准", key:0});
	 templateScreenList.push({label:"窄屏", key:2});
	 }
	 var screenInitVal = "全部";
	 var screenInitKey = -1;
	 $('#screenCheck').combobox({readonly:true, source:templateScreenList, initVal:screenInitVal, initKey:screenInitKey, select:changeScreen});*/
	/*---此处OSS 版本, 生成分类,  全部, 初级, 中级, 高级---*/
	var templateTypeList = [];
	{
		templateTypeList.push({label:"全部", key:-1});
		templateTypeList.push({label:"初级", key:0});  //0
		templateTypeList.push({label:"中级", key:1});   //1
		templateTypeList.push({label:"高级", key:3});   //3
	}
	var typeInitVal = "全部";
	var typeInitKey = -1;
	$('#typeCheck').combobox({readonly:true, source:templateTypeList, initVal:typeInitVal, initKey:typeInitKey, select:changeTemplateType});	
	
	var templateTypeList = [];
	{
		templateTypeList.push({label:"全部", key:-1});
		templateTypeList.push({label:"初级", key:0});  //0
		templateTypeList.push({label:"中级", key:1});   //1
	}
	var typeInitVal = "全部";
	var typeInitKey = -1;
	$('#typeCheck2').combobox({readonly:true, source:templateTypeList, initVal:typeInitVal, initKey:typeInitKey, select:changeTemplateType});
	
	/*---正常的 Site .而非OSS版本则不会生成 combobox */

	/*---编号搜索 功能---*/
	$('#templateSearch').keyup(function(){
		$(".searchClone").remove();
		var whoInOpen = whoInOpened();
		var tpltype;
		//whoInOpen 是新版主题,还是旧版主题?
		switch(whoInOpen){
			case "newThemes" : tpltype = "1" ; break;
			case "oldThemes" : tpltype = "0" ; break;
			default : break;
		}

		//不同的选择器
		var items = $('.quickDressTemplateItem[_tpltype="'+tpltype+'"]'), // cache
			_me = $(this),
			search_word = $.trim( _me.val() ),
			clearSearch = $('#clearSearch'),
			find = false;
		if( search_word != '' ){
			if( !clearSearch.hasClass('find') ){
				clearSearch.removeClass('unfind').addClass('find').attr('title','清除输入');
			}
			items.hide(); // searched
			var search_id = search_word.toLowerCase();

			// 如果关键字输入正确　(ＲｅｇＥｘｐ验证)
			if( /^[t]?\d+$/i.test(search_word) ){
				if(search_id.length > 1){	//输入长度大于1才开始搜索
					var keyword = search_id;
					$.each( items, function( i, itemdom ){
						var item = $(itemdom),
							item_id = item.attr('_tkey');

						//必须是新版主题
						if(tpltype==="1"){
							var newChilds = item.find(".newThemebord").children();
							$.each(newChilds, function(i,child){
								var reg = new RegExp("^[t]?"+keyword+"$","gi");
								if(reg.test($(child).attr("_tkey"))) {
									//创建模版
									$("#searchPanel").append(cloneSearchTemplate(child));
									item.hide();
									//已经找到
									find = true;
									Site.logDog(100040, 22);
									return true;
								}
							})
						}
						if(find){
							return true;
						}

						if(search_id.charAt(0) != 't'){
							if(search_id.length < item_id.length-1){	//输入的长度小于图片编号长度-1
								var reg_search_id = new RegExp("t0+" + search_id + "$");//匹配、t0、t00、t000、t0000
								if( reg_search_id.test(item_id)){
									item.show();
									Site.logDog(100040, 22);
								}
							}else{
								keyword = 't' + search_id;
							}
						}

						if( item_id == keyword){	//精确查询
							item.show();
							Site.logDog(100040, 22);
							return true; // continue;
						}
					});
				}
			}
			$(".colorMenu.colorMenuOn").removeClass("colorMenuOn");
			$(".tplTypeMenu.tplTypeMenuOn").removeClass("tplTypeMenuOn");
		}else{
			$(".colorMenu").removeClass("colorMenuOn").first().addClass("colorMenuOn");
			$('.screenMenu').removeClass("screenMenuOn").first().addClass("screenMenuOn");
			filter.colorType = 0;
			filter.tplType = -1;
			$('#typeCheck').combobox("setInitVal", "全部", -1);
			$('#typeCheck2').combobox("setInitVal", "全部", -1);
			filter.screen = -1;
			clearSearch.removeClass('find').addClass('unfind').removeAttr('title');

			$(".quickDressTemplateItem[_tpltype='"+tpltype+"']").show();
		}


		// 绑定延时加载
		lazyloadPreImg();
	});

	$('#clearSearch').click(function(){//清除编号搜索关键字
		$(".searchClone").remove();
		var whoInOpen = whoInOpened();
		var _me = $(this);
		if( _me.hasClass('find') ){
			var searchWord = $('#templateSearch').val();
			if( searchWord != '' ){
				_me.removeClass('ind').addClass('unfind').removeAttr('title');
				$('#templateSearch').val('');
				//当前menu是 全新主题, 还是旧版主题
				if(whoInOpen === "newThemes") {
					$('.quickDressTemplateItem').each(function(i,e){
						if($(e).attr("_tpltype")==="1") $(e).show();
					})
				}else if(whoInOpen === "oldThemes"){
					$('.quickDressTemplateItem').each(function(i,e){
						if($(e).attr("_tpltype")==="0") $(e).show();
					})
				}
				// 复位
				$(".colorMenu").removeClass("colorMenuOn").first().addClass("colorMenuOn");
				$('.screenMenu').removeClass("screenMenuOn").first().addClass("screenMenuOn");

				filter.colorType = 0;		// 过滤颜色
				filter.tplType = -1;		// 过滤模板类型
				$('#typeCheck').combobox("setInitVal", "全部", -1);
				$('#typeCheck2').combobox("setInitVal", "全部", -1);
				filter.screen = -1;			// 过滤模板版式
			}
		}
		// 绑定延时加载
		lazyloadPreImg();
		return false;
	});

	/*---编号搜索 功能结束---*/


	// color Menu高亮
	$(".colorMenu").bind("click", function(){
		$(this).addClass("colorMenuOn").siblings().removeClass("colorMenuOn");
	});

	// tmpl type Menu高亮
	$(".tplTypeMenu").bind("click", function(){
		$(this).addClass("tplTypeMenuOn").siblings().removeClass("tplTypeMenuOn");
	});

	// screen Menu高亮
	$(".screenMenu").bind("click", function(){
		$(this).addClass("screenMenuOn").siblings().removeClass("screenMenuOn");
	});

	$("#advancedFilterBtn").hover(function(){
		if ( $('#advancedFilter').is(':visible') ){
			$(this).addClass("advFilLeft-hover")
		} else {
			$(this).addClass("advFilRight-hover");
		}
	}, function(){
		if ( $('#advancedFilter').is(':visible') ){
			$(this).removeClass("advFilLeft-hover");
		} else {
			$(this).removeClass("advFilRight-hover");
		}
	});

	// 绑定延时加载
	lazyloadPreImg();


	// 为模版区域的每一个可以选择的模版, 绑定click事件.
	$searchPanel.delegate(".quickDressTemplateItem", "click", function(e){
		e.stopPropagation();

		var isSameTempalte = changeTemplate(this);
		if(!isSameTempalte){
			Site.resetBackgroundStyleDefault();
			Site.resetNavStyleDefault();
		}
	});

	$searchPanel.delegate(".themesColor","click",function(e){
		e.stopPropagation();

		var isSameTempalte = changeTemplate(this,"colorClick");
		if(!isSameTempalte){
			Site.resetBackgroundStyleDefault();
			Site.resetNavStyleDefault();
		}
	});
	$searchPanel.delegate(".quickDressTemplateItem.new",'mouseenter',function(e){
		var $this = $(this);
		var id = $this.attr("_tkey").toUpperCase();

		$("#hoverIdSearch").html(id).show();
	});
	$searchPanel.delegate(".quickDressTemplateItem.new","mouseleave",function(e){
		$("#hoverIdSearch").html("").hide();
	});
	
	//hover在主题颜色块上一定时间后则应用该主题
	var hoverchangeFun = function( elem ){
		//老浏览器不支持hover切换主题,主要是性能原因 
		if( Fai.isIE6() || Fai.isIE7() || Fai.isIE8() ){
			return;
		}
		changeTemplate(elem, "hover");
		//hover的都重置背景和nav导航 
		Site.resetBackgroundStyleDefault();
		Site.resetNavStyleDefault();
		
		var id = elem.attr("_tkey").toUpperCase()
		hoverTemplate = id.replace(/[^\d]/g, "");
	};
	
	$searchPanel.delegate(".themesColor","mouseenter",function(e){
		var $this = $(this);
		var id = $this.attr("_tkey").toUpperCase();
		var item = $this.parent().parent();
		var pvimgsrc = $this.attr("_pvimg");

		item.find(".previewImg").attr("src",pvimgsrc);
		$("#hoverIdSearch").html(id).show();
		
		var hoverchange = setTimeout(function(){
			hoverchangeFun( $this );
		},300);
		$this.off("mouseleave.hovercolor");
		$this.on("mouseleave.hovercolor",function(e){
			clearTimeout( hoverchange );
			$("#hoverIdSearch").html("").hide();
		});
	});
	/*
	$searchPanel.delegate(".themesColor","mouseleave",function(e){
		$("#hoverIdSearch").html("").hide();
	});
	*/
	
	var usedShowCode = function( elem ){
		var	id = elem.attr('id');
		var tid = id.replace(/[^\d]/g, "");
		var codehtml = "<div class='vipBottom' style='display: block;'>[编号：T" + tid + "]</div>";
		//先清除旧的。避免选中的主题下有多个vipBottom
		elem.find(".vipBottom").remove();
		elem.append( codehtml );
	}
	
	$searchPanel.delegate(".searchClone,.recentUsedClone","click",function(e){
		e.stopPropagation();
		var isSameTemplate = cloneChoice(this);
		if(!isSameTemplate){
			Site.resetBackgroundStyleDefault();
			Site.resetNavStyleDefault();
		}
		var _this = $(this);
		if( _this.hasClass("cloneOn") ){
			usedShowCode( _this );
		}
	});
	
	
	$searchPanel.delegate(".recentUsedClone","mouseenter",function(e){
		usedShowCode( $(this) );
	}).delegate(".recentUsedClone","mouseleave", function(e){
		var $this = $(this);
		//当前选中
		if( $this.hasClass("cloneOn") ){
			return;
		}
		$this.find(".vipBottom").remove();
	});
	

	// 当前模板选中效果
	var checkNow = $('#item' + top._templateFrame);
	if(checkNow.length > 0){
		checkNow.addClass('panelChecked');
		checkNow.find('.vipBottom').show();

		// 滚动到当前选中的位置
		$('#searchPanel').scrollTop(checkNow[0].offsetTop);
	}
		checkNow = $("#coloritem" + top._templateFrame);
	if(checkNow.length > 0){
		var parentitem = checkNow.parent().parent();
			parentitemImg = parentitem.find(".previewImg");
		tkey = checkNow.attr("_tkey").toUpperCase();
		checkNow.addClass("themesColorChecked").append(colorcheck);
		$("#coloritem" + top._templateFrame + " .vipBottom").show();
		parentitem.addClass("panelChecked").find('.vipBottom').show();

		//copy属性
		parentitem.attr("id",checkNow.attr("id").replace("color",""));
		parentitem.attr("color",checkNow.attr("color"));
		parentitem.attr("_tkey",checkNow.attr("_tkey"));
		parentitem.attr("_path",checkNow.attr("_path"));
		parentitem.attr("_widenav",checkNow.attr("_widenav"));
		parentitem.attr("_layout",checkNow.attr("_layout"));
		parentitem.attr("tpl",checkNow.attr("tpl"));
		parentitem.attr("_bannerid",checkNow.attr("_bannerid"));
		parentitem.attr("_screen",checkNow.attr("_screen"));

		parentitemImg.attr("src",checkNow.attr("_pvimg"));
		parentitemImg.attr("data-original",checkNow.attr("_pvimg"));
	}

	$('#advancedFilter').hide();
	initing = false;
	if ( Fai.top.$("#styleDesign").is(":visible") ){
		Site.logDog(100039, 1);
		Site.logDog(100040, 0);
	}

	// 新上线的模板加上标记
	//addNewTagForNewTmp();

	// 模板提示
	nowTempId = $(checkNow).prop("id");
//	initTempTip();

	//触发一次筛选事件
	if(checkNow.attr("_tpltype")==="1"){
		$('#newThemes').trigger("click");
	}else{
		$("#advancedFilterBtn").trigger("click");
		$("#otswitch").attr("checked","true");
		$("#oldThemes").show().trigger("click");
	}

	var oldThemeshadopen = $.cookie("openOldTheme");
	if(oldThemeshadopen === "1"){
		if($("#advancedFilterBtn").hasClass("advFilRight")){
			$("#advancedFilterBtn").trigger("click");
			$("#oldThemes").show();
		}
		$("#otswitch").attr("checked","true");
	}
	adjustThemesColor( $(".panelChecked").find(".vipBottom") );

	// 绑定滚动事件,键盘事件
	SlideScroll();
});
</script>

</head>
<body>
	<table style="table-layout: fixed;" cellpadding="0" cellspacing="0">
		<tbody>
			<tr>
				<td style="width: 100%;">
					<div id="quickDress" class="quickDress">
						<div id="imgContainer" class="quickDressTemplate"
							style="width: 100%;">
							<table style="table-layout: fixed; width: 100%;" border="0"
								cellpadding="0" cellspacing="0">
								<tbody>
									<tr>
										<td>
											<div style="width: 1000px; height: 100%; margin: auto;">
												<!-- 二级tab -->
												<div class="panelLeft">
													<div class="panelTopBg"></div>
													<div class="panelBottomBg"></div>
													<ul>
														<li id="newThemes" class="menu menuCheck" _open="1">全新主题</li>
														<li id="oldThemes" class="menu" _open="0"
															style="display: none">旧版主题</li>
														<li id="latelyUse" class="menu" _open="0">最近使用</li>
													</ul>
													<!-- 
													<a id="rapidSite" class="rapidSiteClass"
														onclick="showRapidSite();return false;"
														href="javascript:;" title="体验极速建站，一键复制海量样板网站">
														<div class="rapidSiteDiv">
															<span class="siteIco styleRapidSite"></span>
															<span style="float: left; height: 20px; line-height: 20px;">极速建站</span>
														</div>
													</a>
													 -->
												</div>
												<!-- content -->
												<div class="panelRight">
													<div style="display: none;" id="panelMenuNull"
														class="panelMenu">以下是最近使用的主题：</div>
													<div id="panelMenu" class="panelMenu">
														<div class="quickDressType">
															<div style="display: none;"
																class="panelMenuTitle selectColorMenu">
																颜色
																<div class="panelMenuTitleIco"></div>
															</div>
															<a style="display: none;" class="colorMenu colorMenuOn"
																href="javascript:changeTemplateColor(0);"
																hidefocus="true">全部</a> <a style="display: none;"
																class="colorMenu" hidefocus="true"
																href="javascript:changeTemplateColor(1)"> 棕黑 </a> <a
																style="display: none;" class="colorMenu"
																hidefocus="true"
																href="javascript:changeTemplateColor(2)"> 银灰 </a> <a
																style="display: none;" class="colorMenu"
																hidefocus="true"
																href="javascript:changeTemplateColor(4)"> 蓝调 </a> <a
																style="display: none;" class="colorMenu"
																hidefocus="true"
																href="javascript:changeTemplateColor(8)"> 青绿 </a> <a
																style="display: none;" class="colorMenu"
																hidefocus="true"
																href="javascript:changeTemplateColor(16)"> 红紫 </a> <a
																style="display: none;" class="colorMenu"
																hidefocus="true"
																href="javascript:changeTemplateColor(32)"> 黄橙 </a>

															<div class="panelMenuTitle selectTypeMenu panelMenuFix">
																版式
																<div class="panelMenuTitleIco"></div>
															</div>
															<!--<div id="screenCheck" class="screenCheck"></div> -->
															<a class="screenMenu screenMenuOn" hidefocus="true"
																href="javascript:changeScreen(-1);">全部</a> <a
																class="screenMenu" hidefocus="true"
																href="javascript:changeScreen(1);">宽屏</a> <a
																class="screenMenu" hidefocus="true"
																href="javascript:changeScreen(0);">普通</a> <a
																class="screenMenu" hidefocus="true"
																href="javascript:changeScreen(2);">窄屏</a>

															<!--
                                    <div class="panelMenuTitle" style="margin-left:5px;">
                                        类型
                                        <div class="panelMenuTitleIco"></div>
                                    </div>
                                    <a class="tplTypeMenu tplTypeMenuOn" hidefocus='true' href="javascript:changeTemplateType([])">
                                        全部
                                    </a>
                                    <a class="tplTypeMenu" hidefocus='true' href="javascript:changeTemplateType([0])">
                                        免费版
                                    </a>
                                    <a class="tplTypeMenu" hidefocus='true' href="javascript:changeTemplateType([1])">
                                        标准版
                                    </a>
                                    <a class="tplTypeMenu" hidefocus='true' href="javascript:changeTemplateType([3])">
                                        推广版
                                    </a>
                                    <a class="tplTypeMenu" hidefocus='true' href="javascript:changeTemplateType([4])">
                                        商务版
                                    </a>
                                    -->
															<div style="display: none;" id="advancedFilter">
																<div class="panelMenuTitle" style="margin-left: 10px;">
																	编号
																	<div class="panelMenuTitleIco"></div>
																</div>
																<input id="templateSearch" class="searchInput"
																	maxlength="6" type="text">
																<div style="display: none;" id="hoverIdSearch"
																	class="hoverIdSearch"></div>
																<span id="clearSearch" class="clearSearch unfind"></span>
																<div id="openOldThemes">
																	<label for="otswitch"><input id="otswitch"
																		name="otswitch" onclick="openOldThemes()"
																		type="checkbox">开启旧版主题</label>
																</div>
															</div>
															<div id="advancedFilterBtn" class="advFilRight"
																onclick="advancedFilterShow()" title="使用高级筛选"></div>
														</div>
													</div>
													<div id="searchPanel" class="searchPanel">
			                                            <div style="display: none;" id="item528" class="quickDressTemplateItem" _ttype="0" _tkey="t528" color="0" _path="${ctx_web}/css/template/528.min.css?v=201508311727" _widenav="0" _layout="1" tpl="0" _bannerid="1934" _bannerweight="12" _screen="0" _tpltype="0">
			                                                <div class="vipBottom">[编号：T528]</div>
			                                                <div class="previewImgDiv">
			                                                    <div class="innerImgDiv" width="130" height="68" style="margin:0 auto;">
																	<table style="height:100%; width:100%; text-align:center;" align="center">
			                                                    		<tbody><tr>
			                                                    			<td>
																				<img style="display: inline;" class="previewImg" src="${ctx_web}/image/528.jpg" data-original="${ctx_web}/image/template/preview/528.jpg?v=20140101">
			                                                    			</td>
			                                                    		</tr>
			                                                    	</tbody></table>
			                                                    </div>
			                                                </div>
			                                            </div>
			                                            <div style="display: none;" id="item533" class="quickDressTemplateItem" _ttype="0" _tkey="t533" color="16" _path="${ctx_web}/css/template/533.min.css?v=201508311727" _widenav="1" _layout="1" tpl="0" _bannerid="2289" _bannerweight="6" _screen="1" _tpltype="0">
			                                                <div class="vipBottom">[编号：T533]</div>
			                                                <div class="previewImgDiv">
			                                                    <div class="innerImgDiv" width="130" height="68" style="margin:0 auto;">
																	<table style="height:100%; width:100%; text-align:center;" align="center">
			                                                    		<tbody><tr>
			                                                    			<td>
																				<img style="display: inline;" class="previewImg" src="${ctx_web}/image/533.jpg" data-original="${ctx_web}/image/template/preview/533.jpg?v=20140903">
			                                                    			</td>
			                                                    		</tr>
			                                                    	</tbody></table>
			                                                    </div>
			                                                </div>
			                                            </div>
			                                            <div id="item18005" class="quickDressTemplateItem new" _tkey="t18005" _ttype="0" color="16" _path="${ctx_web}/css/template/18005.min.css?v=201508311727" _widenav="0" _layout="1" tpl="0" _bannerid="180005" _bannerweight="15" _screen="1" _tpltype="1">
			                                                <div class="previewImgDiv">
			                                                    <div class="innerImgDiv new" width="159" height="80" style="margin:0 auto;">
			                                                    	<table style="height:100%; width:100%; text-align:center;" align="center">
			                                                    		<tbody><tr>
			                                                    			<td>
																				<img style="display: inline;" class="previewImg" src="${ctx_web}/image/template/preview/18005.jpg" data-original="${ctx_web}/image/template/preview/18005.jpg?v=20150107">
			                                                    			</td>
			                                                    		</tr>
			                                                    	</tbody></table>
			                                                    </div>
			                                                </div>
			                                                <div class="vipBottom newThemebord " _colorcount="6">
			                                                    <div class="themesColor" id="coloritem18005" _ttype="0" _tkey="t18005" color="16" _path="${ctx_web}/css/template/18005.min.css?v=201508311727" _widenav="0" _layout="1" tpl="0" _bannerid="180005" _screen="1" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/18005.jpg?v=20150107"><div class="innerColor" style="background-color:#ec6383;"></div></div>
			                                                    <div class="themesColor" id="coloritem18001" _ttype="0" _tkey="t18001" color="8" _path="${ctx_web}/css/template/18001.min.css?v=201508311727" _widenav="0" _layout="1" tpl="0" _bannerid="180001" _screen="1" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/18001.jpg?v=20150107"><div class="innerColor" style="background-color:#2ea4c4;"></div></div>
			                                                    <div class="themesColor" id="coloritem18002" _ttype="0" _tkey="t18002" color="4" _path="${ctx_web}/css/template/18002.min.css?v=201508311727" _widenav="0" _layout="1" tpl="0" _bannerid="180001" _screen="1" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/18002.jpg?v=20150107"><div class="innerColor" style="background-color:#3976b8;"></div></div>
			                                                    <div class="themesColor" id="coloritem18003" _ttype="0" _tkey="t18003" color="8" _path="${ctx_web}/css/template/18003.min.css?v=201508311727" _widenav="0" _layout="1" tpl="0" _bannerid="180003" _screen="1" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/18003.jpg?v=20150107"><div class="innerColor" style="background-color:#65b839;"></div></div>
			                                                    <div class="themesColor" id="coloritem18004" _ttype="0" _tkey="t18004" color="32" _path="${ctx_web}/css/template/18004.min.css?v=201508311727" _widenav="0" _layout="1" tpl="0" _bannerid="180004" _screen="1" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/18004.jpg?v=20150107"><div class="innerColor" style="background-color:#ea7608;"></div></div>
			                                                    <div class="themesColor" id="coloritem18006" _ttype="0" _tkey="t18006" color="16" _path="${ctx_web}/css/template/18006.min.css?v=201508311727" _widenav="0" _layout="1" tpl="0" _bannerid="180005" _screen="1" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/18006.jpg?v=20150107"><div class="innerColor" style="background-color:#9b65e1;"></div></div>
			                                                </div>
			                                            </div>
			                                            <div id="item2001" class="quickDressTemplateItem new" _tkey="t2001" _ttype="0" color="8" _path="${ctx_web}/css/template/2001.min.css?v=201512141713" _widenav="0" _layout="1" tpl="0" _bannerid="20001" _bannerweight="0" _screen="0" _tpltype="1">
			                                                <div class="previewImgDiv">
			                                                    <div class="innerImgDiv new" width="159" height="80" style="margin:0 auto;">
			                                                    	<table style="height:100%; width:100%; text-align:center;" align="center">
			                                                    		<tbody><tr>
			                                                    			<td>
																				<img style="display: inline;" class="previewImg" src="${ctx_web}/image/template/preview/2001.jpg" data-original="${ctx_web}/image/template/preview/2001.jpg?v=20150116">
			                                                    			</td>
			                                                    		</tr>
			                                                    	</tbody></table>
			                                                    </div>
			                                                </div>
			                                                <div class="vipBottom newThemebord " _colorcount="6">
			                                                    <div class="themesColor" id="coloritem2001" _ttype="0" _tkey="t2001" color="8" _path="${ctx_web}/css/template/2001.min.css?v=201512141713" _widenav="0" _layout="1" tpl="0" _bannerid="20001" _screen="0" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/2001.jpg?v=20150116"><div class="innerColor" style="background-color:#095c32;"></div></div>
			                                                    <div class="themesColor" id="coloritem2002" _ttype="0" _tkey="t2002" color="16" _path="${ctx_web}/css/template/2002.min.css?v=201512141713" _widenav="0" _layout="1" tpl="0" _bannerid="20002" _screen="0" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/2002.jpg?v=20150116"><div class="innerColor" style="background-color:#920000;"></div></div>
			                                                    <div class="themesColor" id="coloritem2003" _ttype="0" _tkey="t2003" color="32" _path="${ctx_web}/css/template/2003.min.css?v=201512141713" _widenav="0" _layout="1" tpl="0" _bannerid="20003" _screen="0" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/2003.jpg?v=20150119"><div class="innerColor" style="background-color:#eca606;"></div></div>
			                                                    <div class="themesColor" id="coloritem2004" _ttype="0" _tkey="t2004" color="16" _path="${ctx_web}/css/template/2004.min.css?v=201512141713" _widenav="0" _layout="1" tpl="0" _bannerid="20004" _screen="0" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/2004.jpg?v=20150116"><div class="innerColor" style="background-color:#362672;"></div></div>
			                                                    <div class="themesColor" id="coloritem2005" _ttype="0" _tkey="t2005" color="1" _path="${ctx_web}/css/template/2005.min.css?v=201512141713" _widenav="0" _layout="1" tpl="0" _bannerid="20005" _screen="0" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/2005.jpg?v=20150119"><div class="innerColor" style="background-color:#181717;"></div></div>
			                                                    <div class="themesColor" id="coloritem2006" _ttype="0" _tkey="t2006" color="4" _path="${ctx_web}/css/template/2006.min.css?v=201512141713" _widenav="0" _layout="1" tpl="0" _bannerid="20006" _screen="0" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/2006.jpg?v=20150116"><div class="innerColor" style="background-color:#0e4b77;"></div></div>
			                                                </div>
			                                            </div>
			                                            <div id="item4001" class="quickDressTemplateItem new" _tkey="t4001" _ttype="0" color="4" _path="${ctx_web}/css/template/4001.min.css?v=201509081855" _widenav="0" _layout="1" tpl="0" _bannerid="40001" _bannerweight="6" _screen="1" _tpltype="1">
			                                                <div class="previewImgDiv">
			                                                    <div class="innerImgDiv new" width="159" height="80" style="margin:0 auto;">
			                                                    	<table style="height:100%; width:100%; text-align:center;" align="center">
			                                                    		<tbody><tr>
			                                                    			<td>
																				<img style="display: inline;" class="previewImg" src="${ctx_web}/image/template/preview/4001.jpg" data-original="${ctx_web}/image/template/preview/4001.jpg?v=20150105">
			                                                    			</td>
			                                                    		</tr>
			                                                    	</tbody></table>
			                                                    </div>
			                                                </div>
			                                                <div class="vipBottom newThemebord " _colorcount="5">
			                                                    <div class="themesColor" id="coloritem4001" _ttype="0" _tkey="t4001" color="4" _path="${ctx_web}/css/template/4001.min.css?v=201509081855" _widenav="0" _layout="1" tpl="0" _bannerid="40001" _screen="1" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/4001.jpg?v=20150105"><div class="innerColor" style="background-color:#006ece;"></div></div>
			                                                    <div class="themesColor" id="coloritem4002" _ttype="0" _tkey="t4002" color="8" _path="${ctx_web}/css/template/4002.min.css?v=201509081855" _widenav="0" _layout="1" tpl="0" _bannerid="40002" _screen="1" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/4002.jpg?v=20150105"><div class="innerColor" style="background-color:#2b8397;"></div></div>
			                                                    <div class="themesColor" id="coloritem4003" _ttype="0" _tkey="t4003" color="1" _path="${ctx_web}/css/template/4003.min.css?v=201511091906" _widenav="0" _layout="1" tpl="0" _bannerid="40003" _screen="1" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/4003.jpg?v=20150105"><div class="innerColor" style="background-color:#000000;"></div></div>
			                                                    <div class="themesColor" id="coloritem4004" _ttype="0" _tkey="t4004" color="16" _path="${ctx_web}/css/template/4004.min.css?v=201509081855" _widenav="0" _layout="1" tpl="0" _bannerid="40004" _screen="1" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/4004.jpg?v=20150105"><div class="innerColor" style="background-color:#bb2200;"></div></div>
			                                                    <div class="themesColor" id="coloritem4005" _ttype="0" _tkey="t4005" color="32" _path="${ctx_web}/css/template/4005.min.css?v=201509081855" _widenav="0" _layout="1" tpl="0" _bannerid="40005" _screen="1" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/4005.jpg?v=20150105"><div class="innerColor" style="background-color:#a55201;"></div></div>
			                                                </div>
			                                            </div>
			                                            <div id="item6001" class="quickDressTemplateItem new" _tkey="t6001" _ttype="0" color="4" _path="${ctx_web}/css/template/6001.min.css?v=201508311727" _widenav="1" _layout="7" tpl="0" _bannerid="60001" _bannerweight="21" _screen="2" _tpltype="1">
			                                                <div class="previewImgDiv">
			                                                    <div class="innerImgDiv new" width="159" height="80" style="margin:0 auto;">
			                                                    	<table style="height:100%; width:100%; text-align:center;" align="center">
			                                                    		<tbody><tr>
			                                                    			<td>
																				<img style="display: inline;" class="previewImg" src="${ctx_web}/image/template/preview/6001.jpg" data-original="${ctx_web}/image/template/preview/6001.jpg?v=20150105">
			                                                    			</td>
			                                                    		</tr>
			                                                    	</tbody></table>
			                                                    </div>
			                                                </div>
			                                                <div class="vipBottom newThemebord " _colorcount="6">
			                                                    <div class="themesColor" id="coloritem6001" _ttype="0" _tkey="t6001" color="4" _path="${ctx_web}/css/template/6001.min.css?v=201508311727" _widenav="1" _layout="7" tpl="0" _bannerid="60001" _screen="2" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/6001.jpg?v=20150105"><div class="innerColor" style="background-color:#1e6bbb;"></div></div>
			                                                    <div class="themesColor" id="coloritem6002" _ttype="0" _tkey="t6002" color="16" _path="${ctx_web}/css/template/6002.min.css?v=201508311727" _widenav="1" _layout="7" tpl="0" _bannerid="60002" _screen="2" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/6002.jpg?v=20150105"><div class="innerColor" style="background-color:#b91d21;"></div></div>
			                                                    <div class="themesColor" id="coloritem6003" _ttype="0" _tkey="t6003" color="16" _path="${ctx_web}/css/template/6003.min.css?v=201508311727" _widenav="1" _layout="7" tpl="0" _bannerid="60003" _screen="2" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/6003.jpg?v=20150105"><div class="innerColor" style="background-color:#66299e;"></div></div>
			                                                    <div class="themesColor" id="coloritem6004" _ttype="0" _tkey="t6004" color="8" _path="${ctx_web}/css/template/6004.min.css?v=201508311727" _widenav="1" _layout="7" tpl="0" _bannerid="60004" _screen="2" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/6004.jpg?v=20150105"><div class="innerColor" style="background-color:#009a00;"></div></div>
			                                                    <div class="themesColor" id="coloritem6005" _ttype="0" _tkey="t6005" color="4" _path="${ctx_web}/css/template/6005.min.css?v=201508311727" _widenav="1" _layout="7" tpl="0" _bannerid="60005" _screen="2" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/6005.jpg?v=20150105"><div class="innerColor" style="background-color:#1aa0b9;"></div></div>
			                                                    <div class="themesColor" id="coloritem6006" _ttype="0" _tkey="t6006" color="32" _path="${ctx_web}/css/template/6006.min.css?v=201508311727" _widenav="1" _layout="7" tpl="0" _bannerid="60006" _screen="2" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/6006.jpg?v=20150105"><div class="innerColor" style="background-color:#ee720e;"></div></div>
			                                                </div>
			                                            </div>
			                                            <div id="item8001" class="quickDressTemplateItem new" _tkey="t8001" _ttype="0" color="16" _path="${ctx_web}/css/template/8001.min.css?v=201510121802" _widenav="0" _layout="1" tpl="0" _bannerid="80001" _bannerweight="12" _screen="0" _tpltype="1">
			                                                <div class="previewImgDiv">
			                                                    <div class="innerImgDiv new" width="159" height="80" style="margin:0 auto;">
			                                                    	<table style="height:100%; width:100%; text-align:center;" align="center">
			                                                    		<tbody><tr>
			                                                    			<td>
																				<img style="display: inline;" class="previewImg" src="${ctx_web}/image/template/preview/8001.jpg" data-original="${ctx_web}/image/template/preview/8001.jpg?v=20150105">
			                                                    			</td>
			                                                    		</tr>
			                                                    	</tbody></table>
			                                                    </div>
			                                                </div>
			                                                <div class="vipBottom newThemebord " _colorcount="5">
			                                                    <div class="themesColor" id="coloritem8001" _ttype="0" _tkey="t8001" color="16" _path="${ctx_web}/css/template/8001.min.css?v=201510121802" _widenav="0" _layout="1" tpl="0" _bannerid="80001" _screen="0" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/8001.jpg?v=20150105"><div class="innerColor" style="background-color:#df3838;"></div></div>
			                                                    <div class="themesColor" id="coloritem8002" _ttype="0" _tkey="t8002" color="8" _path="${ctx_web}/css/template/8002.min.css?v=201508311727" _widenav="0" _layout="1" tpl="0" _bannerid="80002" _screen="0" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/8002.jpg?v=20150105"><div class="innerColor" style="background-color:#30a030;"></div></div>
			                                                    <div class="themesColor" id="coloritem8003" _ttype="0" _tkey="t8003" color="4" _path="${ctx_web}/css/template/8003.min.css?v=201508311727" _widenav="0" _layout="1" tpl="0" _bannerid="80002" _screen="0" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/8003.jpg?v=20150105"><div class="innerColor" style="background-color:#30709d;"></div></div>
			                                                    <div class="themesColor" id="coloritem8004" _ttype="0" _tkey="t8004" color="32" _path="${ctx_web}/css/template/8004.min.css?v=201508311727" _widenav="0" _layout="1" tpl="0" _bannerid="80001" _screen="0" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/8004.jpg?v=20150105"><div class="innerColor" style="background-color:#eb960f;"></div></div>
			                                                    <div class="themesColor" id="coloritem8005" _ttype="0" _tkey="t8005" color="8" _path="${ctx_web}/css/template/8005.min.css?v=201508311727" _widenav="0" _layout="1" tpl="0" _bannerid="80002" _screen="0" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/8005.jpg?v=20150105"><div class="innerColor" style="background-color:#0ab8c5;"></div></div>
			                                                </div>
			                                            </div>
			                                            <div id="item9001" class="quickDressTemplateItem new" _tkey="t9001" _ttype="0" color="1" _path="${ctx_web}/css/template/9001.min.css?v=201508311727" _widenav="1" _layout="0" tpl="0" _bannerid="90001" _bannerweight="6" _screen="1" _tpltype="1">
			                                                <div class="previewImgDiv">
			                                                    <div class="innerImgDiv new" width="159" height="80" style="margin:0 auto;">
			                                                    	<table style="height:100%; width:100%; text-align:center;" align="center">
			                                                    		<tbody><tr>
			                                                    			<td>
																				<img style="display: inline;" class="previewImg" src="${ctx_web}/image/template/preview/9001.jpg" data-original="${ctx_web}/image/template/preview/9001.jpg?v=20150126">
			                                                    			</td>
			                                                    		</tr>
			                                                    	</tbody></table>
			                                                    </div>
			                                                </div>
			                                                <div class="vipBottom newThemebord " _colorcount="6">
			                                                    <div class="themesColor" id="coloritem9001" _ttype="0" _tkey="t9001" color="1" _path="${ctx_web}/css/template/9001.min.css?v=201508311727" _widenav="1" _layout="0" tpl="0" _bannerid="90001" _screen="1" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/9001.jpg?v=20150126"><div class="innerColor" style="background-color:#000000;"></div></div>
			                                                    <div class="themesColor" id="coloritem9002" _ttype="0" _tkey="t9002" color="4" _path="${ctx_web}/css/template/9002.min.css?v=201508311727" _widenav="1" _layout="0" tpl="0" _bannerid="90002" _screen="1" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/9002.jpg?v=20150126"><div class="innerColor" style="background-color:#275a71;"></div></div>
			                                                    <div class="themesColor" id="coloritem9003" _ttype="0" _tkey="t9003" color="4" _path="${ctx_web}/css/template/9003.min.css?v=201508311727" _widenav="1" _layout="0" tpl="0" _bannerid="90003" _screen="1" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/9003.jpg?v=20150126"><div class="innerColor" style="background-color:#0b5899;"></div></div>
			                                                    <div class="themesColor" id="coloritem9004" _ttype="0" _tkey="t9004" color="8" _path="${ctx_web}/css/template/9004.min.css?v=201508311727" _widenav="1" _layout="0" tpl="0" _bannerid="90004" _screen="1" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/9004.jpg?v=20150126"><div class="innerColor" style="background-color:#0a624b;"></div></div>
			                                                    <div class="themesColor" id="coloritem9005" _ttype="0" _tkey="t9005" color="32" _path="${ctx_web}/css/template/9005.min.css?v=201508311727" _widenav="1" _layout="0" tpl="0" _bannerid="90005" _screen="1" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/9005.jpg?v=20150126"><div class="innerColor" style="background-color:#ff8700;"></div></div>
			                                                    <div class="themesColor" id="coloritem9006" _ttype="0" _tkey="t9006" color="16" _path="${ctx_web}/css/template/9006.min.css?v=201508311727" _widenav="1" _layout="0" tpl="0" _bannerid="90006" _screen="1" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/9006.jpg?v=20150126"><div class="innerColor" style="background-color:#b81c22;"></div></div>
			                                                </div>
			                                            </div>
			                                            <div id="item12001" class="quickDressTemplateItem new" _tkey="t12001" _ttype="0" color="1" _path="${ctx_web}/css/template/12001.min.css?v=201512211736" _widenav="0" _layout="7" tpl="0" _bannerid="120001" _bannerweight="21" _screen="2" _tpltype="1">
			                                                <div class="previewImgDiv">
			                                                    <div class="innerImgDiv new" width="159" height="80" style="margin:0 auto;">
			                                                    	<table style="height:100%; width:100%; text-align:center;" align="center">
			                                                    		<tbody><tr>
			                                                    			<td>
																				<img style="display: inline;" class="previewImg" src="${ctx_web}/image/template/preview/12001.jpg" data-original="${ctx_web}/image/template/preview/12001.jpg?v=20150105">
			                                                    			</td>
			                                                    		</tr>
			                                                    	</tbody></table>
			                                                    </div>
			                                                </div>
			                                                <div class="vipBottom newThemebord " _colorcount="5">
			                                                    <div class="themesColor" id="coloritem12001" _ttype="0" _tkey="t12001" color="1" _path="${ctx_web}/css/template/12001.min.css?v=201512211736" _widenav="0" _layout="7" tpl="0" _bannerid="120001" _screen="2" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/12001.jpg?v=20150105"><div class="innerColor" style="background-color:#343434;"></div></div>
			                                                    <div class="themesColor" id="coloritem12002" _ttype="0" _tkey="t12002" color="4" _path="${ctx_web}/css/template/12002.min.css?v=201512211736" _widenav="0" _layout="7" tpl="0" _bannerid="120002" _screen="2" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/12002.jpg?v=20150105"><div class="innerColor" style="background-color:#1847b2;"></div></div>
			                                                    <div class="themesColor" id="coloritem12003" _ttype="0" _tkey="t12003" color="8" _path="${ctx_web}/css/template/12003.min.css?v=201512211736" _widenav="0" _layout="7" tpl="0" _bannerid="120003" _screen="2" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/12003.jpg?v=20150105"><div class="innerColor" style="background-color:#00603d;"></div></div>
			                                                    <div class="themesColor" id="coloritem12004" _ttype="0" _tkey="t12004" color="32" _path="${ctx_web}/css/template/12004.min.css?v=201512211736" _widenav="0" _layout="7" tpl="0" _bannerid="120004" _screen="2" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/12004.jpg?v=20150105"><div class="innerColor" style="background-color:#ff680b;"></div></div>
			                                                    <div class="themesColor" id="coloritem12005" _ttype="0" _tkey="t12005" color="16" _path="${ctx_web}/css/template/12005.min.css?v=201512211736" _widenav="0" _layout="7" tpl="0" _bannerid="120005" _screen="2" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/12005.jpg?v=20150105"><div class="innerColor" style="background-color:#8f0000;"></div></div>
			                                                </div>
			                                            </div>
			                                            <div id="item15001" class="quickDressTemplateItem new" _tkey="t15001" _ttype="0" color="8" _path="${ctx_web}/css/template/15001.min.css?v=201508311727" _widenav="0" _layout="1" tpl="0" _bannerid="150001" _bannerweight="15" _screen="0" _tpltype="1">
			                                                <div class="previewImgDiv">
			                                                    <div class="innerImgDiv new" width="159" height="80" style="margin:0 auto;">
			                                                    	<table style="height:100%; width:100%; text-align:center;" align="center">
			                                                    		<tbody><tr>
			                                                    			<td>
																				<img style="display: inline;" class="previewImg" src="${ctx_web}/image/template/preview/15001.jpg" data-original="${ctx_web}/image/template/preview/15001.jpg?v=20150108">
			                                                    			</td>
			                                                    		</tr>
			                                                    	</tbody></table>
			                                                    </div>
			                                                </div>
			                                                <div class="vipBottom newThemebord " _colorcount="6">
			                                                    <div class="themesColor" id="coloritem15001" _ttype="0" _tkey="t15001" color="8" _path="${ctx_web}/css/template/15001.min.css?v=201508311727" _widenav="0" _layout="1" tpl="0" _bannerid="150001" _screen="0" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/15001.jpg?v=20150108"><div class="innerColor" style="background-color:#688890;"></div></div>
			                                                    <div class="themesColor" id="coloritem15002" _ttype="0" _tkey="t15002" color="4" _path="${ctx_web}/css/template/15002.min.css?v=201508311727" _widenav="0" _layout="1" tpl="0" _bannerid="150002" _screen="0" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/15002.jpg?v=20150108"><div class="innerColor" style="background-color:#446381;"></div></div>
			                                                    <div class="themesColor" id="coloritem15003" _ttype="0" _tkey="t15003" color="8" _path="${ctx_web}/css/template/15003.min.css?v=201508311727" _widenav="0" _layout="1" tpl="0" _bannerid="150003" _screen="0" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/15003.jpg?v=20150108"><div class="innerColor" style="background-color:#36654e;"></div></div>
			                                                    <div class="themesColor" id="coloritem15004" _ttype="0" _tkey="t15004" color="2" _path="${ctx_web}/css/template/15004.min.css?v=201508311727" _widenav="0" _layout="1" tpl="0" _bannerid="150004" _screen="0" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/15004.jpg?v=20150108"><div class="innerColor" style="background-color:#7e8387;"></div></div>
			                                                    <div class="themesColor" id="coloritem15005" _ttype="0" _tkey="t15005" color="16" _path="${ctx_web}/css/template/15005.min.css?v=201508311727" _widenav="0" _layout="1" tpl="0" _bannerid="150005" _screen="0" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/15005.jpg?v=20150108"><div class="innerColor" style="background-color:#54577d;"></div></div>
			                                                    <div class="themesColor" id="coloritem15006" _ttype="0" _tkey="t15006" color="16" _path="${ctx_web}/css/template/15006.min.css?v=201508311727" _widenav="0" _layout="1" tpl="0" _bannerid="150006" _screen="0" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/15006.jpg?v=20150108"><div class="innerColor" style="background-color:#733030;"></div></div>
			                                                </div>
			                                            </div>
			                                            <div id="item16001" class="quickDressTemplateItem new" _tkey="t16001" _ttype="0" color="32" _path="${ctx_web}/css/template/16001.min.css?v=201508311727" _widenav="0" _layout="1" tpl="0" _bannerid="160001" _bannerweight="14" _screen="0" _tpltype="1">
			                                                <div class="previewImgDiv">
			                                                    <div class="innerImgDiv new" width="159" height="80" style="margin:0 auto;">
			                                                    	<table style="height:100%; width:100%; text-align:center;" align="center">
			                                                    		<tbody><tr>
			                                                    			<td>
																				<img style="display: inline;" class="previewImg" src="${ctx_web}/image/template/preview/16001.jpg" data-original="${ctx_web}/image/template/preview/16001.jpg?v=20150105">
			                                                    			</td>
			                                                    		</tr>
			                                                    	</tbody></table>
			                                                    </div>
			                                                </div>
			                                                <div class="vipBottom newThemebord " _colorcount="5">
			                                                    <div class="themesColor" id="coloritem16001" _ttype="0" _tkey="t16001" color="32" _path="${ctx_web}/css/template/16001.min.css?v=201508311727" _widenav="0" _layout="1" tpl="0" _bannerid="160001" _screen="0" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/16001.jpg?v=20150105"><div class="innerColor" style="background-color:#f47c0e;"></div></div>
			                                                    <div class="themesColor" id="coloritem16002" _ttype="0" _tkey="t16002" color="16" _path="${ctx_web}/css/template/16002.min.css?v=201508311727" _widenav="0" _layout="1" tpl="0" _bannerid="160002" _screen="0" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/16002.jpg?v=20150105"><div class="innerColor" style="background-color:#b50100;"></div></div>
			                                                    <div class="themesColor" id="coloritem16003" _ttype="0" _tkey="t16003" color="1" _path="${ctx_web}/css/template/16003.min.css?v=201508311727" _widenav="0" _layout="1" tpl="0" _bannerid="160003" _screen="0" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/16003.jpg?v=20150105"><div class="innerColor" style="background-color:#131313;"></div></div>
			                                                    <div class="themesColor" id="coloritem16004" _ttype="0" _tkey="t16004" color="4" _path="${ctx_web}/css/template/16004.min.css?v=201508311727" _widenav="0" _layout="1" tpl="0" _bannerid="160004" _screen="0" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/16004.jpg?v=20150105"><div class="innerColor" style="background-color:#16498b;"></div></div>
			                                                    <div class="themesColor" id="coloritem16005" _ttype="0" _tkey="t16005" color="8" _path="${ctx_web}/css/template/16005.min.css?v=201508311727" _widenav="0" _layout="1" tpl="0" _bannerid="160005" _screen="0" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/16005.jpg?v=20150105"><div class="innerColor" style="background-color:#336415;"></div></div>
			                                                </div>
			                                            </div>
			                                            <div id="item19001" class="quickDressTemplateItem new" _tkey="t19001" _ttype="0" color="1" _path="${ctx_web}/css/template/19001.min.css?v=201508311727" _widenav="1" _layout="1" tpl="0" _bannerid="190001" _bannerweight="6" _screen="1" _tpltype="1">
			                                                <div class="previewImgDiv">
			                                                    <div class="innerImgDiv new" width="159" height="80" style="margin:0 auto;">
			                                                    	<table style="height:100%; width:100%; text-align:center;" align="center">
			                                                    		<tbody><tr>
			                                                    			<td>
																				<img style="display: inline;" class="previewImg" src="${ctx_web}/image/template/preview/19001.jpg" data-original="${ctx_web}/image/template/preview/19001.jpg?v=20150126">
			                                                    			</td>
			                                                    		</tr>
			                                                    	</tbody></table>
			                                                    </div>
			                                                </div>
			                                                <div class="vipBottom newThemebord " _colorcount="6">
			                                                    <div class="themesColor" id="coloritem19001" _ttype="0" _tkey="t19001" color="1" _path="${ctx_web}/css/template/19001.min.css?v=201508311727" _widenav="1" _layout="1" tpl="0" _bannerid="190001" _screen="1" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/19001.jpg?v=20150126"><div class="innerColor" style="background-color:#353535;"></div></div>
			                                                    <div class="themesColor" id="coloritem19002" _ttype="0" _tkey="t19002" color="4" _path="${ctx_web}/css/template/19002.min.css?v=201508311727" _widenav="1" _layout="1" tpl="0" _bannerid="190002" _screen="1" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/19002.jpg?v=20150108"><div class="innerColor" style="background-color:#20293b;"></div></div>
			                                                    <div class="themesColor" id="coloritem19003" _ttype="0" _tkey="t19003" color="1" _path="${ctx_web}/css/template/19003.min.css?v=201508311727" _widenav="1" _layout="1" tpl="0" _bannerid="190003" _screen="1" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/19003.jpg?v=20150108"><div class="innerColor" style="background-color:#5e3200;"></div></div>
			                                                    <div class="themesColor" id="coloritem19004" _ttype="0" _tkey="t19004" color="8" _path="${ctx_web}/css/template/19004.min.css?v=201508311727" _widenav="1" _layout="1" tpl="0" _bannerid="190004" _screen="1" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/19004.jpg?v=20150108"><div class="innerColor" style="background-color:#1f3624;"></div></div>
			                                                    <div class="themesColor" id="coloritem19005" _ttype="0" _tkey="t19005" color="16" _path="${ctx_web}/css/template/19005.min.css?v=201508311727" _widenav="1" _layout="1" tpl="0" _bannerid="190005" _screen="1" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/19005.jpg?v=20150108"><div class="innerColor" style="background-color:#621f00;"></div></div>
			                                                    <div class="themesColor" id="coloritem19006" _ttype="0" _tkey="t19006" color="8" _path="${ctx_web}/css/template/19006.min.css?v=201509071734" _widenav="1" _layout="1" tpl="0" _bannerid="190006" _screen="1" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/19006.jpg?v=20150108"><div class="innerColor" style="background-color:#134348;"></div></div>
			                                                </div>
			                                            </div>
			                                            <div id="item20001" class="quickDressTemplateItem new" _tkey="t20001" _ttype="0" color="16" _path="${ctx_web}/css/template/20001.min.css?v=201508311727" _widenav="0" _layout="1" tpl="0" _bannerid="200001" _bannerweight="6" _screen="1" _tpltype="1">
			                                                <div class="previewImgDiv">
			                                                    <div class="innerImgDiv new" width="159" height="80" style="margin:0 auto;">
			                                                    	<table style="height:100%; width:100%; text-align:center;" align="center">
			                                                    		<tbody><tr>
			                                                    			<td>
																				<img style="display: inline;" class="previewImg" src="${ctx_web}/image/template/preview/20001.jpg" data-original="${ctx_web}/image/template/preview/20001.jpg?v=20150107">
			                                                    			</td>
			                                                    		</tr>
			                                                    	</tbody></table>
			                                                    </div>
			                                                </div>
			                                                <div class="vipBottom newThemebord " _colorcount="6">
			                                                    <div class="themesColor" id="coloritem20001" _ttype="0" _tkey="t20001" color="16" _path="${ctx_web}/css/template/20001.min.css?v=201508311727" _widenav="0" _layout="1" tpl="0" _bannerid="200001" _screen="1" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/20001.jpg?v=20150107"><div class="innerColor" style="background-color:#910000;"></div></div>
			                                                    <div class="themesColor" id="coloritem20002" _ttype="0" _tkey="t20002" color="32" _path="${ctx_web}/css/template/20002.min.css?v=201508311727" _widenav="0" _layout="1" tpl="0" _bannerid="200002" _screen="1" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/20002.jpg?v=20150107"><div class="innerColor" style="background-color:#ba3d00;"></div></div>
			                                                    <div class="themesColor" id="coloritem20003" _ttype="0" _tkey="t20003" color="4" _path="${ctx_web}/css/template/20003.min.css?v=201508311727" _widenav="0" _layout="1" tpl="0" _bannerid="200003" _screen="1" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/20003.jpg?v=20150107"><div class="innerColor" style="background-color:#2255aa;"></div></div>
			                                                    <div class="themesColor" id="coloritem20004" _ttype="0" _tkey="t20004" color="8" _path="${ctx_web}/css/template/20004.min.css?v=201508311727" _widenav="0" _layout="1" tpl="0" _bannerid="200004" _screen="1" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/20004.jpg?v=20150107"><div class="innerColor" style="background-color:#007871;"></div></div>
			                                                    <div class="themesColor" id="coloritem20005" _ttype="0" _tkey="t20005" color="16" _path="${ctx_web}/css/template/20005.min.css?v=201508311727" _widenav="0" _layout="1" tpl="0" _bannerid="200005" _screen="1" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/20005.jpg?v=20150107"><div class="innerColor" style="background-color:#404aa0;"></div></div>
			                                                    <div class="themesColor" id="coloritem20006" _ttype="0" _tkey="t20006" color="1" _path="${ctx_web}/css/template/20006.min.css?v=201508311727" _widenav="0" _layout="1" tpl="0" _bannerid="200006" _screen="1" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/20006.jpg?v=20150107"><div class="innerColor" style="background-color:#000000;"></div></div>
			                                                </div>
			                                            </div>
			                                            <div id="item21001" class="quickDressTemplateItem new" _tkey="t21001" _ttype="0" color="1" _path="${ctx_web}/css/template/21001.min.css?v=201508311727" _widenav="1" _layout="0" tpl="0" _bannerid="210001" _bannerweight="6" _screen="1" _tpltype="1">
			                                                <div class="previewImgDiv">
			                                                    <div class="innerImgDiv new" width="159" height="80" style="margin:0 auto;">
			                                                    	<table style="height:100%; width:100%; text-align:center;" align="center">
			                                                    		<tbody><tr>
			                                                    			<td>
																				<img style="display: inline;" class="previewImg" src="${ctx_web}/image/template/preview/21001.jpg" data-original="${ctx_web}/image/template/preview/21001.jpg?v=20150131">
			                                                    			</td>
			                                                    		</tr>
			                                                    	</tbody></table>
			                                                    </div>
			                                                </div>
			                                                <div class="vipBottom newThemebord " _colorcount="6">
			                                                    <div class="themesColor" id="coloritem21001" _ttype="0" _tkey="t21001" color="1" _path="${ctx_web}/css/template/21001.min.css?v=201508311727" _widenav="1" _layout="0" tpl="0" _bannerid="210001" _screen="1" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/21001.jpg?v=20150131"><div class="innerColor" style="background-color:#1a1a1a;"></div></div>
			                                                    <div class="themesColor" id="coloritem21002" _ttype="0" _tkey="t21002" color="16" _path="${ctx_web}/css/template/21002.min.css?v=201508311727" _widenav="1" _layout="0" tpl="0" _bannerid="210002" _screen="1" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/21002.jpg?v=20150131"><div class="innerColor" style="background-color:#520017;"></div></div>
			                                                    <div class="themesColor" id="coloritem21003" _ttype="0" _tkey="t21003" color="2" _path="${ctx_web}/css/template/21003.min.css?v=201508311727" _widenav="1" _layout="0" tpl="0" _bannerid="210003" _screen="1" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/21003.jpg?v=20150131"><div class="innerColor" style="background-color:#393939;"></div></div>
			                                                    <div class="themesColor" id="coloritem21004" _ttype="0" _tkey="t21004" color="4" _path="${ctx_web}/css/template/21004.min.css?v=201508311727" _widenav="1" _layout="0" tpl="0" _bannerid="210004" _screen="1" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/21004.jpg?v=20150131"><div class="innerColor" style="background-color:#004da4;"></div></div>
			                                                    <div class="themesColor" id="coloritem21005" _ttype="0" _tkey="t21005" color="8" _path="${ctx_web}/css/template/21005.min.css?v=201508311727" _widenav="1" _layout="0" tpl="0" _bannerid="210005" _screen="1" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/21005.jpg?v=20150131"><div class="innerColor" style="background-color:#035f60;"></div></div>
			                                                    <div class="themesColor" id="coloritem21006" _ttype="0" _tkey="t21006" color="16" _path="${ctx_web}/css/template/21006.min.css?v=201508311727" _widenav="1" _layout="0" tpl="0" _bannerid="210006" _screen="1" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/21006.jpg?v=20150131"><div class="innerColor" style="background-color:#20103f;"></div></div>
			                                                </div>
			                                            </div>
			                                            <div id="item22001" class="quickDressTemplateItem new" _tkey="t22001" _ttype="0" color="16" _path="${ctx_web}/css/template/22001.min.css?v=201508311727" _widenav="0" _layout="1" tpl="0" _bannerid="220001" _bannerweight="15" _screen="1" _tpltype="1">
			                                                <div class="previewImgDiv">
			                                                    <div class="innerImgDiv new" width="159" height="80" style="margin:0 auto;">
			                                                    	<table style="height:100%; width:100%; text-align:center;" align="center">
			                                                    		<tbody><tr>
			                                                    			<td>
																				<img style="display: inline;" class="previewImg" src="${ctx_web}/image/template/preview/22001.jpg" data-original="${ctx_web}/image/template/preview/22001.jpg?v=20150122">
			                                                    			</td>
			                                                    		</tr>
			                                                    	</tbody></table>
			                                                    </div>
			                                                </div>
			                                                <div class="vipBottom newThemebord " _colorcount="5">
			                                                    <div class="themesColor" id="coloritem22001" _ttype="0" _tkey="t22001" color="16" _path="${ctx_web}/css/template/22001.min.css?v=201508311727" _widenav="0" _layout="1" tpl="0" _bannerid="220001" _screen="1" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/22001.jpg?v=20150122"><div class="innerColor" style="background-color:#301d29;"></div></div>
			                                                    <div class="themesColor" id="coloritem22002" _ttype="0" _tkey="t22002" color="16" _path="${ctx_web}/css/template/22002.min.css?v=201508311727" _widenav="0" _layout="1" tpl="0" _bannerid="220001" _screen="1" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/22002.jpg?v=20150122"><div class="innerColor" style="background-color:#500000;"></div></div>
			                                                    <div class="themesColor" id="coloritem22003" _ttype="0" _tkey="t22003" color="1" _path="${ctx_web}/css/template/22003.min.css?v=201508311727" _widenav="0" _layout="1" tpl="0" _bannerid="220001" _screen="1" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/22003.jpg?v=20150122"><div class="innerColor" style="background-color:#3e1e0f;"></div></div>
			                                                    <div class="themesColor" id="coloritem22004" _ttype="0" _tkey="t22004" color="4" _path="${ctx_web}/css/template/22004.min.css?v=201508311727" _widenav="0" _layout="1" tpl="0" _bannerid="220001" _screen="1" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/22004.jpg?v=20150122"><div class="innerColor" style="background-color:#001b44;"></div></div>
			                                                    <div class="themesColor" id="coloritem22005" _ttype="0" _tkey="t22005" color="1" _path="${ctx_web}/css/template/22005.min.css?v=201508311727" _widenav="0" _layout="1" tpl="0" _bannerid="220001" _screen="1" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/22005.jpg?v=20150122"><div class="innerColor" style="background-color:#000000;"></div></div>
			                                                </div>
			                                            </div>
			                                            <div id="item23001" class="quickDressTemplateItem new" _tkey="t23001" _ttype="0" color="32" _path="${ctx_web}/css/template/23001.min.css?v=201508311727" _widenav="0" _layout="7" tpl="0" _bannerid="230001" _bannerweight="21" _screen="2" _tpltype="1">
			                                                <div class="previewImgDiv">
			                                                    <div class="innerImgDiv new" width="159" height="80" style="margin:0 auto;">
			                                                    	<table style="height:100%; width:100%; text-align:center;" align="center">
			                                                    		<tbody><tr>
			                                                    			<td>
																				<img style="display: inline;" class="previewImg" src="${ctx_web}/image/template/preview/23001.jpg" data-original="${ctx_web}/image/template/preview/23001.jpg?v=20150127">
			                                                    			</td>
			                                                    		</tr>
			                                                    	</tbody></table>
			                                                    </div>
			                                                </div>
			                                                <div class="vipBottom newThemebord " _colorcount="6">
			                                                    <div class="themesColor" id="coloritem23001" _ttype="0" _tkey="t23001" color="32" _path="${ctx_web}/css/template/23001.min.css?v=201508311727" _widenav="0" _layout="7" tpl="0" _bannerid="230001" _screen="2" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/23001.jpg?v=20150127"><div class="innerColor" style="background-color:#f69e0e;"></div></div>
			                                                    <div class="themesColor" id="coloritem23002" _ttype="0" _tkey="t23002" color="16" _path="${ctx_web}/css/template/23002.min.css?v=201508311727" _widenav="0" _layout="7" tpl="0" _bannerid="230002" _screen="1" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/23002.jpg?v=20150127"><div class="innerColor" style="background-color:#212121;"></div></div>
			                                                    <div class="themesColor" id="coloritem23003" _ttype="0" _tkey="t23003" color="16" _path="${ctx_web}/css/template/23003.min.css?v=201508311727" _widenav="0" _layout="7" tpl="0" _bannerid="230003" _screen="2" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/23003.jpg?v=20150127"><div class="innerColor" style="background-color:#920050;"></div></div>
			                                                    <div class="themesColor" id="coloritem23004" _ttype="0" _tkey="t23004" color="4" _path="${ctx_web}/css/template/23004.min.css?v=201508311727" _widenav="0" _layout="7" tpl="0" _bannerid="230004" _screen="2" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/23004.jpg?v=20150127"><div class="innerColor" style="background-color:#0073bc;"></div></div>
			                                                    <div class="themesColor" id="coloritem23005" _ttype="0" _tkey="t23005" color="8" _path="${ctx_web}/css/template/23005.min.css?v=201508311727" _widenav="0" _layout="7" tpl="0" _bannerid="230005" _screen="2" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/23005.jpg?v=20150127"><div class="innerColor" style="background-color:#00947d;"></div></div>
			                                                    <div class="themesColor" id="coloritem23006" _ttype="0" _tkey="t23006" color="16" _path="${ctx_web}/css/template/23006.min.css?v=201508311727" _widenav="0" _layout="7" tpl="0" _bannerid="230006" _screen="2" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/23006.jpg?v=20150127"><div class="innerColor" style="background-color:#4c3588;"></div></div>
			                                                </div>
			                                            </div>
			                                            <div id="item24001" class="quickDressTemplateItem new" _tkey="t24001" _ttype="0" color="16" _path="${ctx_web}/css/template/24001.min.css?v=201508311727" _widenav="0" _layout="1" tpl="0" _bannerid="240001" _bannerweight="6" _screen="1" _tpltype="1">
			                                                <div class="previewImgDiv">
			                                                    <div class="innerImgDiv new" width="159" height="80" style="margin:0 auto;">
			                                                    	<table style="height:100%; width:100%; text-align:center;" align="center">
			                                                    		<tbody><tr>
			                                                    			<td>
																				<img style="display: inline;" class="previewImg" src="${ctx_web}/image/template/preview/24001.jpg" data-original="${ctx_web}/image/template/preview/24001.jpg?v=20150112">
			                                                    			</td>
			                                                    		</tr>
			                                                    	</tbody></table>
			                                                    </div>
			                                                </div>
			                                                <div class="vipBottom newThemebord " _colorcount="6">
			                                                    <div class="themesColor" id="coloritem24001" _ttype="0" _tkey="t24001" color="16" _path="${ctx_web}/css/template/24001.min.css?v=201508311727" _widenav="0" _layout="1" tpl="0" _bannerid="240001" _screen="1" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/24001.jpg?v=20150112"><div class="innerColor" style="background-color:#503a60;"></div></div>
			                                                    <div class="themesColor" id="coloritem24002" _ttype="0" _tkey="t24002" color="8" _path="${ctx_web}/css/template/24002.min.css?v=201508311727" _widenav="0" _layout="1" tpl="0" _bannerid="240002" _screen="1" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/24002.jpg?v=20150112"><div class="innerColor" style="background-color:#036c70;"></div></div>
			                                                    <div class="themesColor" id="coloritem24003" _ttype="0" _tkey="t24003" color="4" _path="${ctx_web}/css/template/24003.min.css?v=201508311727" _widenav="0" _layout="1" tpl="0" _bannerid="240003" _screen="1" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/24003.jpg?v=20150112"><div class="innerColor" style="background-color:#005d98;"></div></div>
			                                                    <div class="themesColor" id="coloritem24004" _ttype="0" _tkey="t24004" color="16" _path="${ctx_web}/css/template/24004.min.css?v=201508311727" _widenav="0" _layout="1" tpl="0" _bannerid="240004" _screen="1" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/24004.jpg?v=20150112"><div class="innerColor" style="background-color:#77001b;"></div></div>
			                                                    <div class="themesColor" id="coloritem24005" _ttype="0" _tkey="t24005" color="2" _path="${ctx_web}/css/template/24005.min.css?v=201508311727" _widenav="0" _layout="1" tpl="0" _bannerid="240005" _screen="1" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/24005.jpg?v=20150112"><div class="innerColor" style="background-color:#474747;"></div></div>
			                                                    <div class="themesColor" id="coloritem24006" _ttype="0" _tkey="t24006" color="1" _path="${ctx_web}/css/template/24006.min.css?v=201508311727" _widenav="0" _layout="1" tpl="0" _bannerid="240006" _screen="1" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/24006.jpg?v=20150112"><div class="innerColor" style="background-color:#131313;"></div></div>
			                                                </div>
			                                            </div>
			                                            <div id="item25001" class="quickDressTemplateItem new" _tkey="t25001" _ttype="0" color="16" _path="${ctx_web}/css/template/25001.min.css?v=201508311727" _widenav="0" _layout="7" tpl="0" _bannerid="250001" _bannerweight="21" _screen="2" _tpltype="1">
			                                                <div class="previewImgDiv">
			                                                    <div class="innerImgDiv new" width="159" height="80" style="margin:0 auto;">
			                                                    	<table style="height:100%; width:100%; text-align:center;" align="center">
			                                                    		<tbody><tr>
			                                                    			<td>
																				<img style="display: inline;" class="previewImg" src="${ctx_web}/image/template/preview/25001.jpg" data-original="${ctx_web}/image/template/preview/25001.jpg?v=20150114">
			                                                    			</td>
			                                                    		</tr>
			                                                    	</tbody></table>
			                                                    </div>
			                                                </div>
			                                                <div class="vipBottom newThemebord " _colorcount="6">
			                                                    <div class="themesColor" id="coloritem25001" _ttype="0" _tkey="t25001" color="16" _path="${ctx_web}/css/template/25001.min.css?v=201508311727" _widenav="0" _layout="7" tpl="0" _bannerid="250001" _screen="2" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/25001.jpg?v=20150114"><div class="innerColor" style="background-color:#8e086e;"></div></div>
			                                                    <div class="themesColor" id="coloritem25002" _ttype="0" _tkey="t25002" color="16" _path="${ctx_web}/css/template/25002.min.css?v=201508311727" _widenav="0" _layout="7" tpl="0" _bannerid="250001" _screen="2" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/25002.jpg?v=20150114"><div class="innerColor" style="background-color:#3e278e;"></div></div>
			                                                    <div class="themesColor" id="coloritem25003" _ttype="0" _tkey="t25003" color="16" _path="${ctx_web}/css/template/25003.min.css?v=201508311727" _widenav="0" _layout="7" tpl="0" _bannerid="250001" _screen="2" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/25003.jpg?v=20150114"><div class="innerColor" style="background-color:#8d0028;"></div></div>
			                                                    <div class="themesColor" id="coloritem25004" _ttype="0" _tkey="t25004" color="1" _path="${ctx_web}/css/template/25004.min.css?v=201508311727" _widenav="0" _layout="7" tpl="0" _bannerid="250001" _screen="2" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/25004.jpg?v=20150114"><div class="innerColor" style="background-color:#301824;"></div></div>
			                                                    <div class="themesColor" id="coloritem25005" _ttype="0" _tkey="t25005" color="2" _path="${ctx_web}/css/template/25005.min.css?v=201508311727" _widenav="0" _layout="7" tpl="0" _bannerid="250001" _screen="2" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/25005.jpg?v=20150114"><div class="innerColor" style="background-color:#333333;"></div></div>
			                                                    <div class="themesColor" id="coloritem25006" _ttype="0" _tkey="t25006" color="4" _path="${ctx_web}/css/template/25006.min.css?v=201508311727" _widenav="0" _layout="7" tpl="0" _bannerid="250001" _screen="2" _tpltype="1" _pvimg="${ctx_web}/image/template/preview/25006.jpg?v=20150114"><div class="innerColor" style="background-color:#003d82;"></div></div>
			                                                </div>
			                                            </div>
			                                        </div>
												</div>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>

				</td>
				<td style="width: 1px;"></td>
			</tr>
		</tbody>
	</table>
</body>
</html>