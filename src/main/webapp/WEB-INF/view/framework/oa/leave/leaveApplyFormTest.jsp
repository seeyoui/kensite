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
					</div>
				</div>
			<div class="row">
				<div class="col-sm-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">请假申请单</h3>
						</div>
						<div id="frmMain" class="panel-body">
							<!--表单模板填充区域-->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@ include file="/WEB-INF/view/taglib/footer.jsp" %>
<%@ include file="/WEB-INF/view/taglib/dataform.jsp" %>
<%@ include file="/WEB-INF/view/taglib/artTemplate.jsp" %>
	<script id="test" type="text/html">
		<form id="dataForm" method="post">
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label for="field-1" class="control-label">请假者</label>
						{{#createUser}}
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="field-2" class="control-label">请假类型</label>
						{{#leaveType}}
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label for="field-1" class="control-label">请假开始时间</label>
						{{#startTime}}
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="field-2" class="control-label">请假结束时间</label>
						{{#endTime}}
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="form-group no-margin">
						<label for="field-7" class="control-label">请假原因</label>
						{{#reason}}
					</div>
				</div>
			</div>
			{{#id}}
		</form>
	</script>
	<script type="text/javascript">
		$(document).ready(function() {
			var data = {
				id: '<input type="hidden" id="id_id" name="id" value="${leave.id}">',
				createUser: '${currentUser.name}',
				leaveType: '',
				startTime: '<input type="text" class="form-control" id="startTime_id" name="startTime" value="<fmt:formatDate value="${leave.startTime}" type="both"/>" placeholder="" onclick="WdatePicker({dateFmt:\'yyyy-MM-dd HH:mm\',isShowClear:false});" ${state}>',
				endTime: '<input type="text" class="form-control" id="endTime_id" name="endTime" value="<fmt:formatDate value="${leave.endTime}" type="both"/>" placeholder="" onclick="WdatePicker({dateFmt:\'yyyy-MM-dd HH:mm\',isShowClear:false});" ${state}>',
				reason: '<textarea class="form-control autogrow" id="reason_id" name="reason" placeholder="请简洁明确的填写请假原因" ${state}>${leave.reason}</textarea>'
			};
			var htmlStr = template('test', data);
			$("#frmMain").html(htmlStr);
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
	</script>
</body>
</html>
