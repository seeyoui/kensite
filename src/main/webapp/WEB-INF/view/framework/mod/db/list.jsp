<%@ page import="com.seeyoui.kensite.common.constants.StringConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/taglib/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>    
    <title>数据建模</title>
	<%@ include file="/WEB-INF/view/taglib/header.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/easyui.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/layer.jsp" %>
  </head>
  <body style="overflow:hidden">
 	<div style="position:absolute;top:0px;left:0px;right:0px;bottom:0px;">
		<div style="position:absolute;top:0px;bottom:0px;width:450px;">
		    <table id="dataList" title="数据表" class="easyui-datagrid" style="width:100%;height:100%"
		    		url="${ctx}/sys/table/getListData.do"
		            toolbar="#toolbar" pagination="true"
		            rownumbers="true" fitColumns="true" singleSelect="true">
		        <thead>
		            <tr>
					    <th field="id" width="100px" hidden>主键</th>
					    <th field="name" width="100px">名称</th>
					    <th field="comments" width="100px">描述</th>
					    <th field="parentTable" width="100px" hidden>关联父表</th>
					    <th field="parentTableFk" width="100px" hidden>关联父表外键</th>
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
		        <br/>
				名称<input id="sel_name" name="sel_name" class="easyui-textbox" data-options=""/>
				描述<input id="sel_comments" name="sel_comments" class="easyui-textbox" data-options=""/>
			    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="selectData()">查询</a>
		    </div>
	    </div>
		<div style="position:absolute;top:0px;right:0px;left:450px;bottom:0px;">
		    <table id="dataSubList" title="数据列" class="easyui-datagrid" style="width:100%;height:100%"
		            toolbar="#subtoolbar" pagination="true"
		            rownumbers="true" fitColumns="false" singleSelect="true">
		        <thead>
		            <tr>
					    <th field="id" width="100px" hidden>主键</th>
					    <th field="tableName" width="100px" hidden>业务表</th>
					    <th field="name" width="100px">列名</th>
					    <th field="comments" width="100px">注释</th>
					    <th field="jdbcType" width="80px">类型</th>
					    <th field="jdbcLength" width="60px">长度</th>
					    <th field="isNull" width="60px" formatter="formatNullable">是否为空</th>
					    <th field="isEdit" width="60px" formatter="formatEditable">是否编辑</th>
					    <th field="isList" width="60px" formatter="formatNullable">是否列表</th>
					    <th field="isQuery" width="60px" formatter="formatNullable">是否查询</th>
					    <th field="category" width="100px" hidden>生成方案</th>
					    <th field="defaultValue" width="100px" hidden>默认值</th>
					    <th field="validType" width="100px" hidden>校验类型</th>
					    <th field="settings" width="100px" hidden>扩展设置</th>
		            </tr>
		        </thead>
		    </table>
		    <div id="subtoolbar">
		    	<shiro:hasPermission name="sys:tableColumn:insert">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newSubInfo()">新建</a>
		        </shiro:hasPermission>
		        <shiro:hasPermission name="sys:tableColumn:update">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editSubInfo()">修改</a>
		        </shiro:hasPermission>
		        <shiro:hasPermission name="sys:tableColumn:delete">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroySubInfo()">删除</a>
		        </shiro:hasPermission>
		        <br/>
				列名<input id="sel_name" name="sel_name" class="easyui-textbox" data-options=""/>
				注释<input id="sel_comments" name="sel_comments" class="easyui-textbox" data-options=""/>
				类型<input id="sel_jdbcType" name="sel_jdbcType" class="easyui-textbox" data-options=""/>
				<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="selectSubData()">查询</a>
		    </div>
	    </div>
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
		                <input id="parentTable" name="parentTable" class="easyui-textbox" data-options=""/>
		                <span id="msg-parenttable" class="err-msg"></span>
		            </div>
					<div class="fitem">
		                <label>关联父表外键</label>
		                <input id="parentTableFk" name="parentTableFk" class="easyui-textbox" data-options=""/>
		                <span id="msg-parenttablefk" class="err-msg"></span>
		            </div>
		</form>
		
	    <div id="dataWin-buttons">
	        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveInfo()" style="width:90px">保存</a>
	        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dataWin').window('close')" style="width:90px">取消</a>
	    </div>
    </div>
    <div id="dataSubWin" class="easyui-window" title="业务表字段信息维护" data-options="modal:true,closed:true,iconCls:'icon-save',resizable:false" style="width:800px;height:280px;padding:10px;">
        <div class="ftitle">业务表字段信息维护</div>
        <form id="dataSubForm" method="post">
					<div class="fitem">
		                <label>列名</label>
		                <input id="name" name="name" class="easyui-textbox" data-options="required:true,validType:'jdbcType'"/>
		                <span id="msg-name" class="err-msg"></span>
		                <label>注释</label>
		                <input id="comments" name="comments" class="easyui-textbox" data-options="required:true"/>
		                <span id="msg-comments" class="err-msg"></span>
		            </div>
					<div class="fitem">
		                <label>类型</label>
		                <input id="jdbcType" name="jdbcType" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto',required:true,valueField: 'value',textField: 'label'"/>
		                <span id="msg-jdbctype" class="err-msg"></span>
		                <label>长度</label>
		                <input id="jdbcLength" name="jdbcLength" class="easyui-textbox" data-options="validType:'jdbcLength'"/>
		                <span id="msg-ispk" class="err-msg"></span>
		                <label>默认值</label>
		                <input id="defaultValue" name="defaultValue" class="easyui-textbox" data-options=""/>
		                <span id="msg-defaultvalue" class="err-msg"></span>
		            </div>
					<div class="fitem">
		                <label>是否为空</label>
		                <input id="isNull" name="isNull" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto',required:true,valueField: 'value',textField: 'label'"/>
		                <span id="msg-isnull" class="err-msg"></span>
		                <label>是否编辑</label>
		                <input id="isEdit" name="isEdit" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto',required:true,valueField: 'value',textField: 'label'"/>
		                <span id="msg-isedit" class="err-msg"></span>
		                <label>校验类型</label>
		                <input id="validType" name="validType" class="easyui-combobox" data-options="valueField: 'value',textField: 'label'"/>
		                <span id="msg-validtype" class="err-msg"></span>
		            </div>
					<div class="fitem">
		                <label>是否列表</label>
		                <input id="isList" name="isList" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto',required:true,valueField: 'value',textField: 'label'"/>
		                <span id="msg-isList" class="err-msg"></span>
		                <label>列表宽度</label>
		                <input id="listWidth" name="listWidth" class="easyui-numberbox" data-options="min:0,precision:0,value:100"/>
		                <span id="msg-listWidth" class="err-msg"></span>
		            </div>
					<div class="fitem">
		                <label>是否查询</label>
		                <input id="isQuery" name="isQuery" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto',required:true,valueField: 'value',textField: 'label'"/>
		                <span id="msg-isQuery" class="err-msg"></span>
		                <label>查询宽度</label>
		                <input id="queryWidth" name="queryWidth" class="easyui-numberbox" data-options="min:0,precision:0,value:100"/>
		                <span id="msg-queryWidth" class="err-msg"></span>
		            </div>
					<div class="fitem">
		                <label>生成方案</label>
		                <input id="category" name="category" class="easyui-combobox" data-options="readonly:true,editable:false,panelHeight: 'auto',required:true,valueField: 'value',textField: 'label'" style="width:105px;"/>
		                <!-- <input id="category" name="category" class="easyui-textbox" data-options="readonly:true,required:true" style="width:105px;"/> --><!-- ,buttonText:'配置',buttonIcon:'icon-26422' -->
		                <a id="config" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-26422'">配置</a>
		                <span id="msg-category" class="err-msg"></span>
		                <div style="display:none">
		                <label>扩展设置</label>
		                <input id="settings" name="settings" class="easyui-textbox" data-options="readonly:true"/><!-- style="width:410px;" -->
		                <span id="msg-settings" class="err-msg"></span>
		                </div>
		                <label>扩展HTML</label>
		                <input id="htmlInner" name="htmlInner" class="easyui-textbox" data-options="" style="width:410px;"/><!-- style="width:410px;" -->
		                <span id="msg-settings" class="err-msg"></span>
		            </div>
		            
		            <input id="tableName" name="tableName" type="hidden"/>
		</form>
		
	    <div id="dataWin-buttons">
	        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveSubInfo()" style="width:90px">保存</a>
	        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dataSubWin').window('close')" style="width:90px">取消</a>
	    </div>
    </div>
    <script type="text/javascript">
    var nullableJson;
    var editableJson;
    var validTypeJson;
    var categoryJson;
    var jdbcTypeJson;
    
    var tableName;
    $(document).ready(function(){
    	getValidTypeJson();
    	getNullableJson();
    	getEditableJson();
    	getCategoryJson();
    	getJdbcTypeJson();
    	$('#dataList').datagrid({
    		onDblClickRow: function(index,row){
				tableName = row.name;
				changeTabCol(row.name);
			}
		});
    	$('#dataSubList').datagrid('loadData',{total:0,rows:[]});
    	$('#config').bind('click', function(){
    		layer.open({
				title: '字段配置',
			    type: 2,
			    area: ['400px', '330px'],
			    fix: false, //不固定
			    maxmin: false,
			    content: '${ctx_static}/form/mod/config.jsp'
			});
        });
    	$('#jdbcType').combobox({
    		onSelect: function(record){
    			changeJdbcLength(record.value);
    		}
    	});
		$('#jdbcLength').textbox('readonly', true);
    });
    
    function changeTabCol(tableName) {
    	//清空历史查询结果
    	$('#dataSubList').datagrid('loadData',{total:0,rows:[]});
    	$('#dataSubList').datagrid({url:'${ctx}/sys/tableColumn/getListData.do?tableName='+tableName});
    }
    
    function changeJdbcLength(jdbcType) {
    	if(jdbcType == 'CHAR') {
    		$('#jdbcLength').textbox('readonly', false);
    		$('#jdbcLength').textbox('setValue', '32');
    	}
    	if(jdbcType == 'VARCHAR2') {
    		$('#jdbcLength').textbox('readonly', false);
    		$('#jdbcLength').textbox('setValue', '100');
    	}
    	if(jdbcType == 'NUMBER') {
    		$('#jdbcLength').textbox('readonly', false);
    		$('#jdbcLength').textbox('setValue', '10,2');
    	}
    	if(jdbcType == 'DATE') {
    		$('#jdbcLength').textbox('readonly', true);
    		$('#jdbcLength').textbox('setValue', '');
    	}
    	if(jdbcType == 'CLOB') {
    		$('#jdbcLength').textbox('readonly', true);
    		$('#jdbcLength').textbox('setValue', '');
    	}
    }
    
    function selectData() {
    	var sel_name = $("#sel_name").val();
	    var sel_comments = $("#sel_comments").val();
    	$('#dataList').datagrid('load',{
    		name:sel_name,
		    comments:sel_comments
    	});
    }
    function reloadData() {
    	selectData();
    	$('#dataSubList').datagrid('loadData',{total:0,rows:[]});
    }
    
    function formatNullable(val,row) {
    	if(nullableJson == null) {
    		return "";
    	}
    	for(var obj in nullableJson) {
    		if(nullableJson[obj].value == val) {
    			return nullableJson[obj].label;
    		}
    	}
    }
    
    function formatEditable(val,row) {
    	if(editableJson == null) {
    		return "";
    	}
    	for(var obj in editableJson) {
    		if(editableJson[obj].value == val) {
    			return editableJson[obj].label;
    		}
    	}
    }
    
    function selectSubData() {
    	var sel_name = $("#sel_name").val();
	    var sel_comments = $("#sel_comments").val();
	    var sel_jdbcType = $("#sel_jdbcType").val();
    	$('#dataSubList').datagrid('load',{
    		name:sel_name,
		    comments:sel_comments,
		    jdbcType:sel_jdbcType
    	});
    }
    function reloadSubData() {
    	selectSubData();
    }
    
    </script>
    
    <script type="text/javascript">
    var url;
    function newInfo(){
        cleanErrMsg();
        $('#dataForm').form('clear');
        $('#dataForm #name').textbox('readonly', false);
        $('#dataWin').window('open');
        url = '${ctx}/sys/table/saveByAdd.do';
    }
    function editInfo(){
        var row = $('#dataList').datagrid('getSelected');
        if (row){
        	cleanErrMsg();
            $('#dataForm').form('load',row);
            $('#dataForm #name').textbox('readonly', true);
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
            		loadi = layer.load(2, {shade: layerLoadShade,time: layerLoadMaxTime});
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
    <script type="text/javascript">
    var url;
    function newSubInfo(){
        cleanErrMsg();
        if(tableName==null || tableName=="") {
        	layer.msg("请选择数据表", {offset: 'rb',icon: 6,shift: 8,time: layerMsgTime});
        	return;
        }
        $('#dataSubForm').form('clear');
        $("#tableName").val(tableName);
        $('#dataSubWin').window('open');
        url = '${ctx}/sys/tableColumn/saveByAdd.do';
    }
    function editSubInfo(){
        var row = $('#dataSubList').datagrid('getSelected');
        if (row){
        	cleanErrMsg();
            $('#dataSubForm').form('load',row);
            $("#tableName").val(tableName);
            $('#dataSubWin').window('open');
            url = '${ctx}/sys/tableColumn/saveByUpdate.do?id='+row.id;
        }    	
    }
    var loadi;
    function saveSubInfo(){
        $('#dataSubForm').form('submit',{
            url: url,
            onSubmit: function(param){
            	if($(this).form('validate')) {
            		loadi = layer.load(2, {shade: layerLoadShade,time: layerLoadMaxTime});
            	}
                return $(this).form('validate');
            },
            success: function(info){
            	layer.close(loadi);
                cleanErrMsg();
            	data = eval('(' + info + ')');
                if (data.success=="<%=StringConstant.TRUE%>"){
                    layer.msg("操作成功！", {offset: 'rb',icon: 6,shift: 8,time: layerMsgTime});
            		$('#dataSubWin').window('close'); 
            		reloadSubData();
                } else {
                    layer.msg("操作失败！", {offset: 'rb',icon: 5,shift: 8,time: layerMsgTime});
                    renderErrMsg(data.message);
                }
            }
        });
    }
    function destroySubInfo(){
        var row = $('#dataSubList').datagrid('getSelected');
        if (row){
            $.messager.confirm('确认','你确定删除该记录吗？',function(r){
                if (r){
                	$.ajax({
						type: "post",
						url: '${ctx}/sys/tableColumn/delete.do',
						data: {delDataId:row.id},
						dataType: 'json',
						beforeSend: function(XMLHttpRequest){
							loadi = layer.load(2, {shade: layerLoadShade,time: layerLoadMaxTime});
						},
						success: function(data, textStatus){
							layer.close(loadi);
							if (data.success=="<%=StringConstant.TRUE%>"){
		                        layer.msg("操作成功！", {offset: 'rb',icon: 6,shift: 8,time: layerMsgTime});
								reloadSubData();
		                    } else {
			                    layer.msg("操作失败！", {offset: 'rb',icon: 5,shift: 8,time: layerMsgTime});
		                    }
						}
					});
                }
            });
        }
    }
    
    function getJdbcTypeJson() {
    	$.ajax({
			type: "post",
			url: '${ctx}/sys/dict/getDictJson.do',
			data: {category:'jdbcType'},
			dataType: 'json',
			beforeSend: function(XMLHttpRequest){
			},
			success: function(data, textStatus){
				jdbcTypeJson = data;
				$('#jdbcType').combobox('loadData', jdbcTypeJson);
			}
		});
    }
    
    function getNullableJson() {
    	$.ajax({
			type: "post",
			url: '${ctx}/sys/dict/getDictJson.do',
			data: {category:'yes_no'},
			dataType: 'json',
			beforeSend: function(XMLHttpRequest){
			},
			success: function(data, textStatus){
				nullableJson = data;
				$('#isNull').combobox('loadData', nullableJson);
				$('#isInsert').combobox('loadData', nullableJson);
				$('#isList').combobox('loadData', nullableJson);
				$('#isQuery').combobox('loadData', nullableJson);
			}
		});
    }
    
    function getEditableJson() {
    	$.ajax({
			type: "post",
			url: '${ctx}/sys/dict/getDictJson.do',
			data: {category:'yes_no_hidden'},
			dataType: 'json',
			beforeSend: function(XMLHttpRequest){
			},
			success: function(data, textStatus){
				editableJson = data;
				$('#isEdit').combobox('loadData', editableJson);
			}
		});
    }
    
    function getValidTypeJson() {
    	$.ajax({
			type: "post",
			url: '${ctx}/sys/dict/getDictJson.do',
			data: {category:'valid'},
			dataType: 'json',
			beforeSend: function(XMLHttpRequest){
			},
			success: function(data, textStatus){
				validTypeJson = data;
				$('#validType').combobox('loadData', validTypeJson);
			}
		});
    }
    
    function getCategoryJson() {
    	$.ajax({
			type: "post",
			url: '${ctx}/sys/dict/getDictJson.do',
			data: {category:'columnCategory'},
			dataType: 'json',
			beforeSend: function(XMLHttpRequest){
			},
			success: function(data, textStatus){
				categoryJson = data;
				$('#category').combobox('loadData', categoryJson);
			}
		});
    }
    </script>
  </body>
</html>
