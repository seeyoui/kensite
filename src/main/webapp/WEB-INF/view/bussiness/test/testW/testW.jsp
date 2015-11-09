<%@ page import="com.seeyoui.kensite.common.constants.StringConstant"%>
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
	<%@ include file="/WEB-INF/view/taglib/uedit.jsp" %>
  </head>
  <body>
 	<div style="position:absolute;top:0px;left:0px;right:0px;bottom:0px;">
		<div style="position:absolute;top:0px;left:0px;right:0px;bottom:0px;">
		    <table id="dataList" title="测试1列表" class="easyui-datagrid" style="width:100%;height:100%"
		    		url="${ctx}/test/testW/getListData.do"
		            toolbar="#toolbar" pagination="true"
		            rownumbers="true" fitColumns="true" singleSelect="true">
		        <thead>
		            <tr>
					    <th field="id" width="100px" hidden>主键</th>
					    <th field="name" width="100px">姓名</th>
					    <th field="birthday" width="100px" formatter="formatDateTimeCol">出生日期</th>
					    <th field="sex" width="100px">性别</th>
					    <th field="describe" width="100px">简历</th>
					    <th field="isdel" width="100px">是否屏蔽</th>
		            </tr>
		        </thead>
		    </table>
		    <div id="toolbar">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newInfo()">新建</a>
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editInfo()">修改</a>
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyInfo()">删除</a>
				姓名<input id="sel_name" name="sel_name" class="easyui-textbox" data-options=""/>
				出生日期<input id="sel_birthday" name="sel_birthday" class="easyui-textbox" data-options="" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
				性别<input id="sel_sex" name="sel_sex" class="easyui-textbox" data-options=""/>
				简历<input id="sel_describe" name="sel_describe" class="easyui-textbox" data-options=""/>
				是否屏蔽<input id="sel_isdel" name="sel_isdel" class="easyui-textbox" data-options=""/>
			    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="selectData()">查询</a>
		    </div>
	    </div>
    </div>
    <script type="text/javascript">
	    $(document).ready(function(){
	    });
	    
	    function selectData() {
		    var sel_name = $("#sel_name").val();
		    var sel_birthday = $("#sel_birthday").val();
		    var sel_sex = $("#sel_sex").val();
		    var sel_describe = $("#sel_describe").val();
		    var sel_isdel = $("#sel_isdel").val();
        	$('#dataList').datagrid('load',{
    		    name:sel_name,
    		    birthday:sel_birthday,
    		    sex:sel_sex,
    		    describe:sel_describe,
    		    isdel:sel_isdel
        	});
        }
	    function reloadData() {
        	selectData();
        }
	    
        var url;
        function newInfo(){
        	url = '${ctx}/test/testW/form.do';
            layerOpen(url);
        }
        function editInfo(){
            var row = $('#dataList').datagrid('getSelected');
            if (row){
                url = '${ctx}/test/testW/form.do?id='+row.id;
                layerOpen(url);
            }    	
        }
        function layerOpen(url) {
        	layer.open({
        	    type: 2,
        	    title: '基本信息',
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
                $.messager.confirm('确认','你确定删除该记录吗？',function(r){
                    if (r){
                    	$.ajax({
							type: "post",
							url: '${ctx}/test/testW/delete.do',
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