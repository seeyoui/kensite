<%@ page language="java" pageEncoding="UTF-8"%> <%@ include
file="/WEB-INF/view/taglib/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" class="g_htmlManage">

<head>
<title>智慧星河</title>
<%@ include file="/WEB-INF/view/taglib/header.jsp"%>
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
<link href="${ctx_web}/css/styleGlobal.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="${ctx_web}/js/2052.js"></script>

<script type="text/javascript">
var initFinish = false;
var allowedUsed = true;
var allowedBusiness = false;
var pdIndependence = false;
var ndIndependence = false;
var prIndependence = false;
var nrIndependence = false;

var isPDCol = false;
var isNDCol = false;
var isPRCol = false;
var isNRCol = false;

function corpTitleCheck(e){
	var set = $(e).parent().find('.aset');
	if($(e).val() == 1)	{
		top._templateTitleData.h = false;
		if (top._useTemplateTitle) {
			top.$("#corpTitle").css("display","block");
			top._titleData.h = false;
			if(initFinish){
				top._titleChanged++;
				Site.styleChanged();
				Site.setRefreshInfo("siteSetting", true);
			}
		}
		set.show();
	}else{
		top._templateTitleData.h = true;
		if (top._useTemplateTitle) {
			top.$("#corpTitle").css("display","none");
			top._titleData.h = true;
			if(initFinish){
				top._titleChanged++;
				Site.styleChanged();
				Site.setRefreshInfo("siteSetting", true);
			}
		}
		set.hide();
	}
}

function memberCheck(e){
	var set = $(e).parent().find('.aset');
	if($(e).val() == 1) {
		if(initFinish){
			top._memberTopBar = true;
			top._memberTopBarChanged++;
			Site.styleChanged();
			Site.createMemberBar(false, false, true, 10);
			Site.setRefreshInfo("siteSetting", true);
		}
		set.show();
	}else{
		if(initFinish){
			top._memberTopBar = false;
			top._memberTopBarChanged++;
			Site.styleChanged();
			Fai.top.$("#memberBarArea").remove();
			Site.setRefreshInfo("siteSetting", true);
		}
		set.hide();
	}
}

function localeCheck(e){
	var set = $(e).parent().find('.aset');
	if($(e).val() == 1) {
		top._templateLocaleData.h = false;
		if (top._useTemplateLocale) {
			top.$("#localer").css("display","block");
			top._localeData.h = false;
			if(initFinish){
				top._localeChanged++;
				Site.styleChanged();
				Site.setRefreshInfo("siteSetting", true);
			}
		}
		set.show();
	}else{
		top._templateLocaleData.h = true;
		if (top._useTemplateLocale) {
			top.$("#localer").css("display","none");
			top._localeData.h = true;
			if(initFinish){
				top._localeChanged++;
				Site.styleChanged();
				Site.setRefreshInfo("siteSetting", true);
			}
		}
		set.hide();
	}
}

function navCheck(e){
	var set = $(e).parent().find('.aset');
	if($(e).val() == 1) {
		top.$("#nav").css("display","block");
		top._navStyleData.no = true;
		$("#navIndependenceBox").show();
		if(initFinish){
			Site.refreshNavContainer();
			top._navStyleChanged++;
			Site.styleChanged();
			Site.setRefreshInfo("siteSetting", true);
		}
		set.show();
	}else{
		top.$("#nav").css("display","none");
		top._navStyleData.no = false;
		$("#navIndependenceBox").hide();
		if(initFinish){
			top._navStyleChanged++;
			Site.styleChanged();
			Site.setRefreshInfo("siteSetting", true);
		}
		set.hide();
	}
	refreshNavDisplay();
}

//是否独立隐藏导航栏
function navIndependence(e){
	if( $(e).prop("checked") ){
		top._navHidden = true;
		if(initFinish){
			Site.refreshNavContainer();
			top._navStyleChanged++;
			Site.styleChanged();
			Site.setRefreshInfo("siteSetting", true);
		}
	}else{
		if( top._navStyleData.no  ){
			$("#navDisplay").trigger("click");
		}
		top._navHidden = false;
		if(initFinish){
			top._navStyleChanged++;
			Site.styleChanged();
			Site.setRefreshInfo("siteSetting", true);
		}
	}
	refreshNavDisplay();
}

//刷新导航栏显示状态
function refreshNavDisplay(){
	if( top._navHidden ){
		top.$("#nav").css("display","none");
	}else{
		if( top._navStyleData.no ){
			top.$("#nav").css("display","block");
		}else{
			top.$("#nav").css("display","none");
		}
	}
}

