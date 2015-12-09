<%@ page import="com.seeyoui.kensite.common.constants.StringConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/taglib/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>    
    <title>导航菜单</title>
    <link rel="stylesheet" href="${ctx_script}/css/fonts/linecons/css/linecons.css"/>
	<%@ include file="/WEB-INF/view/taglib/header.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/easyui.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/layer.jsp" %>
  </head>
  <body>
  
  	<div style="position:absolute;top:0px;left:0px;right:0px;bottom:0px;">
  		<div style="position:absolute;top:0px;bottom:0px;width:200px;">
        	<ul id="menuTree" class="easyui-tree" url="${ctx}/sysMenu/getTreeJson.do"></ul>
        </div>
        <div style="position:absolute;top:0px;left:200px;right:0px;bottom:0px;">
		    <table id="dataList" title="" class="easyui-datagrid" style="width:100%;height:100%"
		            toolbar="#toolbar" pagination="true"
		            rownumbers="true" fitColumns="true" singleSelect="true">
		        <thead>
		            <tr>
					    <th field="id" width="100px" hidden>主键</th>
					    <th field="parentId" width="100px" hidden>外键</th>
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
				<input id="sel_parentId" name="sel_parentId" type="hidden" value=""/>
				名称<input id="sel_name" name="sel_name" class="easyui-textbox" data-options=""/>
				URL<input id="sel_url" name="sel_url" class="easyui-textbox" data-options=""/>
			    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="selectData()">查询</a>
		    </div>
		    <div id="dataWin" class="easyui-window" title="导航菜单信息维护" data-options="modal:true,closed:true,iconCls:'icon-save',resizable:false" style="width:400px;height:320px;padding:10px;">
		        <div class="ftitle">导航菜单信息维护</div>
		        <form id="dataForm" method="post">
					<div class="fitem">
		                <label>名称</label>
		                <input id="name" name="name" class="easyui-textbox" data-options="required:true"/>
		            </div>
		            <div class="fitem">
		                <label>上级菜单</label>
		                <input id="parentId" name="parentId" class="easyui-combotree" data-options="required:true" url="${ctx}/sysMenu/getTreeJson.do"/>
		            </div>
					<div class="fitem">
		                <label>URL</label>
		                <input id="url" name="url" class="easyui-textbox" data-options="required:true"/>
		            </div>
					<div class="fitem">
		                <label>排序</label>
		                <input id="sequence" name="sequence" class="easyui-numberbox" data-options="min:0,max:999999,precision:0,required:true"/>
		            </div>
					<div class="fitem">
		                <label>打开方式</label>
		                <input id="target" name="target" class="easyui-combobox" data-options="required:true,editable:false,valueField: 'value',textField: 'label',data: [{value: '_blank',label: 'BLANK'},{value: '_parent',label: 'PARENT'},{value: '_self',label: 'SELF'},{value: '_top',label: 'TOP'}],panelHeight:'auto'"/>
		            </div>
					<div class="fitem">
		                <label>图标</label>
		                <input id="icon" name="icon" class="easyui-textbox" data-options=""/>
		            </div>
		            <div id="icon_li" class="fitem" style="background:#D2E9FF">
		            	<c:forEach var="menuIcon" items="${menuIconList}" varStatus="status">
		            		<img id="${menuIcon}" src="${ctx_skins}${menuIcon}" style="width:25px;height:25px;"/>
						</c:forEach>
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
	    	$("#menuTree").tree({
	    		onClick: function(node){
	    			$('#sel_parentId').val(node.id);
	    			selectData();
	    		}
	    	});
	    	$('#menuTree').tree({
	    		onLoadSuccess: function(node, data){
	    			$('#menuTree').tree('collapseAll');
	    			var nodeId = $('#sel_parentId').val();
	    			if(nodeId == "") {
	    				return;
	    			}
	    			var node = $('#menuTree').tree('find', nodeId);
	    			$('#menuTree').tree('expandTo', node.target);
	    		}
	    	});
	    	$("#icon_li img").click(function(){
	    		var obj = $(this);
	    		$("#icon").textbox('setValue', obj.attr("id"));
	    	});
	    	$('#dataList').datagrid({
	    		url:'${ctx}/sysMenu/getListData.do',
	    		queryParams: {
	    			parentId:"<%=StringConstant.ROOT_ID_32%>"
	    		}
	    	});
	    });
	    
	    function selectData() {
		    var sel_parentId = $("#sel_parentId").val();
		    var sel_name = $("#sel_name").val();
		    var sel_url = $("#sel_url").val();
        	$('#dataList').datagrid('load',{
        		parentId:sel_parentId,
    		    name:sel_name,
    		    url:sel_url
        	});
        }
        
        function reloadData() {
        	selectData();
        	$('#menuTree').tree('reload');
        	$('#parentId').combotree('reload');
        }
	    
        var url;
        function newInfo(){
            $('#dataForm').form('clear');
            var node = $('#menuTree').tree('getSelected');
            if(node == null) {
            	node = $('#menuTree').tree('getRoot');
            }
            $('#parentId').combotree('setValue', node.id);
            $('#target').val('_blank');
            $('#url').val('/');
            $('#dataWin').window('open');
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
                		loadi = layer.load(2, {shade: layerLoadShade,time: layerLoadMaxTime});
                	}
                    return $(this).form('validate');
                },
                success: function(info){
                	data = eval('(' + info + ')');
                    if (data.success=="<%=StringConstant.TRUE%>"){
                        layer.msg("操作成功！", {time: 1000});
                    } else {
	                    layer.msg("操作失败！", {time: 1000});
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
							dataType: 'json',
							beforeSend: function(XMLHttpRequest){
								loadi = layer.load(2, {shade: layerLoadShade,time: layerLoadMaxTime});
							},
							success: function(data, textStatus){
								if (data.success=="<%=StringConstant.TRUE%>"){
			                        layer.msg("操作成功！", {offset: 'rb',icon: 6,shift: 8,time: layerMsgTime});
			                    } else {
				                    layer.msg("操作失败！", {offset: 'rb',icon: 5,shift: 8,time: layerMsgTime});
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
