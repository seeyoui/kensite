<%@ page import="com.seeyoui.kensite.common.constants.StringConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/taglib/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>业务表</title>
	<%@ include file="/WEB-INF/view/taglib/header.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/easyui.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/layer.jsp" %>
  </head>
  <body>
 	<div style="position:absolute;top:0px;left:0px;right:0px;bottom:0px;">
		<div style="position:absolute;top:0px;left:0px;right:0px;bottom:0px;">
		    <table id="dataList" title="业务表列表" class="easyui-datagrid" style="width:100%;height:100%"
		    		url="${ctx}/sys/table/getListData.do"
		            toolbar="#toolbar" pagination="true"
		            rownumbers="true" fitColumns="true" singleSelect="true">
		        <thead>
		            <tr>
					    <th field="id" width="100px" hidden>主键</th>
					    <th field="name" width="100px">名称</th>
					    <th field="comments" width="100px">描述</th>
					    <th field="parentTable" width="100px">关联父表</th>
					    <th field="parentTableFk" width="100px">关联父表外键</th>
		            </tr>
		        </thead>
		    </table>
		    <div id="toolbar">
		    	<shiro:hasPermission name="sys:table:insert">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newInfo()">新建</a>
		        </shiro:hasPermission>
		        <shiro:hasPermission name="sys:table:update">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editInfo()">修改</a>
		        </shiro:hasPermission>
		        <shiro:hasPermission name="sys:table:delete">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyInfo()">删除</a>
		        </shiro:hasPermission>
				名称<input id="sel_name" name="sel_name" class="easyui-textbox" data-options=""/>
				描述<input id="sel_comments" name="sel_comments" class="easyui-textbox" data-options=""/>
				关联父表<input id="sel_parentTable" name="sel_parentTable" class="easyui-textbox" data-options=""/>
				关联父表外键<input id="sel_parentTableFk" name="sel_parentTableFk" class="easyui-textbox" data-options=""/>
			    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="selectData()">查询</a>
		    </div>
		    <div id="dataWin" class="easyui-window" title="业务表信息维护" data-options="modal:true,closed:true,iconCls:'icon-save',resizable:false" style="width:400px;height:260px;padding:10px;">
		        <div class="ftitle">业务表信息维护</div>
		        <form id="dataForm" method="post">
							<div class="fitem">
				                <label>名称</label>
				                <input id="name" name="name" class="easyui-textbox" data-options="required:true"/>
				                <span id="msg-name" class="err-msg"></span>
				            </div>
							<div class="fitem">
				                <label>描述</label>
				                <input id="comments" name="comments" class="easyui-textbox" data-options="required:true"/>
				                <span id="msg-comments" class="err-msg"></span>
				            </div>
							<div class="fitem">
				                <label>关联父表</label>
				                <input id="parentTable" name="parentTable" class="easyui-textbox" data-options="required:true"/>
				                <span id="msg-parenttable" class="err-msg"></span>
				            </div>
							<div class="fitem">
				                <label>关联父表外键</label>
				                <input id="parentTableFk" name="parentTableFk" class="easyui-textbox" data-options="required:true"/>
				                <span id="msg-parenttablefk" class="err-msg"></span>
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
	    });
	    
	    function selectData() {
		    
		    
		    
		    
		    
		    var sel_name = $("#sel_name").val();
		    var sel_comments = $("#sel_comments").val();
		    var sel_parentTable = $("#sel_parentTable").val();
		    var sel_parentTableFk = $("#sel_parentTableFk").val();
		    
		    
        	$('#dataList').datagrid('load',{
    		    
    		    
    		    
    		    
    		    
    		    name:sel_name,
    		    comments:sel_comments,
    		    parentTable:sel_parentTable,
    		    parentTableFk:sel_parentTableFk,
    		    
    		    
        	});
        }
	    function reloadData() {
        	selectData();
        }
	    
        var url;
        function newInfo(){
            cleanErrMsg();
            $('#dataForm').form('clear');
            $('#dataWin').window('open');
            url = '${ctx}/sys/table/saveByAdd.do';
        }
        function editInfo(){
            var row = $('#dataList').datagrid('getSelected');
            if (row){
            	cleanErrMsg();
                $('#dataForm').form('load',row);
                $('#dataWin').window('open');
                url = '${ctx}/sys/table/saveByUpdate.do?id='+row.id;
            }    	
        }
        var loadi;
        function saveInfo(){
            $('#dataForm').form('submit',{
                url: url,
                onSubmit: function(param){
                	if($(this).form('validate')) {
                		loadi = layer.load(2, {time: layerLoadMaxTime});
                	}
                    return $(this).form('validate');
                },
                success: function(info){
                    cleanErrMsg();
                	data = eval('(' + info + ')');
                    if (data.success=="<%=StringConstant.TRUE%>"){
                        layer.msg("操作成功！", {offset: 'rb',icon: 6,shift: 8,time: layerMsgTime});
                		$('#dataWin').window('close'); 
                		reloadData();
                    } else {
	                    layer.msg("操作失败！", {offset: 'rb',icon: 5,shift: 8,time: layerMsgTime});
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
							url: '${ctx}/sys/table/delete.do',
							data: {delDataId:row.id},
							dataType: 'json',
							beforeSend: function(XMLHttpRequest){
							},
							success: function(data, textStatus){
								if (data.success=="<%=StringConstant.TRUE%>"){
			                        layer.msg("操作成功！", {offset: 'rb',icon: 6,shift: 8,time: layerMsgTime});
									reloadData();
			                    } else {
				                    layer.msg("操作失败！", {offset: 'rb',icon: 5,shift: 8,time: layerMsgTime});
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
