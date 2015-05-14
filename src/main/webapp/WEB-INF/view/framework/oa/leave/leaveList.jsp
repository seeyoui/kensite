<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/taglib/common.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<%@ include file="/WEB-INF/view/taglib/header.jsp" %>
</head>

<body class="page-body">
<div id="jsAutoHeight" class="scrollable" data-max-height="600">
	<div class="page-container" class="scrollable" data-max-height="400"><!-- add class "sidebar-collapsed" to close sidebar by default, "chat-visible" to make chat appear always -->
		<div class="main-content">
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-body">
							<script type="text/javascript">
				jQuery(document).ready(function($) {
					$("#jsAutoHeight").attr("data-max-height", $(window).height());
					$("#dataList").dataTable({
						dom: "<'toolbar'>rtip",
						"language": {
            				"url": "${ctx_assets}/js/datatables/zh_CN.txt"
        				},
        				"iDisplayLength" : 5
					});
					setTimeout(function(){
						$("div.toolbar").html('<button class="btn btn-secondary btn-icon btn-xs"><i class="fa-heart"></i><span>启动流程</span></button>');
					},500);
				});
				
				</script>
				
				<table class="table table-bordered table-striped" id="dataList">
					<thead>
						<tr>
							<th class="no-sorting">Student Name</th>
							<th>Average Grade</th>
							<th>Curriculum / Occupation</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody class="middle-align">
						<tr>
							<td>Randy S. Smith</td>
							<td>8.7</td>
							<td>Social and human service</td>
							<td>
								<a href="javascript:;" onclick="jQuery('#dataWin').modal('show', {backdrop: 'static'});" class="btn btn-secondary btn-sm btn-icon icon-left">Edit</a>
								<a href="javascript:;" class="btn btn-danger btn-sm btn-icon icon-left">Delete</a>
								<a href="javascript:;" class="btn btn-info btn-sm btn-icon icon-left">Profile</a>
							</td>
						</tr>
						<tr>
							<td>Randy S. Smith</td>
							<td>8.7</td>
							<td>Social and human service</td>
							<td>
								<a href="javascript:;" onclick="jQuery('#dataWin').modal('show', {backdrop: 'static'});" class="btn btn-secondary btn-sm btn-icon icon-left">Edit</a>
								<a href="javascript:;" class="btn btn-danger btn-sm btn-icon icon-left">Delete</a>
								<a href="javascript:;" class="btn btn-info btn-sm btn-icon icon-left">Profile</a>
							</td>
						</tr>
						<tr>
							<td>Randy S. Smith</td>
							<td>8.7</td>
							<td>Social and human service</td>
							<td>
								<a href="javascript:;" onclick="jQuery('#dataWin').modal('show', {backdrop: 'static'});" class="btn btn-secondary btn-sm btn-icon icon-left">Edit</a>
								<a href="javascript:;" class="btn btn-danger btn-sm btn-icon icon-left">Delete</a>
								<a href="javascript:;" class="btn btn-info btn-sm btn-icon icon-left">Profile</a>
							</td>
						</tr>
						<tr>
							<td>Randy S. Smith</td>
							<td>8.7</td>
							<td>Social and human service</td>
							<td>
								<a href="javascript:;" onclick="jQuery('#dataWin').modal('show', {backdrop: 'static'});" class="btn btn-secondary btn-sm btn-icon icon-left">Edit</a>
								<a href="javascript:;" class="btn btn-danger btn-sm btn-icon icon-left">Delete</a>
								<a href="javascript:;" class="btn btn-info btn-sm btn-icon icon-left">Profile</a>
							</td>
						</tr>
						<tr>
							<td>Randy S. Smith</td>
							<td>8.7</td>
							<td>Social and human service</td>
							<td>
								<a href="javascript:;" onclick="jQuery('#dataWin').modal('show', {backdrop: 'static'});" class="btn btn-secondary btn-sm btn-icon icon-left">Edit</a>
								<a href="javascript:;" class="btn btn-danger btn-sm btn-icon icon-left">Delete</a>
								<a href="javascript:;" class="btn btn-info btn-sm btn-icon icon-left">Profile</a>
							</td>
						</tr>
						<tr>
							<td>Randy S. Smith</td>
							<td>8.7</td>
							<td>Social and human service</td>
							<td>
								<a href="javascript:;" onclick="jQuery('#dataWin').modal('show', {backdrop: 'static'});" class="btn btn-secondary btn-sm btn-icon icon-left">Edit</a>
								<a href="javascript:;" class="btn btn-danger btn-sm btn-icon icon-left">Delete</a>
								<a href="javascript:;" class="btn btn-info btn-sm btn-icon icon-left">Profile</a>
							</td>
						</tr>
					</tbody>
				</table>
						</div>					
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
	<div class="modal fade" id="dataWin">
		<div class="modal-dialog">
			<div class="modal-content">
				<%@include file="leaveForm.jsp" %>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/view/taglib/footer.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/datatables.jsp" %>
	<script src="${ctx_assets}/js/rwd-table/js/rwd-table.min.js"></script>
</body>
</html>
