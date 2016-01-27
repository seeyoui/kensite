<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/taglib/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" class="g_htmlManage">
  
  <head>
    <title>智慧星河</title>
	<%@ include file="/WEB-INF/view/taglib/header.jsp" %>
	<%
		String popupID = request.getParameter("popupID");
	%>
	<meta name="renderer" content="webkit"/>
    <meta name="mobile-agent" content="format=html5;url=http://m.seeyoui.icoc.in/"/>
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
	<link href="${ctx_web}/css/site/colAdd.min.css" type="text/css" rel="stylesheet">
<script type="text/javascript">
var openCusUrl = false;
var colList = [{"id":2,"name":"首页","parentId":0},{"id":103,"name":"我们的服务","parentId":0},{"id":21,"name":"新闻动态","parentId":0},{"id":101,"name":"关于我们","parentId":0},{"id":102,"name":"联系我们","parentId":0},{"id":9,"name":"留言板","parentId":0},{"id":12,"name":"产品展示","parentId":0},{"id":13,"name":"购物车","parentId":0}];
var schemeColInfo = {"aid":7570029,"wid":0,"schemeId":1,"moduleLeft":"[]","moduleCenterTop":"[]","moduleRight":"[]","moduleMiddleLeft":"[]","moduleMiddleRight":"[]","moduleCenterBottom":"[]","moduleFloatLeftTop":"[]","moduleAbs":"[]","moduleFloatRightTop":"[]","moduleFloatLeftBottom":"[]","moduleFloatRightBottom":"[{\"id\":308,\"t\":-694,\"l\":0,\"s\":1}]","colId":2,"moduleTop":"[{\"id\":320},{\"id\":314},{\"id\":316}]","moduleBottom":"[]","flag":0,"extId":0,"moduleHidden":"[]","displayLayout":[7],"moduleAbsTop":"[]","moduleAbsBottom":"[{\"id\":311,\"t\":9,\"l\":684},{\"id\":319,\"t\":98,\"l\":750}]","otherStyle":{"independentList":[],"y":284,"h":0,"layout4Width":0,"layout5Width":0},"moduleFullmeasureTop":"[]","moduleFullmeasureBottom":"[]","banner":{"s":0,"i":4000,"a":1500,"h":false,"o":false,"t":1,"p":0,"pt":0,"pl":0,"bt":1,"l":[],"f":{},"ce":{},"n":[],"c":3,"at":0},"navStyle":{"v":0,"no":true,"s":0,"ns":{"w":-1,"h":-1},"cs":{"w":-1,"h":-1},"gt":{"y":0},"ht":{"y":0},"np":{},"nb":{"y":0},"cb":{"y":0},"ncp":{"y":0,"t":-1,"r":-1,"b":-1,"l":-1,"hl":-1,"ht":-1},"cp":{"y":0,"t":-1,"l":-1},"nis":{"w":-1,"h":-1},"nib":{"y":0},"nihb":{"y":0},"niss":{"w":-1,"h":-1},"nisb":{"y":0},"nsigt":{"y":0},"nsiht":{"y":0},"nsis":{"w":-1,"h":-1},"nsib":{"y":0},"nsihb":{"y":0},"nsiho":0,"nmove":0},"headerTopStyle":{"hts":-1,"hg":{"y":0,"r":3,"f":"","p":"","c":"#000"}},"footerStyle":{"fa":0,"fh":-1,"f":{"t":0,"l":0,"r":0,"u":0,"d":0},"rt":{"y":0,"f":"","s":-1,"c":""},"gt":{"y":0,"f":"","s":-1,"w":0,"d":0,"c":""},"ht":{"c":""},"fb":{"y":0},"fis":-1,"fip":0,"fiw":-1,"fih":-1,"fisp":-1,"fiv":{"y":0,"w":-1,"c":""},"fift":{"y":0,"f":"","s":-1,"w":0,"d":0,"c":"","hc":""},"fifc":true,"fiss":0,"fish":-1,"fist":{"y":0,"f":"","s":-1,"w":0,"d":0,"c":"","hc":""}},"background":{"styleDefault":true,"s":true,"h":false,"r":3,"o":"","sw":-1,"e":0,"wbh":-1,"wbw":-1,"clw":-1,"crw":-1,"id":"","p":"","bBg":{"y":0,"r":3,"f":"","p":"","c":"#000"},"cBg":{"y":0,"r":3,"f":"","p":"","c":"#000"},"cmBg":{"y":0,"r":3,"f":"","p":"","c":"#000"}},"title":{"h":false,"x":"请编辑网站标题","t":-1,"l":-1,"f":"","s":-1,"w":-1,"c":"","i":0,"u":0,"st":{"y":0,"x":"","f":"","c":"","s":0,"i":0,"w":0,"u":0},"jm":{"y":0},"fp":false},"locale":{"h":false,"x":"中文","y":"English","z":"繁体","v":"日本語","k":"한국어","lo":"ພາສາລາວ","th":"ภาษาไทย","es":"lengua española","ru":"русский","fra":"français","it":"Italia","t":-1,"l":-1,"f":"","s":-1,"w":-1,"fp":false},"logo":{"h":true,"t":-1,"l":-1,"g":-1,"w":-1,"lt":0,"addr":"","ot":1,"des":"","desd":false,"i":"","p":""},"browserTitle":"智慧星河"};
var not_all = false;
var not_all_member = false;
var byMemberLevel = true;
var memberLevelId = 0;
var memberGroupIdList = [];
var memberLevelList = [{"aid":7570029,"wid":0,"id":0,"name":"普通会员","discount":100,"needItg":0},{"aid":7570029,"wid":0,"id":1,"name":"黄金会员","discount":100,"needItg":0},{"aid":7570029,"wid":0,"id":2,"name":"白金会员","discount":100,"needItg":0},{"aid":7570029,"wid":0,"id":3,"name":"钻石会员","discount":100,"needItg":0}];
var memberGroupList = [];
var closeGroupOption = true;
var model = "";
var action = "../ajax/col_h.jsp?cmd=add";
var frame = false;
var _parentId = 0;
var _orderType = 1;
var pageBrowserTitleData = "";
var useTemplateBrowserTitle = true;
var pageSearchKeywordData = "";
var useTemplateSearchKeyword = true;
var pageSearchDescData = "";
var useTemplateSearchDesc = true;
var colOther ={}; 
var reData = "";
var openType = false;
var isEdit;
var popupID = <%=popupID%>;

