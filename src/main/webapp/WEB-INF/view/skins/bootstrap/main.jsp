<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/taglib/common.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Kensite</title>
<%@ include file="/WEB-INF/view/taglib/header.jsp"%>
<%@ include file="/WEB-INF/view/taglib/layer.jsp" %>
<%@ include file="/WEB-INF/view/taglib/bootstrap.jsp"%>
<%@ include file="/WEB-INF/view/taglib/moment.jsp"%>
<style type="text/css">
.content img {
	width:32px;
	height:32px;
}
</style>
</head>
<body class="fixed-sidebar full-height-layout gray-bg"
	style="overflow: hidden">
	<div id="wrapper">
		<!--左侧导航开始-->
		<nav class="navbar-default navbar-static-side" role="navigation">
		<div class="nav-close">
			<i class="fa fa-times-circle"></i>
		</div>
		<div class="sidebar-collapse">
			<ul class="nav" id="side-menu">
				<li class="nav-header">
					<div class="dropdown profile-element">
						<span>
						<c:if test="${not empty currentUser.headIcon}">
							<img id="headIcon" alt="image" class="img-circle" src="${ctx}/upload/headIcon/${currentUser.headIcon}" style="width: 60px;"/>
						</c:if>
						<c:if test="${empty currentUser.headIcon}">
							<img id="headIcon" alt="image" class="img-circle" src="${ctx}/upload/headerIcon.png" style="width: 60px;"/>
						</c:if>
						</span>
						<a data-toggle="dropdown" class="dropdown-toggle" href="#">
							<span class="clear" style="position: absolute; left: 80px;top: 10px;">
							<span class="block m-t-xs"><strong class="font-bold">${currentUserName}</strong></span>
							<span class="text-muted text-xs block">${currentUser.name}<b class="caret"></b></span>
							</span>
						</a>
						<ul class="dropdown-menu animated fadeInRight m-t-xs">
							<!-- <li><a href="javascript:headIcon();">修改头像</a></li> -->
							<li><a class="J_menuItem" href="${ctx }/login/skinsPage/common/headIcon">修改头像</a></li>
							<li><a class="J_menuItem" href="profile.html">个人资料</a></li>
							<li><a class="J_menuItem" href="mailbox.html">信箱</a></li>
							<li class="divider"></li>
							<li><a href="javascript:logout();">安全退出</a></li>
						</ul>
					</div>
					<div class="logo-element">Kensite</div>
				</li>
				<!-- 生成菜单导航 -->
				<c:forEach var="tree" items="${menuList}" varStatus="status">
				<li>
					<c:if test="${tree.attributes.url=='/'}">
					<a href="javasctipt:void(0)">
					</c:if>
					<c:if test="${tree.attributes.url!='/'}">
					<a class="J_menuItem" href="${ctx }${tree.attributes.url}">
					</c:if>
						<c:if test="${not empty tree.attributes.icon}">
						<i class="${tree.attributes.icon}"></i>
						</c:if>
						<span class="nav-label">${tree.text}</span>
						<c:if test="${not empty tree.children}">
						<span class="fa arrow"></span>
						</c:if>
					</a>
					<c:if test="${tree.children!=null}">
					<ul class="nav nav-second-level">
					<c:forEach var="tree1" items="${tree.children}" varStatus="status">
						<li>
						<c:if test="${tree1.attributes.url=='/'}">
						<a href="javasctipt:void(0)">
						</c:if>
						<c:if test="${tree1.attributes.url!='/'}">
						<a class="J_menuItem" href="${ctx }${tree1.attributes.url}">
						</c:if>
						<c:if test="${not empty tree1.attributes.icon}">
						<i class="${tree1.attributes.icon}"></i>
						</c:if>
						${tree1.text}
						<c:if test="${not empty tree1.children}">
						<span class="fa arrow"></span>
						</c:if>
						</a>
						<c:if test="${not empty tree1.children}">
						<ul class="nav nav-third-level">
						<c:forEach var="tree2" items="${tree1.children}" varStatus="status">
                            <li><c:if test="${tree2.attributes.url=='/'}">
							<a href="javasctipt:void(0)">
							</c:if>
							<c:if test="${tree2.attributes.url!='/'}">
							<a class="J_menuItem" href="${ctx }${tree2.attributes.url}">
							</c:if>
							<c:if test="${not empty tree2.attributes.icon}">
							<i class="${tree2.attributes.icon}"></i>
							</c:if>
                            ${tree2.text}</a>
                            </li>
						</c:forEach>
						</ul>
						</c:if>
						</li>
					</c:forEach>
					</ul>
					</c:if>
				</li>
				</c:forEach>
			</ul>
		</div>
		</nav>
		<!--左侧导航结束-->
		<!--右侧部分开始-->
		<div id="page-wrapper" class="gray-bg dashbard-1">
			<div class="row border-bottom">
				<nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
					<div class="navbar-header">
					</div>
					<ul class="nav navbar-top-links navbar-right">
						<li class="dropdown hidden-xs">
							<a class="right-sidebar-toggle" aria-expanded="false">
								<i class="fa fa-tasks"></i>主题
							</a>
						</li>
						<li class="hidden-xs">
							<a href="javascript:logout();">
								<i class="fa fa fa-sign-out"></i>退出
							</a>
						</li>
					</ul>
				</nav>
			</div>
			<div class="row content-tabs">
				<a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#" style="position: absolute; left: -19px;top: -5px;">
					<i class="fa fa-bars"></i>
				</a>
				<button class="roll-nav roll-left J_tabLeft">
					<i class="fa fa-backward"></i>
				</button>
				<nav class="page-tabs J_menuTabs">
					<div class="page-tabs-content">
						<a href="javascript:;" class="active J_menuTab" data-id="${ctx }/login/skinsPage/welcome">首页</a>
					</div>
				</nav>
				<button class="roll-nav roll-right J_tabRight">
					<i class="fa fa-forward"></i>
				</button>
				<div class="btn-group roll-nav roll-right">
					<button class="dropdown J_tabClose" data-toggle="dropdown">
						关闭操作<span class="caret"></span>
					</button>
					<ul role="menu" class="dropdown-menu dropdown-menu-right">
						<li class="J_tabShowActive"><a>定位当前选项卡</a></li>
						<li class="divider"></li>
						<li class="J_tabCloseAll"><a>关闭全部选项卡</a></li>
						<li class="J_tabCloseOther"><a>关闭其他选项卡</a></li>
					</ul>
				</div>
				<!-- <a href="login.html" class="roll-nav roll-right J_tabExit"><i
					class="fa fa fa-sign-out"></i> 退出</a> -->
			</div>
			<div class="row J_mainContent" id="content-main">
				<iframe class="J_iframe" name="iframe0" width="100%" height="100%"
					src="${ctx }/login/skinsPage/welcome" frameborder="0" data-id="${ctx }/login/skinsPage/welcome" seamless></iframe>
			</div>
			<div class="footer">
				<div class="pull-right">
					&copy; 2014-2016 <a href="http://www.seeyoui.com/" target="_blank">kensite</a>
				</div>
			</div>
		</div>
		<!--右侧部分结束-->
		<!--右侧边栏开始-->
		<div id="right-sidebar">
			<div class="sidebar-container">
				<ul class="nav nav-tabs navs-3">
					<li class="active">
						<a data-toggle="tab" href="#tab-1"><i class="fa fa-gear"></i>主题</a>
					</li>
					<li class=""><a data-toggle="tab" href="#tab-2">通知 </a></li>
					<li><a data-toggle="tab" href="#tab-3">项目进度 </a></li>
				</ul>

				<div class="tab-content">
					<div id="tab-1" class="tab-pane active">
						<div class="sidebar-title">
							<h3>
								<i class="fa fa-comments-o"></i> 主题设置
							</h3>
							<small><i class="fa fa-tim"></i>
								你可以从这里选择和预览主题的布局和样式，这些设置会被保存在本地，下次打开的时候会直接应用这些设置。</small>
						</div>
						<div class="skin-setttings">
							<div class="title">主题设置</div>
							<div class="setings-item">
								<span>收起左侧菜单</span>
								<div class="switch">
									<div class="onoffswitch">
										<input type="checkbox" name="collapsemenu" class="onoffswitch-checkbox" id="collapsemenu">
										<label class="onoffswitch-label" for="collapsemenu">
											<span class="onoffswitch-inner"></span>
											<span class="onoffswitch-switch"></span>
										</label>
									</div>
								</div>
							</div>
							<div class="setings-item">
								<span>固定顶部</span>
								<div class="switch">
									<div class="onoffswitch">
										<input type="checkbox" name="fixednavbar" class="onoffswitch-checkbox" id="fixednavbar">
										<label class="onoffswitch-label" for="fixednavbar">
											<span class="onoffswitch-inner"></span>
											<span class="onoffswitch-switch"></span>
										</label>
									</div>
								</div>
							</div>
							<div class="setings-item">
								<span> 固定宽度 </span>
								<div class="switch">
									<div class="onoffswitch">
										<input type="checkbox" name="boxedlayout" class="onoffswitch-checkbox" id="boxedlayout">
										<label class="onoffswitch-label" for="boxedlayout">
											<span class="onoffswitch-inner"></span>
											<span class="onoffswitch-switch"></span>
										</label>
									</div>
								</div>
							</div>
							<div class="title">皮肤选择</div>
							<div class="setings-item default-skin nb">
								<span class="skin-name ">
									<a href="#" class="s-skin-0">默认皮肤 </a>
								</span>
							</div>
							<div class="setings-item blue-skin nb">
								<span class="skin-name ">
									<a href="#" class="s-skin-1">蓝色主题 </a>
								</span>
							</div>
							<div class="setings-item yellow-skin nb">
								<span class="skin-name ">
									<a href="#" class="s-skin-3">黄色/紫色主题 </a>
								</span>
							</div>
						</div>
					</div>
					<div id="tab-2" class="tab-pane">
						<div class="sidebar-title">
							<h3>
								<i class="fa fa-comments-o"></i> 最新通知
							</h3>
							<small><i class="fa fa-tim"></i> 您当前有2条未读信息</small>
						</div>
						<div>
							<div class="sidebar-message">
								<a href="#">
									<div class="pull-left text-center">
										<img alt="image" class="img-circle message-avatar" src="img/a1.jpg">
										<div class="m-t-xs">
											<i class="fa fa-star text-warning"></i>
											<i class="fa fa-star text-warning"></i>
										</div>
									</div>
									<div class="media-body">
										据天津日报报道：瑞海公司董事长于学伟，副董事长董社轩等10人在13日上午已被控制。 <br>
										<small class="text-muted">今天 4:21</small>
									</div>
								</a>
							</div>
							<div class="sidebar-message">
								<a href="#">
									<div class="pull-left text-center">
										<img alt="image" class="img-circle message-avatar" src="img/a2.jpg">
									</div>
									<div class="media-body">
										HCY48之音乐大魔王会员专属皮肤已上线，快来一键换装拥有他，宣告你对华晨宇的爱吧！ <br>
										<small class="text-muted">昨天 2:45</small>
									</div>
								</a>
							</div>
						</div>
					</div>
					<div id="tab-3" class="tab-pane">
						<div class="sidebar-title">
							<h3>
								<i class="fa fa-cube"></i> 最新任务
							</h3>
							<small><i class="fa fa-tim"></i> 您当前有14个任务，10个已完成</small>
						</div>

						<ul class="sidebar-list">
							<li>
								<a href="#">
									<div class="small pull-right m-t-xs">9小时以后</div>
									<h4>市场调研</h4> 按要求接收教材；
									<div class="small">已完成： 22%</div>
									<div class="progress progress-mini">
										<div style="width: 22%;" class="progress-bar progress-bar-warning"></div>
									</div>
									<div class="small text-muted m-t-xs">
										项目截止： 4:00 - 2015.10.01
									</div>
								</a>
							</li>
							<li>
								<a href="#">
									<div class="small pull-right m-t-xs">9小时以后</div>
									<h4>立项阶段</h4> 东风商用车公司 采购综合综合查询分析系统项目进度阶段性报告武汉斯迪克科技有限公司
									<div class="small">已完成： 14%</div>
									<div class="progress progress-mini">
										<div style="width: 14%;" class="progress-bar progress-bar-info"></div>
									</div>
								</a>
							</li>
							<li>
								<a href="#">
									<span class="label label-primary pull-right">NEW</span>
									<h4>设计阶段</h4> <!--<div class="small pull-right m-t-xs">9小时以后</div>-->
									项目进度报告(Project Progress Report)
									<div class="small">已完成： 22%</div>
									<div class="small text-muted m-t-xs">
										项目截止： 4:00 - 2015.10.01
									</div>
								</a>
							</li>
							<li>
								<a href="#">
									<div class="small pull-right m-t-xs">9小时以后</div>
									<h4>拆迁阶段</h4> 科研项目研究进展报告 项目编号: 项目名称: 项目负责人:
									<div class="small">已完成： 22%</div>
									<div class="progress progress-mini">
										<div style="width: 22%;" class="progress-bar progress-bar-warning"></div>
									</div>
									<div class="small text-muted m-t-xs">
										项目截止： 4:00 - 2015.10.01
									</div>
								</a>
							</li>
						</ul>
					</div>
				</div>

			</div>
		</div>
		<!--右侧边栏结束-->
		<!--mini聊天窗口开始-->
		<div class="small-chat-box fadeInRight animated">
			<div class="heading" draggable="true">
				<small class="chat-date pull-right">
					2016.05.05
				</small>唠嗑
			</div>
			<div id="console" class="content">
				
			</div>
			<div class="form-chat">
				<div class="input-group input-group-sm">
					<input id="message" type="text" class="form-control"/>
					<span class="input-group-btn">
						<button class="btn btn-primary" type="button" onclick="echo();">发送</button>
					</span>
				</div>
			</div>

		</div>
		<div id="small-chat" class="animated">
			<span class="badge badge-warning pull-right"></span>
			<a class="open-small-chat"><i class="fa fa-comments"></i></a>
		</div>
	</div>
