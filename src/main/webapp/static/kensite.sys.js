//全局的AJAX访问，处理AJAX清求时SESSION超时
$.ajaxSetup({
	contentType:"application/x-www-form-urlencoded;charset=utf-8",
	complete:function(XMLHttpRequest,textStatus){
		var sessionstatus=XMLHttpRequest.getResponseHeader("sessionstatus");
		var loginPath=XMLHttpRequest.getResponseHeader("loginPath");
		if(sessionstatus=="timeOut"){
			//这里怎么处理在你，这里跳转的登录页面
			alert("会话过期,请重新登录");
			window.top.location.replace(loginPath);
		}
	}
});