//
function refreshSetting(){
	//$("input[name=logo]").removeAttr("checked"); // source
	//$("input[name=corpTitle][value=1]").attr("checked", true);
	
	//member login
	if(top._memberTopBar){
		checkedRadio('memberTopbarDisplay');
		$("#memberView").show();
	}else{
		checkedRadio('memberTopbarHidden');
		$("#memberView").hide();
	}
	//corp title
	if (!top._templateTitleData.h) {
		checkedRadio('ctDisplay');
	}else{
		checkedRadio('ctHidden');
	}
	//banner
	if (!top._templateBannerData.h) {
		checkedRadio('bnDisplay');
	}else{
		checkedRadio('bnHidden');
	}
	if (top._useTemplateBanner) {
		$('#bannerCheckSpan').hide();
	} else {
		$('#bannerIndependence').attr("checked", true);
		$('#bannerCheckSpan').show();
		if (top._bannerData.h) {
			$("input[name=bannerInde][value=0]").attr("checked", true);
		} else {
			$("input[name=bannerInde][value=1]").attr("checked", true);
		}
	}
	//locale
	if (!top._templateLocaleData.h) {
		checkedRadio('localeDisplay');
	}else{
		checkedRadio('localeHidden');
	}
	//nav
	if (top._navStyleData.no) {
		checkedRadio('navDisplay');
		$("#navIndependenceBox").show();
	}else{
		checkedRadio('navHidden');
		$("#navIndependenceBox").hide();
	}
	//独立隐藏nav
	if( top._navHidden ){
		$("#navIndependence").attr("checked",true);
	}
	refreshNavDisplay();//刷新导航栏状态

	// browserTitle and browserTitleIndependence
	$("#browserTitle").val( top._templateBrowserTitleData );
	$("#browserTitleIndeText").val(top._pageBrowserTitleData);
	if (top._useTemplateBrowserTitle) {
		$('#browserTitleIndeText').hide();
	} else {
		$('#browserTitleIndependence').attr("checked", true);
		$('#browserTitleIndeText').show();
	}
	if( isPDCol ){
		//$('#browserTitleDiv').empty().html('请直接修改相应产品的资料');
		$('#browserTitleDiv').remove();
	}else if( isNDCol ){
		//$('#browserTitleDiv').empty().html('请直接修改相应文章的资料');
		$('#browserTitleDiv').remove();
	}
	
	// locale item
	if (top.$('#localer').length > 0) {
		$('.localerShow').show();
		$('.localerHide').hide();
	} else {
		$('.localerShow').hide();
		$('.localerHide').show();
	}
	
	<!-- 提示购买升级 -->
	
		$('#searchKeyword').parent().click(function(){
			Fai.ing("百度优化为网站推广版功能，<a href='http://jz.faisco.com/proFunc.jsp' target='_blank'>查看功能详情</a>", true);
		});
		$('#searchKeyword').attr('disabled', true);
		$('#searchDesc').attr('disabled', true);
		$('#searchDesc').parent().click(function(){
			Fai.ing("百度优化为网站推广版功能，<a href='http://jz.faisco.com/proFunc.jsp' target='_blank'>查看功能详情</a>", true);
		});
	
	<!-- //end 提示购买升级 -->
	
}

function openImgPage(){
	window.open('../default.jsp?imgPage=' + Fai.encodeUrl($.toJSON(top._imgPage)));
}

$(function(){
	
	var styleDesignHeight = ~~($.cookie( 'styleDesignHeight', { path:'/'} ));
	if(styleDesignHeight > 100){
		var tabsHeight = Fai.top.$("#styleDesign").children(".tabsWrap").height() || 37;
		var panelsHeight = styleDesignHeight - tabsHeight;
		$('.contentRight').height((panelsHeight - 2)+"px");
		$('.contentLeft').height((panelsHeight - 20)+"px");
	}
	
	//当拖动设置面板调节显示区高度时，触发
	Site.bindGobalEvent("styleDesignResize", function(event, option){
		$('.contentRight').height((option - 2)+"px");
		$('.contentLeft').height((option - 20)+"px");
	});
	
	// 二级tab的hover和check
	$('.menu').hover(function(){
		$(this).addClass('menuHovor');
	}, function(){
		$(this).removeClass('menuHovor');
	});	
	$('#siteSettingShow').click();
	refreshSetting();
	loadPageChange();

	if( !allowedUsed && false && Fai.top._templateType == 0){
		$("#backgroundIndependence").attr("disabled",true);
		$(".J_bgIndependenceSet").hide();
	}else{	
		$("#backgroundIndependence").removeAttr("disabled");
		if( Fai.top._useTemplateBackground == false ){
			$("#backgroundIndependence").attr("checked","checked");
			$(".J_bgIndependenceSet").show();
		}else{
			$(".J_bgIndependenceSet").hide();
		}
	}
	
	if( isPDCol ){
		$("#pdIndependenceDiv").show();
	}else if( isNDCol ){
		$("#ndIndependenceDiv").show();
	}
	if( isPRCol && prIndependence ){
		$("#prIndependenceDiv").show();
	}
	if( isNRCol && nrIndependence ){
		$("#nrIndependenceDiv").show();
	}
	
	if( pdIndependence ){
		$("#pdIndependence").attr("checked","checked");
	}
	if( ndIndependence ){
		$("#ndIndependence").attr("checked","checked");
	}
	if( prIndependence ){
		$("#prIndependence").attr("checked","checked");
	}
	if( nrIndependence ){
		$("#nrIndependence").attr("checked","checked");
	}
	
	if( !allowedBusiness ){
		$("#pdIndependence").attr("disabled",true);
		$("#ndIndependence").attr("disabled",true);
		$("#prIndependence").attr("disabled",true);
		$("#nrIndependence").attr("disabled",true);
	}

	initFinish = true;
	Site.logDog(100039, 5);
	Site.logDog(100044, 0);
	
	Site.bindGobalEvent("site_changeBrowserTitle", function(event, sBrowserTitle){
		$('#browserTitle').val( sBrowserTitle );
	});
	
});

