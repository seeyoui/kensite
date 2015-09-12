<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/taglib/common.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<%@ include file="/WEB-INF/view/taglib/header.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/easyui.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/layer.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/formStyle.jsp" %>
	
</head>
  <body>
 	<div style="position:absolute;top:0px;left:0px;right:0px;bottom:0px;">
 		<div id="buttons_box">
			<ul>
				<li><a href="javascript:void(0)" onclick="test()">TEST</a></li>
				<li><a href="javascript:void(0)" onclick="saveInfo()">保存</a></li>
				<c:if test="${leave.task.taskDefinitionKey=='createApply'}">
				<li><a href="javascript:void(0)" onclick="complete('${leave.task.id}', null)">发送</a></li>
				</c:if>
				<c:if test="${leave.task.taskDefinitionKey=='deptLeaderAudit'}">
				<li><a href="javascript:void(0)" onclick="complete('${leave.task.id}', [{key: 'deptLeaderPass',value: true,type: 'B'}])">同意</a></li>
				<li><a href="javascript:void(0)" onclick="complete('${leave.task.id}', [{key: 'deptLeaderPass',value: false,type: 'B'}])">不同意</a></li>
				</c:if>
				<c:if test="${leave.task.taskDefinitionKey=='modifyApply'}">
				<li><a href="javascript:void(0)" onclick="complete('${leave.task.id}', [{key: 'reApply',value: true,type: 'B'}])">再试试</a></li>
				<li><a href="javascript:void(0)" onclick="complete('${leave.task.id}', [{key: 'reApply',value: false,type: 'B'}])">不请啦</a></li>
				</c:if>
			</ul>
		</div>
		<div style="position:absolute;top:50px;left:0px;right:0px;bottom:0px;">
			<form id="dataForm" method="post">
				<input type="hidden" id="id_id" name="id" value="${leave.id}">
				<table style="border:1px solid #F00">
					<tr>
						<td><label>请假者</label></td>
						<td><input type="text" id="applyUser" disabled="" placeholder="" value="${currentUser.name}"></td>
						<td><label>请假类型</label></td>
						<td><select id="leaveType_id" name="leaveType" ${state}>
								<option value="事假" ${leave.leaveType=='事假'?'selected':''}>事假</option>
								<option value="病假" ${leave.leaveType=='病假'?'selected':''}>病假</option>
								<option value="婚假" ${leave.leaveType=='婚假'?'selected':''}>婚假</option>
								<option value="产假" ${leave.leaveType=='产假'?'selected':''}>产假</option>
							</select></td>
					</tr>
					<tr>
						<td><label>请假开始时间</label></td>
						<td><input type="text" id="startTime_id" name="startTime" value="<fmt:formatDate value="${leave.startTime}" type="both"/>" placeholder="" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',isShowClear:false});" ${state}></td>
						<td><label>请假结束时间</label></td>
						<td><input type="text" id="endTime_id" name="endTime" value="<fmt:formatDate value="${leave.endTime}" type="both"/>" placeholder="" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',isShowClear:false});" ${state}></td>
					</tr>
					<tr>
						<td><label>请假原因</label></td>
						<td colspan="3">
							<textarea class="form-control autogrow" id="reason_id" name="reason" placeholder="请简洁明确的填写请假原因" ${state}>${leave.reason}</textarea>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
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
                	layer.msg("操作成功！", 2, -1);
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
		        layer.msg("发送成功！", 2, -1);
		        goBackToList();
		    });
		}
		
		function goBackToList() {
			window.location.href = "${ctx}/oa/leave/list/task.do";
		}
		
		function test() {
			var id = $("#id_id").val();
			$.post('${ctx}/oa/leave/detail/'+id+'.do', {
		    }, function(data) {
		        alert(data);
		    });
		}
	</script>
</body>
</html>
