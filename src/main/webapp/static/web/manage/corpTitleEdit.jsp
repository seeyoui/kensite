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
	<link href="${ctx_web}/css/logoEdit.css" rel="stylesheet" type="text/css" />
	<link href="${ctx_web}/css/manage.css" rel="stylesheet" type="text/css" />
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
var fontfamily = [{"first":"SimSun","second":"宋体"},{"first":"PMingLiU","second":"新细明体"},{"first":"FangSong_GB2312","second":"仿宋_GB2312"},{"first":"微软雅黑","second":"微软雅黑"},{"first":"隶书","second":"隶书"},{"first":"幼圆","second":"幼圆"},{"first":"STKaiti","second":"华文楷体"},{"first":"方正舒体","second":"方正舒体"},{"first":"华文彩云","second":"华文彩云"},{"first":"华文行楷","second":"华文行楷"},{"first":"华文宋体","second":"华文宋体"},{"first":"楷体,楷体_GB2312, SimKai","second":"楷体"},{"first":"黑体, SimHei","second":"黑体"},{"first":"Arial","second":"Arial"},{"first":"Tahoma","second":"Tahoma"},{"first":"impact","second":"impact"},{"first":"Arial Serif","second":"Arial Serif"},{"first":"Georgia","second":"Georgia"},{"first":"Garamond","second":"Garamond"},{"first":"Times New Roman","second":"Times New Roman"},{"first":"andale mono","second":"andale mono"},{"first":"arial black,avant garde","second":"arial black"},{"first":"comic sans ms","second":"comic sans ms"}];
var titleMaxLen = 100;
var file_size_limit = 1;
var App_Site_Img = 21;
var imgMaxWidth = 2000;
var imgMaxHeight = 800;
var imgMode = 2;

var $primaryTitle = Fai.top.$("#primaryTitle"),
	$subTitle = Fai.top.$("#subTitle"),
	$logoImg = Fai.top.$("#logoImg"),
	$corpTitle = Fai.top.$("#corpTitle");

var popupID = <%=popupID%>;
$(function(){
	Fai.addPopupWindowBtn(popupID, {id:'ok', text:'确 定', extClass:'saveButton', click:save});
	Fai.addPopupWindowBtn(popupID, {id:'default', text:'恢复默认', click:resetDefault});
	
	/******************* 标题 *******************/
	var defaultColor = Fai.top._titleData.c;
	
	$("#corpTitle").focus();
	$("#corpTitle").val(Fai.top._titleData.x);
	$("#subCorpTitle").val(Fai.top._titleData.st.x);
	
	$('#tabs').tabs({selected:parseInt(2)});
	
	var fontSizeVaule = Fai.top._titleData.s;
	var fontBold = Fai.top._titleData.w;
	var fontFamilyValue = Fai.top._titleData.f;
	if ( fontSizeVaule == -1 ) {
		fontSizeVaule = 36;
	}
	if ( fontBold == -1 ) {
		fontBold = 0;
	}
	if ( fontFamilyValue == "" ) {
		fontFamilyValue = "微软雅黑"; 
	}
	$('#fontEditor').fontStyleEditor({
		id: 0,
		toolbars: [
			{name:'fontfamily', defaultValue:fontFamilyValue, refreshFn: fontFamilyChange}, 
			{name:'fontsize', defaultValue:fontSizeVaule, refreshFn: fontSizeChange}, 
			{name:'bold', defaultValue:fontBold, refreshFn:fontBoldChange}, 
			{name:'italic', defaultValue:top._titleData.i, refreshFn:fontItalicChange}, 
			{name:'underline',defaultValue:top._titleData.u, refreshFn:fontUnderlineChange}, 
			{name:'fontcolor', defaultValue:top._titleData.c, refreshFn:fontColorChange}
		],
		styleChangeFn:onStyleChange,
		fontfamily: fontfamily
	});
	
	var subFontFamilyValue =  Fai.top._titleData.st.f;
	var subFontSizeVaule = Fai.top._titleData.st.s;
	if( subFontSizeVaule == 0 ) {
		subFontSizeVaule = 36;
	}
	if( subFontFamilyValue == "" ) {
		subFontFamilyValue = "微软雅黑";
	}
	$('#subfontEditor').fontStyleEditor({
		id: 1,
		toolbars: [
			{name:'fontfamily', defaultValue:subFontFamilyValue, refreshFn: subFontFamilyChange}, 
			{name:'fontsize', defaultValue:subFontSizeVaule, refreshFn: subFontSizeChange}, 
			{name:'bold', defaultValue:Fai.top._titleData.st.w, refreshFn:subFontBoldChange}, 
			{name:'italic', defaultValue:Fai.top._titleData.st.i, refreshFn:subFontItalicChange}, 
			{name:'underline',defaultValue:Fai.top._titleData.st.u, refreshFn:subFontUnderlineChange}, 
			{name:'fontcolor', defaultValue:Fai.top._titleData.st.c, refreshFn:subFontColorChange}
		],
		styleChangeFn:subOnStyleChange,
		fontfamily: fontfamily
	});
	
	/******************* logo *******************/
	/* logo描述在logo.jsp.inc里被设置为企业名称（logo使用默认值，没有被修改过），需要同步到top._logoData.des */
	if($logoImg.attr("title") === Fai.top._companyName){
		Fai.top._logoData.des = Fai.top._companyName;
	}
	$logoImg.attr("title",Fai.decodeHtml(Fai.top._logoData.des));
	$('#logoDescription').val(Fai.decodeHtml(Fai.top._logoData.des));
	
	if(top.$("#logo").css("display")== "none"){
		$("#hide").attr("checked", true);
		$("#logoSettingPanel").hide();
		$("#logoUploadPanel").hide();
	}else{
		$("#show").click();
		//$("#show").attr("checked", true);
	}
	
	if(top._logoData.i){
		$("#uploadmsg").html('<a href="javascript:view(\'' + top._logoData.i + '\');">查看</a>');
	}
	
	//文件上传2.0
	var fileUpload2_settings = {title:"添加图片", maxSize:parseInt(file_size_limit), type:['jpg','jpeg','gif','png'], imgMode:imgMode, from:"logo"};//imgMaxWidth:imgMaxWidth, imgMaxHeight:imgMaxHeight,
	Site.fileUpload2("#fileUploadV2", fileUpload2_settings, callbackLogoUpload);
	

	/* 高级 */	
	initJumpMode();
	initLinkType();
	initLinkTypeChecked();
	initTitleorLogoFixTop();
	initTitlePositionFixTop();
	initLogoPositionFixTop();
});


