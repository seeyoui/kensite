<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="ctx_script" value="${pageContext.request.contextPath}/SCRIPT"/>
<c:set var="ctx_page" value="${pageContext.request.contextPath}/PAGE"/>
<c:set var="ctx_common" value="${pageContext.request.contextPath}/PAGE/common"/>
<c:set var="ctx_business" value="${pageContext.request.contextPath}/PAGE/business"/>
<c:set var="ctx_system" value="${pageContext.request.contextPath}/PAGE/system"/>
<c:set var="ctx_login" value="${pageContext.request.contextPath}/PAGE/system/login"/>
<c:set var="ctx_skins" value="${pageContext.request.contextPath}/PAGE/system/skins"/>