<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/taglib/common.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<%@ include file="/WEB-INF/view/taglib/header.jsp" %>
</head>

<body class="page-body">
	<div class="page-container">
		<div class="main-content">
			<div class="panel panel-default">
				<div class="panel-heading">
					图片裁剪
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-md-4">
							<div class="img-container">
								<img src="/kensite/upload/image/5855b73ba1004ab396125d666f725527.jpg" class="img-responsive" style="width:100%;height:100%"/>
							</div>
						</div>
						<div class="col-md-2">
							<div class="img-shade">
								<div id="img-preview" class="img-preview"></div>
							</div>
							<div id="uploadfileQueue"></div>
							<input type="file" id="uploadify" name="uploadify" data-queueid="uploadfileQueue" 
							data-filetypeexts="*.jpg;*.jpge;*.gif;*.png" 
							data-buttontext="选择附件" data-auto="true" 
							data-multi="false" data-queuesizelimit="5" 
							data-filesizelimit="5000KB" data-method="POST"
							data-url="image\" />
							<input type="hidden" value="0" id="img-x"/>
							<input type="hidden" value="0" id="img-y"/>
							<input type="hidden" value="0" id="img-w"/>
							<input type="hidden" value="0" id="img-h"/>
							<a id="crop-img" href="data/crop-image.php" class="btn btn-secondary">裁剪</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	jQuery(document).ready(function($) {
		//附件上传模块渲染
		mineUpload($("#uploadify"), "${ctx}", "afterMineUpload");
		renderImgCrop();
		//renderImgCrop("${ctx_script}img/vw1.jpg");
		//renderImgCrop("/kensite/upload/image/eede13185d0641af8ad8fb50762050d3.jpg");
	});
	
	//附件上传成功回调函数(文件对象,提示信息)
	function afterMineUpload(file, uf, message) {
		if(uf!=null && uf.id!="") {
			renderImgCrop("${ctx}/"+uf.url+uf.realname);
			$(".img-responsive").attr("src", "${ctx}/"+uf.url+uf.realname);
		}
	}
	
	//渲染图片裁剪涉及部分
	function renderImgCrop(imgUrl) {
		var preview_size = [100, 100],
		aspect_ratio = preview_size[0] / preview_size[1],
		$image = $(".img-container img"),
		$x = $("#img-x"),
		$y = $("#img-y"),
		$w = $("#img-w"),
		$h = $("#img-h");
		if(imgUrl!=null && imgUrl!="") {
			$image.attr("src", imgUrl);
		}
		// Plugin Initialization
		$image.cropper({
			aspectRatio: aspect_ratio,
			preview: '#img-preview',
			done: function(data) {
				$x.val( data.x );
				$y.val( data.y );
				$w.val( data.width );
				$h.val( data.height );
			}
		});
		// Preview Image Setup (based on defined crop width and height
		$("#img-preview").css({
			width: preview_size[0],
			height: preview_size[1]
		});
		$("#crop-img").on('click', function(ev) {
			ev.preventDefault();
			alert("?x=" + $x.val() + "&y=" + $y.val() + "&w=" + $w.val() + "&h=" + $h.val() + "&tw=" + preview_size[0] + "&th=" + preview_size[1] );
			//window.open($(this).attr('href') + "?x=" + $x.val() + "&y=" + $y.val() + "&w=" + $w.val() + "&h=" + $h.val() + "&tw=" + preview_size[0] + "&th=" + preview_size[1] );
		});
	}
	</script>
	<!-- Imported styles on this page -->
	<link rel="stylesheet" href="${ctx_script}/cropper/cropper.min.css"/>
	<%@ include file="/WEB-INF/view/taglib/uploadify.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/footer.jsp" %>
	<!-- Imported scripts on this page -->
	<script src="${ctx_script}/cropper/cropper.min.js"></script>
</body>
</html>
