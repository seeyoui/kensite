<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/taglib/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" class="g_htmlManage">
  
  <head>
    <title>智慧星河</title>
	<%@ include file="/WEB-INF/view/taglib/header.jsp" %>
	<meta name="renderer" content="webkit"/>
    <meta name="mobile-agent" content="format=html5;url=http://m.seeyoui.icoc.in/"/>
    <%@ include file="/WEB-INF/view/taglib/webPortal.jsp" %>
<script type="text/javascript">
try {
	Fai.top = parent.Fai.top;
} catch (e) {
}
</script>
<link href="${ctx_web}/css/bannerEffects.css" type="text/css" rel="stylesheet">
<script type="text/javascript">
var text2Color = "#FFFFFF";
var text1Color = "#000000";
var g_init = false;
var verify = false;

$(function(){
	var styleDesignHeight = ~~($.cookie( 'styleDesignHeight', { path:'/'} ));
	if(styleDesignHeight > 100){
		var tabsHeight = Fai.top.$("#styleDesign").children(".tabsWrap").height() || 37;
		var panelsHeight = styleDesignHeight - tabsHeight;
		var effectHeight = panelsHeight - 36;
		$("#animationEffects").height(effectHeight+"px");
		$("#textEffects").height(effectHeight+"px");
		$("#customEffects").height(effectHeight+"px");
	}
	
	//当拖动设置面板调节显示区高度时，触发
	Site.bindGobalEvent("styleDesignResize", function(event, option){
		var effectHeight = option - 36;
		$("#animationEffects").height(effectHeight+"px");
		$("#textEffects").height(effectHeight+"px");
		$("#customEffects").height(effectHeight+"px");
	});
	
	// 初始化选中和类型
	initEffects();
	
	// 初始化位置
	//$('#positionCheck').val(top._bannerData.p);
	var positionCheckList = new Array();
	{
		positionCheckList.push({label:"默认", key:0});
		positionCheckList.push({label:"靠左", key:1});
		positionCheckList.push({label:"靠右", key:2});
		positionCheckList.push({label:"自定义", key:3});
	}
	var positionCheckVal = "默认";
	switch(top._bannerData.p){
		case 1: positionCheckVal = "靠左";break;
		case 2: positionCheckVal = "靠右";break;
		case 3: positionCheckVal = "自定义";break;
		default: break;
	}
	var positionCheckKey = -1;
	$('#positionCheck').combobox({readonly:true, source:positionCheckList, initVal:positionCheckVal, initKey:positionCheckKey, select:positionChange});
	
	if ( top._bannerData.p == 3 ) {
		var effectPositionLeft = top._templateBannerData.pl;
		var effectPositionTop = top._templateBannerData.pt;
		$("#effectPositionTop").val(effectPositionTop);
		$("#effectPositionLeft").val(effectPositionLeft);
	} else {
		$("#effPositionWrap").hide();
	}
	$('#advancedFilter').hide();
	if ( top._bannerData.p != 0 ){
		advancedFilterShow();
	}
	
	//自动将选取的横幅滚动到可视区域
	var divList = new Array("animationEffects", "textEffects", "customEffectsListBody");
	Site.bindGobalEvent("showSelectedEffectBanner", function(event, str){
		var divIndex = $(".menu a.typeCheck").index();
		var $effectDiv = $("#"+divList[divIndex-1]); //滚动条所在div
		var effectId = $effectDiv.find('.effectsDiv.effectsCheck').attr("id"); //当前选中的元素Id
		if( effectId != undefined ){
			//超出顶部
			if( $effectDiv.scrollTop() > ($('#'+effectId).offset().top + $('#'+effectId).outerHeight()) ){
				$effectDiv.scrollTop( ($('#'+effectId).offset().top - $('#'+effectId).height()) );
			}
			//超出底部
			if( ($effectDiv.scrollTop() + $effectDiv.height() ) < $('#'+effectId).offset().top ){
				$effectDiv.scrollTop( ($('#'+effectId).offset().top - $('#'+effectId).height())  );
			}
		}
		
	});
	
		
		
	
	$('#basicSetting').on("click", ".closeEff", function(){
		Fai.removeIng();
		top._bannerData.o = false;
		$('.effectsTitle').hide();
		var eId = $('.effectsDiv.effectsCheck').attr("id");
		if ( typeof eId != "undefined" ){
			eId = eId.replace(/[^\d]/g, "");
			$('#effects' + eId).find(".effectsImg").css("background", "url(${ctx_web}/image/template/bannerEffects/" + eId + ".jpg?v=201310162226) center no-repeat");
			$('#effects' + eId).removeClass("effectsCheck");
		}
		$('.closeEff').addClass("effectsCheck");;
		if (verify){
			$('#text1Info').hide();
			$('#text2Info').hide();
			$('#customEffectsListBody').css("height", 168);
		}
		onStyleChange();
		Site.triggerGobalEvent("showSelectedBanner","panelLibList");
	});
	
	$('#basicSetting').on("click", ".effectsDiv", function(){
		top._bannerData.o = true;
		$('.effectsTitle').hide();
		$(this).find('.effectsTitle').show();
		var oldId = $('.effectsDiv.effectsCheck').attr("id");
		if ( typeof oldId != "undefined" ){
			oldId = oldId.replace(/[^\d]/g, "");
			$('#effects' + oldId).find(".effectsImg").css("background", "url(${ctx_web}/image/template/bannerEffects/" + oldId + ".jpg?v=201310162226) center no-repeat");
			$('#effects' + oldId).removeClass("effectsCheck");
		} else {
			$('.closeEff').removeClass("effectsCheck");
		}
		var newId = $(this).attr("id").replace(/[^\d]/g, "");
		$(this).addClass("effectsCheck");
		$(this).find(".effectsImg").css("background", "url(${ctx_web}/image/template/bannerEffects/" + newId + ".gif?v=201310162226) center no-repeat");
		
		if($(this).attr("verify") == "true"){
			verify = true;
			$('#customEffectsListBody').css("height", 118);
			$("#text1Info").show();
			$("#text2Info").show();
			$("#colorSelect2Div").width('auto');
			$("#colorSelect2Label").html("&nbsp;&nbsp;颜色：");
			if( $(this).attr("singleLine") != "true" ){
				$("#text2Info div").show();
			}else{
				$("#text2Info div").hide();
				if( $(this).attr("mask") == "true" ){
					$("#sczDiv2").show();
					$("#sczDiv2 div").hide();
					$("#colorSelect2Label").html("特效颜色：");
					if ( Fai.isIE6() || Fai.isIE7() ){
						$("#colorSelect2Div").width(373);
					} else {
						$("#colorSelect2Div").width(375);
					}
					$("#colorSelect2Div").show();
					$("#colorSelect2").show();	
				}
			}
		}else{
			$('#customEffectsListBody').css("height", 168);
			$("#text1Info").hide();
			$("#text2Info").hide();
			verify = false;
		}
		var eId = $(this).attr("id").replace(/[^\d]/g, "");
		top._bannerData.t = parseInt(eId);
		Site.logDog(100046, top._bannerData.t + 1000);
		
		if( $(this).attr("verify") == "true" && top._bannerData.o ){
			top._bannerData.ce.t1 = $("#text1").val();
			top._bannerData.ce.c1 = text1Color;
			top._bannerData.ce.sz1 = $("#sizeSelect1").val();
			top._bannerData.ce.s1 = $('#style1').val();
			top._bannerData.ce.t2 = $("#text2").val();
			top._bannerData.ce.c2 = text2Color;
			top._bannerData.ce.sz2 = $("#sizeSelect2").val();
			top._bannerData.ce.s2 = $('#style2').val();
			
			if( typeof(top._bannerData.ce.t1)!='string' || '' == top._bannerData.ce.t1 ){
				Fai.ing('请输入文字1',true);
				$("#text1").val("自定义文字1");
				$("#text1").focus();
				return;
			}
			if( typeof(top._bannerData.ce.t2)!='string' || '' == top._bannerData.ce.t2 ){
				Fai.ing('请输入文字2',true);
				$("#text1").val("自定义文字2");
				$("#text2").focus();
				return;
			}
		}
					
		onStyleChange();
		Site.triggerGobalEvent("showSelectedBanner","panelLibList");
	});
	
	$('#basicSetting').on("mouseover", ".closeEff", function(){
		if ( $(this).hasClass("effectsCheck") ){return;}
		$(this).find(".effectsImg").addClass("effectsImgHover");
	}).on("mouseleave", ".closeEff", function(){
		if ( $(this).hasClass("effectsCheck") ){return;}
		$(this).find(".effectsImg").removeClass("effectsImgHover");
	});
	
	$('#basicSetting').on("mouseover", ".effectsDiv", function(){
		if ( $(this).hasClass("effectsCheck") ){return;}
		var eId = $(this).attr("id").replace(/[^\d]/g, "");
		$(this).find(".effectsImg").css("background", "url(${ctx_web}/image/template/bannerEffects/" + eId + ".gif?v=201310162226) center no-repeat").addClass("effectsImgHover");;
		$(this).find('.effectsTitle').show();
	}).on("mouseleave", ".effectsDiv", function(){
		if ( $(this).hasClass("effectsCheck") ){
			//check的，去掉hover的效果
			$(this).find(".effectsImg").removeClass("effectsImgHover");
			return;
		}
		var eId = $(this).attr("id").replace(/[^\d]/g, "");
		$(this).find(".effectsImg").css("background", "url(${ctx_web}/image/template/bannerEffects/" + eId + ".jpg?v=201310162226) center no-repeat").removeClass("effectsImgHover");
		$(this).find('.effectsTitle').hide();
	});
	
	$('#effectsSearch').keyup(function(){
		var items = $('.effectsDiv'); // cache
		var closeDiv = $('.closeEff');
		var _input = $(this);
		var _search_input = $.trim(_input.val());
		var clearSearch = $('#clearSearch');
		
		if( _search_input != '' ){
			if( !clearSearch.hasClass('find') ){
				clearSearch.removeClass('unfind').addClass('find').attr('title','清除输入');
			}
			
			$('.typeChange').removeClass("typeCheck");
			$('#text1Info').hide();
			$('#text2Info').hide();
			items.hide();
			closeDiv.hide();
			
			var _search_id = _search_input.toUpperCase();
			if(/^[e]?\d+$/i.test(_search_input)){
				$.each( items, function( i, itemdom ){
					var item_id = $(itemdom).attr("id").replace(/[^\d]/g, "");
					for (var i=0;item_id.length<3;i++){
						item_id = "0" + item_id;
					}
					if(_search_id.charAt(0) == 'E'){
						_search_id = _search_id.replace("E", "");
					}
					for (var i=0;_search_id.length<3;i++){
						_search_id = "0" + _search_id;
					}
					if( item_id && item_id == _search_id ){
						if ( $(itemdom).attr("verify") ){
							$('#customEffects').show();
							if ( Fai.isIE6 || Fai.isIE7 ){//在IE6,7下  css会有影像残留，需刷新生效
								setTimeout(function() {		
									Fai.refreshClass($('#customEffects'));
								}, 0);
							}
							$('#animationEffects').hide();
							$('#textEffects').hide();
						} else if ( $(itemdom).attr("iseffect") ) {
							$('#textEffects').hide();
							$('#customEffects').hide();
							$('#animationEffects').show();
							if ( Fai.isIE6 || Fai.isIE7 ){//在IE6,7下  css会有影像残留，需刷新生效
								setTimeout(function() {		
									Fai.refreshClass($('#animationEffects'));
								}, 0);
							}
						} else if ( $(itemdom).attr("istext") ) {
							$('#textEffects').show();
							if ( Fai.isIE6 || Fai.isIE7 ){//在IE6,7下  css会有影像残留，需刷新生效
								setTimeout(function() {		
									Fai.refreshClass($('#textEffects'));
								}, 0);
							}
							$('#animationEffects').hide();
							$('#customEffects').hide();
						}
						
						$(itemdom).show();
						return;
					}
				});
			}
		} else {
			clearSearch.removeClass('find').removeClass('unfind').removeAttr('title');
			closeDiv.show();
			items.show();
			initEffects();
		}
	});	
	
	
	$("#clearSearch").click(function(){
		var _me  = $(this);
		if(_me.hasClass('find')){
			var _input = $("#effectsSearch").val();
			if(_input!=''){
				_me.removeClass('find').removeClass('unfind').removeAttr('title');
				$("#effectsSearch").val('');
				$('#text1Info').hide();
				$('#text2Info').hide();
				$('.typeChange').removeClass("typeCheck");
				$('.closeEff').show();
				$('.effectsDiv').show();
				initEffects();
			}					 
		}	
		return false;
	});
	
	var sizeSeleHtm = "";
	for( var i = 20; i <= 80; i = i+5 ){
		sizeSeleHtm = sizeSeleHtm + "<option value='" + i + "'>" + i + "</option>";
	}
	$('#sizeSelect1').html( sizeSeleHtm );
	$('#sizeSelect2').html( sizeSeleHtm );
	
	$("#text1").on("focusout",function(){
		var text1 = $(this).val();
		if( typeof(text1) == 'undefined' || text1 == '' ){
			Fai.ing('请输入文字1',true);
			$(this).val("自定义文字1");
			this.focus();
			return;
		}
		if( text1.length > 20 ){
			Fai.ing('文字1长度超出限制。',true);
			this.focus();
			return;
		}
		top._bannerData.ce.t1 = text1;
		if( !g_init ){
			return;
		}
		if( verify ){
			onStyleChange();
		}else{
			Fai.ing('请先选择以下自定义特效中的一个。',true);
		}
	});
	
	$("#text2").on("focusout",function(){
		var text2 = $(this).val();
		if( typeof(text2) == 'undefined' || text2 == '' ){
			Fai.ing('请输入文字2',true);
			$(this).val("自定义文字2");
			this.focus();
			return;
		}
		if( text2.length > 20 ){
			Fai.ing('文字2长度超出限制。',true);
			this.focus();
			return;
		}
		top._bannerData.ce.t2 = text2;
		if( !g_init ){
			return;
		}
		if( verify ){
			onStyleChange();
		}else{
			Fai.ing('请先选择以下自定义特效中的一个。',true);
		}
		
	});
	
	$('#style1').on("change",function(){
		top._bannerData.ce.s1 = $(this).val();
		if( !g_init ){
			return;
		}
		if( verify ){
			onStyleChange();
		}else{
			Fai.ing('请先选择以下自定义特效中的一个。',true);
		}
		
		//2015-11-01 统计site字体使用频率 
		Site && Site.logFontFamilyUse && Site.logFontFamilyUse(top._bannerData.ce.s1);
	});
	
	$('#style2').on("change",function(){
		top._bannerData.ce.s2 = $(this).val();
		if( !g_init ){
			return;
		}
		if( verify ){
			onStyleChange();
		}else{
			Fai.ing('请先选择以下自定义特效中的一个。',true);
		}
		
		//2015-11-01 统计site字体使用频率 
		Site && Site.logFontFamilyUse && Site.logFontFamilyUse(top._bannerData.ce.s2);
	});
	
	$('#sizeSelect1').on("change",function(){
		top._bannerData.ce.sz1 = $(this).val();
		if( !g_init ){
			return;
		}
		if( verify ){
			onStyleChange();
		}else{
			Fai.ing('请先选择以下自定义特效中的一个。',true);
		}
	});
	
	$('#sizeSelect2').on("change",function(){
		top._bannerData.ce.sz2 = $(this).val();
		if( !g_init ){
			return;
		}
		if( verify ){
			onStyleChange();
		}else{
			Fai.ing('请先选择以下自定义特效中的一个。',true);
		}
	});
	
	if( typeof(top._bannerData.ce.t1) == 'string' && '' != top._bannerData.ce.t1 ){
		$("#text1").val( top._bannerData.ce.t1 );
	}else{
		$("#text1").val( '自定义文字1' );
	}
	
	if( typeof(top._bannerData.ce.t2) == 'string' && '' != top._bannerData.ce.t2 ){
		$("#text2").val( top._bannerData.ce.t2 );
	}else{
		$("#text2").val( '自定义文字2' );
	}
	
	if( typeof(top._bannerData.ce.c1) == 'string' && '' != top._bannerData.ce.c1 ){
		text1Color = top._bannerData.ce.c1;
	}
	if( typeof(top._bannerData.ce.c2) == 'string' && '' != top._bannerData.ce.c2 ){
		text2Color = top._bannerData.ce.c2;
	}
	//$.showcolor('colorSelect1', onText1ColorChange, -35, 30, text1Color, true);
	//$.showcolor('colorSelect2', onText2ColorChange, -60, 30, text2Color, true);
   $("#colorSelect1").faiColorPicker({
        onchange:onText1ColorChange,
        defaultcolor:text1Color,
        showInTop:true,
        left:(Fai.top.$("#webBannerFrame").width()- $("body").width()+100)/2 ,
        top:Fai.top.$("#webBannerFrame").offset().top
    });
    $("#colorSelect2").faiColorPicker({
        onchange:onText2ColorChange,
        defaultcolor:text2Color,
        showInTop:true,
        left:(Fai.top.$("#webBannerFrame").width()- $("body").width()+100)/2,
        top:Fai.top.$("#webBannerFrame").offset().top
    });

	$('#style1').val( top._bannerData.ce.s1 );
	var size1 = 50;
	if( typeof(top._bannerData.ce.sz1) == 'string' && '' != top._bannerData.ce.sz1 ){
		size1 = parseInt( top._bannerData.ce.sz1 );
	}
	$('#sizeSelect1').val( size1 );
	$('#style2').val( top._bannerData.ce.s2 );
	var size2 = 30;
	if( typeof(top._bannerData.ce.sz2) == 'string' && '' != top._bannerData.ce.sz2 ){
		size2 = parseInt( top._bannerData.ce.sz2 );
	}
	$('#sizeSelect2').val( size2 );
	
	$("#advancedFilterBtn").hover(function(){
		if ( $('#advancedFilter').is(':visible') ){
			$(this).addClass("advFilLeft-hover")
		} else {
			$(this).addClass("advFilRight-hover");
		}
	}, function(){
		if ( $('#advancedFilter').is(':visible') ){
			$(this).removeClass("advFilLeft-hover");
		} else {
			$(this).removeClass("advFilRight-hover");
		}
	});
	
	g_init = true;
})

