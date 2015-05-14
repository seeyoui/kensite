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
  
  	<div id="divLayout" class="easyui-layout" style="width:auto;height:450px">
        <div id="divCenter" data-options="region:'center'">
		    <table id="dataList" title="" class="easyui-datagrid" style="width:auto;height:auto"
		    		url="${ctx}/sysUser/getListData.do"
		            toolbar="#toolbar" pagination="true"
		            rownumbers="true" fitColumns="true" singleSelect="true">
		        <thead>
		            <tr>
					    <th field="id" width="100px" hidden>主键</th>
					    <th field="username" width="100px">账号</th>
					    <th field="password" width="100px">密码</th>
					    <th field="name" width="100px">用户名</th>
					    <th field="departmentid" width="100px">部门</th>
					    <th field="state" width="100px">状态</th>
		            </tr>
		        </thead>
		    </table>
		    <div id="toolbar">
		    	<shiro:hasPermission name="sysUser:insert">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newInfo()">新建</a>
		        </shiro:hasPermission>
		        <shiro:hasPermission name="sysUser:update">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editInfo()">修改</a>
		        </shiro:hasPermission>
		        <shiro:hasPermission name="sysUser:delete">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyInfo()">删除</a>
		        </shiro:hasPermission>

账号<input id="sel_username" name="sel_username" class="easyui-textbox" data-options=""/>
密码<input id="sel_password" name="sel_password" class="easyui-textbox" data-options=""/>
用户名<input id="sel_name" name="sel_name" class="easyui-textbox" data-options=""/>
部门<input id="sel_departmentid" name="sel_departmentid" class="easyui-textbox" data-options=""/>
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
				                <label>密码</label>
				                <input id="password" name="password" class="easyui-validatebox textbox" data-options="required:true"/>
				            </div>
							<div class="fitem">
				                <label>用户名</label>
				                <input id="name" name="name" class="easyui-validatebox textbox" data-options="required:true"/>
				            </div>
							<div class="fitem">
				                <label>部门</label>
				                <input id="departmentid" name="departmentid" class="easyui-validatebox textbox" data-options="required:true"/>
				            </div>
							<div class="fitem">
				                <label>状态</label>
				                <input id="state" name="state" class="easyui-validatebox textbox" data-options="required:true"/>
				            </div>
				</form>
				
			    <div id="dataWin-buttons">
			        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveInfo()" style="width:90px">保存</a>
			        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dataWin').window('close')" style="width:90px">取消</a>
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
		    
		    var sel_username = $("#sel_username").val();
		    var sel_password = $("#sel_password").val();
		    var sel_name = $("#sel_name").val();
		    var sel_departmentid = $("#sel_departmentid").val();
        	$('#dataList').datagrid('load',{
    		    
    		    username:sel_username,
    		    password:sel_password,
    		    name:sel_name,
    		    departmentid:sel_departmentid
        	});
        }
        
        function reloadData() {
        	selectData();
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
							url: "${ctx}/sysUser/delete.do",
							data: {delDataId:row.id},
							dataType: 'text',
							beforeSend: function(XMLHttpRequest){
								loadi = layer.load('正在处理，请稍后...');
							},
							success: function(data, textStatus){
								if (data=="<%=StringConstant.TRUE%>"){
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