$(function(){
	var _name = "";
	var _title = "";
	if (!frame) {
		Fai.addPopupWindowBtn(popupID, {id:'save', extClass:'saveButton', text:'保 存', click:save});
		Fai.addPopupWindowBtn(popupID, {id:'close', extClass:'cancelButton', text:'取 消', click:cancel});
	}
	
	var initJumpType = 0,
		initJumpIde = "",
		initJumpName = "";
	isEdit = !frame && !!Fai.top._popupOptions["popup"+popupID].callArgs;
	if( isEdit ){
		reData = Fai.top._popupOptions["popup"+popupID].callArgs;
		
		if( reData.colList ){
			//重写col list  修改过并未保存的col
			colList = reData.colList;
			reData.colList = undefined;
		}
		var reId = reData.id;
		var reType = reData.type;
		
		//重写需要init的参数
		_name = reData.name;
		colOther = reData.other;
		_title = colOther.title;
		not_all = !reData.all;
		not_all_member = !reData.buddy;
		byMemberLevel = reData.byMemberLevel;
		memberLevelId = reData.authMemberLevelId;
		
		memberGroupIdList = reData.authBuddyGroupIdList;
		_parentId = reData.parentId;
		openCusUrl = reData.openCusUrl;
		openType = reData.openType;
		
		initJumpType = reData.jumpType || 0;
		initJumpIde = reData.jumpIde || "";
		initJumpName = reData.jumpName || "";
		
		if( reData.jumpName == null ){ //栏目、产品等被删除 恢复默认
			openCusUrl = false;
		}
		//重写action
		action = "";
		
		//购物车、会员注册、会员登陆  只能修改栏目名称,所属栏目
		if(reType === 18 || reType === 17 || reType === 13){
			$("#auth_div").remove();
			$("#auth_member").remove();
			$("#member_group").remove();
			$("#member_level").remove();
		}else if( reType !== 1 ){

			if( reType != 4 && reType != 3 ){
				$("#url_input").remove();
			}
		}					
	}
	
	//初始化链接控件
	var jumpOptions = {
		inputId : "url",
		jumpType: initJumpType,
		jumpIde: initJumpIde,
		jumpName: initJumpName,
		colOff: true,
		setPageChange : setPageChange	
	}
	Site.jumpControl(jumpOptions);
	
	initParentColSelect();
	initColTypePanel(isEdit, openCusUrl);
	
	if( model === 'addFooter' || model === 'editFooter' ){
		//底部栏目均为最上层
		$("#parentPanel").remove();
	}
	var nameInput = $("#name");
	nameInput.val( _name );
	$("#navDesc").val( _title ).focus();

 	//记录是否为第一次修改文章列表或产品列表
	nameInput.on("focus.valid",function(){
		if(reData.tipsName.indexOf("文章列表") > -1 ){					
			if($.cookie("validArticle", {path:'/'}) === null){   		
				$.cookie("validArticle", 1, { expires:365, path:'/'});
				Fai.ing("该系统栏目中部分系统模块无法删除，使用时请注意", true);
			}
		}
		if( reData.tipsName.indexOf("产品列表") > -1){
			if($.cookie("validGoods", {path:'/'}) === null){
				$.cookie("validGoods", 1, { expires:365, path:'/'});
				Fai.ing("该系统栏目中部分系统模块无法删除，使用时请注意", true);
			}
		}
		nameInput.off("focus.valid");
	});
	
	if(0 != 0){
			if(!useTemplateBrowserTitle){
				$("#colEdit_browserTitleIndeText").val(schemeColInfo.browserTitle).focus();
				pageBrowserTitleData = schemeColInfo.browserTitle;
			}

			if(!useTemplateSearchKeyword ){
				pageSearchKeywordData = schemeColInfo.searchKeyword;
				$("#colEdit_searchKeywordIndeText").val(schemeColInfo.searchKeyword).focus();
			}

		
			if(!useTemplateSearchDesc){
				pageSearchDescData = schemeColInfo.searchDesc;
				$("#colEdit_searchDescIndeText").val(schemeColInfo.searchDesc).focus();
			}
	}
	//init member leve select
	var memberLevelSelect = [];
	$(memberLevelList).each(function(i,level){
		if( memberLevelId === level.id ){
			memberLevelSelect.push(				"<option value='" + level.id + "' selected >");
		}else{
			memberLevelSelect.push(				"<option value='" + level.id + "'>");
		}
		memberLevelSelect.push(					level.name+"及以上");
		memberLevelSelect.push(				"</option>");
	});
	$( memberLevelSelect.join("") ).appendTo( $("#memberLevel") );
	//end

	//init member group checkbox
	if( $("#member_group_checkbox") ){
		var memberGroupCheckbox = [];
		$(memberGroupList).each(function(i,group){
			memberGroupCheckbox.push(			"<div class='memberGroupPanel chkPanel'>");
			memberGroupCheckbox.push(				"<input class='memberGroup' value='" + group.id + "' id='bg" + group.id + "' type='checkbox' />");
			memberGroupCheckbox.push(				"<label for='bg" + group.id + "'>" + Fai.encodeHtml(group.name) + "</label>");
			memberGroupCheckbox.push(			"</div>");
		});
		$( memberGroupCheckbox.join("") ).appendTo( $("#member_group_checkbox") );
		$.each( memberGroupIdList, function( i, groupId ){
			if( $("#bg"+groupId).length > 0 ){
				$("#bg"+groupId)[0].click();
			}
		} );
	}
	
	//end
	if( openCusUrl ){
		$("#url_input").show();
		$("#auth_div").hide();
		$("#auth_member").hide();
		$("#member_group").hide();
		$("#member_level").hide();
		$("#baiduOptSettingLi").hide();
		$("#baiduOptSetting").hide();
	}else{
		$("#url_input").hide();
		$("#auth_div").show();
		$("#advanSettingLi").show();
		$("#baiduOptSettingLi").show();
		$("#baiduOptSetting").show();
		checkAuth();
	}
	
	if( !not_all ){
		if( $("#authAll").length ){
			$("#authAll")[0].click();
		}
	}else{
		if( $("#authMember").length ){
			$("#authMember")[0].click();
		}
	}
	
	if( !not_all_member && $("#allMember").length ){
		$("#allMember")[0].click();
	}else{
		if( byMemberLevel && $("#byLevel").length ){
			$("#byLevel")[0].click();
		}else if( $("#byGroup").length ){
			$("#byGroup")[0].click();
		}
	}

	if (openType) {
		$("#openType").val(1);
	} else {
		$("#openType").val(0);
	}

	$("#tabs").tabs({ selected:0 });
	//页面加载完后再执行，必须放在在页面加载尾，判断页面内容是否发生改变
	Site.loadPageChange({unBindId:[],popupID:popupID});
	refreshSetting();
});

