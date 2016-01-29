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
	<link type="text/css" href="${ctx_web}/css/site/nav.min.css" rel="stylesheet">
<style>
.firstLevel li .itemName{width:160px; float:left;cursor:move; }
.secondLevel li .itemName{width:135px; float:left;cursor:move; }
.thirdLevel li .itemName{width:115px; float:left;cursor:move; }
.dl{ width: 600px;padding: 0px;margin: 0px;height: 27px;min-height: 22px;line-height: 27px;max-height: none;_height: 22px; }
.dl{ float: left;background-color: whiteSmoke;margin-left: 8px; /*margin-left: auto; margin-right: auto;*/ border:1px solid #B5C8EB; border-radius: 2px; }
.secondLevel li .dl{ width: 580px; }
.thirdLevel li .dl{ width: 560px; } 
.firstLevel li .mark { float: left;height: 27px;clear: left;line-height: 26px; }
.firstLevel .arrow { background: url(${ctx_web}/image/bg01.png) -1545px -62px no-repeat; cursor: pointer; }
.totalCount{ margin-left: 20px; }
.sibling-dropzone{ clear:both; height:10px; font-size:0px; overflow:hidden; border-radius: 2px; }
.child-pre-div{ border-radius: 2px; }
.tail-dropzone{ clear:both; height:20px; font-size:0px; overflow:hidden; border-radius: 2px;}
.itemOpenIco{ width:20px; }
</style>
<script type="text/javascript">

var arrDeletedID = new Array();
var changedItemID = new Array();
var frame = false;
var tmpDataList = [{"parentId":0,"name":"首页","other":{},"url":"/index.jsp","id":2,"type":2,"openCusUrl":false,"openType":false,"all":true,"buddy":true,"byMemberLevel":true,"authMemberLevelId":0,"authBuddyGroupIdList":[],"tipsName":"系统栏目(首页)","check":true},{"parentId":0,"name":"我们的服务","other":{"title":""},"url":"/col.jsp?id=103","id":103,"type":1,"openCusUrl":false,"openType":false,"all":true,"buddy":true,"byMemberLevel":true,"authMemberLevelId":0,"authBuddyGroupIdList":[],"tipsName":"自定义栏目","check":true},{"parentId":0,"name":"新闻动态","other":{},"url":"/nr.jsp","id":21,"type":21,"openCusUrl":false,"openType":false,"all":true,"buddy":true,"byMemberLevel":true,"authMemberLevelId":0,"authBuddyGroupIdList":[],"tipsName":"系统栏目(文章列表)","check":true},{"parentId":0,"name":"关于我们","other":{},"url":"/col.jsp?id=101","id":101,"type":1,"openCusUrl":false,"openType":false,"all":true,"buddy":true,"byMemberLevel":true,"authMemberLevelId":0,"authBuddyGroupIdList":[],"tipsName":"自定义栏目","check":true},{"parentId":0,"name":"联系我们","other":{},"url":"/col.jsp?id=102","id":102,"type":1,"openCusUrl":false,"openType":false,"all":true,"buddy":true,"byMemberLevel":true,"authMemberLevelId":0,"authBuddyGroupIdList":[],"tipsName":"自定义栏目","check":true},{"parentId":0,"name":"留言板","other":{},"url":"/msgBoard.jsp","id":9,"type":9,"openCusUrl":false,"openType":false,"all":true,"buddy":true,"byMemberLevel":true,"authMemberLevelId":0,"authBuddyGroupIdList":[],"tipsName":"系统栏目(留言板)","check":true},{"parentId":0,"name":"产品展示","other":{},"url":"/pr.jsp","id":12,"type":12,"openCusUrl":false,"openType":false,"all":true,"buddy":true,"byMemberLevel":true,"authMemberLevelId":0,"authBuddyGroupIdList":[],"tipsName":"系统栏目(产品列表)","check":false},{"parentId":0,"name":"购物车","other":{},"url":"/mcart.jsp","id":13,"type":13,"openCusUrl":false,"openType":false,"all":true,"buddy":true,"byMemberLevel":true,"authMemberLevelId":0,"authBuddyGroupIdList":[],"tipsName":"系统栏目(购物车)","check":false},{"parentId":0,"name":"会员注册","other":{},"url":"/signup.jsp","id":17,"type":17,"openCusUrl":false,"openType":false,"all":true,"buddy":true,"byMemberLevel":true,"authMemberLevelId":0,"authBuddyGroupIdList":[],"tipsName":"系统栏目(会员注册)","check":false},{"parentId":0,"name":"会员登录","other":{},"url":"/login.jsp","id":18,"type":18,"openCusUrl":false,"openType":false,"all":true,"buddy":true,"byMemberLevel":true,"authMemberLevelId":0,"authBuddyGroupIdList":[],"tipsName":"系统栏目(会员登录)","check":false}];
var buddyGroup = [];
var allPerResult = {};
var siteColNameMax = 50;
var closeGroupOption = true;
var memberLevel = [{"aid":7570029,"wid":0,"id":0,"name":"普通会员","discount":100,"needItg":0},{"aid":7570029,"wid":0,"id":1,"name":"黄金会员","discount":100,"needItg":0},{"aid":7570029,"wid":0,"id":2,"name":"白金会员","discount":100,"needItg":0},{"aid":7570029,"wid":0,"id":3,"name":"钻石会员","discount":100,"needItg":0}];
var hiddenChildrenMap = {};
var popupID = <%=popupID%>;

function cancel() {
	document.location.reload();
}

$(function(){
	if (!frame) {
		Fai.addPopupWindowBtn(popupID, {id:'save', extClass:'saveButton', text:'保 存', click:save, disable:true});
		Fai.addPopupWindowBtn(popupID, {id:'close', extClass:'cancelButton', text:'取 消', click:'close'});
	}
	printColList();

	$("#navForm").focus();

	//页面加载完后再执行，必须放在在页面加载尾，判断页面内容是否发生改变
	Site.loadPageChange({unBindId:[],popupID:popupID});
});

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
				if(!$(this).parents().hasClass("thirdLevel")){
					var colId = $(this).parent().attr( "colId" );
					$("#libuttom" + colId ).css({ "backgroundColor" : '#ccc', "height" : draHeight });
				}
			}else{
				$(this).css({ "backgroundColor" : '#ccc', "height" : draHeight });
			}
        },
        out: function(e, ui) {
			if($(this).hasClass("dl")){
				if(!$(this).parents().hasClass("thirdLevel")){
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
		if(level !== "thirdLevel" && isOpen){
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
			if($(this).find(".thirdLevel > li").length)
			{
				$(this).find(".mark").addClass("arrowLeft");
				$(this).find(".thirdLevel").css("display", "none");
			}
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
		if( id === 2 ){
			return;
		}
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
function save(){
	Site.enablePopupFrameBtn(frame, popupID, 'save', false);
	Fai.ing("正在保存栏目信息……", false);
	var sortable = $("#sortable > li");
	var orderList = new Array();
	var mdList = new Array();	
	$.each(sortable, function(i, n){
		var tmpid = parseInt($(this).attr("id"));
		var newThisData = allPerResult["perData"+ tmpid ];
		orderList.push( tmpid );
		var other = {};
		var obj1 = {
			id: tmpid,
			hidden: $(this).find(".itemOpenIco").first().hasClass("checked_off")
		};
		
		if(newThisData!=null){
			obj1["name"] = newThisData.name;
			other = newThisData.other;
			obj1.other = other;
			obj1.parentId = newThisData.parentId;
			obj1.openCusUrl = newThisData.openCusUrl;
			obj1.openType = newThisData.openType;
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
			var other2 = {};
			var obj2 = {
				id: tmpid2,
				hidden: $(this).find(".itemOpenIco").first().hasClass("checked_off")
			};
			if(newThisData2!=null){
				obj2["name"] = newThisData2.name;
				other2 = newThisData2.other;
				obj2.other = other2;
				obj2.parentId = newThisData2.parentId;
				obj2.openCusUrl = newThisData2.openCusUrl;
				obj2.openType = newThisData2.openType;
				obj2.url = newThisData2.url;		
				obj2.all = newThisData2.all;
				obj2.buddy = newThisData2.buddy;
				obj2.authBuddyGroupIdList = newThisData2.authBuddyGroupIdList;
				obj2.authMemberLevelId = newThisData2.authMemberLevelId;
				obj2.byMemberLevel = newThisData2.byMemberLevel;
			}
			mdList.push(obj2);
			
			var parentId2 = $(this).attr("id");

			//加入三级导航
			$.each($(this).children("ul").find("li"), function(i, n){
				var tmpid3 = parseInt($(this).attr("id").replace("childDivItem", ""));
				var newThisData3 = allPerResult["perData"+$(this).attr("id")];
				orderList.push( tmpid3 );
				var other3 = {};
				var obj3 = {
					id: tmpid3,
					hidden: $(this).find(".itemOpenIco").first().hasClass("checked_off")
				};
				if(newThisData3!=null){
					obj3["name"] = newThisData3.name;
					other3 = newThisData3.other;
					obj3.other = other3;
					obj3.parentId = newThisData3.parentId;
					obj3.openCusUrl = newThisData3.openCusUrl;
					obj3.openType = newThisData3.openType;
					obj3.url = newThisData3.url;
					obj3.all = newThisData3.all;
					obj3.buddy = newThisData3.buddy;
					obj3.authBuddyGroupIdList = newThisData3.authBuddyGroupIdList;
					obj3.authMemberLevelId = newThisData3.authMemberLevelId;
					obj3.byMemberLevel = newThisData3.byMemberLevel;
				}
				mdList.push(obj3);
			});
		});
	});
	var orderListJson = $.toJSON(orderList);
	var mdListJson = $.toJSON(mdList);
	//取被删除的栏目的ID;
	var rmIdList = arrDeletedID;
	var rmListJson = $.toJSON(rmIdList);
	var params = "ot=1&order=" + Fai.encodeUrl(orderListJson) + "&mdList=" + Fai.encodeUrl(mdListJson)+ "&rmList=" + Fai.encodeUrl(rmListJson);
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
			if( bak.type === 1 || bak.type === 4 || bak.type === 3 ){
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
	
	if( updateCol.type === 1 ){
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
			//二、三级栏目
			if( idPidMap[ colData.data.parentId ] !== 0 ){
				//三级栏目  三级栏目不允许右移了
				return;
			}
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
			//二、三级栏目
			if( idPidMap[ colData.data.parentId ] !== 0 ){
				//三级栏目  三级栏目不允许右移了
				return false;
			}
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
			if( !bCol[data.parentId] && !bCol[data.id] ){
				//父栏目不为二级栏目且自己也不是二级栏目，则不是三级栏目了  所以要变更为三级栏目
				//向上寻找最终的父栏目  直到父栏目为二级栏目
				var finalParentId = data.parentId;
				var loops = 0;
				while( !bCol[ finalParentId ] && bcCol[finalParentId] && loops < 5 ){
                    loops ++;
					finalParentId = bcCol[finalParentId].parentId;
				}
				if( loops < 5 ){
					data.parentId = finalParentId;
				}else{
					//循环过5次的栏目更改为1级栏目（防止初始化栏目管理时页面死循环，A，B栏目互为对方的父栏目时，就会死循环。 可以打开两个管理栏目页面。分别设A为B父栏目，B为A父栏目。 ）
					data.parentId = 0;
				}
				
				if( data.parentId === 0 ){
					aCol[data.id] = data;
					bCol[data.id] = null;
					$.each( tmpDataList, function( _i, _data ){
						if( _data.id === data.id ){
							_data.parentId = 0;
							_data.check = false;
							return false;
						}
					});
				}
				
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
	$("#sortable > li, .secondLevel > li, .secondLevel > li,.thirdLevel > li").find("dl").hover( function(e){
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
	Site.popupWindow({ title:'编辑栏目', frameSrcUrl:'manage/colEdit.jsp?id=' + id +'&model=jsEdit', width:425, height:240, callArgs:editedData, closeFunc: closeEdit});
}

function addNavCol(parentId){
	Site.logDog( 100055, 0 );
	var editedData = {};
	editedData.colList = $.extend( true, [], tmpDataList );
	Site.popupWindow({ title:'添加栏目', frameSrcUrl:'manage/colEdit.jsp?model=jsAdd&parentId='+parentId, width:425, height:240, /*callArgs:editedData,*/ closeFunc: closeAdd});
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
<body class="popupBody">
<div id="navForm" style=" float:left; width:99%; border:0px solid #000; margin:0; padding:0;">
	<div style="float: right; margin: 1px 0px;"><input value="添加栏目" class="faiButton" onclick="addNavCol();" type="button"></div>
    <div id="navList" class="list" style="margin:2px 0px;  border-left:1px solid #B5C8EB;border-right:1px solid #B5C8EB; overflow-x:hidden; ">
		<div class="listBanner">
			<ul>
				<li style="width:15px;"></li>
				<li style="width:165px;"><span>栏目名称</span></li>
                <li style="width:80px;"><span></span></li>
				<li style="width:120px;"><span>栏目类型</span></li>
				<li style="width:60px;"><span>开启栏目</span></li>
				<li style="width:165px; float:left; text-align:center;"><span>操作</span></li>
			</ul>
		</div>
		<div style="clear:both;position:relative;width:100%;overflow-x:hidden;height:362px;overflow-y:auto;">
				<ul id="sortable" class="firstLevel">
					<li id="2" colid="2">
						<div class="sibling-dropzone ui-droppable"></div>
						<dl id="part2" class="dl ui-droppable">
							<div id="li2" class="mark" onclick="hiddenChildren(this)">&nbsp;</div>
							<div id="editableDiv2" class="itemName">
								<div id="col2" class=" ellipsis noWrap" style="width: 80%;">首页</div>
							</div>
							<div
								style="width: 80px; height: 27px; float: left; padding: 0px 2px;">
								<div class="moveOpDiv" style="display: none;">
									<a onclick="return false;" href="javascript:;" hidefocus="true"
										class="col-up" style="cursor: default; background: none;"></a>
									<a colid="2" pid="0"
										onclick="moveCol(this,'down');return false;"
										href="javascript:;" hidefocus="true" title="下移"
										class="col-down"></a> <a onclick="return false;"
										href="javascript:;" hidefocus="true" class="col-left"
										style="cursor: default; background: none;"></a> <a
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
									<a id="editButton2" class="linkButton" onclick="popupProp(2);">[编辑]</a>&nbsp;
									<a id="designOrView2" class="linkButton"
										href="http://seeyoui.faisco.cn/index.jsp" target="_blank">[设计]</a>
								</div>
							</div>
						</dl>
						<div class="addColIcon" title="点击添加栏目" onclick="addNavCol(2);"></div>
						<div id="libuttom2" class="child-pre-div"
							style="margin-left: 20px; margin-top: 0px;"></div>
					</li>
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
									<a colid="103" pid="0"
										onclick="moveCol(this,'up');return false;" href="javascript:;"
										hidefocus="true" title="上移" class="col-up"></a><a colid="103"
										pid="0" onclick="moveCol(this,'down');return false;"
										href="javascript:;" hidefocus="true" title="下移"
										class="col-down"></a><a onclick="return false;"
										href="javascript:;" hidefocus="true" class="col-left"
										style="cursor: default; background: none;"></a><a colid="103"
										pid="0" onclick="moveCol(this,'right');return false;"
										href="javascript:;" hidefocus="true" title="右移"
										class="col-right"></a>
								</div>
							</div>
							<div class="itemType" title="按住鼠标可拖动栏目进行排序">
								<span>自定义栏目</span>
							</div>
							<div class="itemOpen">
								<span class="itemOpenIco checked_on" id="checkbox103"
									onclick="hiddenClick(this, 103, 103);" title="点击隐藏栏目"></span>
							</div>
							<div class="itemManage">
								<div class="manageItem">
									<a id="editButton103" class="linkButton"
										onclick="popupProp(103);">[编辑]</a>&nbsp;<a
										id="designOrView103" class="linkButton"
										href="http://seeyoui.faisco.cn/col.jsp?id=103" target="_blank">[设计]</a><a
										href="javascript:;" class="linkButton"
										onclick="onDel(103);return false;">&nbsp;[删除]</a>
								</div>
							</div>
						</dl>
						<div class="addColIcon" title="点击添加栏目" onclick="addNavCol(103);"></div>
						<div id="libuttom103" class="child-pre-div"
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
									<a colid="21" pid="0"
										onclick="moveCol(this,'up');return false;" href="javascript:;"
										hidefocus="true" title="上移" class="col-up"></a><a colid="21"
										pid="0" onclick="moveCol(this,'down');return false;"
										href="javascript:;" hidefocus="true" title="下移"
										class="col-down"></a><a onclick="return false;"
										href="javascript:;" hidefocus="true" class="col-left"
										style="cursor: default; background: none;"></a><a colid="21"
										pid="0" onclick="moveCol(this,'right');return false;"
										href="javascript:;" hidefocus="true" title="右移"
										class="col-right"></a>
								</div>
							</div>
							<div class="itemType" title="按住鼠标可拖动栏目进行排序">
								<span>系统栏目(文章列表)</span>
							</div>
							<div class="itemOpen">
								<span class="itemOpenIco checked_on" id="checkbox21"
									onclick="hiddenClick(this, 21, 21);" title="点击隐藏栏目"></span>
							</div>
							<div class="itemManage">
								<div class="manageItem">
									<a id="editButton21" class="linkButton"
										onclick="popupProp(21);">[编辑]</a>&nbsp;<a id="designOrView21"
										class="linkButton" href="http://seeyoui.faisco.cn/nr.jsp"
										target="_blank">[设计]</a>
								</div>
							</div>
						</dl>
						<div class="addColIcon" title="点击添加栏目" onclick="addNavCol(21);"></div>
						<div id="libuttom21" class="child-pre-div"
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
										onclick="moveCol(this,'up');return false;" href="javascript:;"
										hidefocus="true" title="上移" class="col-up"></a><a colid="101"
										pid="0" onclick="moveCol(this,'down');return false;"
										href="javascript:;" hidefocus="true" title="下移"
										class="col-down"></a><a onclick="return false;"
										href="javascript:;" hidefocus="true" class="col-left"
										style="cursor: default; background: none;"></a><a colid="101"
										pid="0" onclick="moveCol(this,'right');return false;"
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
										href="http://seeyoui.faisco.cn/col.jsp?id=101" target="_blank">[设计]</a><a
										href="javascript:;" class="linkButton"
										onclick="onDel(101);return false;">&nbsp;[删除]</a>
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
								<div class="moveOpDiv" style="display: none;">
									<a colid="102" pid="0"
										onclick="moveCol(this,'up');return false;" href="javascript:;"
										hidefocus="true" title="上移" class="col-up"></a><a colid="102"
										pid="0" onclick="moveCol(this,'down');return false;"
										href="javascript:;" hidefocus="true" title="下移"
										class="col-down"></a><a onclick="return false;"
										href="javascript:;" hidefocus="true" class="col-left"
										style="cursor: default; background: none;"></a><a colid="102"
										pid="0" onclick="moveCol(this,'right');return false;"
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
										href="http://seeyoui.faisco.cn/col.jsp?id=102" target="_blank">[设计]</a><a
										href="javascript:;" class="linkButton"
										onclick="onDel(102);return false;">&nbsp;[删除]</a>
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
									<a colid="9" pid="0" onclick="moveCol(this,'up');return false;"
										href="javascript:;" hidefocus="true" title="上移" class="col-up"></a><a
										onclick="return false;" href="javascript:;" hidefocus="true"
										class="col-up" style="cursor: default; background: none;"></a><a
										onclick="return false;" href="javascript:;" hidefocus="true"
										class="col-left" style="cursor: default; background: none;"></a><a
										colid="9" pid="0"
										onclick="moveCol(this,'right');return false;"
										href="javascript:;" hidefocus="true" title="右移"
										class="col-right"></a>
								</div>
							</div>
							<div class="itemType" title="按住鼠标可拖动栏目进行排序">
								<span>系统栏目(留言板)</span>
							</div>
							<div class="itemOpen">
								<span class="itemOpenIco checked_on" id="checkbox9"
									onclick="hiddenClick(this, 9, 9);" title="点击隐藏栏目"></span>
							</div>
							<div class="itemManage">
								<div class="manageItem">
									<a id="editButton9" class="linkButton" onclick="popupProp(9);">[编辑]</a>&nbsp;<a
										id="designOrView9" class="linkButton"
										href="http://seeyoui.faisco.cn/msgBoard.jsp" target="_blank">[设计]</a>
								</div>
							</div>
						</dl>
						<div class="addColIcon" title="点击添加栏目" onclick="addNavCol(9);"></div>
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
									<a onclick="return false;" href="javascript:;" hidefocus="true"
										class="col-up" style="cursor: default; background: none;"></a><a
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
										onclick="popupProp(12);">[编辑]</a>&nbsp;<a id="designOrView12"
										class="linkButton" href="http://seeyoui.faisco.cn/pr.jsp"
										target="_blank">[设计]</a>
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
									<a onclick="return false;" href="javascript:;" hidefocus="true"
										class="col-up" style="cursor: default; background: none;"></a><a
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
										onclick="popupProp(13);">[编辑]</a>&nbsp;<a id="designOrView13"
										class="linkButton" href="http://seeyoui.faisco.cn/mcart.jsp"
										target="_blank">[设计]</a>
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
									<a onclick="return false;" href="javascript:;" hidefocus="true"
										class="col-up" style="cursor: default; background: none;"></a><a
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
										onclick="popupProp(17);">[编辑]</a>&nbsp;<a id="designOrView17"
										class="linkButton" href="http://seeyoui.faisco.cn/signup.jsp"
										target="_blank">[设计]</a>
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
									<a onclick="return false;" href="javascript:;" hidefocus="true"
										class="col-up" style="cursor: default; background: none;"></a><a
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
										onclick="popupProp(18);">[编辑]</a>&nbsp;<a id="designOrView18"
										class="linkButton" href="http://seeyoui.faisco.cn/login.jsp"
										target="_blank">[设计]</a>
								</div>
							</div>
						</dl>
						<div id="libuttom18" class="child-pre-div"
							style="margin-left: 20px; margin-top: 0px;"></div></li>
					<div class="tail-dropzone ui-droppable"></div>
					<div class="tail-dropzone ui-droppable"></div>
				</ul>
			</div>
	</div>
</div>
<div style="clear:both;"></div>
<div class="totalCount">共<span id="totalCount">10</span>个</div>
</body>
</html>