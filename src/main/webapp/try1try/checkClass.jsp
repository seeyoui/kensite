<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import='java.io.*,java.security.CodeSource' %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>get the class location</title>
</head>
<body>
<%
String className = request.getParameter("className");
PrintWriter printWriter = new PrintWriter(response.getWriter());
if(className == null || className.isEmpty()){
	printWriter.write("className shoud be specified");
}else{
	Class<?> clazz = null;
	try{
		clazz = Class.forName(className);
	}catch(Exception e){
		
	}
	if(clazz == null){
		printWriter.println(className + "not found");
	}else{
		CodeSource codeSource = clazz.getProtectionDomain().getCodeSource();
		if(codeSource == null){
			printWriter.println(className + " location not available");
		}else{
			String location = codeSource.getLocation().getPath();
			printWriter.println(className + " location: " + location);
		}
	}
}
printWriter.flush();
%>
</body>
</html>