function initEffects(){
	if (top._bannerData.o) {
		var eId = top._bannerData.t;
		$('#effects' + eId).find('.effectsTitle').show();
		$('#effects' + eId).addClass("effectsCheck");
		$('#effects' + eId).find(".effectsImg").css("background", "url(${ctx_web}/image/template/bannerEffects/" + eId + ".gif?v=201310162226) center no-repeat");
		if ( $('#effects' + eId).attr("iseffect") ){
			$('#showAnimaEff').addClass("typeCheck");
			$('#animationEffects').scrollTop($('#effects' + eId)[0].offsetTop);
		} else if ( $('#effects' + eId).attr("istext") ){
			$('#showTestEff').addClass("typeCheck");
			$('#textEffects').scrollTop($('#effects' + eId)[0].offsetTop);
		} else if ( $('#effects' + eId).attr("verify") ){
			$('#showCusEff').addClass("typeCheck");
			$('#customEffectsListBody').scrollTop($('#effects' + eId)[0].offsetTop);
		}
		if ( $('#effects' + eId).attr("verify") ){
			$('#customEffectsListBody').css("height", 118);
			$('#customEffects').show();
			$('#animationEffects').hide();
			$('#textEffects').hide();
			verify = true;
			$("#text1Info").show();
			$("#text2Info").show();
			$("#colorSelect2Div").width('auto');
			$("#colorSelect2Label").html("&nbsp;&nbsp;颜色：");
			if( $('#effects' + eId).attr("singleLine") != "true" ){
				$("#text2Info div").show();
			}else{
				$("#text2Info div").hide();
				if( $('#effects' + eId).attr("mask") == "true" ){
					$("#sczDiv2").show();
					$("#sczDiv2 div").hide();
					$("#colorSelect2Label").html("特效颜色：");
					if ( Fai.isIE6() || Fai.isIE7() ){
						$("#colorSelect2Div").width(373);
					} else {
						$("#colorSelect2Div").width(375);
					}
					$("#colorSelect2Div").show();
					$("#colorSelect2").show();	
				}
			}
		} else if ( $('#effects' + eId).attr("iseffect") ) {
			$('#animationEffects').show();
			$('#textEffects').hide();
			$('#customEffects').hide();
		} else if ( $('#effects' + eId).attr("istext") ) {
			$('#textEffects').show();
			$('#animationEffects').hide();
			$('#customEffects').hide();
		}
	} else {
		$('#showAnimaEff').addClass("typeCheck");
		$('.closeEff').addClass("effectsCheck");
	}
}

