<%@ page import="com.seeyoui.kensite.common.constants.StringConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/taglib/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>业务表字段</title>
	<%@ include file="/WEB-INF/view/taglib/header.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/easyui.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/layer.jsp" %>
  </head>
  <body>
 	<div style="position:absolute;top:0px;left:0px;right:0px;bottom:0px;">
		<div style="position:absolute;top:0px;left:0px;right:0px;bottom:0px;">
		    <table id="dataList" title="业务表字段列表" class="easyui-datagrid" style="width:100%;height:100%"
		    		url="${ctx}/sys/tableColumn/getListData.do"
		            toolbar="#toolbar" pagination="true"
		            rownumbers="true" fitColumns="true" singleSelect="true">
		        <thead>
		            <tr>
					    <th field="id" width="100px" hidden>主键</th>
					    <th field="tableName" width="100px">业务表</th>
					    <th field="name" width="100px">列名</th>
					    <th field="comments" width="100px">注释</th>
					    <th field="jdbcType" width="100px">数据库类型及长度</th>
					    <th field="isPk" width="100px">是否主键</th>
					    <th field="isNull" width="100px">是否可为空</th>
					    <th field="isInsert" width="100px">是否为插入字段</th>
					    <th field="isEdit" width="100px">是否编辑字段</th>
					    <th field="isList" width="100px">是否列表字段</th>
					    <th field="isQuery" width="100px">是否查询字段</th>
					    <th field="queryType" width="100px">查询方式（等于、不等于、大于、小于、范围、左LIKE、右LIKE、左右LIKE）</th>
					    <th field="category" width="100px">字段生成方案</th>
					    <th field="sortType" width="100px">排序（升序）</th>
					    <th field="defaultValue" width="100px">默认值</th>
					    <th field="validType" width="100px">校验类型</th>
					    <th field="settings" width="100px">扩展设置</th>
		            </tr>
		        </thead>
		    </table>
		    <div id="toolbar">
		    	<shiro:hasPermission name="sys:tableColumn:insert">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newInfo()">新建</a>
		        </shiro:hasPermission>
		        <shiro:hasPermission name="sys:tableColumn:update">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editInfo()">修改</a>
		        </shiro:hasPermission>
		        <shiro:hasPermission name="sys:tableColumn:delete">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyInfo()">删除</a>
		        </shiro:hasPermission>
				业务表<input id="sel_tableName" name="sel_tableName" class="easyui-textbox" data-options=""/>
				列名<input id="sel_name" name="sel_name" class="easyui-textbox" data-options=""/>
				注释<input id="sel_comments" name="sel_comments" class="easyui-textbox" data-options=""/>
				数据库类型及长度<input id="sel_jdbcType" name="sel_jdbcType" class="easyui-textbox" data-options=""/>
				是否主键<input id="sel_isPk" name="sel_isPk" class="easyui-textbox" data-options=""/>
				是否可为空<input id="sel_isNull" name="sel_isNull" class="easyui-textbox" data-options=""/>
				是否为插入字段<input id="sel_isInsert" name="sel_isInsert" class="easyui-textbox" data-options=""/>
				是否编辑字段<input id="sel_isEdit" name="sel_isEdit" class="easyui-textbox" data-options=""/>
				是否列表字段<input id="sel_isList" name="sel_isList" class="easyui-textbox" data-options=""/>
				是否查询字段<input id="sel_isQuery" name="sel_isQuery" class="easyui-textbox" data-options=""/>
				查询方式（等于、不等于、大于、小于、范围、左LIKE、右LIKE、左右LIKE）<input id="sel_queryType" name="sel_queryType" class="easyui-textbox" data-options=""/>
				字段生成方案<input id="sel_category" name="sel_category" class="easyui-textbox" data-options=""/>
				排序（升序）<input id="sel_sortType" name="sel_sortType" class="easyui-textbox" data-options=""/>
				默认值<input id="sel_defaultValue" name="sel_defaultValue" class="easyui-textbox" data-options=""/>
				校验类型<input id="sel_validType" name="sel_validType" class="easyui-textbox" data-options=""/>
				扩展设置<input id="sel_settings" name="sel_settings" class="easyui-textbox" data-options=""/>
			    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="selectData()">查询</a>
		    </div>
		    <div id="dataWin" class="easyui-window" title="业务表字段信息维护" data-options="modal:true,closed:true,iconCls:'icon-save',resizable:false" style="width:400px;height:260px;padding:10px;">
		        <div class="ftitle">业务表字段信息维护</div>
		        <form id="dataForm" method="post">
							<div class="fitem">
				                <label>业务表</label>
				                <input id="tableName" name="tableName" class="easyui-textbox" data-options="required:true"/>
				                <span id="msg-tablename" class="err-msg"></span>
				            </div>
							<div class="fitem">
				                <label>列名</label>
				                <input id="name" name="name" class="easyui-textbox" data-options="required:true"/>
				                <span id="msg-name" class="err-msg"></span>
				            </div>
							<div class="fitem">
				                <label>注释</label>
				                <input id="comments" name="comments" class="easyui-textbox" data-options="required:true"/>
				                <span id="msg-comments" class="err-msg"></span>
				            </div>
							<div class="fitem">
				                <label>数据库类型及长度</label>
				                <input id="jdbcType" name="jdbcType" class="easyui-textbox" data-options="required:true"/>
				                <span id="msg-jdbctype" class="err-msg"></span>
				            </div>
							<div class="fitem">
				                <label>是否主键</label>
				                <input id="isPk" name="isPk" class="easyui-textbox" data-options="required:true"/>
				                <span id="msg-ispk" class="err-msg"></span>
				            </div>
							<div class="fitem">
				                <label>是否可为空</label>
				                <input id="isNull" name="isNull" class="easyui-textbox" data-options="required:true"/>
				                <span id="msg-isnull" class="err-msg"></span>
				            </div>
							<div class="fitem">
				                <label>是否为插入字段</label>
				                <input id="isInsert" name="isInsert" class="easyui-textbox" data-options="required:true"/>
				                <span id="msg-isinsert" class="err-msg"></span>
				            </div>
							<div class="fitem">
				                <label>是否编辑字段</label>
				                <input id="isEdit" name="isEdit" class="easyui-textbox" data-options="required:true"/>
				                <span id="msg-isedit" class="err-msg"></span>
				            </div>
							<div class="fitem">
				                <label>是否列表字段</label>
				                <input id="isList" name="isList" class="easyui-textbox" data-options="required:true"/>
				                <span id="msg-islist" class="err-msg"></span>
				            </div>
							<div class="fitem">
				                <label>是否查询字段</label>
				                <input id="isQuery" name="isQuery" class="easyui-textbox" data-options="required:true"/>
				                <span id="msg-isquery" class="err-msg"></span>
				            </div>
							<div class="fitem">
				                <label>查询方式（等于、不等于、大于、小于、范围、左LIKE、右LIKE、左右LIKE）</label>
				                <input id="queryType" name="queryType" class="easyui-textbox" data-options="required:true"/>
				                <span id="msg-querytype" class="err-msg"></span>
				            </div>
							<div class="fitem">
				                <label>字段生成方案</label>
				                <input id="category" name="category" class="easyui-textbox" data-options="required:true"/>
				                <span id="msg-category" class="err-msg"></span>
				            </div>
							<div class="fitem">
				                <label>排序（升序）</label>
				                <input id="sortType" name="sortType" class="easyui-textbox" data-options="required:true"/>
				                <span id="msg-sorttype" class="err-msg"></span>
				            </div>
							<div class="fitem">
				                <label>默认值</label>
				                <input id="defaultValue" name="defaultValue" class="easyui-textbox" data-options="required:true"/>
				                <span id="msg-defaultvalue" class="err-msg"></span>
				            </div>
							<div class="fitem">
				                <label>校验类型</label>
				                <input id="validType" name="validType" class="easyui-textbox" data-options="required:true"/>
				                <span id="msg-validtype" class="err-msg"></span>
				            </div>
							<div class="fitem">
				                <label>扩展设置</label>
				                <input id="settings" name="settings" class="easyui-textbox" data-options="required:true"/>
				                <span id="msg-settings" class="err-msg"></span>
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
		    
		    
		    
		    
		    
		    var sel_tableName = $("#sel_tableName").val();
		    var sel_name = $("#sel_name").val();
		    var sel_comments = $("#sel_comments").val();
		    var sel_jdbcType = $("#sel_jdbcType").val();
		    var sel_isPk = $("#sel_isPk").val();
		    var sel_isNull = $("#sel_isNull").val();
		    var sel_isInsert = $("#sel_isInsert").val();
		    var sel_isEdit = $("#sel_isEdit").val();
		    var sel_isList = $("#sel_isList").val();
		    var sel_isQuery = $("#sel_isQuery").val();
		    var sel_queryType = $("#sel_queryType").val();
		    var sel_category = $("#sel_category").val();
		    var sel_sortType = $("#sel_sortType").val();
		    var sel_defaultValue = $("#sel_defaultValue").val();
		    var sel_validType = $("#sel_validType").val();
		    var sel_settings = $("#sel_settings").val();
		    
		    
        	$('#dataList').datagrid('load',{
    		    
    		    
    		    
    		    
    		    
    		    tableName:sel_tableName,
    		    name:sel_name,
    		    comments:sel_comments,
    		    jdbcType:sel_jdbcType,
    		    isPk:sel_isPk,
    		    isNull:sel_isNull,
    		    isInsert:sel_isInsert,
    		    isEdit:sel_isEdit,
    		    isList:sel_isList,
    		    isQuery:sel_isQuery,
    		    queryType:sel_queryType,
    		    category:sel_category,
    		    sortType:sel_sortType,
    		    defaultValue:sel_defaultValue,
    		    validType:sel_validType,
    		    settings:sel_settings,
    		    
    		    
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
            url = '${ctx}/sys/tableColumn/saveByAdd.do';
        }
        function editInfo(){
            var row = $('#dataList').datagrid('getSelected');
            if (row){
            	cleanErrMsg();
                $('#dataForm').form('load',row);
                $('#dataWin').window('open');
                url = '${ctx}/sys/tableColumn/saveByUpdate.do?id='+row.id;
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
							url: '${ctx}/sys/tableColumn/delete.do',
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
