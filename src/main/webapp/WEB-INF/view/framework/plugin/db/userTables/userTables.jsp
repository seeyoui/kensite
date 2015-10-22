<%@ page import="com.seeyoui.kensite.common.constants.StringConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/taglib/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>系统数据字典</title>
	<%@ include file="/WEB-INF/view/taglib/header.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/easyui.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/layer.jsp" %>
  </head>
  <body>
 	<div style="position:absolute;top:0px;left:0px;right:0px;bottom:0px;">
		<div style="position:absolute;top:0px;left:0px;right:0px;bottom:0px;">
		    <table id="dataList" title="系统数据字典列表" class="easyui-datagrid" style="width:100%;height:100%"
		    		url="${ctx}/sys/userTables/getListData.do"
		            toolbar="#toolbar" pagination="true"
		            rownumbers="true" fitColumns="true" singleSelect="true">
		        <thead>
		            <tr>
					    <th field="tableName" width="100px">表名</th>
					    <th field="tableType" width="100px" formatter="formatTypeCol">类型</th>
					    <th field="comments" width="100px">注释</th>
					    <th field="tablespaceName" width="100px">表空间</th>
					    <th field="numRows" width="50px" align="right">记录数</th>
		            </tr>
		        </thead>
		    </table>
		    <div id="toolbar">
		    	<shiro:hasPermission name="sys:userTables:insert">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newInfo()">新建</a>
		        </shiro:hasPermission>
		        <shiro:hasPermission name="sys:userTables:update">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editInfo()">修改</a>
		        </shiro:hasPermission>
		        <shiro:hasPermission name="sys:userTables:delete">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyInfo()">删除</a>
		        </shiro:hasPermission>
				表名<input id="sel_tableName" name="sel_tableName" class="easyui-textbox" data-options=""/>
				类型<input id="sel_tableType" name="sel_tableType"  class="easyui-combobox" data-options="panelHeight: 'auto',valueField: 'value',textField: 'text'"/>
				注释<input id="sel_comments" name="sel_comments" class="easyui-textbox" data-options=""/>
				表空间<input id="sel_tablespaceName" name="sel_tablespaceName" class="easyui-textbox" data-options=""/>
			    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="selectData()">查询</a>
		    </div>
	    </div>
    </div>
    <script type="text/javascript">
    	var typeJson = [{text: '数据表',value: 'TABLE'	},{text: '数据视图',value: 'VIEW'}];
	    $(document).ready(function(){
			$('#sel_tableType').combobox('loadData', typeJson);
	    });
	    
	    function selectData() {
		    var sel_tableName = $("#sel_tableName").val();
		    var sel_tablespaceName = $("#sel_tablespaceName").val();
		    var sel_tableType = $("#sel_tableType").combobox('getValue');
		    var sel_comments = $("#sel_comments").val();
        	$('#dataList').datagrid('load',{
    		    tableName:sel_tableName,
    		    tablespaceName:sel_tablespaceName,
    		    tableType:sel_tableType,
    		    comments:sel_comments
        	});
        }
	    function reloadData() {
        	selectData();
        }
	    
	    function formatTypeCol(val, row) {
	    	if(val == null) {
	    		return "";
	    	}
	    	var typeStr = "";
	    	for(var obj in typeJson) {
	    		if(val.indexOf(typeJson[obj].value) != -1) {
	    			typeStr = typeJson[obj].text;
	    		}
	    	}
			return typeStr;
	    }
	    
    </script>
  </body>
</html>
