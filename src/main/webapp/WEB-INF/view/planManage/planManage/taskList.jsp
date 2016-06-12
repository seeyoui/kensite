<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/taglib/common.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Kensite</title>
<%@ include file="/WEB-INF/view/taglib/header.jsp"%>
<%@ include file="/WEB-INF/view/taglib/layer.jsp" %>
<%@ include file="/WEB-INF/view/taglib/bootstrap.jsp"%>
<%@ include file="/WEB-INF/view/taglib/moment.jsp"%>
<style type="text/css">
.agile-detail a {
	margin-left: 5px;
}
.panel-body ul li p {
	margin-top: 5px;
}
</style>
</head>
<body class="fixed-sidebar full-height-layout gray-bg">
	<div class="wrapper wrapper-content  animated fadeInRight">
        <div class="row">
            <div class="col-sm-3">
                <div class="panel panel-primary">
					<div class="panel-heading">
						<i class="fa fa-file-text-o"></i> 正常进行中
					</div>
					<div class="panel-body">
						<ul class="sortable-list connectList agile-list">
							<c:forEach var="currentTask" items="${currentTaskList}" varStatus="status">
							<c:if test="${currentTask.SEQUENCE == '0'}">
							<li class="danger-element">
							</c:if>
							<c:if test="${currentTask.SEQUENCE == '1'}">
							<li class="warning-element">
							</c:if>
							<c:if test="${currentTask.SEQUENCE == '2'}">
							<li class="info-element">
							</c:if>
							<c:if test="${currentTask.SEQUENCE == '3'}">
							<li class="success-element">
							</c:if>
                            	<span class="label label-primary">${currentTask.PROJECT }</span>
                            	<span class="badge badge-success pull-right">${currentTask.NAME }</span>
									<p>${currentTask.DESCRIBE }</p>
                                <div class="agile-detail">
                                    <a href="javascript:void(0)" class="pull-right btn btn-xs btn-danger" onclick="delayFinish('${delayTask.ID }')">延期</a>
                                    <a href="javascript:void(0)" class="pull-right btn btn-xs btn-primary" onclick="taskFinish('${currentTask.ID }')">完成</a>
                                    <i class="fa fa-clock-o"></i> ${fn:substringBefore(currentTask.END_DATE, " ")}
                                    <span class="badge badge-warning">${currentTask.DAYS }</span>
                                </div>
                            </li>
							</c:forEach>
                        </ul>
					</div>
					<div class="panel-footer">
						任务总数：${currentTaskList.size()}
					</div>
				</div>
            </div>
            <div class="col-sm-3">
                <div class="panel panel-danger">
					<div class="panel-heading">
						<i class="fa fa-frown-o"></i> 延期进行中
					</div>
					<div class="panel-body">
						<ul class="sortable-list connectList agile-list">
                            <c:forEach var="delayTask" items="${delayTaskList}" varStatus="status">
							<c:if test="${delayTask.SEQUENCE == '0'}">
							<li class="danger-element">
							</c:if>
							<c:if test="${delayTask.SEQUENCE == '1'}">
							<li class="warning-element">
							</c:if>
							<c:if test="${delayTask.SEQUENCE == '2'}">
							<li class="info-element">
							</c:if>
							<c:if test="${delayTask.SEQUENCE == '3'}">
							<li class="success-element">
							</c:if>
                            	<span class="label label-primary">${delayTask.PROJECT }</span>
                            	<span class="badge badge-success pull-right">${delayTask.NAME }</span>
									<p>${delayTask.DESCRIBE }</p>
                                <div class="agile-detail">
                                    <a href="javascript:void(0)" class="pull-right btn btn-xs btn-danger" onclick="delayFinish('${delayTask.ID }')">延期</a>
                                    <a href="javascript:void(0)" class="pull-right btn btn-xs btn-primary" onclick="taskFinish('${delayTask.ID }')">完成</a>
                                    <i class="fa fa-clock-o"></i> ${fn:substringBefore(delayTask.END_DATE, " ")}
                                    <span class="badge badge-warning">${delayTask.DAYS }</span>
                                </div>
                            </li>
							</c:forEach>
                        </ul>
					</div>
					<div class="panel-footer">
						任务总数：${delayTaskList.size()}
					</div>
				</div>
            </div>
            <div class="col-sm-3">
                <div class="panel panel-info">
					<div class="panel-heading">
						<i class="fa fa-meh-o"></i> 当天开始
					</div>
					<div class="panel-body">
						<ul class="sortable-list connectList agile-list">
                            <c:forEach var="todayStartTask" items="${todayStartTaskList}" varStatus="status">
							<c:if test="${todayStartTask.SEQUENCE == '0'}">
							<li class="danger-element">
							</c:if>
							<c:if test="${todayStartTask.SEQUENCE == '1'}">
							<li class="warning-element">
							</c:if>
							<c:if test="${todayStartTask.SEQUENCE == '2'}">
							<li class="info-element">
							</c:if>
							<c:if test="${todayStartTask.SEQUENCE == '3'}">
							<li class="success-element">
							</c:if>
                            	<span class="label label-primary">${todayStartTask.PROJECT }</span>
                            	<span class="badge badge-success pull-right">${todayStartTask.NAME }</span>
									<p>${todayStartTask.DESCRIBE }</p>
                                <div class="agile-detail">
                                    <i class="fa fa-clock-o"></i> ${fn:substringBefore(todayStartTask.END_DATE, " ")}
									<span class="badge badge-warning">${todayStartTask.DAYS }</span>
                                </div>
                            </li>
							</c:forEach>
                        </ul>
					</div>
					<div class="panel-footer">
						任务总数：${todayStartTaskList.size()}
					</div>
				</div>
            </div>
            <div class="col-sm-3">
                <div class="panel panel-warning">
					<div class="panel-heading">
						<i class="fa fa-smile-o"></i> 当天要完成
					</div>
					<div class="panel-body">
						<ul class="sortable-list connectList agile-list">
                            <c:forEach var="todayEndTask" items="${todayEndTaskList}" varStatus="status">
							<c:if test="${todayEndTask.SEQUENCE == '0'}">
							<li class="success-element">
							</c:if>
							<c:if test="${todayEndTask.SEQUENCE == '1'}">
							<li class="info-element">
							</c:if>
							<c:if test="${todayEndTask.SEQUENCE == '2'}">
							<li class="warning-element">
							</c:if>
							<c:if test="${todayEndTask.SEQUENCE == '3'}">
							<li class="danger-element">
							</c:if>
                            	<span class="label label-primary">${todayEndTask.PROJECT }</span>
                            	<span class="badge badge-success pull-right">${todayEndTask.NAME }</span>
									<p>${todayEndTask.DESCRIBE }</p>
                                <div class="agile-detail">
                                    <a href="javascript:void(0)" class="pull-right btn btn-xs btn-danger" onclick="delayFinish('${delayTask.ID }')">延期</a>
                                    <a href="javascript:void(0)" class="pull-right btn btn-xs btn-primary" onclick="taskFinish('${todayEndTask.ID }')">完成</a>
                                    <i class="fa fa-clock-o"></i> ${fn:substringBefore(todayEndTask.END_DATE, " ")}
                                </div>
                            </li>
							</c:forEach>
                        </ul>
					</div>
					<div class="panel-footer">
						任务总数：${todayEndTaskList.size()}
					</div>
				</div>
            </div>
        </div>
    </div>
