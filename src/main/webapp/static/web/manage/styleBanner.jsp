<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/taglib/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" class="g_htmlManage">
  
  <head>
    <title>智慧星河</title>
	<%@ include file="/WEB-INF/view/taglib/header.jsp" %>
	<meta name="renderer" content="webkit"/>
    <meta name="mobile-agent" content="format=html5;url=http://m.seeyoui.icoc.in/"/>
    <%@ include file="/WEB-INF/view/taglib/webPortal.jsp" %>
	<script type="text/javascript">
	try {
		Fai.top = parent.Fai.top;
	} catch (e) {
	}
	</script>
	<link href="${ctx_web}/css/styleBanner.css" type="text/css" rel="stylesheet"/>
	<link href="${ctx_web}/css/bannerEffects.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript">
var bannerPrototypList = {"bannerDef":[{"id":10005,"weight":"W1440A","bannerTop":false,"createTime":"2015-01-29","width":1440,"height":380,"trade":[1]}],"order":[10005],"shelf":[],"orderDbg":[],"annotate":"order-1=行业横幅; order-2=横幅; order-3=免费的模板默认配套横幅; orderDbg=本地测试模式横幅; shelf=完全下架横幅，不再使用"};
var bannerList = [{"bkey":"10005","vweight":6,"vheight":380,"vwidth":1440,"vtrade":[1],"vid":10005,"type":"jpg","edgeLeftBg":"","edgeRightBg":""}];
var shelfBannerList = [];
var initing = true;
//var selectColor = 0;
var tradeList = [{"label":"服装、饰品、个人护理","key":102},{"label":"文化、广告、设计服务","key":108},{"label":"五金、设备、工业制品","key":101},{"label":"IT、互联网、行业门户","key":109},{"label":"教育、政府、机构组织","key":111},{"label":"化工、原材料、农畜牧","key":110},{"label":"金融、物流、工商服务","key":107},{"label":"食品、茶饮、养生保健","key":104},{"label":"数码、家具、家居百货","key":103},{"label":"婚庆、摄影、生活服务","key":112},{"label":"餐饮、酒店、旅游服务","key":106},{"label":"礼品、玩具、小商品","key":105},{"label":"其他","key":0}];
var tradeList1 = [{"id":102,"name":"服装、饰品、个人护理","list":[{"id":1,"name":"服装"},{"id":60,"name":"饰品"},{"id":2,"name":"鞋帽箱包"},{"id":20,"name":"户外用品"},{"id":32,"name":"美容护肤"}]},{"id":108,"name":"文化、广告、设计服务","list":[{"id":70,"name":"广告"},{"id":40,"name":"文化传媒"},{"id":57,"name":"印刷包装"},{"id":72,"name":"展览设计"},{"id":81,"name":"园林设计"}]},{"id":101,"name":"五金、设备、工业制品","list":[{"id":7,"name":"五金"},{"id":8,"name":"门窗照明"},{"id":5,"name":"汽车汽配"},{"id":21,"name":"电子电工"},{"id":27,"name":"机械设备"},{"id":35,"name":"仪器器材"},{"id":36,"name":"安防监控"}]},{"id":109,"name":"IT、互联网、行业门户","list":[{"id":78,"name":"IT"},{"id":100,"name":"互联网"},{"id":99,"name":"在线商城"},{"id":98,"name":"行业门户"}]},{"id":111,"name":"教育、政府、机构组织","list":[{"id":48,"name":"学校"},{"id":85,"name":"政府"},{"id":51,"name":"医院"},{"id":50,"name":"教育培训"},{"id":86,"name":"机构组织"}]},{"id":110,"name":"化工、原材料、农畜牧","list":[{"id":68,"name":"建筑建材"},{"id":26,"name":"纺织辅料"},{"id":24,"name":"化工涂料"},{"id":65,"name":"橡胶塑料"},{"id":56,"name":"环保回收"},{"id":83,"name":"农业畜牧"}]},{"id":107,"name":"金融、物流、工商服务","list":[{"id":30,"name":"贸易"},{"id":6,"name":"物流"},{"id":31,"name":"房地产"},{"id":29,"name":"金融保险"},{"id":74,"name":"工商服务"},{"id":80,"name":"人力资源"},{"id":73,"name":"法律服务"}]},{"id":104,"name":"食品、茶饮、养生保健","list":[{"id":95,"name":"蔬果"},{"id":38,"name":"茶叶"},{"id":39,"name":"酒类"},{"id":37,"name":"食品饮料"}]},{"id":103,"name":"数码、家具、家居百货","list":[{"id":13,"name":"电脑"},{"id":14,"name":"电器"},{"id":12,"name":"手机数码"},{"id":10,"name":"家私家具"},{"id":63,"name":"家居家纺"},{"id":64,"name":"日用百货"}]},{"id":112,"name":"婚庆、摄影、生活服务","list":[{"id":45,"name":"鲜花"},{"id":47,"name":"婚庆"},{"id":87,"name":"摄影"},{"id":84,"name":"宠物"},{"id":71,"name":"装修"}]},{"id":106,"name":"餐饮、酒店、旅游服务","list":[{"id":44,"name":"餐饮"},{"id":43,"name":"酒店"},{"id":18,"name":"旅游"}]},{"id":105,"name":"礼品、玩具、小商品","list":[{"id":46,"name":"礼品"},{"id":16,"name":"文具"},{"id":15,"name":"玩具乐器"}]},{"id":0,"name":"其他","list":[{"id":0,"name":"其他"}]}];
var firstTradeList = [{"label":"服装、饰品、个人护理","key":102},{"label":"文化、广告、设计服务","key":108},{"label":"五金、设备、工业制品","key":101},{"label":"IT、互联网、行业门户","key":109},{"label":"教育、政府、机构组织","key":111},{"label":"化工、原材料、农畜牧","key":110},{"label":"金融、物流、工商服务","key":107},{"label":"食品、茶饮、养生保健","key":104},{"label":"数码、家具、家居百货","key":103},{"label":"婚庆、摄影、生活服务","key":112},{"label":"餐饮、酒店、旅游服务","key":106},{"label":"礼品、玩具、小商品","key":105},{"label":"其他","key":0}];
var selectTrade = 0;
var selectTradeName = "金融、物流、工商服务";
var selectWeight = 0;
var pbwId;
var maxBannerNum = 8;
var minBannerNum = 1;
Fai.top.styleBanner_selectObj = null;

// 存放即将输出到页面的内容
var totalList = [];

// 存放最近使用的横幅信息
var usedArray=[];

var weightInitVal = '960x280';
var weightInitKey = 12;
var weightList = [{"label":"960x160","key":10},{"label":"960x280","key":12},{"label":"960x380","key":14},{"label":"960x450","key":15},{"label":"740x230","key":20},{"label":"740x310","key":21},{"label":"1440x380","key":6}];
var templateBannerOption = {};

//保存最近使用的横幅信息
function recentUsed(id){
	var bannerId=id;
	$.each(usedArray,function(i,val){	
		if (bannerId == val) {
			usedArray.splice(i,1);
		}	
	}); 
	usedArray.push(bannerId);
	if(usedArray.length > 25){
		usedArray.splice(0,usedArray.length-25);	
	}	
	var cookietext=usedArray.join(",");
	$.cookie('recentbannerPreview',cookietext,{ expires: 30, path:'/'});

}

//删除最近使用的特定横幅信息
function deleteOneRecentUsed(id){
	var bannerId = id;
	$.each(usedArray,function(i,val){	
		if (bannerId == val) {
			usedArray.splice(i,1);
		}	
	}); 
}

// 给外部调用
function refreshPage() {
	if ( $('#pictureSearch').val() != null && $('#pictureSearch').val() != "" ){
		return false;
	}
	insertTemplateBanner();
	initCheckBanner();
	if ( Fai.top._templateChanged > 0 ){
		var tmpCookie = $.cookie("_bannerLibWeight", {path:'/'});
		var getWeight = false;
		if(tmpCookie == null){
			weightInitKey = Fai.top._templateBannerWeight;
			for (var i = 0; i < weightList.length; ++i) {
				if (weightList[i].key == weightInitKey) {
					weightInitVal = weightList[i].label;
					getWeight = true;
				}
			}
			if(!getWeight){
				weightInitKey = 12;
			}
			$("#panelLibWeight").combobox("setInitKey", weightInitKey);
			refreshLibWeight(weightInitKey);
		}
	}
}

// 生成系统横幅
function insertBanner(options){
	var bkey = options.bkey, 
		vweight = options.vweight,
		vheight = options.vheight, 
		vwidth = options.vwidth,
		vtrade = options.vtrade,
		vid = options.vid,
		vpath = options.vpath,
		preview = options.preview, 
		vtype = options.vtype,
		edgeLeftBg = options.edgeLeftBg,
		edgeRightBg = options.edgeRightBg;
	var tmp = [
	'<div id="item'+ bkey +'" class="panelLibItem" _bkey="B' + bkey + '" cus = "0" style="width:100px;height:30px;" title="编号：B' + bkey + '" vheight="' + vheight + '" vwidth="' + vwidth + '" vid="' + vid + '" vweight="' + vweight + '" vpath="' + vpath + '" vedgeleftbg="'+ edgeLeftBg +'" vedgerightbg="'+ edgeRightBg +'">',
		'<table style="width:100%;height:100%;" cellpadding="0" cellspacing="0"><tr><td valign="middle" align="center">',
			'<img class="bannerPreImg" src="${ctx_web}/image/template/bannerPreview/banner_loading_2b.gif" data-original="' + preview + '" width="100" height="30"/>',
			'<div class="checked"></div>',
		'</td></tr></table>',
	'</div>'
	];
	totalList.push(tmp.join(''));
}

