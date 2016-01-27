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
<link rel="stylesheet" type="text/css" href="${ctx_web}/css/site/footerInfoEdit.min.css"/>
<link rel="stylesheet" type="text/css" href="${ctx_web}/css/comm/ueditor/ueditor.css"/>
<script type="text/javascript" src="${ctx_web}/js/comm/ueditor/editor_all.js"></script>
<script src="${ctx_web}/js/comm/SWFUpload2v/swfupload.min.js" type="text/javascript"></script>
<script type="text/javascript">
var arrDeletedID = new Array();
var changedItemID = new Array();
var frame = false;
var tmpDataList = [{"parentId":0,"name":"首页","other":{},"url":"/index.jsp","id":2,"type":2,"openCusUrl":false,"all":true,"buddy":true,"byMemberLevel":true,"authMemberLevelId":0,"authBuddyGroupIdList":[],"tipsName":"系统栏目(首页)","check":true},{"parentId":0,"name":"关于我们","other":{},"url":"/col.jsp?id=101","id":101,"type":1,"openCusUrl":false,"all":true,"buddy":true,"byMemberLevel":true,"authMemberLevelId":0,"authBuddyGroupIdList":[],"tipsName":"自定义栏目","check":true},{"parentId":0,"name":"联系我们","other":{},"url":"/col.jsp?id=102","id":102,"type":1,"openCusUrl":false,"all":true,"buddy":true,"byMemberLevel":true,"authMemberLevelId":0,"authBuddyGroupIdList":[],"tipsName":"自定义栏目","check":true},{"parentId":0,"name":"留言板","other":{},"url":"/msgBoard.jsp","id":9,"type":9,"openCusUrl":false,"all":true,"buddy":true,"byMemberLevel":true,"authMemberLevelId":0,"authBuddyGroupIdList":[],"tipsName":"系统栏目(留言板)","check":false},{"parentId":0,"name":"产品展示","other":{},"url":"/pr.jsp","id":12,"type":12,"openCusUrl":false,"all":true,"buddy":true,"byMemberLevel":true,"authMemberLevelId":0,"authBuddyGroupIdList":[],"tipsName":"系统栏目(产品列表)","check":false},{"parentId":0,"name":"购物车","other":{},"url":"/mcart.jsp","id":13,"type":13,"openCusUrl":false,"all":true,"buddy":true,"byMemberLevel":true,"authMemberLevelId":0,"authBuddyGroupIdList":[],"tipsName":"系统栏目(购物车)","check":false},{"parentId":0,"name":"会员注册","other":{},"url":"/signup.jsp","id":17,"type":17,"openCusUrl":false,"all":true,"buddy":true,"byMemberLevel":true,"authMemberLevelId":0,"authBuddyGroupIdList":[],"tipsName":"系统栏目(会员注册)","check":false},{"parentId":0,"name":"会员登录","other":{},"url":"/login.jsp","id":18,"type":18,"openCusUrl":false,"all":true,"buddy":true,"byMemberLevel":true,"authMemberLevelId":0,"authBuddyGroupIdList":[],"tipsName":"系统栏目(会员登录)","check":false},{"parentId":0,"name":"新闻动态","other":{},"url":"/nr.jsp","id":21,"type":21,"openCusUrl":false,"all":true,"buddy":true,"byMemberLevel":true,"authMemberLevelId":0,"authBuddyGroupIdList":[],"tipsName":"系统栏目(文章列表)","check":false},{"parentId":0,"name":"合作企业","other":{"title":""},"url":"/col.jsp?id=114","id":114,"type":1,"openCusUrl":false,"all":true,"buddy":true,"byMemberLevel":true,"authMemberLevelId":0,"authBuddyGroupIdList":[],"tipsName":"自定义栏目","check":false},{"parentId":0,"name":"我们的服务","other":{"title":""},"url":"/col.jsp?id=103","id":103,"type":1,"openCusUrl":false,"all":true,"buddy":true,"byMemberLevel":true,"authMemberLevelId":0,"authBuddyGroupIdList":[],"tipsName":"自定义栏目","check":false}];
var buddyGroup = [];
var allPerResult = {};
var siteColNameMax = 50;
var closeGroupOption = true;
var memberLevel = [{"aid":7570029,"wid":0,"id":0,"name":"普通会员","discount":100,"needItg":0},{"aid":7570029,"wid":0,"id":1,"name":"黄金会员","discount":100,"needItg":0},{"aid":7570029,"wid":0,"id":2,"name":"白金会员","discount":100,"needItg":0},{"aid":7570029,"wid":0,"id":3,"name":"钻石会员","discount":100,"needItg":0}];
var hiddenChildrenMap = {};
var popupID = <%=popupID%>;

var editor = null;
$(function(){	
	Fai.addPopupWindowBtn(popupID, {id:'save', extClass:'saveButton', text:'保 存', click:save});
	Fai.addPopupWindowBtn(popupID, {id:'close', extClass:'cancelButton', text:'取 消', click:'close'});
	
	$('#tabs').tabs({ selected:0 });
	
	printColList();
	$("#navForm").focus();
	initCheck();
	
	var defaultOtions = {
		ueditorId : 'content',
		setPageChange : setPageChange,
		initContent : "<p style=\"line-height:normal;\"><font face=\"Arial\"><br /><\/font><\/p><p><font face=\"Arial\">©<\/font>2015 广告创意 版权所有<\/p><p style=\"line-height:2.5em;\"><br /><\/p><p>友情链接：<a href=\"http://www.baidu.com\" target=\"_blank\" title=\"百度\" _t=\"103\" _i=\"http://www.baidu.com\" _n=\"www.baidu.com\" style=\"text-decoration:none;\">百度<\/a>| <a href=\"http://www.google.cn\" target=\"_blank\" title=\"谷歌\" _t=\"103\" _i=\"http://www.google.cn\" _n=\"www.google.cn\" style=\"text-decoration:none;\">谷歌<\/a>|<span style=\"line-height:21px;\"> 品牌设计| 平面设计| 活动策划| 展厅设计<\/span><\/p><p><br /><\/p>",
		imageExtends : true,
		minFrameHeight : 240,
		wordCount : true, //是否显示输入文字计算显示
		maximumWords : 10000, //输入的文字最大限制
		faiscoRichTip : null,
		fixUrl : true,
		swfuploadSrc : '${ctx_web}/js/comm/SWFUpload2v/swfupload.min.js?v=201512281739',
		withPage : null,
		fontfamily : [{"first":"SimSun","second":"宋体"},{"first":"PMingLiU","second":"新细明体"},{"first":"FangSong_GB2312","second":"仿宋_GB2312"},{"first":"微软雅黑","second":"微软雅黑"},{"first":"隶书","second":"隶书"},{"first":"幼圆","second":"幼圆"},{"first":"STKaiti","second":"华文楷体"},{"first":"方正舒体","second":"方正舒体"},{"first":"华文彩云","second":"华文彩云"},{"first":"华文行楷","second":"华文行楷"},{"first":"华文宋体","second":"华文宋体"},{"first":"楷体,楷体_GB2312, SimKai","second":"楷体"},{"first":"黑体, SimHei","second":"黑体"},{"first":"Arial","second":"Arial"},{"first":"Tahoma","second":"Tahoma"},{"first":"impact","second":"impact"},{"first":"Arial Serif","second":"Arial Serif"},{"first":"Georgia","second":"Georgia"},{"first":"Garamond","second":"Garamond"},{"first":"Times New Roman","second":"Times New Roman"},{"first":"andale mono","second":"andale mono"},{"first":"arial black,avant garde","second":"arial black"},{"first":"comic sans ms","second":"comic sans ms"}],
		outerFunction : {
			footerHrFunction : function(){
				return " _newfkhr=\'1\' "; // 2015-12-30记录用户更新分割线，使用新的对齐模式, footerInfo div去除float属性
			}
		}
	};
	editor = Site.renderUEditor(defaultOtions, popupID);
	
	//页面加载完后再执行，必须放在在页面加载尾，判断页面内容是否发生改变
	Site.loadPageChange({unBindId:[],popupID:popupID});
});
function save(){
	if(editor.getContentTxt().length > 10000){
		Fai.ing("您输入的内容超过字数限制，请裁剪后再保存。");
		return;
	}
	var name = editor.getContent();
	var params = 'info=' + Fai.encodeUrl(name);
	if( $('#loginHidden').attr('checked') ){
		params += '&flag256=true';
	}else{
		params += '&flag256=false';
	}
	if( $('#mobileHidden').attr('checked') ){
		params += '&flag32768=true';
	}else{
		params += '&flag32768=false';
	}
	$.ajax({
		type: 'post',
		url: '../ajax/footer_h.jsp?cmd=setInfo',
		data: params,
		success: function(result){
			reSetPageChange();
			Fai.successHandle( result , '' , '' , '' , 3 , 1 );	
			//Fai.successHandle( result , '' , '' , top.location.href , 1 , 1 );	
		}
	});
	
	//底部栏目
	Site.enablePopupFrameBtn(frame, popupID, 'save', false);
	Fai.ing("正在保存栏目信息……", false);
	var sortable = $("#sortable > li");
	var orderList = new Array();
	var mdList = new Array();
	$.each(sortable, function(i, n){
		var tmpid = parseInt($(this).attr("id"));
		var newThisData = allPerResult["perData"+ tmpid ];
		orderList.push( tmpid );
		var obj1 = {
			id: tmpid,
			hidden: $(this).find(".itemOpenIco").first().hasClass("checked_off")
		};
		if(newThisData!=null){
			obj1["name"] = newThisData.name;
			obj1.other = newThisData.other;
			obj1.footParentId = newThisData.parentId;
			obj1.openCusUrl = newThisData.openCusUrl;
			obj1.url = newThisData.url;		
			obj1.all = newThisData.all;
			obj1.buddy = newThisData.buddy;
			obj1.authBuddyGroupIdList = newThisData.authBuddyGroupIdList;
			obj1.authMemberLevelId = newThisData.authMemberLevelId;
			obj1.byMemberLevel = newThisData.byMemberLevel;
		}
		
		mdList.push(obj1);
		
		var parentId = $(this).attr("id");
		//加入二级导航
		$.each($(this).children("ul").children("li"), function(i, n){
			var tmpid2 = parseInt($(this).attr("id").replace("childDivItem", ""));
			var newThisData2 = allPerResult["perData"+tmpid2];
			orderList.push( tmpid2 );
			var obj2 = {
				id: tmpid2,
				hidden: $(this).find(".itemOpenIco").first().hasClass("checked_off")
			};
			if(newThisData2!=null){
				obj2["name"] = newThisData2.name;
				obj2.other = newThisData2.other;
				obj2.footParentId = newThisData2.parentId;
				obj2.openCusUrl = newThisData2.openCusUrl;
				obj2.url = newThisData2.url;		
				obj2.all = newThisData2.all;
				obj2.buddy = newThisData2.buddy;
				obj2.authBuddyGroupIdList = newThisData2.authBuddyGroupIdList;
				obj2.authMemberLevelId = newThisData2.authMemberLevelId;
				obj2.byMemberLevel = newThisData2.byMemberLevel;
			}
			mdList.push(obj2);
			
		});
	});
	var orderListJson = $.toJSON(orderList);
	var mdListJson = $.toJSON(mdList);
	
	//取被删除的栏目的ID
	var rmIdList = arrDeletedID;
	var rmListJson = $.toJSON(rmIdList);
	var params = "ot=2&order=" + Fai.encodeUrl(orderListJson) + "&mdList=" + Fai.encodeUrl(mdListJson)+ "&rmList=" + Fai.encodeUrl(rmListJson);

	//保存数据
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
						Fai.top._frameChanged++;
						reSetPageChange();
						document.location.reload();
					}
				} else {
					reSetPageChange();
					Fai.successHandle(result, "保存成功", "系统错误", top.location.href, 1, 1);
				}
			}
	});
}

function initCheck(){
	$('#loginHidden').click(function(){
		$('#loginHideMsg').show();
	});
	$('#loginShow').click(function(){
		$('#loginHideMsg').hide();
	})
	$('#supportShow').click();$('#supportHidden').attr('disabled', true);$('#supportShow').attr('disabled', true);$('#loginShow').click();$('#mobileShow').click();
}

function cancel() {
	document.location.reload();
}