/****************** 网站标题 start ******************/

/******************** 主标题 ************************/

/* 初始化链接跳转模式 */
function initJumpMode(){
	var jName = Fai.top._titleData.jm.jName;
	if( jName == null ) { //栏目、产品、文章已删除
		Fai.top._titleData.jm.jType = 0;
		Fai.top._titleData.jm.f = "";
		Fai.top._titleData.jm.y = 0;	
	} 
	
	var jumpType = Fai.top._titleData.jm.y;
	if ( jumpType === 1 || jumpType === 2 ) { //旧数据栏目跳转走自定义逻辑
		if( jumpType === 1 ){
			Fai.top._titleData.jm.y = 2;
		}
		$('#custom-links').prop('checked', true);
		$('#hrefType').show();
		$('#linkType').show();
	}else {
		$('#not-goto').prop('checked', true);
		$('#hrefType').hide();
	}
	
	var jType = Fai.top._titleData.jm.jType;
	
	//初始化链接控件
	var jumpOptions = {
		inputId : "linkTxt",
		moduleType : 8,
		jumpType : jType || 0,
		jumpIde : Fai.top._titleData.jm.f || "",
		jumpName: jName
	}
	Site.jumpControl(jumpOptions);	
};
/* 初始化链接的打开方式 */
function initLinkType(){	
	$("#typeId").change(function(){		
		Fai.top._titleChanged++;
		Fai.top._titleData.jm.ot = parseInt( $(this).val() );
		Site.styleChanged();
	});
	
	if(Fai.top._titleData.jm.ot === 0){
		$("#linkCurWind").prop("selected", true);	
	}else if(Fai.top._titleData.jm.ot === 1){
		$("#linkNewWind").prop("selected", true);
	}
};

function corpTitleChange(e){
	var eObj = $(e);
	var substrVal = eObj.val().substr(0,titleMaxLen);
	if(eObj.val().length > titleMaxLen){
		Fai.ing("标题长度不能多于"+ titleMaxLen +"个字符。",true);
		eObj.val(substrVal);
	}
	$primaryTitle.html(Fai.encodeHtml(substrVal));
	Fai.top._titleData.x = substrVal;
	if(Fai.top._useTemplateTitle) {
		Fai.top._templateTitleData.x = substrVal;
	}
	Fai.top._titleChanged++;
	Site.styleChanged();
};

/* 字体大小 */
function fontSizeChange(sizeValue){
	$primaryTitle.css({
		"font-size" : sizeValue+"px"
	});
	Fai.top._titleData.s = parseInt(sizeValue);
	if(Fai.top._useTemplateTitle) {
		Fai.top._templateTitleData.s = parseInt(sizeValue);
	}
};
/* 字体样式 */
function fontFamilyChange(familyValue){
	$primaryTitle.css("font-family", familyValue);
	Fai.top._titleData.f = familyValue;
	if(Fai.top._useTemplateTitle){
		Fai.top._templateTitleData.f = familyValue;
	}
};
/* 字体加粗 */
function fontBoldChange(isBold){
	if(isBold)
	{
		$primaryTitle.css("font-weight", "bolder");
		Fai.top._titleData.w = 1;
		if(Fai.top._useTemplateTitle) {
			Fai.top._templateTitleData.w = 1;
		}
	}else{
		$primaryTitle.css("font-weight", "normal");
		Fai.top._titleData.w = 0;
		if(Fai.top._useTemplateTitle) {
			Fai.top._templateTitleData.w = 0;
		}
	}
};
/* 斜体 */
function fontItalicChange(isItalic){
	if(isItalic)
	{
		$primaryTitle.css("font-style", "italic");
		Fai.top._titleData.i = 1;
		if(Fai.top._useTemplateTitle) {
			Fai.top._templateTitleData.i = 1;
		}
	}else{
		$primaryTitle.css("font-style", "normal");
		Fai.top._titleData.i = 0;
		if(Fai.top._useTemplateTitle) {
			Fai.top._templateTitleData.i = 0;
		}
	}
};
/* 下划线 */
function fontUnderlineChange(isUnderline){
	if(isUnderline)
	{
		$primaryTitle.css("text-decoration", "underline");
		Fai.top._titleData.u = 1;
		if(Fai.top._useTemplateTitle) {
			Fai.top._templateTitleData.u = 1;
		}
	}else{
		$primaryTitle.css("text-decoration", "none");
		Fai.top._titleData.u = 0;
		if(Fai.top._useTemplateTitle) {
			Fai.top._templateTitleData.u = 0;
		}
	}
};
/* 字体颜色 */
function fontColorChange(color) {
	Fai.top.$('#primaryTitle').css("color", color);
	Fai.top._titleData.c = color;
	if (Fai.top._useTemplateTitle) {
		Fai.top._templateTitleData.c = color;
	}
	onStyleChange();
};

function onStyleChange() {
	Fai.top._titleData.fp = true;
	Fai.top._titleChanged ++;
	Site.styleChanged();
};
function removeFontColorCss() {
	Fai.top.$('#primaryTitle').css("color", '');
};

/******************** 副标题 ************************/
function corpSubTitleChange(e){
	var eObj = $(e);
	var substrVal = eObj.val().substr(0,titleMaxLen);
	if(eObj.val().length > titleMaxLen){
		Fai.ing("副标题长度不能多于"+ titleMaxLen +"个字符。",true);
		eObj.val(substrVal);
	}
	Fai.top.$("#subTitle").html(Fai.encodeHtml(substrVal));
	Fai.top._titleData.st.x = substrVal;
	if(Fai.top._useTemplateTitle) {
		Fai.top._templateTitleData.st.x = substrVal;
	}
	Fai.top._titleChanged ++;
	Site.styleChanged();
};

