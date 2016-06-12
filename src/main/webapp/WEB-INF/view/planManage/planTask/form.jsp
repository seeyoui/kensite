<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/taglib/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>任务</title>
		<%@ include file="/WEB-INF/view/taglib/header.jsp" %>
		<%@ include file="/WEB-INF/view/taglib/easyui.jsp" %>
		<%@ include file="/WEB-INF/view/taglib/layer.jsp" %>
		<%@ include file="/WEB-INF/view/taglib/uedit.jsp" %>
	</head>
	<body>
	 	<div style="position:absolute;top:10px;left:20px;right:20px;bottom:10px;">
			<form id="dataForm" method="post">
				<div class="fitem">
					<ks:formTag table="PLAN_TASK" column="PROJECT_ID"/>
					<ks:formTag table="PLAN_TASK" column="USER_ID"/>
				</div>
				<div class="fitem">
					<ks:formTag table="PLAN_TASK" column="START_DATE"/>
					<ks:formTag table="PLAN_TASK" column="END_DATE"/>
				</div>
				<div class="fitem">
					<ks:formTag table="PLAN_TASK" column="DESCRIBE"/>
				</div>
				<div class="fitem">
					<ks:formTag table="PLAN_TASK" column="SEQUENCE"/>
					<ks:formTag table="PLAN_TASK" column="FINISH_DATE"/>
				</div>
				<div class="fitem">
					<ks:formTag table="PLAN_TASK" column="EXPLAIN"/>
				</div>
				<div class="fitem">
					<ks:formTag table="PLAN_TASK" column="REMARKS"/>
				</div>
				<input id="id" name="id" type="hidden"/>
			</form>
		</div>
		<script type="text/javascript">
			var loadi,url,index = parent.layer.getFrameIndex(window.name);
			$(document).ready(function(){
				var row = parent.$('#dataList').datagrid('getSelected');
				url = '${ctx}/planManage/planTask/save';
				$('#projectId').combobox({
					onChange: function(newValue,oldValue){
						getUserIdByProjectId(newValue);
					}
				});
				if(row != null) {
					$('#dataForm').form('load', row);
					url = '${ctx}/planManage/planTask/update';
				} else {
					$('#userId').combobox('loadData', []);
				}
			});
			
			function submitInfo(){
				$('#dataForm').form('submit',{
					url: url,
					onSubmit: function(param){
						if($(this).form('validate')) {
							loadi = parent.layer.load(2, {shade: layerLoadShade,time: layerLoadMaxTime});
						}
						return $(this).form('validate');
					},
					success: function(data){
						parent.layer.close(loadi);
						cleanErrMsg();
						var data = eval('(' + data + ')');
						if (data.success==TRUE){
							parent.$.planTask.reloadData();
							parent.layer.msg("操作成功！", {offset: layerMsgOffset,icon: 6,shift: 8,time: layerMsgTime});
							parent.layer.close(index);
						} else {
							renderErrMsg(data.message);
						}
					}
				});
			}
			
			function getUserIdByProjectId(projectId) {
				$.ajax({
					type: "post",
					url: '${ctx}/planManage/getUserIdByProjectId',
					data: {projectId : projectId},
					dataType: 'json',
					timeout: layerLoadMaxTime,
					beforeSend: function(XMLHttpRequest){
					},
					success: function(data, textStatus){
						console.info(data);
						$('#userId').combobox('loadData', data);
					}
				});
			}
		</script>
	</body>
</html>
