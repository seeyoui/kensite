<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/taglib/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" class="g_htmlManage">
  
  <head>
    <title>智慧星河</title>
	<%@ include file="/WEB-INF/view/taglib/header.jsp" %>
	<%
		String popupID = request.getParameter("popupID");
	%>
	<meta name="renderer" content="webkit"/>
    <meta name="mobile-agent" content="format=html5;url=http://m.seeyoui.icoc.in/"/>
	<link href="${ctx_web}/css/manage.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${ctx_web}/js/comm/jquery/jquery-core.min.js?v=201503161711"></script>
	<script type="text/javascript" src="${ctx_web}/js/comm/fai.min.js?v=201512071738"></script>
	<script type="text/javascript" src="${ctx_web}/js/comm/jquery/jquery-ui-core.min.js?v=201511231730"></script>
	<script type="text/javascript" src="${ctx_web}/js/comm/pinyin.min.js?v=201306041217"></script>
	<script type="text/javascript" src="${ctx_web}/js/comm/faiui.min.js?v=201601111801"></script>
	<script type="text/javascript" src="${ctx_web}/js/site.min.js?v=201601131153"></script>
	<script type="text/javascript" src="${ctx_web}/js/manage.min.js?v=201601121610"></script>
    <script type="text/javascript">
	try {
		Fai.top = parent.Fai.top;
	} catch (e) {
	}
	</script>

<script type="text/javascript">

var save_banner_type = top._bannerData.bt;
var showTip = true;
var popupID = <%=popupID%>;
function refreshBannerCus() {
	var swicthInterval = parseFloat($("#swicthInterval").val());
	if (!swicthInterval || swicthInterval < 1 || swicthInterval > 100) {
		$('#tabs').tabs({ selected:2 });
		$("#swicthInterval").focus();
		alert("请输入1-100秒的展示时间。");
		return false;
	}
	
	swicthInterval = swicthInterval * 1000;
	
	var swicthAnimate = parseFloat($("#swicthAnimate").val());
	if (!swicthAnimate || swicthAnimate < 0.1 || swicthAnimate > 100) {
		$('#tabs').tabs({ selected:2 });
		$("#swicthAnimate").focus();
		alert("请输入0.1-100秒的切换速度。");
		return false;
	}	

	swicthAnimate = swicthAnimate * 1000;
	top._bannerData.a = swicthAnimate;

	top._bannerData.h = false;
	top._bannerData.i = swicthInterval;
	top._bannerData.bt = save_banner_type;

	Site.refreshBanner();
	top._bannerChanged++;
	Site.styleChanged();
	Site.setRefreshInfo("moduleSetting", true);
	return true;
}

function save(){
	if (!refreshBannerCus()) {
		return;
	}
	Fai.closePopupWindow(popupID);
}

$(function(){
	Fai.addPopupWindowBtn(popupID, {id:'close', text:'确 定', extClass:'saveButton', click:save});
	// 初始化横幅轮播时间
	$("#swicthInterval").val(parseFloat(top._bannerData.i) / 1000);
	$("#swicthAnimate").val(parseFloat(top._bannerData.a) / 1000);
	
	$('#tabs').tabs({ selected:0 });

	$(".imgBorder").hover(function(){
			$(this).addClass("imgBorderHover");
		},function(){
			$(this).removeClass("imgBorderHover");
		});

	$(".slideLabel").click(function(){
		$(this).prev().click();
	});
	

	$("#basicSetting .imgBorder").click(function(){
			$("#basicSetting .imgBorder").removeClass("imgBorderDown");
			$(this).addClass("imgBorderDown");
			var img_id = $(this).attr("id");
			if(img_id == "numSilde" ){
				save_banner_type = 1;
			}else if(img_id == "dotSilde"){
				save_banner_type = 2;
			}else{
				save_banner_type = 0;				
			}
			top._bannerData.bt = save_banner_type;

			Site.refreshBanner();
			top._bannerChanged++;
			Site.styleChanged();
			Site.setRefreshInfo("moduleSetting", true);
		});
	var btn_type = top._bannerData.bt;
	if(btn_type == 0){		//箭头滑动
		$("#arrowSilde").addClass("imgBorderDown");
	}
	else if(btn_type == 1){		//数字滑动
		$("#numSilde").addClass("imgBorderDown");
		
	}
	else{					//圆点滑动
		$("#dotSilde").addClass("imgBorderDown");
		
	}
	
	//横幅切换动画
	var effect_type = top._bannerData.at;
	$(".effect_img"+effect_type).parent().addClass("imgBorderDown");
	
	$("#animationSetting .imgBorder").click(function(){
		if(showTip && top._bannerData.n && top._bannerData.n.length < 2){
			showTip = false;
			Fai.ing("添加多张横幅后生效", true);
		}
		
		$("#animationSetting .imgBorder").removeClass("imgBorderDown");
		$(this).addClass("imgBorderDown");
		var animationType = parseInt($(this).attr("effectid"));
		top._bannerData.at = animationType || 0;
		
		Site.logDog(100093, 0);
		Site.logDog(100093, top._bannerData.at + 10000);

		Site.refreshBanner();
		top._bannerChanged++;
		Site.styleChanged();
		Site.setRefreshInfo("moduleSetting", true);
	});
	
	$(".effectLabel").click(function(){
		$(this).prev().click();
	});
	
	Site.scrollToDiv(Fai.top.$('#banner'));		//滚动条自动滚回横幅位置，方便观察样式变化
});


	



