<%@ page import="com.seeyoui.kensite.common.constants.StringConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/taglib/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>测试1表单</title>
	<%@ include file="/WEB-INF/view/taglib/header.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/easyui.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/layer.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/uedit.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/formStyle.jsp" %>
  </head>
  <body>
  	<div id="buttons_box">
		<ul>
			<li><a href="javascript:void(0)" onclick="saveInfo()">保存</a></li>
		</ul>
	</div>
 	<div style="position:absolute;top:55px;left:20px;right:20px;bottom:10px;">
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
		</form>
    </div>
    <script type="text/javascript">
        var loadi,url,index = parent.layer.getFrameIndex(window.name);
	    $(document).ready(function(){
	    	var formData = ${formData};
	    	url = '${ctx}/test/testW/saveByAdd.do';
	    	if(formData!=null) {
	    		url = '${ctx}/test/testW/saveByAdd.do?id'+formData.id;
		    	$('#dataForm').form('load', formData);
	    	}
	    });

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
                		parent.reloadData();
                		parent.layer.close(index);
                    } else {
	                    layer.msg("操作失败！", {offset: 'rb',icon: 5,shift: 8,time: layerMsgTime});
	                    renderErrMsg(data.message);
                    }
                }
            });
        }
    </script>
  </body>
</html>