/* 字体大小 */
function subFontSizeChange(sizeValue){
	$subTitle.css({
		"font-size" : sizeValue+"px"
	});

	Fai.top._titleData.st.s = parseInt(sizeValue);
	if(Fai.top._useTemplateTitle) {
		Fai.top._templateTitleData.st.s = parseInt(sizeValue);
	}
};
/* 字体样式 */
function subFontFamilyChange(familyValue){
	if(familyValue == '') {
		$subTitle.css("font-family", 'inherit');
	} else {
		$subTitle.css("font-family", familyValue);	
	}
	Fai.top._titleData.st.f = familyValue;
	if(Fai.top._useTemplateTitle){
		Fai.top._templateTitleData.st.f = familyValue;
	}
};
/* 字体加粗 */
function subFontBoldChange(isBold){
	if(isBold)
	{
		$subTitle.css("font-weight", "bolder");
		Fai.top._titleData.st.w = 1;
		if(Fai.top._useTemplateTitle) {
			Fai.top._templateTitleData.st.w = 1;
		}
	}else{
		$subTitle.css("font-weight", "normal");
		Fai.top._titleData.st.w = 0;
		if(Fai.top._useTemplateTitle) {
			Fai.top._templateTitleData.st.w = 0;
		}
	}
};
/* 斜体 */
function subFontItalicChange(isItalic){
	if(isItalic)
	{
		$subTitle.css("font-style", "italic");
		Fai.top._titleData.st.i = 1;
		if(Fai.top._useTemplateTitle) {
			Fai.top._templateTitleData.st.i = 1;
		}
	}else{
		$subTitle.css("font-style", "normal");
		Fai.top._titleData.st.i = 0;
		if(Fai.top._useTemplateTitle) {
			Fai.top._templateTitleData.st.i = 0;
		}
	}
};
/* 下划线 */
function subFontUnderlineChange(isUnderline){
	if(isUnderline)
	{
		$subTitle.css("text-decoration", "underline");
		Fai.top._titleData.st.u = 1;
		if(Fai.top._useTemplateTitle) {
			Fai.top._templateTitleData.st.u = 1;
		}
	}else{
		$subTitle.css("text-decoration", "none");
		Fai.top._titleData.st.u = 0;
		if(Fai.top._useTemplateTitle) {
			Fai.top._templateTitleData.st.u = 0;
		}
	}
};
/* 字体颜色 */
function subFontColorChange(color) {
	Fai.top.$('#subTitle').css("color", color);
	Fai.top._titleData.st.c = color;
	if (Fai.top._useTemplateTitle) {
		Fai.top._templateTitleData.st.c = color;
	}
	subOnStyleChange();
};

function subOnStyleChange() {
	Fai.top._titleData.st.y = 1;
	Fai.top._titleChanged ++;
	Site.styleChanged();
};
function rmSubFontColorCss() {
	Fai.top.$('#subTitle').css("color", '');
};

/****************** 网站标题 end ******************/

/****************** 网站Logo start ******************/

/* 初始化位置 */
function initPos(){
	var web = Fai.top.$('#web');
	var tmpleft = Fai.top.$("#logo").offset().left;
	if (tmpleft != parseInt($("#leftInput").val())) {
		$("#leftInput").val(parseInt(tmpleft));
	}

	var tmptop = Fai.top.$("#logo").offset().top - Fai.top.$('#webTop').offset().top;
	if (tmptop != parseInt($("#topInput").val())) {
		$("#topInput").val(parseInt(tmptop));
	}
};
/* 初始化图片 */
function initImg() {
	var imgDiv = $("#imgDiv");
	if (imgDiv.find("img").length == 0) {
		var size = Fai.Img.calcSize(top.$("#logoImg").width(), top.$("#logoImg").height(), 350, 100, Fai.Img.MODE_SCALE_DEFLATE_FILL);
		var imgHtml = "<img src='"+ top.$("#logoImg").attr("src") +"' height='"+ size.height +"' width='"+ size.width +"' >";
		$(imgHtml).appendTo($(imgDiv));
	}
};
/* 初始化图片大小 */
function initImgSize(){
	var imgWidth = top.$("#logoImg").css("width");
	if (imgWidth != parseInt($("#widthInput").val())) {
		$("#widthInput").val(parseInt(imgWidth));
	}
	var imgHeight = top.$("#logoImg").css("height");
	if (imgHeight != parseInt($("#heightInput").val())) {
		$("#heightInput").val(parseInt(imgHeight));
	}
};
/* 初始化logo链接跳转 */
function initLinkTypeChecked(){
	/* _logoData.lt 0不跳转 , 1自定义, 2栏目(废除) */
	var customLinkAddress = $("#customLinkAddress");
	var linksOpenType = $("#linksOpenType");
	var jName = Fai.top._logoData.jName;
	if( !Fai.top._logoData.lt || jName == null ){
		$('#customLinksPanel').hide();
		$('#nolinks').attr('checked', true);
		customLinkAddress.hide();
		linksOpenType.hide();
	}else{
		linkTypeChecked(Fai.top._logoData.lt, true);
		if( top._logoData.ot ){
			$('#linksOpenTypeId').val(top._logoData.ot);
		}
		//自定义、 栏目（旧数据）
		if( Fai.top._logoData.lt == 1 || Fai.top._logoData.lt == 2 ){
			Fai.top._logoData.lt = 1; //把旧数据栏目 转 自定义
			$('#customlinks').attr('checked', true);
			customLinkAddress.show();
			linksOpenType.show();
		} else { //不跳转
			$('#nolinks').attr('checked', true);
			customLinkAddress.hide();
			linksOpenType.hide();
		}
	}
	//初始化链接控件
	var jumpOptions = {
		inputId : "customlinksaddr",
		moduleType : 6,
		jumpCusId : "logoJumpCtrl",
		jumpType : Fai.top._logoData.jType || 0,
		jumpIde : Fai.top._logoData.addr || ""
	}
	if( jName != null ){
		jumpOptions.jumpName = jName;
	}
	Site.jumpControl(jumpOptions);	
};

/* logo隐藏或显示 */
function logoDisplayChange(e){
	Fai.top._logoChanged = Fai.top._logoChanged + 2;
	if($(e).val() == 1){
		//display logo
		Fai.top.$("#logo").css("display", "block");
		Fai.top._logoData.h = false;
		if(Fai.top._useTemplateLogo) {
			Fai.top._templateLogoData.h = false;
		}
		$("#logoSettingPanel").show();
		$("#logoUploadPanel").show();

		initPos();
		initImg();
		initImgSize();
	}else{
		Fai.top.$("#logo").css("display", "none");
		Fai.top._logoData.h = true;
		if(Fai.top._useTemplateLogo) {
			Fai.top._templateLogoData.h = true;
		}
		$("#logoSettingPanel").hide();
		$("#logoUploadPanel").hide();
	}
	Site.styleChanged();
};