</body>
<script type="text/javascript">
$(document).ready(function() {
	connect();
	$(document).keydown(function(e) {
		if (e.keyCode === 13) {
			echo();
		}
	});
});
//退出当前登录
function logout() {
	layer.confirm('你确定要退出系统么？',function(index){
		window.location.href="${ctx}/login/logout";
	});
}

function headIcon() {
	var url = "${ctx }/login/skinsPage/common/headIcon";
	var title = "用户头像";
	var area = ['1000px', '490px'];
	layerOpen(url, title, area);
}

function layerOpen(url, title, area) {
	if(area == null) {
		area = ['310px', '350px'];
	}
   	layer.open({
   	    type: 2,
   	    title: title,
   	    area: area,
   	    fix: false, //不固定
   	    maxmin: false,
   	    content: url,
   	    btn: ['保存', '取消'],
           success: function(layero, index){
               iframeBody = layer.getChildFrame('body', index);
               iframeWin = window[layero.find('iframe')[0]['name']];
           },
   	    yes: function(index, layero) {
   	    	if(iframeWin != null) {
   	    		iframeWin.submitInfo();
   	    	}
   	    },
   	    cancel: function(index){
   	    	layer.close(index);
   	    }
   	});
}
</script>

<script src="http://cdn.sockjs.org/sockjs-0.3.min.js"></script>