function changeType(type) {
	$('.closeEff').show();
	$('.effectsDiv').show();
	clearText();
	switch(type){
		case 1: {
			Site.logDog(100046, 4);
			$('#animationEffects').show();
			if ( Fai.isIE6 || Fai.isIE7 ){//在IE6,7下  css会有影像残留，需刷新生效
				Fai.refreshClass($('#animationEffects'));
			}
			$('#animationEffects').scrollTop(0);
			$('#textEffects').hide();
			$('#customEffects').hide();
			$('.typeChange').removeClass("typeCheck");
			$('#showAnimaEff').addClass("typeCheck");
			break;
		}
		case 2: {
			Site.logDog(100046, 5);
			$('#animationEffects').hide();
			$('#textEffects').show();
			if ( Fai.isIE6 || Fai.isIE7 ){
				Fai.refreshClass($('#textEffects'));
			}
			$('#textEffects').scrollTop(0);
			$('#customEffects').hide();
			$('.typeChange').removeClass("typeCheck");
			$('#showTestEff').addClass("typeCheck");
			break;
		}
		case 3: {
			Site.logDog(100046, 6);
			$('#animationEffects').hide();
			$('#textEffects').hide();
			$('#customEffects').show();
			if ( Fai.isIE6 || Fai.isIE7 ){
				Fai.refreshClass($('#customEffects'));
			}
			$('#customEffectsListBody').scrollTop(0);
			$('.typeChange').removeClass("typeCheck");
			$('#showCusEff').addClass("typeCheck");
			break;
		}
		default: break;
	}
	
	Site.triggerGobalEvent( "showSelectedEffectBanner", "bannerEffectsFrame" );
	Site.triggerGobalEvent("showSelectedBanner","panelLibList");
}