function initColTypePanel(isEdit, openCusUrl) {
	 if(reData.type !== 1 && isEdit){
	 	$("#colTypePanel").remove();
	 	    return;
	 };
	 generateColTypeHtml(isEdit,openCusUrl);
	 
	$("#colType").bind("change", function () {
		var colType = parseInt( $(this).val() );
		checkCusUrl(colType);
	});
};
function generateColTypeHtml (isEdit,openCusUrl) {
	var colTypeHtml = [];

	if(isEdit){
		    $("#colTypePanel").find('.mouseShape').text("链接类型：");
			if(openCusUrl){
				colTypeHtml.push("<option value='6'>自定义链接</option>");
				colTypeHtml.push("<option value='1'>默认</option>");
			}else{
				colTypeHtml.push("<option value='1'>默认</option>");
				colTypeHtml.push("<option value='6'>自定义链接</option>");
			}
	}else{
		colTypeHtml.push("<option value='1'>默认</option>");
		colTypeHtml.push("<option value='2'>产品展示</option>");
		colTypeHtml.push("<option value='3'>新闻列表</option>");
		colTypeHtml.push("<option value='4'>图册展示</option>");
		colTypeHtml.push("<option value='6'>自定义链接</option>");
    }
	$("#colType").append(colTypeHtml.join(""));
};