<script type="text/javascript">
	var ws = null;
	var url = null;
	var transports = [];

	function connect() {
		if(ws) {
			return;
		}
		if (!url) {
			url = '${ctx}/websck';
		}
		if ('WebSocket' in window) {
			ws= new WebSocket("ws://"+window.location.host+"${ctx}/websck");
		} else {
			ws = new SockJS("http://"+window.location.host+"${ctx}/sockjs/websck");
		}
		ws.onopen = function () {
			console.info('open');
		};
		ws.onmessage = function (event) {
			log(event.data);
		};
		ws.onclose = function (event) {
			log('Info: connection closed.');
			log(event);
		};
	}

	function disconnect() {
		if (ws != null) {
			ws.close();
			ws = null;
		}
	}

	function echo() {
		if (ws != null) {
			var message = $('#message').val();
			if(message == null || message == '') {
				return;
			}
			var sendMsg = '{"userName":"${currentUser.userName}",'+
				'"name":"${currentUser.name}",'+
				'"headIcon":"${currentUser.headIcon}",'+
				'"sendType":"msg",'+
				'"sendTo":"all",'+
				'"message":"'+message+'"}';
			ws.send(sendMsg);
			$('#message').val('');
		} else {
		}
	}
	
	function log(message) {
		//$("#small-chat").removeAttr("class").attr("class","");
		//$("#small-chat").addClass("animated");
		//$("#small-chat").addClass("pulse");
		message = JSON.parse(message);
		var p = '';
		if(message.userName=='${currentUserName}') {
			p = '<div class="right">'+
				'<div class="author-name">'+
				message.name+' <small class="chat-date"> '+moment().calendar()+' </small>'+
				'<img class="message-avatar" src="${ctx}/upload/headIcon/'+message.headIcon+'" alt="">'+
				'</div>'+
				'<div class="chat-message">'+message.message+'</div>'+
				'</div>';
		} else {
			p = '<div class="left">'+
				'<div class="author-name">'+
				'<img class="message-avatar" src="${ctx}/upload/headIcon/'+message.headIcon+'" alt="">'+
				message.name+' <small class="chat-date"> '+moment().calendar()+' </small>'+
				'</div>'+
				'<div class="chat-message active">'+message.message+'</div>'+
				'</div>';
			if($('.small-chat-box').attr('class').indexOf('active') == -1) {
				var messageCount = $('#small-chat span').html();
				if(messageCount == null || messageCount == '') {
					messageCount = 0;
				}
				$('#small-chat span').html(parseInt(messageCount)+1);
			}
		}
		$('#console').append(p);
		var console = document.getElementById('console');
		while (console.childNodes.length > 25) {
			console.removeChild(console.firstChild);
		}
		console.scrollTop = console.scrollHeight;
	}
</script>
</html>