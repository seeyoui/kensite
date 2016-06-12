<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/taglib/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>团队</title>
	<%@ include file="/WEB-INF/view/taglib/header.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/easyui.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/layer.jsp" %>
  </head>
  <body>
 	<div style="position:absolute;top:0px;left:0px;right:0px;bottom:0px;">
		<div style="position:absolute;top:0px;left:0px;width:500px;bottom:0px;">
		    <table id="dataList" title="团队列表" class="easyui-datagrid" style="width:100%;height:100%"
		    		url="${ctx}/planManage/planTeam/list/data"
		            toolbar="#toolbar" pagination="true"
		            rownumbers="true" fitColumns="true" singleSelect="true">
		        <thead>
		            <tr>
					    <th data-options="field:'id',hidden:true">ID</th>
				    	<ks:listTag table="PLAN_TEAM" column="REMARKS"/>
				    	<ks:listTag table="PLAN_TEAM" column="NAME"/>
				    	<ks:listTag table="PLAN_TEAM" column="DESCRIBE"/>
						<th field="leaguerCou" width="100px">团队人数</th>
		            </tr>
		        </thead>
		    </table>
		    <div id="toolbar">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="$.planTeam.newInfo()">新建</a>
		    	<shiro:hasPermission name="planManage:planTeam:insert">
		        </shiro:hasPermission>
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="$.planTeam.editInfo()">修改</a>
		        <shiro:hasPermission name="planManage:planTeam:update">
		        </shiro:hasPermission>
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="$.planTeam.destroyInfo()">删除</a>
		        <shiro:hasPermission name="planManage:planTeam:delete">
		        </shiro:hasPermission>
		    	<ks:queryTag table="PLAN_TEAM" column="REMARKS"/>
		    	<ks:queryTag table="PLAN_TEAM" column="NAME"/>
		    	<ks:queryTag table="PLAN_TEAM" column="DESCRIBE"/>
			    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="$.planTeam.selectData()">查询</a>
		    </div>
	    </div>
	    <div style="position:absolute;top:0px;left:500px;right:0px;bottom:0px;">
		    <table id="dataList1" title="团队成员列表" class="easyui-datagrid" style="width:100%;height:100%"
		    		url="${ctx}/planManage/planTeamLeaguer/list/data"
		            toolbar="#toolbar1" pagination="true"
		            rownumbers="true" fitColumns="true" singleSelect="true">
		        <thead>
		            <tr>
					    <th data-options="field:'id',hidden:true">ID</th>
				    	<ks:listTag table="PLAN_TEAM_LEAGUER" column="REMARKS"/>
				    	<ks:listTag table="PLAN_TEAM_LEAGUER" column="TEAM_ID"/>
				    	<ks:listTag table="PLAN_TEAM_LEAGUER" column="USER_ID"/>
		            </tr>
		        </thead>
		    </table>
		    <div id="toolbar1">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="$.planTeamLeaguer.newInfo()">新建</a>
		    	<shiro:hasPermission name="planManage:planTeamLeaguer:insert">
		        </shiro:hasPermission>
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="$.planTeamLeaguer.destroyInfo()">删除</a>
		        <shiro:hasPermission name="planManage:planTeamLeaguer:delete">
		        </shiro:hasPermission>
		    	<input id="sel_teamId" name="sel_teamId" type="hidden"/>
		    </div>
	    </div>
    </div>
    <script type="text/javascript">
    	var teamId;
	    $(document).ready(function(){
	    	$('#dataList').datagrid({
	    		onDblClickRow: function(index,row){
	    			$('#sel_teamId').val(row.id);
	    			teamId = row.id;
	    			$.planTeamLeaguer.selectData();
	    		}
	    	});
	    });
        var url, loadi;
        var iframeWin = null, iframeBody=null;
        $.planTeam = {
       		selectData : function () {
	        	$('#dataList').datagrid('load',{
			    	<ks:queryJsTag table="PLAN_TEAM" column="REMARKS"/>
			    	<ks:queryJsTag table="PLAN_TEAM" column="NAME"/>
			    	<ks:queryJsTag table="PLAN_TEAM" column="DESCRIBE"/>
	        	});
	        },
        	reloadData : function () {
        		$.planTeam.selectData();
        		$.planTeamLeaguer.selectData();
	        },
	        newInfo : function (){
	        	$('#dataList').datagrid('clearSelections');
	        	$.planTeam.layerOpen(url);
	        },
	        editInfo : function (){
	            var row = $('#dataList').datagrid('getSelected');
	            //var row = $('#dataList').datagrid('getSelections');
	            if (row){
	            	//if(row.length != 1) {
	            		//layer.msg("只能选择一条记录修改！", {offset: 'rb',icon: 5,shift: 8,time: layerMsgTime});
	            	//} else {
		            $.planTeam.layerOpen(url);
	            	//}
	            } else {
					layer.msg("请先选择要修改的记录！", {offset: 'rb',icon: 5,shift: 8,time: layerMsgTime});
				}
	        },
	        exportExcel : function () {
	        	window.open("${ctx}/planManage/planTeam/export");
	        },
	        layerOpen : function (url) {
	            url = '${ctx}/planManage/planTeam/form';
	        	layer.open({
	        	    type: 2,
	        	    title: '团队基本信息',
	        	    area: ['310px', '350px'],
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
	        },
	        destroyInfo : function (){
	            var row = $('#dataList').datagrid('getSelected');
	            //var row = $('#dataList').datagrid('getSelections');
	            if (row){
	            	layer.confirm('是否确认删除？', {
	            	    btn: ['确定','取消'] //按钮
	            	}, function(){
	            		$.ajax({
							type: "post",
							url: '${ctx}/planManage/planTeam/delete',
							data: {id:row.id},
							dataType: 'json',
							timeout: layerLoadMaxTime,
							beforeSend: function(XMLHttpRequest){
								loadi = layer.load(2, {shade: layerLoadShade,time: layerLoadMaxTime});
							},
							success: function(data, textStatus){
								layer.close(loadi);
								if (data.success==TRUE){
			                        layer.msg("操作成功！", {offset: 'rb',icon: 6,shift: 8,time: layerMsgTime});
			                        $.planTeam.reloadData();
			                    } else {
				                    layer.msg("操作失败！", {offset: 'rb',icon: 5,shift: 8,time: layerMsgTime});
			                    }
							},
							error: function(request, errType) {
								layer.close(loadi);
								//"timeout", "error", "notmodified" 和 "parsererror"
								if(errType == 'timeout') {
									layer.msg('请求超时', {offset: 'rb',icon: 6,shift: 8,time: layerMsgTime});
								}
								if(errType == 'error') {
									layer.msg('系统错误，请联系管理员', {offset: 'rb',icon: 6,shift: 8,time: layerMsgTime});
								}
							}
						});
	            	}, function(){
	            	});
	            } else {
					layer.msg("请先选择要删除的记录！", {offset: 'rb',icon: 5,shift: 8,time: layerMsgTime});
				}
	        }
        }
    </script>
    <script type="text/javascript">
	    $(document).ready(function(){
	    });
        var url, loadi;
        var iframeWin = null, iframeBody=null;
        $.planTeamLeaguer = {
       		selectData : function () {
	        	$('#dataList1').datagrid('load',{
			    	teamId : $('#sel_teamId').val()
	        	});
	        },
        	reloadData : function () {
        		$.planTeam.selectData();
        		$.planTeamLeaguer.selectData();
	        },
	        newInfo : function (){
	        	if(teamId == null || teamId == '') {
	        		layer.msg("请先选择团队！", {offset: 'rb',icon: 5,shift: 8,time: layerMsgTime});
	        		return;
	        	}
	        	$('#dataList1').datagrid('clearSelections');
	        	$.planTeamLeaguer.layerOpen(url);
	        },
	        editInfo : function (){
	            var row = $('#dataList1').datagrid('getSelected');
	            //var row = $('#dataList1').datagrid('getSelections');
	            if (row){
	            	//if(row.length != 1) {
	            		//layer.msg("只能选择一条记录修改！", {offset: 'rb',icon: 5,shift: 8,time: layerMsgTime});
	            	//} else {
		            $.planTeamLeaguer.layerOpen(url);
	            	//}
	            } else {
					layer.msg("请先选择要修改的记录！", {offset: 'rb',icon: 5,shift: 8,time: layerMsgTime});
				}
	        },
	        exportExcel : function () {
	        	window.open("${ctx}/planManage/planTeamLeaguer/export");
	        },
	        layerOpen : function (url) {
	            url = '${ctx}/planManage/planTeamLeaguer/form';
	        	layer.open({
	        	    type: 2,
	        	    title: '团队成员基本信息',
	        	    area: ['310px', '350px'],
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
	        },
	        destroyInfo : function (){
	            var row = $('#dataList1').datagrid('getSelected');
	            //var row = $('#dataList1').datagrid('getSelections');
	            if (row){
	            	layer.confirm('是否确认删除？', {
	            	    btn: ['确定','取消'] //按钮
	            	}, function(){
	            		$.ajax({
							type: "post",
							url: '${ctx}/planManage/planTeamLeaguer/delete',
							data: {id:row.id},
							dataType: 'json',
							timeout: layerLoadMaxTime,
							beforeSend: function(XMLHttpRequest){
								loadi = layer.load(2, {shade: layerLoadShade,time: layerLoadMaxTime});
							},
							success: function(data, textStatus){
								layer.close(loadi);
								if (data.success==TRUE){
			                        layer.msg("操作成功！", {offset: 'rb',icon: 6,shift: 8,time: layerMsgTime});
			                        $.planTeamLeaguer.reloadData();
			                    } else {
				                    layer.msg("操作失败！", {offset: 'rb',icon: 5,shift: 8,time: layerMsgTime});
			                    }
							},
							error: function(request, errType) {
								layer.close(loadi);
								//"timeout", "error", "notmodified" 和 "parsererror"
								if(errType == 'timeout') {
									layer.msg('请求超时', {offset: 'rb',icon: 6,shift: 8,time: layerMsgTime});
								}
								if(errType == 'error') {
									layer.msg('系统错误，请联系管理员', {offset: 'rb',icon: 6,shift: 8,time: layerMsgTime});
								}
							}
						});
	            	}, function(){
	            	});
	            } else {
					layer.msg("请先选择要删除的记录！", {offset: 'rb',icon: 5,shift: 8,time: layerMsgTime});
				}
	        }
        }
    </script>
  </body>
</html>
