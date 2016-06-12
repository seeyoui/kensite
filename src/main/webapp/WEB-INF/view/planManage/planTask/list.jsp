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
  </head>
  <body>
 	<div style="position:absolute;top:0px;left:0px;right:0px;bottom:0px;">
		<div style="position:absolute;top:0px;left:0px;right:0px;bottom:0px;">
		    <table id="dataList" title="任务列表" class="easyui-datagrid" style="width:100%;height:100%"
		    		url="${ctx}/planManage/planTask/list/data"
		            toolbar="#toolbar" pagination="true"
		            rownumbers="true" fitColumns="true" singleSelect="true">
		        <thead>
		            <tr>
					    <th data-options="field:'id',hidden:true">ID</th>
				    	<ks:listTag table="PLAN_TASK" column="REMARKS"/>
				    	<ks:listTag table="PLAN_TASK" column="PROJECT_ID"/>
				    	<ks:listTag table="PLAN_TASK" column="DESCRIBE"/>
				    	<ks:listTag table="PLAN_TASK" column="USER_ID"/>
				    	<ks:listTag table="PLAN_TASK" column="START_DATE"/>
				    	<ks:listTag table="PLAN_TASK" column="END_DATE"/>
				    	<ks:listTag table="PLAN_TASK" column="FINISH_DATE"/>
				    	<ks:listTag table="PLAN_TASK" column="SEQUENCE"/>
				    	<ks:listTag table="PLAN_TASK" column="EXPLAIN"/>
		            </tr>
		        </thead>
		    </table>
		    <div id="toolbar">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="$.planTask.newInfo()">新建</a>
		    	<shiro:hasPermission name="planManage:planTask:insert">
		        </shiro:hasPermission>
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="$.planTask.editInfo()">修改</a>
		        <shiro:hasPermission name="planManage:planTask:update">
		        </shiro:hasPermission>
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="$.planTask.destroyInfo()">删除</a>
		        <shiro:hasPermission name="planManage:planTask:delete">
		        </shiro:hasPermission>
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-page_excel" plain="true" onclick="$.planTask.exportExcel()">导出</a>
		        <shiro:hasPermission name="planManage:planTask:export">
		        </shiro:hasPermission>
		    	<ks:queryTag table="PLAN_TASK" column="PROJECT_ID"/>
		    	<ks:queryTag table="PLAN_TASK" column="REMARKS"/>
		    	<ks:queryTag table="PLAN_TASK" column="DESCRIBE"/>
		    	<ks:queryTag table="PLAN_TASK" column="USER_ID"/>
		    	<ks:queryTag table="PLAN_TASK" column="START_DATE"/>
		    	<ks:queryTag table="PLAN_TASK" column="END_DATE"/>
		    	<ks:queryTag table="PLAN_TASK" column="FINISH_DATE"/>
		    	<ks:queryTag table="PLAN_TASK" column="SEQUENCE"/>
		    	<ks:queryTag table="PLAN_TASK" column="EXPLAIN"/>
			    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="$.planTask.selectData()">查询</a>
		    </div>
	    </div>
    </div>
    <script type="text/javascript">
	    $(document).ready(function(){
	    });
        var url, loadi;
        var iframeWin = null, iframeBody=null;
        $.planTask = {
       		selectData : function () {
	        	$('#dataList').datagrid('load',{
			    	<ks:queryJsTag table="PLAN_TASK" column="REMARKS"/>
			    	<ks:queryJsTag table="PLAN_TASK" column="DESCRIBE"/>
			    	<ks:queryJsTag table="PLAN_TASK" column="USER_ID"/>
			    	<ks:queryJsTag table="PLAN_TASK" column="START_DATE"/>
			    	<ks:queryJsTag table="PLAN_TASK" column="END_DATE"/>
			    	<ks:queryJsTag table="PLAN_TASK" column="FINISH_DATE"/>
			    	<ks:queryJsTag table="PLAN_TASK" column="SEQUENCE"/>
			    	<ks:queryJsTag table="PLAN_TASK" column="EXPLAIN"/>
			    	<ks:queryJsTag table="PLAN_TASK" column="PROJECT_ID"/>
	        	});
	        },
        	reloadData : function () {
        		$.planTask.selectData();
	        },
	        newInfo : function (){
	        	$('#dataList').datagrid('clearSelections');
	        	$.planTask.layerOpen(url);
	        },
	        editInfo : function (){
	            var row = $('#dataList').datagrid('getSelected');
	            //var row = $('#dataList').datagrid('getSelections');
	            if (row){
	            	//if(row.length != 1) {
	            		//layer.msg("只能选择一条记录修改！", {offset: 'rb',icon: 5,shift: 8,time: layerMsgTime});
	            	//} else {
		            $.planTask.layerOpen(url);
	            	//}
	            } else {
					layer.msg("请先选择要修改的记录！", {offset: 'rb',icon: 5,shift: 8,time: layerMsgTime});
				}
	        },
	        exportExcel : function () {
	        	window.open("${ctx}/planManage/planTask/export");
	        },
	        layerOpen : function (url) {
	            url = '${ctx}/planManage/planTask/form';
	        	layer.open({
	        	    type: 2,
	        	    title: '任务基本信息',
	        	    area: ['550px', '410px'],
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
	        },
	        destroyInfo : function (){
	            var row = $('#dataList').datagrid('getSelected');
	            //var row = $('#dataList').datagrid('getSelections');
	            if (row){
	            	layer.confirm('是否确认删除？', {
	            	    btn: ['确定','取消'] //按钮
	            	}, function(){
	            		$.ajax({
							type: "post",
							url: '${ctx}/planManage/planTask/delete',
							data: {id:row.id},
							dataType: 'json',
							timeout: layerLoadMaxTime,
							beforeSend: function(XMLHttpRequest){
								loadi = layer.load(2, {shade: layerLoadShade,time: layerLoadMaxTime});
							},
							success: function(data, textStatus){
								layer.close(loadi);
								if (data.success==TRUE){
			                        layer.msg("操作成功！", {offset: 'rb',icon: 6,shift: 8,time: layerMsgTime});
			                        $.planTask.reloadData();
			                    } else {
				                    layer.msg("操作失败！", {offset: 'rb',icon: 5,shift: 8,time: layerMsgTime});
			                    }
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
	            	}, function(){
	            	});
	            } else {
					layer.msg("请先选择要删除的记录！", {offset: 'rb',icon: 5,shift: 8,time: layerMsgTime});
				}
	        }
        }
    </script>
  </body>
</html>
