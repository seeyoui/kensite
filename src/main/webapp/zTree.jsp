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
	<%@ include file="/WEB-INF/view/taglib/zTree.jsp" %>
	<script type="text/javascript">
		var setting = {
			data: {
				key: {
					name: "ename"
				},
				simpleData: {
					enable: true,
					idKey: 'a',
					pIdKey: 'b'
				}
			}
		};

		var zNodes =[
			{ a:1, b:99, ename:"展开、折叠 自定义图标不同", open:true, iconSkin:"pIcon01"},
			{ a:11, b:1, ename:"叶子节点1", iconSkin:"icon01"},
			{ a:12, b:1, ename:"叶子节点2", iconSkin:"icon02"},
			{ a:13, b:1, ename:"叶子节点3", iconSkin:"icon03"},
			{ a:2, b:0, ename:"展开、折叠 自定义图标相同", open:true, iconSkin:"pIcon02"},
			{ a:21, b:2, ename:"叶子节点1", iconSkin:"icon04"},
			{ a:22, b:2, ename:"叶子节点2", iconSkin:"icon05"},
			{ a:23, b:2, ename:"叶子节点3", iconSkin:"icon06"},
			{ a:3, b:0, ename:"不使用自定义图标", open:true },
			{ a:31, b:3, ename:"叶子节点1"},
			{ a:32, b:3, ename:"叶子节点2"},
			{ a:33, b:3, ename:"叶子节点3"}
		];

		$(document).ready(function(){
			$.fn.zTree.init($("#treeDemo"), setting, zNodes);
		});
	</script>
	<style type="text/css">
		.ztree li span.button.pIcon01_ico_open{margin-right:2px; background: url(${ctx_script}/zTree/css/zTreeStyle/img/diy/1_open.png) no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle}
		.ztree li span.button.pIcon01_ico_close{margin-right:2px; background: url(${ctx_script}/zTree/css/zTreeStyle/img/diy/1_close.png) no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle}
		.ztree li span.button.pIcon02_ico_open, .ztree li span.button.pIcon02_ico_close{margin-right:2px; background: url(${ctx_script}/zTree/css/zTreeStyle/img/diy/2.png) no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle}
		.ztree li span.button.icon01_ico_docu{margin-right:2px; background: url(${ctx_script}/zTree/css/zTreeStyle/img/diy/3.png) no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle}
		.ztree li span.button.icon02_ico_docu{margin-right:2px; background: url(${ctx_script}/zTree/css/zTreeStyle/img/diy/4.png) no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle}
		.ztree li span.button.icon03_ico_docu{margin-right:2px; background: url(${ctx_script}/zTree/css/zTreeStyle/img/diy/5.png) no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle}
		.ztree li span.button.icon04_ico_docu{margin-right:2px; background: url(${ctx_script}/zTree/css/zTreeStyle/img/diy/6.png) no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle}
		.ztree li span.button.icon05_ico_docu{margin-right:2px; background: url(${ctx_script}/zTree/css/zTreeStyle/img/diy/7.png) no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle}
		.ztree li span.button.icon06_ico_docu{margin-right:2px; background: url(${ctx_script}/zTree/css/zTreeStyle/img/diy/8.png) no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle}
	</style>
</head>

<body>
	<div class="zTreeDemoBackground left">
		<ul id="treeDemo" class="ztree"></ul>
	</div>
</body>
</html>
