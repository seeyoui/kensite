<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/taglib/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title></title>
	<%@ include file="/WEB-INF/view/taglib/header.jsp" %>
	<link type="text/css" rel="stylesheet" href="../css/manage.min.css?v=201601041813"/>
	<script type="text/javascript" src="../js/comm/jquery/jquery-core.min.js?v=201503161711"></script>
	<script type="text/javascript" src="../js/comm/fai.min.js?v=201512071738"></script>
	<script type="text/javascript" src="../js/comm/jquery/jquery-ui-core.min.js?v=201511231730"></script>
	<script type="text/javascript" src="../js/comm/pinyin.min.js?v=201306041217"></script>
	<script type="text/javascript" src="../js/comm/faiui.min.js?v=201601111801"></script>
	<script type="text/javascript" src="../js/site.min.js?v=201601131153"></script>
	<script type="text/javascript" src="../js/manage.min.js?v=201601121610"></script>
	<script type="text/javascript">
	try {
		Fai.top = parent.Fai.top;
	} catch (e) {
	}
	</script>
	<link type="text/css" rel="stylesheet" href="../css/site/floatBtnEdit.min.css?v=201509071734"/>

<%
	String id = request.getParameter("id");
	String popupID = request.getParameter("popupID");
%>

<script type="text/javascript">
var addMode = false,
	g_id = <%=id%>,
	flBtnStyleData,
	cntFlBtn, 
	cssLinkType = {},

	moduleFloatBtnBox = Fai.top.$(".formStyle81").find(".J_floatBtnBox");
	
if(moduleFloatBtnBox .length > 0){
	moduleFloatBtnBox.each(function(index){
		var className = $(this).attr("class"),
			classIndex = className.indexOf("floatBtnStyle"),
			cntCssNum = parseInt(className.substr(classIndex + 13, 3));
			linkCount = parseInt(cntCssNum / 500) + 1;
		if(cssLinkType[linkCount] != 1){
			cssLinkType[linkCount] = 1;
		}
	});
}

$(function(){
	//popupID
	var popupID = <%=popupID%>;
	Fai.addPopupWindowBtn(popupID, {id:'save', extClass:'saveButton', text:'确定', click:save});
	Fai.addPopupWindowBtn(popupID, {id:'close', extClass:'cancelButton', text:'取消', click:'close'});
	$('#tabs').tabs({ selected: 0 });

	if(addMode){
		flBtnStyleData = {
			bns: 101,
			bs: { v: "",hn: "",h: "" , hi: ""},
			s: { t: 0, w: 163, h: 52 },
			bg: { t: 0, c: "#000000" },
			r: { t: 0, lt: 10, rt: 10, lb: 10, rb: 10 },
			sh: { t: 0, dx: 3, dy: 2, f: 12, c: "#000000" },
			b: { t: 0, w: 1, c: "#000000" }
		};
	}else{
		//getbaseData：从数据库取出的数据；flBtnCntData：全局对象，记录所有实时改变数据。flBtnStyleData：为此此页面初始化数据
		cntFlBtn = Fai.top.$("#module" + g_id + "FlBtn");
		var getBaseData = {"bns":304,"bs":{"v":"","h":"","hn":""},"s":{"t":1,"w":163,"h":52},"bg":{"t":1,"c":"#000000","i":"","r":3},"r":{"t":2,"lt":10,"rt":10,"lb":10,"rb":10},"sh":{"t":2,"c":"rgba(0,0,0,0.5)","dx":3,"dy":2,"f":12},"b":{"t":2,"w":1,"c":"#000000"}};
		 
		Fai.top._floatBtn =  Fai.top._floatBtn || {};
		Fai.top._floatBtn["_floatBtnData" + g_id] = Fai.top._floatBtn["_floatBtnData" + g_id] || getBaseData;
		var flBtnCntData = Fai.top._floatBtn["_floatBtnData" + g_id];
		$.extend(getBaseData, flBtnCntData);
		flBtnStyleData = getBaseData;
		flBtnCntData = flBtnStyleData;
	}

	loadBtnCssLink();
	initFlBtnData(flBtnStyleData);
});

