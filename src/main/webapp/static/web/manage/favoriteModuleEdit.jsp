<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="com.seeyoui.kensite.common.util.*"%>
<%@ include file="/WEB-INF/view/taglib/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
<%@ include file="/WEB-INF/view/taglib/header.jsp"%>
<%
		String id = request.getParameter("id");
		String popupID = request.getParameter("popupID");
	%>
<link type="text/css" rel="stylesheet"
	href="${ctx_web}/css/manage.min.css?v=201601041813" />
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
<script type="text/javascript">
var addMode = <%=StringUtils.isBlank(id)%>;
var popupID = <%=popupID%>;
$(function(){
	$('#name').select();
	Fai.addPopupWindowBtn(popupID, {id:'save', extClass:'saveButton', text:'保 存', click:save});
	Fai.addPopupWindowBtn(popupID, {id:'close', extClass:'cancelButton', text:'取 消', click:'close'});

	$(".input").click(function(){
		$(this).addClass("inputOver");
	}).blur(function(){
		$(this).removeClass("inputOver");
	});

	$('#name').focus();
	
	//页面加载完后再执行，必须放在在页面加载尾，判断页面内容是否发生改变
	if( !addMode ){
		Site.loadPageChange({unBindId:[],popupID:popupID});
	}
});

function save() {
	//保存数据
	var name = $("#name").val();
	if (!Fai.checkValid(name, "模块标题", "nameErr", 0,50 )){
		return;
	}

	var params = "name=" + Fai.encodeUrl(name);

	Fai.ing("正在保存……", false);
	$.ajax({
		   	type: "post",
			url: '../ajax/module_h.jsp?cmd=add&global=true&style=65&colId=2&extId=0',
			data: params,
			error: function(){Fai.ing("服务繁忙，请稍候重试",false);},
			success: function(data){
				Fai.enablePopupWindowBtn(popupID, 'save', true);
				var res = $.parseJSON(data);
				reSetPageChange();
				if(Fai.successHandle(data, "修改成功", "系统错误", "", 3, 1)){
					if( addMode ){
						Site.addNewModule(res.id, res.div,null,null,{"returnModuledata":res.moduleData});
					}else{
						Site.refreshModule(res.id, res.div, name);
					}
					Fai.closePopupWindow( popupID );
				}
			}
	});

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
<style type="text/css">
.fontspan {
	display: block;
	width: 90px;
	float: left;
	text-align: right;
}

.title {
	width: 80px;
	float: left;
	text-align: right;
}

.ctrl {
	float: left;
	text-align: left;
}
</style>
</head>
<body class="popupBody">
	<div class="clearfloat"></div>
	<div class="formContent">
		<div id="moduleTitle"
			style="clear: both; height: 23px; line-height: 23px;">
			<div class="title">模块标题：</div>
			<div class="ctrl">
				<input id="name" name="name" class="input" style="width: 100px;"
					value="收藏本站" maxlength="50" type="text">
			</div>
			<div class="err">
				<div id="nameErr"></div>
			</div>
		</div>
	</div>
	<div class="clearfloat"></div>
</body>
</html>