</body>
<script type="text/javascript">
$(document).ready(function() {
});

function taskFinish(taskId) {
	//parent.$('#iframe').attr('src', $('#iframe').attr('src'));
	$.ajax({
		type: "post",
		url: '${ctx}/planManage/taskFinish',
		data: {taskId : taskId},
		dataType: 'json',
		timeout: layerLoadMaxTime,
		beforeSend: function(XMLHttpRequest){
			loadi = layer.load(2, {shade: layerLoadShade,time: layerLoadMaxTime});
		},
		success: function(data, textStatus){
			windowReload();
			//layer.close(loadi);
		},
		error: function(request, errType) {
			layer.close(loadi);
			//"timeout", "error", "notmodified" 和 "parsererror"
			if(errType == 'timeout') {
				layer.msg('请求超时', {offset: 'rb',icon: 6,shift: 8,time: layerMsgTime});
			}
			if(errType == 'error') {
				layer.msg('系统错误，请联系管理员', {offset: 'rb',icon: 6,shift: 8,time: layerMsgTime});
			}
		}
	});
}

function delayFinish(taskId) {
	var url = '${ctx}/planManage/planTaskDelay/delay?taskId='+taskId;
	layer.open({
	    type: 2,
	    title: '任务延期基本信息',
	    area: ['310px', '350px'],
	    fix: false, //不固定
	    maxmin: false,
	    content: url,
	    btn: ['保存', '取消'],
        success: function(layero, index){
            iframeBody = layer.getChildFrame('body', index);
            iframeWin = window[layero.find('iframe')[0]['name']];
        },
	    yes: function(index, layero) {
	    	if(iframeWin != null) {
	    		iframeWin.submitInfo();
	    	}
	    },
	    cancel: function(index){
	    	layer.close(index);
	    }
	});
}

function windowReload() {
	var bodyrel="temp"+Math.floor(Math.random()*100+1);
	var tIndex=0;
	$('body').attr("rel",bodyrel);
	$(window.parent.document).find("iframe").each(function(){
		var tRel=$(this.contentWindow.document).find("body").attr("rel");
		if(tRel==bodyrel){
			console.info($(this).attr("src"));
			$(this).attr("src", $(this).attr("src"));
		}
	});
}
</script>
</html>