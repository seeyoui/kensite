<%@ page import="com.seeyoui.kensite.common.constants.StringConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/taglib/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>    
    <title>导航菜单</title>
	<script type="text/javascript" src="${ctx_assets}/js/jquery-1.11.1.min.js"></script>
	<%@ include file="/WEB-INF/view/taglib/easyui.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/layer.jsp" %>
  </head>
  <body>
  
  	<div id="divLayout" class="easyui-layout" style="width:auto;height:450px">
  		<div id="divWest" data-options="region:'west', collapsible:false,split:false" title="模块" style="width:200px;">
        	<ul id="menuTree" class="easyui-tree" url="${ctx}/sysMenu/getTreeJson.do"></ul>
        </div>
        <div id="divCenter" data-options="region:'center'">
		    <table id="dataList" title="导航菜单列表" class="easyui-datagrid" style="width:auto;height:auto"
		    		url="${ctx}/sysMenu/getListData.do"
		            toolbar="#toolbar" pagination="true"
		            rownumbers="true" fitColumns="true" singleSelect="true">
		        <thead>
		            <tr>
					    <th field="id" width="100px" hidden>主键</th>
					    <th field="parentid" width="100px" hidden>外键</th>
					    <th field="name" width="100px">名称</th>
					    <th field="url" width="100px">URL</th>
					    <th field="sequence" width="50px" align="right">排序</th>
					    <th field="icon" width="100px">图标</th>
					    <th field="target" width="100px">打开方式</th>
		            </tr>
		        </thead>
		    </table>
		    <div id="toolbar">
		    	<shiro:hasPermission name="sysMenu:insert">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newInfo()">新建</a>
		        </shiro:hasPermission>
		        <shiro:hasPermission name="sysMenu:update">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editInfo()">修改</a>
		        </shiro:hasPermission>
		        <shiro:hasPermission name="sysMenu:delete">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyInfo()">删除</a>
		        </shiro:hasPermission>
				<input id="sel_parentid" name="sel_parentid" type="hidden" value="<%=StringConstant.ROOT_ID_32%>"/>
				名称<input id="sel_name" name="sel_name" class="easyui-textbox" data-options=""/>
				URL<input id="sel_url" name="sel_url" class="easyui-textbox" data-options=""/>
			    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="selectData()">查询</a>
		    </div>
		    <div id="dataWin" class="easyui-window" title="导航菜单信息维护" data-options="modal:true,closed:true,iconCls:'icon-save',resizable:false" style="width:400px;height:260px;padding:10px;">
		        <div class="ftitle">导航菜单信息维护</div>
		        <form id="dataForm" method="post">
							<div class="fitem">
				                <label>名称</label>
				                <input id="name" name="name" class="easyui-validatebox textbox" data-options="required:true"/>
				            </div>
				            <div class="fitem">
				                <label>上级菜单</label>
				                <input id="parentid" name="parentid" class="easyui-combotree" data-options="required:true" url="${ctx}/sysMenu/getTreeJson.do"/>
				            </div>
							<div class="fitem">
				                <label>URL</label>
				                <input id="url" name="url" class="easyui-validatebox textbox" data-options="required:true"/>
				            </div>
							<div class="fitem">
				                <label>排序</label>
				                <input id="sequence" name="sequence" class="easyui-numberbox" data-options="min:0,max:999999,precision:0,required:true"/>
				            </div>
							<div class="fitem">
				                <label>图标</label>
				                <input id="icon" name="icon" class="easyui-validatebox textbox" data-options="required:true"/>
				            </div>
							<div class="fitem">
				                <label>打开方式</label>
				                <input id="target" name="target" class="easyui-validatebox textbox" data-options="required:true"/>
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
	    	$("#menuTree").tree({
	    		onClick: function(node){
	    			$('#sel_parentid').val(node.id);
	    			selectData();
	    		}
	    	});
	    });
	    
	    function initSize() {
	    	$("#divLayout").height($(window).height());
	    	$("#divCenter").height($(window).height());
	    	$("#divWest").height($(window).height()-29);
	    	$("#dataList").datagrid('resize', {
	    		height:$(window).height()-1
	    	});
	    }
	    
	    function selectData() {
		    var sel_parentid = $("#sel_parentid").val();
		    var sel_name = $("#sel_name").val();
		    var sel_url = $("#sel_url").val();
        	$('#dataList').datagrid('load',{
        		parentid:sel_parentid,
    		    name:sel_name,
    		    url:sel_url
        	});
        }
        
        function reloadData() {
        	selectData();
        	$('#menuTree').tree('reload');
        	$('#parentid').combotree('reload');
        }
	    
        var url;
        function newInfo(){
            $('#dataWin').window('open');
            $('#dataForm').form('clear');
            url = '${ctx}/sysMenu/saveByAdd.do';
        }
        function editInfo(){
            var row = $('#dataList').datagrid('getSelected');
            if (row){
                $('#dataWin').window('open');
                $('#dataForm').form('load',row);
                url = '${ctx}/sysMenu/saveByUpdate.do?id='+row.id;
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
                	reloadData();
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
							url: "${ctx}/sysMenu/delete.do",
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