//droppable
function droppable()
{
	$("#sortable > li > dl, #sortable > li > .sibling-dropzone, .secondLevel > li > .sibling-dropzone, .secondLevel > li > dl,.thirdLevel > li > .sibling-dropzone, .tail-dropzone").droppable({
        accept: '#sortable li',
	   	tolerance : 'pointer',
        drop: function(e, ui) {
			// ui.draggable   被拖动的li
			var id = parseInt( ui.draggable.attr("colId") );
			
			var draggableLi;
			if( $(this).hasClass('tail-dropzone') ){
				//拖拽到尾部
				for( var i = tmpDataList.length - 1; i >= 0 ; i -- ){
					var tmp_data = tmpDataList[i];
					if( parseInt(tmp_data.id) === id ){
						draggableLi = tmpDataList.splice( i, 1 )[0];
						break;
					}
				}
				if( draggableLi ){
					draggableLi.parentId = 0;
					var editedData = allPerResult[ "perData" + draggableLi.id ];
					if( editedData ){
						editedData = $.extend( editedData ,draggableLi );
						allPerResult[ "perData" + draggableLi.id ] = editedData;
					}else{
						allPerResult[ "perData" + draggableLi.id ] = draggableLi;
					}
					tmpDataList.splice( tmpDataList.length, 0, draggableLi );
				}
			}else{
				//$(this).parent();  被放置在该li里或是被放置的li的前面
				var li = $(this).parent();
				var brother = $(this).hasClass('sibling-dropzone');//放在兄弟区域
				var liid = parseInt( li.attr("id") );
				
				var finalParentId = liid;
				for( var i = tmpDataList.length - 1; i >= 0 ; i -- ){
					var tmp_data = tmpDataList[i];
					if( parseInt(tmp_data.id) === id ){
						draggableLi = tmpDataList.splice( i, 1 )[0];
						break;
					}
				}
				
				var finalIndex = 0;
				for( var i = tmpDataList.length - 1; i >= 0 ; i -- ){
					var tmp_data = tmpDataList[i];
					if( tmp_data.id === liid ){
						finalIndex = i + 1;
						if( brother ){
							finalIndex = i;
							finalParentId = tmp_data.parentId;
						}
						
					}
				}
				
				draggableLi.parentId = finalParentId;
				
				//再在正确的位置插入新的draggableLi data数据
				tmpDataList.splice( finalIndex, 0, draggableLi );
				
				var editedData = allPerResult[ "perData" + draggableLi.id ];
				if( editedData ){
					editedData = $.extend( editedData ,draggableLi );
					allPerResult[ "perData" + draggableLi.id ] = editedData;
				}else{
					allPerResult[ "perData" + draggableLi.id ] = draggableLi;
				}
			}
			
		},
		deactivate:function(){
		},
        over: function(e, ui) {
			var draHeight = ui.draggable.height()*0.8;
			var thisHeight = $(this).height();
			if($(this).hasClass("dl")){
				if(!$(this).parents().hasClass("secondLevel")){
					var colId = $(this).parent().attr( "colId" );
					$("#libuttom" + colId ).css({ "backgroundColor" : '#ccc', "height" : draHeight });
				}
			}else{
				$(this).css({ "backgroundColor" : '#ccc', "height" : draHeight });
			}
        },
        out: function(e, ui) {
			if($(this).hasClass("dl")){
				if(!$(this).parents().hasClass("secondLevel")){
					var colId = $(this).parent().attr( "colId" );
					$("#libuttom" + colId ).css({ "backgroundColor": '', "height" : "0px" });
				}
			}else{
				var draHeight = ui.draggable.height()*0.8;
				var thisHeight = $(this).height();
				$(this).css({ "backgroundColor": '', "height" : "6px" });
			}
        }
	});
}
function refreshAddIcon(){
	var container = $("#sortable");
	var dl = container.find("dl");
	$(dl).each(function(index, element) {
        var level = $(this).parents("ul").attr("class");
		var itemId = parseInt($(this).attr("id").substring(4));
		var isOpen = $("#checkbox"+itemId).hasClass("checked_on"); 
		if(level !== "secondLevel" && isOpen){
			$("<div class='addColIcon' title='点击添加栏目' onclick='addNavCol("+ itemId +");'></div>").insertAfter(this);
		}
    });
	$(".addColIcon").hover(
		function(){
			$(this).addClass("addColIcon-Hover");
		},
		function(){
			$(this).removeClass("addColIcon-Hover");
		}
	);
}
//draggable
function draggable()
{
	$("#sortable li").draggable({
        handle: ' > dl',
        opacity: 0.8,
        addClasses: false,
        helper: 'clone',
        zIndex: 100,
		/*axis: "y",*/

		beforeStart: function(){
		/**	if($(this).find(".thirdLevel > li").length)
			{
				$(this).find(".mark").addClass("arrowLeft");
				$(this).find(".thirdLevel").css("display", "none");
			}*/
		},
		stop: function(){
			setTimeout( function(){
				printColList();
			}, 1 );
			Site.logDog( 100055, 2);
			//激活保存按钮
			Site.enablePopupFrameBtn(frame, popupID, 'save', true);
			setPageChange();
		}
	});
	$("#sortable").disableSelection();
}

//标识一级栏目
function markFirstLevel(id, parentID)
{
	var liList = $(".firstLevel > li");
	$.each(liList, function(i, n){
		var li = $(this);
		var ulList = $(this).children("ul");
		if(ulList.length > 0)
		{
			$(li).find(">dl .mark").removeClass("arrow");
			$.each(ulList, function(i, n){
				if($(this).children("li").length > 0)//有二级菜单
				{
					$.each($(this).children("li"), function(i, n){
						if($(this).parent().parent().attr("id") != parentID){
							//如果不在原来的父亲下面，有二级菜单都添加arrow
							$(li).find(">dl .mark").addClass("arrow");
						}else{
							if($(this).attr("id") != id){
								//因为drop是在鼠标放开后执行，这时候拖拽的dl对象还在原来的li里面，所以会计算错误，误认为原来的父亲还有儿子
								//如果原来父亲的儿子的id != 拖拽对象的id，则认为他还有儿子
								$(li).find(">dl .mark").addClass("arrow");
							}
						}
						if( hiddenChildrenMap[ $(li).attr("colId") ] === "hidden" ){
							//收起子栏目
							$(li).find(">dl .mark").addClass("arrowLeft").removeClass("arrow");
							$(li).find(".secondLevel").css("display", "none");
						}
					});
				}
			});
		}
	});
}

function hiddenChildren(e){
	var colId = parseInt( $(e).parent().parent().attr("colId") );
	if($(e).parent().parent().children('ul').find(" > li").length > 0){
		if($(e).hasClass("arrowLeft")){
			//展开
			$(e).removeClass("arrowLeft").addClass("arrow");
			$(e).parent().parent().find(".secondLevel").css("display", "block");
			if( !isNaN( colId ) ){
				hiddenChildrenMap[ colId ] = 'undefined';
			}
		}else{
			//收起
			$(e).addClass("arrowLeft").removeClass("arrow");
			$(e).parent().parent().find(".secondLevel").css("display", "none");
			if( !isNaN( colId ) ){
				hiddenChildrenMap[colId] = "hidden";
			}
		}
	}
}

function hiddenClick(e, id, lineid){
	if($(e).hasClass("checked_on")){
		/*if( id === 2 ){
			return;
		}*/
		$(e).removeClass("checked_on").addClass("checked_off").attr('title','点击开启栏目');
		$("#"+lineid).find(".itemOpenIco").removeClass("checked_on").addClass("checked_off").attr('title','点击开启栏目');
		$.each( tmpDataList, function( index, data ){
			if( data.id === parseInt( lineid ) ){
				data.check = false;
				return false;
			}
		});
	}else if($(e).hasClass("checked_off")){
		$(e).removeClass("checked_off").addClass("checked_on").attr('title','点击隐藏栏目');
		$("#"+lineid).find(".itemOpenIco").removeClass("checked_off").addClass("checked_on").attr('title','点击隐藏栏目');
		$.each( tmpDataList, function( index, data ){
			if( data.id === parseInt( lineid ) ){
				data.check = true;
				return false;
			}
		});
	}
	Site.enablePopupFrameBtn(frame, popupID, 'save', true);
	setPageChange();
	changedItemID = Fai.addArrElementsNoRepeat(changedItemID, id);
	printColList();
}

function onDel(id){
	if(confirm("确定要删除此栏目？")){
		arrDeletedID[arrDeletedID.length] = id;
		
		var deleteId = -1;
		var deleteParentId = -1;
		
		for( var i = tmpDataList.length - 1; i >= 0; i -- ){
			deleteId = tmpDataList[i].id;
			deleteParentId = tmpDataList[i].parentId;
			if( tmpDataList[i].id === id ){
				tmpDataList.splice( i, 1 );
				break;
			}
		}
		
		if( deleteId >= 0 && deleteParentId >= 0 ){
			$.each( tmpDataList, function( i, data ){
				if( data.parentId === deleteId ){
					data.parentId = deleteParentId;
					
					var editedData = allPerResult[ "perData" + data.id ];
					if( editedData ){
						editedData = $.extend( editedData, data );
						allPerResult[ "perData" + data.id ] = editedData;
					}else{
						allPerResult[ "perData" + data.id ] = data;
					}
				}
			});
		}
		
		printColList();
		Site.enablePopupFrameBtn(frame, popupID, 'save', true);
		setPageChange();
	}
}

//新窗口查看网址
function viewUrl(id){
	var url = "";
	$.each( tmpDataList, function( i, data ){
		if( data.id === parseInt( id ) ){
			if( data.openCusUrl ){
				if( data.jumpType != 103 ){
					url = "/";
				}
				if( data.jumpUrl == null ){
					url = "/col.jsp?id=" + id;		
				} else {
					url += data.jumpUrl;
				}
			} else {
				url = data.url;
			}
			return false;
		}
	});
	
	if( url != "" ){
		window.open(url);
	}
}

function closeAdd( bak ){
	if( bak ){
		tmpDataList.push( bak );
		printColList();
		setPageChange();
	}
}

function closeEdit( bak ){
	if( !bak ){
		return;
	}
	var parentIdChange = false;
	var openCusUrlChange = false;
	
	var tmpDataListLen = tmpDataList.length;
	for( var i = 0; i < tmpDataListLen; i ++ ){
		var tmpData = tmpDataList[i];
		if(tmpData.id == bak.id){
			if( tmpData.parentId !== bak.parentId ){
				parentIdChange = true;
			}
			if( bak.type === 1 ){
				if( tmpData.openCusUrl !== bak.openCusUrl || tmpData.url !== bak.url ){
					openCusUrlChange = true;
				}
			}else{
				bak.url = undefined;
			}
			
			tmpData = $.extend( true, tmpData, bak );
			tmpDataList[i] = tmpData ;
			break;
		}
	}
	var editedData = allPerResult[ "perData" + bak.id ];
	if( editedData ){
		editedData = $.extend( editedData ,bak );
		allPerResult[ "perData" + bak.id ] = editedData;
	}else{
		allPerResult[ "perData" + bak.id ] = bak;
	}
	
	printColList();
	setPageChange();
}

function getLiHtmlStr( updateCol ){
	var opStr = [];
	if ( updateCol.openCusUrl ){
		opStr.push('<a id="editButton' + updateCol.id + '" class="linkButton" onClick="popupProp(' + updateCol.id + ');" >[编辑]</a>');
		opStr.push('&nbsp;<a id="designOrView' + updateCol.id + '" class="linkButton" href="javascript:;" onclick="viewUrl(' + updateCol.id + ');return false;">[查看]</a>');
	} else {
		opStr.push('<a id="editButton' + updateCol.id + '" class="linkButton" onClick="popupProp(' + updateCol.id + ');" >[编辑]</a>');
		opStr.push('&nbsp;<a id="designOrView' + updateCol.id + '" class="linkButton" href="' + updateCol.url + '" target="_blank">[设计]</a>');
	}
	
	if( updateCol.type === 1 || updateCol.type === 3 || updateCol.type === 4 ){
		opStr.push('<a href="javascript:;" class="linkButton" onclick="onDel(' + updateCol.id + ');return false;">&nbsp;[删除]</a>');
	}
	
	var ulstr = "";
	
	var is1 = false;
	var is2 = false;
	var is3 = false;
	if( updateCol.parentId === 0 ){
		is1 = true;
	}
	$.each( tmpDataList, function( i, data ){
		if( data.parentId === updateCol.id ){
			ulstr += getLiHtmlStr( data );
			//此为二级栏目
			is2 = true;
		}
	});
	if( !is1 && !is2 ){
		//非一级栏目 且非二级栏目则为三级栏目
		is3 = true;
	}
	
	if( $.trim( ulstr ).length > 0 ){
		if( is1 ){
			ulstr = '<ul id="childDiv'+ updateCol.id +'" class="secondLevel">' + ulstr + '</ul>';
		}else if( is2 ){
			ulstr = '<ul id="childDiv'+ updateCol.id +'" class="thirdLevel">' + ulstr + '</ul>';
		}
	}
	if( is3 ){
		ulstr = "";
	}
	
	var moveup = true;
	var movedown = true;
	var tmpDataIndex = $.inArray( updateCol, tmpDataList );
	if( tmpDataIndex <= 0 ){
		moveup = false;
	}else if( tmpDataIndex >= tmpDataList.length -1 ){
		movedown = false;
	}
	var tmpObj = { "colId" : updateCol.id, "pId" : updateCol.parentId, "check" : updateCol.check };
	var moveStr = [];
	moveStr.push( '<div class="moveOpDiv" style="display:none;">' );
	if( moveColStat( tmpObj, "up" ) ){
		moveStr.push( '<a colId="' + updateCol.id + '" pId="' + updateCol.parentId + '" onclick="moveCol(this,\'up\');return false;" href="javascript:;" hidefocus="true" title="上移" class="col-up"></a>' );
	}else{
		moveStr.push( '<a onclick="return false;" href="javascript:;" hidefocus="true" class="col-up" style="cursor:default;background:none;" ></a>' );
	}
	if( moveColStat( tmpObj, "down" ) ){
		moveStr.push( '<a colId="' + updateCol.id + '" pId="' + updateCol.parentId + '" onclick="moveCol(this,\'down\');return false;" href="javascript:;" hidefocus="true" title="下移" class="col-down"></a>' );
	}else{
		moveStr.push( '<a onclick="return false;" href="javascript:;" hidefocus="true" class="col-up" style="cursor:default;background:none;" ></a>' );
	}
	if( moveColStat( tmpObj, "left" ) ){
		moveStr.push( '<a colId="' + updateCol.id + '" pId="' + updateCol.parentId + '" onclick="moveCol(this,\'left\');return false;" href="javascript:;" hidefocus="true" title="左移" class="col-left"></a>' );
	}else{
		moveStr.push( '<a onclick="return false;" href="javascript:;" hidefocus="true" class="col-left" style="cursor:default;background:none;" ></a>' );
	}
	if( moveColStat( tmpObj, "right" ) ){
		moveStr.push( '<a colId="' + updateCol.id + '" pId="' + updateCol.parentId + '" onclick="moveCol(this,\'right\');return false;" href="javascript:;" hidefocus="true" title="右移" class="col-right"></a>' );
	}else{
		moveStr.push( '<a onclick="return false;" href="javascript:;" hidefocus="true" class="col-left" style="cursor:default;background:none;" ></a>' );
	}
	moveStr.push( '</div>' );

	var hiddentitle = updateCol.check ? "点击隐藏栏目" : "点击开启栏目";
	if( updateCol.id === 2 ){
		hiddentitle = "首页不可隐藏";
	}
	var htmlstrs = [
		//用colId来传递id,存在id上的话   在ie6下会有BUG。 一级栏目（有子栏目的情况下）拖拽时会拿不到id  $().attr("id") element.attribute 也拿不到
		'<li id="' + updateCol.id + '" colId="' + updateCol.id + '" >',
			'<div class="sibling-dropzone"></div>',
			'<dl id="part' + updateCol.id + '" class="dl">',
				'<div id="li' + updateCol.id + '" class="mark" onclick="hiddenChildren(this)">&nbsp;</div>',
				'<div id="editableDiv' + updateCol.id + '" class="itemName" >',
					'<div id="col'+ updateCol.id +'" class=" ellipsis noWrap" style="width:80%;" >' + Fai.encodeHtml( updateCol.name ) + '</div>',
				'</div>',
				'<div style="width:80px; height:27px; float:left;padding: 0px 2px;">',
					moveStr.join(""),
				'</div>',
				'<div class="itemType" title="按住鼠标可拖动栏目进行排序"><span>' + updateCol.tipsName + '</span></div>',
				'<div class="itemOpen">',
					'<span class="itemOpenIco ' + (updateCol.check ? "checked_on" : "checked_off") + '" id="checkbox' + updateCol.id + '" onclick="hiddenClick(this, ' + updateCol.id +', ' + updateCol.id + ');" title="' + hiddentitle + '"></span>',
				'</div>',
				'<div class="itemManage">',
					'<div class="manageItem">',
						opStr.join(""),
					'</div>',
				'</div>',
			'</dl>',
			'<div id="libuttom' + updateCol.id + '" class="child-pre-div" style="margin-left:20px; margin-top:0px;" >',
			'</div>',
			ulstr,
		'</li>'
		];
	return htmlstrs.join("");
}

