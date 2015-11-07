<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/taglib/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Kensite开发平台</title>
	<%@ include file="/WEB-INF/view/taglib/header.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/easyui.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/layer.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/uedit.jsp" %>
</head>

<body>
	<script id="myFormdesign" type="text/plain" style="widht:100%">
		这里是Ueditor Formdesign 内容
	</script>
	<br/>
	<button type="button" onclick="leipiEditor.execCommand('text');" class="btn btn-info">文本框</button>
	<script type="text/javascript">
		//实例一个Ueditor
		var leipiEditor = UE.getEditor('myFormdesign',{
		        toolleipi:true,//是否在toolbars显示，表单设计器的图标 
		       //toolbars:[['FullScreen', 'Source']],//这里是工具拦
		       textarea: 'design_content',//编辑器的表单名称   
		        //更多其他参数，请参考ueditor.config.js中的配置项
		});
	</script>
</body>
</html>
