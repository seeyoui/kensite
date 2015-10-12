<%@ page import="com.seeyoui.kensite.common.constants.StringConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/taglib/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>评论</title>
	<%@ include file="/WEB-INF/view/taglib/header.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/easyui.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/layer.jsp" %>
  </head>
  <body>
 	<div style="position:absolute;top:0px;left:0px;right:0px;bottom:0px;">
		<div style="position:absolute;top:0px;left:0px;right:0px;bottom:0px;">
		    <table id="dataList" title="评论列表" class="easyui-datagrid" style="width:100%;height:100%"
		    		url="${ctx}/cms/comment/getListData.do"
		            toolbar="#toolbar" pagination="true"
		            rownumbers="true" fitColumns="true" singleSelect="true">
		        <thead>
		            <tr>
					    <th field="id" width="100px" hidden>编号</th>
					    <th field="categoryId" width="100px">栏目编号</th>
					    <th field="contentId" width="100px">内容编号</th>
					    <th field="title" width="100px">内容标题</th>
					    <th field="content" width="100px">评论内容</th>
					    <th field="name" width="100px">评论姓名</th>
					    <th field="ip" width="100px">评论IP</th>
					    <th field="auditUserId" width="100px">审核人</th>
					    <th field="auditDate" width="100px" formatter="formatDateTimeCol">审核时间</th>
					    
					    
					    
					    
					    
					    
		            </tr>
		        </thead>
		    </table>
		    <div id="toolbar">
		    	<shiro:hasPermission name="cms:comment:insert">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newInfo()">新建</a>
		        </shiro:hasPermission>
		        <shiro:hasPermission name="cms:comment:update">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editInfo()">修改</a>
		        </shiro:hasPermission>
		        <shiro:hasPermission name="cms:comment:delete">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyInfo()">删除</a>
		        </shiro:hasPermission>

				栏目编号<input id="sel_categoryId" name="sel_categoryId" class="easyui-textbox" data-options=""/>
				内容编号<input id="sel_contentId" name="sel_contentId" class="easyui-textbox" data-options=""/>
				内容标题<input id="sel_title" name="sel_title" class="easyui-textbox" data-options=""/>
				评论内容<input id="sel_content" name="sel_content" class="easyui-textbox" data-options=""/>
				评论姓名<input id="sel_name" name="sel_name" class="easyui-textbox" data-options=""/>
				评论IP<input id="sel_ip" name="sel_ip" class="easyui-textbox" data-options=""/>
				审核人<input id="sel_auditUserId" name="sel_auditUserId" class="easyui-textbox" data-options=""/>
				审核时间<input id="sel_auditDate" name="sel_auditDate" class="easyui-textbox" data-options="" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>






			    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="selectData()">查询</a>
		    </div>
		    <div id="dataWin" class="easyui-window" title="评论信息维护" data-options="modal:true,closed:true,iconCls:'icon-save',resizable:false" style="width:400px;height:260px;padding:10px;">
		        <div class="ftitle">评论信息维护</div>
		        <form id="dataForm" method="post">
							<div class="fitem">
				                <label>栏目编号</label>
				                <input id="categoryId" name="categoryId" class="easyui-validatebox textbox" data-options="required:true"/>
				                <span id="msg-categoryid" class="err-msg"></span>
				            </div>
							<div class="fitem">
				                <label>内容编号</label>
				                <input id="contentId" name="contentId" class="easyui-validatebox textbox" data-options="required:true"/>
				                <span id="msg-contentid" class="err-msg"></span>
				            </div>
							<div class="fitem">
				                <label>内容标题</label>
				                <input id="title" name="title" class="easyui-validatebox textbox" data-options="required:true"/>
				                <span id="msg-title" class="err-msg"></span>
				            </div>
							<div class="fitem">
				                <label>评论内容</label>
				                <input id="content" name="content" class="easyui-validatebox textbox" data-options="required:true"/>
				                <span id="msg-content" class="err-msg"></span>
				            </div>
							<div class="fitem">
				                <label>评论姓名</label>
				                <input id="name" name="name" class="easyui-validatebox textbox" data-options="required:true"/>
				                <span id="msg-name" class="err-msg"></span>
				            </div>
							<div class="fitem">
				                <label>评论IP</label>
				                <input id="ip" name="ip" class="easyui-validatebox textbox" data-options="required:true"/>
				                <span id="msg-ip" class="err-msg"></span>
				            </div>
							<div class="fitem">
				                <label>审核人</label>
				                <input id="auditUserId" name="auditUserId" class="easyui-validatebox textbox" data-options="required:true"/>
				                <span id="msg-audituserid" class="err-msg"></span>
				            </div>
							<div class="fitem">
				                <label>审核时间</label>
				                <input id="auditDate" name="auditDate" class="easyui-validatebox textbox" data-options="required:true" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
				                <span id="msg-auditdate" class="err-msg"></span>
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
		    
		    var sel_categoryId = $("#sel_categoryId").val();
		    var sel_contentId = $("#sel_contentId").val();
		    var sel_title = $("#sel_title").val();
		    var sel_content = $("#sel_content").val();
		    var sel_name = $("#sel_name").val();
		    var sel_ip = $("#sel_ip").val();
		    var sel_auditUserId = $("#sel_auditUserId").val();
		    var sel_auditDate = $("#sel_auditDate").val();
		    
		    
		    
		    
		    
		    
        	$('#dataList').datagrid('load',{
    		    
    		    categoryId:sel_categoryId,
    		    contentId:sel_contentId,
    		    title:sel_title,
    		    content:sel_content,
    		    name:sel_name,
    		    ip:sel_ip,
    		    auditUserId:sel_auditUserId,
    		    auditDate:sel_auditDate,
    		    
    		    
    		    
    		    
    		    
    		    
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
            url = '${ctx}/cms/comment/saveByAdd.do';
        }
        function editInfo(){
            var row = $('#dataList').datagrid('getSelected');
            if (row){
            	cleanErrMsg();
                $('#dataForm').form('load',row);
                $('#dataWin').window('open');
                url = '${ctx}/cms/comment/saveByUpdate.do?id='+row.id;
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
							url: '${ctx}/cms/comment/delete.do',
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