function loadPageChange(){
	// 监听所有input的动作
	$(":input").each(function(i, inputObj){
		var thisInputObj = $(inputObj);
		var thisInputObjId = thisInputObj.attr("id");
		if(thisInputObj.attr("type") == "radio" || thisInputObj.attr("type") == "checkbox"){
			thisInputObj.bind("click",function(){
				Site.styleChanged();
			});
		}else{
			thisInputObj.bind("change",function(){
				Site.styleChanged();
			});
			thisInputObj.bind("keyup",function(){
				Site.styleChanged();
			});
		}
	});
}

function siteSettingShow(){
	$('#siteSetting').show();
	$('#advanceFunc').hide();
	$("#businessFunc").hide();
	var menu = $('#siteSettingShow');
	tabCheck(menu);
}

function advanceFuncShow(){
	$('#advanceFunc').show();
	$('#siteSetting').hide();
	$("#businessFunc").hide();
	var menu = $('#advanceFuncShow');
	tabCheck(menu);
	if ( !$('#advanceFuncFrame').attr("src") ) {
		forWaiting();
		$("#advanceFuncFrame").attr("src", "miscManage.jsp?ram=" + Math.random());
		$("#advanceFuncFrame").load(function(){
			$('#forWaiting').remove();
		});
	}
}

function businessFuncShow(){
	$('#advanceFunc').hide();
	$('#siteSetting').hide();
	$("#businessFunc").show();
	var menu = $('#businessFuncShow');
	tabCheck(menu);
}

function forWaiting(){
	var loading = $("<div id='forWaiting' class='ajaxLoading2' style='position:absolute; background-color:#f7f7f7; width:100%; height:100%; top:0; left:0;'></div>");
	loading.appendTo("#advanceFunc");
}

function tabCheck(ctrl){
	var allTab = $('.menu');
	if ( !ctrl.hasClass('menuCheck') ){
		allTab.removeClass('menuCheck');
		ctrl.addClass('menuCheck');
	}
}

function checkedRadio(name){
	var _this = $('#' + name);
	$("#" + name).click();
}

function searchKeywordChange(e){
	if($(e).val().length >= 200){
		$(e).val( $(e).val().substring(0,200) );
	}
	if(top._useTemplateSearchKeyword){
		top._searchKeywordData = $(e).val();
		top._searchKeywordChanged++;
	}
	top._templateSearchKeywordData = $(e).val();
	top.Site.styleChanged();
}

function searchDescChange(e){
	if($(e).val().length >= 200){
		$(e).val( $(e).val().substring(0, 200) );
	}
	if(top._useTemplateSearchDesc){
		top._searchDescData = $(e).val();
		top._searchDescChanged++;
	}
	top._templateSearchDescData = $(e).val();
	top.Site.styleChanged();
}

function titleSetting(){
	Site.popupWindow({
		title:'编辑网站标题',
		frameSrcUrl:'manage/corpTitleEdit.jsp?ram='+Math.random(),
		width:'403',
		height:'300',
		saveBeforePopup:false});
	Site.removeAllEditLayer();
}

function languageSetting(){
	Site.popupWindow({
		title:'编辑语言导航',
		frameSrcUrl:'manage/locaterEdit.jsp?ram='+Math.random(),
		width:'440',
		height:'485',
		frameScrolling: 'no',
		saveBeforePopup:false});
	Site.removeAllEditLayer();
}
function memberTopbarSetting(){
	Site.popupWindow({
		title:'编辑会员登录条',
		frameSrcUrl:'manage/memberTopbarSetting.jsp?ram='+Math.random(),
		width:'500',
		height:'320',
		frameScrolling: 'no',
		saveBeforePopup:false});
	Site.removeAllEditLayer();

}
/*function viewMemberTopBar() {
	if($("#memberTopbarDisplay").attr("checked")){
		window.open("http://www.seeyoui.icoc.in?_memberTopBar=true");   
	}else{
		window.open("http://www.seeyoui.icoc.in?_memberTopBar=false");   
	}
}*/
function navSetting(){
	Site.popupWindow({
		title:'设置导航栏样式',
		frameSrcUrl:'manage/navStyleEdit.jsp?ram='+Math.random(),
		width:'490',
		height:'330',
		saveBeforePopup:false});
	Site.removeAllEditLayer();
}

function browserTitleIndependence(){
	if($('#browserTitleIndependence').attr("checked")){
		top._useTemplateBrowserTitle = false;
		top.document.title = top._browserTitleExt + top._pageBrowserTitleData;
		top._browserTitleData = top._pageBrowserTitleData;
		$("#browserTitleIndeText").show();
	}else{
		top._useTemplateBrowserTitle = true;
		top.document.title = top._browserTitleExt + top._templateBrowserTitleData;
		top._browserTitleData = top._templateBrowserTitleData;
		$("#browserTitleIndeText").hide();
	}
	top._browserTitleChanged++;
	Site.setRefreshInfo("siteSetting", true);
}