// 生成主题默认横幅
function insertTemplateBanner(){
	for(i=0;i<bannerList.length;i++){
		var vid = bannerList[i].vid;
		
		if ( vid == Fai.top._templateBannerId ) {
			var bkey = bannerList[i].bkey,
				vtrade = bannerList[i].vtrade,
				vweight = bannerList[i].vweight,
				vheight = bannerList[i].vheight,
				vwidth = bannerList[i].vwidth,
				vpath = bannerList[i].vpath,
				preview = bannerList[i].preview,
				vtype = bannerList[i].type,
				edgeLeftBg = bannerList[i].edgeLeftBg,
				edgeRightBg = bannerList[i].edgeRightBg;
			var tmp = [
			'<div id="item'+ bkey +'" class="panelLibItemT" _bkey="B' + bkey + '" cus = "0" style="width:100px;height:30px;" title="主题默认图片\n宽高：' + vwidth + '×' + vheight + ' 像素" vheight="' + vheight + '" vwidth="' + vwidth + '" vid="' + vid + '" vweight="' + vweight + '" vpath="' + vpath + '" edgeLeftBg="'+ edgeLeftBg +'" edgeRightBg="'+ edgeRightBg +'">',
				'<table style="width:100%;height:100%;" cellpadding="0" cellspacing="0"><tr><td valign="middle" align="center">',
					'<img class="bannerPreImg" src="' + preview + '" width="100" height="30"/>',
					'<div class="checked"></div>',
				'</td></tr></table>',
			'</div>'
			];
			if ( $(".panelLibItemT").length != 0 ){
				$(".panelLibItemT").after(tmp.join(''));
				$(".panelLibItemT:first").remove();
			} else {
				$("#panelLibList").prepend(tmp.join(''));
			}
			

			templateBannerOption.weight = vweight;
			templateBannerOption.width = vwidth;
			templateBannerOption.height = vheight;
		}
	}
}

// 生成自定义横幅
function insertCusBanner(viewUrl, sourcesUrl, id, vweight, vheight) {
	var str = new Array();
	str.push( '<div class="panelLibItem" id="cus'+ id +'" vid="'+ id +'" cus="1" vwidth="' + vweight + '" vheight="' + vheight + '" style="width: 100px; height: 30px; display: block; " title="自定义图片\n宽高：' + vweight + '×' + vheight + ' 像素">' );
	str.push( 	'<table style="width:100%;height:100%;" cellpadding="0" cellspacing="0"><tbody><tr><td valign="middle" align="center">' );
	str.push( 		'<img id="'+ id +'" src="'+ viewUrl +'" sources="' + sourcesUrl + '" width="100" height="30">' );
	str.push( 		'<div class="checked"></div>' );
	str.push( 	'</td></tr></tbody></table>' );
	str.push( 	'<div class="btn_16x16 rmHoverBtn bannderBtnDel" title="删除自定义横幅" onclick="delBanner(\''+ id +'\');return false;"></div>' );
	str.push( '</div>' );
	$("#panelLibList").prepend(str.join(''));
}

// 过滤并加载横幅列表
function initBannerList(){
	$("#panelLibList").children("div.panelLibItem[cus=0]").remove();
	totalList = [];
	//又下架中秋国庆20151117
	var checkBanner = Fai.top._bannerData.n,
		checkLength = checkBanner.length;
	for(i=0;i<bannerList.length;i++){
		var bkey = bannerList[i].bkey;
		if((bkey >= 2459 && bkey <= 2494) || (bkey >= 1774 && bkey <= 1780) || (bkey >= 1809 && bkey <= 1822) || (bkey >= 2237 && bkey <= 2242) || (bkey >= 2249 && bkey <= 2254)){
			var j, 
				offShelves = false;
			if(checkLength == 0 ){
				continue;
			}
			for(j = 0;j < checkLength; j++){
				if(bkey == checkBanner[j].i){
					break;
				}
				
				if(j == checkLength - 1){
					offShelves = true;
				}
			}
			
			if(offShelves){
				continue;
			}
		}
		
		var	vtrade = bannerList[i].vtrade,
			vweight = bannerList[i].vweight,
			vheight = bannerList[i].vheight,
			vwidth = bannerList[i].vwidth,
			vid = bannerList[i].vid,
			vpath = bannerList[i].vpath,
			preview = bannerList[i].preview,
			vtype = bannerList[i].type,
			edgeLeftBg = bannerList[i].edgeLeftBg,
			edgeRightBg = bannerList[i].edgeRightBg;
			
		
		if ( (vtrade.length == 0 || $.inArray(parseInt(selectTrade), vtrade) != -1 ) &&
			( vweight == selectWeight ) && (vid != Fai.top._templateBannerId) ){
			insertBanner({
				'bkey':bkey,
				'vweight':vweight,
				'vheight':vheight,
				'vwidth':vwidth,
				'vtrade':vtrade,
				'vid':vid,
				'vpath':vpath,
				'preview':preview,
				'vtype':vtype,
				'edgeLeftBg':edgeLeftBg,
				'edgeRightBg':edgeRightBg
			});
		}
	}
	$('#panelLibList').append(totalList.join(""));
	
	lazyloadBannerPreImg();			//延迟加载banner图片
}

//初始化自定义上传的横幅
function initCusBanner(){
	$("#panelLibList").children("div.panelLibItem[cus=1]").remove();
	for(var i = 0; i< Fai.top._bannerData.l.length; i++){
		insertCusBanner(Fai.top._bannerData.l[i].tp, Fai.top._bannerData.l[i].p, Fai.top._bannerData.l[i].i, Fai.top._bannerData.l[i].w, Fai.top._bannerData.l[i].h);
	}
}

//当用户选择行业，颜色，宽度时，输入框的内容为空
function clearText(){
	var text = $("#pictureSearch").val();
	if(text!=''){
        $("#pictureSearch").val('');
		$("#clearSearch").removeClass('find').removeClass('unfind').removeAttr('title');
	}	
}

function selectLibWeight(item) {
	Site.logDog(100041, 2);
	var key = parseInt(item.key);
	$.cookie("_bannerLibWeight", key, { expires:730, path:'/'});
	refreshLibWeight(key);
}

function refreshLibWeight(key) {
	selectWeight = key;
	$('#panelLibList').scrollTop(0);
	clearText();
	initBannerList();
	insertTemplateBanner();
	initCusBanner();
	initCheckBanner();
}

function tabCheck(ctrl){
	var allTab = $('.menu');
	if ( !ctrl.hasClass('menuCheck') ){
		allTab.removeClass('menuCheck');
		ctrl.addClass('menuCheck');
	}
}

function showSiteBanner() {
	var me = $('#showSiteBanner');
	tabCheck(me);
	$('#bannerEffects').hide();
	$('#recentTypePanelLib').hide();
	$(".panelLibItem").show();
	$(".panelLibItemT").show();
	$('#panelLibFilter').show();
	$('#typePanelLib').show();
	$('#typePanelLib div').scrollTop(0);
	$("#panelLibList .cloneBanner").hide();
	if($("#panelLibList").is(":visible")){
		$("#selectedBannerContainer").show();
		$("#panelLibList").removeClass("panelLibListAutoWidth");
	}
	Site.triggerGobalEvent("showSelectedBanner","panelLibList");
}

function showBannerEffects() {
	Site.logDog(100041, 9);
	var me = $('#showBannerEffects');
	tabCheck(me);
	$('#typePanelLib').hide();
	$('#recentTypePanelLib').hide();
	$('#bannerEffects').show();
	if(!$("#bannerEffectsFrame").attr("src")) {
		forWaiting();
		$("#bannerEffectsFrame").attr("src", "${ctx_web}/manage/bannerEffects.jsp");
		$("#bannerEffectsFrame").load(function(){
			$('#forWaiting').remove();
		});
	} else {
		$('#bannerEffectsFrame').contents().find('#basicSetting div').scrollTop(0);
	}
	
	Site.triggerGobalEvent( "showSelectedEffectBanner", "bannerEffectsFrame" );
	Site.triggerGobalEvent("showSelectedBanner","panelLibList");
}

function forWaiting(){
	var loading = $("<div id='forWaiting' class='ajaxLoading2' style='position:absolute; background-color:#f7f7f7; width:900px; height:205px; top:0; left:0;'></div>");
	loading.appendTo("#bannerEffects");
}

function showTypeLib() {
	$('#panelLibList').show();
	$('#selectedBannerContainer').show();
	$('#typePanelFlash').hide();
	$('#flashHide').find(".picSettingOption").show();
	if($("#advancedFilter").is(":visible")){
		$("#bannerTypeChoiceBox").show();
	}else{
		$("#bannerTypeChoiceBox").hide();
	}
	refreshBannerData();
	checkToShowDefaultBanner();
	lazyloadBannerPreImg();			//延迟加载banner图片
}

function showTypeFlash() {
	Site.logDog(100041, 8);
	$('#advancedFilter').hide();
	$('#panelLibList').hide();
	$('#selectedBannerContainer').hide();
	$('#typePanelFlash').show();
	$("#bannerTypeChoiceBox").show();
	$('#flashHide').find(".picSettingOption").hide();
	refreshBannerFlash();
}

function refreshBannerFlash() {
	if (initing) {
		return;
	}
	var id = $("#flashId").val();
	if (id == '') {
		return;
	}
	var width = parseInt($("#flashWidth").val());
	var height = parseInt($("#flashHeight").val());
	var url = $("#flashUrl").val();
	
	if (!width || width <= 0 || width > 2000) {
		alert("请输入flash的宽度(1-2000)。");
		$("#flashWidth").val(Fai.top._bannerData.f.w);
		return;
	}
	if (!height || height <= 0 || height > 1000) {
		alert("请输入flash的高度(1-1000)。");
		$("#flashHeight").val(Fai.top._bannerData.f.h);
		return;
	}
	Fai.top._bannerData.f.i = id;
	Fai.top._bannerData.f.w = parseInt(width);
	Fai.top._bannerData.f.h = parseInt(height);
	Fai.top._bannerData.f.p = url;
	
	Fai.top._bannerData.s = 3;
	
	var option = {};
	option.isFlash = true;
	option.height = height;
	bannerChange(option);
}