function clearText(){
	var text = $("#effectsSearch").val();
	if(text!=''){
        $("#effectsSearch").val('');
		$("#clearSearch").removeClass('find').removeClass('unfind').removeAttr('title');
	}	
}

function positionChange(item) {
	var pcVal = parseInt(item.key);
	Site.logDog(100046, pcVal);
	if(pcVal == 3){
		$("#effPositionWrap").show();
		var effectPositionLeft = top._templateBannerData.pl;
		var effectPositionTop = top._templateBannerData.pt;
		$("#effectPositionTop").val(effectPositionTop);
		$("#effectPositionLeft").val(effectPositionLeft);
	}else{
		$("#effPositionWrap").hide();
	}
	top._bannerData.p = parseInt(pcVal);
	onStyleChange();
}

function onText1ColorChange(color) {
	text1Color = color;
	top._bannerData.ce.c1 = text1Color;
	if( verify ){
		onStyleChange();
	}else{
		Fai.ing('请先选择以下自定义特效中的一个。',true);
	}
}

function onText2ColorChange(color) {
	text2Color = color;
	top._bannerData.ce.c2 = text2Color;
	if( verify ){
		onStyleChange();
	}else{
		Fai.ing('请先选择以下自定义特效中的一个。',true);
	}
}

function onStyleChange() {
	if (!g_init) {
		return;
	}
	top._bannerChanged++;
	Site.styleChanged();
	Site.refreshBanner();
	Site.setRefreshInfo("siteBanner", true);
}

function effPositionTop(e){
	if(!Fai.isInteger($(e).val())){
		Fai.ing("请输入合法的数值！", true);
		$(e).val(100);
		top._bannerData.pt = 100;
		onStyleChange();
		return false;
	}
	var effectTop = parseInt($(e).val());
	
	if(effectTop < -160 || effectTop > 160){
		Fai.ing("最上位置在-160至160的范围内", true);
		return false;
	}
	top._bannerData.pt = effectTop;
	top.$("#effectShow").css("top", $(e).val()+"px");
	
	if(top._templateBannerData) {
		top._templateBannerData.pt = parseInt($(e).val());
	}
	onStyleChange();
}
function effPositionLeft(e){
	if(!Fai.isInteger($(e).val())){
		Fai.ing("请输入合法的数值！", true);
		$(e).val(30);
		top._bannerData.pl = 30;
		onStyleChange();
		return false;
	}
	var effectLeft = parseInt($(e).val());
	if(effectLeft < -600 || effectLeft > 1000){
		Fai.ing("最左位置在-600至1000的范围内", true);
		return false;
	}
	top._bannerData.pl = effectLeft;
	top.$("#effectShow").css("left", $(e).val()+"px");
	
	if(top._templateBannerData) {
		top._templateBannerData.pl = parseInt($(e).val());
	}
	onStyleChange();
}

function advancedFilterShow(){
	var advFil = $('#advancedFilter');
	if ( advFil.is(':visible') ){
		advFil.hide();
		$('#advancedFilterBtn').addClass('advFilRight').removeClass('advFilLeft').removeClass('advFilLeft-hover');
		$('#advancedFilterBtn').attr('title', '更多');
	} else {
		if ( g_init ){
			Site.logDog(100046, 7);
		}
		advFil.show();
		$('#advancedFilterBtn').addClass('advFilLeft').removeClass('advFilRight').removeClass('advFilRight-hover');
		$('#advancedFilterBtn').attr('title', '');
	}
}