function refreshSetting(){	
	
			$('#colEdit_searchKeywordIndeText').attr('disabled', true);
			$('#colEdit_searchDescIndeText').attr('disabled', true);
			$('#navDesc').attr('disabled', true);
	
	
	
};
function getColName(){
	var name = $('#name').val();
	if( name == '' ){
		Fai.ing('栏目名称不能为空。', false);
		$("#tabs").tabs({ selected:0 });
		$('#name').focus();
		return false;
	}
	if( name.length > 50 ){
		Fai.ing('栏目名称长度不能超过50', false);
		$("#tabs").tabs({ selected:0 });
		$('#name').focus();
		return false;
	}
	var reObj = {};
	reObj.name = name;
	return reObj;
};
function getNavDesc(){
	var title = $('#navDesc').val();
	var reObj = {};
	reObj.title = title;
	return reObj;
};
function getAuthObj(){
	//是否所有人可见
	var is_authAll = true;
	if( !$("#authAll") || !$("#authAll").attr( "checked" ) ){
		is_authAll = false;
	}
	//是否所有会员可见
	var is_allMember = true;
	//是否按等级划分
	var is_byLevel = true;
	var authMemberGroupIdList = [];
	var memberLevelId = parseInt( $("#memberLevel").val() );
	memberLevelId = memberLevelId ? memberLevelId : 0;
	if( !closeGroupOption ){
		//未关闭group权限的用户
		if( $("#allMember") && $("#allMember").attr( "checked" ) ){
			is_allMember = true;
		}else{
			is_allMember = false;
		}
		if( !is_allMember && !$("#byLevel").attr( "checked" ) ){
			is_byLevel = false;
		}
		
		var memberGroups = $('#member_group_checkbox').find('.memberGroup');
		$(memberGroups).each(function(i, o){
			if( $(o).attr('checked') && parseInt($(o).val()) ){
				var tmpId = parseInt( $(o).val() );
				authMemberGroupIdList.push(tmpId);
			}
		});
		if( !is_authAll && !is_byLevel && authMemberGroupIdList.length <= 0 ){
			Fai.ing("至少要选择一个分组。",true);
			$("#tabs").tabs({ selected:1 });
			return false;
		}
	}
	var reObj = {};
	reObj.all = is_authAll;
	reObj.buddy = is_allMember;
	reObj.byMemberLevel = is_byLevel;
	reObj.authBuddyGroupIdList = authMemberGroupIdList;
	reObj.authMemberLevelId = memberLevelId;
	return reObj;
};

function getCusUrlObj(){

	var colType = parseInt( $("#colType").val() );

	if( colType == 6 || (isEdit && openCusUrl) ){
		var reObj = {},
			jumpType = parseInt( $('#jumpCtrl').attr('_ltype') ),
			jumpIde = $('#jumpCtrl').attr('_lide');
			
			reObj.jumpName = $('#jumpCtrl').attr('_lname');
			
		if( jumpType === 0 || jumpType === 103 ){
			 var urlVal = $.trim($('#url').val());
			 if( urlVal == ''){
				Fai.ing('网址不能为空。', false);
				$("#tabs").tabs({ selected:0 });
				$('#url').focus();
				return false;
			}
			if( jumpIde.length > 512 ){
				Fai.ing('网址长度不能超过512', false);
				$("#tabs").tabs({ selected:0 });
				$('#url').focus();
				return false;
			}
			reObj.jumpName = $('#jumpCtrl').attr('_lurl');
		}
		reObj.jumpType = jumpType;
		reObj.jumpIde = jumpIde;
		reObj.jumpUrl = $('#jumpCtrl').attr('_lurl');
		reObj.openCusUrl = true;
		reObj.url = jumpIde;
		return reObj;
	}
	var reObj = {};
	reObj.openCusUrl = false;
	return reObj;
};