function onFlashWidthChange() {
	refreshBannerFlash();
}

function onFlashHeightChange() {
	refreshBannerFlash();
}

function onPicUploadEvent(back) {
	if(back){
		var resultBack = $.parseJSON(back);
		var fileId = resultBack.data[0].fileId;
		var filePath = resultBack.data[0].filePath;
		var fileWidth = resultBack.data[0].fileWidth;
		var fileHeight = resultBack.data[0].fileHeight;
		var filePreViewPath = resultBack.data[0].preViewPath;
		var alreadyHas = false;
		$.each(Fai.top._bannerData.l, function(j, k){
			if(k.i == fileId){
				alreadyHas = true;
				return false;
			}
		});
		
		if(!alreadyHas){
			//将上传的横幅附在bannerCP后面
			insertCusBanner(filePreViewPath, filePath, fileId, fileWidth, fileHeight);
			refreshUploadBanner();
	
			$("#uploadmsg1").html('<a href="javascript:view(\'' + fileId + '\');">查看</a>');
			var obj = $("#panelLibList").children("div.panelLibItem[vid=" + fileId + "]");
			selectLibBanner(fileId);
		}else{
			Fai.ing("重复的文件已自动覆盖。", true);
		}
	}
}

function onFlashUploadEvent(back) {	
	if(back){
		var resultBack = $.parseJSON(back);
		var fileId = resultBack.data[0].fileId;
		var filePath = resultBack.data[0].filePath;
		
		$("#flashId").val(fileId);
		$("#flashUrl").val(filePath);
		
		$("#uploadmsg2").html('<a href="javascript:view(\'' + fileId + '\');">查看</a>');
		refreshBannerFlash();
	}
}

function refreshUploadBanner()
{
	//清空， 遍历上传的横幅，重写top.bannerData.l
	if(Fai.top._bannerData.l.length > 0){
		Fai.top._bannerData.l = [];
	}
	$.each($("#panelLibList").children(), function(){
		if($(this).attr("cus") == 1)//上传的
		{
			var id = $(this).find("img").attr("id");
			var width = $(this).attr("vwidth");
			var height = $(this).attr("vheight");
			var path = $(this).find("img").attr("sources");
			var src = $(this).find("img").attr("src");
			Fai.top._bannerData.l.push({i:id, w:width, h:height, p:path, tp:src});
		}
	});
}

function delBanner(id){
	//删除自定义横幅
	for(var i = 0, len = Fai.top._bannerData.l.length; i < len; i++){
		if(Fai.top._bannerData.l[i].i == id){
			Fai.top._bannerData.l.splice(i, 1);
			break;
		}
	}
	deleteOneRecentUsed(id);
	$("#cus" + id).remove();
	$("#cloner"+ id).remove();
	delSelectedBanner(id);
	refreshUploadBanner();
	bannerChange();
	
	Site.triggerGobalEvent("showSelectedBanner","panelLibList");
}

//编辑坑内横幅链接方式
function editSelectedBanner(vid, cus){
	var sources = '';
	for ( i=0;i<bannerList.length;i++){
		if ( bannerList[i].vid == vid ) {
			sources = bannerList[i].vpath.replace('http://0.ss.faisys.com', '');
			break;
		}
	}
	var editContent = [];
	editContent.push('<div id="setBody" style="padding:5px 0;">');
	editContent.push(	'<div id="jpmRadioPanel" style="height:25px;line-height:25px;">');
	editContent.push(		'<span style="display:inline-block;width:83px;text-align:right;">跳转方式：</span>');
	editContent.push(		'<input id="jpmNot" name="jpmRadio" type="radio" onclick="styleBanner_jumpMethodChange(\'jpmNot\');" style="vertical-align:-3px;"><label for="jpmNot" style="cursor:pointer;">不跳转</label>');
	editContent.push(		'<input id="jpmCus" name="jpmRadio" type="radio" onclick="styleBanner_jumpMethodChange(\'jpmCus\');" style="vertical-align:-3px;"><label for="jpmCus" style="cursor:pointer;">自定义链接</label>');							
	editContent.push(	'</div>');
	
	editContent.push(	'<div id="cusUrlPanel" style="margin:9px 0;line-height:23px;float:left;">');
	editContent.push(		'<label for="cusUrl" style="cursor:text;width:83px;text-align:right;float:left;">链接地址：</label>');
	editContent.push(		'<input id="cusUrl" type="text" name="cusUrl" size="16" style="float:left;"/>');
	editContent.push(	'</div>');
	editContent.push(	'<div id="downloadPanel" style="padding:10px 0;clear:both;">');
	editContent.push(		'<span style="display:inline-block;width:83px;text-align:right;">横幅文件：</span>');
	if (cus == 1){
		editContent.push(		'<a href="/view.jsp?fileID=' + vid + '" target="_blank" style="color:#51BEFA;">点击查看</a>');
	} else {
		editContent.push(		'<a href="${ctx}' + sources + '" target="_blank" style="color:#51BEFA;">点击下载</a>');
	}
	editContent.push(	'</div>');
	editContent.push('</div>');
	
	var options = {
		title		: '编辑横幅链接',
		divContent	: editContent.join(''),
		width		: 320,
		height		: 100
	};
	pbwId = Fai.popupWindow(options);
	Fai.addPopupWindowBtn( pbwId, { id:'pbwAddPropSave', extClass:'saveButton', text: '确 定', click:editBannerLink });
	Fai.addPopupWindowBtn( pbwId, { id:'pbwAddPropClose', extClass:'cancelButton', text: '取 消', click:'close' });

	initEdit(vid);
	Site.triggerGobalEvent("showSelectedBanner","panelLibList");
}

function initSelectedData(vid){
	Fai.top.styleBanner_selectObj = $('#selectedBannerContainer .panelLibItem[vid=' + vid + ']');
	var initflag = false;
	$.each(Fai.top._bannerData.n, function(i, n){
		if (vid == n['i']){
			initflag = true;
			Fai.top.styleBanner_selectObj.data('LINK_TYPE', n['e']);
			Fai.top.styleBanner_selectObj.data('JTYPE', n['jType'] || 0);
			Fai.top.styleBanner_selectObj.data('JNAME', n['jName'] || '');
			Fai.top.styleBanner_selectObj.data('JURL', n['jUrl'] || '');
			Fai.top.styleBanner_selectObj.data('JIDE', n['u']);
			if( n['e'] == 0 || n['jName'] == null ){
				Fai.top.styleBanner_selectObj.data('LINK_TYPE',0);
				Fai.top.styleBanner_selectObj.data('JTYPE', 0);
				Fai.top.styleBanner_selectObj.data('JNAME', '');
				Fai.top.styleBanner_selectObj.data('JURL', '');
				Fai.top.styleBanner_selectObj.data('JIDE', '');
			}
			return false;
		}
	});
	if (initflag == false){
		Fai.top.styleBanner_selectObj.data('LINK_TYPE',0);
		Fai.top.styleBanner_selectObj.data('JTYPE', 0);
		Fai.top.styleBanner_selectObj.data('JNAME', '');
		Fai.top.styleBanner_selectObj.data('JURL', '');
		Fai.top.styleBanner_selectObj.data('JIDE', '');
	}
}

function initEdit(vid){
	Fai.top.styleBanner_selectObj = $('#selectedBannerContainer .panelLibItem[vid=' + vid + ']');
	if (Fai.top.styleBanner_selectObj.data('LINK_TYPE') == 1 || Fai.top.styleBanner_selectObj.data('LINK_TYPE') == 2 ){
		Fai.top.$('#jpmCus').prop('checked', true);
		Fai.top.styleBanner_jumpMethodChange('jpmCus');
	}else{
		Fai.top.styleBanner_jumpMethodChange('jpmNot');
	}
	var jumpOptions = {
		inputId : "cusUrl",
		moduleType : 7,
		jumpType : Fai.top.styleBanner_selectObj.data('JTYPE') || 0,
		jumpIde : Fai.top.styleBanner_selectObj.data('JIDE'),
		jumpName : Fai.decodeHtml(Fai.top.styleBanner_selectObj.data('JNAME')),
		whetherTop: true	
	}
	Site.jumpControl(jumpOptions);
}

Fai.top.styleBanner_jumpMethodChange = function(obj){
	if( obj === 'jpmCus'){ 						// 自定义url
		Fai.top.$('#cusUrlPanel').show();
		Fai.top.$('#jpmCus').prop('checked', true);
		var tmp = Fai.top.styleBanner_selectObj.data('JNAME');
		Fai.top.$('#cusUrl').val(tmp).focus();
		var jType = Fai.top.styleBanner_selectObj.data('JTYPE');
	}else{										// 不跳转
		Fai.top.$('#cusUrlPanel').hide();
		Fai.top.$('#jpmNot').prop('checked', true);
	}
}

function editBannerLink(){
	
	if (Fai.top.$('#jpmCus').prop('checked') === true){
		var jumpCtrl = Fai.top.$('#jumpCtrl');
		var jUrl = jumpCtrl.attr('_lurl');
		if( jUrl == null ) { // 没有修改过则直接关闭，不做操作
			Fai.closePopupWindow(pbwId);
			return;
		}
		var jType = parseInt(jumpCtrl.attr('_ltype'));
		Fai.top.styleBanner_selectObj.data('LINK_TYPE',1);

		Fai.top.styleBanner_selectObj.data('JTYPE', jType);
		if( jType === 103 || jType === 1 ){
			Fai.top.styleBanner_selectObj.data('JNAME', Fai.encodeHtml(jUrl));	
		} else {
			Fai.top.styleBanner_selectObj.data('JNAME', Fai.encodeHtml( jumpCtrl.attr('_lname') ));
		}
		Fai.top.styleBanner_selectObj.data('JURL', jUrl);
		Fai.top.styleBanner_selectObj.data('JIDE', jumpCtrl.attr('_lide'));
	}
	if (Fai.top.$('#jpmNot').prop('checked') === true){
		Fai.top.styleBanner_selectObj.data('LINK_TYPE', 0);
		Fai.top.styleBanner_selectObj.data('JTYPE', 0);
		Fai.top.styleBanner_selectObj.data('JNAME', '');
		Fai.top.styleBanner_selectObj.data('JURL', '');
		Fai.top.styleBanner_selectObj.data('JIDE', '');
	}
	refreshBannerData();
	Fai.closePopupWindow(pbwId);
}