function browserTitleChange(e){
	if(top._useTemplateBrowserTitle){
		top.document.title = top._browserTitleExt + $.trim($(e).val());
	}
	top._templateBrowserTitleData = $.trim($(e).val());
	top._browserTitleChanged++;
	Site.setRefreshInfo("siteSetting", true);
}

function browserTitleIndeTextChange(){
	top._pageBrowserTitleData = $.trim( $('#browserTitleIndeText').val() );
	top.document.title = top._browserTitleExt + top._pageBrowserTitleData;
	top._browserTitleChanged++;
	Site.setRefreshInfo("siteSetting", true);
}

function bannerIndependence(){
	if($('#bannerIndependence').attr("checked")){
		top._useTemplateBanner = false;

		// 还原为page数据
		top._bannerData = top._pageBannerData;

		$("#bannerCheckSpan").show();
		if (top._bannerData.h) {
			$("input[name=banner][value=0]").attr("checked", true);
			Site.changeBannerTabStatus(false);
		} else {
			$("input[name=banner][value=1]").attr("checked", true);
			Site.changeBannerTabStatus(true);
		}
	}else{
		top._useTemplateBanner = true;

		// 把template数据重置到页面数据
		top._bannerData = top._templateBannerData;

		$("#bannerCheckSpan").hide();
		if (top._bannerData.h) {
			$("input[name=banner][value=0]").attr("checked", true);
		}else{
			$("input[name=banner][value=1]").attr("checked", true);
		}
	}
	
	Site.refreshBanner();
	top._bannerChanged ++;
	Site.styleSetting('refresh', 'webBannerTab', false);
	Site.styleSetting('refresh', 'webSettingTab', false);
	Site.setRefreshInfo("siteSetting", true);
}

function bannerCheck(e){
	if($(e).val() == 1) {
		top._templateBannerData.h = false; 
		if (top._useTemplateBanner) { 
			top.$("#banner").css("display","block");
			top._bannerData.h = false;
			Site.changeBannerTabStatus(true);
			Site.refreshBanner();
		}
	}else{
		top._templateBannerData.h = true;
		if (top._useTemplateBanner) {
			top.$("#banner").css("display","none");
			top._bannerData.h = true;
			Site.changeBannerTabStatus(false);
			if(initFinish){
				top._bannerChanged++;
			}
		}
	}
	if(initFinish){
		top._bannerChanged++;
		Site.setRefreshInfo("siteSetting", true);
	}
}

function bannerIndeCheck(e){
	if(	$(e).val() == 1 ){
		top._pageBannerData.h = false;
		top._bannerData.h = false;
		Site.changeBannerTabStatus(true);
		Site.refreshBanner();
	}else{
		top._pageBannerData.h = true;
		top._bannerData.h = true;
		Site.changeBannerTabStatus(false);
	}
	top._useTemplateBanner = false;
	Site.refreshBanner();
	top._bannerChanged ++;
	Site.setRefreshInfo("siteSetting", true);
}

//本页面独立设置背景样式
function backgroundIndependence(e){
	setDefaultCustomBackground();
	var webBgData, headBg, footerBg; 
	if( $(e).prop("checked") ){
		Fai.top._useTemplateBackground = false;
		webBgData = Fai.top._customBackgroundData;
		headBg = Fai.top._customHeaderTopStyle;
		footerBg = Fai.top._customFooterStyleData;
		buildBgStyle( webBgData, headBg, footerBg );
		
		Site.setWebBannerWidth( webBgData.wbw);
		Site.refreshBanner();
		webBgData.clw == -1 ? Site.autoContentLeftWidth() : Site.setContentLeftWidth( webBgData.clw);
		webBgData.crw == -1 ? Site.autoContentRightWidth() : Site.setContentRightWidth( webBgData.crw);
		
		$(".J_bgIndependenceSet").show();
	}else{
		Fai.top._useTemplateBackground = true;
		webBgData = Fai.top._templateBackgroundData;
		headBg = Fai.top._headerTopStyle;
		footerBg =  Fai.top._footerStyleData;
		buildBgStyle( webBgData, headBg, footerBg );
		Site.setWebBannerWidth( webBgData.wbw);
		Site.refreshBanner();
		webBgData.clw == -1 ? Site.autoContentLeftWidth() : Site.setContentLeftWidth( webBgData.clw);
		webBgData.crw == -1 ? Site.autoContentRightWidth() : Site.setContentRightWidth( webBgData.crw);
		$(".J_bgIndependenceSet").hide();
	}
	
	Site.setRefreshInfo("siteSetting", true);

}

Site.bindGobalEvent("changeTemplateType",function(e,str){
	if( Fai.top._templateType == 0 && false){
		Fai.top._useTemplateBackground = true;
		$("#backgroundIndependence").attr("disabled",true).attr("checked",false);
		$(".J_bgIndependenceSet").hide();
	}else{
		$("#backgroundIndependence").removeAttr("disabled");
		if(Fai.top._useTemplateBackground == false){
			$(".J_bgIndependenceSet").show();
		}
	}
});
function setDefaultCustomBackground(){
	
	if( Fai.top._customBackgroundData.styleDefault == true ){
		Fai.top._customBackgroundData = Fai.top._templateBackgroundData;
		Fai.top._customHeaderTopStyle = Fai.top._headerTopStyle;
		Fai.top._customFooterStyleData = Fai.top._footerStyleData;
		
		Fai.top._bgImgChanged++;
		Fai.top._headerTopStyleChanged++;
		Fai.top._footerStyleChanged++;
		Site.styleChanged();
	}
}