function save() {
	 
	if( !frame && Fai.top._popupOptions["popup"+popupID].callArgs && ( model === "jsEdit" ) ){
		//修改栏目 不AJAX提交  返回给另一个iframe js层
		return jsEditReturn();
	}
	
	//add栏目
	var nameObj = getColName();
	if( !nameObj ){
		return;
	}
	var titleObj = getNavDesc();
	var jsAddObj = {};
	jsAddObj.type = 1;
	jsAddObj.check = true;
	var nameObj = getColName();
	jsAddObj.tipsName = "自定义栏目";
	jsAddObj.name = nameObj.name;
	colOther.title = titleObj.title;
	jsAddObj.other = colOther;
	var data = 'name=' + Fai.encodeUrl( nameObj.name )+'&title=' + Fai.encodeUrl(titleObj.title);
	
	var parentId = $('#parentId').val();
	if( parentId != '' && !isNaN( parentId ) ){
		if(_orderType == 2){
			jsAddObj.parentId = parseInt( parentId );
			data += '&footParentId=' +  parentId;
			data += '&parentId=' +  0;
		} else if( _orderType == 3 ){
			jsAddObj.parentId =  parseInt( parentId );
			data += '&footParentId=' +  0;
			data += '&parentId=' +  0;
		}else{
			jsAddObj.parentId = parseInt( parentId );
			data += '&parentId=' +  parentId;
			data += '&footParentId=' +  0;
		}
	}else{
		jsAddObj.parentId = 0;
		data += '&footParentId=' +  0;
		data += '&parentId=' +  0;
	}

	var openType = parseInt( $("#openType").val() );
	if (openType) {
		data += '&openType=true';
	} else {
		data += '&openType=false';
	}
	
	var colType = parseInt( $("#colType").val() );
	if( colType == 6 ){
		//自定义网址类型的栏目  不允许设置权限
		var cusUrlObj = getCusUrlObj();
		if( !cusUrlObj ){
			return;
		}
		jsAddObj.openCusUrl = true;
		jsAddObj.url = cusUrlObj.url;
		jsAddObj.jumpType = cusUrlObj.jumpType;
		jsAddObj.jumpName = cusUrlObj.jumpName;
		jsAddObj.jumpIde = cusUrlObj.jumpIde;
		data += '&cusUrl=true&url=' + Fai.encodeUrl( cusUrlObj.url );
	}else{
		var authObj = getAuthObj();
		if( !authObj ){
			return;
		}
		
		jsAddObj.all = authObj.all;
		jsAddObj.buddy = authObj.buddy;
		jsAddObj.byMemberLevel = authObj.byMemberLevel;
		jsAddObj.authMemberLevelId = authObj.authMemberLevelId;
		jsAddObj.authBuddyGroupIdList = authObj.authBuddyGroupIdList;
		
		data += '&authAll=' + authObj.all 
			 + '&allMember=' + authObj.buddy 
			 + '&byLevel=' + authObj.byMemberLevel 
			 + '&memberLevelId=' + authObj.authMemberLevelId 
			 + '&authMemberGroupIdList=' + Fai.encodeUrl( $.toJSON( authObj.authBuddyGroupIdList ) );
	}
				//保存浏览器标题、页面关键词、页面描述
		data += '&pageBrowserTitle=' + !useTemplateBrowserTitle
			 + '&browserTitle=' + pageBrowserTitleData
			 + '&pageSearchKeyword=' +!useTemplateSearchKeyword
			 + '&searchKeyword=' + pageSearchKeywordData
			 + '&pageSearchDesc=' + !useTemplateSearchDesc
			 + '&searchDesc=' + pageSearchDescData;

	data += '&colType=' + Fai.encodeUrl(colType);

	Fai.ing('正在保存……', false);
	Site.enablePopupFrameBtn(frame, popupID, 'save', false);
	
	//ajax提交
	$.ajax({
		type: 'post',
		url: action,
		data: data,
		error: function(){ 
			Site.enablePopupFrameBtn(frame, popupID, 'save', true); 
		},
		success: function(result){
			Site.enablePopupFrameBtn(frame, popupID, 'save', true);
			if (frame) {
				if (Fai.successHandle(result, "添加成功", "系统错误", '', 3, 1)) {
					Fai.top._frameChanged++;
					reSetPageChange();
					document.location.reload();
				}
			} else {
				if (colType == 6) {
					if (Fai.successHandle(result, "添加成功", "系统错误", '', 3, 1)) {
						var res = jQuery.parseJSON(result);
						reSetPageChange();
						if( model === "jsAdd" ){
							jsAddObj.id = res.id;
							jsAddObj.all = true;
							jsAddObj.buddy = true;
							jsAddObj.byMemberLevel = true;
							jsAddObj.authMemberLevelId = 0;
							jsAddObj.authBuddyGroupIdList = [];
							Fai.top._popupOptions["popup"+popupID].closeArgs = jsAddObj;
							Fai.closePopupWindow(popupID);
							return;
						}
						Fai.top.location.reload();
					}
				} else {
					if (Fai.successHandle(result, "添加成功，正在跳转到栏目设计页面……", "系统错误", '', 3, 1)) {
						var res = jQuery.parseJSON(result);
						reSetPageChange();
						if( model === "jsAdd" ){
							Fai.ing( "添加成功。", false );
							jsAddObj.id = res.id;
							jsAddObj.openCusUrl = false;
							jsAddObj.url = "/col.jsp?id=" + res.id ,							
							Fai.top._popupOptions["popup"+popupID].closeArgs = jsAddObj;
							Fai.closePopupWindow(popupID);
							return;
						}
						top.location.href = "../col.jsp?id=" + res.id;
					}
				}
			}
		}
	});
};

