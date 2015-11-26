<%@ page import="com.seeyoui.kensite.common.constants.StringConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/taglib/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>    
    <title>系统皮肤</title>
	<%@ include file="/WEB-INF/view/taglib/header.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/easyui.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/layer.jsp" %>
  </head>
  <body>
 	<div style="position:absolute;top:0px;left:0px;right:0px;bottom:0px;">
		<div style="position:absolute;top:0px;left:0px;right:0px;bottom:0px;">
		    <table id="dataList" title="系统皮肤列表" class="easyui-datagrid" style="width:100%;height:100%"
		    		url="${ctx}/sys/skins/list/data"
		            toolbar="#toolbar" pagination="true"
		            rownumbers="true" fitColumns="true" singleSelect="true">
		        <thead>
		            <tr>
					    <th field="id" width="100px" hidden>主键</th>
					    <th field="name" width="100px">说明</th>
					    <th field="url" width="100px">页面路径</th>
					    <th field="main" width="100px">页面名</th>
					    <th field="state" width="100px" formatter="formatStateCol">状态</th>
		            </tr>
		        </thead>
		    </table>
		    <div id="toolbar">
		    	<shiro:hasPermission name="skins:insert">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newInfo()">新建</a>
		        </shiro:hasPermission>
		        <shiro:hasPermission name="skins:update">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editInfo()">修改</a>
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="choseSkins()">设置为默认</a>
		        </shiro:hasPermission>
		        <shiro:hasPermission name="skins:delete">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyInfo()">删除</a>
		        </shiro:hasPermission>

				说明<input id="sel_name" name="sel_name" class="easyui-textbox" data-options=""/>
			    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="selectData()">查询</a>
		    </div>
		    <div id="dataWin" class="easyui-window" title="系统皮肤信息维护" data-options="modal:true,closed:true,iconCls:'icon-save',resizable:false" style="width:400px;height:200px;padding:10px;">
		        <div class="ftitle">系统皮肤信息维护</div>
		        <form id="dataForm" method="post">
					<div class="fitem">
		                <label>说明</label>
		                <input id="name" name="name" class="easyui-textbox" data-options="required:true"/>
		                <span id="msg-name" class="err-msg"></span>
		            </div>
					<div class="fitem">
		                <label>页面路径</label>
		                <input id="url" name="url" class="easyui-textbox" data-options="required:true"/>
		                <span id="msg-url" class="err-msg"></span>
		            </div>
					<div class="fitem">
		                <label>页面名</label>
		                <input id="main" name="main" class="easyui-textbox" data-options="required:true"/>
		                <span id="msg-main" class="err-msg"></span>
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
	    
	    function formatStateCol(val,row) {
	    	if(val==null) {
				return "";
			}
			if(val=="1") {
				return "默认";
			} else {
				return "";
			}
	    }
	    
	    function selectData() {
		    var sel_name = $("#sel_name").val();
        	$('#dataList').datagrid('load',{
    		    name:sel_name
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
            url = '${ctx}/sys/skins/save';
        }
        function editInfo(){
            var row = $('#dataList').datagrid('getSelected');
            if (row){
            	cleanErrMsg();
                $('#dataForm').form('load',row);
                $('#dataWin').window('open');
                url = '${ctx}/sys/skins/update?id='+row.id;
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
                    if (data.success==TRUE){
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
            	layer.confirm('是否确认删除？', {
            	    btn: ['确定','取消'] //按钮
            	}, function(){
            		$.ajax({
						type: "post",
						url: '${ctx}/sys/skins/delete',
						data: {id:row.id},
						dataType: 'json',
						beforeSend: function(XMLHttpRequest){
							loadi = layer.load(2, {time: layerLoadMaxTime});
						},
						success: function(data, textStatus){
							layer.close(loadi);
							if (data.success==TRUE){
		                        layer.msg("操作成功！", {offset: 'rb',icon: 6,shift: 8,time: layerMsgTime});
								reloadData();
		                    } else {
			                    layer.msg("操作失败！", {offset: 'rb',icon: 5,shift: 8,time: layerMsgTime});
		                    }
						}
					});
            	}, function(){
            	});
            }
        }
        
        function choseSkins() {
        	var row = $('#dataList').datagrid('getSelected');
            if (row){
            	layer.confirm('你确定将该皮肤设置为系统默认皮肤吗？', {
            	    btn: ['确定','取消'] //按钮
            	}, function(){
            		$.ajax({
						type: "post",
						url: '${ctx}/sys/skins/chose',
						data: {id:row.id},
						dataType: 'json',
						beforeSend: function(XMLHttpRequest){
							loadi = layer.load(2, {time: layerLoadMaxTime});
						},
						success: function(data, textStatus){
							layer.close(loadi);
							if (data.success==TRUE){
		                        layer.msg("设置成功！", {offset: 'rb',icon: 6,shift: 8,time: layerMsgTime});
								reloadData();
		                    } else {
			                    layer.msg("设置失败！", {offset: 'rb',icon: 5,shift: 8,time: layerMsgTime});
		                    }
						}
					});
            	}, function(){
            	});
            }
        }
    </script>
  </body>
</html>
