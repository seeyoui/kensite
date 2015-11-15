<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/taglib/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>构造演示界面</title>
	<%@ include file="/WEB-INF/view/taglib/header.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/easyui.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/layer.jsp" %>
  </head>
  <body>
 	<div style="position:absolute;top:0px;left:0px;right:0px;bottom:0px;">
		<div style="position:absolute;top:0px;left:0px;right:0px;bottom:0px;">
		    <table id="dataList" title="构造演示界面列表" class="easyui-datagrid" style="width:100%;height:100%"
		    		url="${ctx}/demo/demo/list/data"
		            toolbar="#toolbar" pagination="true"
		            rownumbers="true" fitColumns="true" singleSelect="true">
		        <thead>
		            <tr>
					    <th data-options="field:'id',hidden:true">ID</th>
				    	<ks:listTag table="T_DEMO" column="A"/>
				    	<ks:listTag table="T_DEMO" column="B"/>
				    	<ks:listTag table="T_DEMO" column="C"/>
				    	<ks:listTag table="T_DEMO" column="D"/>
				    	<ks:listTag table="T_DEMO" column="E"/>
				    	<ks:listTag table="T_DEMO" column="F"/>
				    	<ks:listTag table="T_DEMO" column="G"/>
				    	<ks:listTag table="T_DEMO" column="H"/>
				    	<ks:listTag table="T_DEMO" column="I"/>
				    	<ks:listTag table="T_DEMO" column="J"/>
				    	<ks:listTag table="T_DEMO" column="K"/>
		            </tr>
		        </thead>
		    </table>
		    <div id="toolbar">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newInfo()">新建</a>
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editInfo()">修改</a>
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyInfo()">删除</a>
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-page_excel" plain="true" onclick="exportExcel()">导出</a>
		    	<ks:queryTag table="T_DEMO" column="A"/>
		    	<ks:queryTag table="T_DEMO" column="B"/>
		    	<ks:queryTag table="T_DEMO" column="C"/>
		    	<ks:queryTag table="T_DEMO" column="D"/>
		    	<ks:queryTag table="T_DEMO" column="E"/>
		    	<ks:queryTag table="T_DEMO" column="F"/>
		    	<ks:queryTag table="T_DEMO" column="G"/>
		    	<ks:queryTag table="T_DEMO" column="H"/>
		    	<ks:queryTag table="T_DEMO" column="I"/>
		    	<ks:queryTag table="T_DEMO" column="J"/>
		    	<ks:queryTag table="T_DEMO" column="K"/>
			    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="selectData()">查询</a>
		    </div>
	    </div>
    </div>
    <script type="text/javascript">
	    $(document).ready(function(){
	    });
	    
	    function selectData() {
        	$('#dataList').datagrid('load',{
		    	<ks:queryJsTag table="T_DEMO" column="A"/>
		    	<ks:queryJsTag table="T_DEMO" column="B"/>
		    	<ks:queryJsTag table="T_DEMO" column="C"/>
		    	<ks:queryJsTag table="T_DEMO" column="D"/>
		    	<ks:queryJsTag table="T_DEMO" column="E"/>
		    	<ks:queryJsTag table="T_DEMO" column="F"/>
		    	<ks:queryJsTag table="T_DEMO" column="G"/>
		    	<ks:queryJsTag table="T_DEMO" column="H"/>
		    	<ks:queryJsTag table="T_DEMO" column="I"/>
		    	<ks:queryJsTag table="T_DEMO" column="J"/>
		    	<ks:queryJsTag table="T_DEMO" column="K"/>
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
        	window.open("${ctx}/demo/demo/export");
        }
        var iframeWin = null, iframeBody=null;
        function layerOpen(url) {
            url = '${ctx}/demo/demo/form';
        	layer.open({
        	    type: 2,
        	    title: '构造演示界面基本信息',
        	    area: ['300px', '350px'],
        	    fix: false, //不固定
        	    maxmin: false,
        	    content: url,
        	    btn: ['保存', '取消'],
	            success: function(layero, index){
	                iframeBody = layer.getChildFrame('body', index);
	                iframeWin = window[layero.find('iframe')[0]['name']];
	            },
        	    yes: function(index, layero) {
        	    	if(iframeWin != null) {
        	    		iframeWin.submitInfo();
        	    	}
        	    },
        	    cancel: function(index){
        	    	layer.close(index);
        	    }
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
						url: '${ctx}/demo/demo/delete',
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