function buildBgStyle( webBgData, headBg, footerBg ){
	var bg = "";
	
	//网站背景
	if( webBgData.s ){
		Site.removeSiteBg();
	}else if( webBgData.h ){
		Site.hideSiteBg();
	}else{
		bg += webBgData.o;
		if( webBgData.p ){
			bg += buildBgRepeat(webBgData.r, webBgData.p);
		}
		Site.setSiteBg( bg, webBgData.o );
	}
	
	//横幅背景
	if( webBgData.bBg.y == 0 ){
		Site.removeBannerBg();
	}else if( webBgData.bBg.y == 1 ){
		Site.hideBannerBg();
	}else{
		bg = webBgData.bBg.c;
		if( webBgData.bBg.p ){
			bg += buildBgRepeat(webBgData.bBg.r, webBgData.bBg.p);
		}
		Site.setBannerBg( bg );	
	}
	
	//内容背景
	if( webBgData.cBg.y == 0 ){
		Site.removeContentBg();
	}else if( webBgData.cBg.y == 1 ){
		Site.hideContentBg();
	}else{
		bg = webBgData.cBg.c;
		if( webBgData.cBg.p ){
			bg += buildBgRepeat(webBgData.cBg.r, webBgData.cBg.p);
		}
		Site.setContentBg( bg, "none");
	}
	
	//内容区中间背景
	if( webBgData.cmBg.y == 0 ){
		Site.removeContentMiddleBg();
	}else if( webBgData.cmBg.y == 1 ){
		Site.hideContentMiddleBg();
	}else{
		bg = webBgData.cmBg.c;
		if( webBgData.cmBg.p ){
			bg += buildBgRepeat(webBgData.cmBg.r, webBgData.cmBg.p);
		}
		Site.setContentMiddleBg(bg);
	}
	
	//顶部样式
	if(headBg.hts == -1){
		Site.autoHeaderTopHeight();
	}else{
		Site.setHeaderTopHeight( headBg.hts );
	}
	
	if (headBg.hg.y == 1) {
		$('.headBgCus').hide();
		Site.hideHeaderBg();
	} else if (headBg.hg.y == 2) {
		$('.headBgCus').show();
		bg = headBg.hg.c;
		if( headBg.hg.p ){
			bg += buildBgRepeat(headBg.hg.r, headBg.hg.p);
		}
		Site.setHeaderBg( bg );
	} else {
		$('.headBgCus').hide();
		Site.removeHeaderBg();
	}
	
	//底部样式
	//初始化底部位置
	Site.refreshFooterAlign( footerBg.fa );
	//底部导航普通文字
	if (footerBg.gt.y == 1) {
		$(".footerNavTextCus").show();
		Site.setFooterNavGeneralText(footerBg);	
		//底部导航高亮文字
		Site.setFooterNavHoverText(footerBg);		
	} else {
		$(".footerNavTextCus").hide();
		Site.autoFooterNavGeneralText();
		Site.autoFooterNavHoverText();
	}
	//底部背景
	if (footerBg.fb.y == 1) {
		Site.hideFooterBg();
	} else if (footerBg.fb.y == 2) {
		
		var background = "";
		var repeat = footerBg.fb.r;
		background += footerBg.fb.c;
		var bgfile = footerBg.fb.p;
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
		Site.setFooterBg(background);
		
	} else {
		Site.autoFooterBg();
	}
	
	//底部边距
	var css = "0 0 0 0";
	if(footerBg.f.t == 0){
		Fai.top.Fai.setCtrlStyleCssList('stylefooter', 'footer', [
			{cls:'.footerContent', key:'padding-top', value:"0"},
			{cls:'.footerContent', key:'padding-bottom', value:"0"},
			{cls:'.footerNav', key:'padding', value:css},
			{cls:'.footerInfo', key:'padding', value:css},
			{cls:'.footerSupport', key:'padding', value:css},
			{cls:'.visitorCounterWrap', key:'padding', value:css}
		]);

	}else{
		css = "0 " + footerBg.f.r + "px 0 " + footerBg.f.l + "px";
		Fai.top.Fai.setCtrlStyleCssList('stylefooter', 'footer', [
				{cls:'.footerContent', key:'padding-top', value: footerBg.f.u + "px"},
				{cls:'.footerContent', key:'padding-bottom', value: footerBg.f.d + "px"},
				{cls:'.footerNav', key:'padding', value:css},
				{cls:'.footerInfo', key:'padding', value:css},
				{cls:'.footerSupport', key:'padding', value:css},
				{cls:'.visitorCounterWrap', key:'padding', value:css}
		]);

	}
	//底部普通文字
	if (footerBg.rt.y == 1) {
		Site.setRegularText(footerBg);
	} else {
		Site.autoRegularText();
	}
	//底部栏目样式
	Site.refreshFooterItemStyle(footerBg);
}

