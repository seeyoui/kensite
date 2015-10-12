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
					    <th field="type" width="100px">留言分类</th>
					    <th field="content" width="100px">留言内容</th>
					    <th field="name" width="100px">姓名</th>
					    <th field="email" width="100px">邮箱</th>
					    <th field="phone" width="100px">电话</th>
					    <th field="workunit" width="100px">单位</th>
					    <th field="ip" width="100px">IP</th>
					    <th field="reUserId" width="100px">回复人</th>
					    <th field="reDate" width="100px" formatter="formatDateTimeCol">回复时间</th>
					    <th field="reContent" width="100px">回复内容</th>
					    
					    
					    
					    
					    
					    
		            </tr>
		        </thead>
		    </table>
		    <div id="toolbar">
		    	<shiro:hasPermission name="cms:guestbook:insert">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newInfo()">新建</a>
		        </shiro:hasPermission>
		        <shiro:hasPermission name="cms:guestbook:update">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editInfo()">修改</a>
		        </shiro:hasPermission>
		        <shiro:hasPermission name="cms:guestbook:delete">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyInfo()">删除</a>
		        </shiro:hasPermission>

				留言分类<input id="sel_type" name="sel_type" class="easyui-textbox" data-options=""/>
				留言内容<input id="sel_content" name="sel_content" class="easyui-textbox" data-options=""/>
				姓名<input id="sel_name" name="sel_name" class="easyui-textbox" data-options=""/>
				邮箱<input id="sel_email" name="sel_email" class="easyui-textbox" data-options=""/>
				电话<input id="sel_phone" name="sel_phone" class="easyui-textbox" data-options=""/>
				单位<input id="sel_workunit" name="sel_workunit" class="easyui-textbox" data-options=""/>
				IP<input id="sel_ip" name="sel_ip" class="easyui-textbox" data-options=""/>
				回复人<input id="sel_reUserId" name="sel_reUserId" class="easyui-textbox" data-options=""/>
				回复时间<input id="sel_reDate" name="sel_reDate" class="easyui-textbox" data-options="" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
				回复内容<input id="sel_reContent" name="sel_reContent" class="easyui-textbox" data-options=""/>






			    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="selectData()">查询</a>
		    </div>
		    <div id="dataWin" class="easyui-window" title="留言板信息维护" data-options="modal:true,closed:true,iconCls:'icon-save',resizable:false" style="width:400px;height:260px;padding:10px;">
		        <div class="ftitle">留言板信息维护</div>
		        <form id="dataForm" method="post">
							<div class="fitem">
				                <label>留言分类</label>
				                <input id="type" name="type" class="easyui-validatebox textbox" data-options="required:true"/>
				                <span id="msg-type" class="err-msg"></span>
				            </div>
							<div class="fitem">
				                <label>留言内容</label>
				                <input id="content" name="content" class="easyui-validatebox textbox" data-options="required:true"/>
				                <span id="msg-content" class="err-msg"></span>
				            </div>
							<div class="fitem">
				                <label>姓名</label>
				                <input id="name" name="name" class="easyui-validatebox textbox" data-options="required:true"/>
				                <span id="msg-name" class="err-msg"></span>
				            </div>
							<div class="fitem">
				                <label>邮箱</label>
				                <input id="email" name="email" class="easyui-validatebox textbox" data-options="required:true"/>
				                <span id="msg-email" class="err-msg"></span>
				            </div>
							<div class="fitem">
				                <label>电话</label>
				                <input id="phone" name="phone" class="easyui-validatebox textbox" data-options="required:true"/>
				                <span id="msg-phone" class="err-msg"></span>
				            </div>
							<div class="fitem">
				                <label>单位</label>
				                <input id="workunit" name="workunit" class="easyui-validatebox textbox" data-options="required:true"/>
				                <span id="msg-workunit" class="err-msg"></span>
				            </div>
							<div class="fitem">
				                <label>IP</label>
				                <input id="ip" name="ip" class="easyui-validatebox textbox" data-options="required:true"/>
				                <span id="msg-ip" class="err-msg"></span>
				            </div>
							<div class="fitem">
				                <label>回复人</label>
				                <input id="reUserId" name="reUserId" class="easyui-validatebox textbox" data-options="required:true"/>
				                <span id="msg-reuserid" class="err-msg"></span>
				            </div>
							<div class="fitem">
				                <label>回复时间</label>
				                <input id="reDate" name="reDate" class="easyui-validatebox textbox" data-options="required:true" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
				                <span id="msg-redate" class="err-msg"></span>
				            </div>
							<div class="fitem">
				                <label>回复内容</label>
				                <input id="reContent" name="reContent" class="easyui-validatebox textbox" data-options="required:true"/>
				                <span id="msg-recontent" class="err-msg"></span>
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
		    
		    var sel_type = $("#sel_type").val();
		    var sel_content = $("#sel_content").val();
		    var sel_name = $("#sel_name").val();
		    var sel_email = $("#sel_email").val();
		    var sel_phone = $("#sel_phone").val();
		    var sel_workunit = $("#sel_workunit").val();
		    var sel_ip = $("#sel_ip").val();
		    var sel_reUserId = $("#sel_reUserId").val();
		    var sel_reDate = $("#sel_reDate").val();
		    var sel_reContent = $("#sel_reContent").val();
		    
		    
		    
		    
		    
		    
        	$('#dataList').datagrid('load',{
    		    
    		    type:sel_type,
    		    content:sel_content,
    		    name:sel_name,
    		    email:sel_email,
    		    phone:sel_phone,
    		    workunit:sel_workunit,
    		    ip:sel_ip,
    		    reUserId:sel_reUserId,
    		    reDate:sel_reDate,
    		    reContent:sel_reContent,
    		    
    		    
    		    
    		    
    		    
    		    
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
    </script>
  </body>
</html>