/* 文件上传2.0返回事件 */
function callbackLogoUpload(back){
	if(back){
		var resultBack = $.parseJSON(back);
		var fileId = resultBack.data[0].fileId;
		var filePath = resultBack.data[0].filePath;
		var fileWidth = resultBack.data[0].fileWidth;
		var fileHeight = resultBack.data[0].fileHeight;
		
		Fai.top._logoChanged++;
		Fai.top.$("#logo").css("display", "block");
		Fai.top.$("#logo").css("width", fileWidth + "px");
		Fai.top.$("#logo").css("height", fileHeight + "px");
		$logoImg.attr("src", filePath); 
		$logoImg.css("width", fileWidth + "px");
		$logoImg.css("height", fileHeight + "px");
		Fai.top._logoData.g = fileHeight;
		Fai.top._logoData.w = fileWidth;
		Fai.top._logoData.i = fileId;
		Fai.top._logoData.p = filePath;
		if(Fai.top._useTemplateLogo) {
			Fai.top._templateLogoData.g = fileHeight;
			Fai.top._templateLogoData.w = fileWidth;
			Fai.top._templateLogoData.i = fileId;
			Fai.top._templateLogoData.p = filePath;
		}
		$('#hiddenLogo0').attr('checked', true);
		$('#hiddenLogo1').attr('checked', false);
		$("#imgDiv").children().remove();
		var size = Fai.Img.calcSize(fileWidth, fileHeight, 350, 100, Fai.Img.MODE_SCALE_DEFLATE_FILL);
		var imgHtml = "<img src='"+ filePath +"' height='"+ size.height +"' width='"+ size.width +"' >";
		$(imgHtml).appendTo($("#imgDiv"));
		Site.styleChanged();
		$("#uploadmsg").html('<a href="javascript:view(\'' + fileId + '\');">查看</a>');
		
		//初始
		initPos();
		initImgSize();
	}
};
/* 点击预览 */
function view(fileId){
	var url = "../view.jsp?fileID="+fileId; 
	window.open(url);
};

/****************** 网站Logo end ******************/

/******************** 高级设置 start ************************/
/* 标题 */
function jumpTypeChecked(type){
	if( type === 2 ){ //自定义
		$('#hrefType').show();
		$('#linkType').show();
	} else { //不跳转;
		$('#hrefType').hide();
		$('#linkType').hide();
	}
	Fai.top._titleData.jm.y = type;
	Fai.top._titleChanged++;
	Site.styleChanged();
};
function initTitlePositionFixTop(){
	if(top._titlePositionFixTop){
		$('#keepTitleFixTop')[0].click();
	};
};
function initTitleorLogoFixTop(){
	if(top._titlePositionFixTop){
		Fai.top.$("#keepTitleFixTop").attr("checked", true);
	};
	if(top._logoPositionFixTop){
		Fai.top.$("#keepLogoFixTop").attr("checked", true);
	};
};
function keepTitleFixTop(){
	var title = Fai.top.$("#corpTitle");
	if($('#keepTitleFixTop').prop('checked') ){
		Fai.top.Site.onTitlePositionFixTop();
		top._titlePositionFixTop = true;
	} else {
		Fai.top.$("#g_main").off("scroll.corpTitle");
		Fai.top.$(window).off("resize.corpTitle");
		title.removeClass("titlefixtop");
		top._titlePositionFixTop = false;
	};
	Fai.top._titleChanged++;
	Site.styleChanged();
};
/* logo */
function initLogoPositionFixTop(){
	if(top._logoPositionFixTop){
		$('#keepLogoFixTop')[0].click();
	}
};

function keepLogoFixTop(){
	var logo = Fai.top.$("#logo");
	if($('#keepLogoFixTop').prop('checked') ){
		Fai.top.Site.onLogoPositionFixTop();
		top._logoPositionFixTop = true;
	} else {
		Fai.top.$("#g_main").off("scroll.logo");
		Fai.top.$(window).off("resize.logo");
		logo.removeClass("logofixtop");
		top._logoPositionFixTop = false;
	}
	Site.styleChanged();
};

function onLeftChange() {
	var posLeft = $("#leftInput").val();
	if (posLeft == '') {
		return;
	}
	posLeft = parseInt(posLeft);
	if (posLeft < 0 || posLeft >= 2000) {
		Fai.ing("请输入大于0小于2000的数值", true);
		return;
	}
	var tmpPosLeft = posLeft - top.$('#webTop').offset().left;
	var topLogo = Fai.top.$("#logo");
	topLogo.css("left",tmpPosLeft);
	Site.styleChanged();
	Fai.top._logoChanged ++;
	Fai.top._logoData.t = parseInt(topLogo.position().top);
	Fai.top._logoData.l = parseInt(topLogo.position().left);
	if(Fai.top._useTemplateLogo) {
		Fai.top._templateLogoData.t = parseInt(topLogo.position().top);
		Fai.top._templateLogoData.l = parseInt(topLogo.position().left);
	}
};

function onTopChange() {
	var posTop = $("#topInput").val();
	if (posTop == '') {
		return;
	}
	posTop = parseInt(posTop);
	if (posTop < 0 || posTop >= 2000) {
		Fai.ing("请输入大于0小于2000的数值", true);
		return;
	}
	var topLogo = Fai.top.$("#logo");
	var tmpPosTop = posTop - Fai.top.$('#webTop').offset().top;
	topLogo.css("top",posTop);
	Site.styleChanged();
	Fai.top._logoChanged++;
	Fai.top._logoData.t = parseInt(topLogo.position().top);
	Fai.top._logoData.l = parseInt(topLogo.position().left);
	if(Fai.top._useTemplateLogo) {
		Fai.top._templateLogoData.t = parseInt(topLogo.position().top);
		Fai.top._templateLogoData.l = parseInt(topLogo.position().left);
	}
};

function onWidthChange(){
	var widthInput = $("#widthInput").val();
	if (widthInput == '') {
		return;
	}
	widthInput = parseInt(widthInput);
	if (widthInput < 0 || widthInput > imgMaxWidth) {
		Fai.ing("请输入大于0小于等于" + imgMaxWidth +"的数值", true);
		return;
	}
	Fai.top.$("#logo").css("width",widthInput);
	$logoImg.css("width",widthInput);
	Site.styleChanged();
	Fai.top._logoChanged ++;
	Fai.top._logoData.w = parseInt($logoImg.width());
	Fai.top._logoData.g = parseInt($logoImg.height());
	if(Fai.top._useTemplateLogo) {
		Fai.top._templateLogoData.w = parseInt($logoImg.width());
		Fai.top._templateLogoData.g = parseInt($logoImg.height());
	}
	returnChangImg();
};