function save(){
	var setBtnData = {},
		pattern = {},
		$name = $("#name"),
		$flbtnContent = $("#flbtnContent"),
		name = $name.val(),
		maxlen = 50,
		flbtnContent = $flbtnContent.val();

	if( name.length > maxlen ){
		Fai.ing( '模块标题文字长度不能超过'+ maxlen + '。', true );
		$('#tabs').tabs({ selected:0 });
		$name.focus();
		return;
	}
	if( flbtnContent.length > maxlen ){
		Fai.ing( '按钮内容文字长度不能超过'+ maxlen + '。', true );
		$('#tabs').tabs({ selected:0 });
		$flbtnContent.focus();
		return;
	}

	//保存数据
	setBtnData.bs = {};
	setBtnData.bns = flBtnStyleData.bns;

	setBtnData.bs.v = flBtnStyleData.bs.v;
	setBtnData.bs.hn = flBtnStyleData.bs.hn;
	setBtnData.bs.h = flBtnStyleData.bs.h;
	setBtnData.bs.hi = flBtnStyleData.bs.hi;
	
	setBtnData.s = {};
	if(flBtnStyleData.s.t == 1){
		setBtnData.s.t = 1;
	}
	setBtnData.s.w = flBtnStyleData.s.w;
	setBtnData.s.h = flBtnStyleData.s.h;
	pattern.w = setBtnData.s.w;
	pattern.h = setBtnData.s.h;

	setBtnData.bg = {};
	if(flBtnStyleData.bg.t == 1){
		setBtnData.bg.t = 1;
		setBtnData.bg.c = flBtnStyleData.bg.c;
		setBtnData.bg.i = flBtnStyleData.bg.i;
		setBtnData.bg.r = flBtnStyleData.bg.r;
	}
	setBtnData.r = {};
	if(flBtnStyleData.r.t == 2){
		setBtnData.r.t = 2;
		setBtnData.r.lt = flBtnStyleData.r.lt;
		setBtnData.r.rt = flBtnStyleData.r.rt;
		setBtnData.r.lb = flBtnStyleData.r.lb;
		setBtnData.r.rb = flBtnStyleData.r.rb;
	} else if (flBtnStyleData.r.t == 1){
		setBtnData.r.t = 1
	}

	setBtnData.sh = {};
	if(flBtnStyleData.sh.t == 2){
		setBtnData.sh.t = 2;
		setBtnData.sh.dx = flBtnStyleData.sh.dx;
		setBtnData.sh.dy = flBtnStyleData.sh.dy;
		setBtnData.sh.f = flBtnStyleData.sh.f;
		setBtnData.sh.c = Site.toRgba(flBtnStyleData.sh.c, 0.5);
	} else if (flBtnStyleData.sh.t == 1){
		setBtnData.sh.t = 1
	} 

	setBtnData.b = {};
	if(flBtnStyleData.b.t == 2){
		setBtnData.b.t = 2;
		setBtnData.b.w = flBtnStyleData.b.w;
		setBtnData.b.c = flBtnStyleData.b.c;
		pattern.w += 2 * setBtnData.b.w;
		pattern.h += 2 * setBtnData.b.w;
	} else if (flBtnStyleData.b.t == 1){
		setBtnData.b.t = 1
	}

	if(addMode){
		pattern.cb = {};
		pattern.cb.y = 1;
		pattern.e = 1;
		pattern.d = {};
		pattern.d.y = 1;
		pattern.i = {};
		pattern.i.t = 0;
		pattern.i.b = 0;
		pattern.i.l = 0;
		pattern.i.r = 0;
		pattern.i.y = 0;
	}

	var params = [];
    params.push('&name=' + Fai.encodeUrl(name));
	params.push('&prop1=' + Fai.encodeUrl($.toJSON(setBtnData)));	
	params.push( '&pattern=' + Fai.encodeUrl($.toJSON(pattern)));
	
	Fai.ing("正在保存……", false);
	Fai.closePopupWindow(  );
	/* $.ajax({
	   	type: "post",
		url: '.../ajax/module_h.jsp?cmd=setBack&id=479&style=81&colId=2&extId=0',
		data: params.join(""),
		error: function(){Fai.ing("服务繁忙，请稍候重试",false);},
		success: function(data){
			Fai.enablePopupWindowBtn(popupID, 'save', true);
			var res = $.parseJSON(data);
			reSetPageChange();
			if(Fai.successHandle(data, "修改成功", "系统错误", "", 3, 1)){
				if( addMode ){
					Site.addNewModule(res.id, res.div,null,null,{"returnModuledata":res.moduleData});
				}else{
					Site.refreshModule(res.id, res.div, name);
				}
				Fai.closePopupWindow(  );
			}
			Site.getModuleAttr(g_id).data.changed = false;
		}
	}); */
}
function initFlBtnData(){
	initBaseSet();
	initFlBtnSize();
	initFlBtnBg();
	initFlBtnRadius();
	initFlBtnShadow();
	initFlBtnBorder();
	setFlBtnLink();										//设置链接
	setflBtnBgImg();									//设置背景图片
	bindEvent();
}

function onFlBtnValChange(){
	var val = $.trim($("#flbtnContent").val());
	flBtnStyleData.bs.v = val;
	if(!addMode){
		Site.setFlBtnValue(g_id, flBtnStyleData.bs.v);
	}
	setPageChange();
}

function onFlBtnWidthChange(){
	var btnWidth = parseInt($.trim($("#flBtnWid").val()));
	if( isNaN(btnWidth) || btnWidth <= 0 ){
		Fai.ing( '请填写正确的宽度', true );
		return false;
	}
	if(btnWidth < 16){
		btnWidth = 16;
		$(this).val(btnWidth);
	}
	flBtnStyleData.s.w = btnWidth;
	if(!addMode){
		Site.setFlBtnWidthChange(g_id, btnWidth);
	}
	setPageChange();
}

function onFlBtnHeightChange(){
	var btnHeight = parseInt($.trim($("#flBtnHei").val()));
	if( isNaN(btnHeight) || btnHeight <= 0 ){
		Fai.ing( '请填写正确的高度', true );
		return false;
	}

	if(btnHeight < 16){
		btnHeight = 16;
		$(this).val(btnHeight);
	}
	flBtnStyleData.s.h = btnHeight;
	if(!addMode){
		Site.setFlBtnHeightChange(g_id, btnHeight);
	}
	setPageChange();
}

function onFlBtnBgRepeatChange (){
	flBtnStyleData.bg.r = parseInt($("#flBtnBgRepeat").val());
	if(!addMode){
		Site.setFlBtnBgChange(g_id, flBtnStyleData.bg);
	}
	setPageChange();
}
function onFlBtnRadiusLtChange(){
	var radiusLt = parseInt($.trim($("#flBtnLTRadius").val()));
	if( isNaN(radiusLt) || radiusLt < 0 ){
		Fai.ing( '请填写正确的圆角弧度', true );
		return false;
	}

	flBtnStyleData.r.lt = radiusLt;
	if(!addMode){
		Site.setFlBtnRadiusChange(g_id, flBtnStyleData.r);
	}
	setPageChange();
}

function onFlBtnRadiusRtChange(){
	var radiusRt = parseInt($.trim($("#flBtnRTRadius").val()));
	if( isNaN(radiusRt) || radiusRt < 0 ){
		Fai.ing( '请填写正确的圆角弧度', true );
		return false;
	}

	flBtnStyleData.r.rt = radiusRt;
	if(!addMode){
		Site.setFlBtnRadiusChange(g_id, flBtnStyleData.r);
	}
	setPageChange();
}

function onFlBtnRadiusLbChange(){
	var radiusLb = parseInt($.trim($("#flBtnLBRadius").val()));
	if( isNaN(radiusLb) || radiusLb < 0 ){
		Fai.ing( '请填写正确的圆角弧度', true );
		return false;
	}

	flBtnStyleData.r.lb = radiusLb;
	if(!addMode){
		Site.setFlBtnRadiusChange(g_id, flBtnStyleData.r);
	}
	setPageChange();
}

function onFlBtnRadiusRbChange(){
	var radiusRb = parseInt($.trim($("#flBtnRBRadius").val()));
	if( isNaN(radiusRb) || radiusRb < 0 ){
		Fai.ing( '请填写正确的圆角弧度', true );
		return false;
	}

	flBtnStyleData.r.rb = radiusRb;
	if(!addMode){
		Site.setFlBtnRadiusChange(g_id, flBtnStyleData.r);
	}
	setPageChange();
}