function jsEditReturn(){
	var reData = Fai.top._popupOptions["popup"+popupID].callArgs;
	var reType = reData.type;
	var obj = {};
	var nameObj = getColName();
	if( !nameObj ){
		return;
	}
	var titleObj = getNavDesc();
	colOther.title = titleObj.title;
	obj.other = colOther;
	obj.name = nameObj.name;
	var parentId = $('#parentId').val();
	if( isNaN( parentId ) ){
		parentId= 0;
	}
	obj.parentId = parseInt( parentId );

	if(reType === 18 || reType === 17 || reType === 13){
		//只允许修改：栏目名称、所属栏目
	}else if( reType !== 1 && reType !== 4 && reType !== 3 ){
		//系统默认栏目，允许修改：栏目名称、所属栏目、栏目权限
		obj.openCusUrl = false;
		obj.url = "";
		var authObj = getAuthObj();
		if( !authObj ){
			return;
		}
		$.extend( obj, authObj );
	}else{
		//用户自定义栏目，允许修改：栏目名称、所属栏目、链接网址、栏目权限
		var colType = parseInt( $("#colType").val() );
		if( colType == 6 ){
			//自定义网址类型的栏目  不允许设置权限
			var cusUrlObj = getCusUrlObj();
			if( !cusUrlObj ){
				return;
			}
			$.extend( obj, cusUrlObj );
		}else{
			obj.openCusUrl = false;
			obj.url = "/col.jsp?id=" + reData.id ;
			var authObj = getAuthObj();
			if( !authObj ){
				return;
			}
			$.extend( obj, authObj );
		}

	}

	var openType = $("#openType").val() == 1 ? true : false;
	obj.openType = openType;

	obj = $.extend( reData, obj);
	reSetPageChange();
	Fai.top._popupOptions["popup"+popupID].closeArgs = obj;
	
	var params = "colId="+0+
				 "&pageBrowserTitle="+!useTemplateBrowserTitle+"&browserTitle="+pageBrowserTitleData+
				 "&pageSearchKeyword="+!useTemplateSearchKeyword+"&searchKeyword="+pageSearchKeywordData+
				 "&pageSearchDesc="+!useTemplateSearchDesc+"&searchDesc="+pageSearchDescData;
	//暂时先点击内保存的时候直接保存页面标题、页面关键词、页面描述数据
	$.ajax({
		   	type: "post",
			url: '../ajax/col_h.jsp?cmd=multiSet',
			data: params,
			error: function(){ 
				Fai.ing("服务繁忙，请稍候重试");
			},
			success: function(result){
				if (frame) {
					if (Fai.successHandle(result, "保存成功", "系统错误", '', 3, 1)) {
						Fai.closePopupWindow(popupID);
						return;
					
						
					}
				} else {
					Fai.closePopupWindow(popupID);
					return;
	
					Fai.successHandle(result, "保存成功", "系统错误", top.location.href, 1, 1);
				}
			}
	});	
};

function cancel() {
	if(top._colId == 0){
		if(useTemplateBrowserTitle == false){			
			top.document.title = top._browserTitleExt + schemeColInfo.browserTitle;
		}else{
			top.document.title = top._browserTitleExt + top._templateBrowserTitleData;
		}
	}
	//document.location.reload();	这里加reload会导致触发保存后，点击取消时出现两次警示弹窗
	Fai.closePopupWindow(popupID);
};

function checkCusUrl(colType) {
	if( colType == 6 ){
		$("#url_input").show();
		$("#auth_div").hide();
		$("#member_level").hide();
		$("#auth_member").hide();
		$("#member_group").hide();
		$("#baiduOptSettingLi").hide();
		$("#baiduOptSetting").hide();
	}else{
		$("#baiduOptSettingLi").show();
		$("#baiduOptSetting").show();
		$("#advanSettingLi").show();
		$("#url_input").hide();
		$("#auth_div").show();
		openCusUrl = false;
		checkAuth();
	}
};

function checkAuth(){
	if( $("#authAll").attr( "checked" ) ){
		$("#member_level").hide();
		$("#auth_member").hide();
		$("#member_group").hide();
	}else{
		if( openCusUrl ){
			$("#member_level").hide();
			$("#auth_member").hide();
			$("#member_group").hide();
		}else if( !closeGroupOption ){
			$("#member_level").show();
			$("#memberLevel").show();
			$("#auth_member").show();
			$("#member_group").show();
			checkMember();
		}else{
			$("#member_level").show();
			$("#memberLevel").show();
		}
	}
};

function checkMember(){
	if( $("#allMember").attr( "checked" ) ){
		$("#member_level").hide();
		$("#member_group").hide();
	}else if( $("#authAll").attr( "checked" ) ){
		$("#member_level").hide();
		$("#member_group").hide();
	}else{
		if( openCusUrl ){
			$("#member_level").hide();
			$("#member_group").hide();
		}else if( $("#byLevel").attr( "checked" ) ){
			$("#member_level").show();
			//为兼容IE6下初始化时隐藏的DIV下的select隐藏不了的BUG，设memberLevel select的display=none;然后点击时再show
			$("#memberLevel").show();
			$("#member_group").hide();
		}else{
			$("#member_group").show();
			$("#member_level").hide();
		}
	}
};