function onHeightChange(){
	var heightInput = $("#heightInput").val();
	if (heightInput == '') {
		return;
	}
	heightInput = parseInt(heightInput);
	if (heightInput < 0 || heightInput > imgMaxHeight) {
		Fai.ing("请输入大于0小于等于" + imgMaxHeight +"的数值", true);
		return;
	}
	Fai.top.$("#logo").css("height",heightInput);
	$logoImg.css("height",heightInput);
	Site.styleChanged();
	Fai.top._logoChanged++;
	Fai.top._logoData.w = parseInt($logoImg.width());
	Fai.top._logoData.g = parseInt($logoImg.height());
	if(Fai.top._useTemplateLogo) {
		Fai.top._templateLogoData.w = parseInt(top.$("#logoImg").width());
		Fai.top._templateLogoData.g = parseInt(top.$("#logoImg").height());
	}
	returnChangImg();
};

function returnChangImg(){
	$("#imgDiv").html('');
	var size = Fai.Img.calcSize(top.$("#logoImg").width(), top.$("#logoImg").height(), 350, 100, Fai.Img.MODE_SCALE_DEFLATE_FILL);
	var imgHtml = "<img src='"+ top.$("#logoImg").attr("src") +"' height='"+ size.height +"' width='"+ size.width + "' >";
	$(imgHtml).appendTo($("#imgDiv"));
};

function onLinkOpenType(){
	var openType = $('#linksOpenTypeId').val();
	Fai.top._logoData.ot = parseInt(openType);
	Fai.top._logoChanged++;
	if(Fai.top._useTemplateLogo) {
		Fai.top._templateLogoData.ot = parseInt(openType);
	}
	Site.styleChanged();
	
	//即时更新top link
	var target = "_self",
	 	topLogoLink = Fai.top.$('#logoLink');
	if( openType == 2 ) {
		target = "_blank";
	}
	topLogoLink.attr('target', target);
};

function linkTypeChecked(type, init){
	var logoLink = Fai.top.$('#logoLink');
	if( init ){
		return;
	}
	if( type == 0 ){
		$('#customLinksPanel').hide();
		logoLink.removeAttr('href');
		logoLink.attr('link',"javascript:;");
		logoLink.removeAttr('target');
		logoLink.attr('onclick', "return false;");
	}else if( type == 1 ){
		$('#customLinksPanel').show();
		$('#customLinkAddress').show();
		$('#linksOpenType').show();
		if( Fai.top._logoData.jName != null ){
			$('#customlinksaddr').val(Fai.top._logoData.jName);
		}
		var linkOpenTypeId = $('#linksOpenTypeId').val(),
		topLogoLink = Fai.top.$('#logoLink'),
		target = "_self";
		if( linkOpenTypeId == 2 ) {
			target = "_blank";
		}
		topLogoLink.attr('href', Fai.top._logoData.jUrl);
		topLogoLink.attr('link', Fai.top._logoData.jUrl);
		topLogoLink.attr('target', target);
		topLogoLink.removeAttr("onclick");
	}
	Fai.top._logoData.lt = parseInt(type);
	Fai.top._logoChanged++;
	if(Fai.top._useTemplateLogo) {
		Fai.top._templateLogoData.lt = parseInt(type);
	}
	Site.styleChanged();
};

/******************** 高级设置 end ************************/

function save() {
	/* 标题 */
	if( $.trim( $("#corpTitle").val() ).length <= 0 ){
		Fai.ing( "网站主标题不能为空" );
		$("#tabs").tabs({selected:0});
		$("#corpTitle").focus();
		return;
	}
	
	if( $('#custom-links').prop('checked') ){
		var jumpCtrl = $('#jumpCtrl');
		var jType = parseInt( jumpCtrl.attr('_ltype') );
		if( jType === 0 || jType === 2 || jType === 103 ){
			var linkTxt = $.trim($('#linkTxt').val());
			if( linkTxt == '' ) {
				Fai.ing( "标题链接地址不能为空。", true);
				$('#tabs').tabs({selected:3});
				$('#linkTxt').focus();
				return;
			}	
		}
		//var corpTitle = Fai.top.$('#corpTitle');
		var jUrl = jumpCtrl.attr('_lurl');
		if( jUrl == null ){
			jUrl = Fai.top._titleData.jm.jUrl;
		}
		Fai.top.$('#corpTitle').attr('_href', jUrl);
		Fai.top._titleData.jm.f = jumpCtrl.attr('_lide');
		Fai.top._titleData.jm.jType = jType;
		Fai.top._titleData.jm.jUrl = jUrl;
		if( jType === 2 || jType === 103 ){
			Fai.top._titleData.jm.jName = jUrl;
		} else {
			Fai.top._titleData.jm.jName = jumpCtrl.attr('_lname') || Fai.top._titleData.jm.jName;
		}
		Fai.top._titleChanged++;
		Site.styleChanged();
	} else {
		Fai.top.$('#corpTitle').removeAttr('_href');		
	}

	/* logo */
	var jUrl = $('#logoJumpCtrl').attr('_lurl');
	if( jUrl != null ){
		var linkOpenTypeId = $('#linksOpenTypeId').val(),
			topLogoLink = Fai.top.$('#logoLink'),
			target = "_self";
		if( linkOpenTypeId == 2 ) {
			target = "_blank";
		}
		topLogoLink.attr('href', jUrl);
		topLogoLink.attr('link', jUrl);
		topLogoLink.attr('target', target);
			
		var jIde = $('#logoJumpCtrl').attr('_lide');
		var jName = $('#logoJumpCtrl').attr('_lname');
		var jType = $('#logoJumpCtrl').attr('_ltype');
		var jUrl = $('#logoJumpCtrl').attr('_lurl');
		if( jIde != null ) {
			Fai.top._logoData.jType = jType;
			Fai.top._logoData.addr = jIde;
			Fai.top._logoData.jName = jName;
			Fai.top._logoData.jUrl = jUrl;
			if( jType == 1 || jType == 103 ) { 
				Fai.top._logoData.jName = jUrl;
			}
			if(Fai.top._useTemplateLogo) {
				Fai.top._templateLogoData.jType = jType;
				Fai.top._templateLogoData.addr = jIde;
				Fai.top._templateLogoData.jName = jName;
				Fai.top._templateLogoData.jUrl = jName;
				if( jType == 1 || jType == 103 ) {
					Fai.top._templateLogoData.jName = jUrl;
				}
			}
		}
	}

	var src = $.trim($("#logoDescription").val());
	var encodedSrc = Fai.encodeHtml( src );
	$logoImg.attr({"title":src,"alt":src});
	Fai.top._logoChanged ++;
	Fai.top._logoData.des = encodedSrc;
	Fai.top._logoData.desd = true;
	if(Fai.top._useTemplateLogo) {
		Fai.top._templateLogoData.des = encodedSrc;
		Fai.top._templateLogoData.desd = true;
	}

	Site.styleChanged();
	Fai.closePopupWindow(popupID);
	Site.setRefreshInfo("siteSetting", true);
};

