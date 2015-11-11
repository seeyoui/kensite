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
					    <th data-options="field:'id',hidden:true">ID</th>
				    	<ks:listTag table="T_TEST_W" column="NAME"/>
				    	<ks:listTag table="T_TEST_W" column="BIRTHDAY"/>
				    	<ks:listTag table="T_TEST_W" column="SEX"/>
				    	<ks:listTag table="T_TEST_W" column="DESCRIBE"/>
				    	<ks:listTag table="T_TEST_W" column="ISDEL"/>
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
		        <shiro:hasPermission name="demo:testW:export">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-page_excel" plain="true" onclick="exportExcel()">导出</a>
		        </shiro:hasPermission>
		    	<ks:queryTag table="T_TEST_W" column="NAME"/>
		    	<ks:queryTag table="T_TEST_W" column="BIRTHDAY"/>
		    	<ks:queryTag table="T_TEST_W" column="SEX"/>
		    	<ks:queryTag table="T_TEST_W" column="DESCRIBE"/>
		    	<ks:queryTag table="T_TEST_W" column="ISDEL"/>
			    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="selectData()">查询</a>
		    </div>
	    </div>
    </div>
    <script type="text/javascript">
	    $(document).ready(function(){
	    });
	    
	    function selectData() {
        	$('#dataList').datagrid('load',{
		    	<ks:queryJsTag table="T_TEST_W" column="NAME"/>,
		    	<ks:queryJsTag table="T_TEST_W" column="BIRTHDAY"/>,
		    	<ks:queryJsTag table="T_TEST_W" column="SEX"/>,
		    	<ks:queryJsTag table="T_TEST_W" column="DESCRIBE"/>,
		    	<ks:queryJsTag table="T_TEST_W" column="ISDEL"/>
        	});
        }
	    function reloadData() {
        	selectData();
        }
	    
        var url;
        function newInfo(){
        	$('#dataList').datagrid('clearSelections');
            layerOpen(url);
        }
        function editInfo(){
            var row = $('#dataList').datagrid('getSelected');
            if (row){
                 layerOpen(url);
            }    	
        }
        function exportExcel() {
        	window.open("${ctx}/demo/testW/export");
        }
        function layerOpen(url) {
            url = '${ctx}/demo/testW/form';
        	layer.open({
        	    type: 2,
        	    title: '测试1基本信息',
        	    area: ['400px', '350px'],
        	    fix: false, //不固定
        	    maxmin: false,
        	    content: url
        	});
        }
        var loadi;
        function destroyInfo(){
            var row = $('#dataList').datagrid('getSelected');
            if (row){
            	layer.confirm('是否确认删除？', {
            	    btn: ['确定','取消'] //按钮
            	}, function(){
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
    </script>
  </body>
</html>
