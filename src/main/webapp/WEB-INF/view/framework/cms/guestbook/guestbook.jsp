<%@ page import="com.seeyoui.kensite.common.constants.StringConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/taglib/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>留言板</title>
	<%@ include file="/WEB-INF/view/taglib/header.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/easyui.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/layer.jsp" %>
  </head>
  <body>
 	<div style="position:absolute;top:0px;left:0px;right:0px;bottom:0px;">
		<div style="position:absolute;top:0px;left:0px;right:0px;bottom:0px;">
		    <table id="dataList" title="留言板列表" class="easyui-datagrid" style="width:100%;height:100%"
		    		url="${ctx}/cms/guestbook/getListData.do"
		            toolbar="#toolbar" pagination="true"
		            rownumbers="true" fitColumns="true" singleSelect="true">
		        <thead>
		            <tr>
					    <th field="id" width="100px" hidden>编号</th>
					    <th field="type" width="100px" formatter="formatType">留言分类</th>
					    <th field="content" width="100px">留言内容</th>
					    <th field="name" width="100px">姓名</th>
					    <th field="email" width="100px">邮箱</th>
					    <th field="phone" width="100px">电话</th>
					    <th field="workunit" width="100px">单位</th>
					    <th field="ip" width="100px">IP</th>
					    <th field="reUserId" width="100px" hidden>回复人</th>
					    <th field="reDate" width="100px" formatter="formatDateCol">回复时间</th>
					    <th field="reContent" width="100px">回复内容</th>
		            </tr>
		        </thead>
		    </table>
		    <div id="toolbar">
		    	<%-- <shiro:hasPermission name="cms:comment:insert">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newInfo()">新建</a>
		        </shiro:hasPermission> --%>
		        <shiro:hasPermission name="cms:guestbook:update">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editInfo()">回复</a>
		        </shiro:hasPermission>
		        <shiro:hasPermission name="cms:guestbook:delete">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyInfo()">删除</a>
		        </shiro:hasPermission>

				留言分类<input id="sel_type" name="sel_type" class="easyui-combobox" data-options="panelHeight:'auto',valueField: 'value',textField: 'label',data: [{label: '咨询',value: '1'},{label: '建议',value: '2'},{label: '投诉',value: '3'},{label: '其他',value: '4'}]" />
			    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="selectData()">查询</a>
		    </div>
		    <div id="dataWin" class="easyui-window" title="留言板信息维护" data-options="modal:true,closed:true,iconCls:'icon-save',resizable:false" style="width:400px;height:260px;padding:10px;">
		        <div class="ftitle">留言板信息维护</div>
		        <form id="dataForm" method="post">
					<div class="fitem">
		                <label>回复时间</label>
		                <input id="reDate" name="reDate" class="easyui-validatebox textbox" data-options="readonly:true"/>
		                <input id="reUserId" name="reUserId" type="hidden"/>
		                <span id="msg-redate" class="err-msg"></span>
		            </div>
					<div class="fitem">
		                <label>回复内容</label>
		                <input id="reContent" name="reContent" class="easyui-validatebox textbox" data-options="multiline:true,required:true" style="height:100px"/>
		                <span id="msg-recontent" class="err-msg"></span>
		            </div>
				</form>
				
			    <div id="dataWin-buttons">
			        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveInfo()" style="width:90px">回复</a>
			        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dataWin').window('close')" style="width:90px">取消</a>
			    </div>
		    </div>
	    </div>
    </div>
    <script type="text/javascript">
	    $(document).ready(function(){
	    });

	    function formatType(value, row, index){
			if (value == "1"){
				return "咨询";
			} else if (value == "2"){
				return "建议";
			} if (value == "3"){
				return "投诉";
			} else {
				return "其他";
			}
		}
	    
	    function selectData() {
		    var sel_type = $("#sel_type").combobox('getValue');
        	$('#dataList').datagrid('load',{
    		    type:sel_type
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
            url = '${ctx}/cms/guestbook/saveByAdd.do';
        }
        function editInfo(){
            var row = $('#dataList').datagrid('getSelected');
            if (row){
            	cleanErrMsg();
                $('#dataForm').form('load',row);
                $('#reUserId').val('${currentUser.id}');
                $('#reDate').val(getCurrentDate());
                $('#dataWin').window('open');
                url = '${ctx}/cms/guestbook/saveByUpdate.do?id='+row.id;
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
                	layer.close(loadi);
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
							url: '${ctx}/cms/guestbook/delete.do',
							data: {delDataId:row.id},
							dataType: 'json',
							beforeSend: function(XMLHttpRequest){
								loadi = layer.load(2, {time: layerLoadMaxTime});
							},
							success: function(data, textStatus){
								layer.close(loadi);
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
        
        function getCurrentDate() {
	    	var d = new Date();
			var year = d.getFullYear();
			var month = d.getMonth() + 1;
			var day = d.getDate();
	    	if(month.length == 1) {
	    		month = "0"+month;
	    	}
	    	if(day.length == 1) {
	    		day = "0"+day;
	    	}
	    	return year+"-"+month+"-"+day;
	    }
    </script>
  </body>
</html>