function moveCol( e, type ){
	Site.logDog( 100055, 1);
	var colId = parseInt( $(e).attr( "colId" ) );
	var parentId = parseInt( $(e).attr( "pId" ) );
	var colData = {};
	var parentData = {};
	var siblingsArray = [];
	var idPidMap = {};
	$.each( tmpDataList, function( i, data ){
		var tmpData = { "index" : i, "data" : data };
		if( data.parentId === parentId ){
			siblingsArray.push( tmpData );
		}
		if( data.id === colId ){
			colData = tmpData;
		}
		idPidMap[ data.id ] = data.parentId;
	});
	
	if( type === "up" ){
		//上移
		if( siblingsArray.length <= 1 ){
			return;
		}
		var siblingsIndex = $.inArray( colData, siblingsArray );
		if( siblingsIndex <= 0 ){
			return;
		}
		
		var preColIndex = siblingsArray[ siblingsIndex - 1 ].index;
		var movedData = tmpDataList.splice( colData.index, 1 )[0];
		tmpDataList.splice( preColIndex, 0, movedData );
		setPageChange();
		printColList();
	}else if( type === "down" ){
		//下移
		if( siblingsArray.length <= 1 ){
			return;
		}
		var siblingsIndex = $.inArray( colData, siblingsArray );
		if( siblingsIndex < 0 || siblingsIndex === siblingsArray.length - 1 ){
			return;
		}
		var nextColIndex = siblingsArray[ siblingsIndex + 1 ].index;
		var movedData = tmpDataList.splice( nextColIndex, 1 )[0];
		tmpDataList.splice( colData.index, 0, movedData );
		setPageChange();
		printColList();
	}else if( type === "left" ){
		//左移
		if( colData.data.parentId === 0 ){
			return;
		}
		colData.data.parentId = idPidMap[ colData.data.parentId ];
		var editedData = allPerResult[ "perData" + colData.data.id ];
		if( editedData ){
			editedData = $.extend( editedData , colData.data );
			allPerResult[ "perData" + colData.data.id ] = editedData;
		}else{
			allPerResult[ "perData" + colData.data.id ] = colData.data;
		}
		setPageChange();
		printColList();
	}else if( type === "right" ){
		//右移
		if( siblingsArray.length <= 1 ){
			return;
		}
		var siblingsIndex = $.inArray( colData, siblingsArray );
		if( siblingsIndex <= 0 ){
			//同级中的第一个不允许右移
			return;
		}
		if( colData.data.parentId !== 0 ){
			//二级栏目
				return;
		}
		colData.data.parentId = siblingsArray[ siblingsIndex - 1 ].data.id;
		var editedData = allPerResult[ "perData" + colData.data.id ];
		if( editedData ){
			editedData = $.extend( editedData , colData.data );
			allPerResult[ "perData" + colData.data.id ] = editedData;
		}else{
			allPerResult[ "perData" + colData.data.id ] = colData.data;
		}
		setPageChange();
		printColList();
	}
}


function moveColStat( obj, type ){
	if( !obj.check ){
		return false;
	}
	var colId = parseInt( obj.colId );
	var parentId = parseInt( obj.pId );
	var colData = {};
	var parentData = {};
	var siblingsArray = [];
	var idPidMap = {};
	$.each( tmpDataList, function( i, data ){
		if( !data.check ){
			return true;
		}
		var tmpData = { "index" : i, "data" : data };
		if( data.parentId === parentId ){
			siblingsArray.push( tmpData );
		}
		if( data.id === colId ){
			colData = tmpData;
		}
		idPidMap[ data.id ] = data.parentId;
	});
	
	if( type === "up" ){
		//上移
		if( siblingsArray.length <= 1 ){
			return false;
		}
		var siblingsIndex = $.inArray( colData, siblingsArray );
		if( siblingsIndex <= 0 ){
			return false;
		}
		return true;
	}else if( type === "down" ){
		//下移
		if( siblingsArray.length <= 1 ){
			return false;
		}
		var siblingsIndex = $.inArray( colData, siblingsArray );
		if( siblingsIndex < 0 || siblingsIndex === siblingsArray.length - 1 ){
			return false;
		}
		return true;
	}else if( type === "left" ){
		//左移
		if( colData.data.parentId === 0 ){
			return false;
		}
		return true;
	}else if( type === "right" ){
		//右移
		if( siblingsArray.length <= 1 ){
			return false;
		}
		var siblingsIndex = $.inArray( colData, siblingsArray );
		if( siblingsIndex <= 0 ){
			//同级中的第一个不允许右移
			return false;
		}
		if( colData.data.parentId !== 0 ){
			//二级栏目不允许右移
				return false;
		}
		return true;
	}
}


function printColList(){
	//隐藏的一级栏目
	var hiddenACol = {};
	//一级栏目
	var aCol = {};
	//二、三级栏目
	var bcCol = {};
	$.each( tmpDataList, function( i, data ){
		if( data.parentId === 0 ){
			if( !data.check ){
				hiddenACol[data.id] = data;
				return true;
			}
			aCol[data.id] = data;
		}else{
			bcCol[data.id] = data;
		}
	});
	
	//将四五级栏目变更回三级栏目
	{
		var bCol={};
		$.each( bcCol, function( i, data ){
			if( aCol[data.parentId] || hiddenACol[data.parentId] ){
				//父栏目为一级栏目 则为二级栏目
				bCol[data.id] = data;
				bcCol[data.id] = null;
			}
		});
		$.each( bcCol, function( i, data ){
			if( data === null ){
				return true;
			}
			if(bCol[data.parentId]){
				//是三级栏目，则修改为二级栏目
				data.parentId = bCol[data.parentId].parentId;
				bCol[data.id] = data;
				bcCol[data.id] = null;
				
				//更新 allPerResult
				var editedData = allPerResult[ "perData" + data.id ];
				if( editedData ){
					editedData = $.extend( editedData ,data );
					allPerResult[ "perData" + data.id ] = editedData;
				}else{
					allPerResult[ "perData" + data.id ] = data;
				}
			}
			if( !bCol[data.parentId] && !bCol[data.id] ){
				//父栏目不为二级栏目且自己也不是二级栏目，则不是三级栏目了  所以要变更为一级栏目
				data.parentId = 0;
				aCol[data.id] = data;
				bCol[data.id] = null;
				bCol[data.id] = null;
				$.each( tmpDataList, function( _i, _data ){
					if( _data.id === data.id ){
						_data.parentId = 0;
						_data.check = false;
						return false;
					}
				});
				
				//更新 allPerResult
				var editedData = allPerResult[ "perData" + data.id ];
				if( editedData ){
					editedData = $.extend( editedData ,data );
					allPerResult[ "perData" + data.id ] = editedData;
				}else{
					allPerResult[ "perData" + data.id ] = data;
				}
			}
		});
	}
	
	
	var sortableHtml = "";
	var sortableHiddenAcolHtml = "";
	$.each( tmpDataList , function( i, data ){
		//按顺序输出一级栏目 及未开启的一级栏目
		if( aCol[ data.id ] ){
			sortableHtml += getLiHtmlStr( data );
		}else if( hiddenACol[ data.id ] ){
			sortableHiddenAcolHtml += getLiHtmlStr( data );
		}
	});
	
	sortableHtml += sortableHiddenAcolHtml;
	sortableHtml += '<div class="tail-dropzone"></div><div class="tail-dropzone"></div>';
	
	$("#sortable").html("").append( sortableHtml );
	
	droppable();
	draggable();
	markFirstLevel('', '');//标识一级栏目
	// 刷新页面记数
	$('#totalCount').text( $('#navList').find('div.itemName').length );
	$("#sortable > li, .secondLevel > li, .secondLevel > li").find("dl").hover( function(e){
		$($(this).find(".moveOpDiv")[0]).show();
	} ).mousemove(function(e){
		$($(this).find(".moveOpDiv")[0]).show();
	}).mouseout(function(e){
		$($(this).find(".moveOpDiv")[0]).hide();
	});
	
	refreshAddIcon();
}

//控制打开窗口
function popupProp(id){
	var editedData = {};
	$(tmpDataList).each(function(i,data){
		if(data.id == id){
			editedData = $.extend( true, editedData, data );
			return false;
		}
	});
	editedData.colList = $.extend( true, [], tmpDataList );
	Site.popupWindow({ title:'编辑栏目', frameSrcUrl:'${ctx_web}/manage/colEdit.jsp?orderType=2&id=' + id +'&model=jsEdit', width:425, height:240, callArgs:editedData, closeFunc: closeEdit});
}

function addNavCol(parentId){
	Site.logDog( 100055, 0 );
	var editedData = {};
	editedData.colList = $.extend( true, [], tmpDataList );
	Site.popupWindow({ title:'添加栏目', frameSrcUrl:'${ctx_web}/manage/colEdit.jsp?orderType=2&model=jsAdd&parentId='+parentId, width:425, height:240, /*callArgs:editedData,*/ closeFunc: closeAdd});
}