function buildBgRepeat(r, path){
	var bgStyle = "";
	if (r == -1) {
		;
	} else {
		bgStyle += " url("+ path +")";
		if (r == 0) {
			bgStyle += " no-repeat center center";
		} else if (r == 11) {
			bgStyle += " repeat-x top center";
		} else if (r == 1) {
			bgStyle += " repeat-x center center";
		} else if (r == 12) {
			bgStyle += " repeat-x bottom center";
		} else if (r == 21) {
			bgStyle += " repeat-y center left";
		} else if (r == 2) {
			bgStyle += " repeat-y center center";
		} else if (r == 22) {
			bgStyle += " repeat-y center right";
		} else if (r == 3) {
			bgStyle += " repeat";
		}
	}
	return bgStyle;
}

//是否独立产品详情页面设计
function setPdIndependence(e){
	if( $(e).prop("checked") ){
		Fai.top._pdIndependence = true;
		if(initFinish){
			top._navStyleChanged++;
			Site.styleChanged();
		}
	}else{
		Fai.top._pdIndependence = false;
		if(initFinish){
			top._navStyleChanged++;
			Site.styleChanged();
		}
	}
}

//是否独立文章详情页面设计
function setNdIndependence(e){
	if( $(e).prop("checked") ){
		Fai.top._ndIndependence = true;
		if(initFinish){
			top._navStyleChanged++;
			Site.styleChanged();
		}
	}else{
		Fai.top._ndIndependence = false;
		if(initFinish){
			top._navStyleChanged++;
			Site.styleChanged();
		}
	}
}

//是否独立产品筛选结果页面设计
function setPrIndependence(e){
	if( $(e).prop("checked") ){
		Fai.top._prIndependence = true;
		if(initFinish){
			top._navStyleChanged++;
			Site.styleChanged();
		}
	}else{
		Fai.top._prIndependence = false;
		if(initFinish){
			top._navStyleChanged++;
			Site.styleChanged();
		}
	}
}

//是否独立文章筛选结果页面设计
function setNrIndependence(e){
	if( $(e).prop("checked") ){
		Fai.top._nrIndependence = true;
		if(initFinish){
			top._navStyleChanged++;
			Site.styleChanged();
		}
	}else{
		Fai.top._nrIndependence = false;
		if(initFinish){
			top._navStyleChanged++;
			Site.styleChanged();
		}
	}
}

function showPanel(){
	Fai.top.Site.functionInterface({"name":"faiFloatPanel"}, 2);
}

</script>
</head>
<body>
	<div class="bodyWrap">
		<div class="contentLeft">
			<div class="contentTopBg"></div>
			<div class="contentBottomBg"></div>
			<ul>
				<li id="siteSettingShow" class="menu menuCheck"
					onclick="siteSettingShow()">基础设置</li>
				<li id="advanceFuncShow" class="menu"
					onclick="Site.logDog(100044, 1); advanceFuncShow();"><a
					hidefocus="true" class="siteGroupBtn siteGroupStd"
					style="display: inline-block;" href="javascript:;"
					title="高级设置为“网站标准版”功能">&nbsp;</a><span>高级设置</span></li>
				<!-- <li id="businessFuncShow" class="menu" onClick="Site.logDog(100044, 2); businessFuncShow();"><a hidefocus="true" class="siteGroupBtn siteGroupBiz" style="display:inline-block;" href="javascript:;" title="商务设置为“网站商务版”功能">&nbsp;</a><span>商务设置</span></li> -->
				<a id="navManage"
					onclick="Site.popupWindow({title:'管理栏目', frameSrcUrl:'manage/nav.jsp?ram='+Math.random(), width:'675', height:'450'});Site.removeAllEditLayer();return false;"
					href="javascript:;">
					<div class="navManageDiv">
						<span class="siteIco styleNavManage"></span><span
							style="float: left; height: 20px; line-height: 20px;">管理栏目</span>
					</div>
				</a>
			</ul>
		</div>
		<div class="contentRight">
			<!-- 网站设置 -->
			<div style="display: block;" id="siteSetting">
				<!-- basic setting -->
				<div class="basicSettintWrap">
					<div class="basicSetting">网站设置</div>
					<!-- # setting main body # -->
					<div style="padding-top: 5px;">
						<table class="settingTable" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<!--浏览器标题-->
									<td class="titleWidth">
										<div class="settingTitlePanel">
											<div class="settingTitle">浏览器标题：</div>
										</div>
									</td>
									<td colspan="3" align="left" valign="middle"><input
										value="智慧星河" id="browserTitle" style="width: 200px;"
										onkeyup="browserTitleChange(this);" maxlength="100"
										onchange="browserTitleChange(this);"></td>
									<!--//end 浏览器标题-->
								</tr>

								<tr>
									<!--网站标题-->
									<td class="titleWidth">
										<div class="settingTitlePanel">
											<div class="settingTitle">网站标题：</div>
										</div>
									</td>
									<td align="left" valign="middle">
										<div class="settingItemContent">
											<input checked="checked" id="ctDisplay" name="corpTitle"
												onclick="corpTitleCheck(this);" value="1" type="radio"><label
												for="ctDisplay">显示</label> <input id="ctHidden"
												name="corpTitle" onclick="corpTitleCheck(this);" value="0"
												type="radio"><label for="ctHidden">隐藏</label> <a
													href="javascript:;" class="aset" onclick="titleSetting()">[设置]</a>
										</div>
									</td>
									<!--//end 网站标题-->
									<!--网站横幅-->
									<td class="titleWidth">
										<div class="settingTitlePanel">
											<div class="settingTitle">网站横幅：</div>
										</div>
									</td>
									<td align="left" valign="middle">
										<div>
											<input checked="checked" id="bnDisplay" name="banner"
												onclick="bannerCheck(this);" value="1" type="radio"><label
												for="bnDisplay">显示</label> <input id="bnHidden"
												name="banner" onclick="bannerCheck(this);" value="0"
												type="radio"><label for="bnHidden">隐藏</label>
										</div>
									</td>
									<!--网站横幅 end-->

								</tr>

								<tr>
									<!--栏目导航-->
									<td class="titleWidth">
										<div class="settingTitlePanel">
											<div class="settingTitle">网站导航：</div>
										</div>
									</td>
									<td align="left" valign="middle">
										<div class="settingItemContent">
											<input checked="checked" id="navDisplay" name="navTadio"
												onclick="navCheck(this);" value="1" type="radio"><label
												for="navDisplay">显示</label> <input id="navHidden"
												name="navTadio" onclick="navCheck(this);" value="0"
												type="radio"><label for="navHidden">隐藏</label> <a
													href="javascript:;" class="aset" onclick="navSetting()">[设置]</a>
										</div>
									</td>
									<!--//end 栏目导航-->

									<!--会员登录条-->
									<td class="titleWidth">
										<div class="settingTitlePanel">
											<div class="settingTitle">会员登录条：</div>
										</div>
									</td>
									<td align="left" valign="middle">
										<div class="settingItemContent">
											<input id="memberTopbarDisplay" name="member"
												onclick="memberCheck(this);" value="1" type="radio"><label
												for="memberTopbarDisplay">显示</label> <input
												checked="checked" id="memberTopbarHidden" name="member"
												onclick="memberCheck(this);" value="0" type="radio"><label
													for="memberTopbarHidden">隐藏</label> <a
													style="display: none;" href="javascript:;" class="aset"
													onclick="memberTopbarSetting()">[设置]</a> <!--                                    <a href="javascript:;" class="aset"  onClick="viewMemberTopBar()" id="memberView">[查看]</a>
