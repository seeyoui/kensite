<%@ page import="com.seeyoui.kensite.common.constants.StringConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/taglib/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>测试1</title>
	<%@ include file="/WEB-INF/view/taglib/header.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/easyui.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/layer.jsp" %>
  </head>
  <body>
 	<div style="position:absolute;top:0px;left:0px;right:0px;bottom:0px;">
		<div style="position:absolute;top:0px;left:0px;right:0px;bottom:0px;">
		    <table id="dataList" title="测试1列表" class="easyui-datagrid" style="width:100%;height:100%"
		    		url="${ctx}/demo/testW/list/data"
		            toolbar="#toolbar" pagination="true"
		            rownumbers="true" fitColumns="true" singleSelect="true">
		        <thead>
		            <tr>
					    <th field="id" width="100px" hidden>主键</th>
					    
					    
					    
					    
					    
					    
					    <th field="name" width="100px">姓名</th>
					    <th field="birthday" width="100px" align="center">出生日期</th>
					    <th field="sex" width="100px">性别</th>
					    <th field="describe" width="100px">简历</th>
					    <th field="isdel" width="100px">是否屏蔽</th>
		            </tr>
		        </thead>
		    </table>
		    <div id="toolbar">
		    	<shiro:hasPermission name="demo:testW:insert">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newInfo()">新建</a>
		        </shiro:hasPermission>
		        <shiro:hasPermission name="demo:testW:update">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editInfo()">修改</a>
		        </shiro:hasPermission>
		        <shiro:hasPermission name="demo:testW:delete">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyInfo()">删除</a>
		        </shiro:hasPermission>







				姓名<input id="sel_name" name="sel_name" class="easyui-textbox" data-options=""/>
				出生日期<input id="sel_birthday" name="sel_birthday" class="easyui-textbox" data-options="" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
				性别<input id="sel_sex" name="sel_sex" class="easyui-textbox" data-options=""/>
				简历<input id="sel_describe" name="sel_describe" class="easyui-textbox" data-options=""/>
				是否屏蔽<input id="sel_isdel" name="sel_isdel" class="easyui-textbox" data-options=""/>
			    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="selectData()">查询</a>
		    </div>
		    <div id="dataWin" class="easyui-window" title="测试1信息维护" data-options="modal:true,closed:true,iconCls:'icon-save',resizable:false" style="width:400px;height:260px;padding:10px;">
		        <div class="ftitle">测试1信息维护</div>
		        <form id="dataForm" method="post">
							<div class="fitem">
				                <label>姓名</label>
				                <input id="name" name="name" class="easyui-textbox" data-options="required:true"/>
				                <span id="msg-name" class="err-msg"></span>
				            </div>
							<div class="fitem">
				                <label>出生日期</label>
				                <input id="birthday" name="birthday" class="easyui-textbox" data-options="required:true" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
				                <span id="msg-birthday" class="err-msg"></span>
				            </div>
							<div class="fitem">
				                <label>性别</label>
				                <input id="sex" name="sex" class="easyui-textbox" data-options="required:true"/>
				                <span id="msg-sex" class="err-msg"></span>
				            </div>
							<div class="fitem">
				                <label>简历</label>
				                <input id="describe" name="describe" class="easyui-textbox" data-options="required:true,multiline:true" style="height:100px"/>
				                <span id="msg-describe" class="err-msg"></span>
				            </div>
							<div class="fitem">
				                <label>是否屏蔽</label>
				                <input id="isdel" name="isdel" class="easyui-textbox" data-options="required:true"/>
				                <span id="msg-isdel" class="err-msg"></span>
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
		    var sel_birthday = $("#sel_birthday").val();
		    var sel_sex = $("#sel_sex").val();
		    var sel_describe = $("#sel_describe").val();
		    var sel_isdel = $("#sel_isdel").val();
        	$('#dataList').datagrid('load',{
    		    
    		    
    		    
    		    
    		    
    		    
    		    
    		    name:sel_name,
    		    birthday:sel_birthday,
    		    sex:sel_sex,
    		    describe:sel_describe,
    		    isdel:sel_isdel
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
            url = '${ctx}/demo/testW/save';
        }
        function editInfo(){
            var row = $('#dataList').datagrid('getSelected');
            if (row){
            	cleanErrMsg();
                $('#dataForm').form('load',row);
                $('#dataWin').window('open');
                url = '${ctx}/demo/testW/update?id='+row.id;
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
							url: '${ctx}/demo/testW/delete',
							data: {id:row.id},
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
