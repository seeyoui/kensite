<#include "/custom.include">
<#assign className = table.className>
<#assign classNameLower = className?uncap_first>
<#function getFormInputHtml column>
<#assign dbtype=column.sqlTypeName?lower_case>
<#assign colname=column.columnName?lower_case>
<#assign rtn>
<#if (colname=="id"||colname=="createuser"||colname=="createdate"||colname=="updateuser"||colname=="updatedate"||colname=="remarks"||colname=="delflag") ><#else>
	<#if dbtype=="number" >
	<input id="${column.columnNameLower}" name="${column.columnNameLower}" class="easyui-numberbox" data-options="min:0,max:999999,precision:${column.decimalDigits},required:true"/>
	<#elseif (dbtype=="varchar2"||dbtype=="char")  >
	<input id="${column.columnNameLower}" name="${column.columnNameLower}" class="easyui-textbox" data-options="required:true"/>
	<#elseif (dbtype=="clob")  >
	<input id="${column.columnNameLower}" name="${column.columnNameLower}" class="easyui-textbox" data-options="required:true,multiline:true" style="height:100px"/>
	<#elseif (dbtype=="date")>
	<input id="${column.columnNameLower}" name="${column.columnNameLower}" class="easyui-textbox" data-options="required:true" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
	</#if>
</#if>
</#assign>
<#return rtn?trim>
</#function>
<#function getTableHeaderHtml column>
<#assign dbtype=column.sqlTypeName?lower_case>
<#assign colname=column.columnName?lower_case>
<#assign colcnname=column.columnAlias>
<#assign rtn>
<#if (colname=="createuser"||colname=="createdate"||colname=="updateuser"||colname=="updatedate"||colname=="remarks"||colname=="delflag") ><#elseif (colname=="id")>
<th field="${column.columnNameLower}" width="100px" hidden>${colcnname}</th>
<#else>
	<#if dbtype=="date">
	<th field="${column.columnNameLower}" width="100px" align="center">${colcnname}</th>
	<#elseif (dbtype=="number")>
	<th field="${column.columnNameLower}" width="50px" align="right">${colcnname}</th>
	<#else>
	<th field="${column.columnNameLower}" width="100px">${colcnname}</th>
	</#if>
</#if>
</#assign>
<#return rtn?trim>
</#function>
<#function getSelectPanelHtml column>
<#assign dbtype=column.sqlTypeName?lower_case>
<#assign colname=column.columnName?lower_case>
<#assign rtn>
<#if (colname=="id"||colname=="createuser"||colname=="createdate"||colname=="updateuser"||colname=="updatedate"||colname=="remarks"||colname=="delflag") ><#else>
	<#if dbtype=="number" >
	<input id="sel_${column.columnNameLower}" name="sel_${column.columnNameLower}" class="easyui-numberbox" data-options="min:0,max:999999,precision:${column.decimalDigits}"/>
	<#elseif (dbtype=="varchar2"||dbtype=="char"||dbtype=="clob")  >
	<input id="sel_${column.columnNameLower}" name="sel_${column.columnNameLower}" class="easyui-textbox" data-options=""/>
	<#elseif (dbtype=="date")>
	<input id="sel_${column.columnNameLower}" name="sel_${column.columnNameLower}" class="easyui-textbox" data-options="" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
	</#if>
