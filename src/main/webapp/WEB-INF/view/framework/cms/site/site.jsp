<%@ page import="com.seeyoui.kensite.common.constants.StringConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/taglib/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>站点</title>
	<%@ include file="/WEB-INF/view/taglib/header.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/easyui.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/layer.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/uploadify.jsp" %>
  </head>
  <body>
 	<div style="position:absolute;top:0px;left:0px;right:0px;bottom:0px;">
		<div style="position:absolute;top:0px;left:0px;right:0px;bottom:0px;">
		    <table id="dataList" title="站点列表" class="easyui-datagrid" style="width:100%;height:100%"
		    		url="${ctx}/cms/site/getListData.do"
		            toolbar="#toolbar" pagination="true"
		            rownumbers="true" fitColumns="true" singleSelect="true">
		        <thead>
		            <tr>
					    <th field="id" width="100px" hidden>编号</th>
					    <th field="name" width="100px">站点名称</th>
					    <th field="title" width="100px">站点标题</th>
					    <th field="logo" width="100px" formatter="formatLogo">站点Logo</th>
					    <th field="domain" width="100px">站点域名</th>
					    <th field="description" width="100px">描述</th>
					    <th field="keywords" width="100px">关键字</th>
					    <th field="theme" width="100px">主题</th>
					    <th field="copyright" width="100px">版权信息</th>
					    <th field="customView" width="100px">自定义站点首页视图</th>
		            </tr>
		        </thead>
		    </table>
		    <div id="toolbar">
		    	<shiro:hasPermission name="cms:site:insert">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newInfo()">新建</a>
		        </shiro:hasPermission>
		        <shiro:hasPermission name="cms:site:update">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editInfo()">修改</a>
		        </shiro:hasPermission>
		        <shiro:hasPermission name="cms:site:delete">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyInfo()">删除</a>
		        </shiro:hasPermission>

				站点名称<input id="sel_name" name="sel_name" class="easyui-textbox" data-options=""/>
				站点标题<input id="sel_title" name="sel_title" class="easyui-textbox" data-options=""/>
				站点域名<input id="sel_domain" name="sel_domain" class="easyui-textbox" data-options=""/>
				描述<input id="sel_description" name="sel_description" class="easyui-textbox" data-options=""/>
				关键字<input id="sel_keywords" name="sel_keywords" class="easyui-textbox" data-options=""/>
			    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="selectData()">查询</a>
		    </div>
		    <div id="dataWin" class="easyui-window" title="站点信息维护" data-options="modal:true,closed:true,iconCls:'icon-save',resizable:false" style="width:400px;height:440px;padding:10px;">
		        <div class="ftitle">站点信息维护</div>
		        <form id="dataForm" method="post">
					<div class="fitem">
		                <label>站点名称</label>
		                <input id="name" name="name" class="easyui-textbox" data-options="required:true"/>
		                <span id="msg-name" class="err-msg"></span>
		            </div>
					<div class="fitem">
		                <label>站点标题</label>
		                <input id="title" name="title" class="easyui-textbox" data-options="required:true"/>
		                <span id="msg-title" class="err-msg"></span>
		            </div>
					<div class="fitem">
		                <label>站点Logo</label>
		                <img id="logoImg" src="" style="width:200px;height:50px;"/>
		                <input id="logo" name="logo" type="hidden"/>
		                <div id="uploadfileQueue"></div>
						<input type="file" id="uploadify" name="uploadify" data-queueid="uploadfileQueue" 
						data-filetypeexts="*.jpg;*.jpge;*.gif;*.png" 
						data-buttontext="选择附件" data-auto="true" 
						data-multi="false" data-queuesizelimit="5" 
						data-filesizelimit="5000KB" data-method="POST"
						data-url="image\" />
		                <span id="msg-logo" class="err-msg"></span>
		            </div>
					<div class="fitem">
		                <label>站点域名</label>
		                <input id="domain" name="domain" class="easyui-textbox" data-options="required:true"/>
		                <span id="msg-domain" class="err-msg"></span>
		            </div>
					<div class="fitem">
		                <label>描述</label>
		                <input id="description" name="description" class="easyui-textbox" data-options="required:true"/>
		                <span id="msg-description" class="err-msg"></span>
		            </div>
					<div class="fitem">
		                <label>关键字</label>
		                <input id="keywords" name="keywords" class="easyui-textbox" data-options="required:true"/>
		                <span id="msg-keywords" class="err-msg"></span>
		            </div>
					<div class="fitem">
		                <label>主题</label>
		                <input id="theme" name="theme" class="easyui-textbox" data-options="required:true"/>
		                <span id="msg-theme" class="err-msg"></span>
		            </div>
					<div class="fitem">
		                <label>版权信息</label>
		                <input id="copyright" name="copyright" class="easyui-textbox" data-options="required:true"/>
		                <span id="msg-copyright" class="err-msg"></span>
		            </div>
					<div class="fitem">
		                <label>自定义站点首页视图</label>
		                <input id="customView" name="customView" class="easyui-textbox" data-options="required:true"/>
		                <span id="msg-customview" class="err-msg"></span>
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
	    	mineUpload($("#uploadify"), "${ctx}", "afterMineUpload");
	    });

	    function formatLogo(value, row, index){
			if (value != ""){
				return "<a href='javascript:void(0)' onclick='openImgWin("+row.logo+")'>查看</a>";
			} else {
				return "";
			}
		}
	    
	    function openImgWin(imgUrl) {
	    	layer.open({
	    	    type: 1,
	    	    title: false,
	    	    closeBtn: false,
	    	    area: '516px',
	    	    skin: 'layui-layer-nobg', //没有背景色
	    	    shadeClose: true,
	    	    content: '<img src="${ctx}/'+imgUrl+'"/>'
	    	});
	    }
	    
	  //回调函数(文件对象,提示信息)
		function afterMineUpload(file, uf, message) {
	    	var fileName =uf.url+ uf.realname;
			alert(fileName);
	    	$("#logo").val(fileName);
	    	$("#logoImg").attr("src","${ctx}/"+fileName);
		}
	    
	    function selectData() {
		    
		    var sel_name = $("#sel_name").val();
		    var sel_title = $("#sel_title").val();
		    var sel_domain = $("#sel_domain").val();
		    var sel_description = $("#sel_description").val();
		    var sel_keywords = $("#sel_keywords").val();
        	$('#dataList').datagrid('load',{
    		    name:sel_name,
    		    title:sel_title,
    		    domain:sel_domain,
    		    description:sel_description,
    		    keywords:sel_keywords
        	});
        }
	    function reloadData() {
        	selectData();
        }
	    
        var url;
        function newInfo(){
            cleanErrMsg();
            $('#dataForm').form('clear');
	    	$("#logoImg").attr("src","");
            $('#dataWin').window('open');
            url = '${ctx}/cms/site/saveByAdd.do';
        }
        function editInfo(){
            var row = $('#dataList').datagrid('getSelected');
            if (row){
            	cleanErrMsg();
                $('#dataForm').form('load',row);
    	    	$("#logoImg").attr("src","${ctx}/"+row.logo);
                $('#dataWin').window('open');
                url = '${ctx}/cms/site/saveByUpdate.do?id='+row.id;
            }    	
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
							url: '${ctx}/cms/site/delete.do',
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
