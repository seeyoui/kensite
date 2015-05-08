<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/taglib/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<script type="text/javascript" src="${ctx_common}/js/jquery-1.7.2.min.js"></script>
	<%@ include file="/WEB-INF/view/taglib/header.jsp" %>
<style type="text/css">
body {
	background: url('${ctx_login}/login_index/img/login_bg.png');
}

form {
	position: absolute;
	background: url('${ctx_login}/login_index/img/login.png') no-repeat;
	height: 350px;
	width: 380px;
}

.nameDiv {
	position: absolute;
	padding: 0px;
	top: 149px;
	left: 150px;
}

.pwdDiv {
	position: absolute;
	padding: 0px;
	top: 210px;
	left: 150px;
}

input {
	color: #4E4E4E;
	font-size: 22px;
	font-family: verdana, simsun, sans-serif;
	font-weight: 700;
	width: 150px;
	height: 30px;
	line-height: 30px;
	background: transparent;
	border: none;
}

.no_rememberDiv {
	position: absolute;
	display: block;
	padding: 0px;
	top: 261px;
	left: 76px;
	width: 140px;
	height: 40px;
	background: transparent url('${ctx_login}/login_index/img/no_remember.gif')
		no-repeat;
	cursor: pointer;
}

.rememberDiv {
	background: transparent url('${ctx_login}/login_index/img/remember.gif')
		no-repeat;
}

.submitDiv {
	position: absolute;
	padding: 0px;
	top: 262px;
	left: 228px;
	width: 78px;
	height: 38px;
	cursor: pointer;
}
</style>
</head>

<body>
	<form method="post" id="loginForm" name="loginForm"
		action="${ctx}/login/login.do">
		<input id="rememberMe" name="rememberMe" type="hidden"
			value="" />
		<div class="nameDiv">
			<input type="text" id="accountName" name="username"
				value="" />
		</div>
		<div class="pwdDiv">
			<input type="password" id="accountPwd" name="password"
				value="" />
		</div>
		<a id="autoLogin" class="no_rememberDiv"></a>
		<div class="submitDiv"></div>
	</form>

	<script type="text/javascript">
		$(document).ready(function() {
			$('#accountName').focus();
			/*
			alert($(window).height()); //浏览器当前窗口可视区域高度 
			alert($(document).height()); //浏览器当前窗口文档的高度 
			alert($(document.body).height());//浏览器当前窗口文档body的高度 
			alert($(document.body).outerHeight(true));//浏览器当前窗口文档body的总高度 包括border padding margin 
			alert($(window).width()); //浏览器当前窗口可视区域宽度
			alert($(document).width());//浏览器当前窗口文档对象宽度 
			alert($(document.body).width());//浏览器当前窗口文档body的高度 
			alert($(document.body).outerWidth(true));//浏览器当前窗口文档body的总宽度 包括border padding margin 
			*/
			var $remember = $('#remember'), $body = $(document.body), $loginForm = $('#loginForm'), top = ($(window)
					.height() - $("#loginForm").height()) * 0.5, left = ($(window)
					.width() - $("#loginForm").width()) * 0.5;

			if ($remember.val() === 'T') {
				$('#autoLogin').addClass('rememberDiv');
				$('#loginForm').submit();
			}
			$loginForm.css({
				'top' : top,
				'left' : left
			});
			$('.submitDiv').click(function() {
				$('#loginForm').submit();
			});
			//添加“回车”事件
			$(document).keydown(function(e) {
				if (e.keyCode === 13) {
					$('.submitDiv').click();
				}
			});
			$("#autoLogin").bind('click', function() {
				if ($remember.val() === 'T') {
					$remember.val('F');
					$(this).removeClass('rememberDiv');
				} else {
					$remember.val('T');
					$(this).addClass('rememberDiv');
				}
			});
			<c:if test="${not empty info}">
				$.messager.show({
					title:'错误提示',
					msg:'<c:out value="${info}"/>',
					showType:'fade'
				});
			</c:if>

		});
	</script>
</body>
</html>
