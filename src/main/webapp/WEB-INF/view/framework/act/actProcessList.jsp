<%@ page import="com.seeyoui.kensite.common.constants.StringConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/taglib/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>    
    <title>流程管理</title>
	<script type="text/javascript" src="${ctx_assets}/js/jquery-1.11.1.min.js"></script>
	<%@ include file="/WEB-INF/view/taglib/easyui.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/layer.jsp" %>
  </head>
  <body>
  
  	<div id="divLayout" class="easyui-layout" style="width:auto;height:450px">
        <div id="divCenter" data-options="region:'center'">
		    <table id="dataList" title="流程列表" class="easyui-datagrid" style="width:auto;height:auto"
		    		url="${ctx}/actProcess/getListData.do"
		            toolbar="#toolbar" pagination="true"
		            rownumbers="true" fitColumns="true" singleSelect="true">
		        <thead>
		            <tr>
					    <th field="id" width="100px">流程ID</th>
					    <th field="deploymentId" width="100px">部署ID</th>
					    <th field="category" width="100px">流程分类</th>
					    <th field="key" width="100px">流程标识</th>
					    <th field="name" width="100px">流程名称</th>
					    <th field="version" width="50px" align="right">流程版本</th>
					    <th field="resourceName" width="100px" formatter="formatProcessXml">流程XML</th>
					    <th field="diagramResourceName" width="100px" formatter="formatProcessImg">流程图片</th>
					    <th field="deploymentTime" width="100px" formatter="formatDateTimeCol">部署时间</th>
					    <th field="suspended" width="100px" formatter="formatState">流程状态</th>
		            </tr>
		        </thead>
		    </table>
		    <div id="toolbar">
		        <shiro:hasPermission name="actProcess:deploy">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="active()">激活</a>
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="suspend()">挂起</a>
		        </shiro:hasPermission>
		        <shiro:hasPermission name="actProcess:update">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="convertToModel()">转换为模型</a>
		        </shiro:hasPermission>
		        <shiro:hasPermission name="actProcess:delete">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyInfo()">删除</a>
		        </shiro:hasPermission>
		    </div>
	    </div>
    </div>
    <script type="text/javascript">
    	function formatProcessXml(val, row){
    		var xmlstr = '<a target="_blank" href="${ctx}/actProcess/resource.do?procDefId='+row.id+'&resType=xml">'+val+'</a>';
            return xmlstr;
        }
        
        function formatProcessImg(val, row){
    		var imgstr = '<a target="_blank" href="${ctx}/actProcess/resource.do?procDefId='+row.id+'&resType=image">'+val+'</a>';
            return imgstr;
        }
        
        function formatState(val, row){
    		if (val){
                return '挂起中';
            } else {
                return '激活中';
            }
        }
    	
	    $(document).ready(function(){
	    	initSize();
	    });
	    
	    function initSize() {
	    	$("#divLayout").height($(window).height());
	    	$("#divCenter").height($(window).height());
	    	$("#dataList").datagrid('resize', {
	    		height:$(window).height()-1
	    	});
	    }
	    
	    function selectData() {
		    var sel_name = $("#sel_name").val();
        	$('#dataList').datagrid('load',{
    		    name:sel_name
        	});
        }
	    
	    function reloadData() {
        	selectData();
        }
        function destroyInfo(){
            var row = $('#dataList').datagrid('getSelected');
            if (row){
                $.messager.confirm('确认','你确定删除该记录吗？',function(r){
                    if (r){
                    	$.ajax({
							type: "post",
							url: "${ctx}/actProcess/remove.do",
							data: {deploymentId:row.deploymentId},
							dataType: 'text',
							beforeSend: function(XMLHttpRequest){
							},
							success: function(data, textStatus){
								if (data=="<%=StringConstant.TRUE%>"){
			                        layer.msg("操作成功！", 2, -1);
			                    } else {
				                    layer.msg("操作失败！", 2, -1);
			                    }
								reloadData();
							}
						});
                    }
                });
            }
        }
        function active(){
            excuteCmd("激活", "update/active");
        }
        function suspend(){
            excuteCmd("挂起", "update/suspend");
        }
        function convertToModel() {
        	excuteCmd("转换", "convertToModel");
        }
        
        function excuteCmd(conText, cmd) {
        	var row = $('#dataList').datagrid('getSelected');
            if (row){
                $.messager.confirm('确认','你确定'+conText+'该记录吗？',function(r){
                    if (r){
                    	$.ajax({
							type: "post",
							url: "${ctx}/actProcess/"+cmd+".do",
							data: {procDefId:row.id},
							dataType: 'text',
							beforeSend: function(XMLHttpRequest){
							},
							success: function(data, textStatus){
			                    layer.msg(data, 2, -1);
								reloadData();
							}
						});
                    }
                });
            }
        }
    </script>
  </body>
</html>