function onFlBtnShadowDxChange(){
	var shadowDx = parseInt($.trim($("#flBtnShadowWid").val()));
	if( isNaN(flBtnStyleData.sh.dx) || flBtnStyleData.sh.dx < 0 ){
		Fai.ing( '请填写正确的X轴偏移', true );
		return false;
	}

	flBtnStyleData.sh.dx = shadowDx;
	if(!addMode){
		Site.setFlBtnShadowChange(g_id, flBtnStyleData.sh);
	}
	setPageChange();

}
function onFlBtnShadowDyChange(){
	var shadowDy = parseInt($.trim($("#flBtnShadowHei").val()));
	if( isNaN(flBtnStyleData.sh.dy) || flBtnStyleData.sh.dy < 0 ){
		Fai.ing( '请填写正确的Y轴偏移', true );
		return false;
	}

	flBtnStyleData.sh.dy = shadowDy;
	if(!addMode){
		Site.setFlBtnShadowChange(g_id, flBtnStyleData.sh);
	}
	setPageChange();

}
function onFlBtnShadowFChange(){
	var shadowF = parseInt($.trim($("#flBtnVague").val()));
	if( isNaN(flBtnStyleData.sh.dy) || flBtnStyleData.sh.dy < 0 ){
		Fai.ing( '请填写正确的阴影扩散', true );
		return false;
	}

	flBtnStyleData.sh.f = shadowF;
	if(!addMode){
		Site.setFlBtnShadowChange(g_id, flBtnStyleData.sh);
	}
	setPageChange();
}

function onFlBtnBorderWidthChange(){
	var bordeWidth= parseInt($("#flBtnBorderSize").val());

	flBtnStyleData.b.w = bordeWidth;
	if(!addMode){
		Site.setFlBtnBorderChang(g_id, flBtnStyleData.b);
	}
	setPageChange();
}

function loadBtnCssLink (cssNum){
	if(arguments.length == 0){
		if(addMode){
			cssLinkType["1"] = 1;
			if(top.$("link[href='../css/floatBtn1.min.css?v=201510121802']").length == 0 ){
				top.$('<link type="text/css" href="../css/floatBtn1.min.css?v=201510121802" rel="stylesheet">').appendTo(top.$("head"));
			}
		}else{
			var count = parseInt(flBtnStyleData.bns/500) + 1;
			cssLinkType[count] = 1;
		}
	}else{
		var count = parseInt(cssNum/500) + 1;
		if(cssLinkType[count] != 1){
			top.$('<link type="text/css" href="../error_css_floatBtn' + count+'" rel="stylesheet">').appendTo(top.$("head"));
			cssLinkType[count] = 1;
		}
	}
}

function bindEvent(){
	$("#buttonStylePanel").find(".J_styleItem").on("mouseenter.fb", function () {
		$(this).addClass("styleItem_hover");
		$(this).css("zoom", "1");
	}).on("mouseleave.fb", function () {
		$(this).removeClass("styleItem_hover");
	}).on("click.fb", function () {
		$("#buttonStylePanel").find(".styleItem_choice").removeClass("styleItem_choice");
		$(this).addClass("styleItem_choice");
		$(this).css("zoom", "1");

		var bs = parseInt($(this).attr("_bs")),
			szData = flBtnStyleData.s;
		flBtnStyleData.bns =  bs;
		if(szData.t == 0){
			if(bs < 200){
				szData.w = 163;
				szData.h = 52;
			} else if(bs < 300){
				szData.w = 172;
				szData.h = 56;
			} else if(bs < 400){
				szData.w = 202;
				szData.h = 64;
			} else {
				szData.w = 204;
				szData.h = 68;
			}
			$("#flBtnWid").val(szData.w);
			$("#flBtnHei").val(szData.h);
		}
		loadBtnCssLink(bs);
		if(!addMode){
			Site.setFlBtnSysNum(g_id, bs);
		}
		setPageChange();
	});

	//宽高提示
	$("#flBtnWid").on("blur.fb",function(){
		var btnWidth = parseInt($.trim($(this).val()));
		if(btnWidth < 16){
			btnWidth = 16;
			$(this).val(btnWidth);
			Fai.ing("按钮宽度不能不能小于16px", true);
			flBtnStyleData.s.w = btnWidth;
			if(!addMode){
				Site.setFlBtnWidthChange(g_id, btnWidth);
			}	
			setPageChange();
		}
	});

	$("#flBtnHei").on("blur.fb",function(){
		var btnHeight = parseInt($.trim($(this).val()));
		if(btnHeight < 16){
			btnHeight = 16;
			$(this).val(btnHeight);
			Fai.ing("按钮高度不能不能小于16px", true);
			flBtnStyleData.s.h = btnHeight;
			if(!addMode){
				Site.setFlBtnHeightChange(g_id, btnHeight);
			}	
			setPageChange();
		}
	});

}
//基础设置初始化
function initBaseSet(){
	var bsData = flBtnStyleData.bs;
	var flbtnContent = $("#flbtnContent"),
		flBtnLinkNet = $("#flBtnLinkNet"),
		jumpCtrl = $("#jumpCtrl"),
		buttonStyleSelect = $(".buttonStyleSelect");

	if(typeof bsData.v !== "undefined" && bsData.v !== ""){
		flbtnContent.val(bsData.v);
	}
	
	if(~~flBtnStyleData.bns){
		buttonStyleSelect.find(".J_styleItem[_bs=" + flBtnStyleData.bns + "]").addClass("styleItem_choice");
	}else{
		buttonStyleSelect.find(".J_styleItem[_bs=101]").addClass("styleItem_choice");
	}
}

