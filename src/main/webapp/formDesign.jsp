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
	<script id="formdesign" type="text/plain" style="widht:80%;height:500px;">
	</script>
	<script type="text/javascript">
		//实例一个Ueditor
		var kenFormDesign = UE.getEditor('formdesign',{
		        toolken:true//是否在toolbars显示，表单设计器的图标
		});
	</script>
</body>
</html>