//如果没有选中的横幅的时候，显示默认横幅
function checkToShowDefaultBanner(flag) {
	var l = $("#selectedBannerContainer").find(".panelLibItem").length;
	if(l < 1 && flag){
		//删除用户选择横幅大小的记录
		$.cookie("_bannerLibWeight", null, { expires:1,path:'/'});
		weightInitKey = templateBannerOption.weight;
		if(typeof weightInitKey != "undefined"){
			for (var i = 0; i < weightList.length; ++i) {
				if (weightList[i].key == weightInitKey) {
					weightInitVal = weightList[i].label;
				}
			}
			$("#panelLibWeight").combobox("setInitKey", weightInitKey);
			refreshLibWeight(weightInitKey);
		}
	}
	if(l == 0 && Fai.top._bannerData.s != 3 && Fai.top._bannerData.s != 0)
	{
		Fai.top.$("#banner").removeAttr("style");
	}
}

//判断选择横幅数量的下拉框的值，初始化占位区域
function refreshBannerDown()
{	
	//先恢复横幅默认状态
	$("#panelLibList").children().removeClass("bannerDown");
	//再将使用的横幅进行打钩
	$.each($("#selectedBannerContainer").find(".panelLibItem"), function(){
		var vid = $(this).attr("vid");
		$.each($("#panelLibList").children(), function(){
			if($(this).attr("vid") == vid)
			{
				$(this).addClass("bannerDown");
			}
		});
	});
}

// 遍历选中的横幅，初始化
function initCheckBanner(){
	for(var i = 0; i< Fai.top._bannerData.n.length; i++){
		// init check效果
		$.each($("#panelLibList").children(), function(){
			if($(this).attr("vid") == Fai.top._bannerData.n[i].i){
				$(this).addClass("bannerDown");
			}
		});
		// init 选中框内容
		if ( initing ){
			$.each($("#selectedBannerContainer").find(".selectedBanner"), function(){
				var selected = $(this);
				if( selected.attr("status") == 1 && selected.attr("inside") == 0 ){
					var vid = null;
					if(Fai.top._bannerData.n[i].t == 0){ // 横幅库
						var banner = null;
						for (var j = 0; j < bannerList.length; ++j) {
							if (bannerList[j].vid == Fai.top._bannerData.n[i].i) {
								banner = bannerList[j];
								break;
							}
						}
						if (banner == null) {
							return true;
						}
						
						insertBannerCP({
							'bkey':banner.bkey,
							'vweight':banner.vweight,
							'vheight':banner.vheight,
							'vwidth':banner.vwidth,
							'vtrade':banner.vtrade,
							'vid':banner.vid,
							'vpath':banner.vpath,
							'preview':banner.preview,
							'vtype':banner.type,
							'edgeLeftBg':banner.edgeLeftBg,
							'edgeRightBg':banner.edgeRightBg,
							'selected':selected
						});
						
				
						recentUsed( banner.bkey );
						vid = banner.vid;
					}else{
						var banner = null;
						for (var j = 0; j < Fai.top._bannerData.l.length; j++) {
							if (Fai.top._bannerData.l[j].i == Fai.top._bannerData.n[i].i) {
								banner = Fai.top._bannerData.l[j];
								break;
							}
						}
						if (banner == null) {
							return true;
						}
						insertCusBannerCP(banner.tp, banner.p, banner.i, banner.w, banner.h, selected);
						recentUsed( banner.i);
						vid = banner.i;
					}

					initSelectedData(vid);
					return false;
				}
			});
		}
	}
}

function dropdownIndustry(){
	var div = top.$("#bannerTradeSelectDiv");
	if(div.length == 0) {
		Site.logDog(100041, 3);
		var html = [];
		html.push("<div id='bannerTradeSelectDiv' class='menuList'><div class='triangle' style='left: 300px;'></div><ul>");

		for ( var i = 0; i < firstTradeList.length; i++ ) {
			var ftId = firstTradeList[i].key;
			var trade2List; //用于存储二级行业信息
			var liStyle = "";
			if(i%2 == 1){
				liStyle = 'style="background: rgb(235, 235, 235);"';
			}

			html.push("<li "+liStyle+"><p class='menuTitle' id='menuTitle"+ ftId +"'><span class='fr'>：</span><span class='titleText'>"+ firstTradeList[i].label +"</span></p><div class='menuContent'>");
			for ( var j = 0; j < tradeList1.length; j++ ) {
				if ( tradeList1[j].id == ftId ){
					trade2List = tradeList1[j].list;
					for(var k = 0;k < trade2List.length; k++){
						html.push("<a id='trade2Menu"+ trade2List[k].id +"' "+(k == 0 ? "" : " class='verticalLine' ")+" hidefocus='true' class='trade2Menu' href='javascript:;'  onclick='bannerTradeSelectIndustry(" + trade2List[k].id + ");return false;' >"+trade2List[k].name+"</a>");
					}
					html.push("</div></li>");
					continue;
				}
			}
		}
		html.push("</ul></div>");

		top.$('body').append(html.join(""));
		
		var baseTop = $('#panelLibTrade').offset().top;
		var baseLeft = $('#panelLibTrade').offset().left;
		top.$("#bannerTradeSelectTop").css("top", baseTop + 25 + 33);
		top.$('#bannerTradeSelectDiv').css("top", baseTop + 30 + 33);
		top.$("#bannerTradeSelectTop").css("left", baseLeft + 60);
		top.$('#bannerTradeSelectDiv').css("left", baseLeft - 155);
		top.$('#trade2Menu' + selectTrade).addClass("selected");
		var $bannerTradeSelectDiv = top.$('#bannerTradeSelectDiv'),
		    $topMenuListLi = $bannerTradeSelectDiv.find("li"),
		    $topMenuListP = $bannerTradeSelectDiv.find("p.menuTitle");
		
		$topMenuListLi.unbind("hover").hover(function(){
			$topMenuListP.removeClass("selected");
			$(this).find("p.menuTitle").addClass("selected");
		});

		$bannerTradeSelectDiv.unbind("mouseleave").mouseleave(function(){
			top.$("#bannerTradeSelectTop").remove();
			top.$('#bannerTradeSelectDiv').remove();
		});

	} else {
		top.$("#bannerTradeSelectTop").remove();
		top.$('#bannerTradeSelectDiv').remove();
	}
}
top.bannerTradeSelectIndustry = function(id){
	$("#dropdownInput").focus();
	$("#dropdownInput").val($.trim(top.$('#trade2Menu' + id).text()));
	
	top.$("#bannerTradeSelectTop").remove();
	top.$("#bannerTradeSelectDiv").remove();
	selectTrade = id;
	clearText();
	initBannerList();
	insertTemplateBanner();
	initCusBanner();
	initCheckBanner();
	$('#panelLibList').scrollTop(0);
	$.cookie("_bannerPreviewelectTrade", id, {path:"/"});
}

function bannerTypeChange(item){
	var key = parseInt(item.key);
	if ( key == 3 ) {
		showTypeFlash();
		$("#showRecentlyUsedBanner").hide();
	} else {
		$("#panelLibList").removeClass("panelLibListAutoWidth");
		showTypeLib();
		$("#showRecentlyUsedBanner").show();
	}
	Site.triggerGobalEvent("showSelectedBanner","panelLibList");
}

