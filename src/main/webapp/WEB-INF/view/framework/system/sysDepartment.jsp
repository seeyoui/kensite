<%@ page import="com.seeyoui.kensite.common.constants.StringConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/taglib/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>    
    <title>部门</title>
	<script type="text/javascript" src="${ctx_assets}/js/jquery-1.11.1.min.js"></script>
	<%@ include file="/WEB-INF/view/taglib/easyui.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/layer.jsp" %>
  </head>
  <body>
  
  	<div style="position:absolute;top:0px;left:0px;right:0px;bottom:0px;">
  		<div style="position:absolute;top:0px;bottom:0px;width:200px;">
        	<ul id="departmentTree" class="easyui-tree" url="${ctx}/sysDepartment/getTreeJson.do"></ul>
        </div>
		<div style="position:absolute;top:0px;left:200px;right:0px;bottom:0px;">
		    <table id="dataList" title="" class="easyui-datagrid" style="width:100%;height:100%"
		    		url="${ctx}/sysDepartment/getListData.do"
		            toolbar="#toolbar" pagination="true"
		            rownumbers="true" fitColumns="true" singleSelect="true">
		        <thead>
		            <tr>
					    <th field="id" width="100px" hidden>主键</th>
					    <th field="parentid" width="100px" hidden>上级部门</th>
					    <th field="name" width="100px">部门名称</th>
					    <th field="code" width="100px">部门编号</th>
					    <th field="sequence" width="50px" align="right">排序</th>
		            </tr>
		        </thead>
		    </table>
		    <div id="toolbar">
		    	<shiro:hasPermission name="sysDepartment:insert">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newInfo()">新建</a>
		        </shiro:hasPermission>
		        <shiro:hasPermission name="sysDepartment:update">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editInfo()">修改</a>
		        </shiro:hasPermission>
		        <shiro:hasPermission name="sysDepartment:delete">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyInfo()">删除</a>
		        </shiro:hasPermission>
				<input id="sel_parentid" name="sel_parentid" type="hidden" value="<%=StringConstant.ROOT_ID_32%>"/>
				部门名称<input id="sel_name" name="sel_name" class="easyui-textbox" data-options=""/>
				部门编号<input id="sel_code" name="sel_code" class="easyui-textbox" data-options=""/>
			    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="selectData()">查询</a>
		    </div>
		    <div id="dataWin" class="easyui-window" title="部门信息维护" data-options="modal:true,closed:true,iconCls:'icon-save',resizable:false" style="width:400px;height:260px;padding:10px;">
		        <div class="ftitle">部门信息维护</div>
		        <form id="dataForm" method="post">
							<div class="fitem">
				                <label>部门名称</label>
				                <input id="name" name="name" class="easyui-validatebox textbox" data-options="required:true"/>
				            </div>
							<div class="fitem">
				                <label>部门编号</label>
				                <input id="code" name="code" class="easyui-validatebox textbox" data-options="required:true"/>
				                <span id="msg-code" class="err-msg"></span>
				            </div>
				            <div class="fitem">
				                <label>上级部门</label>
				                <input id="parentid" name="parentid" class="easyui-combotree" data-options="required:true" style="width:160px;" url="${ctx}/sysDepartment/getTreeJson.do"/>
				            </div>
				            <div class="fitem">
				                <label>排序</label>
				                <input id="sequence" name="sequence" class="easyui-numberbox textbox" data-options="min:0,max:999999,precision:0,required:true"/>
				                <span id="msg-sequence" class="err-msg"></span>
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
	    	$("#departmentTree").tree({
	    		onClick: function(node){
	    			$('#sel_parentid').val(node.id);
	    			selectData();
	    		}
	    	});
	    });
	    
	    function selectData() {
	    	var sel_parentid = $("#sel_parentid").val();
		    var sel_name = $("#sel_name").val();
		    var sel_code = $("#sel_code").val();
        	$('#dataList').datagrid('load',{
        		parentid:sel_parentid,
    		    name:sel_name,
    		    code:sel_code
        	});
        }
        
        function reloadData() {
        	selectData();
        	$('#departmentTree').tree('reload');
        	$('#parentid').combotree('reload');
        }
	    
        var url;
        function newInfo(){
            $('#dataWin').window('open');
            $('#dataForm').form('clear');
            cleanErrMsg();
            url = '${ctx}/sysDepartment/saveByAdd.do';
        }
        function editInfo(){
            var row = $('#dataList').datagrid('getSelected');
            if (row){
                $('#dataWin').window('open');
                $('#dataForm').form('load',row);
                cleanErrMsg();
                url = '${ctx}/sysDepartment/saveByUpdate.do?id='+row.id;
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
                success: function(data){
                	cleanErrMsg();
                	data = eval('(' + data + ')');
                    if (data.success=="<%=StringConstant.TRUE%>"){
                        layer.msg("操作成功！", 2, -1);
                		$('#dataWin').window('close'); 
                		reloadData();
                    } else {
	                    layer.msg("操作失败！", 2, -1);
	                    renderErrMsg(data.message);
                    }
                	layer.close(loadi);
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
							url: "${ctx}/sysDepartment/delete.do",
							data: {delDataId:row.id},
							dataType: 'json',
							beforeSend: function(XMLHttpRequest){
								loadi = layer.load('正在处理，请稍后...');
							},
							success: function(data, textStatus){
								if (data.success=="<%=StringConstant.TRUE%>"){
			                        layer.msg("操作成功！", 2, -1);
									reloadData();
			                    } else {
				                    layer.msg("操作失败！", 2, -1);
			                    }
			                    layer.close(loadi);
							}
						});
                    }
                });
            }
        }
        
    </script>
  </body>
</html>
