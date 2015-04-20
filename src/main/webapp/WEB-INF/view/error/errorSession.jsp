<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<link type="text/css" rel="stylesheet" href="<%=path%>/css/lib.ui.core.css"/>
		<title>Error Info</title>
		<script type="text/javascript">
			function relogin() {
				parent.window.location.href="<%=path %>/login/index.do";
			}
		</script>
	</head>
	
	<body>
		Session超时，请<a href="javascript:relogin();">重新登录</a>
	</body>
</html>