//大小初始化
function initFlBtnSize(){
	var flBtnWid, flBtnHei,
		szData = flBtnStyleData.s,
		flBtnSize0 = $("#flBtnSize0"),
		flBtnSize1 = $("#flBtnSize1"),
		flBtnSizeBox = $(".flBtnSizeBox");
		
		flBtnWid = $("#flBtnWid");
		flBtnHei = $("#flBtnHei");
	if(szData.t == 0){
		flBtnSize0.attr("checked", "checked");
		flBtnSizeBox.hide();
	}else{
		flBtnSize1.attr("checked", "checked");
		flBtnSizeBox.show();
		if(~~szData.w){
			flBtnWid.val(szData.w);
		}
		if(~~szData.h){
			flBtnHei.val(szData.h);
		}
	}
	var data = Site.getModuleAttr(g_id).data;
	if(data.changed){
		flBtnSize1.attr("checked", "checked");
		flBtnSizeBox.show();
		flBtnWid.val(flBtnStyleData.s.w);
		flBtnHei.val(flBtnStyleData.s.h);
	}
}
//背景初始化
function initFlBtnBg(){
	var bgData = flBtnStyleData.bg,
		flBtnBg0 = $("#flBtnBg0"),
		flBtnBg1 = $("#flBtnBg1"),
		flBtnBgBox = $(".flBtnBgBox"),
		flBtnBgColorPicker = $("#flBtnBgColorPicker"),
		flBtnBgRepeat = $("#flBtnBgRepeat"),
		flBtnImgMsg = $("#flBtnImgMsg");

	if(bgData.t == 0){
		flBtnBg0.attr("checked", "checked");
		flBtnBgBox.hide();
	}else{
		flBtnBg1.attr("checked", "checked");
		flBtnBgBox.show();
	}

	if (Fai.isNull(bgData.c)) {
		bgData.c = "#000";
	}

	if (Fai.isNull(bgData.r)) {
		bgData.r = 3;
	}
	flBtnBgRepeat.val(bgData.r);
	
	if(bgData.i){
		flBtnImgMsg.html('<a href="javascript:view(\'' + bgData.i + '\');">查看</a>');
	}

    flBtnBgColorPicker.faiColorPicker({
       onchange:onBgColorChange,
       defaultcolor:bgData.c,
       showInTop:true
    });
}