</script>
<style type="text/css">
	.popupTabBody .ui-tabs .ui-tabs-panel{padding: 10px 0px 0px 20px;}
	.slide_img{width:125px;height:72px;margin:4px;}
	.slide{float:left; margin: 15px 36px 0 8px;}
	.imgBorder{border:1px solid #eaebef; margin:1px 1px 1px 3px;cursor:pointer;_padding-top:4px;_padding-bottom:4px;}
	.imgBorderHover{border:2px solid #7bcaff; margin:0 0 0 2px;_padding-bottom:3px;}
	.imgBorderDown{border:2px solid #7bcaff; margin:0 0 0 2px;_padding-bottom:3px;}
	#arrowSilde .slide_img{ background:url("${ctx_web}/image/site/arrowSlide.jpg?v=20140618");}
	#numSilde .slide_img{background:url("${ctx_web}/image/site/numSlide.jpg?v=20140618");}
	#dotSilde .slide_img{background:url("${ctx_web}/image/site/dotSlide.jpg?v=20140618");}
	.slideLabel{color:#aaa;font-family:"Miscrosoft YaHei";font-size:12px;float:left; padding-top:8px; margin-left:45px;_margin-left:25px;cursor:pointer;}
	.animationSetting{height:524px;overflow:auto;}
	.effect{float:left; margin: 15px 14px 0 8px;}
	.effect_img{width:133px;height:80px;}
	.effectLabel{color:#aaa;font-family:"Miscrosoft YaHei";font-size:12px;padding-top:8px;text-align:center;cursor:pointer;}
	.effect_img{background-image:url(${ctx_web}/image/site/animation.png?v=201507201038);}
	.effect_img0{background-position:0 0;}
	.effect_img1{background-position:0 -166px;}
	.effect_img2{background-position:0 -251px;}
	.effect_img3{background-position:0 -336px;}
	.effect_img4{background-position:0 -846px;}
	.effect_img5{background-position:0 -931px;}
	.effect_img6{background-position:0 -421px;}
	.effect_img7{background-position:0 -506px;}
	.effect_img8{background-position:0 -761px;}
	.effect_img9{background-position:0 -676px;}
	.effect_img10{background-position:0 -1016px;}
	.effect_img11{background-position:0 -1101px;}
	.effect_img12{background-position:0 -1186px;}
	.effect_img13{background-position:0 -82px;}
	
</style>


</head>
<body class="popupTabBody">
<div class="ui-tabs ui-widget ui-widget-content ui-corner-all" id="tabs">
	<!--tabs titles-->
	<ul class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all">
       
        <li class="ui-state-default ui-corner-top ui-tabs-selected ui-state-active"><a href="#basicSetting">常规</a></li>
		<li class="ui-state-default ui-corner-top"><a href="#animationSetting">切换动画</a></li>
    	<li class="ui-state-default ui-corner-top"><a href="#topSetting">高级</a></li>
        
	</ul>
    <!--tabs titles-->

    <!-- 常规设置 -->
    <div class="ui-tabs-panel ui-widget-content ui-corner-bottom" id="basicSetting">
    	
		<div style="width:100%; clear:both; height:auto; ">
			<div style="padding-top:15px;padding-left:10px;margin-bottom:1px;_padding-left:20px;">切换样式：</div>
			<div>
				<div class="slide">
					<div id="numSilde" class="imgBorder imgBorderDown"><div class="slide_img"></div></div>
					<div class="slideLabel">数字轮播</div>
				</div>
				<div class="slide">
					<div id="dotSilde" class="imgBorder"><div class="slide_img"></div></div>
					<div class="slideLabel">圆点切换</div>
				</div>
				<div class="slide">
					<div id="arrowSilde" class="imgBorder"><div class="slide_img"></div></div>
					<div class="slideLabel">箭头滑动</div>
				</div>
			</div>
			<div class="clearfloat"></div>
		</div>
	</div>
	<!-- 常规设置 -->
	
	<!-- 特效设置 -->
    <div id="animationSetting" class="animationSetting ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide">
    	
		<div style="width:100%; clear:both; height:auto; ">
			<div style="padding-top:15px;padding-left:10px;margin-bottom:1px;_padding-left:20px;">切换动画：</div>
			<div>

				<div class="effect">
					<div class="imgBorder" effectid="0"><div class="effect_img effect_img0"></div></div>
					<div class="effectLabel">默认</div>
				</div>

				<div class="effect">
					<div class="imgBorder imgBorderDown" effectid="1"><div class="effect_img effect_img1"></div></div>
					<div class="effectLabel">淡入淡出</div>
				</div>

				<div class="effect">
					<div class="imgBorder" effectid="2"><div class="effect_img effect_img2"></div></div>
					<div class="effectLabel">水平滑动</div>
				</div>

				<div class="effect">
					<div class="imgBorder" effectid="3"><div class="effect_img effect_img3"></div></div>
					<div class="effectLabel">垂直滑动</div>
				</div>

				<div class="effect">
					<div class="imgBorder" effectid="4"><div class="effect_img effect_img4"></div></div>
					<div class="effectLabel">水平翻转</div>
				</div>

				<div class="effect">
					<div class="imgBorder" effectid="5"><div class="effect_img effect_img5"></div></div>
					<div class="effectLabel">垂直翻转</div>
				</div>

				<div class="effect">
					<div class="imgBorder" effectid="6"><div class="effect_img effect_img6"></div></div>
					<div class="effectLabel">水平3D翻转</div>
				</div>

				<div class="effect">
					<div class="imgBorder" effectid="7"><div class="effect_img effect_img7"></div></div>
					<div class="effectLabel">垂直3D翻转</div>
				</div>

				<div class="effect">
					<div class="imgBorder" effectid="8"><div class="effect_img effect_img8"></div></div>
					<div class="effectLabel">水平魔方旋转</div>
				</div>

				<div class="effect">
					<div class="imgBorder" effectid="9"><div class="effect_img effect_img9"></div></div>
					<div class="effectLabel">垂直魔方旋转</div>
				</div>

				<div class="effect">
					<div class="imgBorder" effectid="10"><div class="effect_img effect_img10"></div></div>
					<div class="effectLabel">风车翻转</div>
				</div>

				<div class="effect">
					<div class="imgBorder" effectid="11"><div class="effect_img effect_img11"></div></div>
					<div class="effectLabel">聚焦</div>
				</div>

				<div class="effect">
					<div class="imgBorder" effectid="12"><div class="effect_img effect_img12"></div></div>
					<div class="effectLabel">分区聚焦</div>
				</div>

				<div class="effect">
					<div class="imgBorder" effectid="13"><div class="effect_img effect_img13"></div></div>
					<div class="effectLabel">随机</div>
				</div>

			</div>
			<div class="clearfloat"></div>
		</div>
	</div>
	<!-- 特效设置 -->

	<!-- 高级设置 -->
	<div class="ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide" id="topSetting">
		 
		<div style="width:100%; clear:both; height:auto;">
			<div style="line-height:35px;height:35px;margin-left:25px;margin-top:10px;">
				<div style="float:left;">横幅展示时间：</div><div style="float:left;*padding-top:5px;"><input value="4" id="swicthInterval" style="width:30px;" type="text"></div><div style="float:left;">&nbsp;秒</div>
			</div>
			<div id="switchSpeedDiv" style="line-height:35px;height:35px;margin-left:25px;margin-top:10px;">
				<div style="float:left;">横幅切换速度：</div><div style="float:left;*padding-top:5px;"><input value="1.5" id="swicthAnimate" style="width:30px;" type="text"></div><div style="float:left;">&nbsp;秒</div>
			</div>
			<div class="clearfloat"></div>
		</div>
	</div>
	<!-- 高级设置 -->
	<div class="clearfloat"></div>
</div>


</body></html>