<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/taglib/common.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>KenSite - 系统登录</title>
	<%@ include file="/WEB-INF/view/taglib/header.jsp" %>
</head>
<body class="page-body login-page login-light">
	<div class="login-container">
		<div class="row">
			<div class="col-sm-6">
				<script type="text/javascript">
					jQuery(document).ready(function($) {
						// Reveal Login form
						setTimeout(function(){ $(".fade-in-effect").addClass('in'); }, 1);
						// Validation and Ajax action
						$("form#login").validate({
							rules: {
								username: {
									required: true
								},
								password: {
									required: true
								}
							},
							messages: {
								username: {
									required: '请输入账号'
								},
								password: {
									required: '请输入密码'
								}
							},
							// Form Processing via AJAX
							submitHandler: function(form) {
								show_loading_bar(70); // Fill progress bar to 70% (just a given value)
								var opts = {
									"closeButton": true,
									"debug": false,
									"positionClass": "toast-top-full-width",
									"onclick": null,
									"showDuration": "300",
									"hideDuration": "1000",
									"timeOut": "5000",
									"extendedTimeOut": "1000",
									"showEasing": "swing",
									"hideEasing": "linear",
									"showMethod": "fadeIn",
									"hideMethod": "fadeOut"
								};
								$("form#login").submit();
							}
						});
						// Set Form focus
						$("form#login .form-group:has(.form-control):first .form-control").focus();
						$("form").find('#password').select();
					
					<c:if test="${not empty info}">
						$(".errors-container .alert").slideUp('fast');
						$(".errors-container").html('<div class="alert alert-danger">\
							<button type="button" class="close" data-dismiss="alert">\
								<span aria-hidden="true">&times;</span>\
								<span class="sr-only">Close</span>\
							</button>\<c:out value="${info}"/>\
						</div>');
						$(".errors-container .alert").hide().slideDown();
					</c:if>
					});
				</script>
				
				<!-- Errors container -->
				<div class="errors-container">
				</div>
				
				<!-- Add class "fade-in-effect" for login form effect -->
				<form method="post" role="form" id="login" class="login-form fade-in-effect" action="${ctx}/login/login.do">
					<div class="login-header">
						<a href="dashboard-1.html" class="logo">
							<img src="${ctx_assets}/img/logo-white-bg@2x.png" alt="" width="80" />
							<span>登录</span>
						</a>
						<p>欢迎使用kensite流程开发平台!</p>
					</div>
					<div class="form-group">
						<label class="control-label" for="username">账号</label>
						<input type="text" class="form-control" name="username" id="username" autocomplete="off" />
					</div>
					<div class="form-group">
						<label class="control-label" for="password">密码</label>
						<input type="password" class="form-control" name="password" id="password" autocomplete="off" />
					</div>
					<div class="form-group">
						<button type="submit" class="btn btn-primary  btn-block text-left">
							<i class="fa-lock"></i>
							登录
						</button>
					</div>
					<div class="login-footer">
						<a href="#">忘记密码?</a>
						<div class="info-links">
							<a href="#">To</a> -
							<a href="#">ken</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<%@ include file="/WEB-INF/view/taglib/footer.jsp" %>

</body>
</html>