$(function(){
	
	var styleDesignHeight = ~~($.cookie( 'styleDesignHeight', { path:'/'} ));
	if(styleDesignHeight > 100){
		var tabsHeight = Fai.top.$("#styleDesign").children(".tabsWrap").height() || 37;
		var panelsHeight = styleDesignHeight - tabsHeight;
		$('.panelLeft').height((panelsHeight - 20)+"px");
		$('#panelLibList').height((panelsHeight - 49)+"px");
		$('#typePanelFlash').height((panelsHeight - 50)+"px");
		$('#bannerEffectsFrame').height((panelsHeight-4)+"px");
	}
	
	//当拖动设置面板调节显示区高度时触发
	Site.bindGobalEvent("styleDesignResize", function(event, option){
		$('.panelLeft').height((option - 20)+"px");
		$('#panelLibList').height((option - 49)+"px");
		$('#typePanelFlash').height((option -50)+"px");
		$('#bannerEffectsFrame').height((option-4)+"px");
	});
	
	//设置横幅链接,用于点击横幅工具栏设置链接时进行同步数据
	Site.bindGobalEvent("bannerLinkChange", function(event, option){
		initSelectedData(option.i);
	});
	
	initSelectedBannerBox(maxBannerNum);
	top.$("#bannerTradeSelectTop").remove();
	top.$('#bannerTradeSelectDiv').remove();
	
	/******************* 新的 ************************/
	refreshbannerPreviewtatus();
	var $selectedBannerContainer = $("#selectedBannerContainer");
	$selectedBannerContainer.delegate(".selectedBanner","click",function(){
		changeBannerNum($(this));
	});
	$selectedBannerContainer.delegate(".selectedBanner","mouseover",function(){
		var tmpClass = $(this).attr("class");
		$(this).attr("class", tmpClass.replace(/-box/g, "-hoverBox"));
	});
	$selectedBannerContainer.delegate(".selectedBanner","mouseout",function(){
		var tmpClass = $(this).attr("class");
		$(this).attr("class", tmpClass.replace(/-hoverBox/g, "-box"));
	});
	
	$("#selectedBannerContainer").delegate("a.bannderBtnDel","click",function(e){
		delSelectedBanner($(this).attr("vid"));
		e.stopPropagation();
		return false;
	});
	
	/******************** 新的end ****************************/
	
	//获取cookie中使用过的横幅信息
	var getCookie=$.cookie('recentbannerPreview',{ path:'/' });
	if(getCookie!=null){
		usedArray=$.cookie('recentbannerPreview').split(",");
	}
	
	// 对正在使用的下架横幅做处理
	for (var i = 0; i < shelfBannerList.length; i++){
		for ( j = 0; j < Fai.top._bannerData.n.length; j++){
			if (shelfBannerList[i].vid == Fai.top._bannerData.n[j].i){
				bannerList.push(shelfBannerList[i]);
			}
		}
		if (shelfBannerList[i].vid == top._templateBannerId){
			bannerList.push(shelfBannerList[i]);
		}
	}
	
	// 拼接vpath和preview
	for (var i = 0; i < bannerList.length; i++){
		bannerList[i].vpath = "${ctx_web}/image/template/banners/" + bannerList[i].vid + "." + bannerList[i].type;
		bannerList[i].preview = "${ctx_web}/image/template/bannerPreview/" + bannerList[i].vid + ".jpg";
	}
	
	// 二级tab的hover和check
	$('.menu').hover(function(){
		$(this).addClass('menuHovor');
	}, function(){
		$(this).removeClass('menuHovor');
	});	
	
	// Fai.delayLoadImg();
	// 根据当前的模版宽度来初始化
	
	if ( $.cookie("_bannerLibWeight",{path:'/'}) != null ){
		weightInitKey = $.cookie("_bannerLibWeight", {path:'/'});
	} else {
		var vid = 0;
		var getWeight = false;
		for(i=0;i<bannerList.length;i++){
			vid = bannerList[i].vid;
			if ( vid == top._templateBannerId ) {
					weightInitKey = bannerList[i].vweight,
					getWeight = true;
			}
		}
		if(!getWeight){
			weightInitKey = 12;
		}
	}
	
	for (var i = 0; i < weightList.length; ++i) {
		if (weightList[i].key == weightInitKey) {
			weightInitVal = weightList[i].label;
		}
	}

	var bannerCountList = new Array();
	for(var i = 1; i < 9; i++)
	{
		bannerCountList.push({label:i, key:i});
	}
	var bannerTypeList = new Array();
	{
		bannerTypeList.push({label:"图片", key:4});
		bannerTypeList.push({label:"Flash", key:3});
	}
	var typeInitVal = Fai.top._bannerData.s == 3 ? "Flash" : "图片";
	var typeInitKey = 4;
	if ( Fai.top._bannerData.s == 3 ){
		typeInitKey = 3;
	}
	$('#bannerTypeChoice').combobox({readonly:true, source:bannerTypeList, initVal:typeInitVal, initKey:typeInitKey, select:bannerTypeChange});
	$('#bannerCountChoice').combobox({readonly:true, source:bannerCountList, initVal:Fai.top._bannerData.c, initKey:Fai.top._bannerData.c, change:function(val){Fai.top._bannerData.c = parseInt(val); Site.logDog(100041, 1); refreshBannerDown();}});
	//$('#panelLibWeight').combobox({readonly:true, source:weightList, initVal:weightInitVal,initKey:weightInitKey,select:selectLibWeight});
	$('#panelLibWeight').combobox({readonly:true, source:weightList, initVal:weightInitVal,initKey:weightInitKey,select:selectLibWeight});
	
	selectTrade = 107; // shynee
	//因为要由二级找一级，这里改从java拿cookie
	//if ( $.cookie("_bannerPreviewelectTrade") != null ){
		//selectTrade = $.cookie("_bannerPreviewelectTrade");
		for (var i = 0; i < tradeList1.length; i++){
			if (tradeList1[i].id == selectTrade){
				var tradeListChildren = tradeList1[i].list;
				for(var j=0; j<tradeListChildren.length; j++){
					if(31 == tradeListChildren[j].id){
						selectTradeName = tradeListChildren[j].name;
					}
				}
				//selectTradeName = tradeList[i].label;
			}
		}
	//}
	$('#dropdownInput').val(selectTradeName);
	selectWeight = weightInitKey; // shynee
	
	
	initBannerList(); //初始化系统横幅
	insertTemplateBanner(); //初始化主题默认横幅
	initCusBanner();//初始化自定义横幅
	refreshBannerDown(); //初始化横幅
	initCheckBanner(); //初始化选择的横幅
	checkToShowDefaultBanner();
	
	// 优化选择横幅click事件
	$('#panelLibList').on("click", ".panelLibItem, .panelLibItemT", function(){
		selectLibBanner($(this).attr("vid"));
	});
	
	// 初始化flash
	$("#flashUrl").val(Fai.top._bannerData.f.p);
	$("#flashId").val(Fai.top._bannerData.f.i);
	if (!Fai.isNull(Fai.top._bannerData.f.w)) {
		$("#flashWidth").val(Fai.top._bannerData.f.w);
	} else {
		$("#flashWidth").val('960');
	}
	if (!Fai.isNull(Fai.top._bannerData.f.h)) {
		$("#flashHeight").val(Fai.top._bannerData.f.h);
	} else {
		$("#flashHeight").val('100');
	}

	$('.panelLibItem').hover(function(){
		$(this).addClass('panelLibItemHover');
	}, function(){
		$(this).removeClass('panelLibItemHover');
	});
	
	// 初始化左侧tab和类型
	$("#advancedFilter").hide();
	$("#bannerTypeChoiceBox").hide();
	showSiteBanner();
	if( Fai.top._bannerData.s == 3 ) {
		//使用flash
		showTypeFlash();
		$("#showRecentlyUsedBanner").hide();
	} else {
		showTypeLib();
		$("#showRecentlyUsedBanner").show();
	}
	
	//文件上传2.0 图片上传
	var sizeLimit1 = 5;
	var imgMaxWidth1 = 2056;
	var imgMaxHeight1 = 1600;
	var imgMode1 = 2;
	var fileUpload2_settings1 = {title:"添加图片", maxSize:sizeLimit1, type:['jpg','jpeg','bmp','png','gif'], imgMode:imgMode1, from:"ban"};//imgMaxWidth:imgMaxWidth1, imgMaxHeight:imgMaxHeight1, 
	Site.fileUpload2("#uploadButton", fileUpload2_settings1, onPicUploadEvent);
	

	//文件上传2.0 上传横幅Flash
	var sizeLimit2 = 5;
	var fileUpload2_settings2 = {title:"添加文件", maxSize:sizeLimit2, type:['swf']};
	Site.fileUpload2("#uploadButton1", fileUpload2_settings2, onFlashUploadEvent);
	
	initing = false;

	//图片筛选
	$("#pictureSearch").keyup(function(){
		$(".cloner").remove();
		
		var items = $("#panelLibList").children("div.panelLibItem");
		var _input = $(this);
		var _search_input = $.trim(_input.val());
		var clearSearch = $('#clearSearch');
		
		if( _search_input != '' ){
			if( !clearSearch.hasClass('find') ){
				clearSearch.removeClass('unfind').addClass('find').attr('title','清除输入');
			}
		
			items.remove();
			$('.panelLibItemT').remove();
			var _search_id = _search_input.toUpperCase();
			if(/^[b]?\d+$/i.test(_search_input)){
				for(i=0;i<bannerList.length;i++){
					var item_id = bannerList[i].bkey;
					if(_search_id.charAt(0) == 'B'){
						_search_id = _search_id.replace("B", "");
					}
					for (j=0;_search_id.length<4;j++){
						_search_id = "0" + _search_id;
					}
					if( item_id && item_id == _search_id ){
						totalList = [];
						insertBanner({
							'bkey':bannerList[i].bkey,
							'vweight':bannerList[i].vweight,
							'vheight':bannerList[i].vheight,
							'vwidth':bannerList[i].vwidth,
							'vtrade':bannerList[i].vtrade,
							'vid':bannerList[i].vid,
							'vpath':bannerList[i].vpath,
							'preview':bannerList[i].preview,
							'vtype':bannerList[i].type,
							'edgeLeftBg':bannerList[i].edgeLeftBg,
							'edgeRightBg':bannerList[i].edgeRightBg
							
						});
						$('#panelLibList').append(totalList.join(""));
						initCheckBanner();
						lazyloadBannerPreImg();
						Site.logDog(100041, 5);
						return;
					}
				}
			}
				
		}else{
				clearSearch.removeClass('find').removeClass('unfind').removeAttr('title');
				items.remove();
				$('.panelLibItemT').remove();
			    initBannerList();
				insertTemplateBanner();
				initCusBanner();
				initCheckBanner();
		}
	});	
	
	
	$("#clearSearch").click(function(){
		var _me  = $(this);
		if(_me.hasClass('find')){
			var _input = $("#pictureSearch").val();
			if(_input!=''){
				_me.removeClass('find').removeClass('unfind').removeAttr('title');
				$("#pictureSearch").val('');
				
				//还原最初的图片显示
				initBannerList();
				insertTemplateBanner();
				initCusBanner();
				initCheckBanner();
			}					 
		}	
		return false;
	});
	
	$('#uploadButton').hover(function(){
		var bannerAreaWidth = top.$('#banner').width();
		var bannerAreaHeight = top.$('#banner').height();
		$(this).attr("title", "建议上传宽高为 " + bannerAreaWidth + "×" + bannerAreaHeight + " 像素的图片");
	}, function(){
	
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
	
	
	Site.logDog(100039, 2);
	Site.logDog(100041, 0);
	
	$('#dropdownInput').blur(function(){
		setTimeout(function() {
			top.$("#bannerTradeSelectTop").remove();
			top.$('#bannerTradeSelectDiv').remove();
		}, 300)
	});
	
	
	//横幅特效示意图不在显示区域时，自动滚动到显示区
	/*Site.bindGobalEvent("showSelectedBanner", function(event, str){
		var $g_main = top.$(top.document).find("#g_main");
		var $webBannerTable = $g_main.find(".webBannerTable");
		//超出顶部
		if( $g_main.scrollTop() > ($webBannerTable.offset().top + $webBannerTable.outerHeight()) ){
			$g_main.scrollTop( ($webBannerTable.offset().top - $webBannerTable.height()) );
		}
		//超出底部
		if( ($g_main.scrollTop() + $g_main.height() ) < $webBannerTable.offset().top ){
			$g_main.scrollTop( ($webBannerTable.offset().top - $webBannerTable.height())  );
		}
	});*/
	
	checkBannerLinkBtn();
});



function advancedFilterShow(){
	var advFil = $('#advancedFilter');
	if ( advFil.is(':visible') ){
		advFil.hide();
		$("#bannerTypeChoiceBox").hide();
		$('#advancedFilterBtn').addClass('advFilRight').removeClass('advFilLeft').removeClass('advFilLeft-hover');
		$('#advancedFilterBtn').attr('title', '更多');
	} else {
		Site.logDog(100041, 4);
		advFil.show();
		$("#bannerTypeChoiceBox").show();
		$('#advancedFilterBtn').addClass('advFilLeft').removeClass('advFilRight').removeClass('advFilRight-hover');
		$('#advancedFilterBtn').attr('title', '');
	}
	
}

//延迟加载图片
function lazyloadBannerPreImg(){
	$("img.bannerPreImg:visible").lazyload({
		container: $("#panelLibList")
	});
}

//点击显示最近使用横幅
function showRecentlyUsedBanner(){
	var me = $('#showRecentlyUsedBanner');
	tabCheck(me);
	$('#bannerEffects').hide();
	$('#panelLibFilter').hide();
	$('#typePanelLib').show();
	$('#selectedBannerContainer').hide();
	$("#panelLibList").addClass("panelLibListAutoWidth");
	$("#panelLibList .panelLibItem").hide();
	$("#panelLibList .panelLibItemT").hide();
	$("#panelLibList .cloneBanner").remove();
	showUsedbannerPreview();
	$('#recentTypePanelLib').show();
	Site.triggerGobalEvent("showSelectedBanner","panelLibList");
}

//插入显示使用过的横幅
function showUsedbannerPreview(){
	var $panelLibList = $("#panelLibList");
	for( var i = usedArray.length-1; i >= 0; i-- ){
		var bannerId = usedArray[i];
		//下架羊年4幅横幅,又下架中秋国庆20151117
		if((bannerId >= 2459 && bannerId <= 2482) || (bannerId >= 1774 && bannerId <= 1780) || (bannerId >= 1809 && bannerId <= 1822) || (bannerId >= 2237 && bannerId <= 2242) || (bannerId >= 2249 && bannerId <= 2254)){
			var j, 
				offShelves = false,
				checkBanner = Fai.top._bannerData.n,
				checkLength = checkBanner.length;
			for(j = 0;j < checkLength; j++){
				if(bannerId == checkBanner[j].i){
					break;
				}
				
				if(j == checkLength - 1){
					offShelves = true;
				}
			}
			
			if(offShelves){
				continue;
			}
			
		}
		
		
		var clone = $("#item"+bannerId).clone();
		var cloneImg = clone.find("img");
		var imgPath = cloneImg.attr("data-original");
		if( clone.length < 1 ){
			clone = $("#cus"+bannerId).clone();
		}
		if( bannerId == top._templateBannerId  ){
			clone.removeAttr("onclick");
		}
		clone.attr("id","cloner"+bannerId);
		cloneImg.attr("src",imgPath);
		
		if( clone.hasClass("bannerDown") ){
			clone.attr("class","cloneBanner panelLibItem bannerDown");
		}else{
			clone.attr("class","cloneBanner panelLibItem");
		}
		
		$panelLibList.append( clone );
		
	}
	$("#panelLibList .cloneBanner").show();
}

/*********************** 新的 ***************************/
function changeBannerNum(obj){
	if(obj.attr("inside") == 1){
		return;
	}
	var num = Fai.top._bannerData.c;
	if(obj.attr("status") == 1){
		if(num == minBannerNum){
			return;
		}
		Fai.top._bannerData.c = num - 1;
	}else if(obj.attr("status") == 0){
		if(num == maxBannerNum){
			return;
		}
		Fai.top._bannerData.c = num + 1;
	}
	refreshbannerPreviewtatus();
	top._bannerChanged++;
	Site.styleChanged();
	Site.setRefreshInfo("siteBanner", true);
}



//选择横幅
function selectLibBanner(vid){
	var $item = $("#panelLibList").children("[vid='"+ vid +"']");
	if($item.hasClass("bannerDown")){
		$item.removeClass("bannerDown");
		$.each($("#selectedBannerContainer").find(".panelLibItem"), function(){
			if($(this).attr("vid") == vid)
			{
				$(this).remove();
				refreshBannerData();
				initSelectedBannerBox(maxBannerNum);
				refreshSelectedBanner();
			}
		});
	}else{
		var i = 0;
		$.each($("#selectedBannerContainer").find(".selectedBanner"), function(){
			if($(this).children().length > 0)
			{
				i ++;
			}
		});
		if(i == Fai.top._bannerData.c){
			//删除最后一张
			var j = 0;
			$.each($("#selectedBannerContainer").find(".panelLibItem"), function(){
				j++;
				if(i == j)//到达最后一张了
				{
					delSelectedBanner($(this).attr("vid"));
				}
			});
		}
		$.each($("#selectedBannerContainer").find(".selectedBanner"), function(){
			var selected = $(this);
			if( selected.attr("inside") == 0 && selected.attr("status") == 1 ){
				if ( $item.attr("cus") == 0 ){
					var banner = null;
					for (var j = 0; j < bannerList.length; ++j) {
						if (bannerList[j].vid == vid) {
							banner = bannerList[j];
							break;
						}
					}
					if (banner == null) {
						return true;
					}
					insertBannerCP({
						'bkey':banner.bkey,
						'vweight':banner.vweight,
						'vheight':banner.vheight,
						'vwidth':banner.vwidth,
						'vtrade':banner.vtrade,
						'vid':banner.vid,
						'vpath':banner.vpath,
						'preview':banner.preview,
						'vtype':banner.type,
						'edgeLeftBg':banner.edgeLeftBg,
						'edgeRightBg':banner.edgeRightBg,
						'selected':selected
					});
				} else{
					var banner = null;
					for (var j = 0; j < Fai.top._bannerData.l.length; j++) {
						if (Fai.top._bannerData.l[j].i == vid) {
							banner = Fai.top._bannerData.l[j];
							break;
						}
					}
					if (banner == null) {
						return true;
					}
					insertCusBannerCP(banner.tp, banner.p, banner.i, banner.w, banner.h, selected);
				}
				initSelectedData(vid);
				return false;
			}
		});
		$item.addClass("bannerDown");
		refreshBannerData();
	}
	
	Site.triggerGobalEvent("showSelectedBanner","panelLibList");
}

// 插入selected系统横幅
function insertBannerCP(options){
	var bkey = options.bkey, 
		vweight = options.vweight,
		vheight = options.vheight, 
		vwidth = options.vwidth,
		vtrade = options.vtrade,
		vid = options.vid,
		vpath = options.vpath,
		preview = options.preview, 
		vtype = options.vtype,
		edgeLeftBg = options.edgeLeftBg,
		edgeRightBg = options.edgeRightBg,
		selected = options.selected;

	var tmp = [
	'<div class="panelLibItem" _bkey="B' + bkey + '" cus = "0" style=" width:100px;height:24px;margin:0; border:none;cursor: move; display: block; background-color: #eef1f6;"  vheight="' + vheight + '" vwidth="' + vwidth + '" vid="' + vid + '" vweight="' + vweight + '" vpath="' + vpath + '" edgeLeftBg="'+ edgeLeftBg +'" edgeRightBg="'+ edgeRightBg +'">',
	'<div style="position:absolute;width:100%;height:100%;background:url(\'${ctx_web}/image/site/transpace.png\');"></div>',
		'<table style="width:100%;height:100%;" cellpadding="0" cellspacing="0"><tr><td valign="middle" align="center">',
			'<img class="bannerPreImg" src="' + preview + '" width="100" height="24"/>',
		'</td></tr></table>',
		'<a hidefocus="true" href="javascript:;" class="btn_16x16 editBtn4 bannderBtnEdit" title="编辑" onclick="editSelectedBanner(\''+ vid +'\', 0);return false;"></a><a hidefocus="true" href="javascript:;" class="btn_16x16 rmHoverBtn2 bannderBtnDel" title="移除" vid="'+ vid +'" ></a>',
	'</div>'
	];
	selected.attr("inside", 1).addClass("canSort canSort-box").append(tmp.join(''));
}

// 插入selected自定义横幅
function insertCusBannerCP(viewUrl, sourcesUrl, id, vweight, vheight, selected) {
	var str = new Array();
	str.push( '<div class="panelLibItem" vid="'+ id +'" cus="1" vwidth="' + vweight + '" vheight="' + vheight + '" style="width: 100px;height: 24px;margin:0;border:none; display: block; background-color: #eef1f6; cursor: move; " >' );
	str.push(	'<div style="position:absolute;width:100%;height:100%;background:url(\'${ctx_web}/image/site/transpace.png\');"></div>');
	str.push( 	'<table style="width:100%;height:100%;" cellpadding="0" cellspacing="0"><tbody><tr><td valign="middle" align="center">' );
	str.push( 		'<img id="'+ id +'" src="'+ viewUrl +'" sources="' + sourcesUrl + '" width="100" height="24">' );
	str.push( 	'</td></tr></tbody></table>' );
	str.push( 	'<a hidefocus="true" href="javascript:;" class="btn_16x16 editBtn4 bannderBtnEdit" title="编辑" onclick="editSelectedBanner(\''+ id +'\', 1);return false;"></a><a hidefocus="true" href="javascript:;" class="btn_16x16 rmHoverBtn2 bannderBtnDel" title="移除" vid="'+ id +'"></a>' );
	str.push( '</div>' );
	selected.attr("inside", 1).addClass("canSort canSort-box").append(str.join(''));
}

//删除坑内的横幅
function delSelectedBanner(vid)
{
	var $item = $("#selectedBannerContainer").find(".panelLibItem[vid='"+ vid +"']");
	$("#panelLibList").children("[vid='"+ vid +"']").removeClass("bannerDown");
	$item.remove();
	refreshBannerData();
	initSelectedBannerBox(maxBannerNum);
	refreshSelectedBanner();
	checkToShowDefaultBanner(true);
	Site.triggerGobalEvent("showSelectedBanner","panelLibList");
}

//刷新存储的横幅数据
function refreshBannerData(){
	if (initing) {
		return;
	}
	var libraryBanner = $("#selectedBannerContainer").find(".panelLibItem");
	Fai.top._bannerData.n = [];
	var edgeLeftBg = "",
		edgeRightBg = "",
		wideScreen = false;
	$.each(libraryBanner, function(){
		var path = "";
		var id = "";
		var width = "";
		var height = "";
		var t = 0;
		if($(this).attr("cus") == 1)
		{
			path = $(this).find("img").attr("sources");
			id = $(this).find("img").attr("id");
			width = $(this).attr("vwidth");
			height = $(this).attr("vheight");
			t = 1;//自定义
			edgeLeftBg = "";
			edgeRightBg = "";
		}else{
			path = $(this).attr("vpath");
			id = $(this).attr("vid");
			width = parseInt($(this).attr("vwidth"));
			height = parseInt($(this).attr("vheight"));
			edgeLeftBg = $(this).attr("edgeLeftBg") || "";
			edgeRightBg = $(this).attr("edgeRightBg") || "";
			if($.trim(edgeLeftBg).length > 0 || $.trim(edgeRightBg).length > 0){
				wideScreen = true;
			}
		}
		var linkType = $('#selectedBannerContainer .panelLibItem[vid=' + id + ']').data('LINK_TYPE');
		if (typeof linkType == 'undefined') {
			linkType = 0;
		}
		var linkUrl = "";
		if (linkType == 1 || linkType == 2 ){
			linkUrl= $('#selectedBannerContainer .panelLibItem[vid=' + id + ']').data('JURL');
		}
		if (typeof linkUrl == 'undefined') {
			linkUrl = '';
		}
		var oBanner = {
			'i':id, 
			'w':width, 
			'h':height, 
			't':t, 
			'p':path, 
			'e':linkType, 
			'u':$('#selectedBannerContainer .panelLibItem[vid=' + id + ']').data('JIDE'),
			'jType':$('#selectedBannerContainer .panelLibItem[vid=' + id + ']').data('JTYPE') || 0,
			'jName':$('#selectedBannerContainer .panelLibItem[vid=' + id + ']').data('JNAME') || '',
			'jUrl':linkUrl,
			'el':edgeLeftBg,
			'er':edgeRightBg
		};
		Fai.top._bannerData.n.push(oBanner);
	});
	Fai.top._bannerData.ws = wideScreen;
	Fai.top._bannerData.s = 4;
	bannerChange();
}

//
function bannerChange(option) {
	Fai.top._bannerData.h = false;
	var tmpItem = $("#selectedBannerContainer").find(".panelLibItem");
	var $banner = Fai.top.$("#banner");
	var isFlash = false;
	var flashHeight = -1;
	if(option){
		isFlash = option.isFlash;
		flashHeight = option.height;
	}
	if(isFlash){
		$banner.attr("normalheight", -2);
	}else{
		if(tmpItem.length < 1){
			$banner.attr("normalheight", -1);
		}else{
			var normalheight = parseInt(tmpItem.eq(0).attr("vheight"));
			for(var i = 1; i < tmpItem.length; i++){
				var tmpHeight = parseInt(tmpItem.eq(i).attr("vheight"));
				if(tmpHeight > normalheight){
					normalheight = tmpHeight;
				}
			}
			$banner.attr("normalheight", normalheight);
		}
	}
	var c = tmpItem.length -1;
	Site.refreshBanner(c);
	checkBannerLinkBtn();
	Fai.top._bannerChanged++;
	Site.styleChanged();
	Site.setRefreshInfo("siteBanner", true);
	
}

//控制"设置链接"按钮
function checkBannerLinkBtn(){
	if(Fai.top._bannerData.n && Fai.top._bannerData.n.length > 0){
		$(".J_bannerLinkSettingContent").show();
	}else{
		$(".J_bannerLinkSettingContent").hide();
	}
}




//生成横幅槽
function initSelectedBannerBox(num){
	var $container = $("#selectedBannerContainer");
	var tmpHtml = [];
	var boxId = 0;
	var boxContainerNum = 4;//一个槽可放置横幅的个数
	
	$container.empty();
	for(var tmpNum=num; tmpNum > 0; tmpNum -= boxContainerNum){
		boxId += 1;
		tmpHtml.push("<div id='selectedBannerBox"+ boxId +"' class='selectedBannerBox'>\n");
		for(var i=0; i < boxContainerNum; i++){
			tmpHtml.push("<div class='selectedBanner' status='-1' inside='0'></div>\n");
		}
		tmpHtml.push("</div>\n");
	}
	$container.append(tmpHtml.join(""));
	
	//sortable必须放在这里，每一次排序后，.selectedBannerBox都会被清除重新生成，绑定其上的sortable方法也会被清除
	$(".selectedBannerBox").sortable("destroy");
	$(".selectedBannerBox").sortable({
		items:".canSort",
		connectWith: ".selectedBannerBox",
		containment: "#selectedBannerContainer",
		helper: "clone",
		distance: 5,
		dropOnEmpty:false,
		placeholder:"ui-state-highlight",
		activate:function(event, ui){
			$(ui.item).show().children().hide();
			$(ui.item).addClass("ui-item-holder");
		},
		stop:function(event, ui){
			$(ui.item).children().show();
			$(ui.item).removeClass("ui-item-holder");
			refreshBannerData();
			initSelectedBannerBox(maxBannerNum);
			refreshSelectedBanner();
		}
	});
}

//根据最大横幅数初始化横幅槽
function refreshbannerPreviewtatus(){
	var num = parseInt( Fai.top._bannerData.c );
	if(num > 3){
		$("#selectedBannerBox2").show();
		$("#selectedBannerContainer").addClass("fixPadding");
		$("#panelLibList").addClass("panelLibList-fixWidth");
	}else{
		$("#selectedBannerBox2").hide();
		$("#selectedBannerContainer").removeClass("fixPadding");
		$("#panelLibList").removeClass("panelLibList-fixWidth");
	}
	var $selectedBanner = $("#selectedBannerContainer").find(".selectedBanner");
	$selectedBanner.removeClass("delete-box delete-hoverBox add-box add-hoverBox virtual-box virtual-hoverBox");
	$.each($selectedBanner, function(index, elem){
		if(index < num){
			$(elem).attr("status", 1).addClass("delete-box");
		}else if(index == num){
			$(elem).attr("status", 0).addClass("add-box");
		}else{
			$(elem).attr("status", -1).addClass("virtual-box");
		}
	});
	if(!initing){
		//$(".selectedBannerBox").sortable("refresh");
	}
}

//刷新横幅槽状态
function refreshBannerInside(){
	$.each($("#selectedBannerContainer").find(".selectedBanner"),function(index, elem){
		if($(elem).children().length > 0){
			$(elem).attr("inside", 1).addClass("canSort canSort-box");
		}else{
			$(elem).attr("inside", 0).removeClass("canSort canSort-box");
		}
	});
}

//重新填充横幅槽
function refreshSelectedBanner(){
	$("#selectedBannerContainer").find(".selectedBanner").children().remove();
	refreshbannerPreviewtatus();
	refreshBannerInside();
	var vid  = null;
	for(var i = 0; i< Fai.top._bannerData.n.length; i++){
		hasSelectedBanner = true;
		//刷新选中框内容
		$.each($("#selectedBannerContainer").find(".selectedBanner"), function(){
			var selected = $(this);
			if( selected.attr("status") == 1 && selected.attr("inside") == 0 ){
				if(Fai.top._bannerData.n[i].t == 0){ // 横幅库
					var banner = null;
					for (var j = 0; j < bannerList.length; ++j) {
						if (bannerList[j].vid == Fai.top._bannerData.n[i].i) {
							banner = bannerList[j];
							break;
						}
					}
					if (banner == null) {
						return true;
					}

					insertBannerCP({
						'bkey':banner.bkey,
						'vweight':banner.vweight,
						'vheight':banner.vheight,
						'vwidth':banner.vwidth,
						'vtrade':banner.vtrade,
						'vid':banner.vid,
						'vpath':banner.vpath,
						'preview':banner.preview,
						'vtype':banner.type,
						'edgeLeftBg':banner.edgeLeftBg,
						'edgeRightBg':banner.edgeRightBg,
						'selected':selected
					});
					vid = banner.vid;
				}else{
					var banner = null;
					for (var j = 0; j < Fai.top._bannerData.l.length; j++) {
						if (Fai.top._bannerData.l[j].i == Fai.top._bannerData.n[i].i) {
							banner = Fai.top._bannerData.l[j];
							break;
						}
					}
					if (banner == null) {
						return true;
					}
					insertCusBannerCP(banner.tp, banner.p, banner.i, banner.w, banner.h, selected);
					vid = banner.i;
				}
				initSelectedData(vid);
				return false;
			}
		});
	}
}

    
</script>

</head>
<body>
<div id="bannerPanel" class="bannerPanel">
	<table style="table-layout:fixed;" border="0" cellpadding="0" cellspacing="0" height="100%" width="100%">
		<tbody><tr>
			<td align="center">
                <div style="width:1000px; height:100%;">
                    <!-- 二级tab -->
                    <div class="panelLeft">
						<div class="panelTopBg"></div>
						<div class="panelBottomBg"></div>
                        <ul>
                            <li id="showSiteBanner" class="menu" onclick="showSiteBanner()">网站横幅</li>
                            <li id="showBannerEffects" class="menu menuCheck" onclick="showBannerEffects()">横幅特效</li>
							<li id="showRecentlyUsedBanner" class="menu" onclick="showRecentlyUsedBanner()">最近使用</li>
                        </ul>
                    </div>
                    <!-- content -->
                    <div class="panelRight">
                        <div style="display: none;" id="typePanelLib" class="typePanel">
                            <div style="display: none;" class="panelLibFilter" id="panelLibFilter">
                                <div id="flashHide">
									<span style="float: left;" class="picSettingOption">&nbsp;行业：</span>
                                    <div id="panelLibTrade" class="picSettingOption">
                                        <input value="房地产" id="dropdownInput" class="dropdownInput" onclick="dropdownIndustry()" readonly="readonly" style="float:left">
                                    </div>
                                    <div style="float: left;" class="picSettingOption">
                                        <span style="float:left;">&nbsp;宽高：</span>
                                        <div style="width: 102px; position: relative; height: 20px;" class="bannerChoice" id="panelLibWeight"><input value="1440x380" style="width: 99px;" readonly="readonly" aria-haspopup="true" aria-autocomplete="list" role="textbox" autocomplete="off" class="ui-autocomplete-input"><div class="autoCompleteButton" style="outline: medium none; position: absolute; left: 84px; top: 2px;" tabindex="-1">&nbsp;</div></div>
                                    </div>
									<div id="bannerTypeChoiceBox" style="float: left; padding: 0px 0px 0px 8px; display: none;">
										<span style="float:left;">类型：</span>
										<div style="width: 62px; position: relative; height: 20px;" class="bannerChoice" id="bannerTypeChoice"><input value="图片" style="width: 59px;" readonly="readonly" aria-haspopup="true" aria-autocomplete="list" role="textbox" autocomplete="off" class="ui-autocomplete-input"><div class="autoCompleteButton" style="outline: medium none; position: absolute; left: 44px; top: 2px;" tabindex="-1">&nbsp;</div></div>
									</div>
                                    <div style="display: none;" id="advancedFilter">
                                        <span style="float:left;">&nbsp;编号：</span>
                                        <input style=" outline:none; width:50px;" id="pictureSearch" class="searchInput" maxlength="6" type="text">
                                        <span id="clearSearch" class="clearSearch unfind"></span>
                                    </div>
                                    <div id="advancedFilterBtn" class="advFilRight picSettingOption" onclick="advancedFilterShow()" title="更多"></div>
                                    <div style="float: right; width: 180px;" class="picSettingOption">
                                        <a hidefocus="true" id="uploadButton" href="javascript:;" onclick="Site.logDog(100041, 6);">
                                            <div class="uploadButtonDiv"><span class="siteIco"></span><span style="float:left; height:20px; line-height:20px;">添加图片</span></div>
                                            <div class="clear"></div>
                                        </a>
										<a hidefocus="true" class="J_bannerLinkSettingContent bannerLinkBtn" href="javascript:;" onclick="Site.settingBannerLink();return false;">
                                            <div class="bannerLinkBtnDiv"><span class="siteIco"></span><span style="float:left; height:20px; line-height:20px;">设置链接</span></div>
                                            <div class="clear"></div>
                                        </a>
                                    </div>
                                 </div>
                            </div>
							<div style="display: none;" id="recentTypePanelLib" class="recentTypePanelTitle">以下是最近使用的横幅：</div>
							<div style="display: none;" id="selectedBannerContainer" class="selectedBannerContainer">
								<div id="selectedBannerBox1" class="selectedBannerBox ui-sortable">
									<div class="selectedBanner delete-box canSort canSort-box" status="1" inside="1">
										<div class="panelLibItem" vid="ABUIABACGAAg0c_jswUo3KigqQMwsQk4-AI" cus="1" vwidth="1201" vheight="380" style="width: 100px;height: 24px;margin:0;border:none; display: block; background-color: #eef1f6; cursor: move; ">
											<div style="position:absolute;width:100%;height:100%;background:url('${ctx_web}/image/site/transpace.png');"></div>
											<table style="width:100%;height:100%;" cellpadding="0" cellspacing="0"><tbody><tr><td align="center" valign="middle"><img id="ABUIABACGAAg0c_jswUo3KigqQMwsQk4-AI" src="${ctx_web}/image/template/bannerPreview/ABUIABACGAAg0c_jswUo3KigqQMwsQk4-AI.jpg" sources="${ctx_web}/image/template/banners/ABUIABACGAAg0c_jswUo3KigqQMwsQk4-AI.jpg" height="24" width="100"></td></tr></tbody></table>
											<a hidefocus="true" href="javascript:;" class="btn_16x16 editBtn4 bannderBtnEdit" title="编辑" onclick="editSelectedBanner('ABUIABACGAAg0c_jswUo3KigqQMwsQk4-AI', 1);return false;"></a>
											<a hidefocus="true" href="javascript:;" class="btn_16x16 rmHoverBtn2 bannderBtnDel" title="移除" vid="ABUIABACGAAg0c_jswUo3KigqQMwsQk4-AI"></a>
										</div>
									</div>
									<div class="selectedBanner delete-box" status="1" inside="0"></div>
									<div class="selectedBanner delete-box" status="1" inside="0"></div>
									<div class="selectedBanner add-box" status="0" inside="0"></div>
								</div>
								<div style="display: none;" id="selectedBannerBox2" class="selectedBannerBox ui-sortable">
									<div class="selectedBanner virtual-box" status="-1" inside="0"></div>
									<div class="selectedBanner virtual-box" status="-1" inside="0"></div>
									<div class="selectedBanner virtual-box" status="-1" inside="0"></div>
									<div class="selectedBanner virtual-box" status="-1" inside="0"></div>
								</div>
							</div>
							<div id="panelLibList" class="panelLibList panelLibListAutoWidth">
								<div class="panelLibItem bannerDown" id="cusABUIABACGAAg0c_jswUo3KigqQMwsQk4-AI" vid="ABUIABACGAAg0c_jswUo3KigqQMwsQk4-AI" cus="1" vwidth="1201" vheight="380" style="width: 100px; height: 30px; display: none;" title="自定义图片宽高：1201×380 像素">
									<table style="width:100%;height:100%;" cellpadding="0" cellspacing="0">
										<tbody>
											<tr><td align="center" valign="middle">
												<img id="ABUIABACGAAg0c_jswUo3KigqQMwsQk4-AI" src="${ctx_web}/image/template/bannerPreview/ABUIABACGAAg0c_jswUo3KigqQMwsQk4-AI.jpg" sources="${ctx_web}/image/template/banners/ABUIABACGAAg0c_jswUo3KigqQMwsQk4-AI.jpg" height="30" width="100">
												<div class="checked"></div>
											</td></tr>
										</tbody>
									</table>
									<div class="btn_16x16 rmHoverBtn bannderBtnDel" title="删除自定义横幅" onclick="delBanner('ABUIABACGAAg0c_jswUo3KigqQMwsQk4-AI');return false;"></div>
								</div>
							</div>
                    		<!-- Flash -->
                            <div style="display: none;" id="typePanelFlash" class="typePanelFlash">
                                <div style="clear:both; position:relative;">
                                    <div style="float:left;height:30px;line-height:30px;text-align:right;">Flash文件：</div>
                                    <div style="float:left;"><input id="uploadButton1" class="faiButton" value="添加文件" type="button"></div>
                                    <div id="uploadmsg2" class="uploadmsg"></div>
                                </div>
                                <div style="clear:both; text-align:left;">
                                    <div style="float:left;height:30px;line-height:30px;text-align:right;">Flash尺寸：</div>
                                    <input value="" id="flashId" type="hidden"><input value="" id="flashUrl" type="hidden">
                                    宽&nbsp;<input value="960" id="flashWidth" style="width:50px;" maxlength="4" onchange="onFlashWidthChange()" onkeypress="javascript:return Fai.isNumberKey(event);" type="text">&nbsp;像素&nbsp;&nbsp;&nbsp;
                                    高&nbsp;<input value="100" id="flashHeight" style="width:50px;" maxlength="4" onchange="onFlashHeightChange()" onkeypress="javascript:return Fai.isNumberKey(event);" type="text">&nbsp;像素
                                </div>
                            </div>
                            <!-- Flash end -->
                        </div>
                        <div id="bannerEffects" style="position: relative; display: block;">
                        	<iframe src="${ctx_web}/manage/bannerEffects.jsp" id="bannerEffectsFrame" class="bannerEffectsFrame" scrolling="no" frameborder="0"></iframe>
                        </div>
                    </div>
                </div>   
			</td>
		</tr>
	</tbody></table>

</div>

<ul style="z-index: 1; top: 0px; left: 0px; display: none;" aria-activedescendant="ui-active-menuitem" role="listbox" class="ui-autocomplete ui-menu ui-widget ui-widget-content ui-corner-all"></ul>
<ul style="z-index: 1; top: 0px; left: 0px; display: none;" aria-activedescendant="ui-active-menuitem" role="listbox" class="ui-autocomplete ui-menu ui-widget ui-widget-content ui-corner-all"></ul>
</body>
</html>