//页面值改变
function setPageChange(){
	Site.setPageChange(true,popupID);	
}
//保存时reset
function reSetPageChange(){
	Site.setPageChange(false,popupID);	
}
</script>
</head>
<body style="cursor: auto;" class="popupTabBody">
	<div class="ui-tabs ui-widget ui-widget-content ui-corner-all"
		id="tabs">
		<ul
			class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all">
			<li
				class="ui-state-default ui-corner-top ui-tabs-selected ui-state-active"><a
				href="#navFormSetting">栏目内容</a></li>
			<li class="ui-state-default ui-corner-top"><a
				href="#basicSetting">版权信息</a></li>
			<li class="ui-state-default ui-corner-top"><a
				href="#advancedSetting">高级</a></li>
		</ul>
		<div class="ui-tabs-panel ui-widget-content ui-corner-bottom"
			id="navFormSetting">
			<div id="navForm"
				style="float: left; width: 99%; border: 0px solid #000; margin: 0; padding: 0;">
				<div style="float: right; margin: 1px 0px;">
					<input value="添加栏目" class="faiButton" onclick="addNavCol();"
						type="button">
				</div>
				<div id="navList" class="list"
					style="margin: 2px 0px; border-left: 1px solid #B5C8EB; border-right: 1px solid #B5C8EB; overflow-x: hidden;">
					<div class="listBanner">
						<ul>
							<li style="width: 15px;"></li>
							<li style="width: 165px;"><span>栏目名称</span></li>
							<li style="width: 80px;"><span></span></li>
							<li style="width: 120px;"><span>栏目类型</span></li>
							<li style="width: 60px;"><span>开启栏目</span></li>
							<li style="width: 165px; float: left; text-align: center;"><span>操作</span></li>
						</ul>
					</div>
					<div
						style="clear: both; position: relative; width: 100%; overflow-x: hidden; height: 362px; overflow-y: auto;">
						<ul id="sortable" class="firstLevel">
							<li id="2" colid="2"><div
									class="sibling-dropzone ui-droppable"></div>
								<dl id="part2" class="dl ui-droppable">
									<div id="li2" class="mark" onclick="hiddenChildren(this)">&nbsp;</div>
									<div id="editableDiv2" class="itemName">
										<div id="col2" class=" ellipsis noWrap" style="width: 80%;">首页</div>
									</div>
									<div
										style="width: 80px; height: 27px; float: left; padding: 0px 2px;">
										<div class="moveOpDiv" style="display: none;">
											<a onclick="return false;" href="javascript:;"
												hidefocus="true" class="col-up"
												style="cursor: default; background: none;"></a><a colid="2"
												pid="0" onclick="moveCol(this,'down');return false;"
												href="javascript:;" hidefocus="true" title="下移"
												class="col-down"></a><a onclick="return false;"
												href="javascript:;" hidefocus="true" class="col-left"
												style="cursor: default; background: none;"></a><a
												onclick="return false;" href="javascript:;" hidefocus="true"
												class="col-left" style="cursor: default; background: none;"></a>
										</div>
									</div>
									<div class="itemType" title="按住鼠标可拖动栏目进行排序">
										<span>系统栏目(首页)</span>
									</div>
									<div class="itemOpen">
										<span class="itemOpenIco checked_on" id="checkbox2"
											onclick="hiddenClick(this, 2, 2);" title="首页不可隐藏"></span>
									</div>
									<div class="itemManage">
										<div class="manageItem">
											<a id="editButton2" class="linkButton"
												onclick="popupProp(2);">[编辑]</a>&nbsp;<a id="designOrView2"
												class="linkButton" href="http://seeyoui.faisco.cn/index.jsp"
												target="_blank">[设计]</a>
										</div>
									</div>
								</dl>
								<div class="addColIcon" title="点击添加栏目" onclick="addNavCol(2);"></div>
								<div id="libuttom2" class="child-pre-div"
									style="margin-left: 20px; margin-top: 0px;"></div></li>
							<li id="101" colid="101"><div
									class="sibling-dropzone ui-droppable"></div>
								<dl id="part101" class="dl ui-droppable">
									<div id="li101" class="mark" onclick="hiddenChildren(this)">&nbsp;</div>
									<div id="editableDiv101" class="itemName">
										<div id="col101" class=" ellipsis noWrap" style="width: 80%;">关于我们</div>
									</div>
									<div
										style="width: 80px; height: 27px; float: left; padding: 0px 2px;">
										<div class="moveOpDiv" style="display: none;">
											<a colid="101" pid="0"
												onclick="moveCol(this,'up');return false;"
												href="javascript:;" hidefocus="true" title="上移"
												class="col-up"></a><a colid="101" pid="0"
												onclick="moveCol(this,'down');return false;"
												href="javascript:;" hidefocus="true" title="下移"
												class="col-down"></a><a onclick="return false;"
												href="javascript:;" hidefocus="true" class="col-left"
												style="cursor: default; background: none;"></a><a
												colid="101" pid="0"
												onclick="moveCol(this,'right');return false;"
												href="javascript:;" hidefocus="true" title="右移"
												class="col-right"></a>
										</div>
									</div>
									<div class="itemType" title="按住鼠标可拖动栏目进行排序">
										<span>自定义栏目</span>
									</div>
									<div class="itemOpen">
										<span class="itemOpenIco checked_on" id="checkbox101"
											onclick="hiddenClick(this, 101, 101);" title="点击隐藏栏目"></span>
									</div>
									<div class="itemManage">
										<div class="manageItem">
											<a id="editButton101" class="linkButton"
												onclick="popupProp(101);">[编辑]</a>&nbsp;<a
												id="designOrView101" class="linkButton"
												href="http://seeyoui.faisco.cn/col.jsp?id=101"
												target="_blank">[设计]</a><a href="javascript:;"
												class="linkButton" onclick="onDel(101);return false;">&nbsp;[删除]</a>
										</div>
									</div>
								</dl>
								<div class="addColIcon" title="点击添加栏目" onclick="addNavCol(101);"></div>
								<div id="libuttom101" class="child-pre-div"
									style="margin-left: 20px; margin-top: 0px;"></div></li>
							<li id="102" colid="102"><div
									class="sibling-dropzone ui-droppable"></div>
								<dl id="part102" class="dl ui-droppable">
									<div id="li102" class="mark" onclick="hiddenChildren(this)">&nbsp;</div>
									<div id="editableDiv102" class="itemName">
										<div id="col102" class=" ellipsis noWrap" style="width: 80%;">联系我们</div>
									</div>
									<div
										style="width: 80px; height: 27px; float: left; padding: 0px 2px;">
										<div class="moveOpDiv" style="display: block;">
											<a colid="102" pid="0"
												onclick="moveCol(this,'up');return false;"
												href="javascript:;" hidefocus="true" title="上移"
												class="col-up"></a><a onclick="return false;"
												href="javascript:;" hidefocus="true" class="col-up"
												style="cursor: default; background: none;"></a><a
												onclick="return false;" href="javascript:;" hidefocus="true"
												class="col-left" style="cursor: default; background: none;"></a><a
												colid="102" pid="0"
												onclick="moveCol(this,'right');return false;"
												href="javascript:;" hidefocus="true" title="右移"
												class="col-right"></a>
										</div>
									</div>
									<div class="itemType" title="按住鼠标可拖动栏目进行排序">
										<span>自定义栏目</span>
									</div>
									<div class="itemOpen">
										<span class="itemOpenIco checked_on" id="checkbox102"
											onclick="hiddenClick(this, 102, 102);" title="点击隐藏栏目"></span>
									</div>
									<div class="itemManage">
										<div class="manageItem">
											<a id="editButton102" class="linkButton"
												onclick="popupProp(102);">[编辑]</a>&nbsp;<a
												id="designOrView102" class="linkButton"
												href="http://seeyoui.faisco.cn/col.jsp?id=102"
												target="_blank">[设计]</a><a href="javascript:;"
												class="linkButton" onclick="onDel(102);return false;">&nbsp;[删除]</a>
										</div>
									</div>
								</dl>
								<div class="addColIcon" title="点击添加栏目" onclick="addNavCol(102);"></div>
								<div id="libuttom102" class="child-pre-div"
									style="margin-left: 20px; margin-top: 0px;"></div></li>
							<li id="9" colid="9"><div
									class="sibling-dropzone ui-droppable"></div>
								<dl id="part9" class="dl ui-droppable">
									<div id="li9" class="mark" onclick="hiddenChildren(this)">&nbsp;</div>
									<div id="editableDiv9" class="itemName">
										<div id="col9" class=" ellipsis noWrap" style="width: 80%;">留言板</div>
									</div>
									<div
										style="width: 80px; height: 27px; float: left; padding: 0px 2px;">
										<div class="moveOpDiv" style="display: none;">
											<a onclick="return false;" href="javascript:;"
												hidefocus="true" class="col-up"
												style="cursor: default; background: none;"></a><a
												onclick="return false;" href="javascript:;" hidefocus="true"
												class="col-up" style="cursor: default; background: none;"></a><a
												onclick="return false;" href="javascript:;" hidefocus="true"
												class="col-left" style="cursor: default; background: none;"></a><a
												onclick="return false;" href="javascript:;" hidefocus="true"
												class="col-left" style="cursor: default; background: none;"></a>
										</div>
									</div>
									<div class="itemType" title="按住鼠标可拖动栏目进行排序">
										<span>系统栏目(留言板)</span>
									</div>
									<div class="itemOpen">
										<span class="itemOpenIco checked_off" id="checkbox9"
											onclick="hiddenClick(this, 9, 9);" title="点击开启栏目"></span>
									</div>
									<div class="itemManage">
										<div class="manageItem">
											<a id="editButton9" class="linkButton"
												onclick="popupProp(9);">[编辑]</a>&nbsp;<a id="designOrView9"
												class="linkButton"
												href="http://seeyoui.faisco.cn/msgBoard.jsp" target="_blank">[设计]</a>
										</div>
									</div>
								</dl>
								<div id="libuttom9" class="child-pre-div"
									style="margin-left: 20px; margin-top: 0px;"></div></li>
							<li id="12" colid="12"><div
									class="sibling-dropzone ui-droppable"></div>
								<dl id="part12" class="dl ui-droppable">
									<div id="li12" class="mark" onclick="hiddenChildren(this)">&nbsp;</div>
									<div id="editableDiv12" class="itemName">
										<div id="col12" class=" ellipsis noWrap" style="width: 80%;">产品展示</div>
									</div>
									<div
										style="width: 80px; height: 27px; float: left; padding: 0px 2px;">
										<div class="moveOpDiv" style="display: none;">
											<a onclick="return false;" href="javascript:;"
												hidefocus="true" class="col-up"
												style="cursor: default; background: none;"></a><a
												onclick="return false;" href="javascript:;" hidefocus="true"
												class="col-up" style="cursor: default; background: none;"></a><a
												onclick="return false;" href="javascript:;" hidefocus="true"
												class="col-left" style="cursor: default; background: none;"></a><a
												onclick="return false;" href="javascript:;" hidefocus="true"
												class="col-left" style="cursor: default; background: none;"></a>
										</div>
									</div>
									<div class="itemType" title="按住鼠标可拖动栏目进行排序">
										<span>系统栏目(产品列表)</span>
									</div>
									<div class="itemOpen">
										<span class="itemOpenIco checked_off" id="checkbox12"
											onclick="hiddenClick(this, 12, 12);" title="点击开启栏目"></span>
									</div>
									<div class="itemManage">
										<div class="manageItem">
											<a id="editButton12" class="linkButton"
												onclick="popupProp(12);">[编辑]</a>&nbsp;<a
												id="designOrView12" class="linkButton"
												href="http://seeyoui.faisco.cn/pr.jsp" target="_blank">[设计]</a>
										</div>
									</div>
								</dl>
								<div id="libuttom12" class="child-pre-div"
									style="margin-left: 20px; margin-top: 0px;"></div></li>
							<li id="13" colid="13"><div
									class="sibling-dropzone ui-droppable"></div>
								<dl id="part13" class="dl ui-droppable">
									<div id="li13" class="mark" onclick="hiddenChildren(this)">&nbsp;</div>
									<div id="editableDiv13" class="itemName">
										<div id="col13" class=" ellipsis noWrap" style="width: 80%;">购物车</div>
									</div>
									<div
										style="width: 80px; height: 27px; float: left; padding: 0px 2px;">
										<div class="moveOpDiv" style="display: none;">
											<a onclick="return false;" href="javascript:;"
												hidefocus="true" class="col-up"
												style="cursor: default; background: none;"></a><a
												onclick="return false;" href="javascript:;" hidefocus="true"
												class="col-up" style="cursor: default; background: none;"></a><a
												onclick="return false;" href="javascript:;" hidefocus="true"
												class="col-left" style="cursor: default; background: none;"></a><a
												onclick="return false;" href="javascript:;" hidefocus="true"
												class="col-left" style="cursor: default; background: none;"></a>
										</div>
									</div>
									<div class="itemType" title="按住鼠标可拖动栏目进行排序">
										<span>系统栏目(购物车)</span>
									</div>
									<div class="itemOpen">
										<span class="itemOpenIco checked_off" id="checkbox13"
											onclick="hiddenClick(this, 13, 13);" title="点击开启栏目"></span>
									</div>
									<div class="itemManage">
										<div class="manageItem">
											<a id="editButton13" class="linkButton"
												onclick="popupProp(13);">[编辑]</a>&nbsp;<a
												id="designOrView13" class="linkButton"
												href="http://seeyoui.faisco.cn/mcart.jsp" target="_blank">[设计]</a>
										</div>
									</div>
								</dl>
								<div id="libuttom13" class="child-pre-div"
									style="margin-left: 20px; margin-top: 0px;"></div></li>
							<li id="17" colid="17"><div
									class="sibling-dropzone ui-droppable"></div>
								<dl id="part17" class="dl ui-droppable">
									<div id="li17" class="mark" onclick="hiddenChildren(this)">&nbsp;</div>
									<div id="editableDiv17" class="itemName">
										<div id="col17" class=" ellipsis noWrap" style="width: 80%;">会员注册</div>
									</div>
									<div
										style="width: 80px; height: 27px; float: left; padding: 0px 2px;">
										<div class="moveOpDiv" style="display: none;">
											<a onclick="return false;" href="javascript:;"
												hidefocus="true" class="col-up"
												style="cursor: default; background: none;"></a><a
												onclick="return false;" href="javascript:;" hidefocus="true"
												class="col-up" style="cursor: default; background: none;"></a><a
												onclick="return false;" href="javascript:;" hidefocus="true"
												class="col-left" style="cursor: default; background: none;"></a><a
												onclick="return false;" href="javascript:;" hidefocus="true"
												class="col-left" style="cursor: default; background: none;"></a>
										</div>
									</div>
									<div class="itemType" title="按住鼠标可拖动栏目进行排序">
										<span>系统栏目(会员注册)</span>
									</div>
									<div class="itemOpen">
										<span class="itemOpenIco checked_off" id="checkbox17"
											onclick="hiddenClick(this, 17, 17);" title="点击开启栏目"></span>
									</div>
									<div class="itemManage">
										<div class="manageItem">
											<a id="editButton17" class="linkButton"
												onclick="popupProp(17);">[编辑]</a>&nbsp;<a
												id="designOrView17" class="linkButton"
												href="http://seeyoui.faisco.cn/signup.jsp" target="_blank">[设计]</a>
										</div>
									</div>
								</dl>
								<div id="libuttom17" class="child-pre-div"
									style="margin-left: 20px; margin-top: 0px;"></div></li>
							<li id="18" colid="18"><div
									class="sibling-dropzone ui-droppable"></div>
								<dl id="part18" class="dl ui-droppable">
									<div id="li18" class="mark" onclick="hiddenChildren(this)">&nbsp;</div>
									<div id="editableDiv18" class="itemName">
										<div id="col18" class=" ellipsis noWrap" style="width: 80%;">会员登录</div>
									</div>
									<div
										style="width: 80px; height: 27px; float: left; padding: 0px 2px;">
										<div class="moveOpDiv" style="display: none;">
											<a onclick="return false;" href="javascript:;"
												hidefocus="true" class="col-up"
												style="cursor: default; background: none;"></a><a
												onclick="return false;" href="javascript:;" hidefocus="true"
												class="col-up" style="cursor: default; background: none;"></a><a
												onclick="return false;" href="javascript:;" hidefocus="true"
												class="col-left" style="cursor: default; background: none;"></a><a
												onclick="return false;" href="javascript:;" hidefocus="true"
												class="col-left" style="cursor: default; background: none;"></a>
										</div>
									</div>
									<div class="itemType" title="按住鼠标可拖动栏目进行排序">
										<span>系统栏目(会员登录)</span>
									</div>
									<div class="itemOpen">
										<span class="itemOpenIco checked_off" id="checkbox18"
											onclick="hiddenClick(this, 18, 18);" title="点击开启栏目"></span>
									</div>
									<div class="itemManage">
										<div class="manageItem">
											<a id="editButton18" class="linkButton"
												onclick="popupProp(18);">[编辑]</a>&nbsp;<a
												id="designOrView18" class="linkButton"
												href="http://seeyoui.faisco.cn/login.jsp" target="_blank">[设计]</a>
										</div>
									</div>
								</dl>
								<div id="libuttom18" class="child-pre-div"
									style="margin-left: 20px; margin-top: 0px;"></div></li>
							<li id="21" colid="21"><div
									class="sibling-dropzone ui-droppable"></div>
								<dl id="part21" class="dl ui-droppable">
									<div id="li21" class="mark" onclick="hiddenChildren(this)">&nbsp;</div>
									<div id="editableDiv21" class="itemName">
										<div id="col21" class=" ellipsis noWrap" style="width: 80%;">新闻动态</div>
									</div>
									<div
										style="width: 80px; height: 27px; float: left; padding: 0px 2px;">
										<div class="moveOpDiv" style="display: none;">
											<a onclick="return false;" href="javascript:;"
												hidefocus="true" class="col-up"
												style="cursor: default; background: none;"></a><a
												onclick="return false;" href="javascript:;" hidefocus="true"
												class="col-up" style="cursor: default; background: none;"></a><a
												onclick="return false;" href="javascript:;" hidefocus="true"
												class="col-left" style="cursor: default; background: none;"></a><a
												onclick="return false;" href="javascript:;" hidefocus="true"
												class="col-left" style="cursor: default; background: none;"></a>
										</div>
									</div>
									<div class="itemType" title="按住鼠标可拖动栏目进行排序">
										<span>系统栏目(文章列表)</span>
									</div>
									<div class="itemOpen">
										<span class="itemOpenIco checked_off" id="checkbox21"
											onclick="hiddenClick(this, 21, 21);" title="点击开启栏目"></span>
									</div>
									<div class="itemManage">
										<div class="manageItem">
											<a id="editButton21" class="linkButton"
												onclick="popupProp(21);">[编辑]</a>&nbsp;<a
												id="designOrView21" class="linkButton"
												href="http://seeyoui.faisco.cn/nr.jsp" target="_blank">[设计]</a>
										</div>
									</div>
								</dl>
								<div id="libuttom21" class="child-pre-div"
									style="margin-left: 20px; margin-top: 0px;"></div></li>
							<li id="114" colid="114"><div
									class="sibling-dropzone ui-droppable"></div>
								<dl id="part114" class="dl ui-droppable">
									<div id="li114" class="mark" onclick="hiddenChildren(this)">&nbsp;</div>
									<div id="editableDiv114" class="itemName">
										<div id="col114" class=" ellipsis noWrap" style="width: 80%;">合作企业</div>
									</div>
									<div
										style="width: 80px; height: 27px; float: left; padding: 0px 2px;">
										<div class="moveOpDiv" style="display: none;">
											<a onclick="return false;" href="javascript:;"
												hidefocus="true" class="col-up"
												style="cursor: default; background: none;"></a><a
												onclick="return false;" href="javascript:;" hidefocus="true"
												class="col-up" style="cursor: default; background: none;"></a><a
												onclick="return false;" href="javascript:;" hidefocus="true"
												class="col-left" style="cursor: default; background: none;"></a><a
												onclick="return false;" href="javascript:;" hidefocus="true"
												class="col-left" style="cursor: default; background: none;"></a>
										</div>
									</div>
									<div class="itemType" title="按住鼠标可拖动栏目进行排序">
										<span>自定义栏目</span>
									</div>
									<div class="itemOpen">
										<span class="itemOpenIco checked_off" id="checkbox114"
											onclick="hiddenClick(this, 114, 114);" title="点击开启栏目"></span>
									</div>
									<div class="itemManage">
										<div class="manageItem">
											<a id="editButton114" class="linkButton"
												onclick="popupProp(114);">[编辑]</a>&nbsp;<a
												id="designOrView114" class="linkButton"
												href="http://seeyoui.faisco.cn/col.jsp?id=114"
												target="_blank">[设计]</a><a href="javascript:;"
												class="linkButton" onclick="onDel(114);return false;">&nbsp;[删除]</a>
										</div>
									</div>
								</dl>
								<div id="libuttom114" class="child-pre-div"
									style="margin-left: 20px; margin-top: 0px;"></div></li>
							<li id="103" colid="103"><div
									class="sibling-dropzone ui-droppable"></div>
								<dl id="part103" class="dl ui-droppable">
									<div id="li103" class="mark" onclick="hiddenChildren(this)">&nbsp;</div>
									<div id="editableDiv103" class="itemName">
										<div id="col103" class=" ellipsis noWrap" style="width: 80%;">我们的服务</div>
									</div>
									<div
										style="width: 80px; height: 27px; float: left; padding: 0px 2px;">
										<div class="moveOpDiv" style="display: none;">
											<a onclick="return false;" href="javascript:;"
												hidefocus="true" class="col-up"
												style="cursor: default; background: none;"></a><a
												onclick="return false;" href="javascript:;" hidefocus="true"
												class="col-up" style="cursor: default; background: none;"></a><a
												onclick="return false;" href="javascript:;" hidefocus="true"
												class="col-left" style="cursor: default; background: none;"></a><a
												onclick="return false;" href="javascript:;" hidefocus="true"
												class="col-left" style="cursor: default; background: none;"></a>
										</div>
									</div>
									<div class="itemType" title="按住鼠标可拖动栏目进行排序">
										<span>自定义栏目</span>
									</div>
									<div class="itemOpen">
										<span class="itemOpenIco checked_off" id="checkbox103"
											onclick="hiddenClick(this, 103, 103);" title="点击开启栏目"></span>
									</div>
									<div class="itemManage">
										<div class="manageItem">
											<a id="editButton103" class="linkButton"
												onclick="popupProp(103);">[编辑]</a>&nbsp;<a
												id="designOrView103" class="linkButton"
												href="http://seeyoui.faisco.cn/col.jsp?id=103"
												target="_blank">[设计]</a><a href="javascript:;"
												class="linkButton" onclick="onDel(103);return false;">&nbsp;[删除]</a>
										</div>
									</div>
								</dl>
								<div id="libuttom103" class="child-pre-div"
									style="margin-left: 20px; margin-top: 0px;"></div></li>
							<div class="tail-dropzone ui-droppable"></div>
							<div class="tail-dropzone ui-droppable"></div>
						</ul>
					</div>
				</div>
			</div>
			<div style="clear: both;"></div>
			<div class="totalCount">
				共<span id="totalCount">11</span>个
			</div>
		</div>
		<div
			class="ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide"
			id="basicSetting">
			<div id="html-panel" class="html-panel" style="height: 460px;">
				<div id="content">
					<div style="z-index: 0;" id="edui1" class="edui-editor ">
						<div id="edui1_toolbarbox" class="edui-editor-toolbarbox">
							<div id="edui1_toolbarboxouter"
								class="edui-editor-toolbarboxouter">
								<div class="edui-editor-toolbarboxinner">
									<div style="-moz-user-select: none;" id="edui2" width="123"
										class="edui-toolbar shrinkopenup  "
										onselectstart="return false;"
										onmousedown='return $EDITORUI["edui2"]._onMouseDown(event, this);'>
										<div id="edui3"
											class="edui-box edui-button edui-for-shrinkopenup">
											<div id="edui3_state"
												onmousedown='$EDITORUI["edui3"].Stateful_onMouseDown(event, this);'
												onmouseup='$EDITORUI["edui3"].Stateful_onMouseUp(event, this);'
												onmouseover='$EDITORUI["edui3"].Stateful_onMouseOver(event, this);'
												onmouseout='$EDITORUI["edui3"].Stateful_onMouseOut(event, this);'>
												<div class="edui-button-wrap">
													<div id="edui3_body" unselectable="on" title="展开"
														class="edui-button-body" onmousedown="return false;"
														onclick='return $EDITORUI["edui3"]._onClick();'>
														<div class="edui-box edui-icon"></div>
														<div class="edui-box edui-label"></div>
													</div>
												</div>
											</div>
										</div>
										<div id="edui4"
											class="edui-box edui-menubutton edui-for-removeformat">
											<div title="清除格式" id="edui4_state"
												onmousedown='$EDITORUI["edui4"].Stateful_onMouseDown(event, this);'
												onmouseup='$EDITORUI["edui4"].Stateful_onMouseUp(event, this);'
												onmouseover='$EDITORUI["edui4"].Stateful_onMouseOver(event, this);'
												onmouseout='$EDITORUI["edui4"].Stateful_onMouseOut(event, this);'>
												<div class="edui-menubutton-body">
													<div id="edui4_button_body"
														class="edui-box edui-button-body"
														onclick='$EDITORUI["edui4"]._onArrowClick(event, this);'>
														<div class="edui-box edui-icon"></div>
													</div>
												</div>
											</div>
										</div>
										<div id="edui9" class="edui-box edui-separator "></div>
										<div id="edui10" class="edui-box edui-button edui-for-bold">
											<div id="edui10_state"
												onmousedown='$EDITORUI["edui10"].Stateful_onMouseDown(event, this);'
												onmouseup='$EDITORUI["edui10"].Stateful_onMouseUp(event, this);'
												onmouseover='$EDITORUI["edui10"].Stateful_onMouseOver(event, this);'
												onmouseout='$EDITORUI["edui10"].Stateful_onMouseOut(event, this);'>
												<div class="edui-button-wrap">
													<div id="edui10_body" unselectable="on" title="加粗"
														class="edui-button-body" onmousedown="return false;"
														onclick='return $EDITORUI["edui10"]._onClick();'>
														<div class="edui-box edui-icon"></div>
													</div>
												</div>
											</div>
										</div>
										<div id="edui11" class="edui-box edui-button edui-for-italic">
											<div id="edui11_state"
												onmousedown='$EDITORUI["edui11"].Stateful_onMouseDown(event, this);'
												onmouseup='$EDITORUI["edui11"].Stateful_onMouseUp(event, this);'
												onmouseover='$EDITORUI["edui11"].Stateful_onMouseOver(event, this);'
												onmouseout='$EDITORUI["edui11"].Stateful_onMouseOut(event, this);'>
												<div class="edui-button-wrap">
													<div id="edui11_body" unselectable="on" title="斜体"
														class="edui-button-body" onmousedown="return false;"
														onclick='return $EDITORUI["edui11"]._onClick();'>
														<div class="edui-box edui-icon"></div>
													</div>
												</div>
											</div>
										</div>
										<div id="edui12"
											class="edui-box edui-button edui-for-underline">
											<div id="edui12_state"
												onmousedown='$EDITORUI["edui12"].Stateful_onMouseDown(event, this);'
												onmouseup='$EDITORUI["edui12"].Stateful_onMouseUp(event, this);'
												onmouseover='$EDITORUI["edui12"].Stateful_onMouseOver(event, this);'
												onmouseout='$EDITORUI["edui12"].Stateful_onMouseOut(event, this);'>
												<div class="edui-button-wrap">
													<div id="edui12_body" unselectable="on" title="下划线"
														class="edui-button-body" onmousedown="return false;"
														onclick='return $EDITORUI["edui12"]._onClick();'>
														<div class="edui-box edui-icon"></div>
													</div>
												</div>
											</div>
										</div>
										<div id="edui13" class="edui-box edui-separator "></div>
										<div id="edui14"
											class="edui-box edui-combox edui-for-fontfamily">
											<div title="字体" id="edui14_state"
												onmousedown='$EDITORUI["edui14"].Stateful_onMouseDown(event, this);'
												onmouseup='$EDITORUI["edui14"].Stateful_onMouseUp(event, this);'
												onmouseover='$EDITORUI["edui14"].Stateful_onMouseOver(event, this);'
												onmouseout='$EDITORUI["edui14"].Stateful_onMouseOut(event, this);'>
												<div class="edui-combox-body">
													<div id="edui14_button_body"
														class="edui-box edui-button-body"
														onclick='$EDITORUI["edui14"]._onButtonClick(event, this);'>
														<div
															class="edui-box edui-icon edui-for-fontfamily_background "></div>
													</div>
												</div>
											</div>
										</div>
										<div id="edui39"
											class="edui-box edui-combox edui-for-fontsize">
											<div title="字号" id="edui39_state"
												onmousedown='$EDITORUI["edui39"].Stateful_onMouseDown(event, this);'
												onmouseup='$EDITORUI["edui39"].Stateful_onMouseUp(event, this);'
												onmouseover='$EDITORUI["edui39"].Stateful_onMouseOver(event, this);'
												onmouseout='$EDITORUI["edui39"].Stateful_onMouseOut(event, this);'>
												<div class="edui-combox-body">
													<div id="edui39_button_body"
														class="edui-box edui-button-body"
														onclick='$EDITORUI["edui39"]._onButtonClick(event, this);'>
														<div
															class="edui-box edui-icon edui-for-fontsize_background "></div>
													</div>
												</div>
											</div>
										</div>
										<div id="edui41"
											class="edui-box edui-splitbutton edui-for-forecolor edui-colorbutton">
											<div title="字体颜色" id="edui41_state"
												onmousedown='$EDITORUI["edui41"].Stateful_onMouseDown(event, this);'
												onmouseup='$EDITORUI["edui41"].Stateful_onMouseUp(event, this);'
												onmouseover='$EDITORUI["edui41"].Stateful_onMouseOver(event, this);'
												onmouseout='$EDITORUI["edui41"].Stateful_onMouseOut(event, this);'>
												<div class="edui-splitbutton-body">
													<div id="edui41_button_body"
														class="edui-box edui-button-body"
														onclick='$EDITORUI["edui41"]._onButtonClick(event, this);'>
														<div class="edui-box edui-icon"></div>
														<div id="edui41_colorlump" class="edui-colorlump"></div>
													</div>
													<div class="edui-box edui-splitborder"></div>
													<div class="edui-box edui-arrow"
														onclick='$EDITORUI["edui41"]._onArrowClick();'></div>
												</div>
											</div>
										</div>
										<div id="edui44"
											class="edui-box edui-splitbutton edui-for-backcolor edui-colorbutton">
											<div title="背景色" id="edui44_state"
												onmousedown='$EDITORUI["edui44"].Stateful_onMouseDown(event, this);'
												onmouseup='$EDITORUI["edui44"].Stateful_onMouseUp(event, this);'
												onmouseover='$EDITORUI["edui44"].Stateful_onMouseOver(event, this);'
												onmouseout='$EDITORUI["edui44"].Stateful_onMouseOut(event, this);'>
												<div class="edui-splitbutton-body">
													<div id="edui44_button_body"
														class="edui-box edui-button-body"
														onclick='$EDITORUI["edui44"]._onButtonClick(event, this);'>
														<div class="edui-box edui-icon"></div>
														<div id="edui44_colorlump" class="edui-colorlump"></div>
													</div>
													<div class="edui-box edui-splitborder"></div>
													<div class="edui-box edui-arrow"
														onclick='$EDITORUI["edui44"]._onArrowClick();'></div>
												</div>
											</div>
										</div>
										<div id="edui47" class="edui-box edui-separator "></div>
										<div id="edui48"
											class="edui-box edui-menubutton edui-for-insertorderedlist">
											<div title="符号列表" id="edui48_state"
												onmousedown='$EDITORUI["edui48"].Stateful_onMouseDown(event, this);'
												onmouseup='$EDITORUI["edui48"].Stateful_onMouseUp(event, this);'
												onmouseover='$EDITORUI["edui48"].Stateful_onMouseOver(event, this);'
												onmouseout='$EDITORUI["edui48"].Stateful_onMouseOut(event, this);'>
												<div class="edui-menubutton-body">
													<div id="edui48_button_body"
														class="edui-box edui-button-body"
														onclick='$EDITORUI["edui48"]._onArrowClick(event, this);'>
														<div class="edui-box edui-icon"></div>
													</div>
												</div>
											</div>
										</div>
										<div id="edui55"
											class="edui-box edui-menubutton edui-for-insertunorderedlist">
											<div title="无序列表" id="edui55_state"
												onmousedown='$EDITORUI["edui55"].Stateful_onMouseDown(event, this);'
												onmouseup='$EDITORUI["edui55"].Stateful_onMouseUp(event, this);'
												onmouseover='$EDITORUI["edui55"].Stateful_onMouseOver(event, this);'
												onmouseout='$EDITORUI["edui55"].Stateful_onMouseOut(event, this);'>
												<div class="edui-menubutton-body">
													<div id="edui55_button_body"
														class="edui-box edui-button-body"
														onclick='$EDITORUI["edui55"]._onArrowClick(event, this);'>
														<div class="edui-box edui-icon"></div>
													</div>
												</div>
											</div>
										</div>
										<div id="edui60"
											class="edui-box edui-menubutton edui-for-lineheight">
											<div title="行间距" id="edui60_state"
												onmousedown='$EDITORUI["edui60"].Stateful_onMouseDown(event, this);'
												onmouseup='$EDITORUI["edui60"].Stateful_onMouseUp(event, this);'
												onmouseover='$EDITORUI["edui60"].Stateful_onMouseOver(event, this);'
												onmouseout='$EDITORUI["edui60"].Stateful_onMouseOut(event, this);'>
												<div class="edui-menubutton-body">
													<div id="edui60_button_body"
														class="edui-box edui-button-body"
														onclick='$EDITORUI["edui60"]._onArrowClick(event, this);'>
														<div class="edui-box edui-icon"></div>
													</div>
												</div>
											</div>
										</div>
										<div id="edui70"
											class="edui-box edui-menubutton edui-for-justifyjustify">
											<div title="段落对齐" id="edui70_state"
												onmousedown='$EDITORUI["edui70"].Stateful_onMouseDown(event, this);'
												onmouseup='$EDITORUI["edui70"].Stateful_onMouseUp(event, this);'
												onmouseover='$EDITORUI["edui70"].Stateful_onMouseOver(event, this);'
												onmouseout='$EDITORUI["edui70"].Stateful_onMouseOut(event, this);'>
												<div class="edui-menubutton-body">
													<div id="edui70_button_body"
														class="edui-box edui-button-body"
														onclick='$EDITORUI["edui70"]._onArrowClick(event, this);'>
														<div class="edui-box edui-icon"></div>
													</div>
												</div>
											</div>
										</div>
										<div id="edui76" class="edui-box edui-separator "></div>
										<div id="edui77"
											class="edui-box edui-splitbutton edui-for-link">
											<div title="超链接" id="edui77_state"
												onmousedown='$EDITORUI["edui77"].Stateful_onMouseDown(event, this);'
												onmouseup='$EDITORUI["edui77"].Stateful_onMouseUp(event, this);'
												onmouseover='$EDITORUI["edui77"].Stateful_onMouseOver(event, this);'
												onmouseout='$EDITORUI["edui77"].Stateful_onMouseOut(event, this);'>
												<div class="edui-splitbutton-body">
													<div id="edui77_button_body"
														class="edui-box edui-button-body"
														onclick='$EDITORUI["edui77"]._onArrowClick(event, this);'>
														<div class="edui-box edui-icon"></div>
													</div>
												</div>
											</div>
										</div>
										<div id="edui80"
											class="edui-box edui-splitbutton edui-for-qqservice">
											<div title="QQ/MSN/Skype/阿里旺旺/淘宝旺旺" id="edui80_state"
												onmousedown='$EDITORUI["edui80"].Stateful_onMouseDown(event, this);'
												onmouseup='$EDITORUI["edui80"].Stateful_onMouseUp(event, this);'
												onmouseover='$EDITORUI["edui80"].Stateful_onMouseOver(event, this);'
												onmouseout='$EDITORUI["edui80"].Stateful_onMouseOut(event, this);'>
												<div class="edui-splitbutton-body">
													<div id="edui80_button_body"
														class="edui-box edui-button-body"
														onclick='$EDITORUI["edui80"]._onArrowClick(event, this);'>
														<div class="edui-box edui-icon"></div>
													</div>
												</div>
											</div>
										</div>
										<div id="edui83"
											class="edui-box edui-splitbutton edui-for-insertimage">
											<div title="图片" id="edui83_state"
												onmousedown='$EDITORUI["edui83"].Stateful_onMouseDown(event, this);'
												onmouseup='$EDITORUI["edui83"].Stateful_onMouseUp(event, this);'
												onmouseover='$EDITORUI["edui83"].Stateful_onMouseOver(event, this);'
												onmouseout='$EDITORUI["edui83"].Stateful_onMouseOut(event, this);'>
												<div class="edui-splitbutton-body">
													<div id="edui83_button_body"
														class="edui-box edui-button-body"
														onclick="Site.htmlChoiceImage(editor) ">
														<div class="edui-box edui-icon"></div>
													</div>
													<div class="edui-box edui-splitborder"></div>
													<div class="edui-box edui-arrow"
														onclick='$EDITORUI["edui83"]._onButtonClick();'></div>
												</div>
											</div>
										</div>
										<div id="edui89"
											class="edui-box edui-button edui-for-insertmp4">
											<div id="edui89_state"
												onmousedown='$EDITORUI["edui89"].Stateful_onMouseDown(event, this);'
												onmouseup='$EDITORUI["edui89"].Stateful_onMouseUp(event, this);'
												onmouseover='$EDITORUI["edui89"].Stateful_onMouseOver(event, this);'
												onmouseout='$EDITORUI["edui89"].Stateful_onMouseOut(event, this);'>
												<div class="edui-button-wrap">
													<div id="edui89_body" unselectable="on" title="MP4"
														class="edui-button-body" onmousedown="return false;"
														onclick='return $EDITORUI["edui89"]._onClick();'>
														<div class="edui-box edui-icon"></div>
														<div class="edui-box edui-label"></div>
													</div>
												</div>
											</div>
										</div>
										<div id="edui94"
											class="edui-box edui-splitbutton edui-for-inserttable">
											<div title="表格" id="edui94_state"
												onmousedown='$EDITORUI["edui94"].Stateful_onMouseDown(event, this);'
												onmouseup='$EDITORUI["edui94"].Stateful_onMouseUp(event, this);'
												onmouseover='$EDITORUI["edui94"].Stateful_onMouseOver(event, this);'
												onmouseout='$EDITORUI["edui94"].Stateful_onMouseOut(event, this);'>
												<div class="edui-splitbutton-body">
													<div id="edui94_button_body"
														class="edui-box edui-button-body"
														onclick='$EDITORUI["edui94"]._onButtonClick(event, this);'>
														<div class="edui-box edui-icon"></div>
													</div>
												</div>
											</div>
										</div>
										<div id="edui97" class="edui-box edui-separator "></div>
										<div id="edui98"
											class="edui-box edui-button  edui-for-swfupload">
											<div id="edui98_state"
												onmousedown='$EDITORUI["edui98"].Stateful_onMouseDown(event, this);'
												onmouseup='$EDITORUI["edui98"].Stateful_onMouseUp(event, this);'
												onmouseover='$EDITORUI["edui98"].Stateful_onMouseOver(event, this);'
												onmouseout='$EDITORUI["edui98"].Stateful_onMouseOut(event, this);'>
												<div class="edui-button-wrap">
													<div id="edui98_body" style="height: 20px; width: 20px;"
														unselectable="on" title="word文档导入"
														class="edui-button-body">
														<div class="edui-box edui-icon">
															<object id="SWFUpload_0"
																type="application/x-shockwave-flash"
																data="footerInfoEdit_data/swfupload.swf"
																class="swfupload" style="" height="20" width="20">
																<param name="wmode" value="transparent">
																	<param name="movie"
																		value="/res/js/comm/SWFUpload2v/Flash/swfupload.swf?preventswfcaching=1453769215968">
																		<param name="quality" value="high">
																			<param name="menu" value="false">
																				<param name="allowScriptAccess" value="always">
																					<param name="flashvars"
																						value="movieName=SWFUpload_0&amp;uploadURL=%2Fajax%2Fupdocx.jsp%3Fcmd%3Dadd&amp;useQueryString=true&amp;requeueOnError=false&amp;httpSuccess=&amp;assumeSuccessTimeout=0&amp;params=_TOKEN%3D227bc080f190f79a8709049cd5847de9&amp;filePostName=Filedata&amp;fileTypes=*.doc%3B*.docx%3B&amp;fileTypesDescription=All%20Files&amp;fileSizeLimit=20MB&amp;fileUploadLimit=0&amp;fileQueueLimit=0&amp;debugEnabled=false&amp;buttonImageURL=http%3A%2F%2F0.ss.faisys.com%2Fimage%2Fword.png&amp;buttonWidth=20&amp;buttonHeight=20&amp;buttonText=&amp;buttonTextTopPadding=0&amp;buttonTextLeftPadding=0&amp;buttonTextStyle=color%3A%20%23000000%3B%20font-size%3A%2016pt%3B&amp;buttonAction=-110&amp;buttonDisabled=false&amp;buttonCursor=-2">
															</object>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div id="edui99" class="edui-box edui-separator "></div>
										<div id="edui100" class="edui-box edui-button edui-for-source">
											<div id="edui100_state"
												onmousedown='$EDITORUI["edui100"].Stateful_onMouseDown(event, this);'
												onmouseup='$EDITORUI["edui100"].Stateful_onMouseUp(event, this);'
												onmouseover='$EDITORUI["edui100"].Stateful_onMouseOver(event, this);'
												onmouseout='$EDITORUI["edui100"].Stateful_onMouseOut(event, this);'>
												<div class="edui-button-wrap">
													<div id="edui100_body" unselectable="on" title="源代码"
														class="edui-button-body" onmousedown="return false;"
														onclick='return $EDITORUI["edui100"]._onClick();'>
														<div class="edui-box edui-icon"></div>
													</div>
												</div>
											</div>
										</div>
										<div id="edui101" class="edui-box edui-newlineseparator "
											style="display: block !important;"></div>
										<div id="edui102"
											class="edui-box edui-button edui-for-pasteplain">
											<div id="edui102_state"
												onmousedown='$EDITORUI["edui102"].Stateful_onMouseDown(event, this);'
												onmouseup='$EDITORUI["edui102"].Stateful_onMouseUp(event, this);'
												onmouseover='$EDITORUI["edui102"].Stateful_onMouseOver(event, this);'
												onmouseout='$EDITORUI["edui102"].Stateful_onMouseOut(event, this);'>
												<div class="edui-button-wrap">
													<div id="edui102_body" unselectable="on" title="纯文本粘贴模式"
														class="edui-button-body" onmousedown="return false;"
														onclick='return $EDITORUI["edui102"]._onClick();'>
														<div class="edui-box edui-icon"></div>
													</div>
												</div>
											</div>
										</div>
										<div id="edui103"
											class="edui-box edui-button edui-for-selectall">
											<div id="edui103_state"
												onmousedown='$EDITORUI["edui103"].Stateful_onMouseDown(event, this);'
												onmouseup='$EDITORUI["edui103"].Stateful_onMouseUp(event, this);'
												onmouseover='$EDITORUI["edui103"].Stateful_onMouseOver(event, this);'
												onmouseout='$EDITORUI["edui103"].Stateful_onMouseOut(event, this);'>
												<div class="edui-button-wrap">
													<div id="edui103_body" unselectable="on" title="全选"
														class="edui-button-body" onmousedown="return false;"
														onclick='return $EDITORUI["edui103"]._onClick();'>
														<div class="edui-box edui-icon"></div>
													</div>
												</div>
											</div>
										</div>
										<div id="edui104" class="edui-box edui-button edui-for-undo">
											<div id="edui104_state"
												onmousedown='$EDITORUI["edui104"].Stateful_onMouseDown(event, this);'
												onmouseup='$EDITORUI["edui104"].Stateful_onMouseUp(event, this);'
												onmouseover='$EDITORUI["edui104"].Stateful_onMouseOver(event, this);'
												onmouseout='$EDITORUI["edui104"].Stateful_onMouseOut(event, this);'>
												<div class="edui-button-wrap">
													<div id="edui104_body" unselectable="on" title="撤销"
														class="edui-button-body" onmousedown="return false;"
														onclick='return $EDITORUI["edui104"]._onClick();'>
														<div class="edui-box edui-icon"></div>
													</div>
												</div>
											</div>
										</div>
										<div id="edui105" class="edui-box edui-button edui-for-redo">
											<div id="edui105_state"
												onmousedown='$EDITORUI["edui105"].Stateful_onMouseDown(event, this);'
												onmouseup='$EDITORUI["edui105"].Stateful_onMouseUp(event, this);'
												onmouseover='$EDITORUI["edui105"].Stateful_onMouseOver(event, this);'
												onmouseout='$EDITORUI["edui105"].Stateful_onMouseOut(event, this);'>
												<div class="edui-button-wrap">
													<div id="edui105_body" unselectable="on" title="重做"
														class="edui-button-body" onmousedown="return false;"
														onclick='return $EDITORUI["edui105"]._onClick();'>
														<div class="edui-box edui-icon"></div>
													</div>
												</div>
											</div>
										</div>
										<div id="edui106" class="edui-box edui-separator "></div>
										<div id="edui107"
											class="edui-box edui-button edui-for-strikethrough">
											<div id="edui107_state"
												onmousedown='$EDITORUI["edui107"].Stateful_onMouseDown(event, this);'
												onmouseup='$EDITORUI["edui107"].Stateful_onMouseUp(event, this);'
												onmouseover='$EDITORUI["edui107"].Stateful_onMouseOver(event, this);'
												onmouseout='$EDITORUI["edui107"].Stateful_onMouseOut(event, this);'>
												<div class="edui-button-wrap">
													<div id="edui107_body" unselectable="on" title="删除线"
														class="edui-button-body" onmousedown="return false;"
														onclick='return $EDITORUI["edui107"]._onClick();'>
														<div class="edui-box edui-icon"></div>
													</div>
												</div>
											</div>
										</div>
										<div id="edui108"
											class="edui-box edui-button edui-for-superscript">
											<div id="edui108_state"
												onmousedown='$EDITORUI["edui108"].Stateful_onMouseDown(event, this);'
												onmouseup='$EDITORUI["edui108"].Stateful_onMouseUp(event, this);'
												onmouseover='$EDITORUI["edui108"].Stateful_onMouseOver(event, this);'
												onmouseout='$EDITORUI["edui108"].Stateful_onMouseOut(event, this);'>
												<div class="edui-button-wrap">
													<div id="edui108_body" unselectable="on" title="上标"
														class="edui-button-body" onmousedown="return false;"
														onclick='return $EDITORUI["edui108"]._onClick();'>
														<div class="edui-box edui-icon"></div>
													</div>
												</div>
											</div>
										</div>
										<div id="edui109"
											class="edui-box edui-button edui-for-subscript">
											<div id="edui109_state"
												onmousedown='$EDITORUI["edui109"].Stateful_onMouseDown(event, this);'
												onmouseup='$EDITORUI["edui109"].Stateful_onMouseUp(event, this);'
												onmouseover='$EDITORUI["edui109"].Stateful_onMouseOver(event, this);'
												onmouseout='$EDITORUI["edui109"].Stateful_onMouseOut(event, this);'>
												<div class="edui-button-wrap">
													<div id="edui109_body" unselectable="on" title="下标"
														class="edui-button-body" onmousedown="return false;"
														onclick='return $EDITORUI["edui109"]._onClick();'>
														<div class="edui-box edui-icon"></div>
													</div>
												</div>
											</div>
										</div>
										<div id="edui110"
											class="edui-box edui-button edui-for-horizontal">
											<div id="edui110_state"
												onmousedown='$EDITORUI["edui110"].Stateful_onMouseDown(event, this);'
												onmouseup='$EDITORUI["edui110"].Stateful_onMouseUp(event, this);'
												onmouseover='$EDITORUI["edui110"].Stateful_onMouseOver(event, this);'
												onmouseout='$EDITORUI["edui110"].Stateful_onMouseOut(event, this);'>
												<div class="edui-button-wrap">
													<div id="edui110_body" unselectable="on" title="分隔线"
														class="edui-button-body" onmousedown="return false;"
														onclick='return $EDITORUI["edui110"]._onClick();'>
														<div class="edui-box edui-icon"></div>
													</div>
												</div>
											</div>
										</div>
										<div id="edui111"
											class="edui-box edui-button edui-for-zhspace">
											<div id="edui111_state"
												onmousedown='$EDITORUI["edui111"].Stateful_onMouseDown(event, this);'
												onmouseup='$EDITORUI["edui111"].Stateful_onMouseUp(event, this);'
												onmouseover='$EDITORUI["edui111"].Stateful_onMouseOver(event, this);'
												onmouseout='$EDITORUI["edui111"].Stateful_onMouseOut(event, this);'>
												<div class="edui-button-wrap">
													<div id="edui111_body" unselectable="on" title="中文空格"
														class="edui-button-body" onmousedown="return false;"
														onclick='return $EDITORUI["edui111"]._onClick();'>
														<div class="edui-box edui-icon"></div>
													</div>
												</div>
											</div>
										</div>
										<div id="edui112" class="edui-box edui-separator "></div>
										<div id="edui113" class="edui-box edui-button edui-for-indent">
											<div id="edui113_state"
												onmousedown='$EDITORUI["edui113"].Stateful_onMouseDown(event, this);'
												onmouseup='$EDITORUI["edui113"].Stateful_onMouseUp(event, this);'
												onmouseover='$EDITORUI["edui113"].Stateful_onMouseOver(event, this);'
												onmouseout='$EDITORUI["edui113"].Stateful_onMouseOut(event, this);'>
												<div class="edui-button-wrap">
													<div id="edui113_body" unselectable="on" title="首行缩进"
														class="edui-button-body" onmousedown="return false;"
														onclick='return $EDITORUI["edui113"]._onClick();'>
														<div class="edui-box edui-icon"></div>
													</div>
												</div>
											</div>
										</div>
										<div id="edui114"
											class="edui-box edui-menubutton edui-for-rowspacingtop">
											<div title="段前距" id="edui114_state"
												onmousedown='$EDITORUI["edui114"].Stateful_onMouseDown(event, this);'
												onmouseup='$EDITORUI["edui114"].Stateful_onMouseUp(event, this);'
												onmouseover='$EDITORUI["edui114"].Stateful_onMouseOver(event, this);'
												onmouseout='$EDITORUI["edui114"].Stateful_onMouseOut(event, this);'>
												<div class="edui-menubutton-body">
													<div id="edui114_button_body"
														class="edui-box edui-button-body"
														onclick='$EDITORUI["edui114"]._onArrowClick(event, this);'>
														<div class="edui-box edui-icon"></div>
													</div>
												</div>
											</div>
										</div>
										<div id="edui121"
											class="edui-box edui-menubutton edui-for-rowspacingbottom">
											<div title="段后距" id="edui121_state"
												onmousedown='$EDITORUI["edui121"].Stateful_onMouseDown(event, this);'
												onmouseup='$EDITORUI["edui121"].Stateful_onMouseUp(event, this);'
												onmouseover='$EDITORUI["edui121"].Stateful_onMouseOver(event, this);'
												onmouseout='$EDITORUI["edui121"].Stateful_onMouseOut(event, this);'>
												<div class="edui-menubutton-body">
													<div id="edui121_button_body"
														class="edui-box edui-button-body"
														onclick='$EDITORUI["edui121"]._onArrowClick(event, this);'>
														<div class="edui-box edui-icon"></div>
													</div>
												</div>
											</div>
										</div>
										<div id="edui128" class="edui-box edui-separator "></div>
										<div id="edui129"
											class="edui-box edui-button edui-for-deletetable">
											<div id="edui129_state"
												onmousedown='$EDITORUI["edui129"].Stateful_onMouseDown(event, this);'
												onmouseup='$EDITORUI["edui129"].Stateful_onMouseUp(event, this);'
												onmouseover='$EDITORUI["edui129"].Stateful_onMouseOver(event, this);'
												onmouseout='$EDITORUI["edui129"].Stateful_onMouseOut(event, this);'>
												<div class="edui-button-wrap">
													<div id="edui129_body" unselectable="on" title="删除表格"
														class="edui-button-body" onmousedown="return false;"
														onclick='return $EDITORUI["edui129"]._onClick();'>
														<div class="edui-box edui-icon"></div>
													</div>
												</div>
											</div>
										</div>
										<div id="edui132" class="edui-box edui-button edui-for-edittd">
											<div id="edui132_state"
												onmousedown='$EDITORUI["edui132"].Stateful_onMouseDown(event, this);'
												onmouseup='$EDITORUI["edui132"].Stateful_onMouseUp(event, this);'
												onmouseover='$EDITORUI["edui132"].Stateful_onMouseOver(event, this);'
												onmouseout='$EDITORUI["edui132"].Stateful_onMouseOut(event, this);'>
												<div class="edui-button-wrap">
													<div id="edui132_body" unselectable="on" title="单元格属性"
														class="edui-button-body" onmousedown="return false;"
														onclick='return $EDITORUI["edui132"]._onClick();'>
														<div class="edui-box edui-icon"></div>
														<div class="edui-box edui-label"></div>
													</div>
												</div>
											</div>
										</div>
										<div id="edui133"
											class="edui-box edui-button edui-for-insertparagraphbeforetable">
											<div id="edui133_state"
												onmousedown='$EDITORUI["edui133"].Stateful_onMouseDown(event, this);'
												onmouseup='$EDITORUI["edui133"].Stateful_onMouseUp(event, this);'
												onmouseover='$EDITORUI["edui133"].Stateful_onMouseOver(event, this);'
												onmouseout='$EDITORUI["edui133"].Stateful_onMouseOut(event, this);'>
												<div class="edui-button-wrap">
													<div id="edui133_body" unselectable="on" title="表格前插行"
														class="edui-button-body" onmousedown="return false;"
														onclick='return $EDITORUI["edui133"]._onClick();'>
														<div class="edui-box edui-icon"></div>
													</div>
												</div>
											</div>
										</div>
										<div id="edui134"
											class="edui-box edui-button edui-for-insertrow">
											<div id="edui134_state"
												onmousedown='$EDITORUI["edui134"].Stateful_onMouseDown(event, this);'
												onmouseup='$EDITORUI["edui134"].Stateful_onMouseUp(event, this);'
												onmouseover='$EDITORUI["edui134"].Stateful_onMouseOver(event, this);'
												onmouseout='$EDITORUI["edui134"].Stateful_onMouseOut(event, this);'>
												<div class="edui-button-wrap">
													<div id="edui134_body" unselectable="on" title="前插入行"
														class="edui-button-body" onmousedown="return false;"
														onclick='return $EDITORUI["edui134"]._onClick();'>
														<div class="edui-box edui-icon"></div>
													</div>
												</div>
											</div>
										</div>
										<div id="edui135"
											class="edui-box edui-button edui-for-deleterow">
											<div id="edui135_state"
												onmousedown='$EDITORUI["edui135"].Stateful_onMouseDown(event, this);'
												onmouseup='$EDITORUI["edui135"].Stateful_onMouseUp(event, this);'
												onmouseover='$EDITORUI["edui135"].Stateful_onMouseOver(event, this);'
												onmouseout='$EDITORUI["edui135"].Stateful_onMouseOut(event, this);'>
												<div class="edui-button-wrap">
													<div id="edui135_body" unselectable="on" title="删除行"
														class="edui-button-body" onmousedown="return false;"
														onclick='return $EDITORUI["edui135"]._onClick();'>
														<div class="edui-box edui-icon"></div>
													</div>
												</div>
											</div>
										</div>
										<div id="edui136"
											class="edui-box edui-button edui-for-insertcol">
											<div id="edui136_state"
												onmousedown='$EDITORUI["edui136"].Stateful_onMouseDown(event, this);'
												onmouseup='$EDITORUI["edui136"].Stateful_onMouseUp(event, this);'
												onmouseover='$EDITORUI["edui136"].Stateful_onMouseOver(event, this);'
												onmouseout='$EDITORUI["edui136"].Stateful_onMouseOut(event, this);'>
												<div class="edui-button-wrap">
													<div id="edui136_body" unselectable="on" title="前插入列"
														class="edui-button-body" onmousedown="return false;"
														onclick='return $EDITORUI["edui136"]._onClick();'>
														<div class="edui-box edui-icon"></div>
													</div>
												</div>
											</div>
										</div>
										<div id="edui137"
											class="edui-box edui-button edui-for-deletecol">
											<div id="edui137_state"
												onmousedown='$EDITORUI["edui137"].Stateful_onMouseDown(event, this);'
												onmouseup='$EDITORUI["edui137"].Stateful_onMouseUp(event, this);'
												onmouseover='$EDITORUI["edui137"].Stateful_onMouseOver(event, this);'
												onmouseout='$EDITORUI["edui137"].Stateful_onMouseOut(event, this);'>
												<div class="edui-button-wrap">
													<div id="edui137_body" unselectable="on" title="删除列"
														class="edui-button-body" onmousedown="return false;"
														onclick='return $EDITORUI["edui137"]._onClick();'>
														<div class="edui-box edui-icon"></div>
													</div>
												</div>
											</div>
										</div>
										<div id="edui138"
											class="edui-box edui-button edui-for-mergecells">
											<div id="edui138_state"
												onmousedown='$EDITORUI["edui138"].Stateful_onMouseDown(event, this);'
												onmouseup='$EDITORUI["edui138"].Stateful_onMouseUp(event, this);'
												onmouseover='$EDITORUI["edui138"].Stateful_onMouseOver(event, this);'
												onmouseout='$EDITORUI["edui138"].Stateful_onMouseOut(event, this);'>
												<div class="edui-button-wrap">
													<div id="edui138_body" unselectable="on" title="合并多个单元格"
														class="edui-button-body" onmousedown="return false;"
														onclick='return $EDITORUI["edui138"]._onClick();'>
														<div class="edui-box edui-icon"></div>
													</div>
												</div>
											</div>
										</div>
										<div id="edui139"
											class="edui-box edui-button edui-for-mergeright">
											<div id="edui139_state"
												onmousedown='$EDITORUI["edui139"].Stateful_onMouseDown(event, this);'
												onmouseup='$EDITORUI["edui139"].Stateful_onMouseUp(event, this);'
												onmouseover='$EDITORUI["edui139"].Stateful_onMouseOver(event, this);'
												onmouseout='$EDITORUI["edui139"].Stateful_onMouseOut(event, this);'>
												<div class="edui-button-wrap">
													<div id="edui139_body" unselectable="on" title="右合并单元格"
														class="edui-button-body" onmousedown="return false;"
														onclick='return $EDITORUI["edui139"]._onClick();'>
														<div class="edui-box edui-icon"></div>
													</div>
												</div>
											</div>
										</div>
										<div id="edui140"
											class="edui-box edui-button edui-for-mergedown">
											<div id="edui140_state"
												onmousedown='$EDITORUI["edui140"].Stateful_onMouseDown(event, this);'
												onmouseup='$EDITORUI["edui140"].Stateful_onMouseUp(event, this);'
												onmouseover='$EDITORUI["edui140"].Stateful_onMouseOver(event, this);'
												onmouseout='$EDITORUI["edui140"].Stateful_onMouseOut(event, this);'>
												<div class="edui-button-wrap">
													<div id="edui140_body" unselectable="on" title="下合并单元格"
														class="edui-button-body" onmousedown="return false;"
														onclick='return $EDITORUI["edui140"]._onClick();'>
														<div class="edui-box edui-icon"></div>
													</div>
												</div>
											</div>
										</div>
										<div id="edui141"
											class="edui-box edui-button edui-for-splittocells">
											<div id="edui141_state"
												onmousedown='$EDITORUI["edui141"].Stateful_onMouseDown(event, this);'
												onmouseup='$EDITORUI["edui141"].Stateful_onMouseUp(event, this);'
												onmouseover='$EDITORUI["edui141"].Stateful_onMouseOver(event, this);'
												onmouseout='$EDITORUI["edui141"].Stateful_onMouseOut(event, this);'>
												<div class="edui-button-wrap">
													<div id="edui141_body" unselectable="on" title="完全拆分单元格"
														class="edui-button-body" onmousedown="return false;"
														onclick='return $EDITORUI["edui141"]._onClick();'>
														<div class="edui-box edui-icon"></div>
													</div>
												</div>
											</div>
										</div>
										<div id="edui142"
											class="edui-box edui-button edui-for-splittorows">
											<div id="edui142_state"
												onmousedown='$EDITORUI["edui142"].Stateful_onMouseDown(event, this);'
												onmouseup='$EDITORUI["edui142"].Stateful_onMouseUp(event, this);'
												onmouseover='$EDITORUI["edui142"].Stateful_onMouseOver(event, this);'
												onmouseout='$EDITORUI["edui142"].Stateful_onMouseOut(event, this);'>
												<div class="edui-button-wrap">
													<div id="edui142_body" unselectable="on" title="拆分成行"
														class="edui-button-body" onmousedown="return false;"
														onclick='return $EDITORUI["edui142"]._onClick();'>
														<div class="edui-box edui-icon"></div>
													</div>
												</div>
											</div>
										</div>
										<div id="edui143"
											class="edui-box edui-button edui-for-splittocols">
											<div id="edui143_state"
												onmousedown='$EDITORUI["edui143"].Stateful_onMouseDown(event, this);'
												onmouseup='$EDITORUI["edui143"].Stateful_onMouseUp(event, this);'
												onmouseover='$EDITORUI["edui143"].Stateful_onMouseOver(event, this);'
												onmouseout='$EDITORUI["edui143"].Stateful_onMouseOut(event, this);'>
												<div class="edui-button-wrap">
													<div id="edui143_body" unselectable="on" title="拆分成列"
														class="edui-button-body" onmousedown="return false;"
														onclick='return $EDITORUI["edui143"]._onClick();'>
														<div class="edui-box edui-icon"></div>
													</div>
												</div>
											</div>
										</div>
										<div id="edui144" class="edui-box edui-separator "></div>
										<div id="edui145"
											class="edui-box edui-button edui-for-fullscreen">
											<div id="edui145_state"
												onmousedown='$EDITORUI["edui145"].Stateful_onMouseDown(event, this);'
												onmouseup='$EDITORUI["edui145"].Stateful_onMouseUp(event, this);'
												onmouseover='$EDITORUI["edui145"].Stateful_onMouseOver(event, this);'
												onmouseout='$EDITORUI["edui145"].Stateful_onMouseOut(event, this);'>
												<div class="edui-button-wrap">
													<div id="edui145_body" unselectable="on" title="全屏"
														class="edui-button-body" onmousedown="return false;"
														onclick='return $EDITORUI["edui145"]._onClick();'>
														<div class="edui-box edui-icon"></div>
														<div class="edui-box edui-label"></div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div id="edui1_toolbarmsg" class="edui-editor-toolbarmsg"
								style="display: none;">
								<div id="edui1_upload_dialog"
									class="edui-editor-toolbarmsg-upload"
									onclick='$EDITORUI["edui1"].showWordImageDialog();'>点击上传</div>
								<div class="edui-editor-toolbarmsg-close"
									onclick='$EDITORUI["edui1"].hideToolbarMsg();'>x</div>
								<div id="edui1_toolbarmsg_label"
									class="edui-editor-toolbarmsg-label"></div>
								<div style="height: 0; overflow: hidden; clear: both;"></div>
							</div>
						</div>
						<div style="overflow: hidden; height: 240px;"
							id="edui1_iframeholder" class="edui-editor-iframeholder">
							<iframe
								src="javascript:void(function(){document.open();document.write(&quot;<!DOCTYPE html><html xmlns='http://www.w3.org/1999/xhtml' class='view'><head><style type='text/css'>.selectTdClass{background-color:#3399FF !important;}table.noBorderTable td{border:1px dashed #ddd !important}table{clear:both;border-collapse:collapse;word-break:break-all;}.pagebreak{display:block;clear:both !important;cursor:default !important;width: 100% !important;margin:0;}.anchorclass{background: url('') no-repeat scroll left center transparent;border: 1px dotted #0000FF;cursor: auto;display: inline-block;height: 16px;width: 15px;}.view{padding:0;word-wrap:break-word;cursor:text;height:100%;}
