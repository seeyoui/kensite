<%@ page import="com.seeyoui.kensite.common.constants.StringConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/taglib/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>    
    <title>用户信息</title>
	<script type="text/javascript" src="${ctx_assets}/js/jquery-1.11.1.min.js"></script>
	<%@ include file="/WEB-INF/view/taglib/easyui.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/layer.jsp" %>
  </head>
  <body>
  
  	<div style="position:absolute;top:0px;left:0px;right:0px;bottom:0px;">
		<div style="position:absolute;top:0px;left:0px;right:0px;bottom:0px;">
		    <table id="dataList" title="" class="easyui-datagrid" style="width:100%;height:100%"
		    		url="${ctx}/sysUser/getListData.do"
		            toolbar="#toolbar" pagination="true"
		            rownumbers="true" fitColumns="true" singleSelect="true">
		        <thead>
		            <tr>
					    <th field="id" width="100px" hidden>主键</th>
					    <th field="username" width="100px">账号</th>
					    <th field="name" width="100px">用户名</th>
					    <th field="state" width="100px" formatter="formatState">状态</th>
		            </tr>
		        </thead>
		    </table>
		    <div id="toolbar">
		    	<shiro:hasPermission name="sysUser:insert">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newInfo()">新建</a>
		        </shiro:hasPermission>
		        <shiro:hasPermission name="sysUser:update">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editInfo()">修改</a>
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-people" plain="true" onclick="userRole()">用户角色</a>
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-arrow_refresh" plain="true" onclick="initPassword()">初始化密码</a>
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-lock" plain="true" onclick="updateState(0)">冻结账号</a>
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-key" plain="true" onclick="updateState(1)">激活账号</a>
		        </shiro:hasPermission>
		        <shiro:hasPermission name="sysUser:delete">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyInfo()">删除</a>
		        </shiro:hasPermission>

账号<input id="sel_username" name="sel_username" class="easyui-textbox" data-options=""/>
用户名<input id="sel_name" name="sel_name" class="easyui-textbox" data-options=""/>
			    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="selectData()">查询</a>
		    </div>
		    <div id="dataWin" class="easyui-window" title="用户信息信息维护" data-options="modal:true,closed:true,iconCls:'icon-save',resizable:false" style="width:400px;height:260px;padding:10px;">
		        <div class="ftitle">用户信息信息维护</div>
		        <form id="dataForm" method="post">
							<div class="fitem">
				                <label>账号</label>
				                <input id="username" name="username" class="easyui-validatebox textbox" data-options="required:true"/>
				            </div>
		            		<div class="fitem">
								<label>用户密码:</label>
				               	 初始化密码123456
				            </div>
							<div class="fitem">
				                <label>用户名</label>
				                <input id="name" name="name" class="easyui-validatebox textbox" data-options="required:true"/>
				            </div>
							<div class="fitem">
				                <label>部门</label>
				                <input id="deptTree" name="departmentid" class="easyui-combotree" data-options="required:true" url="${ctx}/sysDepartment/getTreeJson.do"/>
				            </div>
				</form>
				
			    <div id="dataWin-buttons">
			        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveInfo()" style="width:90px">保存</a>
			        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dataWin').window('close')" style="width:90px">取消</a>
			    </div>
		    </div>
		    <div id="roleWin" class="easyui-window" title="用户角色维护" data-options="modal:true,closed:true,iconCls:'icon-save',resizable:false" style="width:335px;height:420px;padding:10px;">
		        <div class="ftitle">用户角色维护</div>
		        <form id="menuDataForm" method="post">
					<div class="easyui-panel" title="用户角色" style="width:300px;height:300px;">
	            		<ul id="roleTree" class="easyui-tree" data-options="animate:true,checkbox:true,cascadeCheck:false"></ul>
					</div>
				</form>
				
			    <div id="dataWin-buttons">
			        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveUserRoleInfo()" style="width:90px">保存</a>
			        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#roleWin').window('close')" style="width:90px">取消</a>
			    </div>
		    </div>
	    </div>
    </div>
    <script type="text/javascript">
	    $(document).ready(function(){
	    });
	    
	    function selectData() {
		    var sel_username = $("#sel_username").val();
		    var sel_name = $("#sel_name").val();
        	$('#dataList').datagrid('load',{
    		    username:sel_username,
    		    name:sel_name
        	});
        }
        
        function formatState(val,row){
	    	if(val==1){
	    		return "正常";
	    	}
	    	if(val==0){
	    		return "冻结";
	    	}
	    	return "";
	    }
        
        function reloadData() {
        	selectData();
        }
        
        function userRole() {
        	getRoleTreeJson();
        	$('#roleWin').window('open');
        }
        
        function getRoleTreeJson() {
        	var row = $('#dataList').datagrid('getSelected');
            if (row){
            	var userid = row.id;
	    		$.ajax({
					type: "POST",
					url: "<%=path %>/sysUserRole/getTreeJson.do",
					data: "userid="+userid,
					dataType: "json",
					success: function(data){
						$("#roleTree").tree("loadData",data);
					}
				});
			}
	    }
        
        function saveUserRoleInfo() {
	    	var treeObj = $('#roleTree');
	    	var roleid = getChecked(treeObj);
	    	var row = $('#dataList').datagrid('getSelected');
	    	var userid = row.id;
	    	if (roleid!=null){
				$.ajax({
					type: "post",
					url: "${ctx}/sysUserRole/saveUserRole.do",
					data: {userid:userid,roleid:roleid},
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
						$('#roleWin').window('close');
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
            url = '${ctx}/sysUser/saveByAdd.do';
        }
        function editInfo(){
            var row = $('#dataList').datagrid('getSelected');
            if (row){
                $('#dataWin').window('open');
                $('#dataForm').form('load',row);
                url = '${ctx}/sysUser/saveByUpdate.do?id='+row.id;
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
					layer.msg(info, 2, -1);
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
							url: "${ctx}/sysUser/delete.do",
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
        
        function initPassword(){
            var row = $('#dataList').datagrid('getSelected');
            if (row){
                $.messager.confirm('确认','你确定初始化该记录的密码为123456吗？',function(r){
                    if (r){
                    	$.ajax({
							type: "post",
							url: "${ctx}/sysUser/initPassword.do",
							data: {id : row.id},
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
        
        function updateState(state){
            var row = $('#dataList').datagrid('getSelected');
            if (row){
                $.messager.confirm('确认','你确定改变该记录的登录状态吗？',function(r){
                    if (r){
                    	$.ajax({
							type: "post",
							url: "${ctx}/sysUser/updateState.do",
							data: {id : row.id, username : row.username, state : state},
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