//恢复默认值
function resetDefault() {
	
	$('#fontEditor').fontStyleEditor({
		id: 0,
		toolbars: [
			{name:'fontfamily', defaultValue:'', refreshFn: fontFamilyChange}, 
			{name:'fontsize', defaultValue:36, refreshFn: fontSizeChange}, 
			{name:'bold', defaultValue:0, refreshFn:fontBoldChange}, 
			{name:'italic', defaultValue:0, refreshFn:fontItalicChange}, 
			{name:'underline',defaultValue:0, refreshFn:fontUnderlineChange}, 
			{name:'fontcolor', defaultValue:'', refreshFn:fontColorChange, removeCssFn:removeFontColorCss}
		],
		styleChangeFn: onStyleChange,
		fontfamily: fontfamily
	});
	$('#subfontEditor').fontStyleEditor({
		id: 1,
		toolbars: [
			{name:'fontfamily', defaultValue:'', refreshFn: subFontFamilyChange}, 
			{name:'fontsize', defaultValue:36, refreshFn: subFontSizeChange}, 
			{name:'bold', defaultValue:0, refreshFn:subFontBoldChange}, 
			{name:'italic', defaultValue:0, refreshFn:subFontItalicChange}, 
			{name:'underline',defaultValue:0, refreshFn:subFontUnderlineChange}, 
			{name:'fontcolor', defaultValue:'', refreshFn:subFontColorChange, removeCssFn:rmSubFontColorCss}
		],
		styleChangeFn: subOnStyleChange,
		fontfamily: fontfamily
	});
	resetTitleCss();
	Fai.top.$('#corpTitle').removeCss(["top", "left"]);
	Fai.top._titleData.fp = false;
	Fai.top._titleData.l = -1;
	Fai.top._titleData.t = -1;
	Fai.top._titleData.st.y = 0;
	
	Fai.top._titleChanged ++;
	Site.styleChanged();
	$('#tabs').tabs({selected:0});
};

//初次打开编辑模块，如果副标题有值，但没打开副标题情况下(因为页面还没有元素)
function resetTitleCss() {
	var subTitleData = Fai.top._titleData.st;
	
	$subTitle.css({
		'font-size':'36px', //这里如果使用inherit, ie6恢复不了
		'font-style':'normal',
		'font-family':'inherit',
		'font-weight':'normal',
		'text-decoration':'none'
	});
	
	subTitleData.s = 0;
	subTitleData.w = 0;
	subTitleData.i = 0;
	subTitleData.u = 0;
	subTitleData.f = '';
};