</script>
</head>
<body style="overflow:hidden;">
<div id="basicSetting" class="bsBody">

    <div class="menu">
    	<div class="panelMenuTitle">
            类型
            <div class="panelMenuTitleIco"></div>
        </div>
        <a id="showAnimaEff" hidefocus="true" class="typeChange typeCheck" href="javascript:;" onclick="changeType(1)">动画特效</a>
        <a id="showTestEff" hidefocus="true" class="typeChange" href="javascript:;" onclick="changeType(2)">文字特效</a>
        <a id="showCusEff" hidefocus="true" class="typeChange" href="javascript:;" onclick="changeType(3)">自定义特效</a>
        <div style="display: none;" id="advancedFilter">
        	<div class="panelMenuTitle" style="margin-left:5px;">
                位置
                <div class="panelMenuTitleIco"></div>
            </div>
            <div id="positionCheck" class="positionCheck" style="line-height: 20px; width: 67px; position: relative; height: 20px;"><input value="默认" style="width: 64px;" readonly="readonly" aria-haspopup="true" aria-autocomplete="list" role="textbox" autocomplete="off" class="ui-autocomplete-input"><div class="autoCompleteButton" style="outline: medium none; position: absolute; left: 49px; top: 2px;" tabindex="-1">&nbsp;</div></div>
            <div style="display: none;" id="effPositionWrap" class="choiceCus">
                <span>左：</span><input id="effectPositionLeft" name="effectPositionLeft" style="width:40px;height:16px" onkeypress="javascript:return Fai.isNumberKey(event,true);" maxlength="4" onchange="effPositionLeft(this)" type="text">
                <span>上：</span><input id="effectPositionTop" name="effectPositionTop" style="width:40px;height:16px" onkeypress="javascript:return Fai.isNumberKey(event,true);" maxlength="4" onchange="effPositionTop(this)" type="text">
            </div>
            <div class="panelMenuTitle" style="margin-left:10px;">
                编号
                <div class="panelMenuTitleIco"></div>
            </div>
            <input id="effectsSearch" class="searchInput" maxlength="6" type="text">
            <span id="clearSearch" class="clearSearch unfind"></span>
        </div>
        <div id="advancedFilterBtn" class="advFilRight" onclick="advancedFilterShow()" title="更多"></div>
    </div>
    
    <!--    动画特效    -->
    <div id="animationEffects" style="padding-left:5px; height:168px; overflow-y:auto; position:relative; clear:both;">
        <div class="closeEff effectsCheck">
        	<div class="effectsImg"></div>
        </div>

        <div id="effects71" class="effectsDiv" iseffect="true">
            <div class="effectsImg" style="background: transparent url(&quot;${ctx_web}/image/template/bannerEffects/71.jpg?v=201310162226&quot;) no-repeat scroll center center;"></div>
            <div style="display: none;" class="effectsTitle">E071</div>
        </div>

        <div id="effects62" class="effectsDiv" iseffect="true">
            <div class="effectsImg" style="background:url(${ctx_web}/image/template/bannerEffects/62.jpg?v=201310162226) center no-repeat;"></div>
            <div class="effectsTitle">E062</div>
        </div>

        <div id="effects7" class="effectsDiv" iseffect="true">
            <div class="effectsImg" style="background: transparent url(&quot;${ctx_web}/image/template/bannerEffects/7.jpg?v=201310162226&quot;) no-repeat scroll center center;"></div>
            <div style="display: none;" class="effectsTitle">E007</div>
        </div>

        <div id="effects26" class="effectsDiv" iseffect="true">
            <div class="effectsImg" style="background: transparent url(&quot;${ctx_web}/image/template/bannerEffects/26.jpg?v=201310162226&quot;) no-repeat scroll center center;"></div>
            <div style="display: none;" class="effectsTitle">E026</div>
        </div>

        <div id="effects23" class="effectsDiv" iseffect="true">
            <div class="effectsImg" style="background: transparent url(&quot;${ctx_web}/image/template/bannerEffects/23.jpg?v=201310162226&quot;) no-repeat scroll center center;"></div>
            <div style="display: none;" class="effectsTitle">E023</div>
        </div>

        <div id="effects2" class="effectsDiv" iseffect="true">
            <div class="effectsImg" style="background:url(${ctx_web}/image/template/bannerEffects/2.jpg?v=201310162226) center no-repeat;"></div>
            <div class="effectsTitle">E002</div>
        </div>

        <div id="effects29" class="effectsDiv" iseffect="true">
            <div class="effectsImg" style="background:url(${ctx_web}/image/template/bannerEffects/29.jpg?v=201310162226) center no-repeat;"></div>
            <div class="effectsTitle">E029</div>
        </div>

        <div id="effects1" class="effectsDiv" iseffect="true">
            <div class="effectsImg" style="background:url(${ctx_web}/image/template/bannerEffects/1.jpg?v=201310162226) center no-repeat;"></div>
            <div class="effectsTitle">E001</div>
        </div>

        <div id="effects6" class="effectsDiv" iseffect="true">
            <div class="effectsImg" style="background:url(${ctx_web}/image/template/bannerEffects/6.jpg?v=201310162226) center no-repeat;"></div>
            <div class="effectsTitle">E006</div>
        </div>

        <div id="effects25" class="effectsDiv" iseffect="true">
            <div class="effectsImg" style="background:url(${ctx_web}/image/template/bannerEffects/25.jpg?v=201310162226) center no-repeat;"></div>
            <div class="effectsTitle">E025</div>
        </div>

        <div id="effects17" class="effectsDiv" iseffect="true">
            <div class="effectsImg" style="background:url(${ctx_web}/image/template/bannerEffects/17.jpg?v=201310162226) center no-repeat;"></div>
            <div class="effectsTitle">E017</div>
        </div>

        <div id="effects18" class="effectsDiv" iseffect="true">
            <div class="effectsImg" style="background:url(${ctx_web}/image/template/bannerEffects/18.jpg?v=201310162226) center no-repeat;"></div>
            <div class="effectsTitle">E018</div>
        </div>

        <div id="effects4" class="effectsDiv" iseffect="true">
            <div class="effectsImg" style="background:url(${ctx_web}/image/template/bannerEffects/4.jpg?v=201310162226) center no-repeat;"></div>
            <div class="effectsTitle">E004</div>
        </div>

        <div id="effects5" class="effectsDiv" iseffect="true">
            <div class="effectsImg" style="background:url(${ctx_web}/image/template/bannerEffects/5.jpg?v=201310162226) center no-repeat;"></div>
            <div class="effectsTitle">E005</div>
        </div>

        <div id="effects27" class="effectsDiv" iseffect="true">
            <div class="effectsImg" style="background:url(${ctx_web}/image/template/bannerEffects/27.jpg?v=201310162226) center no-repeat;"></div>
            <div class="effectsTitle">E027</div>
        </div>

        <div id="effects28" class="effectsDiv" iseffect="true">
            <div class="effectsImg" style="background:url(${ctx_web}/image/template/bannerEffects/28.jpg?v=201310162226) center no-repeat;"></div>
            <div class="effectsTitle">E028</div>
        </div>

        <div id="effects24" class="effectsDiv" iseffect="true">
            <div class="effectsImg" style="background:url(${ctx_web}/image/template/bannerEffects/24.jpg?v=201310162226) center no-repeat;"></div>
            <div class="effectsTitle">E024</div>
        </div>

        <div id="effects8" class="effectsDiv" iseffect="true">
            <div class="effectsImg" style="background:url(${ctx_web}/image/template/bannerEffects/8.jpg?v=201310162226) center no-repeat;"></div>
            <div class="effectsTitle">E008</div>
        </div>

        <div id="effects10" class="effectsDiv" iseffect="true">
            <div class="effectsImg" style="background:url(${ctx_web}/image/template/bannerEffects/10.jpg?v=201310162226) center no-repeat;"></div>
            <div class="effectsTitle">E010</div>
        </div>

        <div id="effects11" class="effectsDiv" iseffect="true">
            <div class="effectsImg" style="background:url(${ctx_web}/image/template/bannerEffects/11.jpg?v=201310162226) center no-repeat;"></div>
            <div class="effectsTitle">E011</div>
        </div>

        <div id="effects13" class="effectsDiv" iseffect="true">
            <div class="effectsImg" style="background:url(${ctx_web}/image/template/bannerEffects/13.jpg?v=201310162226) center no-repeat;"></div>
            <div class="effectsTitle">E013</div>
        </div>

        <div id="effects15" class="effectsDiv" iseffect="true">
            <div class="effectsImg" style="background:url(${ctx_web}/image/template/bannerEffects/15.jpg?v=201310162226) center no-repeat;"></div>
            <div class="effectsTitle">E015</div>
        </div>

        <div id="effects16" class="effectsDiv" iseffect="true">
            <div class="effectsImg" style="background:url(${ctx_web}/image/template/bannerEffects/16.jpg?v=201310162226) center no-repeat;"></div>
            <div class="effectsTitle">E016</div>
        </div>

        <div id="effects19" class="effectsDiv" iseffect="true">
            <div class="effectsImg" style="background:url(${ctx_web}/image/template/bannerEffects/19.jpg?v=201310162226) center no-repeat;"></div>
            <div class="effectsTitle">E019</div>
        </div>

        <div id="effects20" class="effectsDiv" iseffect="true">
            <div class="effectsImg" style="background:url(${ctx_web}/image/template/bannerEffects/20.jpg?v=201310162226) center no-repeat;"></div>
            <div class="effectsTitle">E020</div>
        </div>

        <div id="effects21" class="effectsDiv" iseffect="true">
            <div class="effectsImg" style="background:url(${ctx_web}/image/template/bannerEffects/21.jpg?v=201310162226) center no-repeat;"></div>
            <div class="effectsTitle">E021</div>
        </div>

        <div id="effects22" class="effectsDiv" iseffect="true">
            <div class="effectsImg" style="background:url(${ctx_web}/image/template/bannerEffects/22.jpg?v=201310162226) center no-repeat;"></div>
            <div class="effectsTitle">E022</div>
        </div>

        <div id="effects30" class="effectsDiv" iseffect="true">
            <div class="effectsImg" style="background:url(${ctx_web}/image/template/bannerEffects/30.jpg?v=201310162226) center no-repeat;"></div>
            <div class="effectsTitle">E030</div>
        </div>

        <div id="effects31" class="effectsDiv" iseffect="true">
            <div class="effectsImg" style="background:url(${ctx_web}/image/template/bannerEffects/31.jpg?v=201310162226) center no-repeat;"></div>
            <div class="effectsTitle">E031</div>
        </div>

        <div id="effects32" class="effectsDiv" iseffect="true">
            <div class="effectsImg" style="background:url(${ctx_web}/image/template/bannerEffects/32.jpg?v=201310162226) center no-repeat;"></div>
            <div class="effectsTitle">E032</div>
        </div>

        <div id="effects33" class="effectsDiv" iseffect="true">
            <div class="effectsImg" style="background:url(${ctx_web}/image/template/bannerEffects/33.jpg?v=201310162226) center no-repeat;"></div>
            <div class="effectsTitle">E033</div>
        </div>

        <div id="effects34" class="effectsDiv" iseffect="true">
            <div class="effectsImg" style="background:url(${ctx_web}/image/template/bannerEffects/34.jpg?v=201310162226) center no-repeat;"></div>
            <div class="effectsTitle">E034</div>
        </div>

        <div id="effects57" class="effectsDiv" iseffect="true">
            <div class="effectsImg" style="background:url(${ctx_web}/image/template/bannerEffects/57.jpg?v=201310162226) center no-repeat;"></div>
            <div class="effectsTitle">E057</div>
        </div>

        <div id="effects58" class="effectsDiv" iseffect="true">
            <div class="effectsImg" style="background:url(${ctx_web}/image/template/bannerEffects/58.jpg?v=201310162226) center no-repeat;"></div>
            <div class="effectsTitle">E058</div>
        </div>

        <div id="effects59" class="effectsDiv" iseffect="true">
            <div class="effectsImg" style="background:url(${ctx_web}/image/template/bannerEffects/59.jpg?v=201310162226) center no-repeat;"></div>
            <div class="effectsTitle">E059</div>
        </div>

        <div id="effects60" class="effectsDiv" iseffect="true">
            <div class="effectsImg" style="background:url(${ctx_web}/image/template/bannerEffects/60.jpg?v=201310162226) center no-repeat;"></div>
            <div class="effectsTitle">E060</div>
        </div>

        <div id="effects61" class="effectsDiv" iseffect="true">
            <div class="effectsImg" style="background:url(${ctx_web}/image/template/bannerEffects/61.jpg?v=201310162226) center no-repeat;"></div>
            <div class="effectsTitle">E061</div>
        </div>

        <div id="effects63" class="effectsDiv" iseffect="true">
            <div class="effectsImg" style="background:url(${ctx_web}/image/template/bannerEffects/63.jpg?v=201310162226) center no-repeat;"></div>
            <div class="effectsTitle">E063</div>
        </div>

        <div id="effects64" class="effectsDiv" iseffect="true">
            <div class="effectsImg" style="background:url(${ctx_web}/image/template/bannerEffects/64.jpg?v=201310162226) center no-repeat;"></div>
            <div class="effectsTitle">E064</div>
        </div>

        <div id="effects65" class="effectsDiv" iseffect="true">
            <div class="effectsImg" style="background:url(${ctx_web}/image/template/bannerEffects/65.jpg?v=201310162226) center no-repeat;"></div>
            <div class="effectsTitle">E065</div>
        </div>

        <div id="effects66" class="effectsDiv" iseffect="true">
            <div class="effectsImg" style="background:url(${ctx_web}/image/template/bannerEffects/66.jpg?v=201310162226) center no-repeat;"></div>
            <div class="effectsTitle">E066</div>
        </div>

        <div id="effects67" class="effectsDiv" iseffect="true">
            <div class="effectsImg" style="background:url(${ctx_web}/image/template/bannerEffects/67.jpg?v=201310162226) center no-repeat;"></div>
            <div class="effectsTitle">E067</div>
        </div>

        <div id="effects69" class="effectsDiv" iseffect="true">
            <div class="effectsImg" style="background:url(${ctx_web}/image/template/bannerEffects/69.jpg?v=201310162226) center no-repeat;"></div>
            <div class="effectsTitle">E069</div>
        </div>

        <div id="effects70" class="effectsDiv" iseffect="true">
            <div class="effectsImg" style="background:url(${ctx_web}/image/template/bannerEffects/70.jpg?v=201310162226) center no-repeat;"></div>
            <div class="effectsTitle">E070</div>
        </div>

        
    </div>
    <!--    动画特效 end   -->
    <!--   文字特效   -->
    <div id="textEffects" style="padding-left:5px; height:168px;  overflow-y:auto; position:relative; display:none; clear:both;">
        <div class="closeEff effectsCheck">
        	<div class="effectsImg"></div>
        </div>

        <div id="effects35" class="effectsDiv" istext="true">
            <div class="effectsImg" style="background:url(${ctx_web}/image/template/bannerEffects/35.jpg?v=201310162226) center no-repeat;"></div>
            <div class="effectsTitle">E035</div>
        </div>

        <div id="effects36" class="effectsDiv" istext="true">
            <div class="effectsImg" style="background:url(${ctx_web}/image/template/bannerEffects/36.jpg?v=201310162226) center no-repeat;"></div>
            <div class="effectsTitle">E036</div>
        </div>

        <div id="effects37" class="effectsDiv" istext="true">
            <div class="effectsImg" style="background:url(${ctx_web}/image/template/bannerEffects/37.jpg?v=201310162226) center no-repeat;"></div>
            <div class="effectsTitle">E037</div>
        </div>

        <div id="effects38" class="effectsDiv" istext="true">
            <div class="effectsImg" style="background:url(${ctx_web}/image/template/bannerEffects/38.jpg?v=201310162226) center no-repeat;"></div>
            <div class="effectsTitle">E038</div>
        </div>

        <div id="effects39" class="effectsDiv" istext="true">
            <div class="effectsImg" style="background:url(${ctx_web}/image/template/bannerEffects/39.jpg?v=201310162226) center no-repeat;"></div>
            <div class="effectsTitle">E039</div>
        </div>

        <div id="effects40" class="effectsDiv" istext="true">
            <div class="effectsImg" style="background:url(${ctx_web}/image/template/bannerEffects/40.jpg?v=201310162226) center no-repeat;"></div>
            <div class="effectsTitle">E040</div>
        </div>

        <div id="effects41" class="effectsDiv" istext="true">
            <div class="effectsImg" style="background:url(${ctx_web}/image/template/bannerEffects/41.jpg?v=201310162226) center no-repeat;"></div>
            <div class="effectsTitle">E041</div>
        </div>

        <div id="effects42" class="effectsDiv" istext="true">
            <div class="effectsImg" style="background:url(${ctx_web}/image/template/bannerEffects/42.jpg?v=201310162226) center no-repeat;"></div>
            <div class="effectsTitle">E042</div>
        </div>

        <div id="effects43" class="effectsDiv" istext="true">
            <div class="effectsImg" style="background:url(${ctx_web}/image/template/bannerEffects/43.jpg?v=201310162226) center no-repeat;"></div>
            <div class="effectsTitle">E043</div>
        </div>

        <div id="effects44" class="effectsDiv" istext="true">
            <div class="effectsImg" style="background:url(${ctx_web}/image/template/bannerEffects/44.jpg?v=201310162226) center no-repeat;"></div>
            <div class="effectsTitle">E044</div>
        </div>

        <div id="effects45" class="effectsDiv" istext="true">
            <div class="effectsImg" style="background:url(${ctx_web}/image/template/bannerEffects/45.jpg?v=201310162226) center no-repeat;"></div>
            <div class="effectsTitle">E045</div>
        </div>

        <div id="effects46" class="effectsDiv" istext="true">
            <div class="effectsImg" style="background:url(${ctx_web}/image/template/bannerEffects/46.jpg?v=201310162226) center no-repeat;"></div>
            <div class="effectsTitle">E046</div>
        </div>
        	
    </div>
    <!--   文字特效 end  -->
    <!-- 自定义 -->
    <div id="customEffects" style="height:168px; display:none; clear:both;">
        <div style="padding-left:15px;">
            <div class="setline" id="text1Info">
                <div class="setTitle" style="width:auto"><label class="mouseShape">文字1：</label></div>
                <div class="setCtrl"><input value="自定义文字1" id="text1" class="input hard-width-120" maxlength="20" type="text"></div>
                <div class="setCtrl">
                    <div class="setTitle" style="width:auto">
                        <label class="mouseShape">&nbsp;&nbsp;样式：</label>
                    </div>
                    <div class="setCtrl">
                        <select id="style1" style="width:80px;">
                            
                                <option selected="selected" value="SimSun">宋体</option>
                            
                                <option value="PMingLiU">新细明体</option>
                            
                                <option value="FangSong_GB2312">仿宋_GB2312</option>
                            
                                <option value="微软雅黑">微软雅黑</option>
                            
                                <option value="隶书">隶书</option>
                            
                                <option value="幼圆">幼圆</option>
                            
                                <option value="STKaiti">华文楷体</option>
                            
                                <option value="方正舒体">方正舒体</option>
                            
                                <option value="华文彩云">华文彩云</option>
                            
                                <option value="华文行楷">华文行楷</option>
                            
                                <option value="华文宋体">华文宋体</option>
                            
                                <option value="楷体,楷体_GB2312, SimKai">楷体</option>
                            
                                <option value="黑体, SimHei">黑体</option>
                            
                                <option value="Arial">Arial</option>
                            
                                <option value="Tahoma">Tahoma</option>
                            
                                <option value="impact">impact</option>
                            
                                <option value="Arial Serif">Arial Serif</option>
                            
                                <option value="Georgia">Georgia</option>
                            
                                <option value="Garamond">Garamond</option>
                            
                                <option value="Times New Roman">Times New Roman</option>
                            
                                <option value="andale mono">andale mono</option>
                            
                                <option value="arial black,avant garde">arial black</option>
                            
                                <option value="comic sans ms">comic sans ms</option>
                            
                        </select>
                    </div>
                    <div class="setTitle" style="width:auto">
                    	<label class="mouseShape">&nbsp;&nbsp;颜色：</label>
                    </div>
                    <div id="colorSelect1" class="setCtrl" style="width: 18px; height: 18px; line-height: 18px; border: 1px solid rgb(153, 153, 153); cursor: pointer; background-color: rgb(0, 0, 0);"></div>
                    <div class="setTitle" style="width:auto">
                        <label class="mouseShape">&nbsp;&nbsp;大小：</label>
                    </div>
                    <div class="setCtrl">
                        <select id="sizeSelect1" class="sizeSelect"><option value="20">20</option><option value="25">25</option><option value="30">30</option><option value="35">35</option><option value="40">40</option><option value="45">45</option><option selected="selected" value="50">50</option><option value="55">55</option><option value="60">60</option><option value="65">65</option><option value="70">70</option><option value="75">75</option><option value="80">80</option></select>
                    </div>
                </div>
            </div>
            <div class="setline" id="text2Info">
                <div class="setTitle" style="width:auto" id="text2labelDiv"><label class="mouseShape" id="text2label">文字2：</label></div>
                <div class="setCtrl"><input value="自定义文字2" id="text2" class="input hard-width-120" maxlength="20" type="text"></div>
                <div class="setCtrl" id="sczDiv2">
                    <div class="setTitle" style="width:auto"><label class="mouseShape">&nbsp;&nbsp;样式：</label></div>
                    <div class="setCtrl">
                        <select id="style2" style="width:80px;">
                            
                                <option selected="selected" value="SimSun">宋体</option>
                            
                                <option value="PMingLiU">新细明体</option>
                            
                                <option value="FangSong_GB2312">仿宋_GB2312</option>
                            
                                <option value="微软雅黑">微软雅黑</option>
                            
                                <option value="隶书">隶书</option>
                            
                                <option value="幼圆">幼圆</option>
                            
                                <option value="STKaiti">华文楷体</option>
                            
                                <option value="方正舒体">方正舒体</option>
                            
                                <option value="华文彩云">华文彩云</option>
                            
                                <option value="华文行楷">华文行楷</option>
                            
                                <option value="华文宋体">华文宋体</option>
                            
                                <option value="楷体,楷体_GB2312, SimKai">楷体</option>
                            
                                <option value="黑体, SimHei">黑体</option>
                            
                                <option value="Arial">Arial</option>
                            
                                <option value="Tahoma">Tahoma</option>
                            
                                <option value="impact">impact</option>
                            
                                <option value="Arial Serif">Arial Serif</option>
                            
                                <option value="Georgia">Georgia</option>
                            
                                <option value="Garamond">Garamond</option>
                            
                                <option value="Times New Roman">Times New Roman</option>
                            
                                <option value="andale mono">andale mono</option>
                            
                                <option value="arial black,avant garde">arial black</option>
                            
                                <option value="comic sans ms">comic sans ms</option>
                            
                        </select>
                    </div>
                    <div class="setTitle" style="width:auto;" id="colorSelect2Div"><label class="mouseShape" id="colorSelect2Label">&nbsp;&nbsp;颜色：</label></div>
                    <div id="colorSelect2" class="setCtrl" style="width: 18px; height: 18px; line-height: 18px; border: 1px solid rgb(153, 153, 153); cursor: pointer; background-color: rgb(255, 255, 255);"></div>
                    <div class="setTitle" style="width:auto"><label class="mouseShape">&nbsp;&nbsp;大小：</label></div>
                    <div class="setCtrl">
                        <select id="sizeSelect2" class="sizeSelect"><option value="20">20</option><option value="25">25</option><option selected="selected" value="30">30</option><option value="35">35</option><option value="40">40</option><option value="45">45</option><option value="50">50</option><option value="55">55</option><option value="60">60</option><option value="65">65</option><option value="70">70</option><option value="75">75</option><option value="80">80</option></select>
                    </div>
                </div>
            </div>
        </div>
        <div id="customEffectsListBody" class="effectsListBody" style="padding-left:5px; height:168px; overflow-y:auto; position:relative; clear:both;">
            <div class="closeEff effectsCheck">
            	<div class="effectsImg"></div>
            </div>

            <div id="effects47" class="effectsDiv" verify="true" singleline="false" mask="false">
                <div class="effectsImg" style="background:url(${ctx_web}/image/template/bannerEffects/47.jpg?v=201310162226) center no-repeat;"></div>
                <div class="effectsTitle">E047</div>
            </div>

            <div id="effects48" class="effectsDiv" verify="true" singleline="false" mask="false">
                <div class="effectsImg" style="background:url(${ctx_web}/image/template/bannerEffects/48.jpg?v=201310162226) center no-repeat;"></div>
                <div class="effectsTitle">E048</div>
            </div>

            <div id="effects49" class="effectsDiv" verify="true" singleline="true" mask="false">
                <div class="effectsImg" style="background:url(${ctx_web}/image/template/bannerEffects/49.jpg?v=201310162226) center no-repeat;"></div>
                <div class="effectsTitle">E049</div>
            </div>

            <div id="effects50" class="effectsDiv" verify="true" singleline="true" mask="false">
                <div class="effectsImg" style="background:url(${ctx_web}/image/template/bannerEffects/50.jpg?v=201310162226) center no-repeat;"></div>
                <div class="effectsTitle">E050</div>
            </div>

            <div id="effects51" class="effectsDiv" verify="true" singleline="true" mask="true">
                <div class="effectsImg" style="background:url(${ctx_web}/image/template/bannerEffects/51.jpg?v=201310162226) center no-repeat;"></div>
                <div class="effectsTitle">E051</div>
            </div>

            <div id="effects52" class="effectsDiv" verify="true" singleline="true" mask="true">
                <div class="effectsImg" style="background:url(${ctx_web}/image/template/bannerEffects/52.jpg?v=201310162226) center no-repeat;"></div>
                <div class="effectsTitle">E052</div>
            </div>

            <div id="effects53" class="effectsDiv" verify="true" singleline="true" mask="true">
                <div class="effectsImg" style="background:url(${ctx_web}/image/template/bannerEffects/53.jpg?v=201310162226) center no-repeat;"></div>
                <div class="effectsTitle">E053</div>
            </div>

            <div id="effects54" class="effectsDiv" verify="true" singleline="true" mask="true">
                <div class="effectsImg" style="background:url(${ctx_web}/image/template/bannerEffects/54.jpg?v=201310162226) center no-repeat;"></div>
                <div class="effectsTitle">E054</div>
            </div>

            <div id="effects55" class="effectsDiv" verify="true" singleline="true" mask="true">
                <div class="effectsImg" style="background:url(${ctx_web}/image/template/bannerEffects/55.jpg?v=201310162226) center no-repeat;"></div>
                <div class="effectsTitle">E055</div>
            </div>

            <div id="effects56" class="effectsDiv" verify="true" singleline="true" mask="true">
                <div class="effectsImg" style="background:url(${ctx_web}/image/template/bannerEffects/56.jpg?v=201310162226) center no-repeat;"></div>
                <div class="effectsTitle">E056</div>
            </div>

        </div>
    </div>
    <!-- 自定义 end -->

</div>

<ul style="z-index: 1; top: 0px; left: 0px; display: none;" aria-activedescendant="ui-active-menuitem" role="listbox" class="ui-autocomplete ui-menu ui-widget ui-widget-content ui-corner-all"></ul></body></html>