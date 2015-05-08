<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/taglib/common.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<%@ include file="/WEB-INF/view/taglib/header.jsp" %>
</head>

<body class="page-body">
	<nav class="navbar horizontal-menu navbar-fixed-top"><!-- set fixed position by adding class "navbar-fixed-top" -->
		<div class="navbar-inner">
			<!-- Navbar Brand -->
			<div class="navbar-brand">
				<a href="dashboard-1.html" class="logo">
					<img src="${ctx_assets}/img/logo-white-bg@2x.png" width="80" alt="" class="hidden-xs" />
					<img src="${ctx_assets}/img/logo@2x.png" width="80" alt="" class="visible-xs" />
				</a>
			</div>
			<!-- main menu -->
			<ul class="navbar-nav">
				<c:forEach var="tree_1" items="${menuList}" varStatus="status">
					<c:forEach var="tree_2" items="${tree_1.children}" varStatus="status">
						<li>
							<a href="${ctx}/${tree_2.attributes.url}">
								<i class="linecons-cog"></i>
								<span class="title">${tree_2.text}</span>
							</a>
							<c:if test="${not empty tree_2.children}">
								<ul>
								<c:forEach var="tree_3" items="${tree_2.children}" varStatus="status">
									<li>
										<a href="${ctx}/${tree_3.attributes.url}">
											<i class="linecons-cog"></i>
											<span class="title">${tree_3.text}</span>
										</a>
										<c:if test="${not empty tree_3.children}">
											<ul>
											<c:forEach var="tree_4" items="${tree_3.children}" varStatus="status">
												<li>
													<a href="${ctx}/${tree_4.attributes.url}">
														<i class="linecons-cog"></i>
														<span class="title">${tree_4.text}</span>
													</a>
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
				</c:forEach>
			</ul>
			<!-- notifications and other links -->
			<ul class="nav nav-userinfo navbar-right">
				<li class="search-form"><!-- You can add "always-visible" to show make the search input visible -->
					<form method="get" action="extra-search.html">
						<input type="text" name="s" class="form-control search-field" placeholder="搜索..." />
						<button type="submit" class="btn btn-link">
							<i class="linecons-search"></i>
						</button>
					</form>
				</li>
				<li class="dropdown xs-left">
					<a href="#" data-toggle="dropdown" class="notification-icon">
						<i class="fa-envelope-o"></i>
						<span class="badge badge-green">15</span>
					</a>
					<ul class="dropdown-menu messages">
					<li>
						<ul class="dropdown-menu-list list-unstyled ps-scrollbar">
							<li class="active">
								<a href="#">
									<span class="line">
										<strong>Salma Nyberg</strong>
										<span class="light small">- 2 days ago</span>
									</span>
									<span class="line desc small">
										Oh he decisively impression attachment friendship so if everything. 
									</span>
								</a>
							</li>
							<li>
								<a href="#">
									<span class="line">
										Hayden Cartwright
										<span class="light small">- a week ago</span>
									</span>
									<span class="line desc small">
										Whose her enjoy chief new young. Felicity if ye required likewise so doubtful.
									</span>
								</a>
							</li>
						</ul>
					</li>
					<li class="external">
						<a href="blank-sidebar.html">
							<span>All Messages</span>
							<i class="fa-link-ext"></i>
						</a>
					</li>
					</ul>
				</li>
				<li class="dropdown xs-left">
					<a href="#" data-toggle="dropdown" class="notification-icon notification-icon-messages">
						<i class="fa-bell-o"></i>
						<span class="badge badge-purple">7</span>
					</a>
					<ul class="dropdown-menu notifications">
					<li class="top">
						<p class="small">
							<a href="#" class="pull-right">Mark all Read</a>
							You have <strong>3</strong> new notifications.
						</p>
					</li>
					<li>
						<ul class="dropdown-menu-list list-unstyled ps-scrollbar">
							<li class="active notification-success">
								<a href="#">
									<i class="fa-user"></i>
									<span class="line">
										<strong>New user registered</strong>
									</span>
									<span class="line small time">
										30 seconds ago
									</span>
								</a>
							</li>
						</ul>
					</li>
					
					<li class="external">
						<a href="#">
							<span>View all notifications</span>
							<i class="fa-link-ext"></i>
						</a>
					</li>
					</ul>
				</li>
				<li class="dropdown user-profile">
					<a href="#" data-toggle="dropdown">
						<img src="${ctx_assets}/img/user-1.png" alt="user-image" class="img-circle img-inline userpic-32" width="28" />
						<span>
							${currentUser.name}
							<i class="fa-angle-down"></i>
						</span>
					</a>
					<ul class="dropdown-menu user-profile-menu list-unstyled">
						<li>
							<a href="#edit-profile">
								<i class="fa-edit"></i>
								修改密码
							</a>
						</li>
						<li class="last">
							<a href="${ctx}/login/logout.do">
								<i class="fa-lock"></i>
								登出
							</a>
						</li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
	<div class="page-container"><!-- add class "sidebar-collapsed" to close sidebar by default, "chat-visible" to make chat appear always -->
		<div class="main-content">
			<iframe id="nav_iframe" src="" style="width:100%;height:100%;border:0px;"></iframe>
		</div>
	</div>
	
	<%@ include file="/WEB-INF/view/taglib/footer.jsp" %>
	
</body>
</html>
