<%@ page import="com.seeyoui.kensite.common.constants.StringConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/taglib/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>    
    <title>导航菜单</title>
    <link rel="stylesheet" href="${ctx_assets}/css/fonts/linecons/css/linecons.css"/>
	<script type="text/javascript" src="${ctx_assets}/js/jquery-1.11.1.min.js"></script>
	<%@ include file="/WEB-INF/view/taglib/easyui.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/layer.jsp" %>
  </head>
  <body>
  
  	<div style="position:absolute;top:0px;left:0px;right:0px;bottom:0px;">
  		<div style="position:absolute;top:0px;bottom:0px;width:200px;">
        	<ul id="menuTree" class="easyui-tree" url="${ctx}/sysMenu/getTreeJson.do"></ul>
        </div>
        <div style="position:absolute;top:0px;left:200px;right:0px;bottom:0px;">
		    <table id="dataList" title="" class="easyui-datagrid" style="width:100%;height:100%"
		    		url="${ctx}/sysMenu/getListData.do"
		            toolbar="#toolbar" pagination="true"
		            rownumbers="true" fitColumns="true" singleSelect="true">
		        <thead>
		            <tr>
					    <th field="id" width="100px" hidden>主键</th>
					    <th field="parentid" width="100px" hidden>外键</th>
					    <th field="name" width="100px">名称</th>
					    <th field="url" width="100px">URL</th>
					    <th field="sequence" width="50px" align="right">排序</th>
					    <th field="icon" width="100px">图标</th>
					    <th field="target" width="100px">打开方式</th>
		            </tr>
		        </thead>
		    </table>
		    <div id="toolbar">
		    	<shiro:hasPermission name="sysMenu:insert">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newInfo()">新建</a>
		        </shiro:hasPermission>
		        <shiro:hasPermission name="sysMenu:update">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editInfo()">修改</a>
		        </shiro:hasPermission>
		        <shiro:hasPermission name="sysMenu:delete">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyInfo()">删除</a>
		        </shiro:hasPermission>
				<input id="sel_parentid" name="sel_parentid" type="hidden" value="<%=StringConstant.ROOT_ID_32%>"/>
				名称<input id="sel_name" name="sel_name" class="easyui-textbox" data-options=""/>
				URL<input id="sel_url" name="sel_url" class="easyui-textbox" data-options=""/>
			    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="selectData()">查询</a>
		    </div>
		    <div id="dataWin" class="easyui-window" title="导航菜单信息维护" data-options="modal:true,closed:true,iconCls:'icon-save',resizable:false" style="width:400px;height:320px;padding:10px;">
		        <div class="ftitle">导航菜单信息维护</div>
		        <form id="dataForm" method="post">
							<div class="fitem">
				                <label>名称</label>
				                <input id="name" name="name" class="easyui-validatebox textbox" data-options="required:true"/>
				            </div>
				            <div class="fitem">
				                <label>上级菜单</label>
				                <input id="parentid" name="parentid" class="easyui-combotree" data-options="required:true" url="${ctx}/sysMenu/getTreeJson.do"/>
				            </div>
							<div class="fitem">
				                <label>URL</label>
				                <input id="url" name="url" class="easyui-validatebox textbox" data-options="required:true"/>
				            </div>
							<div class="fitem">
				                <label>排序</label>
				                <input id="sequence" name="sequence" class="easyui-numberbox" data-options="min:0,max:999999,precision:0,required:true"/>
				            </div>
							<div class="fitem">
				                <label>打开方式</label>
				                <input id="target" name="target" class="easyui-validatebox textbox" data-options="required:true" value="_blank"/>
				            </div>
							<div class="fitem">
				                <label>图标</label>
				                <input id="icon" name="icon" class="easyui-validatebox textbox" data-options="required:true"/>
				            </div>
				            <div id="icon_li" class="fitem">
				            	<i class="linecons-music"></i>
								<i class="linecons-search"></i>
								<i class="linecons-mail"></i>
								<i class="linecons-heart"></i>
								<i class="linecons-star"></i>
								<i class="linecons-user"></i>
								<i class="linecons-videocam"></i>
								<i class="linecons-camera"></i>
								<i class="linecons-photo"></i>
								<i class="linecons-attach"></i>
								<i class="linecons-lock"></i>
								<i class="linecons-eye"></i>
								<i class="linecons-tag"></i>
								<i class="linecons-thumbs-up"></i>
								<i class="linecons-pencil"></i>
								<i class="linecons-comment"></i>
								<i class="linecons-location"></i>
								<i class="linecons-cup"></i>
								<i class="linecons-trash"></i>
								<i class="linecons-doc"></i>
								<i class="linecons-note"></i>
								<i class="linecons-cog"></i>
								<i class="linecons-params"></i>
								<i class="linecons-calendar"></i>
								<i class="linecons-sound"></i>
								<i class="linecons-clock"></i>
								<i class="linecons-lightbulb"></i>
								<i class="linecons-tv"></i>
								<i class="linecons-desktop"></i>
								<i class="linecons-mobile"></i>
								<i class="linecons-cd"></i>
								<i class="linecons-inbox"></i>
								<i class="linecons-globe"></i>
								<i class="linecons-cloud"></i>
								<i class="linecons-paper-plane"></i>
								<i class="linecons-fire"></i>
								<i class="linecons-graduation-cap"></i>
								<i class="linecons-megaphone"></i>
								<i class="linecons-database"></i>
								<i class="linecons-key"></i>
								<i class="linecons-beaker"></i>
								<i class="linecons-truck"></i>
								<i class="linecons-money"></i>
								<i class="linecons-food"></i>
								<i class="linecons-shop"></i>
								<i class="linecons-diamond"></i>
								<i class="linecons-t-shirt"></i>
								<i class="linecons-wallet"></i>
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
	    	$("#menuTree").tree({
	    		onClick: function(node){
	    			$('#sel_parentid').val(node.id);
	    			selectData();
	    		}
	    	});
	    	$("#icon_li i").click(function(){
	    		var obj = $(this);
	    		$("#icon").val(obj.attr("class"));
	    	});
	    });
	    
	    function selectData() {
		    var sel_parentid = $("#sel_parentid").val();
		    var sel_name = $("#sel_name").val();
		    var sel_url = $("#sel_url").val();
        	$('#dataList').datagrid('load',{
        		parentid:sel_parentid,
    		    name:sel_name,
    		    url:sel_url
        	});
        }
        
        function reloadData() {
        	selectData();
        	$('#menuTree').tree('reload');
        	$('#parentid').combotree('reload');
        }
	    
        var url;
        function newInfo(){
            $('#dataWin').window('open');
            $('#dataForm').form('clear');
            url = '${ctx}/sysMenu/saveByAdd.do';
        }
        function editInfo(){
            var row = $('#dataList').datagrid('getSelected');
            if (row){
                $('#dataWin').window('open');
                $('#dataForm').form('load',row);
                url = '${ctx}/sysMenu/saveByUpdate.do?id='+row.id;
            }    	
        }
        var loadi;
        function saveInfo(){
            $('#dataForm').form('submit',{
                url: url,
                onSubmit: function(param){
                	if($(this).form('validate')) {
                		loadi = layer.load('正在保存，请稍后...');
                	}
                    return $(this).form('validate');
                },
                success: function(info){
                    if (info=="<%=StringConstant.TRUE%>"){
                        layer.msg("操作成功！", 2, -1);
                    } else {
	                    layer.msg("操作失败！", 2, -1);
                    }
                	layer.close(loadi);
                	$('#dataWin').window('close'); 
                	reloadData();
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
							url: "${ctx}/sysMenu/delete.do",
							data: {delDataId:row.id},
							dataType: 'text',
							beforeSend: function(XMLHttpRequest){
								loadi = layer.load('正在处理，请稍后...');
							},
							success: function(data, textStatus){
								if (data=="<%=StringConstant.TRUE%>"){
			                        layer.msg("操作成功！", 2, -1);
			                    } else {
				                    layer.msg("操作失败！", 2, -1);
			                    }
			                    layer.close(loadi);
								reloadData();
							}
						});
                    }
                });
            }
        }
    </script>
  </body>
</html>