</script>
</head>
<body class="popupTabBody">
	<div class="ui-tabs ui-widget ui-widget-content ui-corner-all"
		id="tabs">
		<!--tabs titles-->
		<ul
			class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all">
			<li
				class="ui-state-default ui-corner-top ui-tabs-selected ui-state-active"><a
				href="#primeTitleSetting">主标题</a></li>
			<li class="ui-state-default ui-corner-top"><a
				href="#subTitleSetting">副标题</a></li>
			<li class="ui-state-default ui-corner-top"><a
				href="#logoSetting">LOGO</a></li>
			<li class="ui-state-default ui-corner-top"><a href="#adSetting">高级</a></li>
		</ul>

		<!-- primeTitleSetting -->
		<div id="primeTitleSetting"
			class="settingPanel ui-tabs-panel ui-widget-content ui-corner-bottom">
			<div id="fontEditor">
				<div id="f_editor0" class="f_editor">
					<div id="f_family_select0" class="f_family_select">
						<div title="微软雅黑" class="f_family_body">微软雅黑</div>
						<div class="f_family_button"></div>
					</div>
					<div id="f_size_select0" class="f_size_select">
						<div class="f_size_body">36px</div>
						<div class="f_size_button"></div>
					</div>
					<div id="f_b_bold0" class="f_button f_b_bold "></div>
					<div id="f_b_italic0" class="f_button f_b_italic "></div>
					<div id="f_b_underline0" class="f_button f_b_underline "></div>
					<div id="f_color0" class="f_button f_b_color">
						<div id="f_b_color0" class="f_color_edit"></div>
					</div>
				</div>
			</div>
			<div>
				<textarea id="corpTitle" class="corpTitle" maxlength="100"
					onkeyup="corpTitleChange(this);" onchange="corpTitleChange(this);"></textarea>
			</div>
		</div>

		<!-- subTitleSetting -->
		<div id="subTitleSetting"
			class="settingPanel ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide">
			<div id="subfontEditor">
				<div id="f_editor1" class="f_editor">
					<div id="f_family_select1" class="f_family_select">
						<div title="微软雅黑" class="f_family_body">微软雅黑</div>
						<div class="f_family_button"></div>
					</div>
					<div id="f_size_select1" class="f_size_select">
						<div class="f_size_body">36px</div>
						<div class="f_size_button"></div>
					</div>
					<div id="f_b_bold1" class="f_button f_b_bold "></div>
					<div id="f_b_italic1" class="f_button f_b_italic "></div>
					<div id="f_b_underline1" class="f_button f_b_underline "></div>
					<div id="f_color1" class="f_button f_b_color">
						<div id="f_b_color1" class="f_color_edit"></div>
					</div>
				</div>
			</div>
			<div>
				<textarea id="subCorpTitle" class="corpTitle" maxlength="100"
					onkeyup="corpSubTitleChange(this)"
					onchange="corpSubTitleChange(this)"></textarea>
			</div>
		</div>

		<!-- basic setting -->
		<div id="logoSetting"
			class="settingPanel setLogoPanel ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide">
			<div class="set-line">
				<div class="set-title">显示LOGO：</div>
				<div class="set-ctrl">
					<input checked="checked" id="show" name="displayLogo" value="1" onclick="logoDisplayChange(this);" type="radio"/>
					<label for="show">是</label>
					<input id="hide" name="displayLogo" value="0" onclick="logoDisplayChange(this);" type="radio"/>
					<label for="hide">否</label>
				</div>
			</div>
			<div id="logoUploadPanel">
				<div class="set-line">
					<div class="set-title">LOGO：</div>
					<div class="set-ctrl">
						<div class="upload">
							<input id="fileUploadV2" class="faiButton" value="添加图片" type="button"/>
						</div>
						<div id="uploadmsg" class="uploadmsg">
							<a href="javascript:view('ABUIABAEGAAg6ua7rgUoyMTtRDC7ATgy');">查看</a>
						</div>
					</div>
				</div>
				<div class="set-line">
					<div class="set-title">&nbsp;</div>
					<div class="set-ctrl">
						<div id="imgDiv" class="logoImg">
							<!-- <img id="logoImg" src="" height="50" width="187"/> -->
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- adSetting -->
		<div id="adSetting"
			class="settingPanel setAdPanel ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide">
			<div id="titleSettingPanel">
				<div class="title-bar">网站标题</div>
				<div class="set-line">
					<div class="set-title">跳转方式：</div>
					<div class="set-ctrl">
						<input id="not-goto" name="jumpType" onclick="jumpTypeChecked(0)" checked="checked" type="radio"/>
						<label for="not-goto">不跳转</label>
					</div>
					<div class="set-ctrl">
						<input id="custom-links" name="jumpType" onclick="jumpTypeChecked(2)" type="radio"/>
							<label for="custom-links">自定义链接</label>
					</div>
				</div>
				<div class="set-line" id="hrefType" style="display: none;">
					<div class="set-title">链接地址：</div>
					<div class="set-ctrl">
						<input id="linkTxt" maxlength="255" style="float: left;"/>
						<div id="jumpCtrl" class="jumpCtrl" _ltype="0" _lide=""/>设置链接</div>
					</div>
				</div>
				<div class="set-line" id="linkType" style="display: none;">
					<div class="set-title">打开方式：</div>
					<div class="set-ctrl">
						<select id="typeId" style="max-width: 160px;">
							<option value="1" id="linkNewWind">新窗口</option>
							<option value="0" id="linkCurWind" selected="selected">当前窗口</option>
						</select>
					</div>
				</div>
				<div class="set-line">
					<div class="set-title">网站标题：</div>
					<div class="set-ctrl">
						<input id="keepTitleFixTop" name="keepTitleFixTop" onclick="keepTitleFixTop()" type="checkbox"/>
							<label id="keepTitleFixTopLabel" for="keepTitleFixTop">固定在顶部</label>
					</div>
				</div>
			</div>

			<div id="logoSettingPanel">
				<div class="title-bar noFirst">网站Logo</div>
				<div id="logoSizePanel" class="set-line">
					<div class="set-title">图片尺寸：</div>
					<div class="set-ctrl">
						<span id="leftText">宽：</span>
						<input value="187" id="widthInput" 
							style="width: 30px; vertical-align: middle;" class="input"
							onkeyup="onWidthChange()" onchange="onWidthChange()"
							onkeypress="javascript:return Fai.isNumberKey(event);" type="text"/>
						<span id="topText">高：</span>
						<input value="50" id="heightInput"
							style="width: 30px; vertical-align: middle;" class="input"
							onkeyup="onHeightChange()" onchange="onHeightChange()"
							onkeypress="javascript:return Fai.isNumberKey(event);" type="text"/>
					</div>
				</div>
				<div id="logoPosPanel" class="set-line">
					<div class="set-title">图片位置：</div>
					<div class="set-ctrl">
						<span id="leftText">左：</span>]
						<input value="232" id="leftInput"
							style="width: 30px; vertical-align: middle;" class="input"
							onkeyup="onLeftChange()" onchange="onLeftChange()"
							onkeypress="javascript:return Fai.isNumberKey(event);" type="text"/>
						<span id="leftText">上：</span>
						<input value="65" id="topInput"
							style="width: 30px; vertical-align: middle;" class="input"
							onkeyup="onTopChange()" onchange="onTopChange()"
							onkeypress="javascript:return Fai.isNumberKey(event);" type="text"/>
					</div>
				</div>
				<div class="set-line">
					<div class="set-title">图片描述：</div>
					<div class="set-ctrl">
						<input value="智慧星河" id="logoDescription" style="width: 150px" maxlength="50" type="text"/>
					</div>
				</div>
				<div id="logoLinkPanel" class="set-line">
					<div class="set-title">跳转方式：</div>
					<div class="set-ctrl">
						<input id="nolinks" name="linkType" onclick="linkTypeChecked(0,false)" checked="checked" type="radio"/>
						<label for="nolinks">不跳转</label>
						<input id="customlinks" name="linkType" onclick="linkTypeChecked(1,false)" type="radio"/>
						<label for="customlinks">自定义链接</label>
					</div>
				</div>
				<div style="display: none;" id="customLinksPanel">
					<div style="display: none;" class="set-line" id="customLinkAddress">
						<div class="set-title">链接地址：</div>
						<div class="set-ctrl">
							<input id="customlinksaddr" name="customlinksaddr" style="float: left;" type="text"/>
							<div id="logoJumpCtrl" class="jumpCtrl" _ltype="0" _lide="">设置链接</div>
						</div>
					</div>
					<div style="display: none;" class="set-line" id="linksOpenType">
						<div class="set-title">链接打开方式：</div>
						<div class="set-ctrl">
							<select id="linksOpenTypeId" onchange="onLinkOpenType()">
								<option selected="selected" value="1">当前窗口</option>
								<option value="2">新窗口</option>
							</select>
						</div>
					</div>
				</div>
				<div class="set-line">
					<div class="set-title">网站LOGO：</div>
					<div class="set-ctrl">
						<input id="keepLogoFixTop" name="keepLogoFixTop" onclick="keepLogoFixTop()" type="checkbox"/>
						<label id="keepLogoFixTopLabel" for="keepLogoFixTop">固定在顶部</label>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--end of tabs-->


	<div id="f_family_menu0" class="f_family_menu" style="display: none;">
		<div id="f_family_content" class="f_family_content">
			<div class="f_family_option" style="font-family: SimSun"
				_value="SimSun" title="宋体">宋体</div>
			<div class="f_family_option" style="font-family: PMingLiU"
				_value="PMingLiU" title="新细明体">新细明体</div>
			<div class="f_family_option" style="font-family: FangSong_GB2312"
				_value="FangSong_GB2312" title="仿宋_GB2312">仿宋_GB2312</div>
			<div class="f_family_option f_selected" style="font-family: 微软雅黑"
				_value="微软雅黑" title="微软雅黑">微软雅黑</div>
			<div class="f_family_option" style="font-family: 隶书" _value="隶书"
				title="隶书">隶书</div>
			<div class="f_family_option" style="font-family: 幼圆" _value="幼圆"
				title="幼圆">幼圆</div>
			<div class="f_family_option" style="font-family: STKaiti"
				_value="STKaiti" title="华文楷体">华文楷体</div>
			<div class="f_family_option" style="font-family: 方正舒体" _value="方正舒体"
				title="方正舒体">方正舒体</div>
			<div class="f_family_option" style="font-family: 华文彩云" _value="华文彩云"
				title="华文彩云">华文彩云</div>
			<div class="f_family_option" style="font-family: 华文行楷" _value="华文行楷"
				title="华文行楷">华文行楷</div>
			<div class="f_family_option" style="font-family: 华文宋体" _value="华文宋体"
				title="华文宋体">华文宋体</div>
			<div class="f_family_option"
				style="font-family: 楷体, 楷体_GB2312, SimKai"
				_value="楷体,楷体_GB2312, SimKai" title="楷体">楷体</div>
			<div class="f_family_option" style="font-family: 黑体, SimHei"
				_value="黑体, SimHei" title="黑体">黑体</div>
			<div class="f_family_option" style="font-family: Arial"
				_value="Arial" title="Arial">Arial</div>
			<div class="f_family_option" style="font-family: Tahoma"
				_value="Tahoma" title="Tahoma">Tahoma</div>
			<div class="f_family_option" style="font-family: impact"
				_value="impact" title="impact">impact</div>
			<div class="f_family_option" style="font-family: Arial Serif"
				_value="Arial Serif" title="Arial Serif">Arial Serif</div>
			<div class="f_family_option" style="font-family: Georgia"
				_value="Georgia" title="Georgia">Georgia</div>
			<div class="f_family_option" style="font-family: Garamond"
				_value="Garamond" title="Garamond">Garamond</div>
			<div class="f_family_option" style="font-family: Times New Roman"
				_value="Times New Roman" title="Times New Roman">Times New
				Roman</div>
			<div class="f_family_option" style="font-family: andale mono"
				_value="andale mono" title="andale mono">andale mono</div>
			<div class="f_family_option"
				style="font-family: arial black, avant garde"
				_value="arial black,avant garde" title="arial black">arial
				black</div>
			<div class="f_family_option" style="font-family: comic sans ms"
				_value="comic sans ms" title="comic sans ms">comic sans ms</div>
		</div>
	</div>
	<div id="f_size_menu0" class="f_size_menu" style="display: none;">
		<div class="f_slider_stay">
			<div class="f_slider_strip"></div>
			<div style="top: 55.5px;" class="f_slider_move ui-draggable">36px</div>
		</div>
	</div>
	<div id="f_family_menu1" class="f_family_menu" style="display: none;">
		<div id="f_family_content" class="f_family_content">
			<div class="f_family_option" style="font-family: SimSun"
				_value="SimSun" title="宋体">宋体</div>
			<div class="f_family_option" style="font-family: PMingLiU"
				_value="PMingLiU" title="新细明体">新细明体</div>
			<div class="f_family_option" style="font-family: FangSong_GB2312"
				_value="FangSong_GB2312" title="仿宋_GB2312">仿宋_GB2312</div>
			<div class="f_family_option f_selected" style="font-family: 微软雅黑"
				_value="微软雅黑" title="微软雅黑">微软雅黑</div>
			<div class="f_family_option" style="font-family: 隶书" _value="隶书"
				title="隶书">隶书</div>
			<div class="f_family_option" style="font-family: 幼圆" _value="幼圆"
				title="幼圆">幼圆</div>
			<div class="f_family_option" style="font-family: STKaiti"
				_value="STKaiti" title="华文楷体">华文楷体</div>
			<div class="f_family_option" style="font-family: 方正舒体" _value="方正舒体"
				title="方正舒体">方正舒体</div>
			<div class="f_family_option" style="font-family: 华文彩云" _value="华文彩云"
				title="华文彩云">华文彩云</div>
			<div class="f_family_option" style="font-family: 华文行楷" _value="华文行楷"
				title="华文行楷">华文行楷</div>
			<div class="f_family_option" style="font-family: 华文宋体" _value="华文宋体"
				title="华文宋体">华文宋体</div>
			<div class="f_family_option"
				style="font-family: 楷体, 楷体_GB2312, SimKai"
				_value="楷体,楷体_GB2312, SimKai" title="楷体">楷体</div>
			<div class="f_family_option" style="font-family: 黑体, SimHei"
				_value="黑体, SimHei" title="黑体">黑体</div>
			<div class="f_family_option" style="font-family: Arial"
				_value="Arial" title="Arial">Arial</div>
			<div class="f_family_option" style="font-family: Tahoma"
				_value="Tahoma" title="Tahoma">Tahoma</div>
			<div class="f_family_option" style="font-family: impact"
				_value="impact" title="impact">impact</div>
			<div class="f_family_option" style="font-family: Arial Serif"
				_value="Arial Serif" title="Arial Serif">Arial Serif</div>
			<div class="f_family_option" style="font-family: Georgia"
				_value="Georgia" title="Georgia">Georgia</div>
			<div class="f_family_option" style="font-family: Garamond"
				_value="Garamond" title="Garamond">Garamond</div>
			<div class="f_family_option" style="font-family: Times New Roman"
				_value="Times New Roman" title="Times New Roman">Times New
				Roman</div>
			<div class="f_family_option" style="font-family: andale mono"
				_value="andale mono" title="andale mono">andale mono</div>
			<div class="f_family_option"
				style="font-family: arial black, avant garde"
				_value="arial black,avant garde" title="arial black">arial
				black</div>
			<div class="f_family_option" style="font-family: comic sans ms"
				_value="comic sans ms" title="comic sans ms">comic sans ms</div>
		</div>
	</div>
	<div id="f_size_menu1" class="f_size_menu" style="display: none;">
		<div class="f_slider_stay">
			<div class="f_slider_strip"></div>
			<div style="top: 55.5px;" class="f_slider_move ui-draggable">36px</div>
		</div>
	</div>
</body>
</html>