</#if>
</#assign>
<#return rtn?trim>
</#function>
<#function getSelectJsVarHtml column>
<#assign dbtype=column.sqlTypeName?lower_case>
<#assign colname=column.columnName?lower_case>
<#assign rtn>
<#if (colname=="id"||colname=="createuser"||colname=="createdate"||colname=="updateuser"||colname=="updatedate"||colname=="remarks"||colname=="delflag") ><#else>
var sel_${column.columnNameLower} = $("#sel_${column.columnNameLower}").val();
</#if>
</#assign>
<#return rtn?trim>
</#function>
<#function getSelectJsParamHtml column>
<#assign dbtype=column.sqlTypeName?lower_case>
<#assign colname=column.columnName?lower_case>
<#assign rtn>
<#if (colname=="id"||colname=="createuser"||colname=="createdate"||colname=="updateuser"||colname=="updatedate"||colname=="remarks"||colname=="delflag") ><#else>
${column.columnNameLower}:sel_${column.columnNameLower}
</#if>
</#assign>
<#return rtn?trim>
</#function>
<%@ page import="com.seeyoui.kensite.common.constants.StringConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/taglib/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>${table.tableAlias}</title>
	<%@ include file="/WEB-INF/view/taglib/header.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/easyui.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/layer.jsp" %>
  </head>
  <body>
 	<div style="position:absolute;top:0px;left:0px;right:0px;bottom:0px;">
		<div style="position:absolute;top:0px;left:0px;right:0px;bottom:0px;">
		    <table id="dataList" title="${table.tableAlias}列表" class="easyui-datagrid" style="width:100%;height:100%"
		    		url="${"${"}ctx${"}"}/${moduleC}${table.classNameFirstLower}/list/data"
		            toolbar="#toolbar" pagination="true"
		            rownumbers="true" fitColumns="true" singleSelect="true">
		        <thead>
		            <tr>
		            	<#list table.columns as column>
					    ${getTableHeaderHtml(column)}
					    </#list>
		            </tr>
		        </thead>
		    </table>
		    <div id="toolbar">
		    	<shiro:hasPermission name="${moduleP}${table.classNameFirstLower}:insert">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newInfo()">新建</a>
		        </shiro:hasPermission>
		        <shiro:hasPermission name="${moduleP}${table.classNameFirstLower}:update">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editInfo()">修改</a>
		        </shiro:hasPermission>
		        <shiro:hasPermission name="${moduleP}${table.classNameFirstLower}:delete">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyInfo()">删除</a>
		        </shiro:hasPermission>
		        <shiro:hasPermission name="${moduleP}${table.classNameFirstLower}:export">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-page_excel" plain="true" onclick="exportExcel()">导出</a>
		        </shiro:hasPermission>
		        <#list table.columns as column>
			    <#if (column.columnName?lower_case=="id"||column.columnName?lower_case=="createuser"||column.columnName?lower_case=="createdate"||column.columnName?lower_case=="updateuser"||column.columnName?lower_case=="updatedate"||column.columnName?lower_case=="remarks"||column.columnName?lower_case=="delflag") ><#else>				${column.columnAlias}</#if>${getSelectPanelHtml(column)}
			    </#list>
			    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="selectData()">查询</a>
		    </div>
		    <div id="dataWin" class="easyui-window" title="${table.tableAlias}信息维护" data-options="modal:true,closed:true,iconCls:'icon-save',resizable:false" style="width:400px;height:260px;padding:10px;">
		        <div class="ftitle">${table.tableAlias}信息维护</div>
		        <form id="dataForm" method="post">
					<#list table.columns as column>
		            	<#if (column.columnName?lower_case=="id"||column.columnName?lower_case=="createuser"||column.columnName?lower_case=="createdate"||column.columnName?lower_case=="updateuser"||column.columnName?lower_case=="updatedate"||column.columnName?lower_case=="remarks"||column.columnName?lower_case=="delflag") >
		            	<#else>
							<div class="fitem">
				                <label>${column.columnAlias}</label>
				                ${getFormInputHtml(column)}
				                <span id="msg-${column.columnName?lower_case}" class="err-msg"></span>
				            </div>
						</#if>
					</#list>
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
        	<#list table.columns as column>
		    ${getSelectJsVarHtml(column)}
		    </#list>
        	$('#dataList').datagrid('load',{
        		<#list table.columns as column>
    		    ${getSelectJsParamHtml(column)}<#if (column.columnName?lower_case=="id"||column.columnName?lower_case=="createuser"||column.columnName?lower_case=="createdate"||column.columnName?lower_case=="updateuser"||column.columnName?lower_case=="updatedate"||colname=="remarks"||colname=="delflag") ><#else><#if column_has_next>,</#if></#if>
    		    </#list>
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
            url = '${"${"}ctx${"}"}/${moduleC}${table.classNameFirstLower}/save';
        }
        function editInfo(){
            var row = $('#dataList').datagrid('getSelected');
            if (row){
            	cleanErrMsg();
                $('#dataForm').form('load',row);
                $('#dataWin').window('open');
                url = '${"${"}ctx${"}"}/${moduleC}${table.classNameFirstLower}/update?id='+row.id;
            }    	
        }
        function exportExcel() {
        	window.open("${"${"}ctx${"}"}/${moduleC}${table.classNameFirstLower}/export");
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
							url: '${"${"}ctx${"}"}/${moduleC}${table.classNameFirstLower}/delete',
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