function initParentColSelect() {
	$("#parentId").empty();
	$("<option value='0' >--无--</option>").appendTo($("#parentId"));
	var editColId = -1;
	if( !frame && Fai.top._popupOptions["popup"+popupID].callArgs){
		editColId = Fai.top._popupOptions["popup"+popupID].callArgs.id;
		if( isNaN( editColId ) ){
			editColId = -1;
		}
	}
	for (var i = 0; i < colList.length; ++i) {
		if( colList[i].id === editColId || colList[i].parentId === editColId ){
			continue;
		}
		if (colList[i].parentId !== 0) {
			continue;
		}
		var selected = "";
			
		if( _parentId === colList[i].id ){
			selected = "selected";
		}else{
			selected = "";
		}
		$("<option value='" + colList[i].id + "' " + selected + " >" + Fai.encodeHtml( colList[i].name ) + "</option>").appendTo($("#parentId"));
		
		if(_orderType != 2){
			// 输出该一级栏目下的二级栏目
			for (var j = 0; j < colList.length; ++j) {
				if( colList[j].id === 0 ){
					continue;
				}
				if( colList[j].id === editColId || colList[j].parentId === editColId ){
					continue;
				}
				var is2nd = false;
				if( _parentId === colList[j].id ){
					selected = "selected";
				}else{
					selected = "";
				}
				if (colList[i].id == colList[j].parentId) {
					is2nd = true;
				}
				if (is2nd) {
					$("<option value='" + colList[j].id + "' " + selected + " >&nbsp;&nbsp;|--" + Fai.encodeHtml( colList[j].name ) + "</option>").appendTo($("#parentId"));				
				}
			}
		}
	}
};
function browserTitleIndeTextChange(){
	    pageBrowserTitleData = $.trim( $('#colEdit_browserTitleIndeText').val() );
		if(top._colId == 0){
			top.document.title = top._browserTitleExt + pageBrowserTitleData;
		}
		if(pageBrowserTitleData != ""){
			useTemplateBrowserTitle=false;
		}else{
			if(top._colId == 0){
				top.document.title = top._browserTitleExt+top._templateBrowserTitleData;
			}
			useTemplateBrowserTitle=true;
		}
};
function searchKeywordIndeChange(){
	if($('#colEdit_searchKeywordIndeText').val().length >= 200){
		$('#colEdit_searchKeywordIndeText').val( $('#colEdit_searchKeywordIndeText').val().substring(0, 200) );
	}
	pageSearchKeywordData = $('#colEdit_searchKeywordIndeText').val();
	if(pageSearchKeywordData != ""){
			useTemplateSearchKeyword=false;
	}else{
			useTemplateSearchKeyword=true;
	}
};
function searchDescIndeChange(){
	if($('#colEdit_searchDescIndeText').val().length >= 200){
		$('#colEdit_searchDescIndeText').val( $('#colEdit_searchDescIndeText').val().substring(0, 200) );
	}
	pageSearchDescData = $('#colEdit_searchDescIndeText').val();
	if(pageSearchDescData != ""){
			useTemplateSearchDesc=false;
	}else{
			useTemplateSearchDesc=true;
	}
};

//页面值改变
function setPageChange(){
	Site.setPageChange(true,popupID);	
};
//保存时reset
function reSetPageChange(){
	Site.setPageChange(false,popupID);	
};
</script>
<style type="text/css">
.part{ margin-left:-10px; }
.partLabel{ width:100px; }
.chkPanel { float: left; width: 90px; }
.memberGroupPanel {overflow: hidden; white-space: nowrap; text-overflow: ellipsis; }
</style>