body{margin:8px;font-family:'宋体';font-size:12px;background-color:#F4F4F4}li{clear:both}p{margin:0;padding:0;outline:0;border:0;line-height:1.8;}img{vertical-align:top;}0</style></head><body></body><script id='ueditorInstant'>window.parent.UE.instants['ueditorInstant0']._setup(document);</script></html>&quot;);document.close();}())"
								id="baidu_editor_0" frameborder="0" height="100%" width="100%"></iframe>
						</div>
						<div id="edui1_bottombar" class="edui-editor-bottomContainer">
							<table>
								<tbody>
									<tr>
										<td id="edui1_elementpath" class="edui-editor-bottombar"></td>
										<td id="edui1_wordcount" class="edui-editor-wordcount">字数统计</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<textarea style="display: none;" id="content"></textarea>
			</div>
		</div>
		<div
			class="ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide"
			id="advancedSetting">

			<!--技术支持-->
			<div class="setline">
				<div class="setTitle">
					<a class="siteGroupBtn siteGroupPop" target="_blank"
						href="http://jz.faisco.com/proFunc.jsp"
						title="隐藏技术支持为“网站推广版”功能，点击查看详细功能列表">&nbsp;</a> 技术支持：
				</div>
				<div class="setCtrl setRadio">
					<input checked="checked" disabled="disabled" id="supportShow"
						name="supportRadio" type="radio"><span
						onclick="$('#supportShow')[0].click();">显示</span> <input
						disabled="disabled" id="supportHidden" name="supportRadio"
						type="radio"><span
							onclick="$('#supportHidden')[0].click();">隐藏</span> <!-- 提示购买升级 -->
							&nbsp;&nbsp;<span style="color: red">[网站推广版功能]&nbsp;</span> <a
							href="http://www.faisco.cn/jump.jsp?t=3" target="_blank">立即升级</a>
							<!-- //end 提示购买升级 -->
				</div>
			</div>
			<!--//end 技术支持-->

			<!--管理登录-->
			<div class="setline">
				<div class="setTitle">管理登录：</div>
				<div class="setCtrl setRadio hard-width-150">
					<input checked="checked" id="loginShow" name="manageRadio"
						type="radio"><label for="loginShow">显示</label> <input
						id="loginHidden" name="manageRadio" type="radio"><label
							for="loginHidden">隐藏</label>
				</div>
				<!--<div style="clear:both;"></div>-->
				<div id="loginHideMsg"
					style="float: left; color: rgb(102, 102, 102); display: none;">
					隐藏管理登录后，可以从<a href="http://www.faisco.cn/" target="_blank">http://www.faisco.cn</a>登录。
				</div>
			</div>
			<!--// end 管理登录-->
			<!--手机版start-->

			<div style="clear: both;"></div>
			<div class="setline">
				<div class="setTitle">手机版：</div>
				<div class="setCtrl setRadio hard-width-150">
					<input checked="checked" id="mobileShow" name="mobileRadio"
						type="radio"><label for="mobileShow">显示</label> <input
						id="mobileHidden" name="mobileRadio" type="radio"><label
							for="mobileHidden">隐藏</label>
				</div>
			</div>
			<!--手机版end-->
			<!--备案号-->
			<!--end 备案号-->
		</div>
	</div>
	<div
		style="position: fixed; left: 0px; top: 0px; width: 0px; height: 0px;"
		id="edui_fixedlayer">
		<div style="display: none;" id="edui90"
			class="edui-dialog edui-for-inserttable">
			<div class="edui-dialog-wrap">
				<div id="edui90_body" class="edui-dialog-body">
					<div class="edui-dialog-shadow"></div>
					<div id="edui90_titlebar" class="edui-dialog-titlebar">
						<div class="edui-dialog-draghandle"
							onmousedown='$EDITORUI["edui90"]._onTitlebarMouseDown(event, this);'>
							<span class="edui-dialog-caption">表格</span>
						</div>
						<div id="edui93"
							class="edui-box edui-button edui-dialog-closebutton">
							<div id="edui93_state"
								onmousedown='$EDITORUI["edui93"].Stateful_onMouseDown(event, this);'
								onmouseup='$EDITORUI["edui93"].Stateful_onMouseUp(event, this);'
								onmouseover='$EDITORUI["edui93"].Stateful_onMouseOver(event, this);'
								onmouseout='$EDITORUI["edui93"].Stateful_onMouseOut(event, this);'>
								<div class="edui-button-wrap">
									<div id="edui93_body" unselectable="on"
										class="edui-button-body" onmousedown="return false;"
										onclick='return $EDITORUI["edui93"]._onClick();'>
										<div class="edui-box edui-icon"></div>
										<div class="edui-box edui-label"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div id="edui90_content" class="edui-dialog-content"></div>
				</div>
			</div>
		</div>
		<div style="display: none;" id="edui91"
			class="edui-mask  edui-dialog-modalmask"
			onmousedown='return $EDITORUI["edui91"]._onMouseDown(event, this);'></div>
		<div style="display: none;" id="edui92"
			class="edui-mask  edui-dialog-dragmask"
			onmousedown='return $EDITORUI["edui92"]._onMouseDown(event, this);'></div>
		<div style="display: none;" id="edui130"
			class="edui-dialog edui-for-edittd">
			<div class="edui-dialog-wrap">
				<div id="edui130_body" class="edui-dialog-body">
					<div class="edui-dialog-shadow"></div>
					<div id="edui130_titlebar" class="edui-dialog-titlebar">
						<div class="edui-dialog-draghandle"
							onmousedown='$EDITORUI["edui130"]._onTitlebarMouseDown(event, this);'>
							<span class="edui-dialog-caption">单元格属性</span>
						</div>
						<div id="edui131"
							class="edui-box edui-button edui-dialog-closebutton">
							<div id="edui131_state"
								onmousedown='$EDITORUI["edui131"].Stateful_onMouseDown(event, this);'
								onmouseup='$EDITORUI["edui131"].Stateful_onMouseUp(event, this);'
								onmouseover='$EDITORUI["edui131"].Stateful_onMouseOver(event, this);'
								onmouseout='$EDITORUI["edui131"].Stateful_onMouseOut(event, this);'>
								<div class="edui-button-wrap">
									<div id="edui131_body" unselectable="on" title="关闭对话框"
										class="edui-button-body" onmousedown="return false;"
										onclick='return $EDITORUI["edui131"]._onClick();'>
										<div class="edui-box edui-icon"></div>
										<div class="edui-box edui-label"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div id="edui130_content" class="edui-dialog-content"></div>
				</div>
			</div>
		</div>
		<div style="display: none;" id="edui146"
			class="edui-popup  edui-tool4">
			<div id="edui146_body" class="edui-popup-body">
				<iframe
					style="position: absolute; z-index: -1; left: 0; top: 0; background-color: white;"
					src="javascript:" frameborder="0" height="100%" width="100%"></iframe>
				<div class="edui-shadow"></div>
				<div id="edui146_content" class="edui-popup-content"></div>
			</div>
		</div>
	</div>
</body>
</html>