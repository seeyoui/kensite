<%@ page import="com.seeyoui.kensite.common.constants.StringConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/taglib/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>    
    <title>系统消息</title>
	<%@ include file="/WEB-INF/view/taglib/header.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/easyui.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/layer.jsp" %>
  </head>
  <body>
  	<div style="position:absolute;top:0px;left:0px;right:0px;bottom:0px;">
		<div style="position:absolute;top:0px;left:0px;right:0px;bottom:0px;">
		    <table id="dataList" title="系统消息列表" class="easyui-datagrid" style="width:100%;height:100%"
		    		url="${ctx}/information/getListData.do"
		            toolbar="#toolbar" pagination="true"
		            rownumbers="true" fitColumns="true" singleSelect="true">
		        <thead>
		            <tr>
					    <th field="id" width="100px" hidden>主键</th>
					    <th field="sendtime" width="100px" formatter="formatDateTimeCol">发送时间</th>
					    <th field="content" width="100px">消息内容</th>
					    <th field="type" width="100px">消息类型</th>
					    <th field="sender" width="100px">发送者</th>
					    <th field="receiver" width="100px">接收者</th>
					    <th field="timeout" width="50px" align="right">时效</th>
					    <th field="status" width="50px" align="right">状态</th>
		            </tr>
		        </thead>
		    </table>
		    <div id="toolbar">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newInfo()">新建</a>
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editInfo()">修改</a>
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyInfo()">删除</a>
		    	<shiro:hasPermission name="information:insert">
		        </shiro:hasPermission>
		        <shiro:hasPermission name="information:update">
		        </shiro:hasPermission>
		        <shiro:hasPermission name="information:delete">
		        </shiro:hasPermission>
消息内容<input id="sel_content" name="sel_content" class="easyui-textbox" data-options=""/>
消息类型<input id="sel_type" name="sel_type" class="easyui-textbox" data-options=""/>
发送者<input id="sel_sender" name="sel_sender" class="easyui-textbox" data-options=""/>
接收者<input id="sel_receiver" name="sel_receiver" class="easyui-textbox" data-options=""/>
			    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="selectData()">查询</a>
		    </div>
		    <div id="dataWin" class="easyui-window" title="系统消息信息维护" data-options="modal:true,closed:true,iconCls:'icon-save',resizable:false" style="width:400px;height:260px;padding:10px;">
		        <div class="ftitle">系统消息信息维护</div>
		        <form id="dataForm" method="post">
							<div class="fitem">
				                <label>消息内容</label>
				                <input id="content" name="content" class="easyui-validatebox textbox" data-options="required:true"/>
				            </div>
							<div class="fitem">
				                <label>消息类型</label>
				                <input id="type" name="type" class="easyui-validatebox textbox" data-options="required:true"/>
				            </div>
							<div class="fitem">
				                <label>发送者</label>
				                <input id="sender" name="sender" class="easyui-validatebox textbox" data-options="required:true"/>
				            </div>
							<div class="fitem">
				                <label>接收者</label>
				                <input id="receiver" name="receiver" class="easyui-validatebox textbox" data-options="required:true"/>
				            </div>
							<div class="fitem">
				                <label>时效</label>
				                <input id="timeout" name="timeout" class="easyui-numberbox textbox" data-options="min:0,max:999999,precision:0,required:true"/>
				            </div>
							<div class="fitem">
				                <label>状态</label>
				                <input id="status" name="status" class="easyui-numberbox textbox" data-options="min:0,max:999999,precision:0,required:true"/>
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
		    var sel_content = $("#sel_content").val();
		    var sel_type = $("#sel_type").val();
		    var sel_sender = $("#sel_sender").val();
		    var sel_receiver = $("#sel_receiver").val();
        	$('#dataList').datagrid('load',{
    		    content:sel_content,
    		    type:sel_type,
    		    sender:sel_sender,
    		    receiver:sel_receiver
        	});
        }
	    function reloadData() {
        	selectData();
        }
	    
        var url;
        function newInfo(){
            $('#dataWin').window('open');
            $('#dataForm').form('clear');
            url = '${ctx}/information/saveByAdd.do';
        }
        function editInfo(){
            var row = $('#dataList').datagrid('getSelected');
            if (row){
                $('#dataWin').window('open');
                $('#dataForm').form('load',row);
                url = '${ctx}/information/saveByUpdate.do?id='+row.id;
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
                    if (info=="<%=StringConstant.TRUE%>"){
                        layer.msg("操作成功！", {offset: 'rb',icon: 6,shift: 8,time: layerMsgTime});
                    } else {
	                    layer.msg("操作失败！", {offset: 'rb',icon: 5,shift: 8,time: layerMsgTime});
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
							url: '${ctx}/information/delete.do',
							data: {delDataId:row.id},
							dataType: 'text',
							beforeSend: function(XMLHttpRequest){
							},
							success: function(data, textStatus){
								if (data=="<%=StringConstant.TRUE%>"){
			                        layer.msg("操作成功！", {offset: 'rb',icon: 6,shift: 8,time: layerMsgTime});
			                    } else {
				                    layer.msg("操作失败！", {offset: 'rb',icon: 5,shift: 8,time: layerMsgTime});
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