//圆角、初始化
function initFlBtnRadius(){
	var flBtnLTRadius, flBtnRTRadius, flBtnLBRadius , flBtnRBRadius,
		raData = flBtnStyleData.r,
		flBtnRadius0 = $("#flBtnRadius0"),
		flBtnRadius1 = $("#flBtnRadius1"),
		flBtnRadius2 = $("#flBtnRadius2"),
		flBtnRadiusBox = $(".flBtnRadiusBox");

	if (raData.t == 0){
		flBtnRadius0.attr("checked", "checked");
		flBtnRadiusBox.hide();
	} else if(raData.t == 1){
		flBtnRadius1.attr("checked", "checked");
		flBtnRadiusBox.hide();
	} else{
		flBtnRadius2.attr("checked", "checked");
		flBtnRadiusBox.show();

		flBtnLTRadius = $("#flBtnLTRadius");
		flBtnRTRadius = $("#flBtnRTRadius");
		flBtnLBRadius = $("#flBtnLBRadius");
		flBtnRBRadius = $("#flBtnRBRadius");
		if (typeof raData.lt == "undefined") {
			raData.lt = 10;
		}
		flBtnLTRadius.val(raData.lt);

		if (typeof raData.rt == "undefined") {
			raData.rt = 14;
		}
		flBtnRTRadius.val(raData.rt);

		if (typeof raData.lb == "undefined") {
			raData.lb = 10;
		}
		flBtnLBRadius.val(raData.lb);

		if (typeof raData.rb == "undefined") {
			raData.rb = 11;
		}
		flBtnRBRadius.val(raData.rb);
	}
}
//阴影，初始化
function initFlBtnShadow(){
	var flBtnShadowWid, flBtnShadowHei, flBtnVague, flBtnShadowColorPicker,
		shData = flBtnStyleData.sh,
		flBtnShadow0 = $("#flBtnShadow0"),
		flBtnShadow1 = $("#flBtnShadow1"),
		flBtnShadow2 = $("#flBtnShadow2"),
		flBtnShadowBox = $(".flBtnShadowBox");
		flBtnShadowColorPicker = $("#flBtnShadowColorPicker");
	if (shData.t == 0){
		flBtnShadow0.attr("checked", "checked");
		flBtnShadowBox.hide();
	} else if(shData.t == 1){
		flBtnShadow1.attr("checked", "checked");
		flBtnShadowBox.hide();
	} else{
		flBtnShadow2.attr("checked", "checked");
		flBtnShadowBox.show();

		flBtnShadowWid = $("#flBtnShadowWid");
		flBtnShadowHei = $("#flBtnShadowHei");
		flBtnVague = $("#flBtnVague");
		
		if (Fai.isNull(shData.dx)) {
			shData.dx = 0;
		}
		flBtnShadowWid.val(shData.dx);
		
		if (Fai.isNull(shData.dy)) {
			shData.dy = 0;
		}
		flBtnShadowHei.val(shData.dy);
		
		if (Fai.isNull(shData.f)) {
			shData.f = 0;
		}
		flBtnVague.val(shData.f);

		if (Fai.isNull(shData.c)) {
			shData.c = "#000";
		}
	}

    flBtnShadowColorPicker.faiColorPicker({
       onchange:onShadowColorChange,
       defaultcolor:shData.c,
       showInTop:true
    });
}
//描边,初始化
function initFlBtnBorder(){
	var flBtnBorderSize, flBtnBorderColor,
		boData = flBtnStyleData.b,
		flBtnBorder0 = $("#flBtnBorder0"),
		flBtnBorder1 = $("#flBtnBorder1"),
		flBtnBorder2 = $("#flBtnBorder2"),
		flBtnBorderBox = $(".flBtnBorderBox"),
		flBtnBorderColor = $("#flBtnBorderColor");
	if (boData.t == 0){
		flBtnBorder0.attr("checked", "checked");
		flBtnBorderBox.hide();
	} else if(boData.t == 1){
		flBtnBorder1.attr("checked", "checked");
		flBtnBorderBox.hide();
	} else {
		flBtnBorder2.attr("checked", "checked");
		flBtnBorderBox.show();
		
		flBtnBorderSize = $("#flBtnBorderSize");

		if (Fai.isNull(boData.w)) {
			boData.w = 3;
		}
		flBtnBorderSize.val(boData.w);

		if (Fai.isNull(boData.c)) {
			boData.c = "#000";
		}
	}

    flBtnBorderColor.faiColorPicker({
       onchange:onBorderColorChange,
       defaultcolor:boData.c,
       showInTop:true
    });

}
//高级，大小
function flBtnSizeChange(type){
	var flBtnWid, flBtnHei, cntFlBtn,
		flBtnSize0 = $("#flBtnSize0"),
		flBtnSize1 = $("#flBtnSize1"),
		flBtnSizeBox = $(".flBtnSizeBox"),
		szData = flBtnStyleData.s;

	if (type == 0){
		flBtnSizeBox.hide();
		flBtnSize0.attr("checked", "checked");
		szData.t = 0;
		if(!addMode){
			Site.setFlBtnSizeType(g_id, szData);
		}
			
	} else {
		flBtnSizeBox.show();
		flBtnSize1.attr("checked", "checked");
		if(szData.t == 1){
			return;
		}
		szData.t = 1;
		flBtnWid = $("#flBtnWid");
		flBtnHei = $("#flBtnHei");
		if(typeof szData.w !== "undefined"){
			flBtnWid.val(szData.w);
		} else {
			if(cntFlBtn){
				flBtnWid.val(cntFlBtn.width());
			}
		}
		if(typeof szData.h !== "undefined"){
			flBtnHei.val(szData.h);
		} else {
			if(cntFlBtn){
				flBtnHei.val(cntFlBtn.height());
			}
		}
		if(!addMode){
			Site.setFlBtnSizeType(g_id, szData);
		}
			
	}
	setPageChange();
}
//高级,背景
function flBtnBgChange(type){
	var flBtnBgColorPicker,flBtnBgRepeat,flBtnImgMsg,
		flBtnBg0 = $("#flBtnBg0"),
		flBtnBg1 = $("#flBtnBg1"),
		flBtnBgBox = $(".flBtnBgBox"),
		cntFlBtn = $("#flBtn"),
		bgData = flBtnStyleData.bg;
	if (type == 0){
		flBtnBgBox.hide();
		flBtnBg0.attr("checked", "checked");
		bgData.t = 0;
		if(!addMode){
			Site.setFlBtnBgType(g_id, bgData);
		}
			
	} else {
		flBtnBgBox.show();
		flBtnBg1.attr("checked", "checked");
		if(bgData.t == 1){
			return;
		}

		bgData.t = 1;
		flBtnBgColorPicker = $("#flBtnBgColorPicker");
		flBtnBgRepeat = $("#flBtnBgRepeat");
		flBtnImgMsg = $("#flBtnImgMsg");

		if (Fai.isNull(bgData.c) || bgData.c == "") {
			bgData.c = "#000";
		}

		if (Fai.isNull(bgData.r)) {
			bgData.r = 0;
		}
		flBtnBgRepeat.val(bgData.r);
		
		if(bgData.i){
			flBtnImgMsg.html('<a href="javascript:view(\'' + bgData.i + '\');">查看</a>');
		}
		if(!addMode){
			Site.setFlBtnBgType(g_id, bgData);
		}
			
	}
	setPageChange();

}
//高级，圆角
function flBtnRadiusChange(type){
	var flBtnLTRadius, flBtnRTRadius, flBtnLBRadius , flBtnRBRadius,
		flBtnRadius0 = $("#flBtnRadius0"),
		flBtnRadius1 = $("#flBtnRadius1"),
		flBtnRadius2 = $("#flBtnRadius2"),
		flBtnRadiusBox = $(".flBtnRadiusBox"),
		raData = flBtnStyleData.r;
	if (type == 0){
		flBtnRadiusBox.hide();
		flBtnRadius0.attr("checked", "checked");
		raData.t = 0;
		if(!addMode){
			Site.setFlBtnRadiusType(g_id, raData);
		}
			
	} else if(type == 1) {
		flBtnRadiusBox.hide();
		flBtnRadius1.attr("checked", "checked");
		raData.t = 1;
		if(!addMode){
			Site.setFlBtnRadiusType(g_id, raData);
		}
			
	} else {
		flBtnRadiusBox.show();
		flBtnRadius2.attr("checked", "checked");

		if(raData.t == 2){
			return;
		}

		raData.t = 2;
		//Fai.ing("本设置在低版本浏览器中为默认状态",true);
		flBtnLTRadius = $("#flBtnLTRadius");
		flBtnRTRadius = $("#flBtnRTRadius");
		flBtnLBRadius = $("#flBtnLBRadius");
		flBtnRBRadius = $("#flBtnRBRadius");
		if (Fai.isNull(raData.lt)) {
			raData.lt = 0;
		}
		flBtnLTRadius.val(raData.lt);

		if (Fai.isNull(raData.rt)) {
			raData.rt = 0;
		}
		flBtnRTRadius.val(raData.rt);

		if (Fai.isNull(raData.lb)) {
			raData.lb = 0;
		}
		flBtnLBRadius.val(raData.lb);

		if (Fai.isNull(raData.rb)) {
			raData.rb = 0;
		}
		flBtnRBRadius.val(raData.rb);
		if(!addMode){
			Site.setFlBtnRadiusType(g_id, raData);
		}
			
	}
	setPageChange();
}

//高级，阴影
function flBtnShadowChange(type){
	var flBtnShadow0 = $("#flBtnShadow0"),
		flBtnShadow1 = $("#flBtnShadow1"),
		flBtnShadow2 = $("#flBtnShadow3"),
		flBtnShadowBox = $(".flBtnShadowBox");
	var shData = flBtnStyleData.sh;
	var flBtnShadowWid, flBtnShadowHei, flBtnVague, flBtnShadowColorPicker;
	if (type == 0){
		flBtnShadowBox.hide();
		flBtnShadow0.attr("checked", "checked");
		shData.t = 0;
		if(!addMode){
			Site.setFlBtnShadowType(g_id, shData);
		}
			
	} else if(type == 1) {
		flBtnShadowBox.hide();
		flBtnShadow1.attr("checked", "checked");
		shData.t = 1;
		if(!addMode){
			Site.setFlBtnShadowType(g_id, shData);
		}
			
	} else {
		flBtnShadowBox.show();
		flBtnShadow2.attr("checked", "checked");
		if(shData.t == 2){
			return;
		}
		shData.t = 2;
		//Fai.ing("本设置在低版本浏览器中为默认状态",true);

		flBtnShadowWid = $("#flBtnShadowWid");
		flBtnShadowHei = $("#flBtnShadowHei");
		flBtnVague = $("#flBtnVague");
		flBtnShadowColorPicker = $("#flBtnShadowColorPicker");
		
		if (Fai.isNull(shData.dx)) {
			shData.dx = 0;
		}
		flBtnShadowWid.val(shData.dx);
		
		if (Fai.isNull(shData.dy)) {
			shData.dy = 0;
		}
		flBtnShadowHei.val(shData.dy);
		
		if (Fai.isNull(shData.f)) {
			shData.f = 0;
		}
		flBtnVague.val(shData.f);

		if (Fai.isNull(shData.c)) {
			shData.c = "#000000";
		}
		if(!addMode){
			Site.setFlBtnShadowType(g_id, shData);
		}
			
	}
	setPageChange();
}

