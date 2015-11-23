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
	<ks:formTag table="T_TEST_W" column="NAME"/>
	<ks:formTag table="T_TEST_W" column="BIRTHDAY"/>
	<ks:formTag table="T_TEST_W" column="SEX"/>
	<ks:formTag table="T_TEST_W" column="DESCRIBE"/>
	<ks:formTag table="T_TEST_W" column="ISDEL"/>
	${ksfn:getDate("yyyy-MM-dd")}
</body>
</html>