</head>
<body class="popupTabBody">
	<div class="ui-tabs ui-widget ui-widget-content ui-corner-all"
		id="tabs">
		<ul
			class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all">
			<li
				class="ui-state-default ui-corner-top ui-tabs-selected ui-state-active"
				id="basicSettingLi"><a href="#basicSetting">常规</a></li>
			<li class="ui-state-default ui-corner-top" id="advanSettingLi"><a
				href="#advanSetting">高级</a></li>
			<li class="ui-state-default ui-corner-top" id="baiduOptSettingLi"><a
				href="#baiduOptSetting">百度优化</a></li>
		</ul>
		<div id="basicSetting"
			class="blockStyle ui-tabs-panel ui-widget-content ui-corner-bottom"
			style="height: 160px; width: auto;">
			<div class="part">
				<div class="partLabel">
					<label for="name" class="mouseShape">栏目名称：</label>
				</div>
				<div class="left">
					<input id="name" name="name" class="input" maxlength="50"
						type="text">
				</div>
			</div>

			<div id="colTypePanel" class="part">
				<div class="partLabel">
					<label for="colType" class="mouseShape">栏目类型：</label>
				</div>
				<div class="left">
					<select id="colType" name="colType"
						style="width: 153px;; margin-left: 2px;">
						<option selected="selected" value="1">默认</option>
						<option value="2">产品展示</option>
						<option value="3">新闻列表</option>
						<option value="4">图册展示</option>
						<option value="6">自定义链接</option>
					</select>
				</div>
			</div>

			<div style="display: none;" id="url_input" class="part">
				<div class="partLabel">自定义地址：</div>
				<div class="left">
					<input style="float: left;" id="url" name="url" maxlength="512"
						type="text"><div id="jumpCtrl" class="jumpCtrl" _ltype="0"
							_lide="">设置链接</div>
				</div>
			</div>

			<div id="parentPanel" class="part">
				<div class="partLabel">
					<label for="parentId" class="mouseShape">选择上级栏目：</label>
				</div>
				<div class="left">
					<select id="parentId" name="parentId"
						style="width: 153px;; margin-left: 2px;"><option
							selected="selected" value="0">--无--</option>
						<option value="2">首页</option>
						<option value="103">我们的服务</option>
						<option value="21">新闻动态</option>
						<option value="101">关于我们</option>
						<option value="102">联系我们</option>
						<option value="9">留言板</option>
						<option value="12">产品展示</option>
						<option value="13">购物车</option></select>
				</div>
			</div>
		</div>

		<div id="advanSetting"
			class="blockStyle ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide"
			style="height: 140px; width: auto;">
			<div id="auth_div" class="part">
				<div class="partLabel">权限：</div>
				<div class="left">
					<input checked="checked" id="authAll" name="auth"
						onclick="checkAuth()" type="radio"><label for="authAll">所有人可见</label>
						<input id="authMember" name="auth" onclick="checkAuth()"
						type="radio"><label for="authMember">会员可见</label>
				</div>
			</div>

			<div id="open_option" class="part">
				<div class="partLabel">打开方式：</div>
				<div class="left">
					<select id="openType">
						<option selected="selected" value="0">当前窗口</option>
						<option value="1">新窗口</option>
					</select>
				</div>
			</div>

			<div style="display: none;" id="member_level" class="part">
				<div class="partLabel">指定等级：</div>
				<div class="left">
					<select id="memberLevel" style="">
						<option value="0" selected="selected">普通会员及以上</option>
						<option value="1">黄金会员及以上</option>
						<option value="2">白金会员及以上</option>
						<option value="3">钻石会员及以上</option>
					</select>
				</div>
			</div>
		</div>

		<div id="baiduOptSetting"
			class="blockStyle ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide"
			style="height: 160px; width: auto;">
			<div class="part"
				style="margin-left: 6px; line-height: 28px; height: 33px;">
				<div class="partLabel">
					<label for="colEdit_browserTitleIndeText" class="mouseShape">浏览器标题：</label>
				</div>
				<div class="left">
					<input id="colEdit_browserTitleIndeText" class="input"
						style="width: 220px; height: 23px;" maxlength="100"
						onkeyup="browserTitleIndeTextChange();"
						onchange="browserTitleIndeTextChange();" type="text">
				</div>
			</div>
			<div class="part"
				style="margin-left: 6px; line-height: 18px; height: 52px;">
				<div class="partLabel">
					<a class="siteGroupBtn siteGroupPop" target="_blank"
						href="http://jz.faisco.com/proFunc.jsp"
						title="页面关键词为“网站推广版”功能，点击查看详细功能列表">&nbsp;</a> <label
						for="colEdit_searchKeywordIndeText" class="mouseShape">页面关键词：</label>
				</div>
				<div class="left">
					<textarea disabled="disabled" style="width: 220px; height: 45px;"
						id="colEdit_searchKeywordIndeText"
						onkeyup="searchKeywordIndeChange()"
						onclick="searchKeywordIndeChange()"></textarea>
				</div>
			</div>
			<div class="part"
				style="margin-left: 6px; line-height: 18px; height: 52px;">
				<div class="partLabel">
					<a class="siteGroupBtn siteGroupPop" target="_blank"
						href="http://jz.faisco.com/proFunc.jsp"
						title="页面描述为“网站推广版”功能，点击查看详细功能列表">&nbsp;</a> <label
						for="colEdit_searchDescIndeText" class="mouseShape">页面描述：</label>
				</div>
				<div class="left">
					<textarea disabled="disabled" style="width: 220px; height: 45px;"
						id="colEdit_searchDescIndeText" onkeyup="searchDescIndeChange()"
						onclick="searchDescIndeChange()"></textarea>
				</div>
			</div>
			<div id="navDescDiv" class="part"
				style="margin-left: 6px; line-height: 30px; height: 52px;">
				<div class="partLabel">
					<a class="siteGroupBtn siteGroupPop" target="_blank"
						href="http://jz.faisco.com/proFunc.jsp"
						title="导航栏描述为“网站推广版”功能，点击查看详细功能列表">&nbsp;</a> <label for="navDesc"
						class="mouseShape">导航栏描述：</label>
				</div>
				<div class="left">
					<input disabled="disabled" id="navDesc" class="input"
						style="width: 222px; height: 23px;" maxlength="100" type="text">
				</div>
			</div>
		</div>
	</div>
</body>
</html>