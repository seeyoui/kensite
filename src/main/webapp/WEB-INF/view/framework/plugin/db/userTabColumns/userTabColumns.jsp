<%@ page import="com.seeyoui.kensite.common.constants.StringConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/taglib/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>UserTabColumns</title>
	<%@ include file="/WEB-INF/view/taglib/header.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/easyui.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/layer.jsp" %>
  </head>
  <body>
 	<div style="position:absolute;top:0px;left:0px;right:0px;bottom:0px;">
		<div style="position:absolute;top:0px;left:0px;right:0px;bottom:0px;">
		    <table id="dataList" title="UserTabColumns列表" class="easyui-datagrid" style="width:100%;height:100%"
		    		url="${ctx}/sys/userTabColumns/getListData.do"
		            toolbar="#toolbar" pagination="true"
		            rownumbers="true" fitColumns="true" singleSelect="true">
		        <thead>
		            <tr>
					    <th field="columnId" width="50px" align="right" hidden>顺序号</th>
					    <th field="tableName" width="100px" hidden>表名</th>
					    <th field="columnName" width="100px">列名</th>
					    <th field="dataType" width="100px" formatter="formatDataType">类型</th>
					    <th field="dataLength" width="50px" align="right" hidden>长度</th>
					    <th field="dataPrecision" width="50px" align="right" hidden>精度</th>
					    <th field="dataScale" width="50px" align="right" hidden>量级</th>
					    <th field="nullable" width="100px" formatter="formatNullable">是否可为空</th>
					    <th field="numDistinct" width="50px" align="right" hidden>numDistinct</th>
					    <th field="density" width="50px" align="right" hidden>density</th>
					    <th field="numNulls" width="50px" align="right" hidden>numNulls</th>
					    <th field="numBuckets" width="50px" align="right" hidden>numBuckets</th>
					    <th field="avgColLen" width="50px" align="right" hidden>avgColLen</th>
					    <th field="charLength" width="50px" align="right" hidden>charLength</th>
					    <th field="charUsed" width="100px" hidden>charUsed</th>
					    <th field="comments" width="100px">注释</th>
		            </tr>
		        </thead>
		    </table>
		    <div id="toolbar">
		    	<shiro:hasPermission name="sys:userTabColumns:insert">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newInfo()">新建</a>
		        </shiro:hasPermission>
		        <shiro:hasPermission name="sys:userTabColumns:update">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editInfo()">修改</a>
		        </shiro:hasPermission>
		        <shiro:hasPermission name="sys:userTabColumns:delete">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyInfo()">删除</a>
		        </shiro:hasPermission>
				表名<input id="sel_tableName" name="sel_tableName" class="easyui-textbox" data-options=""/>
				列名<input id="sel_columnName" name="sel_columnName" class="easyui-textbox" data-options=""/>
				类型<input id="sel_dataType" name="sel_dataType" class="easyui-textbox" data-options=""/>
				是否可为空<input id="sel_nullable" name="sel_nullable" class="easyui-combobox" data-options="panelHeight: 'auto',valueField: 'value',textField: 'text'"/>
				注释<input id="sel_comments" name="sel_comments" class="easyui-textbox" data-options=""/>
			    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="selectData()">查询</a>
		    </div>
	    </div>
    </div>
    <script type="text/javascript">
	    var nullableJson = [{text: '是',value: 'Y'},{text: '否',value: 'N'}];
		$(document).ready(function(){
			$('#sel_nullable').combobox('loadData', nullableJson);
	    });
	    
	    function formatDataType(val,row) {
	    	if(val==null) {
        		return "";
        	}
        	var res = val;
        	if(val == "CHAR" || val == "VARCHAR2" || val == "NVARCHAR2") {
        		res += "("+row.charLength+")";
        	} else if(val == "DATE") {
        		res += "";
        	} else if(val == "NUMBER") {
        		if(row.dataScale != 0 && row.dataPrecision != "") {
        			res += "("+row.dataPrecision+","+row.dataScale+")";
        		} else if(row.dataPrecision != "") {
        			res += "("+row.dataPrecision+")";
        		}
        	}
        	return res;
	    }
	    
	    function formatNullable(val,row) {
	    	if(nullableJson == null) {
	    		return "";
	    	}
	    	for(var obj in nullableJson) {
	    		if(nullableJson[obj].value == val) {
	    			return nullableJson[obj].text;
	    		}
	    	}
	    }
	    
	    function selectData() {
		    var sel_tableName = $("#sel_tableName").val();
		    var sel_columnName = $("#sel_columnName").val();
		    var sel_dataType = $("#sel_dataType").val();
		    var sel_nullable = $("#sel_nullable").combobox('getValue');
		    var sel_comments = $("#sel_comments").val();
        	$('#dataList').datagrid('load',{
    		    tableName:sel_tableName,
    		    columnName:sel_columnName,
    		    dataType:sel_dataType,
    		    nullable:sel_nullable,
    		    comments:sel_comments
        	});
        }
	    function reloadData() {
        	selectData();
        }
	    
    </script>
  </body>
</html>
