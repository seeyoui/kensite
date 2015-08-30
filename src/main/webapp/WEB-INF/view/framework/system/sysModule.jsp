<%@ page import="com.seeyoui.kensite.common.constants.StringConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/taglib/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>    
    <title>系统模块</title>
	<%@ include file="/WEB-INF/view/taglib/header.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/easyui.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/layer.jsp" %>
  </head>
  <body>
  
  	<div style="position:absolute;top:0px;left:0px;right:0px;bottom:0px;">
		<div style="position:absolute;top:0px;left:0px;right:0px;bottom:0px;">
		    <table id="dataList" title="" class="easyui-datagrid" style="width:100%;height:100%"
		    		url="${ctx}/sysModule/getListData.do"
		            toolbar="#toolbar" pagination="true"
		            rownumbers="true" fitColumns="true" singleSelect="true">
		        <thead>
		            <tr>
					    <th field="id" width="100px" hidden>主键</th>
					    <th field="name" width="100px">模块名称</th>
					    <th field="shiro" width="100px">权限</th>
		            </tr>
		        </thead>
		    </table>
		    <div id="toolbar">
		    	<shiro:hasPermission name="sysModule:insert">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newInfo()">新建</a>
		        </shiro:hasPermission>
		        <shiro:hasPermission name="sysModule:update">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editInfo()">修改</a>
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-chart_organisation" plain="true" onclick="permissionInfo()">模块操作</a>
		        </shiro:hasPermission>
		        <shiro:hasPermission name="sysModule:delete">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyInfo()">删除</a>
		        </shiro:hasPermission>

模块名称<input id="sel_name" name="sel_name" class="easyui-textbox" data-options=""/>
权限<input id="sel_shiro" name="sel_shiro" class="easyui-textbox" data-options=""/>
			    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="selectData()">查询</a>
		    </div>
		    <div id="dataWin" class="easyui-window" title="系统模块信息维护" data-options="modal:true,closed:true,iconCls:'icon-save',resizable:false" style="width:400px;height:170px;padding:10px;">
		        <div class="ftitle">系统模块信息维护</div>
		        <form id="dataForm" method="post">
							<div class="fitem">
				                <label>模块名称</label>
				                <input id="name" name="name" class="easyui-validatebox textbox" data-options="required:true"/>
				            </div>
							<div class="fitem">
				                <label>权限</label>
				                <input id="shiro" name="shiro" class="easyui-validatebox textbox" data-options="required:true"/>
				            </div>
				</form>
				
			    <div id="dataWin-buttons">
			        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveInfo()" style="width:90px">保存</a>
			        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dataWin').window('close')" style="width:90px">取消</a>
			    </div>
		    </div>
		    <div id="permissionWin" class="easyui-window" title="模块操作维护" data-options="modal:true,closed:true,iconCls:'icon-save',resizable:false" style="width:335px;height:420px;padding:10px;">
		        <div class="ftitle">模块操作维护</div>
		        <form id="permissionDataForm" method="post">
					<div class="easyui-panel" title="操作" style="width:300px;height:300px;">
	            		<ul id="permissionTree" class="easyui-tree" data-options="animate:true,checkbox:true,cascadeCheck:false"></ul>
					</div>
				    <input id="roleid" name="roleid" type="hidden"/>
				</form>
				
			    <div id="dataWin-buttons">
			        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveModulePermissionInfo()" style="width:90px">保存</a>
			        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#permissionWin').window('close')" style="width:90px">取消</a>
			    </div>
		    </div>
	    </div>
    </div>
    <script type="text/javascript">
	    $(document).ready(function(){
	    });
	    
	    function selectData() {
		    
		    var sel_name = $("#sel_name").val();
		    var sel_shiro = $("#sel_shiro").val();
        	$('#dataList').datagrid('load',{
    		    
    		    name:sel_name,
    		    shiro:sel_shiro
        	});
        }
        
        function reloadData() {
        	selectData();
        }
        
        function permissionInfo() {
        	getPermissionTreeJson();
        	$('#permissionWin').window('open');
        }
        
	    function getPermissionTreeJson() {
        	var row = $('#dataList').datagrid('getSelected');
            if (row){
            	var roleid = row.id;
	    		$.ajax({
					type: "POST",
					url: "<%=path %>/sysModulePermission/getTreeJson.do",
					data: "moduleid="+roleid,
					dataType: "json",
					success: function(data){
						$("#permissionTree").tree("loadData",data);
					}
				});
			}
	    }
	    
	    function saveModulePermissionInfo() {
	    	var treeObj = $('#permissionTree');
	    	var permissionid = getChecked(treeObj);
	    	var row = $('#dataList').datagrid('getSelected');
	    	var moduleid = "";
	    	if(!row) {
	    		return;
	    	}
	    	moduleid = row.id;
	    	if (permissionid!=null){
				$.ajax({
					type: "post",
					url: "${ctx}/sysModulePermission/saveModulePermission.do",
					data: {moduleid:moduleid,permissionid:permissionid},
					dataType: 'json',
					beforeSend: function(XMLHttpRequest){
					},
					success: function(data, textStatus){
						if (data.success=="<%=StringConstant.TRUE%>"){
							layer.msg("操作成功！", 2, -1);
						} else {
							layer.msg("操作失败！", 2, -1);
						}
						$('#permissionWin').window('close');
						reloadData();
					}
				});
			}
	    }
	    
	    function getChecked(treeObj){
            var nodes = treeObj.tree('getChecked');
            var s = '';
            for(var i=0; i<nodes.length; i++){
                if (i!=0 && i!=nodes.length) s += ',';
                s += nodes[i].id;
            }
            return s;
        }
	    
        var url;
        function newInfo(){
            $('#dataWin').window('open');
            $('#dataForm').form('clear');
            url = '${ctx}/sysModule/saveByAdd.do';
        }
        function editInfo(){
            var row = $('#dataList').datagrid('getSelected');
            if (row){
                $('#dataWin').window('open');
                $('#dataForm').form('load',row);
                url = '${ctx}/sysModule/saveByUpdate.do?id='+row.id;
            }    	
        }
        var loadi;
        function saveInfo(){
            $('#dataForm').form('submit',{
                url: url,
                onSubmit: function(param){
                	if($(this).form('validate')) {
                		loadi = layer.load('正在保存，请稍后...');
                	}
                    return $(this).form('validate');
                },
                success: function(info){
                	data = eval('(' + info + ')');
                    if (data.success=="<%=StringConstant.TRUE%>"){
                        layer.msg("操作成功！", 2, -1);
                    } else {
	                    layer.msg("操作失败！", 2, -1);
                    }
                	layer.close(loadi);
                	$('#dataWin').window('close'); 
                	$('#dataList').datagrid('reload');
                }
            });
        }
        function destroyInfo(){
            var row = $('#dataList').datagrid('getSelected');
            if (row){
                $.messager.confirm('确认','你确定删除该记录吗？',function(r){
                    if (r){
                    	$.ajax({
							type: "post",
							url: "${ctx}/sysModule/delete.do",
							data: {delDataId:row.id},
							dataType: 'json',
							beforeSend: function(XMLHttpRequest){
								loadi = layer.load('正在处理，请稍后...');
							},
							success: function(data, textStatus){
								if (data.success=="<%=StringConstant.TRUE%>"){
			                        layer.msg("操作成功！", 2, -1);
			                    } else {
				                    layer.msg("操作失败！", 2, -1);
			                    }
			                    layer.close(loadi);
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
