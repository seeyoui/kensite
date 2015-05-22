<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/taglib/common.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<%@ include file="/WEB-INF/view/taglib/header.jsp" %>
</head>
<body class="page-body">
	<div class="row draggable-portlets" style="padding: 10px 10px 10px;margin-left: 0;margin-right: 0;">
		<div class="col-md-4">
			<div class="sorted">
				<div class="panel panel-color panel-purple">
					<!-- panel head -->
					<div class="panel-heading">
						<div class="panel-title">Draggable Portlet 1</div>
					</div>
					<!-- panel body -->
					<div class="panel-body">
						<p>Difficulty on insensible reasonable in. From as went he they. Preference themselves me as thoroughly partiality considered on in estimating.</p>
					</div>
				</div>
				<div class="panel panel-color panel-danger">
					<!-- panel head -->
					<div class="panel-heading">
						<div class="panel-title">Draggable Portlet 4</div>
					</div>
					<!-- panel body -->
					<div class="panel-body">
						<p>To shewing another demands to. Marianne property cheerful informed at striking at. Clothes parlors however by cottage on. In views it or meant drift to.</p>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="sorted">
				<div class="panel panel-color panel-success">
					<!-- panel head -->
					<div class="panel-heading">
						<div class="panel-title">Draggable Portlet 2</div>
					</div>
					<!-- panel body -->
					<div class="panel-body">
						<p>Examine she brother prudent add day ham. Far stairs now coming bed oppose hunted become his. You zealously departure had procuring suspicion.</p>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="sorted">
				<div class="panel panel-color panel-info">
					<!-- panel head -->
					<div class="panel-heading">
						<div class="panel-title">Draggable Portlet 3</div>
					</div>
					<!-- panel body -->
					<div class="panel-body">
						<p>To shewing another demands to. Marianne property cheerful informed at striking at. Clothes parlors however by cottage on. In views it or meant drift to.</p>
					</div>
				</div>
				<div class="panel panel-color panel-warning">
					<!-- panel head -->
					<div class="panel-heading">
						<div class="panel-title">Draggable Portlet 5</div>
					</div>
					<!-- panel body -->
					<div class="panel-body">
						<p>To shewing another demands to. Marianne property cheerful informed at striking at. Clothes parlors however by cottage on. In views it or meant drift to.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<i class="linecons-music"></i>
	<i class="linecons-search"></i>
	<i class="linecons-mail"></i>
	<i class="linecons-heart"></i>
	<i class="linecons-star"></i>
	<i class="linecons-user"></i>
	<i class="linecons-videocam"></i>
	<i class="linecons-camera"></i>
	<i class="linecons-photo"></i>
	<i class="linecons-attach"></i>
	<i class="linecons-lock"></i>
	<i class="linecons-eye"></i>
	<i class="linecons-tag"></i>
	<i class="linecons-thumbs-up"></i>
	<i class="linecons-pencil"></i>
	<i class="linecons-comment"></i>
	<i class="linecons-location"></i>
	<i class="linecons-cup"></i>
	<i class="linecons-trash"></i>
	<i class="linecons-doc"></i>
	<i class="linecons-note"></i>
	<i class="linecons-cog"></i>
	<i class="linecons-params"></i>
	<i class="linecons-calendar"></i>
	<i class="linecons-sound"></i>
	<i class="linecons-clock"></i>
	<i class="linecons-lightbulb"></i>
	<i class="linecons-tv"></i>
	<i class="linecons-desktop"></i>
	<i class="linecons-mobile"></i>
	<i class="linecons-cd"></i>
	<i class="linecons-inbox"></i>
	<i class="linecons-globe"></i>
	<i class="linecons-cloud"></i>
	<i class="linecons-paper-plane"></i>
	<i class="linecons-fire"></i>
	<i class="linecons-graduation-cap"></i>
	<i class="linecons-megaphone"></i>
	<i class="linecons-database"></i>
	<i class="linecons-key"></i>
	<i class="linecons-beaker"></i>
	<i class="linecons-truck"></i>
	<i class="linecons-money"></i>
	<i class="linecons-food"></i>
	<i class="linecons-shop"></i>
	<i class="linecons-diamond"></i>
	<i class="linecons-t-shirt"></i>
	<i class="linecons-wallet"></i>
	<script type="text/javascript">
		jQuery(document).ready(function($) {
			$(function() {
				var $draggable_portlets = $(".draggable-portlets");
				$(".draggable-portlets .sorted" ).sortable({
					connectWith: ".draggable-portlets .sorted",
					handle: '.panel-heading',
					start: function() {
						$draggable_portlets.addClass('dragging');
					},
					stop: function() {
						$draggable_portlets.removeClass('dragging');
					}
				});
				$( ".draggable-portlets .sorted .panel-heading" ).disableSelection();
			});
		});
	</script>
	<%@ include file="/WEB-INF/view/taglib/footer.jsp" %>
	<script src="${ctx_assets}/js/jquery-ui/jquery-ui.min.js"></script>
</body>
</html>