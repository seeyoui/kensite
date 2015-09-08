<%@ page import="com.seeyoui.kensite.common.constants.StringConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/taglib/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>    
    <title>系统字典</title>
	<%@ include file="/WEB-INF/view/taglib/header.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/easyui.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/layer.jsp" %>
  </head>
  <body>
 	<div style="position:absolute;top:0px;left:0px;right:0px;bottom:0px;">
 		<div style="position:absolute;top:0px;bottom:0px;width:200px; overflow:scroll;">
        	<ul id="dictTree" class="easyui-tree" url="${ctx}/sys/dict/getTreeJson.do"></ul>
        </div>
		<div style="position:absolute;top:0px;left:200px;right:0px;bottom:0px;">
		    <table id="dataList" title="系统字典列表" class="easyui-datagrid" style="width:100%;height:100%"
		            toolbar="#toolbar" pagination="true"
		            rownumbers="true" fitColumns="true" singleSelect="true">
		        <thead>
		            <tr>
					    <th field="id" width="100px" hidden>主键</th>
					    <th field="value" width="100px">数据值</th>
					    <th field="label" width="100px">标签名</th>
					    <th field="category" width="100px">分类</th>
					    <th field="description" width="100px">描述</th>
					    <th field="sequence" width="50px" align="right">排序</th>
					    <th field="parentId" width="100px" hidden>父主键</th>
		            </tr>
		        </thead>
		    </table>
		    <div id="toolbar">
		    	<shiro:hasPermission name="dict:insert">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newInfo()">新建</a>
		        </shiro:hasPermission>
		        <shiro:hasPermission name="dict:update">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editInfo()">修改</a>
		        </shiro:hasPermission>
		        <shiro:hasPermission name="dict:delete">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyInfo()">删除</a>
		        </shiro:hasPermission>

				数据值<input id="sel_value" name="sel_value" class="easyui-textbox" data-options=""/>
				标签名<input id="sel_label" name="sel_label" class="easyui-textbox" data-options=""/>
				分类<input id="sel_category" name="sel_category" class="easyui-textbox" data-options=""/>
				描述<input id="sel_description" name="sel_description" class="easyui-textbox" data-options=""/>
				<input id="sel_parentId" name="sel_parentId" type="hidden" value=""/>
			    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="selectData()">查询</a>
		    </div>
		    <div id="dataWin" class="easyui-window" title="系统字典信息维护" data-options="modal:true,closed:true,iconCls:'icon-save',resizable:false" style="width:400px;height:280px;padding:10px;">
		        <div class="ftitle">系统字典信息维护</div>
		        <form id="dataForm" method="post">
							<div class="fitem">
				                <label>数据值</label>
				                <input id="value" name="value" class="easyui-validatebox textbox" data-options="required:true"/>
				                <span id="msg-value" class="err-msg"></span>
				            </div>
							<div class="fitem">
				                <label>标签名</label>
				                <input id="label" name="label" class="easyui-validatebox textbox" data-options="required:true"/>
				                <span id="msg-label" class="err-msg"></span>
				            </div>
							<div class="fitem">
				                <label>分类</label>
				                <input id="category" name="category" class="easyui-validatebox textbox" data-options="required:true"/>
				                <span id="msg-category" class="err-msg"></span>
				            </div>
							<div class="fitem">
				                <label>描述</label>
				                <input id="description" name="description" class="easyui-validatebox textbox" data-options="required:true"/>
				                <span id="msg-description" class="err-msg"></span>
				            </div>
							<div class="fitem">
				                <label>排序</label>
				                <input id="sequence" name="sequence" class="easyui-numberbox textbox" data-options="min:0,max:999999,precision:0,required:true"/>
				                <span id="msg-sequence" class="err-msg"></span>
				            </div>
							<div class="fitem">
				                <label>父级字典</label>
				                <input id="parentId" name="parentId" class="easyui-combotree" data-options="required:true" style="width:160px;" url="${ctx}/sys/dict/getTreeJson.do"/>
				                <span id="msg-parentId" class="err-msg"></span>
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
	    	$("#dictTree").tree({
	    		onClick: function(node){
	    			$('#sel_parentId').val(node.id);
	    			selectData();
	    		}
	    	});
	    	$('#dataList').datagrid({
	    		url:'${ctx}/sys/dict/getListData.do',
	    		queryParams: {
	    			parentId:"<%=StringConstant.ROOT_ID_32%>"
	    		}
	    	});
	    });
	    
	    function selectData() {
		    var sel_parentId = $("#sel_parentId").val();
		    var sel_value = $("#sel_value").val();
		    var sel_label = $("#sel_label").val();
		    var sel_category = $("#sel_category").val();
		    var sel_description = $("#sel_description").val();
        	$('#dataList').datagrid('load',{
        		parentId:sel_parentId,
    		    value:sel_value,
    		    label:sel_label,
    		    category:sel_category,
    		    description:sel_description
        	});
        }
	    function reloadData() {
        	selectData();
        	$('#dictTree').tree('reload');
        	$('#parentId').combotree('reload');
        }
	    
        var url;
        function newInfo(){
            cleanErrMsg();
            $('#dataForm').form('clear');
            var node = $('#dictTree').tree('getSelected');
            if(node == null) {
            	node = $('#dictTree').tree('getRoot');
            }
            $('#parentId').combotree('setValue', node.id);
            $('#dataWin').window('open');
            url = '${ctx}/sys/dict/saveByAdd.do';
        }
        function editInfo(){
            var row = $('#dataList').datagrid('getSelected');
            if (row){
            	cleanErrMsg();
                $('#dataForm').form('load',row);
                $('#dataWin').window('open');
                url = '${ctx}/sys/dict/saveByUpdate.do?id='+row.id;
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
                    cleanErrMsg();
                	data = eval('(' + info + ')');
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
							url: '${ctx}/sys/dict/delete.do',
							data: {delDataId:row.id},
							dataType: 'json',
							beforeSend: function(XMLHttpRequest){
							},
							success: function(data, textStatus){
								if (data.success=="<%=StringConstant.TRUE%>"){
			                        layer.msg("操作成功！", 2, -1);
									reloadData();
			                    } else {
				                    layer.msg("操作失败！", 2, -1);
			                    }
							}
						});
                    }
                });
            }
        }
    </script>
  </body>
</html>
