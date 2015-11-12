<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/taglib/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>演示DEMO</title>
	<%@ include file="/WEB-INF/view/taglib/header.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/easyui.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/layer.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/uedit.jsp" %>
  </head>
  <body>
 	<div class="fbody">
        <form id="dataForm" method="post">
		    <div class="fitem">
                <ks:formTag table="T_TEST_W" column="NAME"/>
                <span id="msg-name" class="err-msg"></span>
            </div>
		    <div class="fitem">
                <ks:formTag table="T_TEST_W" column="BIRTHDAY"/>
                <span id="msg-birthday" class="err-msg"></span>
            </div>
		    <div class="fitem">
                <ks:formTag table="T_TEST_W" column="SEX"/>
                <span id="msg-sex" class="err-msg"></span>
            </div>
		    <div class="fitem">
                <ks:formTag table="T_TEST_W" column="DESCRIBE"/>
                <span id="msg-describe" class="err-msg"></span>
            </div>
		    <div class="fitem">
                <ks:formTag table="T_TEST_W" column="ISDEL"/>
                <span id="msg-isdel" class="err-msg"></span>
            </div>
		    <div class="fitem">
                <ks:formTag table="T_TEST_W" column="MANAGER"/>
                <span id="msg-manager" class="err-msg"></span>
            </div>
            <input id="id" name="id" type="hidden"/>
		</form>
    </div>
	<div class="layui-layer-btn" style="position: absolute; bottom: 0px;right: 0px"><a class="layui-layer-btn0" onclick="submitInfo()">保存</a></div>
    <script type="text/javascript">
	    var loadi,url,index = parent.layer.getFrameIndex(window.name);
	    $(document).ready(function(){
	        var row = parent.$('#dataList').datagrid('getSelected');
	        url = '${ctx}/demo/testW/save';
	        if(row != null) {
	            $('#dataForm').form('load', row);
	    		url = '${ctx}/demo/testW/update';
	        }
	    });
	
	    function submitInfo(){
	        $('#dataForm').form('submit',{
	            url: url,
	            onSubmit: function(param){
	            	if($(this).form('validate')) {
	            		loadi = layer.load(2, {time: layerLoadMaxTime});
	            	}
	                return $(this).form('validate');
	            },
	            success: function(data){
	            	layer.close(loadi);
	                cleanErrMsg();
	                var data = eval('(' + data + ')');
	                if (data.success==TRUE){
	                	parent.layer.msg("操作成功！", {offset: 'rb',icon: 6,shift: 8,time: layerMsgTime});
	            		parent.reloadData();
	            		parent.layer.close(index);
	                } else {
	                    renderErrMsg(data.message);
	                }
	            }
	        });
	    }
    </script>
  </body>
</html>
