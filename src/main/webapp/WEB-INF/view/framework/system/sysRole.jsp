<%@ page import="com.seeyoui.kensite.common.constants.StringConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/taglib/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>    
    <title>角色</title>
	<script type="text/javascript" src="${ctx_assets}/js/jquery-1.11.1.min.js"></script>
	<%@ include file="/WEB-INF/view/taglib/easyui.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/layer.jsp" %>
  </head>
  <body>
  
  	<div id="divLayout" class="easyui-layout" style="width:auto;height:450px">
        <div id="divCenter" data-options="region:'center'">
		    <table id="dataList" title="角色列表" class="easyui-datagrid" style="width:auto;height:auto"
		    		url="${ctx}/sysRole/getListData.do"
		            toolbar="#toolbar" pagination="true"
		            rownumbers="true" fitColumns="true" singleSelect="true">
		        <thead>
		            <tr>
					    <th field="id" width="100px" hidden>主键</th>
					    <th field="name" width="100px">角色名</th>
					    <th field="shiro" width="100px">权限</th>
		            </tr>
		        </thead>
		    </table>
		    <div id="toolbar">
		    	<shiro:hasPermission name="sysRole:insert">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newInfo()">新建</a>
		        </shiro:hasPermission>
		        <shiro:hasPermission name="sysRole:update">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editInfo()">修改</a>
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="moduleShiro()">模块权限</a>
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="menuShiro()">菜单权限</a>
		        </shiro:hasPermission>
		        <shiro:hasPermission name="sysRole:delete">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyInfo()">删除</a>
		        </shiro:hasPermission>

角色名<input id="sel_name" name="sel_name" class="easyui-textbox" data-options=""/>
权限<input id="sel_shiro" name="sel_shiro" class="easyui-textbox" data-options=""/>
			    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="selectData()">查询</a>
		    </div>
		    <div id="dataWin" class="easyui-window" title="角色信息维护" data-options="modal:true,closed:true,iconCls:'icon-save',resizable:false" style="width:400px;height:260px;padding:10px;">
		        <div class="ftitle">角色信息维护</div>
		        <form id="dataForm" method="post">
							<div class="fitem">
				                <label>角色名</label>
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
		    <div id="moduleWin" class="easyui-window" title="模块权限维护" data-options="modal:true,closed:true,iconCls:'icon-save',resizable:false" style="width:335px;height:420px;padding:10px;">
		        <div class="ftitle">模块权限维护</div>
		        <form id="moduleDataForm" method="post">
					<div class="easyui-panel" title="模块权限" style="width:300px;height:300px;">
	            		<ul id="moduleTree" class="easyui-tree" data-options="animate:true,checkbox:true,cascadeCheck:false"></ul>
					</div>
				    <input id="roleid" name="roleid" type="hidden"/>
				</form>
				
			    <div id="dataWin-buttons">
			        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveRoleModuleInfo()" style="width:90px">保存</a>
			        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#moduleDataForm').window('close')" style="width:90px">取消</a>
			    </div>
		    </div>
		    <div id="menuWin" class="easyui-window" title="菜单权限维护" data-options="modal:true,closed:true,iconCls:'icon-save',resizable:false" style="width:335px;height:420px;padding:10px;">
		        <div class="ftitle">菜单权限维护</div>
		        <form id="menuDataForm" method="post">
					<div class="easyui-panel" title="菜单权限" style="width:300px;height:300px;">
	            		<ul id="menuTree" class="easyui-tree" data-options="animate:true,checkbox:true,cascadeCheck:false"></ul>
					</div>
				    <input id="menuroleid" name="id" type="hidden"/>
				</form>
				
			    <div id="dataWin-buttons">
			        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveRoleMenuInfo()" style="width:90px">保存</a>
			        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#menuWin').window('close')" style="width:90px">取消</a>
			    </div>
		    </div>
	    </div>
    </div>
    <script type="text/javascript">
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
		    var sel_shiro = $("#sel_shiro").val();
        	$('#dataList').datagrid('load',{
    		    
    		    name:sel_name,
    		    shiro:sel_shiro
        	});
        }
        
        function reloadData() {
        	selectData();
        }
        
        function moduleShiro() {
        	getModuleTreeJson();
        	$('#moduleWin').window('open');
        }
        
        function menuShiro() {
        	getMenuTreeJson();
        	$('#menuWin').window('open');
        }
        
        function getModuleTreeJson() {
        	var row = $('#dataList').datagrid('getSelected');
            if (row){
            	var roleid = row.id;
	    		$.ajax({
					type: "POST",
					url: "<%=path %>/sysRoleModule/getTreeJson.do",
					data: "roleid="+roleid,
					dataType: "json",
					success: function(data){
						$("#moduleTree").tree("loadData",data);
					}
				});
			}
	    }
	    
	    function getMenuTreeJson() {
        	var row = $('#dataList').datagrid('getSelected');
            if (row){
            	var roleid = row.id;
	    		$.ajax({
					type: "POST",
					url: "<%=path %>/sysRoleMenu/getTreeJson.do",
					data: "roleid="+roleid,
					dataType: "json",
					success: function(data){
						$("#menuTree").tree("loadData",data);
					}
				});
			}
	    }
	    
	    function saveRoleModuleInfo() {
	    	var treeObj = $('#moduleTree');
	    	var moduleid = getChecked(treeObj);
	    	var row = $('#dataList').datagrid('getSelected');
	    	var roleid = row.id;
	    	if (moduleid!=null && moduleid!=""){
				$.ajax({
					type: "post",
					url: "${ctx}/sysRoleModule/saveRoleModule.do",
					data: {roleid:roleid,moduleid:moduleid},
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
	    }
	    
	    function saveRoleMenuInfo() {
	    	var treeObj = $('#menuTree');
	    	var menuid = getChecked(treeObj);
	    	var row = $('#dataList').datagrid('getSelected');
	    	var roleid = row.id;
	    	if (menuid!=null && menuid!=""){
				$.ajax({
					type: "post",
					url: "${ctx}/sysRoleMenu/saveRoleMenu.do",
					data: {roleid:roleid,menuid:menuid},
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
            url = '${ctx}/sysRole/saveByAdd.do';
        }
        function editInfo(){
            var row = $('#dataList').datagrid('getSelected');
            if (row){
                $('#dataWin').window('open');
                $('#dataForm').form('load',row);
                url = '${ctx}/sysRole/saveByUpdate.do?id='+row.id;
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
                    if (info=="<%=StringConstant.TRUE%>"){
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
							url: "${ctx}/sysRole/delete.do",
							data: {delDataId:row.id},
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
    </script>
  </body>
</html>
