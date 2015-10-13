<%@ page import="com.seeyoui.kensite.common.constants.StringConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/taglib/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>评论</title>
	<%@ include file="/WEB-INF/view/taglib/header.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/easyui.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/layer.jsp" %>
  </head>
  <body>
 	<div style="position:absolute;top:0px;left:0px;right:0px;bottom:0px;">
		<div style="position:absolute;top:0px;left:0px;right:0px;bottom:0px;">
		    <table id="dataList" title="评论列表" class="easyui-datagrid" style="width:100%;height:100%"
		    		url="${ctx}/cms/comment/getListData.do"
		            toolbar="#toolbar" pagination="true"
		            rownumbers="true" fitColumns="true" singleSelect="true">
		        <thead>
		            <tr>
					    <th field="id" width="100px" hidden>编号</th>
					    <th field="categoryId" width="100px" hidden>栏目编号</th>
					    <th field="contentId" width="100px" hidden>内容编号</th>
					    <th field="score" width="50px" align="right" formatter="formatRank">评论等级</th>
					    <th field="content" width="100px">评论内容</th>
					    <th field="name" width="100px">评论姓名</th>
					    <th field="ip" width="100px">评论IP</th>
					    <th field="auditUserId" width="100px" hidden>审核人</th>
					    <th field="auditDate" width="100px" formatter="formatDateTimeCol">审核时间</th>
					    <th field="delFlag" width="100px" formatter="formatStatus">审核状态</th>
		            </tr>
		        </thead>
		    </table>
		    <div id="toolbar">
		    	<%-- <shiro:hasPermission name="cms:comment:insert">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newInfo()">新建</a>
		        </shiro:hasPermission> --%>
		        <shiro:hasPermission name="cms:comment:update">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-comment_play" plain="true" onclick="passInfo(1)">审核通过</a>
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-comment_delete" plain="true" onclick="passInfo(0)">屏蔽</a>
		        </shiro:hasPermission>
		        <shiro:hasPermission name="cms:comment:delete">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyInfo()">删除</a>
		        </shiro:hasPermission>

				栏目编号<input id="sel_categoryId" name="sel_categoryId" class="easyui-textbox" data-options=""/>
				评论等级<input id="sel_score" name="sel_score" class="easyui-combobox" data-options="panelHeight:'auto',valueField: 'value',textField: 'label',data: [{label: '一星',value: '1'},{label: '二星',value: '2'},{label: '三星',value: '3'},{label: '四星',value: '4'},{label: '五星',value: '5'}]" />
			    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="selectData()">查询</a>
		    </div>
	    </div>
    </div>
    <script type="text/javascript">
	    $(document).ready(function(){
	    });

	    function formatStatus(value, row, index){
			if (value == "1"){
				return "审核通过";
			} else {
				return "已屏蔽";
			}
		}
        
        function formatRank(val,row){
        	if(val==null) {
        		return "";
        	}
        	var res = "";
        	for(var i=1; i<=val; i++) {
        		res += "<img src='${ctx_common}/img/icon/colorful/1/12628.png' style='width: 20px;height: 20px;'/>";
        	}
        	return res;
	    }
	    
	    function selectData() {
		    var sel_categoryId = $("#sel_categoryId").val();
		    var sel_score = $("#sel_score").combobox('getValue');
        	$('#dataList').datagrid('load',{
    		    categoryId:sel_categoryId,
    		    score:sel_score
        	});
        }
	    function reloadData() {
        	selectData();
        }
	    
	    function getCurrentDate() {
	    	var d = new Date();
			var year = d.getFullYear();
			var month = d.getMonth() + 1;
			var day = d.getDate();
	    	if(month.length == 1) {
	    		month = "0"+month;
	    	}
	    	if(day.length == 1) {
	    		day = "0"+day;
	    	}
	    	return year+"-"+month+"-"+day;
	    }
	    
	    function passInfo(flag){
            var row = $('#dataList').datagrid('getSelected');
            if (row){
                $.messager.confirm('确认','你确定审核通过该记录吗？',function(r){
                    if (r){
                    	$.ajax({
							type: "post",
							url: '${ctx}/cms/comment/saveByUpdate.do',
							data: {id:row.id,auditUserId:'${currentUser.id}',auditDate:getCurrentDate(),delFlag:flag},
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

        function destroyInfo(){
            var row = $('#dataList').datagrid('getSelected');
            if (row){
                $.messager.confirm('确认','你确定删除该记录吗？',function(r){
                    if (r){
                    	$.ajax({
							type: "post",
							url: '${ctx}/cms/comment/delete.do',
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
