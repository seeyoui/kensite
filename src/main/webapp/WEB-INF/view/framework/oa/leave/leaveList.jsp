<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/taglib/common.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<%@ include file="/WEB-INF/view/taglib/header.jsp" %>
</head>

<body class="page-body">
<div id="jsAutoHeight" class="scrollable" data-max-height="600">
	<div class="page-container" class="scrollable" data-max-height="400"><!-- add class "sidebar-collapsed" to close sidebar by default, "chat-visible" to make chat appear always -->
		<div class="main-content">
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-body">
							<script type="text/javascript">
				jQuery(document).ready(function($) {
					$("#jsAutoHeight").attr("data-max-height", $(window).height());
					$("#dataList").dataTable({
						dom: "<'toolbar'>rtip",
						"language": {
            				"url": "${ctx_assets}/js/datatables/zh_CN.txt"
        				},
        				"iDisplayLength" : 10
					});
					setTimeout(function(){
						$("div.toolbar").html('<button class="btn btn-secondary btn-icon btn-xs"><i class="fa-heart"></i><span>启动流程</span></button>');
					},500);
				});
				
				</script>
				
				<table class="table table-bordered table-striped" id="dataList">
					<thead>
						<tr>
							<th>请假编号</th>
							<th>创建人</th>
							<th>创建时间</th>
							<th>请假原因</th>
							<th>当前节点</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody class="middle-align">
						<c:forEach items="${leaveList}" var="leave">
						<c:set var="task" value="${leave.task }" />
						<c:set var="pi" value="${leave.processInstance }" />
						<c:set var="hpi" value="${leave.historicProcessInstance }" />
						<tr>
							<td>${leave.id}</td>
							<td>${leave.createUser.name}</td>
							<td><fmt:formatDate value="${leave.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							<td>${leave.reason}</td>
							<c:if test="${not empty task}">
								<td>${task.name}</td>
								<td><a target="_blank" href="${ctx}/act/task/trace/photo/${task.processDefinitionId}/${task.executionId}">跟踪</a></td>
							</c:if>
							<c:if test="${empty task}">
								<td>已结束</td>
								<td>&nbsp;</td>
							</c:if>
						</tr>
						</c:forEach>
						<!--
						<tr>
							<td>Randy S. Smith</td>
							<td>8.7</td>
							<td>Social and human service</td>
							<td>
								<a href="javascript:;" onclick="jQuery('#dataWin').modal('show', {backdrop: 'static'});" class="btn btn-secondary btn-sm btn-icon icon-left">Edit</a>
								<a href="javascript:;" class="btn btn-danger btn-sm btn-icon icon-left">Delete</a>
								<a href="javascript:;" class="btn btn-info btn-sm btn-icon icon-left">Profile</a>
							</td>
						</tr>
						-->
					</tbody>
				</table>
						</div>					
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
	<div class="modal fade" id="dataWin">
		<div class="modal-dialog">
			<div class="modal-content">
				<%@include file="leaveForm.jsp" %>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/view/taglib/footer.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/datatables.jsp" %>
	<script src="${ctx_assets}/js/rwd-table/js/rwd-table.min.js"></script>
</body>
</html>
