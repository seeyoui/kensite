<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/taglib/common.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<%@ include file="/WEB-INF/view/taglib/header.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/layer.jsp" %>
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
						<p>To shewing another demands to. Marianne property cheerful informed at striking at. Clothes parlors however by cottage on. In views it or meant drift to.</p>
						<p>To shewing another demands to. Marianne property cheerful informed at striking at. Clothes parlors however by cottage on. In views it or meant drift to.</p>
						<p>To shewing another demands to. Marianne property cheerful informed at striking at. Clothes parlors however by cottage on. In views it or meant drift to.</p>
						<p>To shewing another demands to. Marianne property cheerful informed at striking at. Clothes parlors however by cottage on. In views it or meant drift to.</p>
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
						<p>Examine she brother prudent add day ham. Far stairs now coming bed oppose hunted become his. You zealously departure had procuring suspicion.</p>
						<p>Examine she brother prudent add day ham. Far stairs now coming bed oppose hunted become his. You zealously departure had procuring suspicion.</p>
						<p>Examine she brother prudent add day ham. Far stairs now coming bed oppose hunted become his. You zealously departure had procuring suspicion.</p>
						<p>Examine she brother prudent add day ham. Far stairs now coming bed oppose hunted become his. You zealously departure had procuring suspicion.</p>
						<p>Examine she brother prudent add day ham. Far stairs now coming bed oppose hunted become his. You zealously departure had procuring suspicion.</p>
						<p>Examine she brother prudent add day ham. Far stairs now coming bed oppose hunted become his. You zealously departure had procuring suspicion.</p>
						<p>Examine she brother prudent add day ham. Far stairs now coming bed oppose hunted become his. You zealously departure had procuring suspicion.</p>
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
	<br/><br/><br/><br/><br/>
	<%@ taglib uri="/WEB-INF/taglib/componentTag.tld" prefix="ks"%>
    <!-- 给标签设置user属性绑定要展现的UserInfo对象  -->
    <ks:formTag tagname="text" />
    <input type="button" value="发送账号信息" onclick="alert(kensite.sendNotice('前台测试账号信息','system,dept','U'))"/>
    <input type="button" value="发送角色信息" onclick="alert(kensite.sendNotice('前台测试角色信息','d3f34652eb03447b9cc8bb7375df675d','R'))"/>
    <input type="button" value="发送部门信息" onclick="alert(kensite.sendNotice('前台测试部门信息','dad8faf2f3eb4d279ef04decb91ca4c0','D'))"/>
</body>
</html>