//高级，描边
function flBtnBorderChanger(type){
	var flBtnBorderSize, flBtnBorderColor,
		flBtnBorder0 = $("#flBtnBorder0"),
		flBtnBorder1 = $("#flBtnBorder1"),
		flBtnBorder2 = $("#flBtnBorder2"),
		flBtnBorderBox = $(".flBtnBorderBox"),
		boData = flBtnStyleData.b;

	if (type == 0){
		flBtnBorderBox.hide();
		flBtnBorder0.attr("checked", "checked");
		boData.t = 0;
		if(!addMode){
			Site.setFlBtnBorderType(g_id, boData);
		}

	} else if(type == 1) {
		flBtnBorderBox.hide();
		flBtnBorder1.attr("checked", "checked");
		boData.t = 1;
		if(!addMode){
			Site.setFlBtnBorderType(g_id, boData);
		}

	} else {
		flBtnBorderBox.show();
		flBtnBorder2.attr("checked", "checked");

		if(boData.t == 2){
			return;
		}
		boData.t = 2;
		flBtnBorderSize = $("#flBtnBorderSize");
		flBtnBorderColor = $("#flBtnBorderColor");

		if (Fai.isNull(boData.w)) {
			boData.w = 0;
		}
		flBtnBorderSize.val(boData.w);

		if (Fai.isNull(boData.c)) {
			boData.c = "#000";
		}
		if(!addMode){
	    	Site.setFlBtnBorderType(g_id, boData);
		}

	}	
	setPageChange();
}
//设置链接
function setFlBtnLink(){
	var jumpName = flBtnStyleData.bs.hn,
		jumpIde = flBtnStyleData.bs.hi,
		jumpHref = flBtnStyleData.bs.h;

	var option = {
		inputId : "flBtnLinkNet",
		moduleType : 1,
		jumpType: jumpIde? 1 : 0,
		jumpIde: jumpIde? jumpIde : jumpHref,
		jumpName: jumpName,
		setPageChange : callBackFlBtnLink
	};
	Site.jumpControl(option);
}

function callBackFlBtnLink(){
	var jumpCtrl = $("#jumpCtrl"),
		linkCus = jumpCtrl.attr("_ltype");
	if(linkCus == "103"){
		flBtnStyleData.bs.hi = "";
		flBtnStyleData.bs.h = jumpCtrl.attr("_lurl");
		flBtnStyleData.bs.hn = flBtnStyleData.bs.h;
	} else {
		flBtnStyleData.bs.hi = jumpCtrl.attr("_lide");
		flBtnStyleData.bs.h = jumpCtrl.attr("_lurl");
		flBtnStyleData.bs.hn = jumpCtrl.attr("_lname");
	}

	setPageChange();
}
//添加背景图片
function setflBtnBgImg(){
	var file_size_limit = 1;
	//加载栏目导航条背景上传对象
	//文件上传2.0 导航
	var fileUpload2_settings1 = {title:"添加图片", maxSize:parseInt(file_size_limit), type:['jpg','jpeg','gif','png'], from:"flBtn"};
	Site.fileUpload2("#flBtnBgFileButton", fileUpload2_settings1, callbackFlBtnBg);
}

//文件上传2.0返回事件 1
function callbackFlBtnBg(back){
	if(back){
		var resultBack = $.parseJSON(back),
			fileData = resultBack.data[0]||{},
			bgData = flBtnStyleData.bg;
		bgData.i = fileData.fileId;
		bgData.p = fileData.filePath;
		if( fileData.isMatBg ){
			//自动选上完全平铺
			bgData.r = 3;
			$("#flBtnBgRepeat option[value=3]").attr("selected",true);
		}

		if(!addMode){
			Site.setFlBtnBgChange(g_id, flBtnStyleData.bg);
		}
		setPageChange();
		$("#flBtnImgMsg").html('<a href="javascript:view(\'' + bgData.i + '\');">查看</a>');
	}
}
//点击预览
function view(fileId){
	var url = ".../view.jsp?fileID="+fileId;
	window.open(url);
}
function onBgColorChange(color){
	flBtnStyleData.bg.c = color;
	if(!addMode){
		Site.setFlBtnBgChange(g_id, flBtnStyleData.bg);
	}
	setPageChange();
}
function onShadowColorChange(color){
	flBtnStyleData.sh.c = color;
	if(!addMode){
		Site.setFlBtnShadowChange(g_id, flBtnStyleData.sh);
	}
	setPageChange();
}
function onBorderColorChange(color){
	flBtnStyleData.b.c = color;
	if(!addMode){
		Site.setFlBtnBorderChang(g_id, flBtnStyleData.b);
	}
	setPageChange();
}

