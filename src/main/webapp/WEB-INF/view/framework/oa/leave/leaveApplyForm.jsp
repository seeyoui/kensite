<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/taglib/common.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<%@ include file="/WEB-INF/view/taglib/header.jsp" %>
</head>
<body class="page-body">
	<div class="page-container">
		<div class="main-content">
				<div class="row">
					<div class="col-sm-12">
						<button type="button" class="btn btn-success" onclick="saveInfo()">保存</button>
						<c:if test="${leave.task.taskDefinitionKey=='createApply'}">
						<button type="button" class="btn btn-pink" onclick="complete('${leave.task.id}', null)">发送</button>
						</c:if>
						<c:if test="${leave.task.taskDefinitionKey=='deptLeaderAudit'}">
						<button type="button" class="btn btn-pink" onclick="complete('${leave.task.id}', [{key: 'deptLeaderPass',value: true,type: 'B'}])">同意</button>
						<button type="button" class="btn btn-pink" onclick="complete('${leave.task.id}', [{key: 'deptLeaderPass',value: false,type: 'B'}])">不同意</button>
						</c:if>
						<c:if test="${leave.task.taskDefinitionKey=='modifyApply'}">
						<button type="button" class="btn btn-pink" onclick="complete('${leave.task.id}', [{key: 'reApply',value: true,type: 'B'}])">再试试</button>
						<button type="button" class="btn btn-pink" onclick="complete('${leave.task.id}', [{key: 'reApply',value: false,type: 'B'}])">不请啦</button>
						</c:if>
					</div>
				</div>
			<div class="row">
				<div class="col-sm-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">请假申请单</h3>
							<!--
							<div class="panel-options">
								<a href="#" data-toggle="panel">
									<span class="collapse-icon">&ndash;</span>
									<span class="expand-icon">+</span>
								</a>
								<a href="#" data-toggle="remove">
									&times;
								</a>
							</div>
							-->
						</div>
						<div class="panel-body">
							<%@include file="leaveForm.jsp" %>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@ include file="/WEB-INF/view/taglib/footer.jsp" %>
<%@ include file="/WEB-INF/view/taglib/datatables.jsp" %>
<script src="${ctx_assets}/js/rwd-table/js/rwd-table.min.js"></script>
<%@ include file="/WEB-INF/view/taglib/dataform.jsp" %>

	<script type="text/javascript">
		$(document).ready(function() {
			$("#leaveType_id").selectBoxIt().on('open', function() {
				$(this).data('selectBoxSelectBoxIt').list.perfectScrollbar();
			});
		});
		
        function saveInfo(){
        	var url = "${ctx}/oa/leave/save.do";
        	$.ajax({
                cache: true,
                type: "POST",
                url: url,
                data: $('#dataForm').serialize(),
                async: false,
                error: function(request) {
                    alert("Connection error");
                },
                success: function(data) {
                	toastr.info("操作成功！");
                	goBackToList();
                }
            });
        }
        
        /**
		 * 完成任务
		 * @param {Object} taskId
		 */
		function complete(taskId, variables) {
			// 转换JSON为字符串
		    var keys = "", values = "", types = "";
			if (variables) {
				$.each(variables, function(idx) {
					if (keys != "") {
						keys += ",";
						values += ",";
						types += ",";
					}
					keys += this.key;
					values += this.value;
					types += this.type;
				});
			}
			// 发送任务完成请求
		    $.post('${ctx}/act/task/complete/', {
		    	taskId: taskId,
		        "vars.keys": keys,
		        "vars.values": values,
		        "vars.types": types
		    }, function(data) {
		        toastr.info("发送成功！");
		        goBackToList();
		    });
		}
		
		function goBackToList() {
			window.location.href = "${ctx}/oa/leave/list/task.do";
		}
	</script>
</body>
</html>