-->
										</div>
									</td>
									<!--//end 会员登录条-->
								</tr>

								<tr>
									<!--语言导航-->
									<td class="titleWidth localerShow" style="display: none;">
										<div class="settingTitlePanel">
											<div class="settingTitle">语言导航：</div>
										</div>
									</td>
									<td class="localerShow" style="display: none;" align="left"
										valign="middle">
										<div class="settingItemContent">
											<input checked="checked" id="localeDisplay" name="locale"
												onclick="localeCheck(this);" value="1" type="radio"><label
												for="localeDisplay">显示</label> <input id="localeHidden"
												name="locale" onclick="localeCheck(this);" value="0"
												type="radio"><label for="localeHidden">隐藏</label> <a
													href="javascript:;" class="aset"
													onclick="languageSetting()">[设置]</a>
										</div>
									</td>
									<td colspan="2" class="localerHide"></td>
									<!--//end 语言导航-->
								</tr>

								<tr>
									<!--背景音乐-->
									<td class="titleWidth">
										<div class="settingTitlePanel">

											<a class="siteGroupBtn siteGroupStd" target="_blank"
												href="http://jz.faisco.com/proFunc.jsp"
												title="背景音乐为“网站标准版”功能，点击查看详细功能列表">&nbsp;</a> <span
												class="settingTitle"> 背景音乐：</span>
										</div>
									</td>
									<td align="left" valign="middle">
										<div class="settingItemContent">
											<a href="javascript:;" class="aset"
												onclick="Site.popupWindow({title:'编辑网站背景音乐', frameSrcUrl:'manage/backgroundMusicEdit.jsp?ram=' + Math.random(), width:420, height:160, saveBeforePopup: false});return false;">[设置]</a>

										</div>
									</td>
									<!--// end 背景音乐-->

									<!--形象首页-->
									<td align="right">
										<div class="settingTitlePanel">
											<a class="siteGroupBtn siteGroupStd" target="_blank"
												href="http://jz.faisco.com/proFunc.jsp"
												title="欢迎页为“网站标准版”功能，点击查看详细功能列表">&nbsp;</a><span
												class="settingTitle"> 欢迎页：</span>
										</div>
									</td>
									<td align="left">
										<div class="bgmSet">
											<a href="javascript:;" class="aset"
												onclick="Site.popupWindow({title:'编辑欢迎页', frameSrcUrl:'manage/imagePageEdit.jsp?ram='+Math.random(), width:'530', height:'380', saveBeforePopup:false});return false;">[设置]</a>
										</div>
									</td>
									<!--//end 形象首页-->
								</tr>
							</tbody>
						</table>
					</div>
					<!--// # setting main body ends # -->
				</div>
				<!-- // basic setting ends -->
				<!-- 页面设置 -->
				<div class="pageSettingWrap">
					<div class="pageSetting">页面设置</div>
					<div style="padding-top: 5px;">
						<div class="settingLine">
							<span class="settingTitle">当前栏目页面：</span> <span>首页&nbsp;[以下设置仅影响此栏目页面]</span>
						</div>
						<div id="browserTitleDiv" class="settingLine">
							<input style="margin: 0px 2px; padding: 0px;"
								id="browserTitleIndependence"
								onclick="browserTitleIndependence()" type="checkbox"><label
								for="browserTitleIndependence">本页面独立设置浏览器标题</label> <input
								value="智慧星河" id="browserTitleIndeText"
								onkeyup="browserTitleIndeTextChange();" maxlength="100"
								onchange="browserTitleIndeTextChange();"
								style="margin: 0; display: none;">
						</div>
						<div class="settingLine">
							<input style="margin: 0px 2px; padding: 0px;"
								id="bannerIndependence" onclick="bannerIndependence();"
								type="checkbox"><label for="bannerIndependence">本页面独立设置横幅</label>
								<span id="bannerCheckSpan" style="display: none;"> <input
									id="bsDisplay" name="bannerInde"
									onclick="bannerIndeCheck(this);" value="1" type="radio"><label
										for="bsDisplay">显示</label> <input id="bsHidden"
										name="bannerInde" onclick="bannerIndeCheck(this);" value="0"
										checked="checked" type="radio"><label for="bsHidden">隐藏</label></span>
						</div>
						<div class="settingLine" id="navIndependenceBox">
							<input style="margin: 0px 2px; padding: 0px;"
								id="navIndependence" onclick="navIndependence(this);"
								type="checkbox"><label for="navIndependence">本页面独立隐藏导航</label>
						</div>
						<div class="settingLine">
							<input style="margin: 0px 2px; padding: 0px;"
								id="backgroundIndependence"
								onclick="backgroundIndependence(this);" type="checkbox"><label
								for="backgroundIndependence">本页面独立设置背景样式</label> <a
								style="display: none;" href="javascript:;"
								class="J_bgIndependenceSet aset"
								onclick="showPanel();return false;">[设置]</a>
						</div>

						<div id="pdIndependenceDiv" class="settingLine"
							style="display: none;">
							<input disabled="disabled" style="margin: 0px 2px; padding: 0px;"
								id="pdIndependence" onclick="setPdIndependence(this);"
								type="checkbox"><a class="siteGroupBtn siteGroupBiz"
								target="_blank" href="http://jz.faisco.com/proFunc.jsp"
								title="各产品详情页面独立设计为“网站商务版”功能，点击查看详细功能列表">&nbsp;</a><label
								for="pdIndependence" title="启用后，每个产品详情页面可以独立添加模块">各产品详情页面独立设计</label>
						</div>
						<div id="ndIndependenceDiv" class="settingLine"
							style="display: none;">
							<input disabled="disabled" style="margin: 0px 2px; padding: 0px;"
								id="ndIndependence" onclick="setNdIndependence(this);"
								type="checkbox"><a class="siteGroupBtn siteGroupBiz"
								target="_blank" href="http://jz.faisco.com/proFunc.jsp"
								title="各文章详情页面独立设计为“网站商务版”功能，点击查看详细功能列表">&nbsp;</a><label
								for="ndIndependence" title="启用后，每个文章详情页面可以独立添加模块">各文章详情页面独立设计</label>
						</div>
						<div id="prIndependenceDiv" class="settingLine"
							style="display: none;">
							<input disabled="disabled" style="margin: 0px 2px; padding: 0px;"
								id="prIndependence" onclick="setPrIndependence(this);"
								type="checkbox"><a class="siteGroupBtn siteGroupBiz"
								target="_blank" href="http://jz.faisco.com/proFunc.jsp"
								title="各产品筛选结果页面独立设计为“网站商务版”功能，点击查看详细功能列表">&nbsp;</a><label
								for="prIndependence" title="启用后，产品分类模块的产品筛选结果页面可以独立添加模块">各产品筛选结果页面独立设计</label>
						</div>
						<div id="nrIndependenceDiv" class="settingLine"
							style="display: none;">
							<input disabled="disabled" style="margin: 0px 2px; padding: 0px;"
								id="nrIndependence" onclick="setNrIndependence(this);"
								type="checkbox"><a class="siteGroupBtn siteGroupBiz"
								target="_blank" href="http://jz.faisco.com/proFunc.jsp"
								title="各文章筛选结果页面独立设计为“网站商务版”功能，点击查看详细功能列表">&nbsp;</a><label
								for="nrIndependence" title="启用后，文章分类模块的文章筛选结果页面可以独立添加模块">各文章筛选结果页面独立设计</label>
						</div>
					</div>
				</div>
				<!-- 页面设置 end -->
			</div>
			<!-- 网站设置 end -->
			<!-- 页面设置 -->
			<div id="advanceFunc" style="position: relative; display: none;">
				<iframe src="styleGlobal_data/miscManage.htm" id="advanceFuncFrame"
					scrolling="auto" frameborder="0" height="205px" width="100%"></iframe>
			</div>
			<!-- 页面设置 end -->
		</div>
	</div>
	<!--
<a href='javascript:;' class="tabClose" hidefocus="true" title="关闭" onclick="window.parent.panesHide();"></a>
-->
</body>
</html>