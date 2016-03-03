<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/taglib/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Kensite开发平台</title>
	<%@ include file="/WEB-INF/view/taglib/header.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/easyui.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/layer.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/uedit.jsp" %>
	<script type="text/javascript" src="${ctx_weixin}/js/editor.js"></script>
	<style type="text/css">
		.template-list li {cursor: pointer;margin: 3px 0;padding: 10px;line-height: 20px;}
		.color-swatch{width:20px;height:20px;border-radius:3px;cursor: pointer;float:left;margin:4px 2px;}
		.color-box {width:16px;height:16px;cursor: pointer;border:solid 1px #ddd;margin-top:3px;float: left;margin-right:5px;}
		.color-swatch:hover,.color-swatch.active {	
			-webkit-transform:scale(1.1);-moz-transform:scale(1.1);-ms-transform:scale(1.1);
			-o-transform:scale(1.1);transform:scale(1.1);
			-webkit-box-shadow:inset 1px 1px 1px #5b616d,0 0 5px #45bcda;
			-moz-box-shadow:inset 1px 1px 1px #5b616d,0 0 5px #45bcda;
			box-shadow:inset 1px 1px 1px #5b616d,0 0 5px #45bcda;
		}
	</style>
</head>

<body>
	<div style="position:absolute;top:0px;left:0px;right:0px;bottom:0px;">
		<div style="position:absolute;top:0px;left:0px;width:450px;height:100px;">
			<ul class="clearfix" style="list-style:none;padding:10px 10px;margin:0 0;">
	            <li class="color-swatch" style="background-color: #ac1d10"></li>
	            <li class="color-swatch" style="background-color: #d82821;"></li>
	            <li class="color-swatch" style="background-color: #ef7060;"></li>
	            <li class="color-swatch" style="background-color: #fde2d8;"></li>
	            
	            <li class="color-swatch" style="background-color: #d32a63;"></li>
	            <li class="color-swatch" style="background-color: #eb6794;"></li>
	            <li class="color-swatch" style="background-color: #f5bdd1;"></li>            
	            <li class="color-swatch" style="background-color: #ffebf0;"></li>
	            
	            <li class="color-swatch" style="background-color: #e2561b;"></li>
	            <li class="color-swatch" style="background-color: #ff8124;"></li>
	            <li class="color-swatch" style="background-color: #fcb42b;"></li>
	            <li class="color-swatch" style="background-color: #feecaf;"></li>
	            
	            <li class="color-swatch" style="clear:left;background-color: #0c8918;"></li>
	            <li class="color-swatch" style="background-color: #80b135;"></li>
	            <li class="color-swatch" style="background-color:#c2c92a;"></li>
	            <li class="color-swatch" style="background-color:#e5f3d0;"></li>
	            
	            <!-- <li class="color-swatch" style="clear:left;background-color: #1f877a;"></li>
	            <li class="color-swatch" style="background-color: #27abc1;"></li>
	            <li class="color-swatch" style="background-color: #5acfe1;"></li>
	            <li class="color-swatch" style="background-color: #b6f2ea;"></li> -->
	            
	            <li class="color-swatch" style="background-color:#374aae;"></li>
	            <li class="color-swatch" style="background-color:#1e9be8;"></li>
	            <li class="color-swatch" style="background-color:#59c3f9;"></li>
	            <li class="color-swatch" style="background-color:#b6e4fd;"></li>
	
	            <li class="color-swatch" style="background-color:#5b39b4;"></li>
	            <li class="color-swatch" style="background-color: #4c6ff3;"></li>
	            <li class="color-swatch" style="background-color:#91a8fc;"></li>
	            <li class="color-swatch" style="background-color:#d0dafe;"></li>
	            
	            <!-- 紫色 -->
	            <li class="color-swatch" style="clear:left;background-color:#8d4bbb;"></li>
	            <li class="color-swatch" style="background-color: rgb(166, 91, 203);"></li>
	            <li class="color-swatch" style="background-color:#cca4e3;"></li>
	            <li class="color-swatch" style="background-color: rgb(190, 119, 99);"></li>
	            
	            <li class="color-swatch" style="background-color:#3c2822;"></li>
	            <li class="color-swatch" style="background-color:#6b4d40;"></li>
	            <li class="color-swatch" style="background-color:#9f887f;"></li>
	            <li class="color-swatch" style="background-color:#d7ccc8;"></li>
	            
	        	<li class="color-swatch" style="background-color: #212122;"></li>
	        	<li class="color-swatch" style="background-color: #757576;"></li>
	        	<li class="color-swatch" style="background-color: #c6c6c7"></li>
	        	<li class="color-swatch" style="background-color: #f5f5f4"></li>
	        	
	        </ul>
		</div>
		<div style="position:absolute;top:100px;left:0px;width:450px;bottom:0px;overflow:auto">
			<div class="easyui-tabs" fit="true">
        		<div title="标题" style="padding:10px">
					<%@include file="/static/weixin/biaoti.jsp"%>
				</div>
				<div title="正文" style="padding:10px">
					<%@include file="/static/weixin/zhengwen.jsp"%>
				</div>
				<div title="图片" style="padding:10px">
					<%@include file="/static/weixin/tuwen.jsp"%>
				</div>
				<div title="关注" style="padding:10px">
					<%@include file="/static/weixin/guanzhu.jsp"%>
				</div>
				<div title="分割线" style="padding:10px">
					<%@include file="/static/weixin/fengexian.jsp"%>
				</div>
				<div title="阅读原文" style="padding:10px">
					<%@include file="/static/weixin/yueduyuanwen.jsp"%>
				</div>
       		</div>
 		</div>
		<div style="position:absolute;top:0px;left:450px;width:545px;bottom:0px;">
			<script id="formdesign" type="text/plain" style="width:540px;"></script>
		</div>
	</div>
	<script type="text/javascript">
		//实例一个Ueditor
		var current_active_item = null;
		var wechartDesign = UE.getEditor('formdesign', {
			toolbars : [
					[ "source", "undo", "redo", "bold", "italic", "underline",
							"forecolor", "backcolor", "justifyleft",
							"justifycenter", "justifyright", "justifyjustify",
							"indent", "insertunorderedlist",
							"insertorderedlist", "|", "searchreplace",
							"removeformat", "autotypeset" ],
					[ "paragraph", "fontfamily", "fontsize", "rowspacingtop",
							"lineheight", "inserttable", "insertimage",
							"emotion", "horizontal", "spechars", 'link',
							'unlink' ] ],
			toolken : true
		//是否在toolbars显示，表单设计器的图标
		});
		wechartDesign.ready(function() {
			wechartDesign.setHeight(517);
			var _tempLi = $('.template-list li');
			_tempLi.hover(function(){
				$(this).css({"background-color":"#f5f5f5"});
			},function(){
				$(this).css({"background-color":"#fff"});
			});
			_tempLi.click(function(){
				var _tempHtml = $(this).html();
				//wechartDesign.setContent("");
				wechartDesign.execCommand('insertHtml', _tempHtml + "<p><br/></p>");
			});
		});

		$('.color-swatch').click(function(){
			$('.color-swatch').removeClass('active');
			$(this).addClass('active');
			var color = $(this).data('color'); //data-color为前景色，bgcolor为背景色，或者无背景文字的前景色
			var bgcolor = $(this).css('backgroundColor');
			changeColor(bgcolor);
			if(!color)  color = '#FFF';
			//setBackgroundColor(bgcolor,color, true);
			if( ! current_active_item ) {
				$('.template-list li > .ks-editor').each(function(){
					parseObject($(this),bgcolor,color);
				})
			}
		});
		
		function testAjax() {
			$.ajax({
				type: "get",
				url: '${ctx}/text.html',
				data: {},
				dataType: 'html',
				beforeSend: function(XMLHttpRequest){
				},
				success: function(data, textStatus){
					console.info(data);
				}
			});
		}
	</script>
</body>
</html>