//页面值改变
function setPageChange(){
	Site.setPageChange(true,popupID);	
}
//保存时reset
function reSetPageChange(){
	Site.setPageChange(false,popupID);	
}
</script>
</head>
<body class="popupTabBody">
	<div id="tabs">
    <ul>
        <li><a href="#basicSetting">常规</a></li>
        <li><a href="#advancedSetting">高级</a></li>
    </ul>
	<!-- basic setting -->
	<div id="basicSetting" class="basicSetting flBtnTabsBox hard-height-210">
        <div class="setline">
			<div class="setTitle">模块标题：</div>
			<div class="setCtrl">
				<input id="name" name="name" class="inputText setCtrl-input-90" type="text" value="浮动按钮" maxlength="50" /> 
			</div>
        </div>
        <div class="setline">
			<div class="setTitle">按钮内容：</div>
			<div class="setCtrl">
				<input id="flbtnContent" name="btnContent" class="inputText" type="text" onKeyUp="onFlBtnValChange()" onChange="onFlBtnValChange()" maxlength="50" />
			</div>
        </div>
        <div class="setline">
			<div class="setTitle">链接地址：</div>
			<div class="setCtrl">
				<div class="setCtrl">
					<input id="flBtnLinkNet" name="flBtnLinkNet" class="inputText setCtrl-input-100" type="text" maxlength="50" />
				</div>
				<div class="setCtrl">
					<input id="jumpCtrl" class="flBtnLink faiButton" type="button" value="设置链接" />
				</div>
			</div>
        </div>

		<div id="buttonStylePanel" class="setline flBtnStyle">
			<div class="setTitle">按钮样式：</div>
			<div class="setCtrl buttonStyleSelect">
				<span class="StyleListTitle">样式1</span>
				<div class="styleList styleList ">
					<div class="styleItem J_styleItem item101" _bs="101"></div>
					<div class="styleItem J_styleItem item102" _bs="102"></div>
					<div class="styleItem J_styleItem item103" _bs="103"></div>
					<div class="styleItem J_styleItem item104" _bs="104"></div>
					<div class="styleItem J_styleItem item105" _bs="105"></div>
					<div class="styleItem J_styleItem item106" _bs="106"></div>
				</div>
				<span class="StyleListTitle">样式2</span>
				<div class="styleList styleList">
					<div class="styleItem J_styleItem item201" _bs="201"></div>
					<div class="styleItem J_styleItem item202" _bs="202"></div>
					<div class="styleItem J_styleItem item203" _bs="203"></div>
					<div class="styleItem J_styleItem item204" _bs="204"></div>
					<div class="styleItem J_styleItem item205" _bs="205"></div>
					<div class="styleItem J_styleItem item206" _bs="206"></div>
				</div>
				<span class="StyleListTitle">样式3</span>
				<div class="styleList styleList">
					<div class="styleItem J_styleItem item301" _bs="301"></div>
					<div class="styleItem J_styleItem item302" _bs="302"></div>
					<div class="styleItem J_styleItem item303" _bs="303"></div>
					<div class="styleItem J_styleItem item304" _bs="304"></div>
					<div class="styleItem J_styleItem item305" _bs="305"></div>
					<div class="styleItem J_styleItem item306" _bs="306"></div>
				</div>
				<span class="StyleListTitle">样式4</span>
				<div class="styleList styleList">
					<div class="styleItem J_styleItem item401" _bs="401"></div>
					<div class="styleItem J_styleItem item402" _bs="402"></div>
					<div class="styleItem J_styleItem item403" _bs="403"></div>
					<div class="styleItem J_styleItem item404" _bs="404"></div>
					<div class="styleItem J_styleItem item405" _bs="405"></div>
					<div class="styleItem J_styleItem item406" _bs="406"></div>
				</div>
			</div>
		</div>
		<div class="clear-float"></div>
        <!-- photo group list -->
        <!--// photo group list -->
    </div>
    <!--// basic setting ends -->
    
    <!-- advanced setting -->
    <div id="advancedSetting" class="advancedSetting flBtnTabsBox hard-height-210 ">
			<div class="setline">
				<div class="setTitle">大小：</div>
				<div class="setCtrl setRadioCtrl">
					<input id="flBtnSize0" name="flBtnSize" type="radio" onClick="flBtnSizeChange(0);" /><label for="flBtnSize0">默认</label>
					<input id="flBtnSize1" name="flBtnSize" type="radio" onClick="flBtnSizeChange(1);" /><label for="flBtnSize1">自定义</label>
				</div>
			</div>
			<div class="setline cusBox flBtnSizeBox">
				<div class="title2">宽：</div>
				<div class="setCtrl">
					<input id="flBtnWid" class="setCtrl-input-42" name="flBtnWid" type="input" onKeyUp="onFlBtnWidthChange()" onChange="onFlBtnWidthChange()"   onKeyPress="javascript:return Fai.isNumberKey(event);" maxlength="3"/>
				</div>
				<div class="title2">高：</div>
				<div class="setCtrl">
					<input id="flBtnHei" class="setCtrl-input-42" name="flBtnHei" type="input" onKeyUp="onFlBtnHeightChange()" onChange="onFlBtnHeightChange()"  onKeyPress="javascript:return Fai.isNumberKey(event);" maxlength="3"/>
				</div>
			</div>
			<div class="setline">
				<div class="setTitle">背景：</div>
				<div class="setCtrl">
					<input id="flBtnBg0" name="flBtnBg" type="radio" onclick="flBtnBgChange(0);" /><label for="flBtnBg0">默认</label>
					<input id="flBtnBg1" name="flBtnBg" type="radio" onclick="flBtnBgChange(1);" /><label for="flBtnBg1">自定义</label>
				</div>
			</div>
			<div class="cusBox flBtnBgBox">
				<div class="setline flBtnBgColorCus">
					<div class="title2">颜色：</div>
					<div class="setCtrl">
						<div id="flBtnBgColorPicker" class="colorPicker"></div>
					</div>
				</div>

				<div class="setline flBtnBgPicCus itemlist">
					<div class="title2">图片：</div>
					<div class="setCtrl">
						<input type="button" id="flBtnBgFileButton" class="faiButton" value="添加图片"/>
					</div>
		            <div id="flBtnImgMsg" class="flBtnImgMsg setCtrl"></div>
				</div>
    
				<div class="setline flBtnBgShowCus itemlist">
					<div class="title2">显示方式：</div>
					<select class="setCtrl" id="flBtnBgRepeat" onChange="onFlBtnBgRepeatChange()" >  
						<option value="-1">不使用背景图片</option>
						<option value='0'>不平铺（居中）</option>
						<option value="3">完全平铺</option>
						<option value="4">拉伸平铺</option>
						<option value="5">缩放平铺（等比例）</option>
						<option value="21">纵向平铺（左边对齐）</option>
						<option value="2">纵向平铺（中间对齐）</option>s
						<option value="22">纵向平铺（右边对齐）</option>
						<option value="11">横向平铺（顶部对齐）</option>
						<option value="1">横向平铺（中部对齐）</option>
						<option value="12">横向平铺（底部对齐）</option>
						<option value='6'>不平铺（左对齐）</option>
						<option value='7'>不平铺（右对齐）</option>
						<option value='8'>不平铺（上对齐）</option>
						<option value='9'>不平铺（下对齐）</option>
						<option value='13'>不平铺（左上对齐）</option>
						<option value='14'>不平铺（右上对齐）</option>
						<option value='15'>不平铺（左下对齐）</option>
						<option value='16'>不平铺（右下对齐）</option>
					</select>
				</div>
			</div>
			<div class="setline">
				<div class="setTitle">圆角：</div>
				<div class="setCtrl setRadioCtrl">
					<input id="flBtnRadius0" name="flBtnRadius" type="radio" onClick="flBtnRadiusChange(0);" /><label for="flBtnRadius0">默认</label>
					<input id="flBtnRadius1" name="flBtnRadius" type="radio" onClick="flBtnRadiusChange(1);" /><label for="flBtnRadius1">隐藏</label>
					<input id="flBtnRadius2" name="flBtnRadius" type="radio" onClick="flBtnRadiusChange(2);" /><label for="flBtnRadius2">自定义</label>
				</div>
			</div>
			<div class="cusBox flBtnRadiusBox">
				<div>
					<div class="setline">
						<div class="title2">左上角：</div>
						<div class="setCtrl">
							<input id="flBtnLTRadius" class="setCtrl-input-42" name="flBtnLTRadius" type="input" onKeyUp="onFlBtnRadiusLtChange()" onChange="onFlBtnRadiusLtChange()" onKeyPress="javascript:return Fai.isNumberKey(event);" maxlength="3"/>
						</div>
						<div class="title2">右上角：</div>
						<div class="setCtrl">
							<input id="flBtnRTRadius" class="setCtrl-input-42" name="flBtnRTRadius" type="input" onKeyUp="onFlBtnRadiusRtChange()" onChange="onFlBtnRadiusRtChange()" onKeyPress="javascript:return Fai.isNumberKey(event);" maxlength="3"/>
						</div>
					</div>
					<div class="setline">
						<div class="title2">左下角：</div>
						<div class="setCtrl">
							<input id="flBtnLBRadius" class="setCtrl-input-42" name="flBtnLBRadius" type="input" onKeyUp="onFlBtnRadiusLbChange()" onChange="onFlBtnRadiusLbChange()" onKeyPress="javascript:return Fai.isNumberKey(event);" maxlength="3"/>
						</div>
						<div class="title2">右下角：</div>
						<div class="setCtrl">
							<input id="flBtnRBRadius" class="setCtrl-input-42" name="flBtnLRBadius" type="input" onKeyUp="onFlBtnRadiusRbChange()" onChange="onFlBtnRadiusRbChange()" onKeyPress="javascript:return Fai.isNumberKey(event);" maxlength="3"/>
						</div>
					</div>
				</div>
			</div>
			<div class="setline">
				<div class="setTitle">阴影：</div>
				<div class="setCtrl flBtnShadowCtrl">
					<input id="flBtnShadow0" type="radio" name="flBtnShadow" onClick="flBtnShadowChange(0)" /><label for="flBtnShadow0">默认</label>
					<input id="flBtnShadow1" type="radio" name="flBtnShadow" onClick="flBtnShadowChange(1)" /><label for="flBtnShadow1">隐藏</label>
					<input id="flBtnShadow2" type="radio" name="flBtnShadow" onClick="flBtnShadowChange(2)" /><label for="flBtnShadow2">自定义</label>
				</div>
			</div>
			<div class="cusBox flBtnShadowBox">
				<div class="setline">
					<div class="title2">距离：x：</div>
					<div class="setCtrl">
						<input id="flBtnShadowWid" class="setCtrl-input-42" name="floatBtnWid" type="input" onKeyUp="onFlBtnShadowDxChange()" onChange="onFlBtnShadowDxChange()" onKeyPress="javascript:return Fai.isNumberKey(event);" maxlength="3"/>
					</div>
					<div class="title2">y：</div>
					<div class="setCtrl">
						<input id="flBtnShadowHei" class="setCtrl-input-42" name="flBtnShadowHei" type="input" onKeyUp="onFlBtnShadowDyChange()" onChange="onFlBtnShadowDyChange()"  onKeyPress="javascript:return Fai.isNumberKey(event);" maxlength="3"/>
					</div>
				</div>
				<div class="setline">
					<div class="title2">模糊：</div>
					<div class="setCtrl">
						<input id="flBtnVague" class="setCtrl-input-42" name="flBtnVague" type="input" onKeyUp="onFlBtnShadowFChange()" onChange="onFlBtnShadowFChange()" onKeyPress="javascript:return Fai.isNumberKey(event);" maxlength="3"/>
					</div>

					<div class="title2" class="title2">颜色：</div>
					<div class="setCtrl">
						<div id="flBtnShadowColorPicker" class="colorPicker"></div>
					</div>
				</div>
			</div>
			<div class="setline">
				<div class="setTitle">描边：</div>
				<div class="setCtrl setRadioCtrl">
					<input id="flBtnBorder0" name="flBtnBorder" type="radio" onClick="flBtnBorderChanger(0);" /><label for="flBtnBorder0">默认</label>
					<input id="flBtnBorder1" name="flBtnBorder" type="radio" onClick="flBtnBorderChanger(1);" /><label for="flBtnBorder1">隐藏</label>
					<input id="flBtnBorder2" name="flBtnBorder" type="radio" onClick="flBtnBorderChanger(2);" /><label for="flBtnBorder2">自定义</label>
				</div>
			</div>
			<div class="cusBox flBtnBorderBox">
				<div class="setline">
					<div class="title2">大小：</div>
					<div class="setCtrl">
						<select class="setCtrl flBtnBorderSize" id="flBtnBorderSize" onChange="onFlBtnBorderWidthChange()"> ;
								<option value="0">0</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
						</select>
					</div>
					<span class="title2">颜色：</span>
					<div class="setCtrl">
						<div id="flBtnBorderColor" class="colorPicker"></div>
					</div>
				</div>
			</div>
	</div>
    <!--// advanced setting ends -->
</div>
</body>
</html>