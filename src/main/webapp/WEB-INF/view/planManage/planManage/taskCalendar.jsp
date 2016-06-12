<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/taglib/common.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Kensite</title>
<%@ include file="/WEB-INF/view/taglib/header.jsp"%>
<%@ include file="/WEB-INF/view/taglib/layer.jsp" %>
<%@ include file="/WEB-INF/view/taglib/fullcalendar.jsp"%>
<%@ include file="/WEB-INF/view/taglib/bootstrap.jsp"%>
<%@ include file="/WEB-INF/view/taglib/moment.jsp"%>
<script type="text/javascript" src="${ctx_bootstrap}/js/jquery-ui-1.10.4.min.js"></script>
<script type="text/javascript" src="${ctx_bootstrap}/js/content.min.js"></script>
<style type="text/css">
</style>
</head>
<body class="fixed-sidebar full-height-layout gray-bg">
	<div class="wrapper wrapper-content">
        <div class="row animated fadeInDown">
            <div class="col-sm-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>项目列表</h5>
                        <div class="ibox-tools">
                        </div>
                    </div>
                    <div class="ibox-content">
                        <div id='external-events'>
                        <div class="external-event navy-bg" onclick="taskCalendar('')">全部</div>
                        	<c:forEach var="project" items="${projectList}" varStatus="status">
                            <div class="external-event navy-bg" onclick="taskCalendar('${project.ID }', '${user.ID }')">${project.NAME }</div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>人员列表</h5>
                        <div class="ibox-tools">
                        </div>
                    </div>
                    <div class="ibox-content">
                        <div id='external-events'>
                        <div class="external-event navy-bg" onclick="taskCalendar('')">全部</div>
                        	<c:forEach var="user" items="${userList}" varStatus="status">
                            <div class="external-event navy-bg" onclick="taskCalendar('${project.ID }', '${user.ID }')">${user.NAME }</div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-9">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>任务日历 </h5>
                        <div class="ibox-tools">
                        </div>
                    </div>
                    <div class="ibox-content">
                        <div id="calendar"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script type="text/javascript">
$(document).ready(function() {
	$("#calendar").fullCalendar({
		header: {
			left:"prev,next today",
			center:"title",
			right:"month,agendaWeek,agendaDay"
		},
		editable: false,
		droppable: true,
		events: [
			<c:forEach var="task" items="${taskList}" varStatus="status">
			<c:if test="${task.STATUS eq 'normal'}">
			{title:'[${task.PROJECT}]${task.NAME}',start:'${task.START_DATE}',end:'${task.END_DATE}',color: '#23C6C8',textColor:'#ff0000',url:'javascript:showMessage("描述：${task.DESCRIBE}\n负责人：${task.NAME}")'},
			</c:if>
			<c:if test="${task.STATUS eq 'delay'}">
			{title:'[${task.PROJECT}]${task.NAME}',start:'${task.START_DATE}',end:'${task.END_DATE}',color: '#ED5565',textColor:'#ff0000',url:'javascript:showMessage("描述：${task.DESCRIBE}\n负责人：${task.NAME}")'},
			</c:if>
			<c:if test="${task.STATUS eq 'finish'}">
			{title:'[${task.PROJECT}]${task.NAME}',start:'${task.START_DATE}',end:'${task.END_DATE}',color: '#1AB394',textColor:'#ff0000',url:'javascript:showMessage("描述：${task.DESCRIBE}\n负责人：${task.NAME}")'},
			</c:if>
			<c:if test="${task.STATUS eq 'delay_finish'}">
			{title:'[${task.PROJECT}]${task.NAME}',start:'${task.START_DATE}',end:'${task.END_DATE}',color: '#F8AC59',textColor:'#ff0000',url:'javascript:showMessage("描述：${task.DESCRIBE}\n负责人：${task.NAME}")'},
			</c:if>
			</c:forEach>
		]
	})
});

function taskCalendar(projectId, userId) {
	var url = "${ctx}/planManage/taskCalendar?1=1";
	if(projectId != "") {
		url += "&projectId="+projectId;
	}
	if(userId != "") {
		url += "&userId="+userId;
	}
	window.location.href = url;
}

function showMessage(message) {
	parent.layer.open({
		title: '任务描述',
	    type: 1,
	    skin: 'layui-layer-demo', //样式类名
	    closeBtn: 0, //不显示关闭按钮
	    shift: 2,
	    area: ['300px', '200px'], //宽高
	    shadeClose: true, //开启遮罩关闭
	    content: '<p id="msg" style="margin-top: 5px;margin-left: 10px;">'+message+'</p>'
	});
}
</script>
</html>