<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/taglib/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" class="g_htmlManage">
  
  <head>
    <title>智慧星河</title>
	<%@ include file="/WEB-INF/view/taglib/header.jsp" %>
    <meta name="renderer" content="webkit">
    <meta name="mobile-agent" content="format=html5;url=http://m.seeyoui.icoc.in/"/>
    <!--[if lt IE 8]>
      <script type="text/javascript">
        window.location.href = "http://seeyoui.faisco.cn/kill-IE.jsp";
      </script>
    <![endif]-->
    <link type="text/css" href="./css/base.min.css?v=201601111801" rel="stylesheet" />
    <link type="text/css" href="./css/template/4003.min.css?v=201511091906" rel="stylesheet" id="templateFrame" class="templateFrameClass" />
    <link type="text/css" href="./css/bannerAnimation.min.css?v=201509241714" rel="stylesheet" />
    <link type='text/css' href='./css/pattern3.min.css?v=201512281739' rel='stylesheet'>
    <link type='text/css' href='./css/searchBoxStyle1.min.css?v=201512141713' rel='stylesheet'>
    <link type='text/css' href='./css/floatBtn1.min.css?v=201510121802' rel='stylesheet'>
    <link type='text/css' href='./css/photoCard1.min.css?v=201601051532' rel='stylesheet'>
    <link type="text/css" href="./css/edit.min.css?v=201601111801" rel="stylesheet" />
    <link type="text/css" href="./css/comm/jquery/poshytip/tip-yellowsimple.min.css?v=201410081739" rel="stylesheet" />
    <link type="text/css" href="./css/faiFloatPanel.min.css?v=201512281739" rel="stylesheet" />
    <link type="text/css" href="./css/site/mCustomScrollbar.min.css?v=201407221643" rel="stylesheet" />
    <link type="text/css" href="./css/site/siteGuide.min.css?v=201410131744" rel="stylesheet" />
    <style id='stylemodule'>
      #module320 {height:308px;} #module320 {border:none;} #module320 {padding:0px;}
      #module320 .formMiddle320{border:none;} #module320 .formMiddle320{padding:0px;}
      #module320 .formMiddle320 .formMiddleCenter320{border:none;} #module320
      .formMiddle320 .formMiddleCenter320{padding:0px;} #module320 .formTop320{display:none;}
      #module320 .formBottom320{display:none;} #module320 .formMiddle320 .formMiddleLeft320{display:none;}
      #module320 .formMiddle320 .formMiddleRight320{display:none;} #module320
      .formBanner320{display:none;} #module320 .formMiddleContent320{padding:0px;}
      #module320 .formMiddleContent320{margin-left:15px;} #module320 .formMiddleContent320{margin-right:10px;}
      #module320 .formMiddleContent320{margin-top:20px;} #module320 .formMiddleContent320{margin-bottom:5px;}
      #module320 .formMiddle320 a{text-decoration:none;} #module320 .formMiddle320
      a{font-family:微软雅黑;} #module320 .formMiddle320 a{font-weight:normal;} #module320
      .formMiddle320 a{font-size:16px;} #module314 {height:520px;} #module314
      .formBanner314{height:120px;} #module314 .formBanner314{line-height:120px;}
      #module314 .formBanner314 td{height:120px;} #module314 .formBanner314 td{line-height:120px;}
      #module314 .formBanner314 table{height:120px;} #module314 .formBanner314
      table{line-height:120px;} #module314 .formBanner314 div{height:120px;}
      #module314 .formBanner314 div{line-height:120px;} #module314 .titleText314{display:none;}
      #module314 .formBanner314{background:#ffffff url(./image/demo/ABUIABACGAAgs5PFrgUonZebnAYw7Ac4eA.jpg)
      no-repeat center;} #module314 .formBanner314 .center314{background:none;}
      #module314 .formBanner314 .right314{background:none;} #module314 .formBanner314
      .formBannerTitle314{background:none;} #module314 .formBanner314 .titleCenter314{background:none;}
      #module314 .formBanner314 .titleRight314{background:none;} #module314 .formBanner314
      .titleText314{background:none;} #module314 .formMiddleContent314{padding:0px;}
      #module314 .formMiddleContent314{margin-left:5px;} #module314 .formMiddleContent314{margin-right:0px;}
      #module314 .formMiddleContent314{margin-top:5px;} #module314 .formMiddleContent314{margin-bottom:5px;}
      #module316 {height:453px;} #module316 {border:none;} #module316 {padding:0px;}
      #module316 .formMiddle316{border:none;} #module316 .formMiddle316{padding:0px;}
      #module316 .formMiddle316 .formMiddleCenter316{border:none;} #module316
      .formMiddle316 .formMiddleCenter316{padding:0px;} #module316 .formTop316{display:none;}
      #module316 .formBottom316{display:none;} #module316 .formMiddle316 .formMiddleLeft316{display:none;}
      #module316 .formMiddle316 .formMiddleRight316{display:none;} #module316
      .formBanner316{height:120px;} #module316 .formBanner316{line-height:120px;}
      #module316 .formBanner316 td{height:120px;} #module316 .formBanner316 td{line-height:120px;}
      #module316 .formBanner316 table{height:120px;} #module316 .formBanner316
      table{line-height:120px;} #module316 .formBanner316 div{height:120px;}
      #module316 .formBanner316 div{line-height:120px;} #module316 .titleText316{display:none;}
      #module316 .formBanner316{background:transparent url(./image/demo/ABUIABACGAAgwpPFrgUo_KizyAUw7Ac4eA.jpg)
      no-repeat center;} #module316 .formBanner316 .center316{background:none;}
      #module316 .formBanner316 .right316{background:none;} #module316 .formBanner316
      .formBannerTitle316{background:none;} #module316 .formBanner316 .titleCenter316{background:none;}
      #module316 .formBanner316 .titleRight316{background:none;} #module316 .formBanner316
      .titleText316{background:none;} #module316 .formMiddleContent316{padding:0px;}
      #module316 .formMiddleContent316{margin-left:0px;} #module316 .formMiddleContent316{margin-right:0px;}
      #module316 .formMiddleContent316{margin-top:0px;} #module316 .formMiddleContent316{margin-bottom:0px;}
      #module316 {background:none;} #module316 .formMiddle316 {background:none;}
      #module316 .formMiddle316 .formMiddleCenter316{background:none;} #module316
      .formMiddleContent316{background:none;} #module315 {border:none;} #module315
      {padding:0px;} #module315 .formMiddle315{border:none;} #module315 .formMiddle315{padding:0px;}
      #module315 .formMiddle315 .formMiddleCenter315{border:none;} #module315
      .formMiddle315 .formMiddleCenter315{padding:0px;} #module315 .formTop315{display:none;}
      #module315 .formBottom315{display:none;} #module315 .formMiddle315 .formMiddleLeft315{display:none;}
      #module315 .formMiddle315 .formMiddleRight315{display:none;} #module315
      .titleText315{font-size:16px;} #module315 .titleText315{font-weight:bold;}
      #module315 .titleCenter315{overflow:visible;} #module315 .titleText315
      span{left:0px;} #module315 .titleText315 span{top:0px;} #module315 .titleText315{font-family:微软雅黑;}
      #module315 .formMiddle315{font-family:微软雅黑;} #module315 .formMiddle315
      .pic-mixNewsStyleSummary{font-family:微软雅黑;} #module315 .formMiddle315 .memberLoginItem{font-family:微软雅黑;}
      #module315 .title{font-size:12px;} #module315 .formMiddle315{font-size:12px;}
      #module315 .formMiddle315 .pic-mixNewsStyleSummary{font-size:12px;} #module315
      .formMiddle315 .productFilterNameCenter{font-size:12px;} #module315 .formMiddle315
      .memberLoginItem{font-size:12px;} #module315 .top_with_line_icon {padding-left:25px;}
      #module315 .contentLineIcon {width:0px} #module315 .formMiddle315 a{text-decoration:none;}
      #module315 .formMiddle315 a{font-family:微软雅黑;} #module315 .formMiddle315
      a{color:#399ec3;} #module315 .formMiddle315 a{font-weight:normal;} #module315
      .formMiddle315 a{font-size:16px;} #module307 {border:none;} #module307
      {padding:0px;} #module307 .formMiddle307{border:none;} #module307 .formMiddle307{padding:0px;}
      #module307 .formMiddle307 .formMiddleCenter307{border:none;} #module307
      .formMiddle307 .formMiddleCenter307{padding:0px;} #module307 .formTop307{display:none;}
      #module307 .formBottom307{display:none;} #module307 .formMiddle307 .formMiddleLeft307{display:none;}
      #module307 .formMiddle307 .formMiddleRight307{display:none;} #module307
      .titleText307{font-size:16px;} #module307 .titleText307{font-weight:bold;}
      #module307 .titleCenter307{overflow:visible;} #module307 .titleText307
      span{left:0px;} #module307 .titleText307 span{top:0px;} #module307 .titleText307{font-family:微软雅黑;}
      #module307 .formMiddle307{font-family:微软雅黑;} #module307 .formMiddle307
      .pic-mixNewsStyleSummary{font-family:微软雅黑;} #module307 .formMiddle307 .memberLoginItem{font-family:微软雅黑;}
      #module307 .title{font-size:12px;} #module307 .formMiddle307{font-size:12px;}
      #module307 .formMiddle307 .pic-mixNewsStyleSummary{font-size:12px;} #module307
      .formMiddle307 .productFilterNameCenter{font-size:12px;} #module307 .formMiddle307
      .memberLoginItem{font-size:12px;} #module307 .top_with_line_icon {padding-left:25px;}
      #module307 .contentLineIcon {width:0px} #module307 .formMiddle307 a{text-decoration:none;}
      #module307 .formMiddle307 a{font-family:微软雅黑;} #module307 .formMiddle307
      a{color:#399ec3;} #module307 .formMiddle307 a{font-weight:normal;} #module307
      .formMiddle307 a{font-size:16px;} #module458 .top_with_line_icon {padding-left:25px;}
      #module458 .contentLineIcon {width:0px} #module461 {height:200px;} #module461
      {border:none;} #module461 {padding:0px;} #module461 .formMiddle461{border:none;}
      #module461 .formMiddle461{padding:0px;} #module461 .formMiddle461 .formMiddleCenter461{border:none;}
      #module461 .formMiddle461 .formMiddleCenter461{padding:0px;} #module461
      .formTop461{display:none;} #module461 .formBottom461{display:none;} #module461
      .formMiddle461 .formMiddleLeft461{display:none;} #module461 .formMiddle461
      .formMiddleRight461{display:none;} #module461 .formBanner461{display:none;}
      #module461 .formMiddleContent461{padding:0px;} #module461 .formMiddleContent461{margin-left:0px;}
      #module461 .formMiddleContent461{margin-right:0px;} #module461 .formMiddleContent461{margin-top:0px;}
      #module461 .formMiddleContent461{margin-bottom:0px;} #module311 {border:none;}
      #module311 {padding:0px;} #module311 .formMiddle311{border:none;} #module311
      .formMiddle311{padding:0px;} #module311 .formMiddle311 .formMiddleCenter311{border:none;}
      #module311 .formMiddle311 .formMiddleCenter311{padding:0px;} #module311
      .formTop311{display:none;} #module311 .formBottom311{display:none;} #module311
      .formMiddle311 .formMiddleLeft311{display:none;} #module311 .formMiddle311
      .formMiddleRight311{display:none;} #module311 .formBanner311{display:none;}
      #module311 .formMiddle311 a{text-decoration:none;} #module311 .formMiddle311
      a{font-family:微软雅黑;} #module311 .formMiddle311 a{color:#7f7f7f;} #module311
      .formMiddle311 a{font-weight:normal;} #module311 .formMiddle311 a{font-size:12px;}
      #module311 {background:none;} #module311 .formMiddle311 {background:none;}
      #module311 .formMiddle311 .formMiddleCenter311{background:none;} #module311
      .formMiddleContent311{background:none;} #module462 {border:none;} #module462
      {padding:0px;} #module462 .formMiddle462{border:none;} #module462 .formMiddle462{padding:0px;}
      #module462 .formMiddle462 .formMiddleCenter462{border:none;} #module462
      .formMiddle462 .formMiddleCenter462{padding:0px;} #module462 .formTop462{display:none;}
      #module462 .formBottom462{display:none;} #module462 .formMiddle462 .formMiddleLeft462{display:none;}
      #module462 .formMiddle462 .formMiddleRight462{display:none;} #module462
      .formBanner462{display:none;} #module462 .formMiddleContent462{padding:0px;}
      #module462 .formMiddleContent462{margin-left:0px;} #module462 .formMiddleContent462{margin-right:0px;}
      #module462 .formMiddleContent462{margin-top:0px;} #module462 .formMiddleContent462{margin-bottom:0px;}
      #module462 {background:none;} #module462 .formMiddle462 {background:none;}
      #module462 .formMiddle462 .formMiddleCenter462{background:none;} #module462
      .formMiddleContent462{background:none;} #module467 .contentLineIcon {width:0px}
      #module471 .formBanner471{display:none;} #module476 {height:581px;} #module476
      {border:none;} #module476 {padding:0px;} #module476 .formMiddle476{border:none;}
      #module476 .formMiddle476{padding:0px;} #module476 .formMiddle476 .formMiddleCenter476{border:none;}
      #module476 .formMiddle476 .formMiddleCenter476{padding:0px;} #module476
      .formTop476{display:none;} #module476 .formBottom476{display:none;} #module476
      .formMiddle476 .formMiddleLeft476{display:none;} #module476 .formMiddle476
      .formMiddleRight476{display:none;} #module476 .formBanner476{display:none;}
      #module456 {height:110px;} #module456 {border:none;} #module456 {padding:0px;}
      #module456 .formMiddle456{border:none;} #module456 .formMiddle456{padding:0px;}
      #module456 .formMiddle456 .formMiddleCenter456{border:none;} #module456
      .formMiddle456 .formMiddleCenter456{padding:0px;} #module456 .formTop456{display:none;}
      #module456 .formBottom456{display:none;} #module456 .formMiddle456 .formMiddleLeft456{display:none;}
      #module456 .formMiddle456 .formMiddleRight456{display:none;} #module456
      .formBanner456{display:none;} #module456 {background:none;} #module456
      .formMiddle456 {background:none;} #module456 .formMiddle456 .formMiddleCenter456{background:none;}
      #module456 .formMiddleContent456{background:none;} #module479 {height:54px;}
      #module479 {border:none;} #module479 {padding:0px;} #module479 .formMiddle479{border:none;}
      #module479 .formMiddle479{padding:0px;} #module479 .formMiddle479 .formMiddleCenter479{border:none;}
      #module479 .formMiddle479 .formMiddleCenter479{padding:0px;} #module479
      .formTop479{display:none;} #module479 .formBottom479{display:none;} #module479
      .formMiddle479 .formMiddleLeft479{display:none;} #module479 .formMiddle479
      .formMiddleRight479{display:none;} #module479 .formBanner479{display:none;}
      #module479 {background:none;} #module479 .formMiddle479 {background:none;}
      #module479 .formMiddle479 .formMiddleCenter479{background:none;} #module479
      .formMiddleContent479{background:none;} #module483 {height:20px;} #module483
      {border:none;} #module483 {padding:0px;} #module483 .formMiddle483{border:none;}
      #module483 .formMiddle483{padding:0px;} #module483 .formMiddle483 .formMiddleCenter483{border:none;}
      #module483 .formMiddle483 .formMiddleCenter483{padding:0px;} #module483
      .formTop483{display:none;} #module483 .formBottom483{display:none;} #module483
      .formMiddle483 .formMiddleLeft483{display:none;} #module483 .formMiddle483
      .formMiddleRight483{display:none;} #module483 .formBanner483{display:none;}
      #module483 .formMiddleContent483{padding:0px;} #module483 .formMiddleContent483{margin-left:0px;}
      #module483 .formMiddleContent483{margin-right:0px;} #module483 .formMiddleContent483{margin-top:0px;}
      #module483 .formMiddleContent483{margin-bottom:0px;} #module483 {background:none;}
      #module483 .formMiddle483 {background:none;} #module483 .formMiddle483
      .formMiddleCenter483{background:none;} #module483 .formMiddleContent483{background:none;}
      #module485 {border:none;} #module485 {padding:0px;} #module485 .formMiddle485{border:none;}
      #module485 .formMiddle485{padding:0px;} #module485 .formMiddle485 .formMiddleCenter485{border:none;}
      #module485 .formMiddle485 .formMiddleCenter485{padding:0px;} #module485
      .formTop485{display:none;} #module485 .formBottom485{display:none;} #module485
      .formMiddle485 .formMiddleLeft485{display:none;} #module485 .formMiddle485
      .formMiddleRight485{display:none;} #module485 .formBanner485{display:none;}
      #module485 {background:none;} #module485 .formMiddle485 {background:none;}
      #module485 .formMiddle485 .formMiddleCenter485{background:none;} #module485
      .formMiddleContent485{background:none;} #module319 {border:none;} #module319
      {padding:0px;} #module319 .formMiddle319{border:none;} #module319 .formMiddle319{padding:0px;}
      #module319 .formMiddle319 .formMiddleCenter319{border:none;} #module319
      .formMiddle319 .formMiddleCenter319{padding:0px;} #module319 .formTop319{display:none;}
      #module319 .formBottom319{display:none;} #module319 .formMiddle319 .formMiddleLeft319{display:none;}
      #module319 .formMiddle319 .formMiddleRight319{display:none;} #module319
      .formBanner319{display:none;} #module319 {background:none;} #module319
      .formMiddle319 {background:none;} #module319 .formMiddle319 .formMiddleCenter319{background:none;}
      #module319 .formMiddleContent319{background:none;}
    </style>
    <style id='styleHeaderTop' type='text/css'>
    </style>
    <style id='stylefooter' type='text/css'>
      #footer .footerInfo { float: left;} #footer .footerNav { text-align: left;}
      #footer .footerInfo { text-align: left;} #footer .footerSupport { text-align:
      left;} #footer .visitorCounterPosition { float: left; } #footer .footerItemListContainer{
      text-align: left;} #footer .footerNav { padding: 0 0px 0 0px;} #footer
      .footerInfo { padding: 0 0px 0 0px;} #footer .footerSupport { padding:
      0 0px 0 0px;} #footer .visitorCounterWrap { padding: 0 0px 0 0px;} #footer
      .footerContent { padding-top: 0px;} #footer .footerContent { padding-bottom:
      20px;} #footer .footerInfo a{font-size:12px;} #footer .footerSupport a{font-size:12px;}
      #footer .footerInfo a{font-weight:normal; } #footer .footerSupport a{font-weight:normal;
      } #footer .footerInfo a{font-family:SimSun;} #footer .footerSupport a{font-family:SimSun;}
      #footer .footerInfo a{ color:#7f7f7f;} #footer .footerSupport a{ color:#7f7f7f;}
      #footer .footerInfo a{ text-decoration:none;} #footer .footerSupport a{
      text-decoration:none;} #footer .footerInfo a:hover{ color:#000000;} #footer
      .footerSupport a:hover{ color:#000000;} #footer .footerInfo{font-size:12px;}
      #footer .footerSupport{font-size:12px;} #footer .footerInfo{font-family:SimSun;}
      #footer .footerSupport{font-family:SimSun;} #footer .footerInfo{ color:#7f7f7f;}
      #footer .footerSupport{ color:#7f7f7f;} #webFooterTable {background:#000
      url(./image/demo/ABUIABACGAAg_5jFrgUosLbshAcw8w44_gE.jpg) repeat center;}
      #webFooterTable .webFooter {background:none;} #webFooterTable .footer {background:none;border-color:transparent;}
      #webFooterTable .footerTop {display:none;} #webFooterTable .middleLeft
      {display:none;} #webFooterTable .middleCenter {background:none;} #webFooterTable
      .footerContent {background:none;} #webFooterTable .footerNav {background:none;}
      #webFooterTable .footerInfo {background:none;} #webFooterTable .footerSupport
      {background:none;} #webFooterTable .middleRight {display:none;} #webFooterTable
      .footerBottom {display:none;} #webFooterTable li.footerItemSpacing{padding-left:7px;padding-right:7px;}
      #webFooterTable div.footerVerticalLine{width:1px;} #webFooterTable div.footerVerticalLine{background-color:#7f7f7f;}
      #webFooterTable div.footerItemTop .footerItemTopLink{font-weight:normal;}
      #webFooterTable div.footerItemTop .footerItemTopLink{text-decoration:none;}
      #webFooterTable div.footerItemTop .footerItemTopLink{color:#7f7f7f;} #webFooterTable
      div.footerItemTop a:hover{color:#000000;}
    </style>
    <style id='styleBannerBg' type='text/css'>
      .webBanner{background:none;} #webBanner .bannerLeft{background:none;}
      #webBanner .bannerRight{background:none;} .webBannerTable{background:#63b4d2;}
    </style>
    <style id='styleWebSite' type='text/css'>
      #memberBar{width:1000px;} #webTop{width:1000px;} #absTopForms{width:1000px;}
      #webHeader{width:1000px;} .webNavDefault{width:1000px;} #webBanner{width:1000px;}
      #absForms{width:1000px;} #webContainer{width:1000px;} #absBottomForms{width:1000px;}
      #webFooter{width:1000px;} div.webNav .navMainContent{width:1000px;} div.nav
      .navMainContent{width:1000px;} .fullmeasureContent{width:1000px;}
    </style>
    <style id='stylenav' type='text/css'>
      #nav .itemSelected {background:none!important;} #nav .itemSelected .itemLeft{background:none!important;}
      #nav .itemSelected .itemCenter{background:none!important;} #nav .itemSelected
      .itemRight{background:none!important;} #nav .itemSelected .itemCenter a{background:none!important;}
      #nav .itemHover {background:none!important;} #nav .itemHover .itemLeft{background:none!important;}
      #nav .itemHover .itemCenter{background:none!important;} #nav .itemHover
      .itemCenter a{background:none!important;} #nav .itemHover .itemRight{background:none!important;}
    </style>
    <script type="text/javascript" language="javascript">
      document.domain = 'faisco.cn';

      var _portalHost = 'www.faisco.cn';
    </script>
    <script type="text/javascript" language="javascript">
      window.setTimeout(function() {
        var disableScriptTips = document.getElementById('disableScriptTips');
        if (disableScriptTips) {
          disableScriptTips.style.display = 'inline';
          disableScriptTips.style.color = '#facd89';
        }
      },
      10000);
    </script>
  </head>
  
  <body class="g_bodyManage g_locale2052 g_cusSiteWidth">
    <iframe id="guideLowBrowser" style="display:none;position:absolute;z-index:10000;width:100%;height:100%;">
    </iframe>
    <script type="text/javascript" src="./js/comm/testBrowser.min.js?v=201510121802"></script>
    <script type="text/javascript">
      domainLink = "http://www.seeyoui.icoc.in" + window.location.pathname + window.location.search;
    </script>
	<!-- top工具条 -->
    <div id="topBarArea" class="g_topBarArea g_editPanel" style=''>
      <div id="arrow" class="g_arrow g_arrow_up">
      </div>
      <div id="topBar" class="g_topBar">
        <div class="navbar_left">
          <a href="javascript:;" id="webDesign" class="tbutton" onclick="Site.styleSetting('open', 'webTemplateTab');Site.logDog(100038, 2);">
            <div class="styleSettingButton">
              <span class="siteIco styleSettingDesign">
              </span>
              <span class="styleSettingTitle">
                网站设计
              </span>
            </div>
          </a>
		  <!--
          <a href="javascript:;" onclick="Site.showTopManageFrame('manageFrameProductManage');Site.logDog(100038, 3);return false;"
          id="topWebsiteManage" style="outline:none;" class="tbutton">
            <div class="styleSettingButton">
              <span class="siteIco styleSettingManage">
              </span>
              <span class="styleSettingTitle">
                网站管理
              </span>
            </div>
          </a>
          <a href="http://www.faisco.cn/portal.jsp" class="tbutton" target="_blank"
          onclick="Site.logDog(100038, 4);">
            <div class="styleSettingButton">
              <span class="siteIco styleSettingPortal">
              </span>
              <span class="styleSettingTitle">
                商务平台
              </span>
            </div>
          </a>
          <a href="http://m.seeyoui.faisco.cn/manage/mobiDesign.jsp" class="tbutton"
          onclick="Site.logDog(100038, 15);" target="_blank">
            <div class="styleSettingButton">
              <span class="siteIco styleSettingMobi">
              </span>
              <span class="styleSettingTitle">
                手机版
              </span>
            </div>
          </a>
		  -->
        </div>
        <div class="navbar_right" style="display:none;">
          <div id="topBarStaff" class="siteTitle" _mouseIn="0">
            <div class="siteVersion siteGroupFre">
            </div>
            <div class="titleName">
            </div>
          </div>
          <div class="line">
          </div>
          <div class="topBarBulletin" _mouseIn="0">
          </div>
          <div class="line" style="margin-left: 2px;">
          </div>
          <div id="choiceService" _mouseIn="0" class="choiceServiceInfo">
            <div class="choiceServiceText">
              服务支持
            </div>
            <div class="titleName">
            </div>
          </div>
          <div class="line" style="margin-right: 2px;">
          </div>
          <div id="mySite" _mouseIn="0" class="mySite">
            <div class="mySiteText">
              我的网址
            </div>
            <div class="titleName">
            </div>
          </div>
        </div>
        <div style="clear:both;">
        </div>
        <div id="mailTip" class="mailTip" style="display:none;" mailHref="mail.faisco.cn/mail/index.jsp">
        </div>
        <div class="serviceList">
          <a class="serviceItem onlineQQ" href="http://www.faisco.cn/qq.jsp?s=4"
          target="_blank" onclick="Site.logDog(100038, 8);">
            在线客服
          </a>
          <a class="serviceItem siteguide" href="javascript:;" onclick="Site.siteGuidePopupWindow();Site.logDog(100038, 23);">
            建站指引
          </a>
          <a class="serviceItem" href="http://jz.faisco.com/blog.html" target="_blank"
          onclick="Site.logDog(100038, 11);">
            帮助中心
          </a>
          <a class="serviceItem" href="http://e.weibo.com/faisco" target="_blank"
          onclick="Site.logDog(100038, 13);">
            新浪微博
          </a>
          <span class="serviceItem siteweixin">
            微信关注
            <span class="spanDIV">
            </span>
          </span>
          <div style="clear:both;">
          </div>
        </div>
        <div class="topBarStaffContent">
          <div class="top">
            <a hidefocus="true" class="versionLink" href="http://jz.faisco.com/proFunc.html"
            title="您在使用“网站免费版”，点击了解更多。" target="_blank" onclick="Site.logDog(100038, 1);">
              <div class="versionIcon siteGroupFre">
              </div>
            </a>
            <div class="right">
              <div class="title">
                网站免费版
                <a hidefocus="true" href="http://www.faisco.cn/jump.jsp?t=10&d=100097&s=5"
                class="update" target="_blank" title="升级后您的网站内容将完整保留。">
                  &nbsp;
                </a>
              </div>
              <div class="text">
                免费版用户每个月至少登录一次，逾期未登录则关闭网站。
              </div>
              <div style="clear:both;">
              </div>
            </div>
            <div style="clear:both;">
            </div>
          </div>
          <div class="bottom">
            <div class="topBarHelloTip">
              boss
            </div>
            <div class="topBarHelloTip">
              ,下午好!
            </div>
            <a hidefocus="true" class="staffManage" href="http://www.faisco.cn/portal.jsp#appId=corpStaff"
            target="_blank" style="margin-right:5px;">
              [管理员工]
            </a>
            <a href="javascript:Site.logDog(100038, 6);Site.logout('http://www.seeyoui.icoc.in');"
            hidefocus="true" class="exit">
              [退出]
            </a>
          </div>
        </div>
        <div id="topBarMySiteContent" class="topBarMySiteContent2">
          <div class="mainUrlDiv">
            <a hidefocus="true" id="topBarMySiteMainUrl" class="mainUrl" href="" title=""
            onclick="Site.logDog(100038, 7);" target="_blank">
            </a>
          </div>
          <div class="textLine" style="border-bottom:1px solid #dadada;">
            <a hidefocus="true" id="topBarMySiteCopyBtn" class="toolbtn btn" href="javascript:;"
            data-clipboard-target="topBarMySiteMainUrl">
              [复制]
            </a>
            <a hidefocus="true" class="toolbtn btn" href="javascript:;" onClick="Fai.addBookmark(top.document.title, 'http://www.seeyoui.icoc.in/?_sc=5');Site.logDog(100038, 9);">
              [收藏]
            </a>
            <a hidefocus="true" class="toolbtn btn" href="/shortcut.jsp" onclick="Site.logDog(100038, 10);"
            title="下载“我的网址”到桌面">
              [添加到桌面]
            </a>
            <span>
              分享：
            </span>
            <a hidefocus="true" class="sina_weibo shareBtn" title="分享到新浪微博" href="javascript:;"
            onclick="window.open('http://service.weibo.com/share/share.php?title=智慧星河&url='+encodeURIComponent(domainLink)+'&source=bookmark')">
            </a>
            <a hidefocus="true" class="qq_weibo shareBtn" title="分享到腾讯微博" href="javascript:;"
            onclick="window.open('http://v.t.qq.com/share/share.php?title=智慧星河&url='+encodeURIComponent(domainLink)+'&site=http%3A%2F%2Fwww.seeyoui.icoc.in%2F%3F_sc%3D1')">
            </a>
            <a hidefocus="true" class="qq_zone shareBtn" title="分享到QQ空间" href="javascript:;"
            onclick="window.open('http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?url='+encodeURIComponent(domainLink)+'&title=智慧星河&pics=&summary=')">
            </a>
            <a hidefocus="true" class="Weixin shareBtn" title="分享到微信" href="javascript:;"
            onclick="Site.wxShareAlter('cn/qrCode.jsp?cmd=mobiQR&_s=190');return false;">
            </a>
          </div>
          <div id="topBarMySiteCheckDomain" class="topBarMySiteCheckDomain">
            <div class="checkDomainDiv">
              <span style='float:left; font-family:"微软雅黑"; font-size:14px;'>
                www.&nbsp;
              </span>
              <input type="text" id="topBarMySiteDomain" value="seeyoui" />
              <select id="topBarMySiteDomainSuffix">
                <option value=".com" selected>
                  .com
                </option>
                <option value=".net">
                  .net
                </option>
                <option value=".org">
                  .org
                </option>
              </select>
              <a hidefocus="true" href="javascript:;" id="topBarMySiteDomainCheck">
                查&nbsp;询
              </a>
              <div id="topBarMySiteDomainBuy" onclick="Site.logDog(100038, 25);return false;">
                索&nbsp;要
              </div>
            </div>
            <div id="topBarMySiteCheckResult">
              <span id="topBarMySiteCheckResultIco" style="display:inline-block; width:30px; height:30px;">
                &nbsp;
              </span>
              <span class="text">
              </span>
            </div>
          </div>
        </div>
        <div class="topBarBulletinContent">
          <div class="menuDiv">
            <div id="menuMessage" class="menu menu-check">
              我的消息
            </div>
            <div class="line">
            </div>
            <div id="menuUpdate" class="menu">
              功能更新
              <div class="redPoint">
              </div>
            </div>
          </div>
          <div id="message" class="listDiv">
            <a class="adImg" href="http://jz.faisco.com/pro/20160101.html?_s=5" target="_blank"
            onclick='Site.logDog(100038, 28);'>
              <img width="243" height="73" src="http://jz.faisys.com/image/pro/20160101/topBarFree.jpg?v=201512311151"
              />
            </a>
            <div class='list '>
              <a hidefocus='true' href="http://www.sitekc.com/pro1.jsp?_s=8" target='_blank'
              style='color:#f30;' onclick='Site.logDog(100038, 109);'>
                <span class='icon1'>
                  &nbsp;
                </span>
                0元加盟，年入百万，建站快车火热加盟中
              </a>
            </div>
            <div class='list '>
              <a hidefocus='true' href="http://jz.faisco.com/pro/dj.html" target='_blank'
              style='color:#f30;' onclick='Site.logDog(100038, 109);'>
                <span class='icon1'>
                  &nbsp;
                </span>
                想网站漂亮？不想动手？凡科帮你设计！
              </a>
            </div>
            <div class='list '>
              <a hidefocus='true' href="http://www.faisco.cn/corp/index.jsp" target='_blank'
              onclick='Site.logDog(100038, 112);'>
                <span class='icon0'>
                  &nbsp;
                </span>
                马上完善注册资料，第一时间掌握重要通知
              </a>
            </div>
          </div>
          <div id="update" class="listDiv" style="display:none;">
            <div class='list'>
              <a hidefocus='true' href="http://jz.faisco.com/news/3274" target='_blank'
              onclick='Site.logDog(100038, 102);'>
                <span class='iconPoint'>
                  &nbsp;
                </span>
                01月13日更新：企业邮箱全面升级
              </a>
            </div>
            <div class='list'>
              <a hidefocus='true' href="http://jz.faisco.com/news/3187" target='_blank'
              onclick='Site.logDog(100038, 102);'>
                <span class='iconPoint'>
                  &nbsp;
                </span>
                01月06日更新：您的网站可开展作品评选活动
              </a>
            </div>
            <div class='list'>
              <a hidefocus='true' href="http://jz.faisco.com/news/3130" target='_blank'
              onclick='Site.logDog(100038, 102);'>
                <span class='iconPoint'>
                  &nbsp;
                </span>
                12月30日更新：新上线魔方图册模块
              </a>
            </div>
            <div class='list'>
              <a hidefocus='true' href="http://jz.faisco.com/news/3050" target='_blank'
              onclick='Site.logDog(100038, 102);'>
                <span class='iconPoint'>
                  &nbsp;
                </span>
                12月23日更新：新上线圣诞节日横幅
              </a>
            </div>
            <div class='list'>
              <a hidefocus='true' href="http://jz.faisco.com/news/2972" target='_blank'
              onclick='Site.logDog(100038, 102);'>
                <span class='iconPoint'>
                  &nbsp;
                </span>
                12月16日更新：类似京东淘宝的购物车入口
              </a>
            </div>
            <div class='list'>
              <a hidefocus='true' href="http://jz.faisco.com/news/2903" target='_blank'
              onclick='Site.logDog(100038, 102);'>
                <span class='iconPoint'>
                  &nbsp;
                </span>
                12月09日更新：商城网站支持促销活动
              </a>
            </div>
          </div>
        </div>
      </div>
      <div id="scrollbar" class="onloading">
        正在加载网站管理功能...
      </div>
      <script type="text/javascript">
        var topBarMainUrl = document.getElementById("topBarMySiteMainUrl");
        topBarMainUrl.title = domainLink;
        topBarMainUrl.href = domainLink;
        topBarMainUrl.innerHTML = domainLink;
      </script>
    </div>
    <div id="styleDesign" class="g_styleDesign g_editPanel">
      <div class="tabsWrap">
        <ul id="tabs" class="tabs">
          <li style="width:100px; text-align:right; color:#fff;">
          </li>
          <li>
            <a id="webTemplateTab" class="tabsMenu" href="javascript:;" onfocus="this.blur()"
            onclick="Site.webTemplateTabClick2();return false;">
              网站主题
            </a>
          </li>
          <li style="">
            <a class="tabsMenu" href="javascript:;" onfocus="this.blur()" id="webBannerTab"
            onclick="Site.webBannerTabClick();return false;">
              网站横幅
            </a>
          </li>
          <li>
            <a class="tabsMenu" href="javascript:;" onfocus="this.blur()" id="pageLayoutTab"
            onclick="Site.pageLayoutTabClick();return false;">
              页面版式
            </a>
          </li>
		  <!--
          <li>
            <a class="tabsMenu" href="javascript:;" onfocus="this.blur()" id="webSettingTab"
            onclick="Site.webSettingTabClick();return false;">
              网站设置
            </a>
          </li>
          <li>
            <a class="tabsMenu" href="javascript:;" onfocus="this.blur()" id="baiduOptTab"
            onclick="Site.baiduOptClick();return false;">
              百度优化
            </a>
          </li>
		  -->
          <li style="text-align:right;" id="styleDesignBtnContainer" class="styleDesignBtnContainer-five">
            <a href="javascript:;" onclick="Site.toggleSetWebTemplateTab();return false;"
            class="J_webTemplateTabSwitch fk-webTemplateTabSwitch">
            </a>
            <a href="javascript:;" class="cancelBtn" onclick="Site.closeStyleDesign();return false">
              取&nbsp;消
            </a>
            <a href="javascript:;" id="saveButton" class="saveBtn buttonDisabled"
            onclick="Site.saveStyle();return false;">
              <span class="saveIcon">
              </span>
              <span class="saveText">
                保&nbsp;&nbsp;存
              </span>
            </a>
          </li>
          <li>
            <div id="styleDesignArrow" title="点击收起设计面板" class="g_styleDesignArrowUp"
            onclick="Site.changeStyleDesignPanes();">
            </div>
          </li>
        </ul>
      </div>
      <!-- tab "panes" -->
      <div id="panes" class="panes">
        <div style="display: block;" id="webTemplate" class="webTemplate">
          <iframe src="./styleTemplate2.htm" id="webTemplateFrame" scrolling="auto"
          frameborder="0" height="205px" width="100%">
          </iframe>
        </div>
        <div style="display: none;" id="webBannerStyle" class="funcModule">
          <iframe src="./styleBanner.htm" id="webBannerFrame" scrolling="auto" frameborder="0"
          height="205px" width="100%">
          </iframe>
        </div>
        <div style="display: none;" id="pageLayout" class="funcModule">
          <iframe src="./styleLayout.htm" id="pageLayoutFrame" scrolling="auto"
          frameborder="0" height="205px" width="100%">
          </iframe>
        </div>
		<!--
        <div style="display: none;" id="webSetting" class="funcModule">
          <iframe src="./styleGlobal.htm" id="webSettingFrame" scrolling="auto"
          frameborder="0" height="205px" width="100%">
          </iframe>
        </div>
        <div style="display: none;" id="baiduOpt" class="funcModule">
          <iframe id="baiduOptFrame" scrolling="auto" frameborder="0" height="205px"
          width="100%">
          </iframe>
        </div>
		-->
      </div>
      <!--<div id="styleDesignTips" class="styleDesignTips">
      <div class="styleTips">您可以直接拖动模块，或者点击上方标签对网站进行设计。点击“保存”后生效。</div>
      </div>-->
    </div>
    <div id="g_main" class='g_main g_col2 g_mainManage' style='top:44px'>
      <div id="web" class="g_web g_webManage">
        <table class="webTopTable" cellpadding="0" cellspacing="0">
          <tr>
            <td align="center">
              <div id="webTop" class="webTop">
                <div id='corpTitle' class='corpTitle corpTitle2' fontPatternTitle='false'
                style=';' _linkType='0'>
                  <div id='primaryTitle' style=''>
                  </div>
                  <div id='subTitle' style=''>
                  </div>
                </div>
                <div id='logo' class='logo logo2' style='top:65px;left:58px;'>
                  <a id='logoLink' hidefocus='true' class='link-p' link='javascript:;' onclick='return false;'>
                    <img id='logoImg' title='智慧星河' alt='智慧星河' style='float:left;' height='50'
                    width='187' src='./image/demo/ABUIABAEGAAg6ua7rgUoyMTtRDC7ATgy.png' />
                  </a>
                </div>
              </div>
            </td>
          </tr>
        </table>
        <table class="absTopTable" cellpadding="0" cellspacing="0">
          <tr>
            <td align="center">
              <div id="absTopForms" class="forms sideForms absForms">
                <div style="position:absolute;">
                </div>
                <!-- for ie6 -->
                <div id='module456' _indexClass='formIndex1' class='form form456 formIndex1 formStyle79 extformClass '
                title='' style='position:absolute;top:119px;left:205px;width:110px;' _side='0'
                _inTab='0' _inMulMCol='0' _inFullmeasure='0' _autoHeight='0' _global='false'
                _independent='false'>
                  <div class='formWrap formWrap456'>
                    <table class='formTop formTop456' cellpadding='0' cellspacing='0'>
                      <tr>
                        <td class='left'>
                        </td>
                        <td class='center'>
                        </td>
                        <td class='right'>
                        </td>
                      </tr>
                    </table>
                    <table class='formBanner formBanner456' cellpadding='0' cellspacing='0'>
                      <tr>
                        <td class='left left456'>
                        </td>
                        <td class='center center456' valign='top'>
                          <table cellpadding='0' cellspacing='0' class='formBannerTitle formBannerTitle456'>
                            <tr>
                              <td class='titleLeft titleLeft456' valign='top'>
                              </td>
                              <td class='titleCenter titleCenter456' valign='top'>
                                <div class='titleText titleText456'>
                                  <span>
                                    浮动图片
                                  </span>
                                </div>
                              </td>
                              <td class='titleRight titleRight456' valign='top'>
                              </td>
                            </tr>
                          </table>
                          <div class='formBannerOther formBannerOther456'>
                            <div class='formBannerBtn formBannerBtn456'>
                              <span style='_display:inline-block;_position:relative;'>
                                <a hidefocus='true' href='javascript:;' onclick='Site.closeAd("module456");return false;'
                                class='g_close'>
                                  <span style='_display:none;'>
                                    &nbsp;
                                  </span>
                                </a>
                              </span>
                            </div>
                            &nbsp;
                          </div>
                        </td>
                        <td class='right right456'>
                        </td>
                      </tr>
                    </table>
                    <table class='formMiddle formMiddle456' style='height:110px; ' cellpadding='0'
                    cellspacing='0'>
                      <tr>
                        <td class='formMiddleLeft formMiddleLeft456'>
                        </td>
                        <td class='formMiddleCenter formMiddleCenter456' valign='top'>
                          <div class='formMiddleContent formMiddleContent456  '>
                            <div class='floatImg floatImg_J floatImg_noImg_J' onclick='Site.addNewFloatImg(456)'>
                              <a hidefocus='true' style='cursor:pointer;'>
                                <img id='float_img_456' class='float_in_img' src='./image/floatimgadd.jpg'
                                style=' height:110px; width:110px;' />
                              </a>
                            </div>
                          </div>
                        </td>
                        <td class='formMiddleRight formMiddleRight456'>
                        </td>
                      </tr>
                    </table>
                    <table class='formBottom formBottom456' cellpadding='0' cellspacing='0'>
                      <tr>
                        <td class='left left456'>
                        </td>
                        <td class='center center456'>
                        </td>
                        <td class='right right456'>
                        </td>
                      </tr>
                    </table>
                    <div class='clearfloat clearfloat456'>
                    </div>
                  </div>
                </div>
                <div id='module472' _indexClass='formIndex2' class='form  formIndex2 formStyle62 extformClass '
                title='' style='position:absolute;top:40px;left:748px;width:250px;' _side='0'
                _inTab='0' _inMulMCol='0' _inFullmeasure='0' _autoHeight='1' _global='true'
                _independent='false'>
                  <div class='formWrap formWrap472'>
                    <table class='formTop formTop472' cellpadding='0' cellspacing='0'>
                      <tr>
                        <td class='left'>
                        </td>
                        <td class='center'>
                        </td>
                        <td class='right'>
                        </td>
                      </tr>
                    </table>
                    <table class='formBanner formBanner472' cellpadding='0' cellspacing='0'>
                      <tr>
                        <td class='left left472'>
                        </td>
                        <td class='center center472' valign='top'>
                          <table cellpadding='0' cellspacing='0' class='formBannerTitle formBannerTitle472'>
                            <tr>
                              <td class='titleLeft titleLeft472' valign='top'>
                              </td>
                              <td class='titleCenter titleCenter472' valign='top'>
                                <div class='titleText titleText472'>
                                  <span>
                                    全站搜索
                                  </span>
                                </div>
                              </td>
                              <td class='titleRight titleRight472' valign='top'>
                              </td>
                            </tr>
                          </table>
                          <div class='formBannerOther formBannerOther472'>
                            <div class='formBannerBtn formBannerBtn472'>
                              <span style='_display:inline-block;_position:relative;'>
                                <a hidefocus='true' href='javascript:;' onclick='Site.closeAd("module472");return false;'
                                class='g_close'>
                                  <span style='_display:none;'>
                                    &nbsp;
                                  </span>
                                </a>
                              </span>
                            </div>
                            &nbsp;
                          </div>
                        </td>
                        <td class='right right472'>
                        </td>
                      </tr>
                    </table>
                    <table class='formMiddle formMiddle472' style='' cellpadding='0' cellspacing='0'>
                      <tr>
                        <td class='formMiddleLeft formMiddleLeft472'>
                        </td>
                        <td class='formMiddleCenter formMiddleCenter472' valign='top'>
                          <div class='formMiddleContent formMiddleContent472  '>
                            <div class='searchBox searchBoxStyle51'>
                              <div class='searchBoxContainer'>
                                <input class='g_itext' placeholder='搜索提示' value='' _nSL='[]' maxlength='100'
                                />
                                <a class='g_btn searchBoxBtn' href='javascript:;' onclick='Site.searchInSite(472);return false;'>
                                  <span>
                                    搜索
                                  </span>
                                </a>
                              </div>
                            </div>
                            <div class='recommandKeyBox'>
                              <div class='linkKeys'>
                                <a class='recommandKey' href='javascript:;' onclick='Site.searchInSiteByKey(472,"斯蒂芬");return false;'>
                                  <span>
                                    斯蒂芬
                                  </span>
                                </a>
                              </div>
                            </div>
                          </div>
                        </td>
                        <td class='formMiddleRight formMiddleRight472'>
                        </td>
                      </tr>
                    </table>
                    <table class='formBottom formBottom472' cellpadding='0' cellspacing='0'>
                      <tr>
                        <td class='left left472'>
                        </td>
                        <td class='center center472'>
                        </td>
                        <td class='right right472'>
                        </td>
                      </tr>
                    </table>
                    <div class='clearfloat clearfloat472'>
                    </div>
                  </div>
                </div>
                <div id='module479' _indexClass='formIndex3' class='form form479 formIndex3 formStyle81 extformClass '
                title='' style='position:absolute;top:200px;left:491px;width:165px;' _side='0'
                _inTab='0' _inMulMCol='0' _inFullmeasure='0' _autoHeight='0' _global='false'
                _independent='false'>
                  <div class='formWrap formWrap479'>
                    <table class='formTop formTop479' cellpadding='0' cellspacing='0'>
                      <tr>
                        <td class='left'>
                        </td>
                        <td class='center'>
                        </td>
                        <td class='right'>
                        </td>
                      </tr>
                    </table>
                    <table class='formBanner formBanner479' cellpadding='0' cellspacing='0'>
                      <tr>
                        <td class='left left479'>
                        </td>
                        <td class='center center479' valign='top'>
                          <table cellpadding='0' cellspacing='0' class='formBannerTitle formBannerTitle479'>
                            <tr>
                              <td class='titleLeft titleLeft479' valign='top'>
                              </td>
                              <td class='titleCenter titleCenter479' valign='top'>
                                <div class='titleText titleText479'>
                                  <span>
                                    浮动按钮
                                  </span>
                                </div>
                              </td>
                              <td class='titleRight titleRight479' valign='top'>
                              </td>
                            </tr>
                          </table>
                          <div class='formBannerOther formBannerOther479'>
                            <div class='formBannerBtn formBannerBtn479'>
                              <span style='_display:inline-block;_position:relative;'>
                                <a hidefocus='true' href='javascript:;' onclick='Site.closeAd("module479");return false;'
                                class='g_close'>
                                  <span style='_display:none;'>
                                    &nbsp;
                                  </span>
                                </a>
                              </span>
                            </div>
                            &nbsp;
                          </div>
                        </td>
                        <td class='right right479'>
                        </td>
                      </tr>
                    </table>
                    <table class='formMiddle formMiddle479' style='height:54px; ' cellpadding='0'
                    cellspacing='0'>
                      <tr>
                        <td class='formMiddleLeft formMiddleLeft479'>
                        </td>
                        <td class='formMiddleCenter formMiddleCenter479' valign='top'>
                          <div class='formMiddleContent formMiddleContent479  '>
                            <div class='J_floatBtnBox floatBtnBox floatBtnStyle304'>
                              <a id='module479FlBtn' href='javascript:;' class='middle floatBtn g_specialClass'
                              target='_blank' style='height:52px;width:163px;line-height:52px;background:#000000;-moz-border-radius:10px 10px 10px 10px;-webkit-border-radius:10px 10px 10px 10px;border-radius:10px 10px 10px 10px;-webkit-box-shadow:3px 2px 12px rgba(0,0,0,0.5);;-moz-box-shadow:3px 2px 12px rgba(0,0,0,0.5);;box-shadow:3px 2px 12px rgba(0,0,0,0.5);;border:1px solid #000000;'>
                              </a>
                            </div>
                          </div>
                        </td>
                        <td class='formMiddleRight formMiddleRight479'>
                        </td>
                      </tr>
                    </table>
                    <table class='formBottom formBottom479' cellpadding='0' cellspacing='0'>
                      <tr>
                        <td class='left left479'>
                        </td>
                        <td class='center center479'>
                        </td>
                        <td class='right right479'>
                        </td>
                      </tr>
                    </table>
                    <div class='clearfloat clearfloat479'>
                    </div>
                  </div>
                </div>
                <div id='module483' _indexClass='formIndex4' class='form  formIndex4 formStyle66 extformClass '
                title='' style='position:absolute;top:25px;left:200px;width:140px;' _side='0'
                _inTab='0' _inMulMCol='0' _inFullmeasure='0' _autoHeight='0' _global='true'
                _independent='false'>
                  <div class='formWrap formWrap483'>
                    <table class='formTop formTop483' cellpadding='0' cellspacing='0'>
                      <tr>
                        <td class='left'>
                        </td>
                        <td class='center'>
                        </td>
                        <td class='right'>
                        </td>
                      </tr>
                    </table>
                    <table class='formBanner formBanner483' cellpadding='0' cellspacing='0'>
                      <tr>
                        <td class='left left483'>
                        </td>
                        <td class='center center483' valign='top'>
                          <table cellpadding='0' cellspacing='0' class='formBannerTitle formBannerTitle483'>
                            <tr>
                              <td class='titleLeft titleLeft483' valign='top'>
                              </td>
                              <td class='titleCenter titleCenter483' valign='top'>
                                <div class='titleText titleText483'>
                                  <span>
                                    当前时间
                                  </span>
                                </div>
                              </td>
                              <td class='titleRight titleRight483' valign='top'>
                              </td>
                            </tr>
                          </table>
                          <div class='formBannerOther formBannerOther483'>
                            <div class='formBannerBtn formBannerBtn483'>
                              <span style='_display:inline-block;_position:relative;'>
                                <a hidefocus='true' href='javascript:;' onclick='Site.closeAd("module483");return false;'
                                class='g_close'>
                                  <span style='_display:none;'>
                                    &nbsp;
                                  </span>
                                </a>
                              </span>
                            </div>
                            &nbsp;
                          </div>
                        </td>
                        <td class='right right483'>
                        </td>
                      </tr>
                    </table>
                    <table class='formMiddle formMiddle483' style='height:20px; ' cellpadding='0'
                    cellspacing='0'>
                      <tr>
                        <td class='formMiddleLeft formMiddleLeft483'>
                        </td>
                        <td class='formMiddleCenter formMiddleCenter483' valign='top'>
                          <div class='formMiddleContent formMiddleContent483  '>
                            <div id='module483Date' class='date g_specialClass'>
                              &nbsp;
                            </div>
                          </div>
                        </td>
                        <td class='formMiddleRight formMiddleRight483'>
                        </td>
                      </tr>
                    </table>
                    <table class='formBottom formBottom483' cellpadding='0' cellspacing='0'>
                      <tr>
                        <td class='left left483'>
                        </td>
                        <td class='center center483'>
                        </td>
                        <td class='right right483'>
                        </td>
                      </tr>
                    </table>
                    <div class='clearfloat clearfloat483'>
                    </div>
                  </div>
                </div>
                <div id='module485' _indexClass='formIndex5' class='form  formIndex5 formStyle65 extformClass '
                title='' style='position:absolute;top:10px;left:740px;width:140px;' _side='0'
                _inTab='0' _inMulMCol='0' _inFullmeasure='0' _autoHeight='1' _global='true'
                _independent='false'>
                  <div class='formWrap formWrap485'>
                    <table class='formTop formTop485' cellpadding='0' cellspacing='0'>
                      <tr>
                        <td class='left'>
                        </td>
                        <td class='center'>
                        </td>
                        <td class='right'>
                        </td>
                      </tr>
                    </table>
                    <table class='formBanner formBanner485' cellpadding='0' cellspacing='0'>
                      <tr>
                        <td class='left left485'>
                        </td>
                        <td class='center center485' valign='top'>
                          <table cellpadding='0' cellspacing='0' class='formBannerTitle formBannerTitle485'>
                            <tr>
                              <td class='titleLeft titleLeft485' valign='top'>
                              </td>
                              <td class='titleCenter titleCenter485' valign='top'>
                                <div class='titleText titleText485'>
                                  <span>
                                    收藏本站
                                  </span>
                                </div>
                              </td>
                              <td class='titleRight titleRight485' valign='top'>
                              </td>
                            </tr>
                          </table>
                          <div class='formBannerOther formBannerOther485'>
                            <div class='formBannerBtn formBannerBtn485'>
                              <span style='_display:inline-block;_position:relative;'>
                                <a hidefocus='true' href='javascript:;' onclick='Site.closeAd("module485");return false;'
                                class='g_close'>
                                  <span style='_display:none;'>
                                    &nbsp;
                                  </span>
                                </a>
                              </span>
                            </div>
                            &nbsp;
                          </div>
                        </td>
                        <td class='right right485'>
                        </td>
                      </tr>
                    </table>
                    <table class='formMiddle formMiddle485' style='' cellpadding='0' cellspacing='0'>
                      <tr>
                        <td class='formMiddleLeft formMiddleLeft485'>
                        </td>
                        <td class='formMiddleCenter formMiddleCenter485' valign='top'>
                          <div class='formMiddleContent formMiddleContent485  '>
                            <div class='favorite'>
                              <a hidefocus='true' href='javascript:;' onclick="Fai.setHomePage('http://seeyoui.faisco.cn')">
                                设为首页
                              </a>
                              &nbsp;
                              <a>
                                |
                              </a>
                              &nbsp;
                              <a hidefocus='true' href='javascript:;' onclick="Fai.addBookmark('智慧星河','http://seeyoui.faisco.cn/?_sc=6')">
                                收藏本站
                              </a>
                            </div>
                          </div>
                        </td>
                        <td class='formMiddleRight formMiddleRight485'>
                        </td>
                      </tr>
                    </table>
                    <table class='formBottom formBottom485' cellpadding='0' cellspacing='0'>
                      <tr>
                        <td class='left left485'>
                        </td>
                        <td class='center center485'>
                        </td>
                        <td class='right right485'>
                        </td>
                      </tr>
                    </table>
                    <div class='clearfloat clearfloat485'>
                    </div>
                  </div>
                </div>
              </div>
            </td>
          </tr>
        </table>
        <table class="webNavTable" cellpadding="0" cellspacing="0">
          <tr>
            <td align="center">
              <div id="webNav" class="webNav webNavDefault">
              </div>
            </td>
          </tr>
        </table>
        <table class="webHeaderTable" cellpadding="0" cellspacing="0" id="webHeaderTable">
          <tr>
            <td align="center" class="webHeaderTd">
              <div id="webHeader" class="webHeader">
                <table class='headerTable' cellpadding='0' cellspacing='0'>
                  <tr>
                    <td class='headerCusLeft'>
                    </td>
                    <td class='headerCusMiddle' align='center' valign='top'>
                      <div class='headerNav'>
                        <div id='nav' class='nav nav2 fixedNavPos '>
                          <div class='navMainContent'>
                            <table class='navTop' cellpadding='0' cellspacing='0'>
                              <tr>
                                <td class='navTopLeft'>
                                </td>
                                <td class='navTopCenter'>
                                </td>
                                <td class='navTopRight'>
                                </td>
                              </tr>
                            </table>
                            <table class='navContent' cellpadding='0' cellspacing='0'>
                              <tr>
                                <td class='navLeft'>
                                </td>
                                <td class='navCenterContent' id='navCenterContent' valign='top' align='left'>
                                  <div id='navCenter' class='navCenter' style='width:599px;'>
                                    <div class='itemPrev'>
                                    </div>
                                    <div class='itemContainer'>
                                      <table title='' class='item itemCol2 itemIndex1' cellpadding='0' cellspacing='0'
                                      colId='2' id='nav2' onclick='Site.redirectUrl("/", "_self", event, 1, 0);'
                                      _jump='window.open("/", "_self")'>
                                        <tr>
                                          <td class='itemLeft'>
                                          </td>
                                          <td class='itemCenter'>
                                            <a hidefocus='true' style='outline:none;' href='/' target='_self' onclick='return false;'>
                                              <span class='itemName0'>
                                                首页
                                              </span>
                                            </a>
                                          </td>
                                          <td class='itemRight'>
                                          </td>
                                        </tr>
                                      </table>
                                      <div class='itemSep'>
                                      </div>
                                      <table title='' class='item itemCol103 itemIndex2' cellpadding='0' cellspacing='0'
                                      colId='103' id='nav103' onclick='Site.redirectUrl("/col.jsp?id=103", "_self", event, 1, 0);'
                                      _jump='window.open("/col.jsp?id=103", "_self")'>
                                        <tr>
                                          <td class='itemLeft'>
                                          </td>
                                          <td class='itemCenter'>
                                            <a hidefocus='true' style='outline:none;' href='/col.jsp?id=103' target='_self'
                                            onclick='return false;'>
                                              <span class='itemName0'>
                                                我们的服务
                                              </span>
                                            </a>
                                          </td>
                                          <td class='itemRight'>
                                          </td>
                                        </tr>
                                      </table>
                                      <div class='itemSep'>
                                      </div>
                                      <table title='' class='item itemCol21 itemIndex3' cellpadding='0' cellspacing='0'
                                      colId='21' id='nav21' onclick='Site.redirectUrl("/nr.jsp", "_self", event, 1, 0);'
                                      _jump='window.open("/nr.jsp", "_self")'>
                                        <tr>
                                          <td class='itemLeft'>
                                          </td>
                                          <td class='itemCenter'>
                                            <a hidefocus='true' style='outline:none;' href='/nr.jsp' target='_self'
                                            onclick='return false;'>
                                              <span class='itemName0'>
                                                新闻动态
                                              </span>
                                            </a>
                                          </td>
                                          <td class='itemRight'>
                                          </td>
                                        </tr>
                                      </table>
                                      <div class='itemSep'>
                                      </div>
                                      <table title='' class='item itemCol101 itemIndex4' cellpadding='0' cellspacing='0'
                                      colId='101' id='nav101' onclick='Site.redirectUrl("/col.jsp?id=101", "_self", event, 1, 0);'
                                      _jump='window.open("/col.jsp?id=101", "_self")'>
                                        <tr>
                                          <td class='itemLeft'>
                                          </td>
                                          <td class='itemCenter'>
                                            <a hidefocus='true' style='outline:none;' href='/col.jsp?id=101' target='_self'
                                            onclick='return false;'>
                                              <span class='itemName0'>
                                                关于我们
                                              </span>
                                            </a>
                                          </td>
                                          <td class='itemRight'>
                                          </td>
                                        </tr>
                                      </table>
                                      <div class='itemSep'>
                                      </div>
                                      <table title='' class='item itemCol102 itemIndex5' cellpadding='0' cellspacing='0'
                                      colId='102' id='nav102' onclick='Site.redirectUrl("/col.jsp?id=102", "_self", event, 1, 0);'
                                      _jump='window.open("/col.jsp?id=102", "_self")'>
                                        <tr>
                                          <td class='itemLeft'>
                                          </td>
                                          <td class='itemCenter'>
                                            <a hidefocus='true' style='outline:none;' href='/col.jsp?id=102' target='_self'
                                            onclick='return false;'>
                                              <span class='itemName0'>
                                                联系我们
                                              </span>
                                            </a>
                                          </td>
                                          <td class='itemRight'>
                                          </td>
                                        </tr>
                                      </table>
                                      <div class='itemSep'>
                                      </div>
                                      <table title='' class='item itemCol9 itemIndex6' cellpadding='0' cellspacing='0'
                                      colId='9' id='nav9' onclick='Site.redirectUrl("/msgBoard.jsp", "_self", event, 1, 0);'
                                      _jump='window.open("/msgBoard.jsp", "_self")'>
                                        <tr>
                                          <td class='itemLeft'>
                                          </td>
                                          <td class='itemCenter'>
                                            <a hidefocus='true' style='outline:none;' href='/msgBoard.jsp' target='_self'
                                            onclick='return false;'>
                                              <span class='itemName0'>
                                                留言板
                                              </span>
                                            </a>
                                          </td>
                                          <td class='itemRight'>
                                          </td>
                                        </tr>
                                      </table>
                                    </div>
                                    <div class='itemNext'>
                                    </div>
                                  </div>
                                </td>
                                <td class='navRight'>
                                </td>
                              </tr>
                            </table>
                            <table class='navBottom' cellpadding='0' cellspacing='0'>
                              <tr>
                                <td class='navBottomLeft'>
                                </td>
                                <td class='navBottomCenter'>
                                </td>
                                <td class='navBottomRight'>
                                </td>
                              </tr>
                            </table>
                          </div>
                        </div>
                      </div>
                    </td>
                    <td class='headerCusRight'>
                    </td>
                  </tr>
                </table>
              </div>
            </td>
          </tr>
        </table>
        <table class="webBannerTable" cellpadding="0" cellspacing="0">
          <tr>
            <td align="center">
              <div id="webBanner" class="webBanner">
                <table class="bannerTable" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="bannerLeft">
                    </td>
                    <td class="bannerCenter" align='center' valign='top'>
                      <div class='bannerTop'>
                      </div>
                      <div id='banner' class='banner extBanner' style='background:url(./image/demo/ABUIABACGAAgia3GrgUokPy2zQcwoAs4wgM.jpg) 50% 50% no-repeat;height:450px'
                      normalheight='450' defaultwidth='0'>
                        <div class='banner defaultBannerMain' style='background:url(./image/demo/ABUIABACGAAgia3GrgUokPy2zQcwoAs4wgM.jpg) 50% 50% no-repeat;height:450px'>
                        </div>
                        <div class='defaultBannerEdge defaultBannerEdgeRight'>
                        </div>
                        <div class='defaultBannerEdge defaultBannerEdgeLeft'>
                        </div>
                      </div>
                    </td>
                    <td class="bannerRight">
                    </td>
                  </tr>
                </table>
              </div>
            </td>
          </tr>
        </table>
        <table class="absMiddleTable" cellpadding="0" cellspacing="0">
          <tr>
            <td align="center">
              <div id="absForms" class="forms sideForms absForms">
              </div>
            </td>
          </tr>
        </table>
        <div id="fullmeasureTopForms" class="fullmeasureContainer forms sideForms fullmeasureForms fullmeasureTopForms">
          <wbr style='display:none;' />
        </div>
        <table id="webContainerTable" class="webContainerTable" cellpadding="0"
        cellspacing="0">
          <tr>
            <td align="center">
              <div id="webContainer" class="webContainer">
                <div id="container" class="container">
                  <table class="containerTop" cellpadding='0' cellspacing='0'>
                    <tr valign='top'>
                      <td class="left">
                      </td>
                      <td class="center">
                      </td>
                      <td class="right">
                      </td>
                    </tr>
                  </table>
                  <table class="containerMiddle" cellpadding='0' cellspacing='0'>
                    <tr valign='top'>
                      <td id="containerMiddleLeft" class="containerMiddleLeft">
                      </td>
                      <td class="containerMiddleCenter">
                        <div id="containerMiddleCenterTop" class="containerMiddleCenterTop">
                        </div>
                        <div id="containerForms" class="containerForms">
                          <div id="topForms" class="column forms mainForms topForms">
                            <div id='module320' _indexClass='formIndex1' class='form form320 formIndex1 formStyle4 extformClass '
                            title='' style='' _side='0' _inTab='0' _inMulMCol='0' _inFullmeasure='0'
                            _autoHeight='0' _global='false' _independent='false'>
                              <div class='formWrap formWrap320'>
                                <table class='formTop formTop320' cellpadding='0' cellspacing='0'>
                                  <tr>
                                    <td class='left'>
                                    </td>
                                    <td class='center'>
                                    </td>
                                    <td class='right'>
                                    </td>
                                  </tr>
                                </table>
                                <table class='formBanner formBanner320' cellpadding='0' cellspacing='0'>
                                  <tr>
                                    <td class='left left320'>
                                    </td>
                                    <td class='center center320' valign='top'>
                                      <table cellpadding='0' cellspacing='0' class='formBannerTitle formBannerTitle320'>
                                        <tr>
                                          <td class='titleLeft titleLeft320' valign='top'>
                                          </td>
                                          <td class='titleCenter titleCenter320' valign='top'>
                                            <div class='titleText titleText320'>
                                              <span>
                                                图册展示
                                              </span>
                                            </div>
                                          </td>
                                          <td class='titleRight titleRight320' valign='top'>
                                          </td>
                                        </tr>
                                      </table>
                                      <div class='formBannerOther formBannerOther320'>
                                        <div class='formBannerBtn formBannerBtn320'>
                                          <span style='_display:inline-block;_position:relative;'>
                                            <a hidefocus='true' href='javascript:;' onclick='Site.closeAd("module320");return false;'
                                            class='g_close'>
                                              <span style='_display:none;'>
                                                &nbsp;
                                              </span>
                                            </a>
                                          </span>
                                        </div>
                                        &nbsp;
                                      </div>
                                    </td>
                                    <td class='right right320'>
                                    </td>
                                  </tr>
                                </table>
                                <table class='formMiddle formMiddle320' style='height:308px; ' cellpadding='0'
                                cellspacing='0'>
                                  <tr>
                                    <td class='formMiddleLeft formMiddleLeft320'>
                                    </td>
                                    <td class='formMiddleCenter formMiddleCenter320' valign='top'>
                                      <div class='formMiddleContent formMiddleContent320  '>
                                        <div class='photoList'>
                                          <div class='clearfloat'>
                                          </div>
                                          <div id='photoForms320' class='photoForms' picWidth='158' picHeight='182'>
                                            <div photoName='包装设计' photoDisc='' photoId='15' class='photoForm' style='width:158px;margin-left:42px;margin-right:43px;padding-left:0px;padding-right:0px;margin-top:10px;margin-bottom:10px;padding-top:0px;padding-bottom:0px;'
                                            faiWidth='158' faiHeight='182'>
                                              <div id='photoListABUIABAEGAAgioLGrgUo0qWQwgYwngE4tgE' class='imgDiv'
                                              style='width:158px;height:182px;'>
                                                <table cellpadding='0' cellspacing='0'>
                                                  <tr>
                                                    <td>
                                                      <a hidefocus='true' href="/col.jsp?id=103" target='_blank'>
                                                        <img class='photoImg' src='./image/demo/ABUIABAEGAAgioLGrgUo0qWQwgYwngE4tgE.png'
                                                        alt='包装设计' />
                                                      </a>
                                                    </td>
                                                  </tr>
                                                </table>
                                              </div>
                                              <div class='parametersDiv'>
                                                <div class='photoParameters firstLine nameWordWrap ' title='包装设计'>
                                                  包装设计
                                                </div>
                                                <div class='photoParameters basic' title='' style='display:none'>
                                                </div>
                                              </div>
                                            </div>
                                            <div photoName='专业设计' photoDisc='' photoId='18' class='photoForm' style='width:158px;margin-left:42px;margin-right:43px;padding-left:0px;padding-right:0px;margin-top:10px;margin-bottom:10px;padding-top:0px;padding-bottom:0px;'
                                            faiWidth='158' faiHeight='182'>
                                              <div id='photoListABUIABAEGAAglILGrgUowKmTsgUwngE4tgE' class='imgDiv'
                                              style='width:158px;height:182px;'>
                                                <table cellpadding='0' cellspacing='0'>
                                                  <tr>
                                                    <td>
                                                      <a hidefocus='true' href="/col.jsp?id=103" target='_blank'>
                                                        <img class='photoImg' src='./image/demo/ABUIABAEGAAglILGrgUowKmTsgUwngE4tgE.png'
                                                        alt='专业设计' />
                                                      </a>
                                                    </td>
                                                  </tr>
                                                </table>
                                              </div>
                                              <div class='parametersDiv'>
                                                <div class='photoParameters firstLine nameWordWrap ' title='专业设计'>
                                                  专业设计
                                                </div>
                                                <div class='photoParameters basic' title='' style='display:none'>
                                                </div>
                                              </div>
                                            </div>
                                            <div photoName='品牌创意设计' photoDisc='' photoId='16' class='photoForm' style='width:158px;margin-left:42px;margin-right:43px;padding-left:0px;padding-right:0px;margin-top:10px;margin-bottom:10px;padding-top:0px;padding-bottom:0px;'
                                            faiWidth='158' faiHeight='182'>
                                              <div id='photoListABUIABAEGAAgoYLGrgUoxu_hnAUwngE4tgE' class='imgDiv'
                                              style='width:158px;height:182px;'>
                                                <table cellpadding='0' cellspacing='0'>
                                                  <tr>
                                                    <td>
                                                      <a hidefocus='true' href="/col.jsp?id=103" target='_blank'>
                                                        <img class='photoImg' src='./image/demo/ABUIABAEGAAgoYLGrgUoxu_hnAUwngE4tgE.png'
                                                        alt='品牌创意设计' />
                                                      </a>
                                                    </td>
                                                  </tr>
                                                </table>
                                              </div>
                                              <div class='parametersDiv'>
                                                <div class='photoParameters firstLine nameWordWrap ' title='品牌创意设计'>
                                                  品牌创意设计
                                                </div>
                                                <div class='photoParameters basic' title='' style='display:none'>
                                                </div>
                                              </div>
                                            </div>
                                            <div photoName='媒体营销' photoDisc='' photoId='17' class='photoForm' style='width:158px;margin-left:42px;margin-right:43px;padding-left:0px;padding-right:0px;margin-top:10px;margin-bottom:10px;padding-top:0px;padding-bottom:0px;'
                                            faiWidth='158' faiHeight='182'>
                                              <div id='photoListABUIABAEGAAgs4LGrgUo2oWC3wcwngE4tgE' class='imgDiv'
                                              style='width:158px;height:182px;'>
                                                <table cellpadding='0' cellspacing='0'>
                                                  <tr>
                                                    <td>
                                                      <a hidefocus='true' href="/col.jsp?id=103" target='_blank'>
                                                        <img class='photoImg' src='./image/demo/ABUIABAEGAAgs4LGrgUo2oWC3wcwngE4tgE.png'
                                                        alt='媒体营销' />
                                                      </a>
                                                    </td>
                                                  </tr>
                                                </table>
                                              </div>
                                              <div class='parametersDiv'>
                                                <div class='photoParameters firstLine nameWordWrap ' title='媒体营销'>
                                                  媒体营销
                                                </div>
                                                <div class='photoParameters basic' title='' style='display:none'>
                                                </div>
                                              </div>
                                            </div>
                                          </div>
                                          <div class='clearfloat'>
                                          </div>
                                        </div>
                                      </div>
                                    </td>
                                    <td class='formMiddleRight formMiddleRight320'>
                                    </td>
                                  </tr>
                                </table>
                                <table class='formBottom formBottom320' cellpadding='0' cellspacing='0'>
                                  <tr>
                                    <td class='left left320'>
                                    </td>
                                    <td class='center center320'>
                                    </td>
                                    <td class='right right320'>
                                    </td>
                                  </tr>
                                </table>
                                <div class='clearfloat clearfloat320'>
                                </div>
                              </div>
                            </div>
                            <div id='module314' _indexClass='formIndex2' class='form form314 formIndex2 formStyle4 extformClass '
                            title='' style='' _side='0' _inTab='0' _inMulMCol='0' _inFullmeasure='0'
                            _autoHeight='0' _global='false' _independent='false'>
                              <div class='formWrap formWrap314'>
                                <table class='formTop formTop314' cellpadding='0' cellspacing='0'>
                                  <tr>
                                    <td class='left'>
                                    </td>
                                    <td class='center'>
                                    </td>
                                    <td class='right'>
                                    </td>
                                  </tr>
                                </table>
                                <table class='formBanner formBanner314' cellpadding='0' cellspacing='0'>
                                  <tr>
                                    <td class='left left314'>
                                    </td>
                                    <td class='center center314' valign='top'>
                                      <table cellpadding='0' cellspacing='0' class='formBannerTitle formBannerTitle314'>
                                        <tr>
                                          <td class='titleLeft titleLeft314' valign='top'>
                                          </td>
                                          <td class='titleCenter titleCenter314' valign='top'>
                                            <div class='titleText titleText314'>
                                              <span>
                                                图册展示
                                              </span>
                                            </div>
                                          </td>
                                          <td class='titleRight titleRight314' valign='top'>
                                          </td>
                                        </tr>
                                      </table>
                                      <div class='formBannerOther formBannerOther314'>
                                        <div class='formBannerBtn formBannerBtn314'>
                                          <span style='_display:inline-block;_position:relative;'>
                                            <a hidefocus='true' href='javascript:;' onclick='Site.closeAd("module314");return false;'
                                            class='g_close'>
                                              <span style='_display:none;'>
                                                &nbsp;
                                              </span>
                                            </a>
                                          </span>
                                        </div>
                                        &nbsp;
                                      </div>
                                    </td>
                                    <td class='right right314'>
                                    </td>
                                  </tr>
                                </table>
                                <table class='formMiddle formMiddle314' style='height:520px; ' cellpadding='0'
                                cellspacing='0'>
                                  <tr>
                                    <td class='formMiddleLeft formMiddleLeft314'>
                                    </td>
                                    <td class='formMiddleCenter formMiddleCenter314' valign='top'>
                                      <div class='formMiddleContent formMiddleContent314  '>
                                        <div class='photoList'>
                                          <div class='clearfloat'>
                                          </div>
                                          <div id='photoForms314' class='photoForms' picWidth='235' picHeight='158'>
                                            <div photoName='画册设计' photoDisc='' photoId='10' class='photoForm' style='width:235px;margin-left:6px;margin-right:6px;padding-left:0px;padding-right:0px;margin-top:5px;margin-bottom:5px;padding-top:0px;padding-bottom:0px;'
                                            faiWidth='235' faiHeight='158'>
                                              <div id='photoListABUIABACGAAgj-_7rgUo-bXZvwMw6wE4ngE' class='imgDiv'
                                              style='width:235px;height:158px;'>
                                                <table cellpadding='0' cellspacing='0'>
                                                  <tr>
                                                    <td>
                                                      <img class='photoImg' src='./image/demo/ABUIABACGAAgj-_7rgUo-bXZvwMw6wE4ngE.jpg'
                                                      alt='画册设计' _defImg='./image/demo/ABUIABACGAAgj-_7rgUo-bXZvwMw6wE4ngE.jpg'
                                                      _hovImg='./image/demo/ABUIABACGAAg-IC8rgUo49vvzQEw6wE4ngE.jpg' />
                                                    </td>
                                                  </tr>
                                                </table>
                                              </div>
                                            </div>
                                            <div photoName='品牌策划' photoDisc='' photoId='13' class='photoForm' style='width:235px;margin-left:6px;margin-right:6px;padding-left:0px;padding-right:0px;margin-top:5px;margin-bottom:5px;padding-top:0px;padding-bottom:0px;'
                                            faiWidth='235' faiHeight='158'>
                                              <div id='photoListABUIABAEGAAg653FrgUotLaTUTDrATieAQ' class='imgDiv' style='width:235px;height:158px;'>
                                                <table cellpadding='0' cellspacing='0'>
                                                  <tr>
                                                    <td>
                                                      <img class='photoImg' src='./image/demo/ABUIABAEGAAg653FrgUotLaTUTDrATieAQ.png'
                                                      alt='品牌策划' _defImg='./image/demo/ABUIABAEGAAg653FrgUotLaTUTDrATieAQ.png'
                                                      _hovImg='./image/demo/ABUIABACGAAgmYG8rgUo0NumiwQw6wE4ngE.jpg' />
                                                    </td>
                                                  </tr>
                                                </table>
                                              </div>
                                            </div>
                                            <div photoName='标志设计' photoDisc='' photoId='5' class='photoForm' style='width:235px;margin-left:6px;margin-right:6px;padding-left:0px;padding-right:0px;margin-top:5px;margin-bottom:5px;padding-top:0px;padding-bottom:0px;'
                                            faiWidth='235' faiHeight='158'>
                                              <div id='photoListABUIABACGAAgi-_7rgUouYTqsgUw6wE4ngE' class='imgDiv'
                                              style='width:235px;height:158px;'>
                                                <table cellpadding='0' cellspacing='0'>
                                                  <tr>
                                                    <td>
                                                      <img class='photoImg' src='./image/demo/ABUIABACGAAgi-_7rgUouYTqsgUw6wE4ngE.jpg'
                                                      alt='标志设计' _defImg='./image/demo/ABUIABACGAAgi-_7rgUouYTqsgUw6wE4ngE.jpg'
                                                      _hovImg='./image/demo/ABUIABACGAAgnIG8rgUo2sqU_Qcw6wE4ngE.jpg' />
                                                    </td>
                                                  </tr>
                                                </table>
                                              </div>
                                            </div>
                                            <div photoName='包装设计' photoDisc='' photoId='6' class='photoForm' style='width:235px;margin-left:6px;margin-right:6px;padding-left:0px;padding-right:0px;margin-top:5px;margin-bottom:5px;padding-top:0px;padding-bottom:0px;'
                                            faiWidth='235' faiHeight='158'>
                                              <div id='photoListABUIABACGAAgmpDGrgUouIDW7gQw6wE4ngE' class='imgDiv'
                                              style='width:235px;height:158px;'>
                                                <table cellpadding='0' cellspacing='0'>
                                                  <tr>
                                                    <td>
                                                      <img class='photoImg' src='./image/demo/ABUIABACGAAgmpDGrgUouIDW7gQw6wE4ngE.jpg'
                                                      alt='包装设计' _defImg='./image/demo/ABUIABACGAAgmpDGrgUouIDW7gQw6wE4ngE.jpg'
                                                      _hovImg='./image/demo/ABUIABACGAAgsJDGrgUortHg0gIw6wE4ngE.jpg' />
                                                    </td>
                                                  </tr>
                                                </table>
                                              </div>
                                            </div>
                                            <div photoName='名片设计' photoDisc='' photoId='12' class='photoForm' style='width:235px;margin-left:6px;margin-right:6px;padding-left:0px;padding-right:0px;margin-top:5px;margin-bottom:5px;padding-top:0px;padding-bottom:0px;'
                                            faiWidth='235' faiHeight='158'>
                                              <div id='photoListABUIABACGAAglf_7rgUovNnAlgIw6wE4ngE' class='imgDiv'
                                              style='width:235px;height:158px;'>
                                                <table cellpadding='0' cellspacing='0'>
                                                  <tr>
                                                    <td>
                                                      <img class='photoImg' src='./image/demo/ABUIABACGAAglf_7rgUovNnAlgIw6wE4ngE.jpg'
                                                      alt='名片设计' _defImg='./image/demo/ABUIABACGAAglf_7rgUovNnAlgIw6wE4ngE.jpg'
                                                      _hovImg='./image/demo/ABUIABACGAAgy4G8rgUo4b-5sQYw6wE4ngE.jpg' />
                                                    </td>
                                                  </tr>
                                                </table>
                                              </div>
                                            </div>
                                            <div photoName='空间设计' photoDisc='' photoId='11' class='photoForm' style='width:235px;margin-left:6px;margin-right:6px;padding-left:0px;padding-right:0px;margin-top:5px;margin-bottom:5px;padding-top:0px;padding-bottom:0px;'
                                            faiWidth='235' faiHeight='158'>
                                              <div id='photoListABUIABACGAAgoorGrgUog47psAMw6wE4ngE' class='imgDiv'
                                              style='width:235px;height:158px;'>
                                                <table cellpadding='0' cellspacing='0'>
                                                  <tr>
                                                    <td>
                                                      <img class='photoImg' src='./image/demo/ABUIABACGAAgoorGrgUog47psAMw6wE4ngE.jpg'
                                                      alt='空间设计' _defImg='./image/demo/ABUIABACGAAgoorGrgUog47psAMw6wE4ngE.jpg'
                                                      _hovImg='./image/demo/ABUIABACGAAg_YzGrgUonOScigYw6wE4ngE.jpg' />
                                                    </td>
                                                  </tr>
                                                </table>
                                              </div>
                                            </div>
                                            <div photoName='影视广告' photoDisc='' photoId='14' class='photoForm' style='width:235px;margin-left:6px;margin-right:6px;padding-left:0px;padding-right:0px;margin-top:5px;margin-bottom:5px;padding-top:0px;padding-bottom:0px;'
                                            faiWidth='235' faiHeight='158'>
                                              <div id='photoListABUIABACGAAgmP_7rgUotZuJpgEw6wE4ngE' class='imgDiv'
                                              style='width:235px;height:158px;'>
                                                <table cellpadding='0' cellspacing='0'>
                                                  <tr>
                                                    <td>
                                                      <img class='photoImg' src='./image/demo/ABUIABACGAAgmP_7rgUotZuJpgEw6wE4ngE.jpg'
                                                      alt='影视广告' _defImg='./image/demo/ABUIABACGAAgmP_7rgUotZuJpgEw6wE4ngE.jpg'
                                                      _hovImg='./image/demo/ABUIABACGAAg04G8rgUogJCs8AIw6wE4ngE.jpg' />
                                                    </td>
                                                  </tr>
                                                </table>
                                              </div>
                                            </div>
                                            <div photoName='海报设计' photoDisc='' photoId='9' class='photoForm' style='width:235px;margin-left:6px;margin-right:6px;padding-left:0px;padding-right:0px;margin-top:5px;margin-bottom:5px;padding-top:0px;padding-bottom:0px;'
                                            faiWidth='235' faiHeight='158'>
                                              <div id='photoListABUIABACGAAgj-_7rgUo05zl_gcw6wE4ngE' class='imgDiv'
                                              style='width:235px;height:158px;'>
                                                <table cellpadding='0' cellspacing='0'>
                                                  <tr>
                                                    <td>
                                                      <img class='photoImg' src='./image/demo/ABUIABACGAAgj-_7rgUo05zl_gcw6wE4ngE.jpg'
                                                      alt='海报设计' _defImg='./image/demo/ABUIABACGAAgj-_7rgUo05zl_gcw6wE4ngE.jpg'
                                                      _hovImg='./image/demo/ABUIABACGAAg24G8rgUo1LKvTzDrATieAQ.jpg' />
                                                    </td>
                                                  </tr>
                                                </table>
                                              </div>
                                            </div>
                                          </div>
                                          <div class='clearfloat'>
                                          </div>
                                        </div>
                                      </div>
                                    </td>
                                    <td class='formMiddleRight formMiddleRight314'>
                                    </td>
                                  </tr>
                                </table>
                                <table class='formBottom formBottom314' cellpadding='0' cellspacing='0'>
                                  <tr>
                                    <td class='left left314'>
                                    </td>
                                    <td class='center center314'>
                                    </td>
                                    <td class='right right314'>
                                    </td>
                                  </tr>
                                </table>
                                <div class='clearfloat clearfloat314'>
                                </div>
                              </div>
                            </div>
                            <div id='module316' _indexClass='formIndex3' class='form form316 formIndex3 formStyle35 layoutModule  formStyle35_2  extformClass '
                            title='' style='' _side='0' _inTab='0' _inMulMCol='0' _inFullmeasure='0'
                            _autoHeight='0' _global='false' _independent='false'>
                              <div class='formWrap formWrap316'>
                                <table class='formTop formTop316' cellpadding='0' cellspacing='0'>
                                  <tr>
                                    <td class='left'>
                                    </td>
                                    <td class='center'>
                                    </td>
                                    <td class='right'>
                                    </td>
                                  </tr>
                                </table>
                                <table class='formBanner formBanner316' cellpadding='0' cellspacing='0'>
                                  <tr>
                                    <td class='left left316'>
                                    </td>
                                    <td class='center center316' valign='top'>
                                      <table cellpadding='0' cellspacing='0' class='formBannerTitle formBannerTitle316'>
                                        <tr>
                                          <td class='titleLeft titleLeft316' valign='top'>
                                          </td>
                                          <td class='titleCenter titleCenter316' valign='top'>
                                            <div class='titleText titleText316'>
                                              <span>
                                                模块列
                                              </span>
                                            </div>
                                          </td>
                                          <td class='titleRight titleRight316' valign='top'>
                                          </td>
                                        </tr>
                                      </table>
                                      <div class='formBannerOther formBannerOther316'>
                                        <div class='formBannerBtn formBannerBtn316'>
                                          <span style='_display:inline-block;_position:relative;'>
                                            <a hidefocus='true' href='javascript:;' onclick='Site.closeAd("module316");return false;'
                                            class='g_close'>
                                              <span style='_display:none;'>
                                                &nbsp;
                                              </span>
                                            </a>
                                          </span>
                                        </div>
                                        &nbsp;
                                      </div>
                                    </td>
                                    <td class='right right316'>
                                    </td>
                                  </tr>
                                </table>
                                <table class='formMiddle formMiddle316' style='height:453px; ' cellpadding='0'
                                cellspacing='0'>
                                  <tr>
                                    <td class='formMiddleLeft formMiddleLeft316'>
                                    </td>
                                    <td class='formMiddleCenter formMiddleCenter316' valign='top'>
                                      <div class='formMiddleContent formMiddleContent316  multiColFormMiddleContent'>
                                        <div class='mulMColContent' id='mulMColContent316'>
                                          <table width="100%" border="0" cellspacing="0" class="mulMColContentTable"
                                          cellpadding="0">
                                            <tbody>
                                              <tr>
                                                <td class=" mulColLayout mulColPadding" style="width:493px;padding-right:0px;">
                                                  <div id="mulMCol316_cid_1" class="mulMColList column">
                                                    <div id='module307' _indexClass='' class='form form307 formStyle7 formInMulMCol  extformClass  modulePattern modulePattern60'
                                                    title='' style='' _side='0' _inTab='0' _inMulMCol='316' _inFullmeasure='0'
                                                    _autoHeight='1' _global='false' _independent='false'>
                                                      <div class='formWrap formWrap307'>
                                                        <table class='formTop formTop307' cellpadding='0' cellspacing='0'>
                                                          <tr>
                                                            <td class='left'>
                                                            </td>
                                                            <td class='center'>
                                                            </td>
                                                            <td class='right'>
                                                            </td>
                                                          </tr>
                                                        </table>
                                                        <table class='formBanner formBanner307' cellpadding='0' cellspacing='0'>
                                                          <tr>
                                                            <td class='left left307'>
                                                            </td>
                                                            <td class='center center307' valign='top'>
                                                              <table cellpadding='0' cellspacing='0' class='formBannerTitle formBannerTitle307'>
                                                                <tr>
                                                                  <td class='titleLeft titleLeft307' valign='top'>
                                                                  </td>
                                                                  <td class='titleCenter titleCenter307' valign='top'>
                                                                    <div class='titleText titleText307'>
                                                                      <span>
                                                                        行业动态
                                                                      </span>
                                                                    </div>
                                                                  </td>
                                                                  <td class='titleRight titleRight307' valign='top'>
                                                                  </td>
                                                                </tr>
                                                              </table>
                                                              <div class='formBannerOther formBannerOther307'>
                                                                <div class='formBannerBtn formBannerBtn307'>
                                                                  <span style='_display:inline-block;_position:relative;'>
                                                                    <a hidefocus='true' href='javascript:;' onclick='Site.closeAd("module307");return false;'
                                                                    class='g_close'>
                                                                      <span style='_display:none;'>
                                                                        &nbsp;
                                                                      </span>
                                                                    </a>
                                                                  </span>
                                                                </div>
                                                                &nbsp;
                                                              </div>
                                                            </td>
                                                            <td class='right right307'>
                                                            </td>
                                                          </tr>
                                                        </table>
                                                        <table class='formMiddle formMiddle307' style='' cellpadding='0' cellspacing='0'>
                                                          <tr>
                                                            <td class='formMiddleLeft formMiddleLeft307'>
                                                            </td>
                                                            <td class='formMiddleCenter formMiddleCenter307' valign='top'>
                                                              <div class='formMiddleContent formMiddleContent307  '>
                                                                <div>
                                                                  <div class='newsList pic-mixNewsList' id='newsList307' _showSetting=1>
                                                                    <div topClassName='top2' topSwitch='off' newsId='6' newsName='肯德基创意广告《原味鸡手腕花》-网聚V电影'
                                                                    class='line noHover wWLine ' style='padding:0;height:auto;overflow:hidden;'>
                                                                      <table id='lineBody6' class='lineBody' cellpadding='0' cellspacing='0'>
                                                                        <tr id='module307tr6'>
                                                                          <td class='newsTitle mixNewsTitle' valign='top'>
                                                                            <div class='articlePhotoBox' newid='6'>
                                                                              <a href='nd.jsp?id=6&_np=2_307' target='_blank' style='display:block;width:145px;height:91px;overflow:hidden;'>
                                                                                <img class='newsPic' alt='文章附图' title='' src='./image/demo/ABUIABAEGAAg8aPFrgUolOq-_AYwhwE4Ww.png'
                                                                                style='width:135px;height:91px;float:left;' />
                                                                              </a>
                                                                            </div>
                                                                            <div class='mixNewsStyleTitleContainer'>
                                                                              <div class='' style='margin:0;position:relative;'>
                                                                                <a class='no-mixNewsStyleTitleTip' href='nd.jsp?id=6&_np=2_307' target='_blank'>
                                                                                </a>
                                                                              </div>
                                                                              <a hidefocus='true' href="nd.jsp?id=6&_np=2_307" target=_blank title=""
                                                                              class='mixNewsStyleTitle  pic-mixNewsStyleTitle ' style='display:inline;'
                                                                              mix='0'>
                                                                                肯德基创意广告《原味鸡手腕花》-网聚V电影
                                                                              </a>
                                                                            </div>
                                                                            <p class='mixNewsStyleSummary  pic-mixNewsStyleSummary '>
                                                                              本片是肯德基最近推出的一部另类搞笑广告，将美国传统婚礼的手腕花进行了创造性改良，推出一款“原味鸡婚礼手腕花”，为热...
                                                                            </p>
                                                                          </td>
                                                                        </tr>
                                                                      </table>
                                                                    </div>
                                                                    <div class='separatorLine g_separator  pic-separatorLine '>
                                                                    </div>
                                                                    <div topClassName='top1' topSwitch='on' newsId='7' newsName='全球知名硬盘厂商希捷新LOGO品牌设计'
                                                                    class='line noHover wWLine ' style='padding:0;height:auto;overflow:hidden;'>
                                                                      <table id='lineBody7' class='lineBody' cellpadding='0' cellspacing='0'>
                                                                        <tr id='module307tr7'>
                                                                          <td class='newsTitle mixNewsTitle' valign='top'>
                                                                            <div class='articlePhotoBox' newid='7'>
                                                                              <a href='nd.jsp?id=7&_np=2_307' target='_blank' style='display:block;width:145px;height:91px;overflow:hidden;'>
                                                                                <img class='newsPic' alt='文章附图' title='' src='./image/demo/ABUIABAEGAAgv5TFrgUomK3n2gIwhwE4Ww.png'
                                                                                style='width:135px;height:91px;float:left;' />
                                                                              </a>
                                                                            </div>
                                                                            <div class='mixNewsStyleTitleContainer'>
                                                                              <div class='' style='margin:0;position:relative;'>
                                                                                <a class='no-mixNewsStyleTitleTip' href='nd.jsp?id=7&_np=2_307' target='_blank'>
                                                                                </a>
                                                                              </div>
                                                                              <a hidefocus='true' href="nd.jsp?id=7&_np=2_307" target=_blank title=""
                                                                              class='mixNewsStyleTitle  pic-mixNewsStyleTitle ' style='display:inline;'
                                                                              mix='0'>
                                                                                全球知名硬盘厂商希捷新LOGO品牌设计
                                                                              </a>
                                                                            </div>
                                                                            <p class='mixNewsStyleSummary  pic-mixNewsStyleSummary '>
                                                                              全球主要的硬盘厂商之一的希捷科技（Seagate）将在美国拉斯维加斯举办的2015年国际消费类电子产品展览会（CE...
                                                                            </p>
                                                                          </td>
                                                                        </tr>
                                                                      </table>
                                                                    </div>
                                                                    <div class='separatorLine g_separator ' style='border-color:transparent'>
                                                                    </div>
                                                                    <div class='clearfloat'>
                                                                    </div>
                                                                  </div>
                                                                </div>
                                                              </div>
                                                            </td>
                                                            <td class='formMiddleRight formMiddleRight307'>
                                                            </td>
                                                          </tr>
                                                        </table>
                                                        <table class='formBottom formBottom307' cellpadding='0' cellspacing='0'>
                                                          <tr>
                                                            <td class='left left307'>
                                                            </td>
                                                            <td class='center center307'>
                                                            </td>
                                                            <td class='right right307'>
                                                            </td>
                                                          </tr>
                                                        </table>
                                                        <div class='clearfloat clearfloat307'>
                                                        </div>
                                                      </div>
                                                    </div>
                                                  </div>
                                                  <div class="mulModuleColStyleLine" style="right:-1px;">
                                                  </div>
                                                </td>
                                                <td class="mulColLayout" style="">
                                                  <div id="mulMCol316_cid_2" class="mulMColList column">
                                                    <div id='module315' _indexClass='' class='form form315 formStyle7 formInMulMCol  extformClass  modulePattern modulePattern60'
                                                    title='' style='' _side='0' _inTab='0' _inMulMCol='316' _inFullmeasure='0'
                                                    _autoHeight='1' _global='false' _independent='false'>
                                                      <div class='formWrap formWrap315'>
                                                        <table class='formTop formTop315' cellpadding='0' cellspacing='0'>
                                                          <tr>
                                                            <td class='left'>
                                                            </td>
                                                            <td class='center'>
                                                            </td>
                                                            <td class='right'>
                                                            </td>
                                                          </tr>
                                                        </table>
                                                        <table class='formBanner formBanner315' cellpadding='0' cellspacing='0'>
                                                          <tr>
                                                            <td class='left left315'>
                                                            </td>
                                                            <td class='center center315' valign='top'>
                                                              <table cellpadding='0' cellspacing='0' class='formBannerTitle formBannerTitle315'>
                                                                <tr>
                                                                  <td class='titleLeft titleLeft315' valign='top'>
                                                                  </td>
                                                                  <td class='titleCenter titleCenter315' valign='top'>
                                                                    <div class='titleText titleText315'>
                                                                      <span>
                                                                        品牌营销
                                                                      </span>
                                                                    </div>
                                                                  </td>
                                                                  <td class='titleRight titleRight315' valign='top'>
                                                                  </td>
                                                                </tr>
                                                              </table>
                                                              <div class='formBannerOther formBannerOther315'>
                                                                <div class='formBannerBtn formBannerBtn315'>
                                                                  <span style='_display:inline-block;_position:relative;'>
                                                                    <a hidefocus='true' href='javascript:;' onclick='Site.closeAd("module315");return false;'
                                                                    class='g_close'>
                                                                      <span style='_display:none;'>
                                                                        &nbsp;
                                                                      </span>
                                                                    </a>
                                                                  </span>
                                                                </div>
                                                                &nbsp;
                                                              </div>
                                                            </td>
                                                            <td class='right right315'>
                                                            </td>
                                                          </tr>
                                                        </table>
                                                        <table class='formMiddle formMiddle315' style='' cellpadding='0' cellspacing='0'>
                                                          <tr>
                                                            <td class='formMiddleLeft formMiddleLeft315'>
                                                            </td>
                                                            <td class='formMiddleCenter formMiddleCenter315' valign='top'>
                                                              <div class='formMiddleContent formMiddleContent315  '>
                                                                <div>
                                                                  <div class='newsList pic-mixNewsList' id='newsList315' _showSetting=1>
                                                                    <div topClassName='top2' topSwitch='off' newsId='8' newsName='爱马仕创意动画广告片《时光梭织机》'
                                                                    class='line noHover wWLine ' style='padding:0;height:auto;overflow:hidden;'>
                                                                      <table id='lineBody8' class='lineBody' cellpadding='0' cellspacing='0'>
                                                                        <tr id='module315tr8'>
                                                                          <td class='newsTitle mixNewsTitle' valign='top'>
                                                                            <div class='articlePhotoBox' newid='8'>
                                                                              <a href='nd.jsp?id=8&_np=2_315' target='_blank' style='display:block;width:145px;height:91px;overflow:hidden;'>
                                                                                <img class='newsPic' alt='文章附图' title='' src='./image/demo/ABUIABAEGAAg35TFrgUo0vSEowEwhwE4Ww.png'
                                                                                style='width:135px;height:91px;float:left;' />
                                                                              </a>
                                                                            </div>
                                                                            <div class='mixNewsStyleTitleContainer'>
                                                                              <div class='' style='margin:0;position:relative;'>
                                                                                <a class='no-mixNewsStyleTitleTip' href='nd.jsp?id=8&_np=2_315' target='_blank'>
                                                                                </a>
                                                                              </div>
                                                                              <a hidefocus='true' href="nd.jsp?id=8&_np=2_315" target=_blank title=""
                                                                              class='mixNewsStyleTitle  pic-mixNewsStyleTitle ' style='display:inline;'
                                                                              mix='0'>
                                                                                爱马仕创意动画广告片《时光梭织机》
                                                                              </a>
                                                                            </div>
                                                                            <p class='mixNewsStyleSummary  pic-mixNewsStyleSummary '>
                                                                              爱马仕究竟哪里好？素以精致的手工艺术闻名的爱马仕，推出的这段动画广告也许会给你答案，三分钟时间，让你明白贵有贵的道...
                                                                            </p>
                                                                          </td>
                                                                        </tr>
                                                                      </table>
                                                                    </div>
                                                                    <div class='separatorLine g_separator  pic-separatorLine '>
                                                                    </div>
                                                                    <div topClassName='top1' topSwitch='on' newsId='9' newsName='日本春梅风景广告片《SK-II发现片》'
                                                                    class='line noHover wWLine ' style='padding:0;height:auto;overflow:hidden;'>
                                                                      <table id='lineBody9' class='lineBody' cellpadding='0' cellspacing='0'>
                                                                        <tr id='module315tr9'>
                                                                          <td class='newsTitle mixNewsTitle' valign='top'>
                                                                            <div class='articlePhotoBox' newid='9'>
                                                                              <a href='nd.jsp?id=9&_np=2_315' target='_blank' style='display:block;width:145px;height:91px;overflow:hidden;'>
                                                                                <img class='newsPic' alt='文章附图' title='' src='./image/demo/ABUIABAEGAAgu6bFrgUotL7t4gQwhwE4Ww.png'
                                                                                style='width:135px;height:91px;float:left;' />
                                                                              </a>
                                                                            </div>
                                                                            <div class='mixNewsStyleTitleContainer'>
                                                                              <div class='' style='margin:0;position:relative;'>
                                                                                <a class='no-mixNewsStyleTitleTip' href='nd.jsp?id=9&_np=2_315' target='_blank'>
                                                                                </a>
                                                                              </div>
                                                                              <a hidefocus='true' href="nd.jsp?id=9&_np=2_315" target=_blank title=""
                                                                              class='mixNewsStyleTitle  pic-mixNewsStyleTitle ' style='display:inline;'
                                                                              mix='0'>
                                                                                日本春梅风景广告片《SK-II发现片》
                                                                              </a>
                                                                            </div>
                                                                            <p class='mixNewsStyleSummary  pic-mixNewsStyleSummary '>
                                                                              联发科技（MediaTek ）成立于1997年，总公司设在台湾新竹科学工业园区，是一家Fabless IC设计公司...
                                                                            </p>
                                                                          </td>
                                                                        </tr>
                                                                      </table>
                                                                    </div>
                                                                    <div class='separatorLine g_separator ' style='border-color:transparent'>
                                                                    </div>
                                                                    <div class='clearfloat'>
                                                                    </div>
                                                                  </div>
                                                                </div>
                                                              </div>
                                                            </td>
                                                            <td class='formMiddleRight formMiddleRight315'>
                                                            </td>
                                                          </tr>
                                                        </table>
                                                        <table class='formBottom formBottom315' cellpadding='0' cellspacing='0'>
                                                          <tr>
                                                            <td class='left left315'>
                                                            </td>
                                                            <td class='center center315'>
                                                            </td>
                                                            <td class='right right315'>
                                                            </td>
                                                          </tr>
                                                        </table>
                                                        <div class='clearfloat clearfloat315'>
                                                        </div>
                                                      </div>
                                                    </div>
                                                  </div>
                                                </td>
                                              </tr>
                                            </tbody>
                                          </table>
                                        </div>
                                      </div>
                                    </td>
                                    <td class='formMiddleRight formMiddleRight316'>
                                    </td>
                                  </tr>
                                </table>
                                <table class='formBottom formBottom316' cellpadding='0' cellspacing='0'>
                                  <tr>
                                    <td class='left left316'>
                                    </td>
                                    <td class='center center316'>
                                    </td>
                                    <td class='right right316'>
                                    </td>
                                  </tr>
                                </table>
                                <div class='clearfloat clearfloat316'>
                                </div>
                              </div>
                            </div>
                            <div id='module455' _indexClass='formIndex4' class='form form455 formIndex4 formStyle1 extformClass '
                            title='' style='' _side='0' _inTab='0' _inMulMCol='0' _inFullmeasure='0'
                            _autoHeight='1' _global='false' _independent='false'>
                              <div class='formWrap formWrap455'>
                                <table class='formTop formTop455' cellpadding='0' cellspacing='0'>
                                  <tr>
                                    <td class='left'>
                                    </td>
                                    <td class='center'>
                                    </td>
                                    <td class='right'>
                                    </td>
                                  </tr>
                                </table>
                                <table class='formBanner formBanner455' cellpadding='0' cellspacing='0'>
                                  <tr>
                                    <td class='left left455'>
                                    </td>
                                    <td class='center center455' valign='top'>
                                      <table cellpadding='0' cellspacing='0' class='formBannerTitle formBannerTitle455'>
                                        <tr>
                                          <td class='titleLeft titleLeft455' valign='top'>
                                          </td>
                                          <td class='titleCenter titleCenter455' valign='top'>
                                            <div class='titleText titleText455'>
                                              <span>
                                                图文展示
                                              </span>
                                            </div>
                                          </td>
                                          <td class='titleRight titleRight455' valign='top'>
                                          </td>
                                        </tr>
                                      </table>
                                      <div class='formBannerOther formBannerOther455'>
                                        <div class='formBannerBtn formBannerBtn455'>
                                          <span style='_display:inline-block;_position:relative;'>
                                            <a hidefocus='true' href='javascript:;' onclick='Site.closeAd("module455");return false;'
                                            class='g_close'>
                                              <span style='_display:none;'>
                                                &nbsp;
                                              </span>
                                            </a>
                                          </span>
                                        </div>
                                        &nbsp;
                                      </div>
                                    </td>
                                    <td class='right right455'>
                                    </td>
                                  </tr>
                                </table>
                                <table class='formMiddle formMiddle455' style='' cellpadding='0' cellspacing='0'>
                                  <tr>
                                    <td class='formMiddleLeft formMiddleLeft455'>
                                    </td>
                                    <td class='formMiddleCenter formMiddleCenter455' valign='top'>
                                      <div class='formMiddleContent formMiddleContent455  '>
                                        <div class='richModuleSlaveImgContainer textImg2'>
                                          <img imgid='_faiMaterial_000007' imgurl='' imglinktype='1' imgcolId='2'
                                          imgpath='http://2.ss.faisys.com/image/materialLib/illustration/000007.jpg'
                                          class='richModuleSlaveImg' alt='' title='' src='http://2.ss.faisys.com/image/materialLib/illustration/000007.jpg'
                                          style='width:500px;height:320px;' />
                                          <div class='richEditPic' _onMouseIn='0' onclick='Site.changeRichPic(455);return false;'>
                                            <a class='edit' id='uploadButton' title='编辑图片'>
                                            </a>
                                          </div>
                                        </div>
                                        <div class='richContent richContent2'>
                                          Struts框架可分为以下四个主要部分，其中三个就和MVC模式紧密相关： &nbsp; &nbsp; 1、模型 （Model），本质上来说在Struts中Model是一个Action类（这个会在后面详细讨论），开发者通过其实现商业逻辑，同时用户请求通过控制器（Controller）向Action的转发过程是基于由struts-config.xml文件描述的配置信息的。
                                          &nbsp; &nbsp; &nbsp;2、视图（View），View是由与控制器Servlet配合工作的一整套JSP定制标签库构成，利用她们我们可以快速建立应用系统的界面。
                                          &nbsp; &nbsp; &nbsp;3、控制器（Controller），本质上是一个Servlet，将客户端请求转发到相应的Action类。
                                          &nbsp; &nbsp; &nbsp;4、一堆用来做XML文件解析的工具包，Struts是用XML来描述如何自动产生一些JavaBean的属性的，此外Struts还利用XML来描述在国际化应用中的用户提示信息的（这样一来就实现了应用系统的多语言支持）。
                                        </div>
                                      </div>
                                    </td>
                                    <td class='formMiddleRight formMiddleRight455'>
                                    </td>
                                  </tr>
                                </table>
                                <table class='formBottom formBottom455' cellpadding='0' cellspacing='0'>
                                  <tr>
                                    <td class='left left455'>
                                    </td>
                                    <td class='center center455'>
                                    </td>
                                    <td class='right right455'>
                                    </td>
                                  </tr>
                                </table>
                                <div class='clearfloat clearfloat455'>
                                </div>
                              </div>
                            </div>
                            <div id='module457' _indexClass='formIndex5' class='form form457 formIndex5 formStyle4 extformClass '
                            title='' style='' _side='0' _inTab='0' _inMulMCol='0' _inFullmeasure='0'
                            _autoHeight='1' _global='false' _independent='false'>
                              <div class='formWrap formWrap457'>
                                <table class='formTop formTop457' cellpadding='0' cellspacing='0'>
                                  <tr>
                                    <td class='left'>
                                    </td>
                                    <td class='center'>
                                    </td>
                                    <td class='right'>
                                    </td>
                                  </tr>
                                </table>
                                <table class='formBanner formBanner457' cellpadding='0' cellspacing='0'>
                                  <tr>
                                    <td class='left left457'>
                                    </td>
                                    <td class='center center457' valign='top'>
                                      <table cellpadding='0' cellspacing='0' class='formBannerTitle formBannerTitle457'>
                                        <tr>
                                          <td class='titleLeft titleLeft457' valign='top'>
                                          </td>
                                          <td class='titleCenter titleCenter457' valign='top'>
                                            <div class='titleText titleText457'>
                                              <span>
                                                图册展示
                                              </span>
                                            </div>
                                          </td>
                                          <td class='titleRight titleRight457' valign='top'>
                                          </td>
                                        </tr>
                                      </table>
                                      <div class='formBannerOther formBannerOther457'>
                                        <div class='formBannerBtn formBannerBtn457'>
                                          <span style='_display:inline-block;_position:relative;'>
                                            <a hidefocus='true' href='javascript:;' onclick='Site.closeAd("module457");return false;'
                                            class='g_close'>
                                              <span style='_display:none;'>
                                                &nbsp;
                                              </span>
                                            </a>
                                          </span>
                                        </div>
                                        &nbsp;
                                      </div>
                                    </td>
                                    <td class='right right457'>
                                    </td>
                                  </tr>
                                </table>
                                <table class='formMiddle formMiddle457' style='' cellpadding='0' cellspacing='0'>
                                  <tr>
                                    <td class='formMiddleLeft formMiddleLeft457'>
                                    </td>
                                    <td class='formMiddleCenter formMiddleCenter457' valign='top'>
                                      <div class='formMiddleContent formMiddleContent457  '>
                                        <div class='photoList'>
                                          <div class='clearfloat'>
                                          </div>
                                          <div id='photoForms457' class='photoForms' picWidth='0' picHeight='0'>
                                            <div photoName='创意' photoDisc='包装设计<br/>VI识别设计' photoId='1' class='photoForm'
                                            faiWidth='140' faiHeight='160'>
                                              <div id='photoListABUIABAEGAAgx_e7rgUoiNrI7AEwkwE4qAE' class='imgDiv'>
                                                <table cellpadding='0' cellspacing='0'>
                                                  <tr>
                                                    <td>
                                                      <a hidefocus='true' href="pod.jsp?id=1&_php=2_457_1" target='_blank'>
                                                        <img class='photoImg' src='./image/demo/ABUIABAEGAAgx_e7rgUoiNrI7AEwkwE4qAE!160x160.png'
                                                        alt='创意' />
                                                      </a>
                                                    </td>
                                                  </tr>
                                                </table>
                                              </div>
                                              <div class='parametersDiv'>
                                                <div class='photoParameters firstLine nameWordWrap ' title='创意'>
                                                  创意
                                                </div>
                                                <div class='photoParameters basic' title='包装设计
                                                VI识别设计'>
                                                  包装设计
                                                  <br/>
                                                  VI识别设计
                                                </div>
                                              </div>
                                            </div>
                                            <div photoName='形象' photoDisc='专业设计<br/>企业形象打造' photoId='2' class='photoForm'
                                            faiWidth='140' faiHeight='160'>
                                              <div id='photoListABUIABAEGAAgx_e7rgUoqd-kpQcwkwE4qAE' class='imgDiv'>
                                                <table cellpadding='0' cellspacing='0'>
                                                  <tr>
                                                    <td>
                                                      <a hidefocus='true' href="pod.jsp?id=2&_php=2_457_1" target='_blank'>
                                                        <img class='photoImg' src='./image/demo/ABUIABAEGAAgx_e7rgUoqd-kpQcwkwE4qAE!160x160.png'
                                                        alt='形象' />
                                                      </a>
                                                    </td>
                                                  </tr>
                                                </table>
                                              </div>
                                              <div class='parametersDiv'>
                                                <div class='photoParameters firstLine nameWordWrap ' title='形象'>
                                                  形象
                                                </div>
                                                <div class='photoParameters basic' title='专业设计
                                                企业形象打造'>
                                                  专业设计
                                                  <br/>
                                                  企业形象打造
                                                </div>
                                              </div>
                                            </div>
                                            <div photoName='案例' photoDisc='品牌创意设计<br/>品牌诊断评估' photoId='3' class='photoForm'
                                            faiWidth='140' faiHeight='160'>
                                              <div id='photoListABUIABAEGAAgxue7rgUo3vDhvwEwkwE4qAE' class='imgDiv'>
                                                <table cellpadding='0' cellspacing='0'>
                                                  <tr>
                                                    <td>
                                                      <a hidefocus='true' href="pod.jsp?id=3&_php=2_457_1" target='_blank'>
                                                        <img class='photoImg' src='./image/demo/ABUIABAEGAAgxue7rgUo3vDhvwEwkwE4qAE!160x160.png'
                                                        alt='案例' />
                                                      </a>
                                                    </td>
                                                  </tr>
                                                </table>
                                              </div>
                                              <div class='parametersDiv'>
                                                <div class='photoParameters firstLine nameWordWrap ' title='案例'>
                                                  案例
                                                </div>
                                                <div class='photoParameters basic' title='品牌创意设计
                                                品牌诊断评估'>
                                                  品牌创意设计
                                                  <br/>
                                                  品牌诊断评估
                                                </div>
                                              </div>
                                            </div>
                                            <div photoName='推广' photoDisc='媒体营销<br/>搜索引擎营销' photoId='4' class='photoForm'
                                            faiWidth='140' faiHeight='160'>
                                              <div id='photoListABUIABAEGAAgxee7rgUo5N_YLDCTATioAQ' class='imgDiv'>
                                                <table cellpadding='0' cellspacing='0'>
                                                  <tr>
                                                    <td>
                                                      <a hidefocus='true' href="pod.jsp?id=4&_php=2_457_1" target='_blank'>
                                                        <img class='photoImg' src='./image/demo/ABUIABAEGAAgxee7rgUo5N_YLDCTATioAQ!160x160.png'
                                                        alt='推广' />
                                                      </a>
                                                    </td>
                                                  </tr>
                                                </table>
                                              </div>
                                              <div class='parametersDiv'>
                                                <div class='photoParameters firstLine nameWordWrap ' title='推广'>
                                                  推广
                                                </div>
                                                <div class='photoParameters basic' title='媒体营销
                                                搜索引擎营销'>
                                                  媒体营销
                                                  <br/>
                                                  搜索引擎营销
                                                </div>
                                              </div>
                                            </div>
                                          </div>
                                          <div class='clearfloat'>
                                          </div>
                                          <div id='pagenation457' class='pagenation'>
                                            <div class='pagePrev'>
                                              <span>
                                                上一页
                                              </span>
                                            </div>
                                            <div class='pageNo'>
                                              <span>
                                                1
                                              </span>
                                            </div>
                                            <div class='pageNext'>
                                              <span>
                                                下一页
                                              </span>
                                            </div>
                                          </div>
                                        </div>
                                      </div>
                                    </td>
                                    <td class='formMiddleRight formMiddleRight457'>
                                    </td>
                                  </tr>
                                </table>
                                <table class='formBottom formBottom457' cellpadding='0' cellspacing='0'>
                                  <tr>
                                    <td class='left left457'>
                                    </td>
                                    <td class='center center457'>
                                    </td>
                                    <td class='right right457'>
                                    </td>
                                  </tr>
                                </table>
                                <div class='clearfloat clearfloat457'>
                                </div>
                              </div>
                            </div>
                            <div id='module458' _indexClass='formIndex6' class='form form458 formIndex6 formStyle7 extformClass '
                            title='' style='' _side='0' _inTab='0' _inMulMCol='0' _inFullmeasure='0'
                            _autoHeight='1' _global='false' _independent='false'>
                              <div class='formWrap formWrap458'>
                                <table class='formTop formTop458' cellpadding='0' cellspacing='0'>
                                  <tr>
                                    <td class='left'>
                                    </td>
                                    <td class='center'>
                                    </td>
                                    <td class='right'>
                                    </td>
                                  </tr>
                                </table>
                                <table class='formBanner formBanner458' cellpadding='0' cellspacing='0'>
                                  <tr>
                                    <td class='left left458'>
                                    </td>
                                    <td class='center center458' valign='top'>
                                      <table cellpadding='0' cellspacing='0' class='formBannerTitle formBannerTitle458'>
                                        <tr>
                                          <td class='titleLeft titleLeft458' valign='top'>
                                          </td>
                                          <td class='titleCenter titleCenter458' valign='top'>
                                            <div class='titleText titleText458'>
                                              <span>
                                                文章列表
                                              </span>
                                            </div>
                                          </td>
                                          <td class='titleRight titleRight458' valign='top'>
                                          </td>
                                        </tr>
                                      </table>
                                      <div class='formBannerOther formBannerOther458'>
                                        <div class='formBannerMore formBannerMore458' style=''>
                                          <span style='_display:inline-block;_position:relative;'>
                                            <a hidefocus='true' href='nr.jsp'>
                                              <span>
                                                更多&#x3e;&#x3e;
                                              </span>
                                            </a>
                                          </span>
                                        </div>
                                        <div class='formBannerBtn formBannerBtn458'>
                                          <span style='_display:inline-block;_position:relative;'>
                                            <a hidefocus='true' href='javascript:;' onclick='Site.closeAd("module458");return false;'
                                            class='g_close'>
                                              <span style='_display:none;'>
                                                &nbsp;
                                              </span>
                                            </a>
                                          </span>
                                        </div>
                                        &nbsp;
                                      </div>
                                    </td>
                                    <td class='right right458'>
                                    </td>
                                  </tr>
                                </table>
                                <table class='formMiddle formMiddle458' style='' cellpadding='0' cellspacing='0'>
                                  <tr>
                                    <td class='formMiddleLeft formMiddleLeft458'>
                                    </td>
                                    <td class='formMiddleCenter formMiddleCenter458' valign='top'>
                                      <div class='formMiddleContent formMiddleContent458  '>
                                        <div>
                                          <div class='newsList ' id='newsList458' _showSetting=0>
                                            <div topClassName='top2' topSwitch='off' newsId='6' newsName='肯德基创意广告《原味鸡手腕花》-网聚V电影'
                                            class='line noHover wWLine  topFlagLine fk-newsLineHeight ' style='padding:0;height:auto;overflow:hidden;'>
                                              <table id='lineBody6' class='lineBody' cellpadding='0' cellspacing='0'>
                                                <tr id='module458tr6'>
                                                  <td class='newsTitle mixNewsTitle' valign='top'>
                                                    <div class='articlePhotoBox' newid='6'>
                                                      <a href='nd.jsp?id=6&_np=2_458' target='_blank' style='display:block;width:162px;height:117px;overflow:hidden;'>
                                                        <img class='newsPic' alt='文章附图' title='' src='./image/demo/ABUIABAEGAAg8aPFrgUolOq-_AYwhwE4Ww.png'
                                                        style='width:152px;height:107px;float:left;' />
                                                      </a>
                                                    </div>
                                                    <div class='mixNewsStyleTitleContainer'>
                                                      <div class=' g_topFlag g_topFlag1' style='margin:0;position:relative;'>
                                                        <a class=' mixNewsStyleTitleTip' href='nd.jsp?id=6&_np=2_458' target='_blank'>
                                                        </a>
                                                      </div>
                                                      <a hidefocus='true' href="nd.jsp?id=6&_np=2_458" target=_blank class='mixNewsStyleDate'>
                                                        2016-01-14
                                                      </a>
                                                      <a hidefocus='true' href="nd.jsp?id=6&_np=2_458" target=_blank title=""
                                                      class='mixNewsStyleTitle ' style='display:inline;' mix='0'>
                                                        肯德基创意广告《原味鸡手腕花》-网聚V电影
                                                      </a>
                                                    </div>
                                                    <a href='nd.jsp?id=6&_np=2_458' target='_blank' class='mixNewsStyleSummary '>
                                                      本片是肯德基最近推出的一部另类搞笑广告，将美国传统婚礼的手腕花进行了创造性改良，推出一款“原味鸡婚礼手腕花”，为热...
                                                    </a>
                                                  </td>
                                                </tr>
                                              </table>
                                            </div>
                                            <div class='separatorLine g_separator '>
                                            </div>
                                            <div topClassName='top1' topSwitch='on' newsId='7' newsName='全球知名硬盘厂商希捷新LOGO品牌设计'
                                            class='line g_item wWLine  fk-newsLineHeight   '>
                                              <table id='lineBody7' class='lineBody' cellpadding='0' cellspacing='0'>
                                                <tr id='module458tr7'>
                                                  <td class='contentLineIcon'>
                                                  </td>
                                                  <td class='newsTitle' valign='top'>
                                                    <div class=''>
                                                    </div>
                                                    <a hidefocus='true' href="nd.jsp?id=7&_np=2_458" target=_blank title="">
                                                      全球知名硬盘厂商希捷新LOGO品牌设计
                                                    </a>
                                                  </td>
                                                  <td class='newsCalendar' valign='top'>
                                                    <a hidefocus='true' href="nd.jsp?id=7&_np=2_458" target=_blank>
                                                      2016-01-14
                                                    </a>
                                                  </td>
                                                </tr>
                                              </table>
                                            </div>
                                            <div class='separatorLine g_separator ' style='border-color:transparent'>
                                            </div>
                                            <div class='clearfloat'>
                                            </div>
                                          </div>
                                        </div>
                                      </div>
                                    </td>
                                    <td class='formMiddleRight formMiddleRight458'>
                                    </td>
                                  </tr>
                                </table>
                                <table class='formBottom formBottom458' cellpadding='0' cellspacing='0'>
                                  <tr>
                                    <td class='left left458'>
                                    </td>
                                    <td class='center center458'>
                                    </td>
                                    <td class='right right458'>
                                    </td>
                                  </tr>
                                </table>
                                <div class='clearfloat clearfloat458'>
                                </div>
                              </div>
                            </div>
                            <div id='module459' _indexClass='formIndex7' class='form form459 formIndex7 formStyle39 extformClass '
                            title='' style='' _side='0' _inTab='0' _inMulMCol='0' _inFullmeasure='0'
                            _autoHeight='1' _global='false' _independent='false'>
                              <div class='formWrap formWrap459'>
                                <table class='formTop formTop459' cellpadding='0' cellspacing='0'>
                                  <tr>
                                    <td class='left'>
                                    </td>
                                    <td class='center'>
                                    </td>
                                    <td class='right'>
                                    </td>
                                  </tr>
                                </table>
                                <table class='formBanner formBanner459' cellpadding='0' cellspacing='0'>
                                  <tr>
                                    <td class='left left459'>
                                    </td>
                                    <td class='center center459' valign='top'>
                                      <table cellpadding='0' cellspacing='0' class='formBannerTitle formBannerTitle459'>
                                        <tr>
                                          <td class='titleLeft titleLeft459' valign='top'>
                                          </td>
                                          <td class='titleCenter titleCenter459' valign='top'>
                                            <div class='titleText titleText459'>
                                              <span>
                                                滚动公告
                                              </span>
                                            </div>
                                          </td>
                                          <td class='titleRight titleRight459' valign='top'>
                                          </td>
                                        </tr>
                                      </table>
                                      <div class='formBannerOther formBannerOther459'>
                                        <div class='formBannerBtn formBannerBtn459'>
                                          <span style='_display:inline-block;_position:relative;'>
                                            <a hidefocus='true' href='javascript:;' onclick='Site.closeAd("module459");return false;'
                                            class='g_close'>
                                              <span style='_display:none;'>
                                                &nbsp;
                                              </span>
                                            </a>
                                          </span>
                                        </div>
                                        &nbsp;
                                      </div>
                                    </td>
                                    <td class='right right459'>
                                    </td>
                                  </tr>
                                </table>
                                <table class='formMiddle formMiddle459' style='' cellpadding='0' cellspacing='0'>
                                  <tr>
                                    <td class='formMiddleLeft formMiddleLeft459'>
                                    </td>
                                    <td class='formMiddleCenter formMiddleCenter459' valign='top'>
                                      <div class='formMiddleContent formMiddleContent459  '>
                                        <div id='noticeContainer459' class='noticeContainer  notice-image0'>
                                          <div id='noticeMarquee459' class='noticeMarquee' style='position:relative;'>
                                            <table cellpadding=0 cellspacing=0>
                                              <tr>
                                                <td>
                                                  &nbsp;
                                                </td>
                                                <td nowrap>
                                                  撒旦法撒旦法
                                                </td>
                                                <td>
                                                  &nbsp;
                                                </td>
                                                <td>
                                                  &nbsp;
                                                </td>
                                                <td nowrap>
                                                  电风扇地方
                                                </td>
                                                <td>
                                                  &nbsp;
                                                </td>
                                              </tr>
                                            </table>
                                          </div>
                                        </div>
                                      </div>
                                    </td>
                                    <td class='formMiddleRight formMiddleRight459'>
                                    </td>
                                  </tr>
                                </table>
                                <table class='formBottom formBottom459' cellpadding='0' cellspacing='0'>
                                  <tr>
                                    <td class='left left459'>
                                    </td>
                                    <td class='center center459'>
                                    </td>
                                    <td class='right right459'>
                                    </td>
                                  </tr>
                                </table>
                                <div class='clearfloat clearfloat459'>
                                </div>
                              </div>
                            </div>
                            <div id='module461' _indexClass='formIndex8' class='form form461 formIndex8 formStyle29 layoutModule  extformClass '
                            title='' style='' _side='0' _inTab='0' _inMulMCol='0' _inFullmeasure='0'
                            _autoHeight='0' _global='false' _independent='false'>
                              <div class='formWrap formWrap461'>
                                <table class='formTop formTop461' cellpadding='0' cellspacing='0'>
                                  <tr>
                                    <td class='left'>
                                    </td>
                                    <td class='center'>
                                    </td>
                                    <td class='right'>
                                    </td>
                                  </tr>
                                </table>
                                <table class='formBanner formBanner461' cellpadding='0' cellspacing='0'>
                                  <tr>
                                    <td class='left left461'>
                                    </td>
                                    <td class='center center461' valign='top'>
                                      <table cellpadding='0' cellspacing='0' class='formBannerTitle formBannerTitle461'>
                                        <tr>
                                          <td class='titleLeft titleLeft461' valign='top'>
                                          </td>
                                          <td class='titleCenter titleCenter461' valign='top'>
                                            <div class='titleText titleText461'>
                                              <span>
                                                模块组
                                              </span>
                                            </div>
                                          </td>
                                          <td class='titleRight titleRight461' valign='top'>
                                          </td>
                                        </tr>
                                      </table>
                                      <div class='formBannerOther formBannerOther461'>
                                        <div class='formBannerBtn formBannerBtn461'>
                                          <span style='_display:inline-block;_position:relative;'>
                                            <a hidefocus='true' href='javascript:;' onclick='Site.closeAd("module461");return false;'
                                            class='g_close'>
                                              <span style='_display:none;'>
                                                &nbsp;
                                              </span>
                                            </a>
                                          </span>
                                        </div>
                                        &nbsp;
                                      </div>
                                    </td>
                                    <td class='right right461'>
                                    </td>
                                  </tr>
                                </table>
                                <table class='formMiddle formMiddle461' style='height:200px; ' cellpadding='0'
                                cellspacing='0'>
                                  <tr>
                                    <td class='formMiddleLeft formMiddleLeft461'>
                                    </td>
                                    <td class='formMiddleCenter formMiddleCenter461' valign='top'>
                                      <div class='formMiddleContent formMiddleContent461  '>
                                        <div class='formTab column' id='formTab461'>
                                          <table width='100%' cellpadding='0' cellspacing='0' class='titleTable'>
                                            <tr>
                                              <td class='formTabButtonTopLeft'>
                                              </td>
                                              <td class='formTabButtonTopCenter'>
                                                <div class='formTabButtonList formTabButtonList461' id='formTabButtonList461'>
                                                  <div class='formTabButton formTabButtonHover' id='formTabButton308' tabModuleId='308'
                                                  onclick='Site.changeLiCnt(308, false,29)'>
                                                    <div class='formTabLeft formTabLeftHover'>
                                                    </div>
                                                    <div class='formTabMiddle formTabMiddleHover'>
                                                      在线客服
                                                    </div>
                                                    <div class='formTabRight formTabRightHover'>
                                                    </div>
                                                  </div>
                                                  <div class='formTabButton' id='formTabButton311' tabModuleId='311' onclick='Site.changeLiCnt(311, false,29)'>
                                                    <div class='formTabLeft'>
                                                    </div>
                                                    <div class='formTabMiddle'>
                                                      分享网站
                                                    </div>
                                                    <div class='formTabRight'>
                                                    </div>
                                                  </div>
                                                </div>
                                              </td>
                                              <td class='formTabButtonTopRight'>
                                              </td>
                                            </tr>
                                          </table>
                                          <div class='formTabContent formTabContent461 column' id='formTabContent461'>
                                            <div class='formTabCntId' styleId=40 id='formTabCntId308'>
                                              <div id='module308' _indexClass='' class='form form308 formStyle40 formInTab  extformClass '
                                              title='' style='' _side='0' _inTab='461' _inMulMCol='0' _inFullmeasure='0'
                                              _autoHeight='1' _global='false' _independent='false'>
                                                <div class='formWrap formWrap308'>
                                                  <table class='formTop formTop308' cellpadding='0' cellspacing='0'>
                                                    <tr>
                                                      <td class='left'>
                                                      </td>
                                                      <td class='center'>
                                                      </td>
                                                      <td class='right'>
                                                      </td>
                                                    </tr>
                                                  </table>
                                                  <table class='formBanner formBanner308' cellpadding='0' cellspacing='0'>
                                                    <tr>
                                                      <td class='left left308'>
                                                      </td>
                                                      <td class='center center308' valign='top'>
                                                        <table cellpadding='0' cellspacing='0' class='formBannerTitle formBannerTitle308'>
                                                          <tr>
                                                            <td class='titleLeft titleLeft308' valign='top'>
                                                            </td>
                                                            <td class='titleCenter titleCenter308' valign='top'>
                                                              <div class='titleText titleText308'>
                                                                <span>
                                                                  在线客服
                                                                </span>
                                                              </div>
                                                            </td>
                                                            <td class='titleRight titleRight308' valign='top'>
                                                            </td>
                                                          </tr>
                                                        </table>
                                                        <div class='formBannerOther formBannerOther308'>
                                                          <div class='formBannerBtn formBannerBtn308'>
                                                            <span style='_display:inline-block;_position:relative;'>
                                                              <a hidefocus='true' href='javascript:;' onclick='Site.closeAd("module308");return false;'
                                                              class='g_close'>
                                                                <span style='_display:none;'>
                                                                  &nbsp;
                                                                </span>
                                                              </a>
                                                            </span>
                                                          </div>
                                                          &nbsp;
                                                        </div>
                                                      </td>
                                                      <td class='right right308'>
                                                      </td>
                                                    </tr>
                                                  </table>
                                                  <table class='formMiddle formMiddle308' style='' cellpadding='0' cellspacing='0'>
                                                    <tr>
                                                      <td class='formMiddleLeft formMiddleLeft308'>
                                                      </td>
                                                      <td class='formMiddleCenter formMiddleCenter308' valign='top'>
                                                        <div class='formMiddleContent formMiddleContent308  '>
                                                          <div id='serOnline-container308' class='serOnline-container'>
                                                            <div class='serOnline-service'>
                                                              <div class='serOnline-list-v lineH-21  '>
                                                                <a hidefocus='true' href='http://wpa.qq.com/msgrd?v=3&uin=258506508&site=qq&menu=yes'
                                                                target='_blank'>
                                                                  <span class='serOnline-img0 qqImg0'>
                                                                    &nbsp;
                                                                  </span>
                                                                  客服一
                                                                </a>
                                                              </div>
                                                              <div class='serOnline-list-v lineH-21 lastData '>
                                                                <a hidefocus='true' href='http://wpa.qq.com/msgrd?v=3&uin=258506508&site=qq&menu=yes'
                                                                target='_blank'>
                                                                  <span class='serOnline-img0 qqImg0'>
                                                                    &nbsp;
                                                                  </span>
                                                                  客服二
                                                                </a>
                                                              </div>
                                                            </div>
                                                            <div class='serOnline-separation-line g_separator'>
                                                            </div>
                                                            <div class='serOnline-worktime'>
                                                              <div class='marBL-10'>
                                                                <span class='worktime-header-img'>
                                                                  &nbsp;
                                                                </span>
                                                                <span style='font-size:15px;'>
                                                                  <b>
                                                                    工作时间
                                                                  </b>
                                                                </span>
                                                              </div>
                                                              <div class='serOnline-list-v '>
                                                                <span>
                                                                  周一至周五 ：8:30-17:30
                                                                </span>
                                                              </div>
                                                              <div class='serOnline-list-v lastData'>
                                                                <span>
                                                                  周六至周日 ：9:00-17:00
                                                                </span>
                                                              </div>
                                                            </div>
                                                          </div>
                                                        </div>
                                                      </td>
                                                      <td class='formMiddleRight formMiddleRight308'>
                                                      </td>
                                                    </tr>
                                                  </table>
                                                  <table class='formBottom formBottom308' cellpadding='0' cellspacing='0'>
                                                    <tr>
                                                      <td class='left left308'>
                                                      </td>
                                                      <td class='center center308'>
                                                      </td>
                                                      <td class='right right308'>
                                                      </td>
                                                    </tr>
                                                  </table>
                                                  <div class='clearfloat clearfloat308'>
                                                  </div>
                                                </div>
                                              </div>
                                            </div>
                                            <div class='formTabCntId' styleId=67 id='formTabCntId311'>
                                              <div id='module311' _indexClass='' class='form  formStyle67 formInTab  extformClass '
                                              title='' style='' _side='0' _inTab='461' _inMulMCol='0' _inFullmeasure='0'
                                              _autoHeight='1' _global='true' _independent='false'>
                                                <div class='formWrap formWrap311'>
                                                  <table class='formTop formTop311' cellpadding='0' cellspacing='0'>
                                                    <tr>
                                                      <td class='left'>
                                                      </td>
                                                      <td class='center'>
                                                      </td>
                                                      <td class='right'>
                                                      </td>
                                                    </tr>
                                                  </table>
                                                  <table class='formBanner formBanner311' cellpadding='0' cellspacing='0'>
                                                    <tr>
                                                      <td class='left left311'>
                                                      </td>
                                                      <td class='center center311' valign='top'>
                                                        <table cellpadding='0' cellspacing='0' class='formBannerTitle formBannerTitle311'>
                                                          <tr>
                                                            <td class='titleLeft titleLeft311' valign='top'>
                                                            </td>
                                                            <td class='titleCenter titleCenter311' valign='top'>
                                                              <div class='titleText titleText311'>
                                                                <span>
                                                                  分享网站
                                                                </span>
                                                              </div>
                                                            </td>
                                                            <td class='titleRight titleRight311' valign='top'>
                                                            </td>
                                                          </tr>
                                                        </table>
                                                        <div class='formBannerOther formBannerOther311'>
                                                          <div class='formBannerBtn formBannerBtn311'>
                                                            <span style='_display:inline-block;_position:relative;'>
                                                              <a hidefocus='true' href='javascript:;' onclick='Site.closeAd("module311");return false;'
                                                              class='g_close'>
                                                                <span style='_display:none;'>
                                                                  &nbsp;
                                                                </span>
                                                              </a>
                                                            </span>
                                                          </div>
                                                          &nbsp;
                                                        </div>
                                                      </td>
                                                      <td class='right right311'>
                                                      </td>
                                                    </tr>
                                                  </table>
                                                  <table class='formMiddle formMiddle311' style='' cellpadding='0' cellspacing='0'>
                                                    <tr>
                                                      <td class='formMiddleLeft formMiddleLeft311'>
                                                      </td>
                                                      <td class='formMiddleCenter formMiddleCenter311' valign='top'>
                                                        <div class='formMiddleContent formMiddleContent311  '>
                                                          <div class='shareInfo'>
                                                            <div class='shareCtrl shareNotTitlePanel shareMt'>
                                                              <a hidefocus='true' title='分享到Facebook' href='javascript:;' onclick='window.open("http://www.facebook.com/sharer.php?t=http%3A%2F%2Fwww.seeyoui.icoc.in%2F%3F_sc%3D1&u=http://www.seeyoui.icoc.in/?_sc=1&pic=")'>
                                                                <div class='shareIcon FaceBook'>
                                                                </div>
                                                                <div class='shareCtrl'>
                                                                  Facebook
                                                                </div>
                                                              </a>
                                                              <a hidefocus='true' title='分享到Twitter' href='javascript:;' onclick='window.open("http://twitter.com/intent/tweet?text=%E3%80%90%E6%99%BA%E6%85%A7%E6%98%9F%E6%B2%B3%E3%80%91http%3A%2F%2Fwww.seeyoui.icoc.in%2F%3F_sc%3D1&pic=")'>
                                                                <div class='shareIcon Twitter'>
                                                                </div>
                                                                <div class='shareCtrl'>
                                                                  Twitter
                                                                </div>
                                                              </a>
                                                              <a hidefocus='true' title='分享到LinkedIn' href='javascript:;' onclick='window.open("http://www.linkedin.com/shareArticle?summary=http%3A%2F%2Fwww.seeyoui.icoc.in%2F%3F_sc%3D1&url=http://www.seeyoui.icoc.in/?_sc=1&title=%E3%80%90%E6%99%BA%E6%85%A7%E6%98%9F%E6%B2%B3%E3%80%91")'>
                                                                <div class='shareIcon LinkedIn'>
                                                                </div>
                                                                <div class='shareCtrl'>
                                                                  LinkedIn
                                                                </div>
                                                              </a>
                                                            </div>
                                                            <div class='clearfloat'>
                                                            </div>
                                                          </div>
                                                        </div>
                                                      </td>
                                                      <td class='formMiddleRight formMiddleRight311'>
                                                      </td>
                                                    </tr>
                                                  </table>
                                                  <table class='formBottom formBottom311' cellpadding='0' cellspacing='0'>
                                                    <tr>
                                                      <td class='left left311'>
                                                      </td>
                                                      <td class='center center311'>
                                                      </td>
                                                      <td class='right right311'>
                                                      </td>
                                                    </tr>
                                                  </table>
                                                  <div class='clearfloat clearfloat311'>
                                                  </div>
                                                </div>
                                              </div>
                                            </div>
                                          </div>
                                        </div>
                                      </div>
                                    </td>
                                    <td class='formMiddleRight formMiddleRight461'>
                                    </td>
                                  </tr>
                                </table>
                                <table class='formBottom formBottom461' cellpadding='0' cellspacing='0'>
                                  <tr>
                                    <td class='left left461'>
                                    </td>
                                    <td class='center center461'>
                                    </td>
                                    <td class='right right461'>
                                    </td>
                                  </tr>
                                </table>
                                <div class='clearfloat clearfloat461'>
                                </div>
                              </div>
                            </div>
                            <div id='module462' _indexClass='formIndex9' class='form form462 formIndex9 formStyle35 layoutModule  formStyle35_2  extformClass '
                            title='' style='' _side='0' _inTab='0' _inMulMCol='0' _inFullmeasure='0'
                            _autoHeight='1' _global='false' _independent='false'>
                              <div class='formWrap formWrap462'>
                                <table class='formTop formTop462' cellpadding='0' cellspacing='0'>
                                  <tr>
                                    <td class='left'>
                                    </td>
                                    <td class='center'>
                                    </td>
                                    <td class='right'>
                                    </td>
                                  </tr>
                                </table>
                                <table class='formBanner formBanner462' cellpadding='0' cellspacing='0'>
                                  <tr>
                                    <td class='left left462'>
                                    </td>
                                    <td class='center center462' valign='top'>
                                      <table cellpadding='0' cellspacing='0' class='formBannerTitle formBannerTitle462'>
                                        <tr>
                                          <td class='titleLeft titleLeft462' valign='top'>
                                          </td>
                                          <td class='titleCenter titleCenter462' valign='top'>
                                            <div class='titleText titleText462'>
                                              <span>
                                                模块列
                                              </span>
                                            </div>
                                          </td>
                                          <td class='titleRight titleRight462' valign='top'>
                                          </td>
                                        </tr>
                                      </table>
                                      <div class='formBannerOther formBannerOther462'>
                                        <div class='formBannerBtn formBannerBtn462'>
                                          <span style='_display:inline-block;_position:relative;'>
                                            <a hidefocus='true' href='javascript:;' onclick='Site.closeAd("module462");return false;'
                                            class='g_close'>
                                              <span style='_display:none;'>
                                                &nbsp;
                                              </span>
                                            </a>
                                          </span>
                                        </div>
                                        &nbsp;
                                      </div>
                                    </td>
                                    <td class='right right462'>
                                    </td>
                                  </tr>
                                </table>
                                <table class='formMiddle formMiddle462' style='' cellpadding='0' cellspacing='0'>
                                  <tr>
                                    <td class='formMiddleLeft formMiddleLeft462'>
                                    </td>
                                    <td class='formMiddleCenter formMiddleCenter462' valign='top'>
                                      <div class='formMiddleContent formMiddleContent462  multiColFormMiddleContent'>
                                        <div class='mulMColContent' id='mulMColContent462'>
                                          <table width="100%" border="0" cellspacing="0" class="mulMColContentTable"
                                          cellpadding="0">
                                            <tbody>
                                              <tr>
                                                <td class=" mulColLayout mulColPadding" style="">
                                                  <div id="mulMCol462_cid_1" class="mulMColList column">
                                                  </div>
                                                  <div class="mulModuleColStyleLine" style="">
                                                  </div>
                                                </td>
                                                <td class=" mulColLayout mulColPadding" style="">
                                                  <div id="mulMCol462_cid_2" class="mulMColList column">
                                                  </div>
                                                  <div class="mulModuleColStyleLine" style="">
                                                  </div>
                                                </td>
                                                <td class="mulColLayout" style="">
                                                  <div id="mulMCol462_cid_3" class="mulMColList column">
                                                  </div>
                                                </td>
                                              </tr>
                                            </tbody>
                                          </table>
                                        </div>
                                      </div>
                                    </td>
                                    <td class='formMiddleRight formMiddleRight462'>
                                    </td>
                                  </tr>
                                </table>
                                <table class='formBottom formBottom462' cellpadding='0' cellspacing='0'>
                                  <tr>
                                    <td class='left left462'>
                                    </td>
                                    <td class='center center462'>
                                    </td>
                                    <td class='right right462'>
                                    </td>
                                  </tr>
                                </table>
                                <div class='clearfloat clearfloat462'>
                                </div>
                              </div>
                            </div>
                            <div id='module463' _indexClass='formIndex10' class='form form463 formIndex10 formStyle2 extformClass '
                            title='' style='' _side='0' _inTab='0' _inMulMCol='0' _inFullmeasure='0'
                            _autoHeight='1' _global='false' _independent='false'>
                              <div class='formWrap formWrap463'>
                                <table class='formTop formTop463' cellpadding='0' cellspacing='0'>
                                  <tr>
                                    <td class='left'>
                                    </td>
                                    <td class='center'>
                                    </td>
                                    <td class='right'>
                                    </td>
                                  </tr>
                                </table>
                                <table class='formBanner formBanner463' cellpadding='0' cellspacing='0'>
                                  <tr>
                                    <td class='left left463'>
                                    </td>
                                    <td class='center center463' valign='top'>
                                      <table cellpadding='0' cellspacing='0' class='formBannerTitle formBannerTitle463'>
                                        <tr>
                                          <td class='titleLeft titleLeft463' valign='top'>
                                          </td>
                                          <td class='titleCenter titleCenter463' valign='top'>
                                            <div class='titleText titleText463'>
                                              <span>
                                                产品展示
                                              </span>
                                            </div>
                                          </td>
                                          <td class='titleRight titleRight463' valign='top'>
                                          </td>
                                        </tr>
                                      </table>
                                      <div class='formBannerOther formBannerOther463'>
                                        <div class='formBannerBtn formBannerBtn463'>
                                          <span style='_display:inline-block;_position:relative;'>
                                            <a hidefocus='true' href='javascript:;' onclick='Site.closeAd("module463");return false;'
                                            class='g_close'>
                                              <span style='_display:none;'>
                                                &nbsp;
                                              </span>
                                            </a>
                                          </span>
                                        </div>
                                        &nbsp;
                                      </div>
                                    </td>
                                    <td class='right right463'>
                                    </td>
                                  </tr>
                                </table>
                                <table class='formMiddle formMiddle463' style='' cellpadding='0' cellspacing='0'>
                                  <tr>
                                    <td class='formMiddleLeft formMiddleLeft463'>
                                    </td>
                                    <td class='formMiddleCenter formMiddleCenter463' valign='top'>
                                      <div class='formMiddleContent formMiddleContent463  '>
                                        <div id='productList463' class='productList' picWidth='0' picHeight='0'>
                                          <div topClassName='top1' topSwitch='on' productId='2' productName='产品2'
                                          class='productTileForm' faiWidth='160' faiHeight='160'>
                                            <div id='productTileForm2' class='imgDiv'>
                                              <table cellpadding='0' cellspacing='0'>
                                                <tr id='module463product2'>
                                                  <td>
                                                    <a hidefocus='true' href='pd.jsp?id=2&_pp=2_463' target='_blank'>
                                                      <img alt='产品2' src='http://3.ss.faisys.com/image/demo/0_thumb_2.jpg' title=''
                                                      />
                                                    </a>
                                                  </td>
                                                </tr>
                                              </table>
                                            </div>
                                            <div class='propList' style='text-align:center'>
                                              <table class='propDiv productName productNameWordWrap' cellpadding='0'
                                              cellspacing='0'>
                                                <tr>
                                                  <td>
                                                    <a hidefocus='true' href='pd.jsp?id=2&_pp=2_463' target='_blank' title='产品2'>
                                                      产品2
                                                    </a>
                                                  </td>
                                                </tr>
                                              </table>
                                            </div>
                                          </div>
                                          <div topClassName='top1' topSwitch='on' productId='3' productName='产品3'
                                          class='productTileForm' faiWidth='160' faiHeight='160'>
                                            <div id='productTileForm3' class='imgDiv'>
                                              <table cellpadding='0' cellspacing='0'>
                                                <tr id='module463product3'>
                                                  <td>
                                                    <a hidefocus='true' href='pd.jsp?id=3&_pp=2_463' target='_blank'>
                                                      <img alt='产品3' src='http://3.ss.faisys.com/image/demo/0_thumb_2.jpg' title=''
                                                      />
                                                    </a>
                                                  </td>
                                                </tr>
                                              </table>
                                            </div>
                                            <div class='propList' style='text-align:center'>
                                              <table class='propDiv productName productNameWordWrap' cellpadding='0'
                                              cellspacing='0'>
                                                <tr>
                                                  <td>
                                                    <a hidefocus='true' href='pd.jsp?id=3&_pp=2_463' target='_blank' title='产品3'>
                                                      产品3
                                                    </a>
                                                  </td>
                                                </tr>
                                              </table>
                                            </div>
                                          </div>
                                          <div topClassName='top1' topSwitch='on' productId='5' productName='产品5'
                                          class='productTileForm' faiWidth='160' faiHeight='160'>
                                            <div id='productTileForm5' class='imgDiv'>
                                              <table cellpadding='0' cellspacing='0'>
                                                <tr id='module463product5'>
                                                  <td>
                                                    <a hidefocus='true' href='pd.jsp?id=5&_pp=2_463' target='_blank'>
                                                      <img alt='产品5' src='http://3.ss.faisys.com/image/demo/0_thumb_2.jpg' title=''
                                                      />
                                                    </a>
                                                  </td>
                                                </tr>
                                              </table>
                                            </div>
                                            <div class='propList' style='text-align:center'>
                                              <table class='propDiv productName productNameWordWrap' cellpadding='0'
                                              cellspacing='0'>
                                                <tr>
                                                  <td>
                                                    <a hidefocus='true' href='pd.jsp?id=5&_pp=2_463' target='_blank' title='产品5'>
                                                      产品5
                                                    </a>
                                                  </td>
                                                </tr>
                                              </table>
                                            </div>
                                          </div>
                                          <div class='clearfloat'>
                                          </div>
                                          <div id='pagenation463' class='pagenation'>
                                            <div class='pagePrev'>
                                              <span>
                                                上一页
                                              </span>
                                            </div>
                                            <div class='pageNo'>
                                              <span>
                                                1
                                              </span>
                                            </div>
                                            <div class='pageNext'>
                                              <span>
                                                下一页
                                              </span>
                                            </div>
                                          </div>
                                        </div>
                                      </div>
                                    </td>
                                    <td class='formMiddleRight formMiddleRight463'>
                                    </td>
                                  </tr>
                                </table>
                                <table class='formBottom formBottom463' cellpadding='0' cellspacing='0'>
                                  <tr>
                                    <td class='left left463'>
                                    </td>
                                    <td class='center center463'>
                                    </td>
                                    <td class='right right463'>
                                    </td>
                                  </tr>
                                </table>
                                <div class='clearfloat clearfloat463'>
                                </div>
                              </div>
                            </div>
                            <div id='module464' _indexClass='formIndex11' class='form form464 formIndex11 formStyle76 extformClass '
                            title='' style='' _side='0' _inTab='0' _inMulMCol='0' _inFullmeasure='0'
                            _autoHeight='1' _global='false' _independent='false'>
                              <div class='formWrap formWrap464'>
                                <table class='formTop formTop464' cellpadding='0' cellspacing='0'>
                                  <tr>
                                    <td class='left'>
                                    </td>
                                    <td class='center'>
                                    </td>
                                    <td class='right'>
                                    </td>
                                  </tr>
                                </table>
                                <table class='formBanner formBanner464' cellpadding='0' cellspacing='0'>
                                  <tr>
                                    <td class='left left464'>
                                    </td>
                                    <td class='center center464' valign='top'>
                                      <table cellpadding='0' cellspacing='0' class='formBannerTitle formBannerTitle464'>
                                        <tr>
                                          <td class='titleLeft titleLeft464' valign='top'>
                                          </td>
                                          <td class='titleCenter titleCenter464' valign='top'>
                                            <div class='titleText titleText464'>
                                              <span>
                                                产品分类
                                              </span>
                                            </div>
                                          </td>
                                          <td class='titleRight titleRight464' valign='top'>
                                          </td>
                                        </tr>
                                      </table>
                                      <div class='formBannerOther formBannerOther464'>
                                        <div class='formBannerBtn formBannerBtn464'>
                                          <span style='_display:inline-block;_position:relative;'>
                                            <a hidefocus='true' href='javascript:;' onclick='Site.closeAd("module464");return false;'
                                            class='g_close'>
                                              <span style='_display:none;'>
                                                &nbsp;
                                              </span>
                                            </a>
                                          </span>
                                        </div>
                                        &nbsp;
                                      </div>
                                    </td>
                                    <td class='right right464'>
                                    </td>
                                  </tr>
                                </table>
                                <table class='formMiddle formMiddle464' style='' cellpadding='0' cellspacing='0'>
                                  <tr>
                                    <td class='formMiddleLeft formMiddleLeft464'>
                                    </td>
                                    <td class='formMiddleCenter formMiddleCenter464' valign='top'>
                                      <div class='formMiddleContent formMiddleContent464  '>
                                        <div class='pd_mall_Group pd_mall_G_J'>
                                          <div class='p_m_cotainer_J' style='*display: inline; *zoom: 1; *width: 100%;'
                                          _chd=0 _id='1'>
                                            <table class='p_m_cotainer' cellpadding='0' cellspacing='0'>
                                              <tr>
                                                <td class='p_m_cotainerLeft'>
                                                </td>
                                                <td class='p_m_cotainerCenter'>
                                                  <a class='p_m_value p_m_value_J' href='pr.jsp?_pp=0_464_1_-1'>
                                                    分类1
                                                  </a>
                                                </td>
                                                <td class='p_m_cotainerRight p_m_cotainerR_J'>
                                                </td>
                                              </tr>
                                            </table>
                                          </div>
                                          <div class='p_m_cotainer_J' style='*display: inline; *zoom: 1; *width: 100%;'
                                          _chd=0 _id='2'>
                                            <table class='p_m_cotainer' cellpadding='0' cellspacing='0'>
                                              <tr>
                                                <td class='p_m_cotainerLeft'>
                                                </td>
                                                <td class='p_m_cotainerCenter'>
                                                  <a class='p_m_value p_m_value_J' href='pr.jsp?_pp=0_464_2_-1'>
                                                    分类2
                                                  </a>
                                                </td>
                                                <td class='p_m_cotainerRight p_m_cotainerR_J'>
                                                </td>
                                              </tr>
                                            </table>
                                          </div>
                                        </div>
                                      </div>
                                    </td>
                                    <td class='formMiddleRight formMiddleRight464'>
                                    </td>
                                  </tr>
                                </table>
                                <table class='formBottom formBottom464' cellpadding='0' cellspacing='0'>
                                  <tr>
                                    <td class='left left464'>
                                    </td>
                                    <td class='center center464'>
                                    </td>
                                    <td class='right right464'>
                                    </td>
                                  </tr>
                                </table>
                                <div class='clearfloat clearfloat464'>
                                </div>
                              </div>
                            </div>
                            <div id='module465' _indexClass='formIndex12' class='form form465 formIndex12 formStyle38 extformClass '
                            title='' style='' _side='0' _inTab='0' _inMulMCol='0' _inFullmeasure='0'
                            _autoHeight='1' _global='false' _independent='false'>
                              <div class='formWrap formWrap465'>
                                <table class='formTop formTop465' cellpadding='0' cellspacing='0'>
                                  <tr>
                                    <td class='left'>
                                    </td>
                                    <td class='center'>
                                    </td>
                                    <td class='right'>
                                    </td>
                                  </tr>
                                </table>
                                <table class='formBanner formBanner465' cellpadding='0' cellspacing='0'>
                                  <tr>
                                    <td class='left left465'>
                                    </td>
                                    <td class='center center465' valign='top'>
                                      <table cellpadding='0' cellspacing='0' class='formBannerTitle formBannerTitle465'>
                                        <tr>
                                          <td class='titleLeft titleLeft465' valign='top'>
                                          </td>
                                          <td class='titleCenter titleCenter465' valign='top'>
                                            <div class='titleText titleText465'>
                                              <span>
                                                产品标签
                                              </span>
                                            </div>
                                          </td>
                                          <td class='titleRight titleRight465' valign='top'>
                                          </td>
                                        </tr>
                                      </table>
                                      <div class='formBannerOther formBannerOther465'>
                                        <div class='formBannerBtn formBannerBtn465'>
                                          <span style='_display:inline-block;_position:relative;'>
                                            <a hidefocus='true' href='javascript:;' onclick='Site.closeAd("module465");return false;'
                                            class='g_close'>
                                              <span style='_display:none;'>
                                                &nbsp;
                                              </span>
                                            </a>
                                          </span>
                                        </div>
                                        &nbsp;
                                      </div>
                                    </td>
                                    <td class='right right465'>
                                    </td>
                                  </tr>
                                </table>
                                <table class='formMiddle formMiddle465' style='' cellpadding='0' cellspacing='0'>
                                  <tr>
                                    <td class='formMiddleLeft formMiddleLeft465'>
                                    </td>
                                    <td class='formMiddleCenter formMiddleCenter465' valign='top'>
                                      <div class='formMiddleContent formMiddleContent465  '>
                                        <div class=' g_foldContainer g_vertFold g_foldNOBtn'>
                                          <table class='g_foldContainerTop' cellpadding='0' cellspacing='0'>
                                            <tr>
                                              <td class='g_foldContainerTopLeft'>
                                              </td>
                                              <td class='g_foldContainerTopCenter'>
                                              </td>
                                              <td class='g_foldContainerTopRight'>
                                              </td>
                                            </tr>
                                          </table>
                                          <table class='g_foldContainerContent' cellpadding='0' cellspacing='0'>
                                            <tr>
                                              <td class='g_foldContainerContentLeft'>
                                              </td>
                                              <td class='g_foldContainerContentCenter'>
                                                <table class='g_foldContainerPanel' cellpadding='0' cellspacing='0'>
                                                  <tr>
                                                    <td class='g_foldContainerPanelLeft'>
                                                    </td>
                                                    <td class='g_foldContainerPanelCenter'>
                                                      <table foldId='2' class='g_foldContainerValue fold_J g_item fold_h_J'
                                                      cellpadding='0' cellspacing='0'>
                                                        <tr>
                                                          <td class='productFilterValueLeft contentLineIcon'>
                                                          </td>
                                                          <td class='g_foldContainerValueCenter ' style='*padding:0;'>
                                                            <a hidefocus='true' href='pr.jsp?mid=465&amp;labelId=2' title='最新'>
                                                              最新
                                                            </a>
                                                          </td>
                                                          <td class='g_foldContainerValueRight'>
                                                          </td>
                                                        </tr>
                                                      </table>
                                                    </td>
                                                    <td class='g_foldContainerPanelRight'>
                                                    </td>
                                                  </tr>
                                                </table>
                                              </td>
                                              <td class='g_foldContainerContentRight'>
                                              </td>
                                            </tr>
                                          </table>
                                          <table class='g_foldContainerBottom' cellpadding='0' cellspacing='0'>
                                            <tr>
                                              <td class='g_foldContainerBottomLeft'>
                                              </td>
                                              <td class='g_foldContainerBottomCenter'>
                                              </td>
                                              <td class='g_foldContainerBottomRight'>
                                              </td>
                                            </tr>
                                          </table>
                                        </div>
                                      </div>
                                    </td>
                                    <td class='formMiddleRight formMiddleRight465'>
                                    </td>
                                  </tr>
                                </table>
                                <table class='formBottom formBottom465' cellpadding='0' cellspacing='0'>
                                  <tr>
                                    <td class='left left465'>
                                    </td>
                                    <td class='center center465'>
                                    </td>
                                    <td class='right right465'>
                                    </td>
                                  </tr>
                                </table>
                                <div class='clearfloat clearfloat465'>
                                </div>
                              </div>
                            </div>
                            <div id='module466' _indexClass='formIndex13' class='form form466 formIndex13 formStyle21 extformClass '
                            title='' style='' _side='0' _inTab='0' _inMulMCol='0' _inFullmeasure='0'
                            _autoHeight='1' _global='false' _independent='false'>
                              <div class='formWrap formWrap466'>
                                <table class='formTop formTop466' cellpadding='0' cellspacing='0'>
                                  <tr>
                                    <td class='left'>
                                    </td>
                                    <td class='center'>
                                    </td>
                                    <td class='right'>
                                    </td>
                                  </tr>
                                </table>
                                <table class='formBanner formBanner466' cellpadding='0' cellspacing='0'>
                                  <tr>
                                    <td class='left left466'>
                                    </td>
                                    <td class='center center466' valign='top'>
                                      <table cellpadding='0' cellspacing='0' class='formBannerTitle formBannerTitle466'>
                                        <tr>
                                          <td class='titleLeft titleLeft466' valign='top'>
                                          </td>
                                          <td class='titleCenter titleCenter466' valign='top'>
                                            <div class='titleText titleText466'>
                                              <span>
                                                产品目录
                                              </span>
                                            </div>
                                          </td>
                                          <td class='titleRight titleRight466' valign='top'>
                                          </td>
                                        </tr>
                                      </table>
                                      <div class='formBannerOther formBannerOther466'>
                                        <div class='formBannerBtn formBannerBtn466'>
                                          <span style='_display:inline-block;_position:relative;'>
                                            <a hidefocus='true' href='javascript:;' onclick='Site.closeAd("module466");return false;'
                                            class='g_close'>
                                              <span style='_display:none;'>
                                                &nbsp;
                                              </span>
                                            </a>
                                          </span>
                                        </div>
                                        &nbsp;
                                      </div>
                                    </td>
                                    <td class='right right466'>
                                    </td>
                                  </tr>
                                </table>
                                <table class='formMiddle formMiddle466' style='' cellpadding='0' cellspacing='0'>
                                  <tr>
                                    <td class='formMiddleLeft formMiddleLeft466'>
                                    </td>
                                    <td class='formMiddleCenter formMiddleCenter466' valign='top'>
                                      <div class='formMiddleContent formMiddleContent466  '>
                                        <div class='s_p_catalog g_foldContainer g_vertFold g_foldNOBtn'>
                                          <table class='g_foldContainerTop' cellpadding='0' cellspacing='0'>
                                            <tr>
                                              <td class='g_foldContainerTopLeft'>
                                              </td>
                                              <td class='g_foldContainerTopCenter'>
                                              </td>
                                              <td class='g_foldContainerTopRight'>
                                              </td>
                                            </tr>
                                          </table>
                                          <table class='g_foldContainerContent' cellpadding='0' cellspacing='0'>
                                            <tr>
                                              <td class='g_foldContainerContentLeft'>
                                              </td>
                                              <td class='g_foldContainerContentCenter'>
                                                <table class='g_foldContainerPanel' cellpadding='0' cellspacing='0'>
                                                  <tr>
                                                    <td class='g_foldContainerPanelLeft'>
                                                    </td>
                                                    <td class='g_foldContainerPanelCenter'>
                                                      <table foldId='0' class='g_foldContainerValue fold_J g_item fold_h_J'
                                                      cellpadding='0' cellspacing='0'>
                                                        <tr>
                                                          <td class='productFilterValueLeft contentLineIcon'>
                                                          </td>
                                                          <td class='g_foldContainerValueCenter ' style='*padding:0;'>
                                                            <a hidefocus='true' href='pr.jsp?_pp=0_466_0' title='阿道夫'>
                                                              阿道夫
                                                            </a>
                                                          </td>
                                                          <td class='g_foldContainerValueRight'>
                                                          </td>
                                                        </tr>
                                                      </table>
                                                    </td>
                                                    <td class='g_foldContainerPanelRight'>
                                                    </td>
                                                  </tr>
                                                </table>
                                              </td>
                                              <td class='g_foldContainerContentRight'>
                                              </td>
                                            </tr>
                                          </table>
                                          <table class='g_foldContainerBottom' cellpadding='0' cellspacing='0'>
                                            <tr>
                                              <td class='g_foldContainerBottomLeft'>
                                              </td>
                                              <td class='g_foldContainerBottomCenter'>
                                              </td>
                                              <td class='g_foldContainerBottomRight'>
                                              </td>
                                            </tr>
                                          </table>
                                        </div>
                                      </div>
                                    </td>
                                    <td class='formMiddleRight formMiddleRight466'>
                                    </td>
                                  </tr>
                                </table>
                                <table class='formBottom formBottom466' cellpadding='0' cellspacing='0'>
                                  <tr>
                                    <td class='left left466'>
                                    </td>
                                    <td class='center center466'>
                                    </td>
                                    <td class='right right466'>
                                    </td>
                                  </tr>
                                </table>
                                <div class='clearfloat clearfloat466'>
                                </div>
                              </div>
                            </div>
                            <div id='module467' _indexClass='formIndex14' class='form form467 formIndex14 formStyle9 extformClass '
                            title='' style='' _side='0' _inTab='0' _inMulMCol='0' _inFullmeasure='0'
                            _autoHeight='1' _global='false' _independent='false'>
                              <div class='formWrap formWrap467'>
                                <table class='formTop formTop467' cellpadding='0' cellspacing='0'>
                                  <tr>
                                    <td class='left'>
                                    </td>
                                    <td class='center'>
                                    </td>
                                    <td class='right'>
                                    </td>
                                  </tr>
                                </table>
                                <table class='formBanner formBanner467' cellpadding='0' cellspacing='0'>
                                  <tr>
                                    <td class='left left467'>
                                    </td>
                                    <td class='center center467' valign='top'>
                                      <table cellpadding='0' cellspacing='0' class='formBannerTitle formBannerTitle467'>
                                        <tr>
                                          <td class='titleLeft titleLeft467' valign='top'>
                                          </td>
                                          <td class='titleCenter titleCenter467' valign='top'>
                                            <div class='titleText titleText467'>
                                              <span>
                                                产品筛选
                                              </span>
                                            </div>
                                          </td>
                                          <td class='titleRight titleRight467' valign='top'>
                                          </td>
                                        </tr>
                                      </table>
                                      <div class='formBannerOther formBannerOther467'>
                                        <div class='formBannerBtn formBannerBtn467'>
                                          <span style='_display:inline-block;_position:relative;'>
                                            <a hidefocus='true' href='javascript:;' onclick='Site.closeAd("module467");return false;'
                                            class='g_close'>
                                              <span style='_display:none;'>
                                                &nbsp;
                                              </span>
                                            </a>
                                          </span>
                                        </div>
                                        &nbsp;
                                      </div>
                                    </td>
                                    <td class='right right467'>
                                    </td>
                                  </tr>
                                </table>
                                <table class='formMiddle formMiddle467' style='' cellpadding='0' cellspacing='0'>
                                  <tr>
                                    <td class='formMiddleLeft formMiddleLeft467'>
                                    </td>
                                    <td class='formMiddleCenter formMiddleCenter467' valign='top'>
                                      <div class='formMiddleContent formMiddleContent467  '>
                                        <div class=' g_foldContainer g_vertFold g_foldNOBtn'>
                                          <table class='g_foldContainerTop' cellpadding='0' cellspacing='0'>
                                            <tr>
                                              <td class='g_foldContainerTopLeft'>
                                              </td>
                                              <td class='g_foldContainerTopCenter'>
                                              </td>
                                              <td class='g_foldContainerTopRight'>
                                              </td>
                                            </tr>
                                          </table>
                                          <table class='g_foldContainerContent' cellpadding='0' cellspacing='0'>
                                            <tr>
                                              <td class='g_foldContainerContentLeft'>
                                              </td>
                                              <td class='g_foldContainerContentCenter'>
                                                <table class='g_foldContainerPanel' cellpadding='0' cellspacing='0'>
                                                  <tr>
                                                    <td class='g_foldContainerPanelLeft'>
                                                    </td>
                                                    <td class='g_foldContainerPanelCenter'>
                                                      <table foldId='0' class='g_foldContainerValue fold_J g_item fold_h_J'
                                                      cellpadding='0' cellspacing='0'>
                                                        <tr>
                                                          <td class='productFilterValueLeft contentLineIcon'>
                                                          </td>
                                                          <td class='g_foldContainerValueCenter ' style='*padding:0;'>
                                                            <a hidefocus='true' href='pr.jsp?_pp=0_467_0' title='分类1-推荐'>
                                                              分类1-推荐
                                                            </a>
                                                          </td>
                                                          <td class='g_foldContainerValueRight'>
                                                          </td>
                                                        </tr>
                                                      </table>
                                                    </td>
                                                    <td class='g_foldContainerPanelRight'>
                                                    </td>
                                                  </tr>
                                                </table>
                                                <div class='g_foldSepLine g_foldPLine g_separator'>
                                                </div>
                                                <table class='g_foldContainerPanel' cellpadding='0' cellspacing='0'>
                                                  <tr>
                                                    <td class='g_foldContainerPanelLeft'>
                                                    </td>
                                                    <td class='g_foldContainerPanelCenter'>
                                                      <table foldId='1' class='g_foldContainerValue fold_J g_item fold_h_J'
                                                      cellpadding='0' cellspacing='0'>
                                                        <tr>
                                                          <td class='productFilterValueLeft contentLineIcon'>
                                                          </td>
                                                          <td class='g_foldContainerValueCenter ' style='*padding:0;'>
                                                            <a hidefocus='true' href='pr.jsp?_pp=0_467_1' title='分类-最新'>
                                                              分类-最新
                                                            </a>
                                                          </td>
                                                          <td class='g_foldContainerValueRight'>
                                                          </td>
                                                        </tr>
                                                      </table>
                                                    </td>
                                                    <td class='g_foldContainerPanelRight'>
                                                    </td>
                                                  </tr>
                                                </table>
                                              </td>
                                              <td class='g_foldContainerContentRight'>
                                              </td>
                                            </tr>
                                          </table>
                                          <table class='g_foldContainerBottom' cellpadding='0' cellspacing='0'>
                                            <tr>
                                              <td class='g_foldContainerBottomLeft'>
                                              </td>
                                              <td class='g_foldContainerBottomCenter'>
                                              </td>
                                              <td class='g_foldContainerBottomRight'>
                                              </td>
                                            </tr>
                                          </table>
                                        </div>
                                      </div>
                                    </td>
                                    <td class='formMiddleRight formMiddleRight467'>
                                    </td>
                                  </tr>
                                </table>
                                <table class='formBottom formBottom467' cellpadding='0' cellspacing='0'>
                                  <tr>
                                    <td class='left left467'>
                                    </td>
                                    <td class='center center467'>
                                    </td>
                                    <td class='right right467'>
                                    </td>
                                  </tr>
                                </table>
                                <div class='clearfloat clearfloat467'>
                                </div>
                              </div>
                            </div>
                            <div id='module468' _indexClass='formIndex15' class='form  formIndex15 formStyle45 extformClass '
                            title='' style='' _side='0' _inTab='0' _inMulMCol='0' _inFullmeasure='0'
                            _autoHeight='1' _global='false' _independent='false'>
                              <div class='formWrap formWrap468'>
                                <table class='formTop formTop468' cellpadding='0' cellspacing='0'>
                                  <tr>
                                    <td class='left'>
                                    </td>
                                    <td class='center'>
                                    </td>
                                    <td class='right'>
                                    </td>
                                  </tr>
                                </table>
                                <table class='formBanner formBanner468' cellpadding='0' cellspacing='0'>
                                  <tr>
                                    <td class='left left468'>
                                    </td>
                                    <td class='center center468' valign='top'>
                                      <table cellpadding='0' cellspacing='0' class='formBannerTitle formBannerTitle468'>
                                        <tr>
                                          <td class='titleLeft titleLeft468' valign='top'>
                                          </td>
                                          <td class='titleCenter titleCenter468' valign='top'>
                                            <div class='titleText titleText468'>
                                              <span>
                                                产品搜索
                                              </span>
                                            </div>
                                          </td>
                                          <td class='titleRight titleRight468' valign='top'>
                                          </td>
                                        </tr>
                                      </table>
                                      <div class='formBannerOther formBannerOther468'>
                                        <div class='formBannerBtn formBannerBtn468'>
                                          <span style='_display:inline-block;_position:relative;'>
                                            <a hidefocus='true' href='javascript:;' onclick='Site.closeAd("module468");return false;'
                                            class='g_close'>
                                              <span style='_display:none;'>
                                                &nbsp;
                                              </span>
                                            </a>
                                          </span>
                                        </div>
                                        &nbsp;
                                      </div>
                                    </td>
                                    <td class='right right468'>
                                    </td>
                                  </tr>
                                </table>
                                <table class='formMiddle formMiddle468' style='' cellpadding='0' cellspacing='0'>
                                  <tr>
                                    <td class='formMiddleLeft formMiddleLeft468'>
                                    </td>
                                    <td class='formMiddleCenter formMiddleCenter468' valign='top'>
                                      <div class='formMiddleContent formMiddleContent468  '>
                                        <div class='searchBox searchBoxStyle49'>
                                          <div class='searchBoxContainer' style=''>
                                            <input class='productSearch g_itext' placeholder='' size='10' value=''
                                            />
                                            <a class='g_btn searchBoxBtn' href='javascript:;' onclick='Site.searchProduct(468);return false;'>
                                              <span>
                                                搜索
                                              </span>
                                            </a>
                                          </div>
                                        </div>
                                        <div class='recommandKeyBox'>
                                          <div class='linkKeys'>
                                            <a class='recommandKey' href='javascript:;' onclick='Site.searchProductByKey(468,"阿道夫");return false;'>
                                              <span>
                                                阿道夫
                                              </span>
                                            </a>
                                          </div>
                                          <div class='linkKeys'>
                                            <a class='recommandKey' href='javascript:;' onclick='Site.searchProductByKey(468,"的方式");return false;'>
                                              <span>
                                                的方式
                                              </span>
                                            </a>
                                          </div>
                                          <div class='linkKeys'>
                                            <a class='recommandKey' href='javascript:;' onclick='Site.searchProductByKey(468,"各地方");return false;'>
                                              <span>
                                                各地方
                                              </span>
                                            </a>
                                          </div>
                                        </div>
                                      </div>
                                    </td>
                                    <td class='formMiddleRight formMiddleRight468'>
                                    </td>
                                  </tr>
                                </table>
                                <table class='formBottom formBottom468' cellpadding='0' cellspacing='0'>
                                  <tr>
                                    <td class='left left468'>
                                    </td>
                                    <td class='center center468'>
                                    </td>
                                    <td class='right right468'>
                                    </td>
                                  </tr>
                                </table>
                                <div class='clearfloat clearfloat468'>
                                </div>
                              </div>
                            </div>
                            <div id='module471' _indexClass='formIndex16' class='form  formIndex16 formStyle64 extformClass '
                            title='' style='' _side='0' _inTab='0' _inMulMCol='0' _inFullmeasure='0'
                            _autoHeight='1' _global='false' _independent='false'>
                              <div class='formWrap formWrap471'>
                                <table class='formTop formTop471' cellpadding='0' cellspacing='0'>
                                  <tr>
                                    <td class='left'>
                                    </td>
                                    <td class='center'>
                                    </td>
                                    <td class='right'>
                                    </td>
                                  </tr>
                                </table>
                                <table class='formBanner formBanner471' cellpadding='0' cellspacing='0'>
                                  <tr>
                                    <td class='left left471'>
                                    </td>
                                    <td class='center center471' valign='top'>
                                      <table cellpadding='0' cellspacing='0' class='formBannerTitle formBannerTitle471'>
                                        <tr>
                                          <td class='titleLeft titleLeft471' valign='top'>
                                          </td>
                                          <td class='titleCenter titleCenter471' valign='top'>
                                            <div class='titleText titleText471'>
                                              <span>
                                                网站二维码
                                              </span>
                                            </div>
                                          </td>
                                          <td class='titleRight titleRight471' valign='top'>
                                          </td>
                                        </tr>
                                      </table>
                                      <div class='formBannerOther formBannerOther471'>
                                        <div class='formBannerBtn formBannerBtn471'>
                                          <span style='_display:inline-block;_position:relative;'>
                                            <a hidefocus='true' href='javascript:;' onclick='Site.closeAd("module471");return false;'
                                            class='g_close'>
                                              <span style='_display:none;'>
                                                &nbsp;
                                              </span>
                                            </a>
                                          </span>
                                        </div>
                                        &nbsp;
                                      </div>
                                    </td>
                                    <td class='right right471'>
                                    </td>
                                  </tr>
                                </table>
                                <table class='formMiddle formMiddle471' style='' cellpadding='0' cellspacing='0'>
                                  <tr>
                                    <td class='formMiddleLeft formMiddleLeft471'>
                                    </td>
                                    <td class='formMiddleCenter formMiddleCenter471' valign='top'>
                                      <div class='formMiddleContent formMiddleContent471  '>
                                        <div class='webSiteQRCode'>
                                          <div style='text-align:center'>
                                            <img title='' src='/qrCode.jsp?cmd=mobiQR&_s=100' />
                                          </div>
                                          <div style='text-align:center;padding-bottom:3px;'>
                                            扫描查看手机版网站
                                          </div>
                                        </div>
                                      </div>
                                    </td>
                                    <td class='formMiddleRight formMiddleRight471'>
                                    </td>
                                  </tr>
                                </table>
                                <table class='formBottom formBottom471' cellpadding='0' cellspacing='0'>
                                  <tr>
                                    <td class='left left471'>
                                    </td>
                                    <td class='center center471'>
                                    </td>
                                    <td class='right right471'>
                                    </td>
                                  </tr>
                                </table>
                                <div class='clearfloat clearfloat471'>
                                </div>
                              </div>
                            </div>
                            <div id='module474' _indexClass='formIndex17' class='form form474 formIndex17 formStyle75 extformClass '
                            title='' style='' _side='0' _inTab='0' _inMulMCol='0' _inFullmeasure='0'
                            _autoHeight='1' _global='false' _independent='false'>
                              <div class='formWrap formWrap474'>
                                <table class='formTop formTop474' cellpadding='0' cellspacing='0'>
                                  <tr>
                                    <td class='left'>
                                    </td>
                                    <td class='center'>
                                    </td>
                                    <td class='right'>
                                    </td>
                                  </tr>
                                </table>
                                <table class='formBanner formBanner474' cellpadding='0' cellspacing='0'>
                                  <tr>
                                    <td class='left left474'>
                                    </td>
                                    <td class='center center474' valign='top'>
                                      <table cellpadding='0' cellspacing='0' class='formBannerTitle formBannerTitle474'>
                                        <tr>
                                          <td class='titleLeft titleLeft474' valign='top'>
                                          </td>
                                          <td class='titleCenter titleCenter474' valign='top'>
                                            <div class='titleText titleText474'>
                                              <span>
                                                留言提交
                                              </span>
                                            </div>
                                          </td>
                                          <td class='titleRight titleRight474' valign='top'>
                                          </td>
                                        </tr>
                                      </table>
                                      <div class='formBannerOther formBannerOther474'>
                                        <div class='formBannerBtn formBannerBtn474'>
                                          <span style='_display:inline-block;_position:relative;'>
                                            <a hidefocus='true' href='javascript:;' onclick='Site.closeAd("module474");return false;'
                                            class='g_close'>
                                              <span style='_display:none;'>
                                                &nbsp;
                                              </span>
                                            </a>
                                          </span>
                                        </div>
                                        &nbsp;
                                      </div>
                                    </td>
                                    <td class='right right474'>
                                    </td>
                                  </tr>
                                </table>
                                <table class='formMiddle formMiddle474' style='' cellpadding='0' cellspacing='0'>
                                  <tr>
                                    <td class='formMiddleLeft formMiddleLeft474'>
                                    </td>
                                    <td class='formMiddleCenter formMiddleCenter474' valign='top'>
                                      <div class='formMiddleContent formMiddleContent474  '>
                                        <div id='msgSubmit474' class='msgSubmit msgBoard'>
                                          <div id='msgSAdd' class='msgSAdd'>
                                            <div class='msgAddTitle'>
                                              发表您的留言：
                                            </div>
                                            <div class='msgAddItem msgTitle'>
                                              <div style='height:23px; line-height:23px;width:210px;float:left;margin-bottom:4px;'>
                                                <table cellpadding='0' cellspacing='0'>
                                                  <tr>
                                                    <td width='60px'>
                                                      <div class='msgSubmit_overToPoint'>
                                                        姓名：
                                                      </div>
                                                    </td>
                                                    <td>
                                                      <input class='g_itext msgSubmit_ipt msgSubmit_isMust' id='reqName' name='姓名'
                                                      type='text' size='14' maxlength='50' value=''>
                                                      <font style='color:red;margin-left:5px'>
                                                        *
                                                      </font>
                                                    </td>
                                                  </tr>
                                                </table>
                                              </div>
                                              <div style='height:23px; line-height:23px;width:210px;float:left;margin-bottom:4px;'>
                                                <table cellpadding='0' cellspacing='0'>
                                                  <tr>
                                                    <td width='60px'>
                                                      <div class='msgSubmit_overToPoint'>
                                                        电子邮件：
                                                      </div>
                                                    </td>
                                                    <td>
                                                      <input class='g_itext msgSubmit_ipt' id='reqEmail' name='电子邮件' type='text'
                                                      size='14' maxlength='50'>
                                                    </td>
                                                  </tr>
                                                </table>
                                              </div>
                                              <div style='height:23px; line-height:23px;width:210px;float:left;margin-bottom:4px;'>
                                                <table cellpadding='0' cellspacing='0'>
                                                  <tr>
                                                    <td width='60px'>
                                                      <div class='msgSubmit_overToPoint'>
                                                        联系电话：
                                                      </div>
                                                    </td>
                                                    <td>
                                                      <input class='g_itext msgSubmit_ipt' id='reqPhone' name='联系电话' type='text'
                                                      size='14' maxlength='50'>
                                                    </td>
                                                  </tr>
                                                </table>
                                              </div>
                                              <div style='height:24px; line-height:24px; width:210px;float:left;margin-bottom:4px;'>
                                                <table cellpadding='0' cellspacing='0'>
                                                  <tr>
                                                    <td width='60px'>
                                                      <div class='msgSubmit_overToPoint'>
                                                        验证码：
                                                      </div>
                                                    </td>
                                                    <td>
                                                      <div style='width:180px'>
                                                        <div style='float:left;'>
                                                          <input class='g_itext' id='msgSubmitCaptcha' style='width:40px' type='text'
                                                          maxlength='4' />
                                                        </div>
                                                        <div style='float:left;'>
                                                          <img alt='' onclick='Site.changeMsgSubmitValidateCode(474)' title='看不清，换一张'
                                                          id='msgSubmitCaptchaImg' style='height:24px;width:80px;cursor:pointer'
                                                          src='validateCode.jsp?22&vCodeId=474' />
                                                        </div>
                                                      </div>
                                                    </td>
                                                  </tr>
                                                </table>
                                              </div>
                                            </div>
                                            <div class='msgAddText'>
                                              <div style='margin-bottom:4px;'>
                                                <table width='100%' cellpadding='0' cellspacing='0'>
                                                  <tr>
                                                    <td width='60px'>
                                                      <div class='msgSubmit_overToPoint'>
                                                        内容：
                                                      </div>
                                                    </td>
                                                    <td>
                                                      <div>
                                                        <textarea class='g_textarea' id='reqContent' rows='3' cols='50' style='width:87%;'
                                                        maxlength='1000'>
                                                        </textarea>
                                                      </div>
                                                    </td>
                                                  </tr>
                                                </table>
                                              </div>
                                              <div class='msgAddButton'>
                                                <table width='100%' cellpadding='0' cellspacing='0'>
                                                  <tr>
                                                    <td width='60px'>
                                                      <div class='msgSubmit_overToPoint'>
                                                        &nbsp;
                                                      </div>
                                                    </td>
                                                    <td>
                                                      <div style=''>
                                                        <input class='g_ibutton' extClass='g_ibutton' type='button' onclick='Fai.ing("当前为管理状态，提交无效。")'
                                                        value='提交留言'>
                                                        <span class='g_minor' style='float:left;padding-left:5px;_float:none;'>
                                                          留言需管理员审核后才会在网页中显示
                                                        </span>
                                                      </div>
                                                    </td>
                                                  </tr>
                                                </table>
                                              </div>
                                            </div>
                                          </div>
                                        </div>
                                    </td>
                                    <td class='formMiddleRight formMiddleRight474'>
                                    </td>
                                  </tr>
                                </table>
                                <table class='formBottom formBottom474' cellpadding='0' cellspacing='0'>
                                  <tr>
                                    <td class='left left474'>
                                    </td>
                                    <td class='center center474'>
                                    </td>
                                    <td class='right right474'>
                                    </td>
                                  </tr>
                                </table>
                                <div class='clearfloat clearfloat474'>
                                </div>
                                </div>
                              </div>
                              <div id='module470' _indexClass='formIndex18' class='form  formIndex18 formStyle51 extformClass '
                              title='' style='' _side='0' _inTab='0' _inMulMCol='0' _inFullmeasure='0'
                              _autoHeight='1' _global='false' _independent='false'>
                                <div class='formWrap formWrap470'>
                                  <table class='formTop formTop470' cellpadding='0' cellspacing='0'>
                                    <tr>
                                      <td class='left'>
                                      </td>
                                      <td class='center'>
                                      </td>
                                      <td class='right'>
                                      </td>
                                    </tr>
                                  </table>
                                  <table class='formBanner formBanner470' cellpadding='0' cellspacing='0'>
                                    <tr>
                                      <td class='left left470'>
                                      </td>
                                      <td class='center center470' valign='top'>
                                        <table cellpadding='0' cellspacing='0' class='formBannerTitle formBannerTitle470'>
                                          <tr>
                                            <td class='titleLeft titleLeft470' valign='top'>
                                            </td>
                                            <td class='titleCenter titleCenter470' valign='top'>
                                              <div class='titleText titleText470'>
                                                <span>
                                                  会员登录
                                                </span>
                                              </div>
                                            </td>
                                            <td class='titleRight titleRight470' valign='top'>
                                            </td>
                                          </tr>
                                        </table>
                                        <div class='formBannerOther formBannerOther470'>
                                          <div class='formBannerBtn formBannerBtn470'>
                                            <span style='_display:inline-block;_position:relative;'>
                                              <a hidefocus='true' href='javascript:;' onclick='Site.closeAd("module470");return false;'
                                              class='g_close'>
                                                <span style='_display:none;'>
                                                  &nbsp;
                                                </span>
                                              </a>
                                            </span>
                                          </div>
                                          &nbsp;
                                        </div>
                                      </td>
                                      <td class='right right470'>
                                      </td>
                                    </tr>
                                  </table>
                                  <table class='formMiddle formMiddle470' style='' cellpadding='0' cellspacing='0'>
                                    <tr>
                                      <td class='formMiddleLeft formMiddleLeft470'>
                                      </td>
                                      <td class='formMiddleCenter formMiddleCenter470' valign='top'>
                                        <div class='formMiddleContent formMiddleContent470  '>
                                          <div class='J_memberLoginPanel memberLoginPanel member'>
                                            <div class='memberLoginItemList'>
                                              <div class='J_memberLoginItem memberLoginItem itemSpace'>
                                                <input id='memberAcct' class='generateInput memberAcctInput' type='text'
                                                placeholder='帐号' value='' />
                                              </div>
                                              <div class='J_memberLoginItem memberLoginItem itemSpace'>
                                                <input id='memberPwd' class='generateInput memberPwdInput' type='password'
                                                placeholder='密码' onkeydown='if (Fai.isEnterKey(event)){Fai.ing("您目前处于网站管理状态，请先点击网站右上方的“退出”后再登录会员。");}'
                                                />
                                              </div>
                                              <div class='J_memberLoginItem memberCaptcha memberLoginItem'>
                                                <input class='memberCaptchaInput' type='text' placeholder='验证码' />
                                                <img alt='' id='memberCaptchaImg' class='memberCaptchaImg' onclick='Site.changeCaptchaImg(this)'
                                                title='看不清，换一张' />
                                              </div>
                                              <div class='memberLoginItem memberLoginItem_Button'>
                                                <div class='J_loginButton loginButton loginButton1'>
                                                  <div class='left'>
                                                  </div>
                                                  <div class='middle'>
                                                    登录
                                                  </div>
                                                  <div class='right'>
                                                  </div>
                                                </div>
                                              </div>
                                            </div>
                                            <div class='signup'>
                                              <a class='regAcct' hidefocus='true' href='javascript:Site.memberSignup();'>
                                                免费注册>
                                              </a>
                                            </div>
                                          </div>
                                          <div class='memberMsg'>
                                          </div>
                                        </div>
                                      </td>
                                      <td class='formMiddleRight formMiddleRight470'>
                                      </td>
                                    </tr>
                                  </table>
                                  <table class='formBottom formBottom470' cellpadding='0' cellspacing='0'>
                                    <tr>
                                      <td class='left left470'>
                                      </td>
                                      <td class='center center470'>
                                      </td>
                                      <td class='right right470'>
                                      </td>
                                    </tr>
                                  </table>
                                  <div class='clearfloat clearfloat470'>
                                  </div>
                                </div>
                              </div>
                              <div id='module475' _indexClass='formIndex19' class='form form475 formIndex19 formStyle23 extformClass '
                              title='' style='' _side='0' _inTab='0' _inMulMCol='0' _inFullmeasure='0'
                              _autoHeight='1' _global='false' _independent='false'>
                                <div class='formWrap formWrap475'>
                                  <table class='formTop formTop475' cellpadding='0' cellspacing='0'>
                                    <tr>
                                      <td class='left'>
                                      </td>
                                      <td class='center'>
                                      </td>
                                      <td class='right'>
                                      </td>
                                    </tr>
                                  </table>
                                  <table class='formBanner formBanner475' cellpadding='0' cellspacing='0'>
                                    <tr>
                                      <td class='left left475'>
                                      </td>
                                      <td class='center center475' valign='top'>
                                        <table cellpadding='0' cellspacing='0' class='formBannerTitle formBannerTitle475'>
                                          <tr>
                                            <td class='titleLeft titleLeft475' valign='top'>
                                            </td>
                                            <td class='titleCenter titleCenter475' valign='top'>
                                              <div class='titleText titleText475'>
                                                <span>
                                                  在线投票
                                                </span>
                                              </div>
                                            </td>
                                            <td class='titleRight titleRight475' valign='top'>
                                            </td>
                                          </tr>
                                        </table>
                                        <div class='formBannerOther formBannerOther475'>
                                          <div class='formBannerBtn formBannerBtn475'>
                                            <span style='_display:inline-block;_position:relative;'>
                                              <a hidefocus='true' href='javascript:;' onclick='Site.closeAd("module475");return false;'
                                              class='g_close'>
                                                <span style='_display:none;'>
                                                  &nbsp;
                                                </span>
                                              </a>
                                            </span>
                                          </div>
                                          &nbsp;
                                        </div>
                                      </td>
                                      <td class='right right475'>
                                      </td>
                                    </tr>
                                  </table>
                                  <table class='formMiddle formMiddle475' style='' cellpadding='0' cellspacing='0'>
                                    <tr>
                                      <td class='formMiddleLeft formMiddleLeft475'>
                                      </td>
                                      <td class='formMiddleCenter formMiddleCenter475' valign='top'>
                                        <div class='formMiddleContent formMiddleContent475  '>
                                          <div style='padding:0 4%;' class='vote'>
                                            <div class='voteSubject'>
                                              你喜欢吃什么
                                            </div>
                                            <table id='voteItems1475' class='voteItems voteItems1475' cellpadding='0'
                                            cellspacing='0'>
                                              <tr class='voteItem'>
                                                <td class='voteItemCheck' style='padding:20px 0 10px 5px;text-align:left;width:100%;'>
                                                  <div class='voteItemPanel'>
                                                    <div style='float: left; margin-right: 30px; line-height:20px; *margin-right: 20px;'
                                                    class='voteItemName'>
                                                      <input style='float:left;line-height:22px;height:22px;margin-right:16px;'
                                                      id='voteItem100475' type='radio' name='cltVoteRadio0' value='0' />
                                                      <span class='voteItemSpan' onclick="$('#voteItem100475').click(); return false;">
                                                        苹果
                                                      </span>
                                                    </div>
                                                  </div>
                                                  <div class='voteItemPanel'>
                                                    <div style='float: left; margin-right: 30px; line-height:20px; *margin-right: 20px;'
                                                    class='voteItemName'>
                                                      <input style='float:left;line-height:22px;height:22px;margin-right:16px;'
                                                      id='voteItem110475' type='radio' name='cltVoteRadio0' value='1' />
                                                      <span class='voteItemSpan' onclick="$('#voteItem110475').click(); return false;">
                                                        橘子
                                                      </span>
                                                    </div>
                                                  </div>
                                                </td>
                                              </tr>
                                            </table>
                                            <div id='voteMsg1475' class='g_tip voteMsg1475' style='display:none;padding: 6px;text-align: center;'>
                                            </div>
                                            <div style='text-align:center;height:44px;' class='voteOperate'>
                                              <div id='vote1475' class='s_ibutton s_ibutton1'>
                                                <div class='left'>
                                                </div>
                                                <div style='min-width:80px;' class='middle'>
                                                  投票
                                                </div>
                                                <div class='right'>
                                                </div>
                                              </div>
                                              <div class='t_ibutton' onclick="window.open('vr.jsp?mid=475&id=1&btn=1')">
                                                查看结果
                                              </div>
                                            </div>
                                          </div>
                                        </div>
                                      </td>
                                      <td class='formMiddleRight formMiddleRight475'>
                                      </td>
                                    </tr>
                                  </table>
                                  <table class='formBottom formBottom475' cellpadding='0' cellspacing='0'>
                                    <tr>
                                      <td class='left left475'>
                                      </td>
                                      <td class='center center475'>
                                      </td>
                                      <td class='right right475'>
                                      </td>
                                    </tr>
                                  </table>
                                  <div class='clearfloat clearfloat475'>
                                  </div>
                                </div>
                              </div>
                              <div id='module469' _indexClass='formIndex20' class='form form469 formIndex20 formStyle40 extformClass '
                              title='' style='' _side='0' _inTab='0' _inMulMCol='0' _inFullmeasure='0'
                              _autoHeight='1' _global='false' _independent='false'>
                                <div class='formWrap formWrap469'>
                                  <table class='formTop formTop469' cellpadding='0' cellspacing='0'>
                                    <tr>
                                      <td class='left'>
                                      </td>
                                      <td class='center'>
                                      </td>
                                      <td class='right'>
                                      </td>
                                    </tr>
                                  </table>
                                  <table class='formBanner formBanner469' cellpadding='0' cellspacing='0'>
                                    <tr>
                                      <td class='left left469'>
                                      </td>
                                      <td class='center center469' valign='top'>
                                        <table cellpadding='0' cellspacing='0' class='formBannerTitle formBannerTitle469'>
                                          <tr>
                                            <td class='titleLeft titleLeft469' valign='top'>
                                            </td>
                                            <td class='titleCenter titleCenter469' valign='top'>
                                              <div class='titleText titleText469'>
                                                <span>
                                                  在线客服
                                                </span>
                                              </div>
                                            </td>
                                            <td class='titleRight titleRight469' valign='top'>
                                            </td>
                                          </tr>
                                        </table>
                                        <div class='formBannerOther formBannerOther469'>
                                          <div class='formBannerBtn formBannerBtn469'>
                                            <span style='_display:inline-block;_position:relative;'>
                                              <a hidefocus='true' href='javascript:;' onclick='Site.closeAd("module469");return false;'
                                              class='g_close'>
                                                <span style='_display:none;'>
                                                  &nbsp;
                                                </span>
                                              </a>
                                            </span>
                                          </div>
                                          &nbsp;
                                        </div>
                                      </td>
                                      <td class='right right469'>
                                      </td>
                                    </tr>
                                  </table>
                                  <table class='formMiddle formMiddle469' style='' cellpadding='0' cellspacing='0'>
                                    <tr>
                                      <td class='formMiddleLeft formMiddleLeft469'>
                                      </td>
                                      <td class='formMiddleCenter formMiddleCenter469' valign='top'>
                                        <div class='formMiddleContent formMiddleContent469  '>
                                          <div id='serOnline-container469' class='serOnline-container'>
                                            <div class='serOnline-service'>
                                              <div class='serOnline-list-v lineH-21  '>
                                                <a hidefocus='true' href='http://wpa.qq.com/msgrd?v=3&uin=100000&site=qq&menu=yes'
                                                target='_blank'>
                                                  <span class='serOnline-img0 qqImg0'>
                                                    &nbsp;
                                                  </span>
                                                  客服一
                                                </a>
                                              </div>
                                              <div class='serOnline-list-v lineH-21  '>
                                                <a hidefocus='true' href='http://www.taobao.com/webww/ww.php?ver=3&touid=100000&siteid=cntaobao&status=2&charset=utf-8'
                                                target='_blank'>
                                                  <span class='serOnline-img ' style='background:url(http://amos.alicdn.com/online.aw?v=2&uid=100000&site=cntaobao&s=2&charset=utf-8) center center no-repeat;'>
                                                    &nbsp;
                                                  </span>
                                                  客服一
                                                </a>
                                              </div>
                                              <div class='serOnline-list-v lineH-21  '>
                                                <a hidefocus='true' href='http://amos.alicdn.com/msg.aw?v=2&uid=100000&site=cnalichn&s=11&charset=UTF-8'
                                                target='_blank'>
                                                  <span class='serOnline-img ' style='background:url(http://amos.alicdn.com/online.aw?v=2&uid=100000&site=cnalichn&s=11&charset=UTF-8) center center no-repeat;'>
                                                    &nbsp;
                                                  </span>
                                                  客服一
                                                </a>
                                              </div>
                                              <div class='serOnline-list-v lineH-21 lastData '>
                                                <a hidefocus='true' href='skype:100000?call' skynumber='100000' skyname='客服一'>
                                                  <span class='serOnline-img skypeImg'>
                                                    &nbsp;
                                                  </span>
                                                  客服一
                                                </a>
                                              </div>
                                            </div>
                                            <div class='serOnline-separation-line g_separator'>
                                            </div>
                                            <div class='serOnline-worktime'>
                                              <div class='marBL-10'>
                                                <span class='worktime-header-img'>
                                                  &nbsp;
                                                </span>
                                                <span style='font-size:15px;'>
                                                  <b>
                                                    工作时间
                                                  </b>
                                                </span>
                                              </div>
                                              <div class='serOnline-list-v '>
                                                <span>
                                                  周一至周五 ：8:30-17:30
                                                </span>
                                              </div>
                                              <div class='serOnline-list-v lastData'>
                                                <span>
                                                  周六至周日 ：9:00-17:00
                                                </span>
                                              </div>
                                            </div>
                                            <div class='serOnline-separation-line g_separator'>
                                            </div>
                                            <div class='serOnline-contact'>
                                              <div class='marBL-10'>
                                                <span class='contact-header-img'>
                                                  &nbsp;
                                                </span>
                                                <span style='font-size:15px;'>
                                                  <b>
                                                    联系方式
                                                  </b>
                                                </span>
                                              </div>
                                              <div class='serOnline-list-v'>
                                                <span>
                                                  陈经理：13000000000
                                                </span>
                                              </div>
                                              <div class='serOnline-list-v'>
                                                <span>
                                                  邮箱：abc@qq.com
                                                </span>
                                              </div>
                                            </div>
                                          </div>
                                        </div>
                                      </td>
                                      <td class='formMiddleRight formMiddleRight469'>
                                      </td>
                                    </tr>
                                  </table>
                                  <table class='formBottom formBottom469' cellpadding='0' cellspacing='0'>
                                    <tr>
                                      <td class='left left469'>
                                      </td>
                                      <td class='center center469'>
                                      </td>
                                      <td class='right right469'>
                                      </td>
                                    </tr>
                                  </table>
                                  <div class='clearfloat clearfloat469'>
                                  </div>
                                </div>
                              </div>
                              <div id='module476' _indexClass='formIndex21' class='form form476 formIndex21 formStyle83 extformClass '
                              title='' style='' _side='0' _inTab='0' _inMulMCol='0' _inFullmeasure='0'
                              _autoHeight='0' _global='false' _independent='false'>
                                <div class='formWrap formWrap476'>
                                  <table class='formTop formTop476' cellpadding='0' cellspacing='0'>
                                    <tr>
                                      <td class='left'>
                                      </td>
                                      <td class='center'>
                                      </td>
                                      <td class='right'>
                                      </td>
                                    </tr>
                                  </table>
                                  <table class='formBanner formBanner476' cellpadding='0' cellspacing='0'>
                                    <tr>
                                      <td class='left left476'>
                                      </td>
                                      <td class='center center476' valign='top'>
                                        <table cellpadding='0' cellspacing='0' class='formBannerTitle formBannerTitle476'>
                                          <tr>
                                            <td class='titleLeft titleLeft476' valign='top'>
                                            </td>
                                            <td class='titleCenter titleCenter476' valign='top'>
                                              <div class='titleText titleText476'>
                                                <span>
                                                  魔方图册
                                                </span>
                                              </div>
                                            </td>
                                            <td class='titleRight titleRight476' valign='top'>
                                            </td>
                                          </tr>
                                        </table>
                                        <div class='formBannerOther formBannerOther476'>
                                          <div class='formBannerBtn formBannerBtn476'>
                                            <span style='_display:inline-block;_position:relative;'>
                                              <a hidefocus='true' href='javascript:;' onclick='Site.closeAd("module476");return false;'
                                              class='g_close'>
                                                <span style='_display:none;'>
                                                  &nbsp;
                                                </span>
                                              </a>
                                            </span>
                                          </div>
                                          &nbsp;
                                        </div>
                                      </td>
                                      <td class='right right476'>
                                      </td>
                                    </tr>
                                  </table>
                                  <table class='formMiddle formMiddle476' style='height:581px; ' cellpadding='0'
                                  cellspacing='0'>
                                    <tr>
                                      <td class='formMiddleLeft formMiddleLeft476'>
                                      </td>
                                      <td class='formMiddleCenter formMiddleCenter476' valign='top'>
                                        <div class='formMiddleContent formMiddleContent476  '>
                                          <div id='photoCardOuter476' class='photoCardOuter'>
                                            <div id='photoCardInner476' class='photoCardInner photoCardInner476 cardStyle0'
                                            cardStyle='0'>
                                              <table class='photoCardTable' cellspacing='15'>
                                                <tbody>
                                                  <tr class='cardTr0'>
                                                    <td class='cardTd cardTd0' rowspan='2' photoName='创意' photoDisc='包装设计<br/>VI识别设计'>
                                                      <div photoName='创意' photoId='1' class='photoCard photoCard0'>
                                                        <div id='photoCardABUIABAEGAAgx_e7rgUoiNrI7AEwkwE4qAE' class='photoCardEdit'
                                                        style='width:100%;height:100%;position:absolute;'>
                                                          <div class='cardDiv cardDivEffect' tmpPic='ABUIABAEGAAgx_e7rgUoiNrI7AEwkwE4qAE'
                                                          moduleId='476'>
                                                            <a hidefocus='true' href="pod.jsp?id=1&_php=2_476_1" target='_blank'>
                                                              <img class='cardImg cardImgView cardImgViewHide' src='./image/demo/ABUIABAEGAAgx_e7rgUoiNrI7AEwkwE4qAE.png'
                                                              alt='创意' />
                                                            </a>
                                                          </div>
                                                        </div>
                                                      </div>
                                                    </td>
                                                    <td class='cardTd cardTd1' colspan='2' photoName='形象' photoDisc='专业设计<br/>企业形象打造'>
                                                      <div photoName='形象' photoId='2' class='photoCard photoCard1'>
                                                        <div id='photoCardABUIABAEGAAgx_e7rgUoqd-kpQcwkwE4qAE' class='photoCardEdit'
                                                        style='width:100%;height:100%;position:absolute;'>
                                                          <div class='cardDiv cardDivEffect' tmpPic='ABUIABAEGAAgx_e7rgUoqd-kpQcwkwE4qAE'
                                                          moduleId='476'>
                                                            <a hidefocus='true' href="pod.jsp?id=2&_php=2_476_1" target='_blank'>
                                                              <img class='cardImg cardImgView cardImgViewHide' src='./image/demo/ABUIABAEGAAgx_e7rgUoqd-kpQcwkwE4qAE.png'
                                                              alt='形象' />
                                                            </a>
                                                          </div>
                                                        </div>
                                                      </div>
                                                    </td>
                                                  </tr>
                                                  <tr class='cardTr1'>
                                                    <td class='cardTd cardTd2' photoName='案例' photoDisc='品牌创意设计<br/>品牌诊断评估'>
                                                      <div photoName='案例' photoId='3' class='photoCard photoCard2'>
                                                        <div id='photoCardABUIABAEGAAgxue7rgUo3vDhvwEwkwE4qAE' class='photoCardEdit'
                                                        style='width:100%;height:100%;position:absolute;'>
                                                          <div class='cardDiv cardDivEffect' tmpPic='ABUIABAEGAAgxue7rgUo3vDhvwEwkwE4qAE'
                                                          moduleId='476'>
                                                            <a hidefocus='true' href="pod.jsp?id=3&_php=2_476_1" target='_blank'>
                                                              <img class='cardImg cardImgView cardImgViewHide' src='./image/demo/ABUIABAEGAAgxue7rgUo3vDhvwEwkwE4qAE.png'
                                                              alt='案例' />
                                                            </a>
                                                          </div>
                                                        </div>
                                                      </div>
                                                    </td>
                                                    <td class='cardTd cardTd3' photoName='推广' photoDisc='媒体营销<br/>搜索引擎营销'>
                                                      <div photoName='推广' photoId='4' class='photoCard photoCard3'>
                                                        <div id='photoCardABUIABAEGAAgxee7rgUo5N_YLDCTATioAQ' class='photoCardEdit'
                                                        style='width:100%;height:100%;position:absolute;'>
                                                          <div class='cardDiv cardDivEffect' tmpPic='ABUIABAEGAAgxee7rgUo5N_YLDCTATioAQ'
                                                          moduleId='476'>
                                                            <a hidefocus='true' href="pod.jsp?id=4&_php=2_476_1" target='_blank'>
                                                              <img class='cardImg cardImgView cardImgViewHide' src='./image/demo/ABUIABAEGAAgxee7rgUo5N_YLDCTATioAQ.png'
                                                              alt='推广' />
                                                            </a>
                                                          </div>
                                                        </div>
                                                      </div>
                                                    </td>
                                                  </tr>
                                                </tbody>
                                              </table>
                                            </div>
                                          </div>
                                        </div>
                                      </td>
                                      <td class='formMiddleRight formMiddleRight476'>
                                      </td>
                                    </tr>
                                  </table>
                                  <table class='formBottom formBottom476' cellpadding='0' cellspacing='0'>
                                    <tr>
                                      <td class='left left476'>
                                      </td>
                                      <td class='center center476'>
                                      </td>
                                      <td class='right right476'>
                                      </td>
                                    </tr>
                                  </table>
                                  <div class='clearfloat clearfloat476'>
                                  </div>
                                </div>
                              </div>
                              <div id='module477' _indexClass='formIndex22' class='form form477 formIndex22 formStyle33 extformClass '
                              title='' style='' _side='0' _inTab='0' _inMulMCol='0' _inFullmeasure='0'
                              _autoHeight='1' _global='false' _independent='false'>
                                <div class='formWrap formWrap477'>
                                  <table class='formTop formTop477' cellpadding='0' cellspacing='0'>
                                    <tr>
                                      <td class='left'>
                                      </td>
                                      <td class='center'>
                                      </td>
                                      <td class='right'>
                                      </td>
                                    </tr>
                                  </table>
                                  <table class='formBanner formBanner477' cellpadding='0' cellspacing='0'>
                                    <tr>
                                      <td class='left left477'>
                                      </td>
                                      <td class='center center477' valign='top'>
                                        <table cellpadding='0' cellspacing='0' class='formBannerTitle formBannerTitle477'>
                                          <tr>
                                            <td class='titleLeft titleLeft477' valign='top'>
                                            </td>
                                            <td class='titleCenter titleCenter477' valign='top'>
                                              <div class='titleText titleText477'>
                                                <span>
                                                  图文链接
                                                </span>
                                              </div>
                                            </td>
                                            <td class='titleRight titleRight477' valign='top'>
                                            </td>
                                          </tr>
                                        </table>
                                        <div class='formBannerOther formBannerOther477'>
                                          <div class='formBannerBtn formBannerBtn477'>
                                            <span style='_display:inline-block;_position:relative;'>
                                              <a hidefocus='true' href='javascript:;' onclick='Site.closeAd("module477");return false;'
                                              class='g_close'>
                                                <span style='_display:none;'>
                                                  &nbsp;
                                                </span>
                                              </a>
                                            </span>
                                          </div>
                                          &nbsp;
                                        </div>
                                      </td>
                                      <td class='right right477'>
                                      </td>
                                    </tr>
                                  </table>
                                  <table class='formMiddle formMiddle477' style='' cellpadding='0' cellspacing='0'>
                                    <tr>
                                      <td class='formMiddleLeft formMiddleLeft477'>
                                      </td>
                                      <td class='formMiddleCenter formMiddleCenter477' valign='top'>
                                        <div class='formMiddleContent formMiddleContent477  '>
                                          <div class='link-v-container'>
                                            <a hidefocus='true' class='link-h' href='http://www.baidu.com' target='_blank'>
                                              百度
                                            </a>
                                          </div>
                                        </div>
                                      </td>
                                      <td class='formMiddleRight formMiddleRight477'>
                                      </td>
                                    </tr>
                                  </table>
                                  <table class='formBottom formBottom477' cellpadding='0' cellspacing='0'>
                                    <tr>
                                      <td class='left left477'>
                                      </td>
                                      <td class='center center477'>
                                      </td>
                                      <td class='right right477'>
                                      </td>
                                    </tr>
                                  </table>
                                  <div class='clearfloat clearfloat477'>
                                  </div>
                                </div>
                              </div>
                              <div id='module478' _indexClass='formIndex23' class='form form478 formIndex23 formStyle24 extformClass '
                              title='' style='' _side='0' _inTab='0' _inMulMCol='0' _inFullmeasure='0'
                              _autoHeight='1' _global='false' _independent='false'>
                                <div class='formWrap formWrap478'>
                                  <table class='formTop formTop478' cellpadding='0' cellspacing='0'>
                                    <tr>
                                      <td class='left'>
                                      </td>
                                      <td class='center'>
                                      </td>
                                      <td class='right'>
                                      </td>
                                    </tr>
                                  </table>
                                  <table class='formBanner formBanner478' cellpadding='0' cellspacing='0'>
                                    <tr>
                                      <td class='left left478'>
                                      </td>
                                      <td class='center center478' valign='top'>
                                        <table cellpadding='0' cellspacing='0' class='formBannerTitle formBannerTitle478'>
                                          <tr>
                                            <td class='titleLeft titleLeft478' valign='top'>
                                            </td>
                                            <td class='titleCenter titleCenter478' valign='top'>
                                              <div class='titleText titleText478'>
                                                <span>
                                                  文章分类
                                                </span>
                                              </div>
                                            </td>
                                            <td class='titleRight titleRight478' valign='top'>
                                            </td>
                                          </tr>
                                        </table>
                                        <div class='formBannerOther formBannerOther478'>
                                          <div class='formBannerBtn formBannerBtn478'>
                                            <span style='_display:inline-block;_position:relative;'>
                                              <a hidefocus='true' href='javascript:;' onclick='Site.closeAd("module478");return false;'
                                              class='g_close'>
                                                <span style='_display:none;'>
                                                  &nbsp;
                                                </span>
                                              </a>
                                            </span>
                                          </div>
                                          &nbsp;
                                        </div>
                                      </td>
                                      <td class='right right478'>
                                      </td>
                                    </tr>
                                  </table>
                                  <table class='formMiddle formMiddle478' style='' cellpadding='0' cellspacing='0'>
                                    <tr>
                                      <td class='formMiddleLeft formMiddleLeft478'>
                                      </td>
                                      <td class='formMiddleCenter formMiddleCenter478' valign='top'>
                                        <div class='formMiddleContent formMiddleContent478  '>
                                          <div class='s_ns_group g_foldContainer g_vertFold g_foldNOBtn'>
                                            <table class='g_foldContainerTop' cellpadding='0' cellspacing='0'>
                                              <tr>
                                                <td class='g_foldContainerTopLeft'>
                                                </td>
                                                <td class='g_foldContainerTopCenter'>
                                                </td>
                                                <td class='g_foldContainerTopRight'>
                                                </td>
                                              </tr>
                                            </table>
                                            <table class='g_foldContainerContent' cellpadding='0' cellspacing='0'>
                                              <tr>
                                                <td class='g_foldContainerContentLeft'>
                                                </td>
                                                <td class='g_foldContainerContentCenter'>
                                                  <table class='g_foldContainerPanel' cellpadding='0' cellspacing='0'>
                                                    <tr>
                                                      <td class='g_foldContainerPanelLeft'>
                                                      </td>
                                                      <td class='g_foldContainerPanelCenter'>
                                                        <table foldId='1' class='g_foldContainerValue fold_J g_item fold_h_J'
                                                        cellpadding='0' cellspacing='0'>
                                                          <tr>
                                                            <td class='productFilterValueLeft contentLineIcon'>
                                                            </td>
                                                            <td class='g_foldContainerValueCenter ' style='*padding:0;'>
                                                              <a hidefocus='true' href='nr.jsp?_np=0_478_1' title='行业动态'>
                                                                行业动态
                                                              </a>
                                                            </td>
                                                            <td class='g_foldContainerValueRight'>
                                                            </td>
                                                          </tr>
                                                        </table>
                                                      </td>
                                                      <td class='g_foldContainerPanelRight'>
                                                      </td>
                                                    </tr>
                                                  </table>
                                                  <div class='g_foldSepLine g_foldPLine g_separator'>
                                                  </div>
                                                  <table class='g_foldContainerPanel' cellpadding='0' cellspacing='0'>
                                                    <tr>
                                                      <td class='g_foldContainerPanelLeft'>
                                                      </td>
                                                      <td class='g_foldContainerPanelCenter'>
                                                        <table foldId='2' class='g_foldContainerValue fold_J g_item fold_h_J'
                                                        cellpadding='0' cellspacing='0'>
                                                          <tr>
                                                            <td class='productFilterValueLeft contentLineIcon'>
                                                            </td>
                                                            <td class='g_foldContainerValueCenter ' style='*padding:0;'>
                                                              <a hidefocus='true' href='nr.jsp?_np=0_478_2' title='品牌营销'>
                                                                品牌营销
                                                              </a>
                                                            </td>
                                                            <td class='g_foldContainerValueRight'>
                                                            </td>
                                                          </tr>
                                                        </table>
                                                      </td>
                                                      <td class='g_foldContainerPanelRight'>
                                                      </td>
                                                    </tr>
                                                  </table>
                                                </td>
                                                <td class='g_foldContainerContentRight'>
                                                </td>
                                              </tr>
                                            </table>
                                            <table class='g_foldContainerBottom' cellpadding='0' cellspacing='0'>
                                              <tr>
                                                <td class='g_foldContainerBottomLeft'>
                                                </td>
                                                <td class='g_foldContainerBottomCenter'>
                                                </td>
                                                <td class='g_foldContainerBottomRight'>
                                                </td>
                                              </tr>
                                            </table>
                                          </div>
                                        </div>
                                      </td>
                                      <td class='formMiddleRight formMiddleRight478'>
                                      </td>
                                    </tr>
                                  </table>
                                  <table class='formBottom formBottom478' cellpadding='0' cellspacing='0'>
                                    <tr>
                                      <td class='left left478'>
                                      </td>
                                      <td class='center center478'>
                                      </td>
                                      <td class='right right478'>
                                      </td>
                                    </tr>
                                  </table>
                                  <div class='clearfloat clearfloat478'>
                                  </div>
                                </div>
                              </div>
                              <div id='module480' _indexClass='formIndex24' class='form form480 formIndex24 formStyle10 extformClass '
                              title='' style='' _side='0' _inTab='0' _inMulMCol='0' _inFullmeasure='0'
                              _autoHeight='1' _global='false' _independent='false'>
                                <div class='formWrap formWrap480'>
                                  <table class='formTop formTop480' cellpadding='0' cellspacing='0'>
                                    <tr>
                                      <td class='left'>
                                      </td>
                                      <td class='center'>
                                      </td>
                                      <td class='right'>
                                      </td>
                                    </tr>
                                  </table>
                                  <table class='formBanner formBanner480' cellpadding='0' cellspacing='0'>
                                    <tr>
                                      <td class='left left480'>
                                      </td>
                                      <td class='center center480' valign='top'>
                                        <table cellpadding='0' cellspacing='0' class='formBannerTitle formBannerTitle480'>
                                          <tr>
                                            <td class='titleLeft titleLeft480' valign='top'>
                                            </td>
                                            <td class='titleCenter titleCenter480' valign='top'>
                                              <div class='titleText titleText480'>
                                                <span>
                                                  文件下载
                                                </span>
                                              </div>
                                            </td>
                                            <td class='titleRight titleRight480' valign='top'>
                                            </td>
                                          </tr>
                                        </table>
                                        <div class='formBannerOther formBannerOther480'>
                                          <div class='formBannerBtn formBannerBtn480'>
                                            <span style='_display:inline-block;_position:relative;'>
                                              <a hidefocus='true' href='javascript:;' onclick='Site.closeAd("module480");return false;'
                                              class='g_close'>
                                                <span style='_display:none;'>
                                                  &nbsp;
                                                </span>
                                              </a>
                                            </span>
                                          </div>
                                          &nbsp;
                                        </div>
                                      </td>
                                      <td class='right right480'>
                                      </td>
                                    </tr>
                                  </table>
                                  <table class='formMiddle formMiddle480' style='' cellpadding='0' cellspacing='0'>
                                    <tr>
                                      <td class='formMiddleLeft formMiddleLeft480'>
                                      </td>
                                      <td class='formMiddleCenter formMiddleCenter480' valign='top'>
                                        <div class='formMiddleContent formMiddleContent480  '>
                                          <div class='fileList'>
                                            <div class='line g_item'>
                                              <table class='mainBodyContainer' cellpadding='0' cellspacing='0'>
                                                <tr>
                                                  <td class='fileName'>
                                                    <div class='fileNameText' title='20150815'>
                                                      20150815
                                                    </div>
                                                  </td>
                                                  <td class='fileSize'>
                                                    24.64KB
                                                  </td>
                                                  <td class='fileOperate' align='center'>
                                                    <a id='m480i0' class='fileDownload480' hidefocus='true' rel='nofollow'
                                                    target='_blank' href='./image/demo/ABUIABAEGAAgw4a8rgUo8ICi5QQwhwE4Wg?f=20150815&v=1452747886'>
                                                      下载
                                                    </a>
                                                  </td>
                                                </tr>
                                              </table>
                                            </div>
                                            <div class='separatorLine g_separator'>
                                            </div>
                                            <div class='line g_item'>
                                              <table class='mainBodyContainer' cellpadding='0' cellspacing='0'>
                                                <tr>
                                                  <td class='fileName'>
                                                    <div class='fileNameText' title='2 (1).png'>
                                                      2 (1).png
                                                    </div>
                                                  </td>
                                                  <td class='fileSize'>
                                                    1.94KB
                                                  </td>
                                                  <td class='fileOperate' align='center'>
                                                    <a id='m480i1' class='fileDownload480' hidefocus='true' rel='nofollow'
                                                    target='_blank' href='./image/demo/ABUIABAEGAAglILGrgUowKmTsgUwngE4tgE?f=2+%281%29.png&v=1452747886'>
                                                      下载
                                                    </a>
                                                  </td>
                                                </tr>
                                              </table>
                                            </div>
                                            <div class='separatorLine g_separator'>
                                            </div>
                                            <div class='line g_item'>
                                              <table class='mainBodyContainer' cellpadding='0' cellspacing='0'>
                                                <tr>
                                                  <td class='fileName'>
                                                    <div class='fileNameText' title='包装1.jpg'>
                                                      包装1.jpg
                                                    </div>
                                                  </td>
                                                  <td class='fileSize'>
                                                    20.65KB
                                                  </td>
                                                  <td class='fileOperate' align='center'>
                                                    <a id='m480i2' class='fileDownload480' hidefocus='true' rel='nofollow'
                                                    target='_blank' href='./image/demo/ABUIABACGAAgsJDGrgUortHg0gIw6wE4ngE?f=%E5%8C%85%E8%A3%851.jpg&v=1452747886'>
                                                      下载
                                                    </a>
                                                  </td>
                                                </tr>
                                              </table>
                                            </div>
                                            <div class='separatorLine g_separator'>
                                            </div>
                                            <div class='clearfloat'>
                                            </div>
                                            <div id='pagenation480' class='pagenation'>
                                              <div class='pagePrev'>
                                                <span>
                                                  上一页
                                                </span>
                                              </div>
                                              <div class='pageNo'>
                                                <span>
                                                  1
                                                </span>
                                              </div>
                                              <div class='pageNext'>
                                                <span>
                                                  下一页
                                                </span>
                                              </div>
                                            </div>
                                          </div>
                                        </div>
                                      </td>
                                      <td class='formMiddleRight formMiddleRight480'>
                                      </td>
                                    </tr>
                                  </table>
                                  <table class='formBottom formBottom480' cellpadding='0' cellspacing='0'>
                                    <tr>
                                      <td class='left left480'>
                                      </td>
                                      <td class='center center480'>
                                      </td>
                                      <td class='right right480'>
                                      </td>
                                    </tr>
                                  </table>
                                  <div class='clearfloat clearfloat480'>
                                  </div>
                                </div>
                              </div>
                              <div id='module481' _indexClass='formIndex25' class='form form481 formIndex25 formStyle36 extformClass '
                              title='' style='' _side='0' _inTab='0' _inMulMCol='0' _inFullmeasure='0'
                              _autoHeight='1' _global='false' _independent='false'>
                                <div class='formWrap formWrap481'>
                                  <table class='formTop formTop481' cellpadding='0' cellspacing='0'>
                                    <tr>
                                      <td class='left'>
                                      </td>
                                      <td class='center'>
                                      </td>
                                      <td class='right'>
                                      </td>
                                    </tr>
                                  </table>
                                  <table class='formBanner formBanner481' cellpadding='0' cellspacing='0'>
                                    <tr>
                                      <td class='left left481'>
                                      </td>
                                      <td class='center center481' valign='top'>
                                        <table cellpadding='0' cellspacing='0' class='formBannerTitle formBannerTitle481'>
                                          <tr>
                                            <td class='titleLeft titleLeft481' valign='top'>
                                            </td>
                                            <td class='titleCenter titleCenter481' valign='top'>
                                              <div class='titleText titleText481'>
                                                <span>
                                                  在线视频
                                                </span>
                                              </div>
                                            </td>
                                            <td class='titleRight titleRight481' valign='top'>
                                            </td>
                                          </tr>
                                        </table>
                                        <div class='formBannerOther formBannerOther481'>
                                          <div class='formBannerBtn formBannerBtn481'>
                                            <span style='_display:inline-block;_position:relative;'>
                                              <a hidefocus='true' href='javascript:;' onclick='Site.closeAd("module481");return false;'
                                              class='g_close'>
                                                <span style='_display:none;'>
                                                  &nbsp;
                                                </span>
                                              </a>
                                            </span>
                                          </div>
                                          &nbsp;
                                        </div>
                                      </td>
                                      <td class='right right481'>
                                      </td>
                                    </tr>
                                  </table>
                                  <table class='formMiddle formMiddle481' style='' cellpadding='0' cellspacing='0'>
                                    <tr>
                                      <td class='formMiddleLeft formMiddleLeft481'>
                                      </td>
                                      <td class='formMiddleCenter formMiddleCenter481' valign='top'>
                                        <div class='formMiddleContent formMiddleContent481  '>
                                          <div id='onLineFlv481' class='formUnsortable' style='width:405px;height:405px;'>
                                            <embed id='481' width='400' height='400' allowscriptaccess='never' style='visibility: visible;z-index:-2'
                                            pluginspage='http://get.adobe.com/cn/flashplayer/' flashvars='playMovie=true&amp;auto=1'
                                            allowfullscreen='true' quality='hight' src='http://撒旦法撒旦' type='application/x-shockwave-flash'
                                            wmode='opaque'>
                                            </embed>
                                          </div>
                                        </div>
                                      </td>
                                      <td class='formMiddleRight formMiddleRight481'>
                                      </td>
                                    </tr>
                                  </table>
                                  <table class='formBottom formBottom481' cellpadding='0' cellspacing='0'>
                                    <tr>
                                      <td class='left left481'>
                                      </td>
                                      <td class='center center481'>
                                      </td>
                                      <td class='right right481'>
                                      </td>
                                    </tr>
                                  </table>
                                  <div class='clearfloat clearfloat481'>
                                  </div>
                                </div>
                              </div>
                              <div id='module460' _indexClass='formIndex26' class='form form460 formIndex26 formStyle28 extformClass '
                              title='' style='' _side='0' _inTab='0' _inMulMCol='0' _inFullmeasure='0'
                              _autoHeight='1' _global='false' _independent='false'>
                                <div class='formWrap formWrap460'>
                                  <table class='formTop formTop460' cellpadding='0' cellspacing='0'>
                                    <tr>
                                      <td class='left'>
                                      </td>
                                      <td class='center'>
                                      </td>
                                      <td class='right'>
                                      </td>
                                    </tr>
                                  </table>
                                  <table class='formBanner formBanner460' cellpadding='0' cellspacing='0'>
                                    <tr>
                                      <td class='left left460'>
                                      </td>
                                      <td class='center center460' valign='top'>
                                        <table cellpadding='0' cellspacing='0' class='formBannerTitle formBannerTitle460'>
                                          <tr>
                                            <td class='titleLeft titleLeft460' valign='top'>
                                            </td>
                                            <td class='titleCenter titleCenter460' valign='top'>
                                              <div class='titleText titleText460'>
                                                <span>
                                                  天气信息
                                                </span>
                                              </div>
                                            </td>
                                            <td class='titleRight titleRight460' valign='top'>
                                            </td>
                                          </tr>
                                        </table>
                                        <div class='formBannerOther formBannerOther460'>
                                          <div class='formBannerBtn formBannerBtn460'>
                                            <span style='_display:inline-block;_position:relative;'>
                                              <a hidefocus='true' href='javascript:;' onclick='Site.closeAd("module460");return false;'
                                              class='g_close'>
                                                <span style='_display:none;'>
                                                  &nbsp;
                                                </span>
                                              </a>
                                            </span>
                                          </div>
                                          &nbsp;
                                        </div>
                                      </td>
                                      <td class='right right460'>
                                      </td>
                                    </tr>
                                  </table>
                                  <table class='formMiddle formMiddle460' style='' cellpadding='0' cellspacing='0'>
                                    <tr>
                                      <td class='formMiddleLeft formMiddleLeft460'>
                                      </td>
                                      <td class='formMiddleCenter formMiddleCenter460' valign='top'>
                                        <div class='formMiddleContent formMiddleContent460  '>
                                          <div class='includeWeather15'>
                                          </div>
                                        </div>
                                      </td>
                                      <td class='formMiddleRight formMiddleRight460'>
                                      </td>
                                    </tr>
                                  </table>
                                  <table class='formBottom formBottom460' cellpadding='0' cellspacing='0'>
                                    <tr>
                                      <td class='left left460'>
                                      </td>
                                      <td class='center center460'>
                                      </td>
                                      <td class='right right460'>
                                      </td>
                                    </tr>
                                  </table>
                                  <div class='clearfloat clearfloat460'>
                                  </div>
                                </div>
                              </div>
                              <div id='module482' _indexClass='formIndex27' class='form form482 formIndex27 formStyle18 extformClass '
                              title='' style='' _side='0' _inTab='0' _inMulMCol='0' _inFullmeasure='0'
                              _autoHeight='1' _global='false' _independent='false'>
                                <div class='formWrap formWrap482'>
                                  <table class='formTop formTop482' cellpadding='0' cellspacing='0'>
                                    <tr>
                                      <td class='left'>
                                      </td>
                                      <td class='center'>
                                      </td>
                                      <td class='right'>
                                      </td>
                                    </tr>
                                  </table>
                                  <table class='formBanner formBanner482' cellpadding='0' cellspacing='0'>
                                    <tr>
                                      <td class='left left482'>
                                      </td>
                                      <td class='center center482' valign='top'>
                                        <table cellpadding='0' cellspacing='0' class='formBannerTitle formBannerTitle482'>
                                          <tr>
                                            <td class='titleLeft titleLeft482' valign='top'>
                                            </td>
                                            <td class='titleCenter titleCenter482' valign='top'>
                                              <div class='titleText titleText482'>
                                                <span>
                                                  在线地图
                                                </span>
                                              </div>
                                            </td>
                                            <td class='titleRight titleRight482' valign='top'>
                                            </td>
                                          </tr>
                                        </table>
                                        <div class='formBannerOther formBannerOther482'>
                                          <div class='formBannerBtn formBannerBtn482'>
                                            <span style='_display:inline-block;_position:relative;'>
                                              <a hidefocus='true' href='javascript:;' onclick='Site.closeAd("module482");return false;'
                                              class='g_close'>
                                                <span style='_display:none;'>
                                                  &nbsp;
                                                </span>
                                              </a>
                                            </span>
                                          </div>
                                          &nbsp;
                                        </div>
                                      </td>
                                      <td class='right right482'>
                                      </td>
                                    </tr>
                                  </table>
                                  <table class='formMiddle formMiddle482' style='' cellpadding='0' cellspacing='0'>
                                    <tr>
                                      <td class='formMiddleLeft formMiddleLeft482'>
                                      </td>
                                      <td class='formMiddleCenter formMiddleCenter482' valign='top'>
                                        <div class='formMiddleContent formMiddleContent482  '>
                                          <div id='mapframe482' name='mapframe' frameborder='0' scrolling='no' height='300'
                                          width='600' src='about:blank'>
                                          </div>
                                        </div>
                                      </td>
                                      <td class='formMiddleRight formMiddleRight482'>
                                      </td>
                                    </tr>
                                  </table>
                                  <table class='formBottom formBottom482' cellpadding='0' cellspacing='0'>
                                    <tr>
                                      <td class='left left482'>
                                      </td>
                                      <td class='center center482'>
                                      </td>
                                      <td class='right right482'>
                                      </td>
                                    </tr>
                                  </table>
                                  <div class='clearfloat clearfloat482'>
                                  </div>
                                </div>
                              </div>
                              <div id='module484' _indexClass='formIndex28' class='form form484 formIndex28 formStyle34 extformClass '
                              title='' style='' _side='0' _inTab='0' _inMulMCol='0' _inFullmeasure='0'
                              _autoHeight='1' _global='false' _independent='false'>
                                <div class='formWrap formWrap484'>
                                  <table class='formTop formTop484' cellpadding='0' cellspacing='0'>
                                    <tr>
                                      <td class='left'>
                                      </td>
                                      <td class='center'>
                                      </td>
                                      <td class='right'>
                                      </td>
                                    </tr>
                                  </table>
                                  <table class='formBanner formBanner484' cellpadding='0' cellspacing='0'>
                                    <tr>
                                      <td class='left left484'>
                                      </td>
                                      <td class='center center484' valign='top'>
                                        <table cellpadding='0' cellspacing='0' class='formBannerTitle formBannerTitle484'>
                                          <tr>
                                            <td class='titleLeft titleLeft484' valign='top'>
                                            </td>
                                            <td class='titleCenter titleCenter484' valign='top'>
                                              <div class='titleText titleText484'>
                                                <span>
                                                  简易表格
                                                </span>
                                              </div>
                                            </td>
                                            <td class='titleRight titleRight484' valign='top'>
                                            </td>
                                          </tr>
                                        </table>
                                        <div class='formBannerOther formBannerOther484'>
                                          <div class='formBannerBtn formBannerBtn484'>
                                            <span style='_display:inline-block;_position:relative;'>
                                              <a hidefocus='true' href='javascript:;' onclick='Site.closeAd("module484");return false;'
                                              class='g_close'>
                                                <span style='_display:none;'>
                                                  &nbsp;
                                                </span>
                                              </a>
                                            </span>
                                          </div>
                                          &nbsp;
                                        </div>
                                      </td>
                                      <td class='right right484'>
                                      </td>
                                    </tr>
                                  </table>
                                  <table class='formMiddle formMiddle484' style='' cellpadding='0' cellspacing='0'>
                                    <tr>
                                      <td class='formMiddleLeft formMiddleLeft484'>
                                      </td>
                                      <td class='formMiddleCenter formMiddleCenter484' valign='top'>
                                        <div class='formMiddleContent formMiddleContent484  '>
                                          <div class='table-content'>
                                            <table cellpadding='0' cellspacing='0' style='width:240px;'>
                                              <tr>
                                                <td style='width:120px;text-align:left;'>
                                                  <div class='table-content-wrap' style='width:120px'>
                                                    文本1
                                                  </div>
                                                </td>
                                                <td style='width:120px;text-align:left;background-color:#003399;'>
                                                  <div class='table-content-wrap' style='width:120px'>
                                                    文本2
                                                  </div>
                                                </td>
                                              </tr>
                                              <tr>
                                                <td style='width:120px;text-align:left;'>
                                                  <div class='table-content-wrap' style='width:120px'>
                                                    <a hidefocus='true' href='http://www.baidu.com' target='_blank'>
                                                      文本3
                                                    </a>
                                                  </div>
                                                </td>
                                                <td style='width:120px;text-align:left;'>
                                                  <div class='table-content-wrap' style='width:120px'>
                                                    文本4
                                                  </div>
                                                </td>
                                              </tr>
                                            </table>
                                          </div>
                                        </div>
                                      </td>
                                      <td class='formMiddleRight formMiddleRight484'>
                                      </td>
                                    </tr>
                                  </table>
                                  <table class='formBottom formBottom484' cellpadding='0' cellspacing='0'>
                                    <tr>
                                      <td class='left left484'>
                                      </td>
                                      <td class='center center484'>
                                      </td>
                                      <td class='right right484'>
                                      </td>
                                    </tr>
                                  </table>
                                  <div class='clearfloat clearfloat484'>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <table class="containerFormsMiddle" cellpadding='0' cellspacing='0'>
                              <tr>
                                <td valign="top" id="containerFormsLeft" class="containerFormsLeft" style='display:none'>
                                  <div class="containerFormsLeftTop">
                                  </div>
                                  <div id="leftForms" class="column forms sideForms leftForms">
                                  </div>
                                  <div class="containerFormsLeftBottom">
                                  </div>
                                </td>
                                <td valign="top" id="containerFormsCenter" class="containerFormsCenter">
                                  <div id="centerTopForms" class="column forms mainForms centerTopForms"
                                  style='display:none'>
                                  </div>
                                  <div class="containerFormsCenterMiddle">
                                    <div id="middleLeftForms" class="column forms mainForms middleLeftForms"
                                    style='display:none'>
                                    </div>
                                    <div id="middleRightForms" class="column forms mainForms middleRightForms"
                                    style='display:none'>
                                    </div>
                                  </div>
                                  <div id="centerBottomForms" class="column forms mainForms centerBottomForms"
                                  style='display:none'>
                                  </div>
                                </td>
                                <td valign="top" id="containerFormsRight" class="containerFormsRight"
                                style='display:none'>
                                  <div class="containerFormsRightTop">
                                  </div>
                                  <div id="rightForms" class="column forms sideForms rightForms">
                                  </div>
                                  <div class="containerFormsRightBottom">
                                  </div>
                                </td>
                              </tr>
                            </table>
                            <div id="bottomForms" class="column forms mainForms bottomForms" style='display:none'>
                            </div>
                            <div id="containerPlaceholder" class="containerPlaceholder">
                            </div>
                          </div>
                          <div id="containerMiddleCenterBottom" class="containerMiddleCenterBottom">
                          </div>
                      </td>
                      <td id="containerMiddleRight" class="containerMiddleRight">
                      </td>
                    </tr>
                  </table>
                  <table class="containerBottom" cellpadding='0' cellspacing='0'>
                    <tr valign='top'>
                      <td class="left">
                      </td>
                      <td class="center">
                      </td>
                      <td class="right">
                      </td>
                    </tr>
                  </table>
                  </div>
                </div>
            </td>
          </tr>
        </table>
        <div id="fullmeasureBottomForms" class="fullmeasureContainer forms sideForms fullmeasureForms fullmeasureBottomForms">
          <wbr style='display:none;' />
        </div>
        <table class="absBottomTable" cellpadding="0" cellspacing="0">
          <tr>
            <td align="center">
              <div id="absBottomForms" class="forms sideForms absForms">
                <div style="position:absolute;">
                </div>
                <!-- for ie6 -->
                <div id='module319' _indexClass='formIndex1' class='form form319 formIndex1 formStyle1 extformClass '
                title='' style='position:absolute;top:97px;left:750px;width:236px;' _side='0'
                _inTab='0' _inMulMCol='0' _inFullmeasure='0' _autoHeight='1' _global='true'
                _independent='false'>
                  <div class='formWrap formWrap319'>
                    <table class='formTop formTop319' cellpadding='0' cellspacing='0'>
                      <tr>
                        <td class='left'>
                        </td>
                        <td class='center'>
                        </td>
                        <td class='right'>
                        </td>
                      </tr>
                    </table>
                    <table class='formBanner formBanner319' cellpadding='0' cellspacing='0'>
                      <tr>
                        <td class='left left319'>
                        </td>
                        <td class='center center319' valign='top'>
                          <table cellpadding='0' cellspacing='0' class='formBannerTitle formBannerTitle319'>
                            <tr>
                              <td class='titleLeft titleLeft319' valign='top'>
                              </td>
                              <td class='titleCenter titleCenter319' valign='top'>
                                <div class='titleText titleText319'>
                                  <span>
                                    联系
                                  </span>
                                </div>
                              </td>
                              <td class='titleRight titleRight319' valign='top'>
                              </td>
                            </tr>
                          </table>
                          <div class='formBannerOther formBannerOther319'>
                            <div class='formBannerBtn formBannerBtn319'>
                              <span style='_display:inline-block;_position:relative;'>
                                <a hidefocus='true' href='javascript:;' onclick='Site.closeAd("module319");return false;'
                                class='g_close'>
                                  <span style='_display:none;'>
                                    &nbsp;
                                  </span>
                                </a>
                              </span>
                            </div>
                            &nbsp;
                          </div>
                        </td>
                        <td class='right right319'>
                        </td>
                      </tr>
                    </table>
                    <table class='formMiddle formMiddle319' style='' cellpadding='0' cellspacing='0'>
                      <tr>
                        <td class='formMiddleLeft formMiddleLeft319'>
                        </td>
                        <td class='formMiddleCenter formMiddleCenter319' valign='top'>
                          <div class='formMiddleContent formMiddleContent319  '>
                            <div class='richContent richContent0'>
                              <p style="line-height:2.5em;">
                                <span style="color:#7F7F7F;font-family:SimSun;">
                                  联系电话：4006-800-800
                                  <br />
                                </span>
                              </p>
                              <p>
                                <span style="color:#7F7F7F;font-family:SimSun;">
                                  电子邮箱：123654879@139.com
                                </span>
                                <br />
                              </p>
                            </div>
                          </div>
                        </td>
                        <td class='formMiddleRight formMiddleRight319'>
                        </td>
                      </tr>
                    </table>
                    <table class='formBottom formBottom319' cellpadding='0' cellspacing='0'>
                      <tr>
                        <td class='left left319'>
                        </td>
                        <td class='center center319'>
                        </td>
                        <td class='right right319'>
                        </td>
                      </tr>
                    </table>
                    <div class='clearfloat clearfloat319'>
                    </div>
                  </div>
                </div>
              </div>
            </td>
          </tr>
        </table>
        <table id="webFooterTable" class="webFooterTable" cellpadding="0" cellspacing="0">
          <tr>
            <td align="center" valign="top">
              <div id="footerResizeWarp" class="footerResizeWarp">
                <div id="webFooter" class="webFooter">
                  <div id="footer" class="footer">
                    <table class="footerTop" cellpadding="0" cellspacing="0">
                      <tr valign="top">
                        <td class="topLeft">
                        </td>
                        <td class="topCenter">
                        </td>
                        <td class="topRight">
                        </td>
                      </tr>
                    </table>
                    <table class="footerMiddle" cellpadding="0" cellspacing="0">
                      <tr valign="top">
                        <td class="middleLeft">
                        </td>
                        <td class="middleCenter" align="center">
                          <div class="footerContent">
                            <div id='footerNav' class='footerNav  footerPattern1' cusheight='0'>
                              <div class='footerItemListBox'>
                                <ul class='footerItemListContainer'>
                                  <li class='footerItemSection'>
                                    <table class='footerItemContainer'>
                                      <tr>
                                        <td class='footerItemContainer-firstTd'>
                                          <div class='footerItemPic'>
                                            <a href='javascript:;' class='footerItemNormalPic  stopPropagation footerItemAddPic'
                                            id='footerItemPic2' onclick='Site.addFooterItemImg("2");return false;'>
                                            </a>
                                          </div>
                                        </td>
                                        <td class='footerItemContainer-secondTd'>
                                          <div class='footerItemContent'>
                                            <div class='footerItemTop'>
                                              <a title='' class='footerItemTopLink' href='/' child='0'>
                                                首页
                                              </a>
                                            </div>
                                            <div class="footerItemMiddle">
                                              <div class="footSplitline">
                                              </div>
                                            </div>
                                          </div>
                                        </td>
                                      </tr>
                                    </table>
                                  </li>
                                  <li class='footerItemSpacing'>
                                    <div class='footerVerticalLine'>
                                    </div>
                                  </li>
                                  <li class='footerItemSection'>
                                    <table class='footerItemContainer'>
                                      <tr>
                                        <td class='footerItemContainer-firstTd'>
                                          <div class='footerItemPic'>
                                            <a href='javascript:;' class='footerItemNormalPic  stopPropagation footerItemAddPic'
                                            id='footerItemPic101' onclick='Site.addFooterItemImg("101");return false;'>
                                            </a>
                                          </div>
                                        </td>
                                        <td class='footerItemContainer-secondTd'>
                                          <div class='footerItemContent'>
                                            <div class='footerItemTop'>
                                              <a title='' class='footerItemTopLink' href='/col.jsp?id=101' child='0'>
                                                关于我们
                                              </a>
                                            </div>
                                            <div class="footerItemMiddle">
                                              <div class="footSplitline">
                                              </div>
                                            </div>
                                          </div>
                                        </td>
                                      </tr>
                                    </table>
                                  </li>
                                  <li class='footerItemSpacing'>
                                    <div class='footerVerticalLine'>
                                    </div>
                                  </li>
                                  <li class='footerItemSection'>
                                    <table class='footerItemContainer'>
                                      <tr>
                                        <td class='footerItemContainer-firstTd'>
                                          <div class='footerItemPic'>
                                            <a href='javascript:;' class='footerItemNormalPic  stopPropagation footerItemAddPic'
                                            id='footerItemPic102' onclick='Site.addFooterItemImg("102");return false;'>
                                            </a>
                                          </div>
                                        </td>
                                        <td class='footerItemContainer-secondTd'>
                                          <div class='footerItemContent'>
                                            <div class='footerItemTop'>
                                              <a title='' class='footerItemTopLink' href='/col.jsp?id=102' child='0'>
                                                联系我们
                                              </a>
                                            </div>
                                            <div class="footerItemMiddle">
                                              <div class="footSplitline">
                                              </div>
                                            </div>
                                          </div>
                                        </td>
                                      </tr>
                                    </table>
                                  </li>
                                  <li class='footerItemSpacing footerItemSpacing_end'>
                                    <div class='footerVerticalLine'>
                                    </div>
                                  </li>
                                </ul>
                              </div>
                            </div>
                            <div class="footerInfo">
                              <p style="line-height:normal;">
                                <font face="Arial">
                                  <br />
                                </font>
                              </p>
                              <p>
                                <font face="Arial">
                                  ©
                                </font>
                                2015 广告创意 版权所有
                              </p>
                              <p style="line-height:2.5em;">
                                <br />
                              </p>
                              <p>
                                友情链接：
                                <a href="http://www.baidu.com" target="_blank" title="百度" _t="103" _i="http://www.baidu.com"
                                _n="www.baidu.com" style="text-decoration:none;">
                                  百度
                                </a>
                                |
                                <a href="http://www.google.cn" target="_blank" title="谷歌" _t="103" _i="http://www.google.cn"
                                _n="www.google.cn" style="text-decoration:none;">
                                  谷歌
                                </a>
                                |
                                <span style="line-height:21px;">
                                  品牌设计| 平面设计| 活动策划| 展厅设计
                                </span>
                              </p>
                              <p>
                                <br />
                              </p>
                            </div>
                            <div class="footerSupport">
                              <span class='footerFaisco'>
                                技术支持：
                                <a hidefocus='true' href='http://jz.faisco.com/?_ta=4' onclick='Site.logDog(100065, 0);'
                                target='_blank'>
                                  凡科建站
                                </a>
                              </span>
                              <span class="bgplayerButton" id="bgplayerButton" style="display:none;">
                              </span>
                            </div>
                          </div>
                        </td>
                        <td class="middleRight">
                        </td>
                      </tr>
                    </table>
                    <table class="footerBottom" cellpadding='0' cellspacing='0'>
                      <tr valign='top'>
                        <td class="bottomLeft">
                        </td>
                        <td class="bottomCenter">
                        </td>
                        <td class="bottomRight">
                        </td>
                      </tr>
                    </table>
                  </div>
                </div>
              </div>
            </td>
          </tr>
        </table>
        <div class="clearfloat">
        </div>
        </div>
      </div>
      <!-- 左下角广告
      <div class="siteAdvertisement_boxTip" style="display:none;">
        <p>
          此广告栏仅
          <span style=''>
            免费版
          </span>
          显示
        </p>
        <div class='siteAdvertisementTipTri'>
        </div>
      </div>
      <div class='siteAdvertisement_box' style="display:none;">
        <div class='siteAdvertisement_Inner'>
          <div class='siteAdvertisement_title'>
            <a class='reportUrl' href=http://www.faisco.com/ts.html?t=3&a=seeyoui
            target='_blank'>
              举报
            </a>
            <a class='closeImg' href='javascript:void(0)'>
            </a>
          </div>
          <a target='_blank' href=http://www.faisco.cn/portal.jsp#appId=shop class='siteAdvertisement_adImg'>
            <img src="http://jz.faisys.com/image/pro/20151101/20150501_B.jpg" width="125"
            height="125" alt="轻松建网站" />
          </a>
        </div>
        <div class="moreAndTime">
          <a class='freeJZ' href=http://www.faisco.cn/portal.jsp#appId=shop target='_blank'>
            <span>
              了解更多
            </span>
          </a>
        </div>
      </div>-->
      <div id="hiddenModuleForms" class="hiddenModuleForms">
      </div>
      <div class="floatLeftTop">
        <div id="floatLeftTopForms" class="forms sideForms floatForms">
        </div>
      </div>
      <div class="floatRightTop">
        <div id="floatRightTopForms" class="forms sideForms floatForms">
          <div id='module473' _indexClass='formIndex1' class='form  formIndex1 formStyle67 extformClass '
          title='' style='position:absolute;top:0px;left:0px;width:170px;' _side='1'
          _inTab='0' _inMulMCol='0' _inFullmeasure='0' _autoHeight='1' _global='true'
          _independent='false'>
            <div class='formWrap formWrap473'>
              <table class='formTop formTop473' cellpadding='0' cellspacing='0'>
                <tr>
                  <td class='left'>
                  </td>
                  <td class='center'>
                  </td>
                  <td class='right'>
                  </td>
                </tr>
              </table>
              <table class='formBanner formBanner473' cellpadding='0' cellspacing='0'>
                <tr>
                  <td class='left left473'>
                  </td>
                  <td class='center center473' valign='top'>
                    <table cellpadding='0' cellspacing='0' class='formBannerTitle formBannerTitle473'>
                      <tr>
                        <td class='titleLeft titleLeft473' valign='top'>
                        </td>
                        <td class='titleCenter titleCenter473' valign='top'>
                          <div class='titleText titleText473'>
                            <span>
                              分享网站
                            </span>
                          </div>
                        </td>
                        <td class='titleRight titleRight473' valign='top'>
                        </td>
                      </tr>
                    </table>
                    <div class='formBannerOther formBannerOther473'>
                      <div class='formBannerBtn formBannerBtn473'>
                        <span style='_display:inline-block;_position:relative;'>
                          <a hidefocus='true' href='javascript:;' onclick='Site.closeAd("module473");return false;'
                          class='g_close'>
                            <span style='_display:none;'>
                              &nbsp;
                            </span>
                          </a>
                        </span>
                      </div>
                      &nbsp;
                    </div>
                  </td>
                  <td class='right right473'>
                  </td>
                </tr>
              </table>
              <table class='formMiddle formMiddle473' style='' cellpadding='0' cellspacing='0'>
                <tr>
                  <td class='formMiddleLeft formMiddleLeft473'>
                  </td>
                  <td class='formMiddleCenter formMiddleCenter473' valign='top'>
                    <div class='formMiddleContent formMiddleContent473  '>
                      <div class='shareInfo'>
                        <div class='shareCtrl shareNotTitlePanel shareMt'>
                          <a hidefocus='true' title='分享到微信' href='javascript:;' onclick="Site.wxShareAlter('cn/qrCode.jsp?cmd=mobiQR&_s=190');return false;">
                            <div class='shareIcon Weixin'>
                            </div>
                            <div class='shareCtrl'>
                              微信
                            </div>
                          </a>
                          <a hidefocus='true' title='复制网址' href='javascript:;' onclick="Site.copyWebSite('http://www.seeyoui.icoc.in')">
                            <div class='shareIcon copy'>
                            </div>
                            <div class='shareCtrl'>
                              复制网址
                            </div>
                          </a>
                          <a hidefocus='true' title='分享到腾讯微博' href='javascript:;' onclick='window.open("http://v.t.qq.com/share/share.php?title=%E3%80%90%E6%99%BA%E6%85%A7%E6%98%9F%E6%B2%B3%E3%80%91&url=http://www.seeyoui.icoc.in/?_sc=1&pic=")'>
                            <div class='shareIcon qq_weibo'>
                            </div>
                            <div class='shareCtrl'>
                              腾讯微博
                            </div>
                          </a>
                          <a hidefocus='true' title='分享到新浪微博' href='javascript:;' onclick='window.open("http://service.weibo.com/share/share.php?title=%E3%80%90%E6%99%BA%E6%85%A7%E6%98%9F%E6%B2%B3%E3%80%91&url=http://www.seeyoui.icoc.in/?_sc=1&pic=")'>
                            <div class='shareIcon sina_weibo'>
                            </div>
                            <div class='shareCtrl'>
                              新浪微博
                            </div>
                          </a>
                          <a hidefocus='true' title='分享到QQ空间' href='javascript:;' onclick='window.open("http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?summary=&url=http://www.seeyoui.icoc.in/?_sc=1&pics=&title=%E3%80%90%E6%99%BA%E6%85%A7%E6%98%9F%E6%B2%B3%E3%80%91")'>
                            <div class='shareIcon qq_zone'>
                            </div>
                            <div class='shareCtrl'>
                              QQ空间
                            </div>
                          </a>
                          <a hidefocus='true' title='分享到开心网' href='javascript:;' onclick='window.open("http://www.kaixin001.com/rest/records.php?content=%E3%80%90%E6%99%BA%E6%85%A7%E6%98%9F%E6%B2%B3%E3%80%91http%3A%2F%2Fwww.seeyoui.icoc.in%2F%3F_sc%3D1&style=11")'>
                            <div class='shareIcon kaixin001'>
                            </div>
                            <div class='shareCtrl'>
                              开心网
                            </div>
                          </a>
                          <a hidefocus='true' title='分享到人人网' href='javascript:;' onclick='window.open("http://widget.renren.com/dialog/share?resourceUrl=http://www.seeyoui.icoc.in/?_sc=1&description=http%3A%2F%2Fwww.seeyoui.icoc.in%2F%3F_sc%3D1&title=%E3%80%90%E6%99%BA%E6%85%A7%E6%98%9F%E6%B2%B3%E3%80%91&pic=")'>
                            <div class='shareIcon renren'>
                            </div>
                            <div class='shareCtrl'>
                              人人网
                            </div>
                          </a>
                          <a hidefocus='true' title='分享到豆瓣网' href='javascript:;' onclick='window.open("http://shuo.douban.com/!service/share?name=%E3%80%90%E6%99%BA%E6%85%A7%E6%98%9F%E6%B2%B3%E3%80%91http%3A%2F%2Fwww.seeyoui.icoc.in%2F%3F_sc%3D1&text=http://www.seeyoui.icoc.in/?_sc=1&image=")'>
                            <div class='shareIcon douban'>
                            </div>
                            <div class='shareCtrl'>
                              豆瓣网
                            </div>
                          </a>
                          <a hidefocus='true' title='分享到网易微博' href='javascript:;' onclick='window.open("http://t.163.com/article/user/checkLogin.do?info=%E3%80%90%E6%99%BA%E6%85%A7%E6%98%9F%E6%B2%B3%E3%80%91http%3A%2F%2Fwww.seeyoui.icoc.in%2F%3F_sc%3D1&images=&togImg=true")'>
                            <div class='shareIcon netease_weibo'>
                            </div>
                            <div class='shareCtrl'>
                              网易微博
                            </div>
                          </a>
                          <a hidefocus='true' title='分享到百度贴吧' href='javascript:;' onclick='window.open("http://tieba.baidu.com/i/app/open_share_api?comment=&pic=&url=http://www.seeyoui.icoc.in/?_sc=1&title=%E3%80%90%E6%99%BA%E6%85%A7%E6%98%9F%E6%B2%B3%E3%80%91http%3A%2F%2Fwww.seeyoui.icoc.in%2F%3F_sc%3D1")'>
                            <div class='shareIcon baidu_tieba'>
                            </div>
                            <div class='shareCtrl'>
                              百度贴吧
                            </div>
                          </a>
                        </div>
                        <div class='clearfloat'>
                        </div>
                      </div>
                    </div>
                  </td>
                  <td class='formMiddleRight formMiddleRight473'>
                  </td>
                </tr>
              </table>
              <table class='formBottom formBottom473' cellpadding='0' cellspacing='0'>
                <tr>
                  <td class='left left473'>
                  </td>
                  <td class='center center473'>
                  </td>
                  <td class='right right473'>
                  </td>
                </tr>
              </table>
              <div class='clearfloat clearfloat473'>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="floatLeftBottom">
        <div id="floatLeftBottomForms" class="forms sideForms floatForms">
        </div>
      </div>
      <div class="floatRightBottom">
        <div id="floatRightBottomForms" class="forms sideForms floatForms">
        </div>
      </div>
      <!--右下角公告-->
    </div>
    </div>
    <!--续费提示-->
    <div id="siteRenewNotice_small_box" class="siteRenewNotice_small_box">
    </div>
    <div id="siteRenewNotice_box" class="siteRenewNotice_box">
      <div class="siteRenewNotice_title">
        <a href="" onclick="javascript:return false;" class="siteRenewNotice_close"
        id="siteRenewNotice_close">
        </a>
      </div>
      <div class="siteRenewNotice_middle">
        <div class="siteRenewNotice_top">
          <h3>
            <span class="siteRenewNotice_name">
              提示
            </span>
          </h3>
        </div>
        <div class="siteRenewNotice_get">
        </div>
        <div class="siteRenewNotice_bottom">
        </div>
      </div>
    </div>
    <div id="bgMusic" class="bgMusic">
    </div>
    <script type="text/javascript" src="./js/comm/jquery/jquery-core.min.js?v=201503161711">
    </script>
    <script type="text/javascript" src="./js/comm/jquery/jquery-mousewheel.min.js?v=201408111734">
    </script>
    <script type="text/javascript" src="./js/comm/fai.min.js?v=201512071738">
    </script>
    <script type="text/javascript" src="./js/comm/jquery/jquery-ui-core.min.js?v=201511231730">
    </script>
    <script type="text/javascript" src="./js/site.min.js?v=201601131153">
    </script>
    <script type="text/javascript" src="./js/locale/2052.min.js?v=201512071738">
    </script>
    <script type="text/javascript" src="./js/comm/ZeroClipboard/ZeroClipboard.min.js?v=201212061014">
    </script>
    <script type="text/javascript" src="./js/comm/faiui.min.js?v=201601111801">
    </script>
    <script type="text/javascript" src="./js/manage.js?v=201601121610">
    </script>
    <script type="text/javascript" src="./js/module_shoppingCart.min.js?v=201512151958">
    </script>
    <script type='text/javascript' src='./js/comm/jquery/jquery-menu-aim.min.js?v=201510191829'>
    </script>
    <link type='text/css' href=./css/fontsIco.min.css?v=201601111801 rel='stylesheet'
    />
    <script type="text/javascript">
      // 为了避免用户误操作，在域名结尾输入多余字符导致cookie失效问题，这里校验一下浏览器的host是否与后台拿到的host一致
      //if (window.location.host != 'seeyoui.faisco.cn') { window.location.href = 'http://' + 'seeyoui.faisco.cn'; }
      //console.log(window.location.host.lastIndexOf("."));
      var _faiAjax = function() {
        //for regexp
        var r = /\?/;
        var _o = {
          type: "get",
          url: "",
          data: "",
          error: function() {},
          success: function() {}
        };
        var _sendRequest = function(o) {
          var xmlhttp = null;
          //init option code
          o.type = o.type || _o.type;
          o.url = o.url || _o.url;
          o.data = o.data || _o.data;
          o.error = o.error || _o.error;
          o.success = o.success || _o.success;
          if (window.XMLHttpRequest) {
            // code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp = new XMLHttpRequest();
          } else {
            // code for IE6, IE5
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
          }
          //the instructions param takes the form of an eval statement
          if (o.type != "post") {
            o.url += (this.r.test(o.url) ? "&": "?") + o.data;
            xmlhttp.open("GET", o.url, true);
            xmlhttp.onreadystatechange = function() {
              if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                o.success(xmlhttp.responseText);
              } else if (o.error) {
                o.error();
              }
            }
            xmlhttp.send();
          } else {
            xmlhttp.open("POST", o.url, true);
            //Send the proper header information along with the request
            xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded; charset=UTF-8");
            xmlhttp.onreadystatechange = function() {
              if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                o.success(xmlhttp.responseText);
              } else {
                o.error();
              }
            }
            xmlhttp.send(o.data);
          }
        }
        return {
          ajax: function(option) {
            try {
              //此次调用的错误不让抛出给window。防止函数重入
              _sendRequest(option);
            } catch(e) {
              //alert(e);
            }
          }
        };
      } ();
      var _jsErrCahche = [];
      window.onerror = function(sMsg, sUrl, sLine) {
        if (typeof Site == 'undefined') {
          alert('您的网页未加载完成，请尝试按“CTRL+功能键F5”重新加载。');
        }
        if (sLine < 1 || typeof sMsg != 'string' || sMsg.length < 1) {
          return;
        }

        var log = "Error:" + sMsg + ";Line:" + sLine + ";Url:" + sUrl;
        var alertLog = "Error:" + sMsg + "\n" + "Line:" + sLine + "\n" + "Url:" + sUrl + "\n";
        var encodeUrl = function(url) {
          return typeof url === "undefined" ? "": encodeURIComponent(url);
        };

        var ajax = true;
        var obj = {
          'm': sMsg,
          'u': sUrl,
          'l': sLine
        };
        for (var i = 0; i < _jsErrCahche.length; i++) {
          if (_jsErrCahche[i].m == obj.m && _jsErrCahche[i].u == obj.u && _jsErrCahche[i].l == obj.l) {
            ajax = false;
            break;
          }
        }

        if (ajax) {
          _jsErrCahche.push(obj);
          _faiAjax.ajax({
            type: "post",
            url: "ajax/logJsErr_h.jsp?cmd=jsErr",
            data: 'msg=' + encodeUrl(log)
          });
        }
        if (false) {
          alert(alertLog);
        }
      };
      Fai.top = window;
      var bgmCloseToOpen = false;
      var _devMode = false;
      var _colOtherStyleData = {
        "independentList": [],
        "y": 0,
        "h": 0,
        "layout4Width": 0,
        "layout5Width": 0
      }; // 当前页面的数据    
      var _templateOtherStyleData = {
        "h": 599,
        "independentList": [],
        "y": 0,
        "layout4Width": 0,
        "layout5Width": 0
      }; // 全局的数据   
      $(function() {
        var hasLoginSite = $.cookie('hasLoginSite');
        if (hasLoginSite == "true" && hasLoginSite != null) {
          $.cookie('hasLoginSite', 'false', {
            expires: 1,
            path: '/'
          });
          if (!_oem) {
            window.location.href = "http://seeyoui.faisco.cn";
          } else {
            window.location.href = "http://seeyoui.vip.webportal.cc";
          }
        }
        if (false) {
          Fai.ing("", true);
        }
        //topBarMember 

        // 管理态下, QQ/微博登陆 禁止登陆
        if (_manageMode) {
          $('#memberBar .l_Btn').click(function() {
            Fai.ing('您目前处于网站管理状态，请先点击网站右上方的“退出”后再登录会员。', true);
          });
          //绑定放大镜遮罩效果事件
          Site.bindEventToOverLayer();
        }

        var faiscoAd = $.cookie('faiscoAd', {
          path: '/'
        });

        if (true && faiscoAd !== "false" && 102686 >= 3) {
          $(".siteAdvertisement_box").show();
        } else if ('false' == 'true') {
          $(".siteAdvertisement_box").show();
        }

        // 绑定退出事件
        $(window).bind("beforeunload",
        function(e) {

          if (bgmCloseToOpen) {
            Site.bgmFlushContinue();
          }

          if (_changeStyleNum > 0) {
            return '您的网站设计正处于编辑状态，离开该页面将会失去您对网站所做的修改。';
          }

        });

        Site.initTemplateLayout(1, true, false);

        // spider统计

        // ajax统计
        Site.total({
          colId: 2,
          pdId: -1,
          ndId: -1,
          sc: 0,
          rf: ""
        });
        //前端性能数据上报
        Site.report();
        //保留旧用户的初始化版式区域4 和区域5 中，区域4的padding-right空间
        Site.colLayout45Width();

        Site.initNavList([{
          "operationText": "新增栏目",
          "display": "text",
          "evalScript": "Site.popupWindow({title:'新增栏目', frameSrcUrl:'manage/colEdit.jsp?ram='+Math.random(), width:'425', height:'240', beforePopup:true});"
        },
        {
          "operationText": "管理栏目",
          "display": "text",
          "evalScript": "Site.popupWindow({title:'管理栏目', frameSrcUrl:'manage/nav.jsp?ram='+Math.random(), width:'675', height:'450', beforePopup:true});"
        },
        {
          "operationText": "设置样式",
          "display": "text",
          "evalScript": "Site.popupWindow({title:'设置导航栏样式', frameSrcUrl:'manage/navStyleEdit.jsp?ram='+Math.random(), width:'490', height:'330', saveBeforePopup:false});"
        },
        {
          "display": "text",
          "operationText": "隐藏",
          "operationTitle": "点击隐藏栏目，隐藏后可以从\u201C网站设计\u201D-\u201C网站设置\u201D重新选择。",
          "className": "close",
          "evalScript": "Site.hiddenNav();"
        }]);
        Site.initFooterManage([{
          "operationText": "编辑内容",
          "display": "text",
          "evalScript": "Site.popupWindow({title:'编辑底部内容', frameSrcUrl:'manage/footerInfoEdit.jsp?ram='+Math.random(), width:'710', height:'500'});"
        },
        {
          "operationText": "底部样式",
          "display": "text",
          "evalScript": "Site.faiFloatPanel(2,2,4);"
        },
        {
          "operationText": "恢复排版",
          "display": "text",
          "evalScript": "Site.resetAllFooterStyle();"
        }]);
        Site.initCorpTitleManage([{
          "display": "text",
          "operationText": "编辑标题",
          "operationTitle": "点击编辑标题",
          "className": "edit",
          "evalScript": "Site.popupWindow({title:'编辑网站标题', frameSrcUrl:'manage/corpTitleEdit.jsp?ram='+Math.random(), width:'403', height:'300', saveBeforePopup:false});"
        },
        {
          "display": "text",
          "operationText": "隐藏",
          "operationTitle": "点击隐藏标题，隐藏后可以从\u201C网站设计\u201D-\u201C网站设置\u201D重新选择。",
          "className": "close",
          "evalScript": "Site.hiddenTitle();"
        }]);
        Site.initCorpTitleJump();
        Site.initLogoManage([{
          "display": "text",
          "operationText": "编辑LOGO",
          "operationTitle": "点击编辑LOGO",
          "className": "edit",
          "evalScript": "Site.popupWindow({title:'编辑LOGO', frameSrcUrl:'manage/corpTitleEdit.jsp?ram='+Math.random()+'&_tabs=2', width:'403', height:'300', opacity:'0.2', saveBeforePopup:false});"
        },
        {
          "display": "text",
          "operationText": "隐藏",
          "operationTitle": "点击隐藏LOGO，隐藏后可以从\u201C网站设计\u201D-\u201C网站设置\u201D重新选择。",
          "className": "close",
          "evalScript": "Site.hiddenLogo();"
        }]);
        Site.initModuleLayer(456, [{
          "text": "编辑图片",
          "title": "编辑浮动图片模块",
          "evalScript": "Site.popupWindow({title:'编辑浮动图片模块', frameSrcUrl:'manage/floatImgEdit.jsp?id=456&colId=2&extId=0&ram='+Math.random(), width:'560', height:'610', saveBeforePopup:false});"
        },
        {
          "display": "icon",
          "iconClass": "bannerAndBorder",
          "text": "设置样式",
          "title": "设置模块标题栏、边框等样式",
          "evalScript": "Site.functionInterface({'name':'faiSettingPanel.init', 'prompt':true}, {'id':456, 'styleId':79, 'entrance':0});Site.removeAllEditLayer();return false;"
        },
        {
          "text": "高级",
          "title": "",
          "className": "setItem",
          "menu": [{
            "display": "icon",
            "iconClass1": "dockModule",
            "text1": "停靠模块",
            "title1": "把模块停靠回固定区域",
            "statusScript": "Site.getDockStatus2('module456');",
            "evalScript": "Site.dock2('module456');"
          },
          {
            "display": "icon",
            "iconClass1": "absModule",
            "text1": "浮动模块",
            "title1": "浮动模块，可随意摆放位置",
            "statusScript": "Site.getAbsStatus2('module456');",
            "evalScript": "Site.floatOut2('module456');"
          },
          {
            "display": "icon",
            "iconClass1": "lock",
            "text1": "锁定模块",
            "title1": "锁定模块在当前位置，不跟随滚动条变化位置",
            "statusScript": "Site.getLockStatus2('module456');",
            "evalScript": "Site.lock2('module456');"
          },
          {
            "display": "icon",
            "iconClass1": "sidem",
            "text1": "侧停模块",
            "title1": "侧边停靠收起模块，支持鼠标移入自动展开",
            "statusScript": "Site.getSideStatus2('module456');",
            "evalScript": "Site.sideModule2('module456');"
          },
          {
            "display": "icon",
            "iconClass1": "flutterm",
            "text1": "飘动模块",
            "title1": "飘动模块,按照轨迹飘动",
            "statusScript": "Site.getFlutterStatus('module456');",
            "evalScript": "Site.flutter('module456');"
          },
          {
            "hrLine": true
          },
          {
            "display": "icon",
            "text": "设为全站模块",
            "title": "把模块添加到整个网站的所有栏目中",
            "iconClass": "global",
            "evalScript": "Site.setGlobalModule(456, true);",
            "statusScript": "Site.getLayoutItemStatus('module456');"
          },
          {
            "display": "icon",
            "text": "加到指定栏目",
            "title": "把模块添加到指定栏目中",
            "iconClass": "apply",
            "evalScript": "Site.applyModuleTo(456);",
            "statusScript": "Site.getLayoutItemStatus('module456');"
          }]
        }], [{
          "display": "icon",
          "text": "隐藏模块",
          "title": "隐藏模块",
          "iconClass": "close",
          "evalScript": "Site.hideModule(456, false);"
        },
        {
          "display": "icon",
          "text": "隐藏标题栏与背景样式",
          "title": "隐藏标题栏与背景样式",
          "iconClass": "clearTB",
          "statusScript": "Site.getOneKeySetModuleTBStatus('module456');",
          "evalScript": "Site.oneKeySetModuleTB(456, true);",
          "setTB": "1"
        },
        {
          "display": "icon",
          "iconClass1": "add",
          "text1": "添加模块",
          "title1": "添加模块",
          "statusScript": "Site.getOpenAddModuleStatus('module456');",
          "evalScript": "Site.openAddModule(456)"
        },
        {
          "display": "icon",
          "iconClass1": "mzindex",
          "text1": "浮到最前",
          "title1": "把模块浮到最前区域",
          "statusScript": "Site.getAbsZIndexStatus('module456');",
          "evalScript": "Site.absZIndexModule('module456');"
        }], [{
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "上移模块",
          "title1": "上移模块",
          "statusScript": "Site.getModulePosTop('module456');",
          "evalScript": "Site.moveModulePosTop('module456');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "下移模块",
          "title1": "下移模块",
          "statusScript": "Site.getModulePosBottom('module456');",
          "evalScript": "Site.moveModulePosBottom('module456');"
        },
        {
          "display": "icon",
          "iconClass1": "mleft",
          "fixClass": "littleBtn",
          "text1": "左移模块",
          "title1": "左移模块",
          "statusScript": "Site.getModulePosLeft('module456');",
          "evalScript": "Site.moveModulePosLeft('module456');"
        },
        {
          "display": "icon",
          "iconClass1": "mright",
          "fixClass": "littleBtn",
          "text1": "右移模块",
          "title1": "右移模块",
          "statusScript": "Site.getModulePosRight('module456');",
          "evalScript": "Site.moveModulePosRight('module456');"
        },
        {
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "跳到中间",
          "title1": "把模块跳到中间区域",
          "statusScript": "Site.getAbsMiddleStatus('module456');",
          "evalScript": "Site.absMiddleModule('module456');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "跳到底部",
          "title1": "把模块跳到底部区域",
          "statusScript": "Site.getAbsBottomStatus('module456');",
          "evalScript": "Site.absBottomModule('module456');"
        }]);

        Site.initModuleSiteSearch('472');
        Site.initModuleLayer(472, [{
          "text": "编辑模块",
          "title": "编辑全站搜索模块",
          "evalScript": "Site.popupWindow({title:'编辑全站搜索模块', frameSrcUrl:'manage/siteSearchModuleEdit.jsp?id=472&colId=2&extId=0&ram='+Math.random(), width:'568', height:'400', saveBeforePopup:false});"
        },
        {
          "display": "icon",
          "iconClass": "bannerAndBorder",
          "text": "设置样式",
          "title": "设置模块标题栏、边框等样式",
          "evalScript": "Site.functionInterface({'name':'faiSettingPanel.init', 'prompt':true}, {'id':472, 'styleId':62, 'entrance':0});Site.removeAllEditLayer();return false;"
        },
        {
          "text": "高级",
          "title": "",
          "className": "setItem",
          "menu": [{
            "display": "icon",
            "iconClass1": "dockModule",
            "text1": "停靠模块",
            "title1": "把模块停靠回固定区域",
            "statusScript": "Site.getDockStatus2('module472');",
            "evalScript": "Site.dock2('module472');"
          },
          {
            "display": "icon",
            "iconClass1": "absModule",
            "text1": "浮动模块",
            "title1": "浮动模块，可随意摆放位置",
            "statusScript": "Site.getAbsStatus2('module472');",
            "evalScript": "Site.floatOut2('module472');"
          },
          {
            "display": "icon",
            "iconClass1": "lock",
            "text1": "锁定模块",
            "title1": "锁定模块在当前位置，不跟随滚动条变化位置",
            "statusScript": "Site.getLockStatus2('module472');",
            "evalScript": "Site.lock2('module472');"
          },
          {
            "display": "icon",
            "iconClass1": "sidem",
            "text1": "侧停模块",
            "title1": "侧边停靠收起模块，支持鼠标移入自动展开",
            "statusScript": "Site.getSideStatus2('module472');",
            "evalScript": "Site.sideModule2('module472');"
          },
          {
            "display": "icon",
            "iconClass1": "flutterm",
            "text1": "飘动模块",
            "title1": "飘动模块,按照轨迹飘动",
            "statusScript": "Site.getFlutterStatus('module472');",
            "evalScript": "Site.flutter('module472');"
          },
          {
            "hrLine": true
          },
          {
            "display": "icon",
            "text": "取消全站模块",
            "title": "取消该模块在所有栏目中展示。",
            "iconClass": "global",
            "evalScript": "Site.setGlobalModule(472, false);",
            "statusScript": "Site.getLayoutItemStatus('module472');"
          },
          {
            "display": "icon",
            "text": "本页独立布局",
            "title": "该模块在本页面独立布局。",
            "iconClass": "independent",
            "evalScript": "Site.independentModule(472, true);"
          }]
        }], [{
          "display": "icon",
          "text": "隐藏模块",
          "title": "隐藏模块",
          "iconClass": "close",
          "evalScript": "Site.hideModule(472, false);"
        },
        {
          "display": "icon",
          "text": "隐藏标题栏与背景样式",
          "title": "隐藏标题栏与背景样式",
          "iconClass": "clearTB",
          "statusScript": "Site.getOneKeySetModuleTBStatus('module472');",
          "evalScript": "Site.oneKeySetModuleTB(472, true);",
          "setTB": "1"
        },
        {
          "display": "icon",
          "iconClass1": "add",
          "text1": "添加模块",
          "title1": "添加模块",
          "statusScript": "Site.getOpenAddModuleStatus('module472');",
          "evalScript": "Site.openAddModule(472)"
        },
        {
          "display": "icon",
          "iconClass1": "mzindex",
          "text1": "浮到最前",
          "title1": "把模块浮到最前区域",
          "statusScript": "Site.getAbsZIndexStatus('module472');",
          "evalScript": "Site.absZIndexModule('module472');"
        }], [{
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "上移模块",
          "title1": "上移模块",
          "statusScript": "Site.getModulePosTop('module472');",
          "evalScript": "Site.moveModulePosTop('module472');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "下移模块",
          "title1": "下移模块",
          "statusScript": "Site.getModulePosBottom('module472');",
          "evalScript": "Site.moveModulePosBottom('module472');"
        },
        {
          "display": "icon",
          "iconClass1": "mleft",
          "fixClass": "littleBtn",
          "text1": "左移模块",
          "title1": "左移模块",
          "statusScript": "Site.getModulePosLeft('module472');",
          "evalScript": "Site.moveModulePosLeft('module472');"
        },
        {
          "display": "icon",
          "iconClass1": "mright",
          "fixClass": "littleBtn",
          "text1": "右移模块",
          "title1": "右移模块",
          "statusScript": "Site.getModulePosRight('module472');",
          "evalScript": "Site.moveModulePosRight('module472');"
        },
        {
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "跳到中间",
          "title1": "把模块跳到中间区域",
          "statusScript": "Site.getAbsMiddleStatus('module472');",
          "evalScript": "Site.absMiddleModule('module472');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "跳到底部",
          "title1": "把模块跳到底部区域",
          "statusScript": "Site.getAbsBottomStatus('module472');",
          "evalScript": "Site.absBottomModule('module472');"
        }]);

        Site.initFlBtnStyle(479, 304, {
          "bns": 304,
          "bs": {
            "v": "",
            "h": "",
            "hn": ""
          },
          "s": {
            "t": 1,
            "w": 163,
            "h": 52
          },
          "bg": {
            "t": 1,
            "c": "#000000",
            "i": "",
            "r": 3
          },
          "r": {
            "t": 2,
            "lt": 10,
            "rt": 10,
            "lb": 10,
            "rb": 10
          },
          "sh": {
            "t": 2,
            "c": "rgba(0,0,0,0.5)",
            "dx": 3,
            "dy": 2,
            "f": 12
          },
          "b": {
            "t": 2,
            "w": 1,
            "c": "#000000"
          }
        });
        Site.initModuleLayer(479, [{
          "text": "编辑模块",
          "title": "编辑按钮模块",
          "evalScript": "Site.popupWindow({title:'编辑按钮模块', frameSrcUrl:'manage/floatBtnEdit.jsp?id=479&colId=2&extId=0&ram='+Math.random(), width:'550', height:'360', saveBeforePopup:false});"
        },
        {
          "display": "icon",
          "iconClass": "bannerAndBorder",
          "text": "设置样式",
          "title": "设置模块标题栏、边框等样式",
          "evalScript": "Site.functionInterface({'name':'faiSettingPanel.init', 'prompt':true}, {'id':479, 'styleId':81, 'entrance':0});Site.removeAllEditLayer();return false;"
        },
        {
          "text": "高级",
          "title": "",
          "className": "setItem",
          "menu": [{
            "display": "icon",
            "iconClass1": "dockModule",
            "text1": "停靠模块",
            "title1": "把模块停靠回固定区域",
            "statusScript": "Site.getDockStatus2('module479');",
            "evalScript": "Site.dock2('module479');"
          },
          {
            "display": "icon",
            "iconClass1": "absModule",
            "text1": "浮动模块",
            "title1": "浮动模块，可随意摆放位置",
            "statusScript": "Site.getAbsStatus2('module479');",
            "evalScript": "Site.floatOut2('module479');"
          },
          {
            "display": "icon",
            "iconClass1": "lock",
            "text1": "锁定模块",
            "title1": "锁定模块在当前位置，不跟随滚动条变化位置",
            "statusScript": "Site.getLockStatus2('module479');",
            "evalScript": "Site.lock2('module479');"
          },
          {
            "display": "icon",
            "iconClass1": "sidem",
            "text1": "侧停模块",
            "title1": "侧边停靠收起模块，支持鼠标移入自动展开",
            "statusScript": "Site.getSideStatus2('module479');",
            "evalScript": "Site.sideModule2('module479');"
          },
          {
            "display": "icon",
            "iconClass1": "flutterm",
            "text1": "飘动模块",
            "title1": "飘动模块,按照轨迹飘动",
            "statusScript": "Site.getFlutterStatus('module479');",
            "evalScript": "Site.flutter('module479');"
          },
          {
            "hrLine": true
          },
          {
            "display": "icon",
            "text": "设为全站模块",
            "title": "把模块添加到整个网站的所有栏目中",
            "iconClass": "global",
            "evalScript": "Site.setGlobalModule(479, true);",
            "statusScript": "Site.getLayoutItemStatus('module479');"
          },
          {
            "display": "icon",
            "text": "加到指定栏目",
            "title": "把模块添加到指定栏目中",
            "iconClass": "apply",
            "evalScript": "Site.applyModuleTo(479);",
            "statusScript": "Site.getLayoutItemStatus('module479');"
          }]
        }], [{
          "display": "icon",
          "text": "隐藏模块",
          "title": "隐藏模块",
          "iconClass": "close",
          "evalScript": "Site.hideModule(479, false);"
        },
        {
          "display": "icon",
          "text": "隐藏标题栏与背景样式",
          "title": "隐藏标题栏与背景样式",
          "iconClass": "clearTB",
          "statusScript": "Site.getOneKeySetModuleTBStatus('module479');",
          "evalScript": "Site.oneKeySetModuleTB(479, true);",
          "setTB": "1"
        },
        {
          "display": "icon",
          "iconClass1": "add",
          "text1": "添加模块",
          "title1": "添加模块",
          "statusScript": "Site.getOpenAddModuleStatus('module479');",
          "evalScript": "Site.openAddModule(479)"
        },
        {
          "display": "icon",
          "iconClass1": "mzindex",
          "text1": "浮到最前",
          "title1": "把模块浮到最前区域",
          "statusScript": "Site.getAbsZIndexStatus('module479');",
          "evalScript": "Site.absZIndexModule('module479');"
        }], [{
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "上移模块",
          "title1": "上移模块",
          "statusScript": "Site.getModulePosTop('module479');",
          "evalScript": "Site.moveModulePosTop('module479');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "下移模块",
          "title1": "下移模块",
          "statusScript": "Site.getModulePosBottom('module479');",
          "evalScript": "Site.moveModulePosBottom('module479');"
        },
        {
          "display": "icon",
          "iconClass1": "mleft",
          "fixClass": "littleBtn",
          "text1": "左移模块",
          "title1": "左移模块",
          "statusScript": "Site.getModulePosLeft('module479');",
          "evalScript": "Site.moveModulePosLeft('module479');"
        },
        {
          "display": "icon",
          "iconClass1": "mright",
          "fixClass": "littleBtn",
          "text1": "右移模块",
          "title1": "右移模块",
          "statusScript": "Site.getModulePosRight('module479');",
          "evalScript": "Site.moveModulePosRight('module479');"
        },
        {
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "跳到中间",
          "title1": "把模块跳到中间区域",
          "statusScript": "Site.getAbsMiddleStatus('module479');",
          "evalScript": "Site.absMiddleModule('module479');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "跳到底部",
          "title1": "把模块跳到底部区域",
          "statusScript": "Site.getAbsBottomStatus('module479');",
          "evalScript": "Site.absBottomModule('module479');"
        }]);

        Site.initModuleDate.init(483, 1);
        Site.initModuleLayer(483, [{
          "text": "编辑模块",
          "title": "编辑日期模块",
          "evalScript": "Site.popupWindow({title:'编辑日期模块', frameSrcUrl:'manage/dateModuleEdit.jsp?id=483&colId=2&extId=0&ram='+Math.random(), width:'550', height:'360', saveBeforePopup:false});"
        },
        {
          "display": "icon",
          "iconClass": "bannerAndBorder",
          "text": "设置样式",
          "title": "设置模块标题栏、边框等样式",
          "evalScript": "Site.functionInterface({'name':'faiSettingPanel.init', 'prompt':true}, {'id':483, 'styleId':66, 'entrance':0});Site.removeAllEditLayer();return false;"
        },
        {
          "text": "高级",
          "title": "",
          "className": "setItem",
          "menu": [{
            "display": "icon",
            "iconClass1": "dockModule",
            "text1": "停靠模块",
            "title1": "把模块停靠回固定区域",
            "statusScript": "Site.getDockStatus2('module483');",
            "evalScript": "Site.dock2('module483');"
          },
          {
            "display": "icon",
            "iconClass1": "absModule",
            "text1": "浮动模块",
            "title1": "浮动模块，可随意摆放位置",
            "statusScript": "Site.getAbsStatus2('module483');",
            "evalScript": "Site.floatOut2('module483');"
          },
          {
            "display": "icon",
            "iconClass1": "lock",
            "text1": "锁定模块",
            "title1": "锁定模块在当前位置，不跟随滚动条变化位置",
            "statusScript": "Site.getLockStatus2('module483');",
            "evalScript": "Site.lock2('module483');"
          },
          {
            "display": "icon",
            "iconClass1": "sidem",
            "text1": "侧停模块",
            "title1": "侧边停靠收起模块，支持鼠标移入自动展开",
            "statusScript": "Site.getSideStatus2('module483');",
            "evalScript": "Site.sideModule2('module483');"
          },
          {
            "display": "icon",
            "iconClass1": "flutterm",
            "text1": "飘动模块",
            "title1": "飘动模块,按照轨迹飘动",
            "statusScript": "Site.getFlutterStatus('module483');",
            "evalScript": "Site.flutter('module483');"
          },
          {
            "hrLine": true
          },
          {
            "display": "icon",
            "text": "取消全站模块",
            "title": "取消该模块在所有栏目中展示。",
            "iconClass": "global",
            "evalScript": "Site.setGlobalModule(483, false);",
            "statusScript": "Site.getLayoutItemStatus('module483');"
          },
          {
            "display": "icon",
            "text": "本页独立布局",
            "title": "该模块在本页面独立布局。",
            "iconClass": "independent",
            "evalScript": "Site.independentModule(483, true);"
          }]
        }], [{
          "display": "icon",
          "text": "隐藏模块",
          "title": "隐藏模块",
          "iconClass": "close",
          "evalScript": "Site.hideModule(483, false);"
        },
        {
          "display": "icon",
          "text": "隐藏标题栏与背景样式",
          "title": "隐藏标题栏与背景样式",
          "iconClass": "clearTB",
          "statusScript": "Site.getOneKeySetModuleTBStatus('module483');",
          "evalScript": "Site.oneKeySetModuleTB(483, true);",
          "setTB": "1"
        },
        {
          "display": "icon",
          "iconClass1": "add",
          "text1": "添加模块",
          "title1": "添加模块",
          "statusScript": "Site.getOpenAddModuleStatus('module483');",
          "evalScript": "Site.openAddModule(483)"
        },
        {
          "display": "icon",
          "iconClass1": "mzindex",
          "text1": "浮到最前",
          "title1": "把模块浮到最前区域",
          "statusScript": "Site.getAbsZIndexStatus('module483');",
          "evalScript": "Site.absZIndexModule('module483');"
        }], [{
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "上移模块",
          "title1": "上移模块",
          "statusScript": "Site.getModulePosTop('module483');",
          "evalScript": "Site.moveModulePosTop('module483');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "下移模块",
          "title1": "下移模块",
          "statusScript": "Site.getModulePosBottom('module483');",
          "evalScript": "Site.moveModulePosBottom('module483');"
        },
        {
          "display": "icon",
          "iconClass1": "mleft",
          "fixClass": "littleBtn",
          "text1": "左移模块",
          "title1": "左移模块",
          "statusScript": "Site.getModulePosLeft('module483');",
          "evalScript": "Site.moveModulePosLeft('module483');"
        },
        {
          "display": "icon",
          "iconClass1": "mright",
          "fixClass": "littleBtn",
          "text1": "右移模块",
          "title1": "右移模块",
          "statusScript": "Site.getModulePosRight('module483');",
          "evalScript": "Site.moveModulePosRight('module483');"
        },
        {
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "跳到中间",
          "title1": "把模块跳到中间区域",
          "statusScript": "Site.getAbsMiddleStatus('module483');",
          "evalScript": "Site.absMiddleModule('module483');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "跳到底部",
          "title1": "把模块跳到底部区域",
          "statusScript": "Site.getAbsBottomStatus('module483');",
          "evalScript": "Site.absBottomModule('module483');"
        }]);

        Site.initModuleLayer(485, [{
          "text": "编辑模块",
          "title": "编辑收藏本站模块",
          "evalScript": "Site.popupWindow({title:'编辑收藏本站模块', frameSrcUrl:'manage/favoriteModuleEdit.jsp?id=485&colId=2&extId=0&ram='+Math.random(), width:'340', height:'80', saveBeforePopup:false});"
        },
        {
          "display": "icon",
          "iconClass": "bannerAndBorder",
          "text": "设置样式",
          "title": "设置模块标题栏、边框等样式",
          "evalScript": "Site.functionInterface({'name':'faiSettingPanel.init', 'prompt':true}, {'id':485, 'styleId':65, 'entrance':0});Site.removeAllEditLayer();return false;"
        },
        {
          "text": "高级",
          "title": "",
          "className": "setItem",
          "menu": [{
            "display": "icon",
            "iconClass1": "dockModule",
            "text1": "停靠模块",
            "title1": "把模块停靠回固定区域",
            "statusScript": "Site.getDockStatus2('module485');",
            "evalScript": "Site.dock2('module485');"
          },
          {
            "display": "icon",
            "iconClass1": "absModule",
            "text1": "浮动模块",
            "title1": "浮动模块，可随意摆放位置",
            "statusScript": "Site.getAbsStatus2('module485');",
            "evalScript": "Site.floatOut2('module485');"
          },
          {
            "display": "icon",
            "iconClass1": "lock",
            "text1": "锁定模块",
            "title1": "锁定模块在当前位置，不跟随滚动条变化位置",
            "statusScript": "Site.getLockStatus2('module485');",
            "evalScript": "Site.lock2('module485');"
          },
          {
            "display": "icon",
            "iconClass1": "sidem",
            "text1": "侧停模块",
            "title1": "侧边停靠收起模块，支持鼠标移入自动展开",
            "statusScript": "Site.getSideStatus2('module485');",
            "evalScript": "Site.sideModule2('module485');"
          },
          {
            "display": "icon",
            "iconClass1": "flutterm",
            "text1": "飘动模块",
            "title1": "飘动模块,按照轨迹飘动",
            "statusScript": "Site.getFlutterStatus('module485');",
            "evalScript": "Site.flutter('module485');"
          },
          {
            "hrLine": true
          },
          {
            "display": "icon",
            "text": "取消全站模块",
            "title": "取消该模块在所有栏目中展示。",
            "iconClass": "global",
            "evalScript": "Site.setGlobalModule(485, false);",
            "statusScript": "Site.getLayoutItemStatus('module485');"
          },
          {
            "display": "icon",
            "text": "本页独立布局",
            "title": "该模块在本页面独立布局。",
            "iconClass": "independent",
            "evalScript": "Site.independentModule(485, true);"
          }]
        }], [{
          "display": "icon",
          "text": "隐藏模块",
          "title": "隐藏模块",
          "iconClass": "close",
          "evalScript": "Site.hideModule(485, false);"
        },
        {
          "display": "icon",
          "text": "隐藏标题栏与背景样式",
          "title": "隐藏标题栏与背景样式",
          "iconClass": "clearTB",
          "statusScript": "Site.getOneKeySetModuleTBStatus('module485');",
          "evalScript": "Site.oneKeySetModuleTB(485, true);",
          "setTB": "1"
        },
        {
          "display": "icon",
          "iconClass1": "add",
          "text1": "添加模块",
          "title1": "添加模块",
          "statusScript": "Site.getOpenAddModuleStatus('module485');",
          "evalScript": "Site.openAddModule(485)"
        },
        {
          "display": "icon",
          "iconClass1": "mzindex",
          "text1": "浮到最前",
          "title1": "把模块浮到最前区域",
          "statusScript": "Site.getAbsZIndexStatus('module485');",
          "evalScript": "Site.absZIndexModule('module485');"
        }], [{
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "上移模块",
          "title1": "上移模块",
          "statusScript": "Site.getModulePosTop('module485');",
          "evalScript": "Site.moveModulePosTop('module485');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "下移模块",
          "title1": "下移模块",
          "statusScript": "Site.getModulePosBottom('module485');",
          "evalScript": "Site.moveModulePosBottom('module485');"
        },
        {
          "display": "icon",
          "iconClass1": "mleft",
          "fixClass": "littleBtn",
          "text1": "左移模块",
          "title1": "左移模块",
          "statusScript": "Site.getModulePosLeft('module485');",
          "evalScript": "Site.moveModulePosLeft('module485');"
        },
        {
          "display": "icon",
          "iconClass1": "mright",
          "fixClass": "littleBtn",
          "text1": "右移模块",
          "title1": "右移模块",
          "statusScript": "Site.getModulePosRight('module485');",
          "evalScript": "Site.moveModulePosRight('module485');"
        },
        {
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "跳到中间",
          "title1": "把模块跳到中间区域",
          "statusScript": "Site.getAbsMiddleStatus('module485');",
          "evalScript": "Site.absMiddleModule('module485');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "跳到底部",
          "title1": "把模块跳到底部区域",
          "statusScript": "Site.getAbsBottomStatus('module485');",
          "evalScript": "Site.absBottomModule('module485');"
        }]);

        Site.initBanner({
          "_open": true,
          "data": [{
            "title": "",
            "desc": "",
            "imgWidth": 1440,
            "imgHeight": 450,
            "src": "./image/demo/ABUIABACGAAgia3GrgUokPy2zQcwoAs4wgM.jpg",
            "edgeLeft": "",
            "edgeRight": ""
          }],
          "width": 1440,
          "height": 450,
          "playTime": 4000,
          "animateTime": 1500,
          "from": "banner",
          "btnType": 1,
          "wideScreen": false
        },
        {
          "_open": false
        },
        4);
        Site.initBannerManage([{
          "id": "btn-editBanner",
          "display": "text",
          "operationText": "编辑横幅",
          "operationTitle": "点击编辑横幅",
          "evalScript": "Site.styleSetting('open', 'webBannerTab', false, 'showSiteBanner')"
        },
        {
          "id": "btn-editBanner",
          "judge": "banner",
          "display": "text",
          "operationText": "切换动画",
          "operationTitle": "点击设置切换动画",
          "evalScript": "Site.logDog(100041, 7); Site.popupWindow({title:'设置横幅切换动画', frameSrcUrl:'manage/styleBannerSetting.jsp?ram='+Math.random(), width:690, height:562, saveBeforePopup:false});"
        },
        {
          "id": "btn-editBanner",
          "display": "text",
          "operationText": "横幅特效",
          "operationTitle": "点击设置横幅特效",
          "evalScript": "Site.styleSetting('open', 'webBannerTab', false, 'showBannerEffects')"
        },
        {
          "display": "text",
          "operationText": "隐藏",
          "operationTitle": "点击隐藏横幅，隐藏后可以从\u201C网站设计\u201D-\u201C网站设置\u201D重新选择。",
          "className": "close",
          "evalScript": "Site.hiddenBanner();"
        }]);
        Site.loadPhotoList(320, true, true, 3);
        Site.functionInterface({
          "name": "ImageEffect.FUNC.BASIC.Init",
          "callMethod": true
        },
        {
          "moduleId": 320,
          "imgEffOption": {
            "effType": 3,
            "borderType": false,
            "borderColor": "#000",
            "borderWidth": 1,
            "borderStyle": 1,
            "style": 4,
            "fullMaskCusBg": false,
            "fullMaskCusName": false,
            "fullMaskCusDisc": false,
            "fullMaskOpenDisc": false
          },
          "tagetOption": {
            "nameHidden": false,
            "nameWordWrap": true,
            "targetParent": "photoForm",
            "target": "imgDiv"
          },
          "callback": Site.createImageEffectContent_photo,
          "callbackArgs": []
        });
        Site.initModulePhotoListItemManage({
          'photoParent': 'photoForms320',
          'photo': 'photoForm',
          'photoChild': 'imgDiv',
          'moduleId': 320,
          'groupId': 3,
          'groupName': '1',
          'isOpenImgEff': true
        });
        Site.initModuleLayer(320, [{
          "text": "编辑模块",
          "title": "编辑图册展示模块",
          "evalScript": "Site.popupWindow({title:'编辑图册展示模块', frameSrcUrl:'manage/photoModuleEdit.jsp?id=320&colId=2&extId=0&ram='+Math.random(), width:'600', height:'555', frameScrolling:'auto', saveBeforePopup:false});"
        },
        {
          "display": "icon",
          "iconClass": "bannerAndBorder",
          "text": "设置样式",
          "title": "设置模块标题栏、边框等样式",
          "evalScript": "Site.functionInterface({'name':'faiSettingPanel.init', 'prompt':true}, {'id':320, 'styleId':4, 'entrance':0});Site.removeAllEditLayer();return false;"
        },
        {
          "text": "编辑图册",
          "title": "编辑图片相册内容",
          "evalScript": "Site.popupWindow({title:'编辑图册', frameSrcUrl:'manage/photoGroupEdit.jsp?id=3&ram='+Math.random(),  width:'750', height:'560', frameScrolling:'auto', beforePopup:true});"
        },
        {
          "text": "高级",
          "title": "",
          "className": "setItem",
          "menu": [{
            "display": "icon",
            "iconClass1": "dockModule",
            "text1": "停靠模块",
            "title1": "把模块停靠回固定区域",
            "statusScript": "Site.getDockStatus2('module320');",
            "evalScript": "Site.dock2('module320');"
          },
          {
            "display": "icon",
            "iconClass1": "absModule",
            "text1": "浮动模块",
            "title1": "浮动模块，可随意摆放位置",
            "statusScript": "Site.getAbsStatus2('module320');",
            "evalScript": "Site.floatOut2('module320');"
          },
          {
            "display": "icon",
            "iconClass1": "lock",
            "text1": "锁定模块",
            "title1": "锁定模块在当前位置，不跟随滚动条变化位置",
            "statusScript": "Site.getLockStatus2('module320');",
            "evalScript": "Site.lock2('module320');"
          },
          {
            "display": "icon",
            "iconClass1": "sidem",
            "text1": "侧停模块",
            "title1": "侧边停靠收起模块，支持鼠标移入自动展开",
            "statusScript": "Site.getSideStatus2('module320');",
            "evalScript": "Site.sideModule2('module320');"
          },
          {
            "display": "icon",
            "iconClass1": "flutterm",
            "text1": "飘动模块",
            "title1": "飘动模块,按照轨迹飘动",
            "statusScript": "Site.getFlutterStatus('module320');",
            "evalScript": "Site.flutter('module320');"
          },
          {
            "hrLine": true
          },
          {
            "display": "icon",
            "text": "设为全站模块",
            "title": "把模块添加到整个网站的所有栏目中",
            "iconClass": "global",
            "evalScript": "Site.setGlobalModule(320, true);",
            "statusScript": "Site.getLayoutItemStatus('module320');"
          },
          {
            "display": "icon",
            "text": "加到指定栏目",
            "title": "把模块添加到指定栏目中",
            "iconClass": "apply",
            "evalScript": "Site.applyModuleTo(320);",
            "statusScript": "Site.getLayoutItemStatus('module320');"
          }]
        }], [{
          "display": "icon",
          "text": "隐藏模块",
          "title": "隐藏模块",
          "iconClass": "close",
          "evalScript": "Site.hideModule(320, false);"
        },
        {
          "display": "icon",
          "text": "隐藏标题栏与背景样式",
          "title": "隐藏标题栏与背景样式",
          "iconClass": "clearTB",
          "statusScript": "Site.getOneKeySetModuleTBStatus('module320');",
          "evalScript": "Site.oneKeySetModuleTB(320, true);",
          "setTB": "1"
        },
        {
          "display": "icon",
          "iconClass1": "add",
          "text1": "添加模块",
          "title1": "添加模块",
          "statusScript": "Site.getOpenAddModuleStatus('module320');",
          "evalScript": "Site.openAddModule(320)"
        },
        {
          "display": "icon",
          "iconClass1": "mzindex",
          "text1": "浮到最前",
          "title1": "把模块浮到最前区域",
          "statusScript": "Site.getAbsZIndexStatus('module320');",
          "evalScript": "Site.absZIndexModule('module320');"
        }], [{
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "上移模块",
          "title1": "上移模块",
          "statusScript": "Site.getModulePosTop('module320');",
          "evalScript": "Site.moveModulePosTop('module320');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "下移模块",
          "title1": "下移模块",
          "statusScript": "Site.getModulePosBottom('module320');",
          "evalScript": "Site.moveModulePosBottom('module320');"
        },
        {
          "display": "icon",
          "iconClass1": "mleft",
          "fixClass": "littleBtn",
          "text1": "左移模块",
          "title1": "左移模块",
          "statusScript": "Site.getModulePosLeft('module320');",
          "evalScript": "Site.moveModulePosLeft('module320');"
        },
        {
          "display": "icon",
          "iconClass1": "mright",
          "fixClass": "littleBtn",
          "text1": "右移模块",
          "title1": "右移模块",
          "statusScript": "Site.getModulePosRight('module320');",
          "evalScript": "Site.moveModulePosRight('module320');"
        },
        {
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "跳到中间",
          "title1": "把模块跳到中间区域",
          "statusScript": "Site.getAbsMiddleStatus('module320');",
          "evalScript": "Site.absMiddleModule('module320');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "跳到底部",
          "title1": "把模块跳到底部区域",
          "statusScript": "Site.getAbsBottomStatus('module320');",
          "evalScript": "Site.absBottomModule('module320');"
        }]);

        Site.loadPhotoList(314, true, true, 8);
        Site.functionInterface({
          "name": "ImageEffect.FUNC.BASIC.Init",
          "callMethod": true
        },
        {
          "moduleId": 314,
          "imgEffOption": {
            "effType": 8,
            "borderType": false,
            "borderColor": "#000",
            "borderWidth": 1,
            "borderStyle": 1,
            "style": 4,
            "fullMaskCusBg": false,
            "fullMaskCusName": false,
            "fullMaskCusDisc": false,
            "fullMaskOpenDisc": false
          },
          "tagetOption": {
            "nameHidden": true,
            "nameWordWrap": true,
            "targetParent": "photoForm",
            "target": "imgDiv"
          },
          "callback": Site.createImageEffectContent_photo,
          "callbackArgs": []
        });
        Site.initModulePhotoListItemManage({
          'photoParent': 'photoForms314',
          'photo': 'photoForm',
          'photoChild': 'imgDiv',
          'moduleId': 314,
          'groupId': 2,
          'groupName': '能做',
          'isOpenImgEff': true
        });
        Site.initModuleLayer(314, [{
          "text": "编辑模块",
          "title": "编辑图册展示模块",
          "evalScript": "Site.popupWindow({title:'编辑图册展示模块', frameSrcUrl:'manage/photoModuleEdit.jsp?id=314&colId=2&extId=0&ram='+Math.random(), width:'600', height:'555', frameScrolling:'auto', saveBeforePopup:false});"
        },
        {
          "display": "icon",
          "iconClass": "bannerAndBorder",
          "text": "设置样式",
          "title": "设置模块标题栏、边框等样式",
          "evalScript": "Site.functionInterface({'name':'faiSettingPanel.init', 'prompt':true}, {'id':314, 'styleId':4, 'entrance':0});Site.removeAllEditLayer();return false;"
        },
        {
          "text": "编辑图册",
          "title": "编辑图片相册内容",
          "evalScript": "Site.popupWindow({title:'编辑图册', frameSrcUrl:'manage/photoGroupEdit.jsp?id=2&ram='+Math.random(),  width:'750', height:'560', frameScrolling:'auto', beforePopup:true});"
        },
        {
          "text": "高级",
          "title": "",
          "className": "setItem",
          "menu": [{
            "display": "icon",
            "iconClass1": "dockModule",
            "text1": "停靠模块",
            "title1": "把模块停靠回固定区域",
            "statusScript": "Site.getDockStatus2('module314');",
            "evalScript": "Site.dock2('module314');"
          },
          {
            "display": "icon",
            "iconClass1": "absModule",
            "text1": "浮动模块",
            "title1": "浮动模块，可随意摆放位置",
            "statusScript": "Site.getAbsStatus2('module314');",
            "evalScript": "Site.floatOut2('module314');"
          },
          {
            "display": "icon",
            "iconClass1": "lock",
            "text1": "锁定模块",
            "title1": "锁定模块在当前位置，不跟随滚动条变化位置",
            "statusScript": "Site.getLockStatus2('module314');",
            "evalScript": "Site.lock2('module314');"
          },
          {
            "display": "icon",
            "iconClass1": "sidem",
            "text1": "侧停模块",
            "title1": "侧边停靠收起模块，支持鼠标移入自动展开",
            "statusScript": "Site.getSideStatus2('module314');",
            "evalScript": "Site.sideModule2('module314');"
          },
          {
            "display": "icon",
            "iconClass1": "flutterm",
            "text1": "飘动模块",
            "title1": "飘动模块,按照轨迹飘动",
            "statusScript": "Site.getFlutterStatus('module314');",
            "evalScript": "Site.flutter('module314');"
          },
          {
            "hrLine": true
          },
          {
            "display": "icon",
            "text": "设为全站模块",
            "title": "把模块添加到整个网站的所有栏目中",
            "iconClass": "global",
            "evalScript": "Site.setGlobalModule(314, true);",
            "statusScript": "Site.getLayoutItemStatus('module314');"
          },
          {
            "display": "icon",
            "text": "加到指定栏目",
            "title": "把模块添加到指定栏目中",
            "iconClass": "apply",
            "evalScript": "Site.applyModuleTo(314);",
            "statusScript": "Site.getLayoutItemStatus('module314');"
          }]
        }], [{
          "display": "icon",
          "text": "隐藏模块",
          "title": "隐藏模块",
          "iconClass": "close",
          "evalScript": "Site.hideModule(314, false);"
        },
        {
          "display": "icon",
          "text": "隐藏标题栏与背景样式",
          "title": "隐藏标题栏与背景样式",
          "iconClass": "clearTB",
          "statusScript": "Site.getOneKeySetModuleTBStatus('module314');",
          "evalScript": "Site.oneKeySetModuleTB(314, true);",
          "setTB": "1"
        },
        {
          "display": "icon",
          "iconClass1": "add",
          "text1": "添加模块",
          "title1": "添加模块",
          "statusScript": "Site.getOpenAddModuleStatus('module314');",
          "evalScript": "Site.openAddModule(314)"
        },
        {
          "display": "icon",
          "iconClass1": "mzindex",
          "text1": "浮到最前",
          "title1": "把模块浮到最前区域",
          "statusScript": "Site.getAbsZIndexStatus('module314');",
          "evalScript": "Site.absZIndexModule('module314');"
        }], [{
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "上移模块",
          "title1": "上移模块",
          "statusScript": "Site.getModulePosTop('module314');",
          "evalScript": "Site.moveModulePosTop('module314');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "下移模块",
          "title1": "下移模块",
          "statusScript": "Site.getModulePosBottom('module314');",
          "evalScript": "Site.moveModulePosBottom('module314');"
        },
        {
          "display": "icon",
          "iconClass1": "mleft",
          "fixClass": "littleBtn",
          "text1": "左移模块",
          "title1": "左移模块",
          "statusScript": "Site.getModulePosLeft('module314');",
          "evalScript": "Site.moveModulePosLeft('module314');"
        },
        {
          "display": "icon",
          "iconClass1": "mright",
          "fixClass": "littleBtn",
          "text1": "右移模块",
          "title1": "右移模块",
          "statusScript": "Site.getModulePosRight('module314');",
          "evalScript": "Site.moveModulePosRight('module314');"
        },
        {
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "跳到中间",
          "title1": "把模块跳到中间区域",
          "statusScript": "Site.getAbsMiddleStatus('module314');",
          "evalScript": "Site.absMiddleModule('module314');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "跳到底部",
          "title1": "把模块跳到底部区域",
          "statusScript": "Site.getAbsBottomStatus('module314');",
          "evalScript": "Site.absBottomModule('module314');"
        }]);

        Site.loadNewsList(307);
        Site.initModuleNewsListItemManage({
          'newsParent': 'newsList307',
          'news': 'line',
          'newsChild': 'lineBody',
          'moduleId': 307,
          'imgMaxSize': '5',
          'frameSrcUrl': 'manage/newsEdit.jsp?ram=' + Math.random()
        });
        Site.initMixNews({
          moduleId: 307,
          leader: '0'
        });
        Site.initModuleLayer(307, [{
          "text": "编辑模块",
          "title": "编辑文章列表模块",
          "evalScript": "Site.popupWindow({title:'编辑文章列表模块', frameSrcUrl:'manage/newsModuleEdit.jsp?id=307&colId=2&extId=0&ram='+Math.random(), width:'600', height:'495', saveBeforePopup:false});"
        },
        {
          "display": "icon",
          "iconClass": "bannerAndBorder",
          "text": "设置样式",
          "title": "设置模块标题栏、边框等样式",
          "evalScript": "Site.functionInterface({'name':'faiSettingPanel.init', 'prompt':true}, {'id':307, 'styleId':7, 'entrance':0});Site.removeAllEditLayer();return false;"
        },
        {
          "text": "添加文章",
          "evalScript": "Site.popupWindow({title:'添加文章', frameSrcUrl:'manage/newsEdit.jsp?mGroupTypeIds=[1]&ram='+Math.random(), callArgs:'newsList',  closeFunc:Site.afterAddNews, width:700, height:520, beforePopup:true});"
        },
        {
          "text": "高级",
          "title": "",
          "className": "setItem",
          "menu": [{
            "display": "icon",
            "iconClass1": "dockModule",
            "text1": "停靠模块",
            "title1": "把模块停靠回固定区域",
            "statusScript": "Site.getDockStatus2('module307');",
            "evalScript": "Site.dock2('module307');"
          },
          {
            "display": "icon",
            "iconClass1": "absModule",
            "text1": "浮动模块",
            "title1": "浮动模块，可随意摆放位置",
            "statusScript": "Site.getAbsStatus2('module307');",
            "evalScript": "Site.floatOut2('module307');"
          },
          {
            "display": "icon",
            "iconClass1": "lock",
            "text1": "锁定模块",
            "title1": "锁定模块在当前位置，不跟随滚动条变化位置",
            "statusScript": "Site.getLockStatus2('module307');",
            "evalScript": "Site.lock2('module307');"
          },
          {
            "display": "icon",
            "iconClass1": "sidem",
            "text1": "侧停模块",
            "title1": "侧边停靠收起模块，支持鼠标移入自动展开",
            "statusScript": "Site.getSideStatus2('module307');",
            "evalScript": "Site.sideModule2('module307');"
          },
          {
            "display": "icon",
            "iconClass1": "flutterm",
            "text1": "飘动模块",
            "title1": "飘动模块,按照轨迹飘动",
            "statusScript": "Site.getFlutterStatus('module307');",
            "evalScript": "Site.flutter('module307');"
          },
          {
            "hrLine": true
          },
          {
            "display": "icon",
            "text": "设为全站模块",
            "title": "把模块添加到整个网站的所有栏目中",
            "iconClass": "global",
            "evalScript": "Site.setGlobalModule(307, true);",
            "statusScript": "Site.getLayoutItemStatus('module307');"
          },
          {
            "display": "icon",
            "text": "加到指定栏目",
            "title": "把模块添加到指定栏目中",
            "iconClass": "apply",
            "evalScript": "Site.applyModuleTo(307);",
            "statusScript": "Site.getLayoutItemStatus('module307');"
          }]
        }], [{
          "display": "icon",
          "text": "隐藏模块",
          "title": "隐藏模块",
          "iconClass": "close",
          "evalScript": "Site.hideModule(307, false);"
        },
        {
          "display": "icon",
          "text": "隐藏标题栏与背景样式",
          "title": "隐藏标题栏与背景样式",
          "iconClass": "clearTB",
          "statusScript": "Site.getOneKeySetModuleTBStatus('module307');",
          "evalScript": "Site.oneKeySetModuleTB(307, true);",
          "setTB": "1"
        },
        {
          "display": "icon",
          "iconClass1": "add",
          "text1": "添加模块",
          "title1": "添加模块",
          "statusScript": "Site.getOpenAddModuleStatus('module307');",
          "evalScript": "Site.openAddModule(307)"
        },
        {
          "display": "icon",
          "iconClass1": "mzindex",
          "text1": "浮到最前",
          "title1": "把模块浮到最前区域",
          "statusScript": "Site.getAbsZIndexStatus('module307');",
          "evalScript": "Site.absZIndexModule('module307');"
        }], [{
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "上移模块",
          "title1": "上移模块",
          "statusScript": "Site.getModulePosTop('module307');",
          "evalScript": "Site.moveModulePosTop('module307');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "下移模块",
          "title1": "下移模块",
          "statusScript": "Site.getModulePosBottom('module307');",
          "evalScript": "Site.moveModulePosBottom('module307');"
        },
        {
          "display": "icon",
          "iconClass1": "mleft",
          "fixClass": "littleBtn",
          "text1": "左移模块",
          "title1": "左移模块",
          "statusScript": "Site.getModulePosLeft('module307');",
          "evalScript": "Site.moveModulePosLeft('module307');"
        },
        {
          "display": "icon",
          "iconClass1": "mright",
          "fixClass": "littleBtn",
          "text1": "右移模块",
          "title1": "右移模块",
          "statusScript": "Site.getModulePosRight('module307');",
          "evalScript": "Site.moveModulePosRight('module307');"
        },
        {
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "跳到中间",
          "title1": "把模块跳到中间区域",
          "statusScript": "Site.getAbsMiddleStatus('module307');",
          "evalScript": "Site.absMiddleModule('module307');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "跳到底部",
          "title1": "把模块跳到底部区域",
          "statusScript": "Site.getAbsBottomStatus('module307');",
          "evalScript": "Site.absBottomModule('module307');"
        }]);

        Site.loadNewsList(315);
        Site.initModuleNewsListItemManage({
          'newsParent': 'newsList315',
          'news': 'line',
          'newsChild': 'lineBody',
          'moduleId': 315,
          'imgMaxSize': '5',
          'frameSrcUrl': 'manage/newsEdit.jsp?ram=' + Math.random()
        });
        Site.initMixNews({
          moduleId: 315,
          leader: '0'
        });
        Site.initModuleLayer(315, [{
          "text": "编辑模块",
          "title": "编辑文章列表模块",
          "evalScript": "Site.popupWindow({title:'编辑文章列表模块', frameSrcUrl:'manage/newsModuleEdit.jsp?id=315&colId=2&extId=0&ram='+Math.random(), width:'600', height:'495', saveBeforePopup:false});"
        },
        {
          "display": "icon",
          "iconClass": "bannerAndBorder",
          "text": "设置样式",
          "title": "设置模块标题栏、边框等样式",
          "evalScript": "Site.functionInterface({'name':'faiSettingPanel.init', 'prompt':true}, {'id':315, 'styleId':7, 'entrance':0});Site.removeAllEditLayer();return false;"
        },
        {
          "text": "添加文章",
          "evalScript": "Site.popupWindow({title:'添加文章', frameSrcUrl:'manage/newsEdit.jsp?mGroupTypeIds=[2]&ram='+Math.random(), callArgs:'newsList',  closeFunc:Site.afterAddNews, width:700, height:520, beforePopup:true});"
        },
        {
          "text": "高级",
          "title": "",
          "className": "setItem",
          "menu": [{
            "display": "icon",
            "iconClass1": "dockModule",
            "text1": "停靠模块",
            "title1": "把模块停靠回固定区域",
            "statusScript": "Site.getDockStatus2('module315');",
            "evalScript": "Site.dock2('module315');"
          },
          {
            "display": "icon",
            "iconClass1": "absModule",
            "text1": "浮动模块",
            "title1": "浮动模块，可随意摆放位置",
            "statusScript": "Site.getAbsStatus2('module315');",
            "evalScript": "Site.floatOut2('module315');"
          },
          {
            "display": "icon",
            "iconClass1": "lock",
            "text1": "锁定模块",
            "title1": "锁定模块在当前位置，不跟随滚动条变化位置",
            "statusScript": "Site.getLockStatus2('module315');",
            "evalScript": "Site.lock2('module315');"
          },
          {
            "display": "icon",
            "iconClass1": "sidem",
            "text1": "侧停模块",
            "title1": "侧边停靠收起模块，支持鼠标移入自动展开",
            "statusScript": "Site.getSideStatus2('module315');",
            "evalScript": "Site.sideModule2('module315');"
          },
          {
            "display": "icon",
            "iconClass1": "flutterm",
            "text1": "飘动模块",
            "title1": "飘动模块,按照轨迹飘动",
            "statusScript": "Site.getFlutterStatus('module315');",
            "evalScript": "Site.flutter('module315');"
          },
          {
            "hrLine": true
          },
          {
            "display": "icon",
            "text": "设为全站模块",
            "title": "把模块添加到整个网站的所有栏目中",
            "iconClass": "global",
            "evalScript": "Site.setGlobalModule(315, true);",
            "statusScript": "Site.getLayoutItemStatus('module315');"
          },
          {
            "display": "icon",
            "text": "加到指定栏目",
            "title": "把模块添加到指定栏目中",
            "iconClass": "apply",
            "evalScript": "Site.applyModuleTo(315);",
            "statusScript": "Site.getLayoutItemStatus('module315');"
          }]
        }], [{
          "display": "icon",
          "text": "隐藏模块",
          "title": "隐藏模块",
          "iconClass": "close",
          "evalScript": "Site.hideModule(315, false);"
        },
        {
          "display": "icon",
          "text": "隐藏标题栏与背景样式",
          "title": "隐藏标题栏与背景样式",
          "iconClass": "clearTB",
          "statusScript": "Site.getOneKeySetModuleTBStatus('module315');",
          "evalScript": "Site.oneKeySetModuleTB(315, true);",
          "setTB": "1"
        },
        {
          "display": "icon",
          "iconClass1": "add",
          "text1": "添加模块",
          "title1": "添加模块",
          "statusScript": "Site.getOpenAddModuleStatus('module315');",
          "evalScript": "Site.openAddModule(315)"
        },
        {
          "display": "icon",
          "iconClass1": "mzindex",
          "text1": "浮到最前",
          "title1": "把模块浮到最前区域",
          "statusScript": "Site.getAbsZIndexStatus('module315');",
          "evalScript": "Site.absZIndexModule('module315');"
        }], [{
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "上移模块",
          "title1": "上移模块",
          "statusScript": "Site.getModulePosTop('module315');",
          "evalScript": "Site.moveModulePosTop('module315');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "下移模块",
          "title1": "下移模块",
          "statusScript": "Site.getModulePosBottom('module315');",
          "evalScript": "Site.moveModulePosBottom('module315');"
        },
        {
          "display": "icon",
          "iconClass1": "mleft",
          "fixClass": "littleBtn",
          "text1": "左移模块",
          "title1": "左移模块",
          "statusScript": "Site.getModulePosLeft('module315');",
          "evalScript": "Site.moveModulePosLeft('module315');"
        },
        {
          "display": "icon",
          "iconClass1": "mright",
          "fixClass": "littleBtn",
          "text1": "右移模块",
          "title1": "右移模块",
          "statusScript": "Site.getModulePosRight('module315');",
          "evalScript": "Site.moveModulePosRight('module315');"
        },
        {
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "跳到中间",
          "title1": "把模块跳到中间区域",
          "statusScript": "Site.getAbsMiddleStatus('module315');",
          "evalScript": "Site.absMiddleModule('module315');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "跳到底部",
          "title1": "把模块跳到底部区域",
          "statusScript": "Site.getAbsBottomStatus('module315');",
          "evalScript": "Site.absBottomModule('module315');"
        }]);

        Site.bindInMulColResizableModule(316);
        Site.initMulColModuleInIE('#module316');
        Site.initModuleLayer(316, [{
          "text": "编辑模块列",
          "title": "编辑模块列模块",
          "evalScript": "Site.popupWindow({title:'编辑模块列模块', frameSrcUrl:'manage/mulModuleColEdit.jsp?id=316&colId=2&extId=0&ram='+Math.random(), width:'585', height:'280', saveBeforePopup:false});"
        },
        {
          "text": "模块列样式",
          "title": "设置模块列样式",
          "iconClass": "mulColStyle",
          "evalScript": "Site.popupWindow({title:'设置模块列样式', frameSrcUrl:'manage/mulModuleColStyleSetting.jsp?id=316&colId=2&extId=0&ram='+Math.random(), width:'485', height:'305', saveBeforePopup:false});"
        },
        {
          "text": "高级",
          "title": "",
          "className": "setItem",
          "menu": [{
            "display": "icon",
            "iconClass": "bannerAndBorder",
            "text": "设置样式",
            "title": "设置模块标题栏、边框等样式",
            "evalScript": "Site.functionInterface({'name':'faiSettingPanel.init', 'prompt':true}, {'id':316, 'styleId':35, 'entrance':0});Site.removeAllEditLayer();return false;"
          },
          {
            "hrLine": true
          },
          {
            "display": "icon",
            "iconClass1": "dockModule",
            "text1": "停靠模块",
            "title1": "把模块停靠回固定区域",
            "statusScript": "Site.getDockStatus2('module316');",
            "evalScript": "Site.dock2('module316');"
          },
          {
            "display": "icon",
            "iconClass1": "absModule",
            "text1": "浮动模块",
            "title1": "浮动模块，可随意摆放位置",
            "statusScript": "Site.getAbsStatus2('module316');",
            "evalScript": "Site.floatOut2('module316');"
          },
          {
            "display": "icon",
            "iconClass1": "lock",
            "text1": "锁定模块",
            "title1": "锁定模块在当前位置，不跟随滚动条变化位置",
            "statusScript": "Site.getLockStatus2('module316');",
            "evalScript": "Site.lock2('module316');"
          },
          {
            "display": "icon",
            "iconClass1": "sidem",
            "text1": "侧停模块",
            "title1": "侧边停靠收起模块，支持鼠标移入自动展开",
            "statusScript": "Site.getSideStatus2('module316');",
            "evalScript": "Site.sideModule2('module316');"
          },
          {
            "display": "icon",
            "iconClass1": "flutterm",
            "text1": "飘动模块",
            "title1": "飘动模块,按照轨迹飘动",
            "statusScript": "Site.getFlutterStatus('module316');",
            "evalScript": "Site.flutter('module316');"
          },
          {
            "hrLine": true
          },
          {
            "display": "icon",
            "text": "设为全站模块",
            "title": "把模块添加到整个网站的所有栏目中",
            "iconClass": "global",
            "evalScript": "Site.setGlobalModule(316, true);",
            "statusScript": "Site.getLayoutItemStatus('module316');"
          },
          {
            "display": "icon",
            "text": "加到指定栏目",
            "title": "把模块添加到指定栏目中",
            "iconClass": "apply",
            "evalScript": "Site.applyModuleTo(316);",
            "statusScript": "Site.getLayoutItemStatus('module316');"
          }]
        }], [{
          "display": "icon",
          "text": "隐藏模块",
          "title": "隐藏模块",
          "iconClass": "close",
          "evalScript": "Site.hideModule(316, false);"
        },
        {
          "display": "icon",
          "text": "隐藏标题栏与背景样式",
          "title": "隐藏标题栏与背景样式",
          "iconClass": "clearTB",
          "statusScript": "Site.getOneKeySetModuleTBStatus('module316');",
          "evalScript": "Site.oneKeySetModuleTB(316, true);",
          "setTB": "1"
        },
        {
          "display": "icon",
          "iconClass1": "add",
          "text1": "添加模块",
          "title1": "添加模块",
          "statusScript": "Site.getOpenAddModuleStatus('module316');",
          "evalScript": "Site.openAddModule(316)"
        },
        {
          "display": "icon",
          "iconClass1": "mzindex",
          "text1": "浮到最前",
          "title1": "把模块浮到最前区域",
          "statusScript": "Site.getAbsZIndexStatus('module316');",
          "evalScript": "Site.absZIndexModule('module316');"
        }], [{
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "上移模块",
          "title1": "上移模块",
          "statusScript": "Site.getModulePosTop('module316');",
          "evalScript": "Site.moveModulePosTop('module316');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "下移模块",
          "title1": "下移模块",
          "statusScript": "Site.getModulePosBottom('module316');",
          "evalScript": "Site.moveModulePosBottom('module316');"
        },
        {
          "display": "icon",
          "iconClass1": "mleft",
          "fixClass": "littleBtn",
          "text1": "左移模块",
          "title1": "左移模块",
          "statusScript": "Site.getModulePosLeft('module316');",
          "evalScript": "Site.moveModulePosLeft('module316');"
        },
        {
          "display": "icon",
          "iconClass1": "mright",
          "fixClass": "littleBtn",
          "text1": "右移模块",
          "title1": "右移模块",
          "statusScript": "Site.getModulePosRight('module316');",
          "evalScript": "Site.moveModulePosRight('module316');"
        },
        {
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "跳到中间",
          "title1": "把模块跳到中间区域",
          "statusScript": "Site.getAbsMiddleStatus('module316');",
          "evalScript": "Site.absMiddleModule('module316');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "跳到底部",
          "title1": "把模块跳到底部区域",
          "statusScript": "Site.getAbsBottomStatus('module316');",
          "evalScript": "Site.absBottomModule('module316');"
        }]);

        Site.hoverChangeImage();
        Site.hoverStyle();
        Site.initModuleLayer(455, [{
          "text": "编辑模块",
          "title": "编辑图文展示模块",
          "evalScript": "Site.popupWindow({title:'编辑图文展示模块', frameSrcUrl:'manage/richEdit.jsp?id=455&colId=2&extId=0&ram='+Math.random(), width:'830', height:'500', saveBeforePopup:false});"
        },
        {
          "display": "icon",
          "iconClass": "bannerAndBorder",
          "text": "设置样式",
          "title": "设置模块标题栏、边框等样式",
          "evalScript": "Site.functionInterface({'name':'faiSettingPanel.init', 'prompt':true}, {'id':455, 'styleId':1, 'entrance':0});Site.removeAllEditLayer();return false;"
        },
        {
          "text": "高级",
          "title": "",
          "className": "setItem",
          "menu": [{
            "display": "icon",
            "iconClass1": "dockModule",
            "text1": "停靠模块",
            "title1": "把模块停靠回固定区域",
            "statusScript": "Site.getDockStatus2('module455');",
            "evalScript": "Site.dock2('module455');"
          },
          {
            "display": "icon",
            "iconClass1": "absModule",
            "text1": "浮动模块",
            "title1": "浮动模块，可随意摆放位置",
            "statusScript": "Site.getAbsStatus2('module455');",
            "evalScript": "Site.floatOut2('module455');"
          },
          {
            "display": "icon",
            "iconClass1": "lock",
            "text1": "锁定模块",
            "title1": "锁定模块在当前位置，不跟随滚动条变化位置",
            "statusScript": "Site.getLockStatus2('module455');",
            "evalScript": "Site.lock2('module455');"
          },
          {
            "display": "icon",
            "iconClass1": "sidem",
            "text1": "侧停模块",
            "title1": "侧边停靠收起模块，支持鼠标移入自动展开",
            "statusScript": "Site.getSideStatus2('module455');",
            "evalScript": "Site.sideModule2('module455');"
          },
          {
            "display": "icon",
            "iconClass1": "flutterm",
            "text1": "飘动模块",
            "title1": "飘动模块,按照轨迹飘动",
            "statusScript": "Site.getFlutterStatus('module455');",
            "evalScript": "Site.flutter('module455');"
          },
          {
            "hrLine": true
          },
          {
            "display": "icon",
            "text": "设为全站模块",
            "title": "把模块添加到整个网站的所有栏目中",
            "iconClass": "global",
            "evalScript": "Site.setGlobalModule(455, true);",
            "statusScript": "Site.getLayoutItemStatus('module455');"
          },
          {
            "display": "icon",
            "text": "加到指定栏目",
            "title": "把模块添加到指定栏目中",
            "iconClass": "apply",
            "evalScript": "Site.applyModuleTo(455);",
            "statusScript": "Site.getLayoutItemStatus('module455');"
          }]
        }], [{
          "display": "icon",
          "text": "隐藏模块",
          "title": "隐藏模块",
          "iconClass": "close",
          "evalScript": "Site.hideModule(455, false);"
        },
        {
          "display": "icon",
          "text": "隐藏标题栏与背景样式",
          "title": "隐藏标题栏与背景样式",
          "iconClass": "clearTB",
          "statusScript": "Site.getOneKeySetModuleTBStatus('module455');",
          "evalScript": "Site.oneKeySetModuleTB(455, true);",
          "setTB": "1"
        },
        {
          "display": "icon",
          "iconClass1": "add",
          "text1": "添加模块",
          "title1": "添加模块",
          "statusScript": "Site.getOpenAddModuleStatus('module455');",
          "evalScript": "Site.openAddModule(455)"
        },
        {
          "display": "icon",
          "iconClass1": "mzindex",
          "text1": "浮到最前",
          "title1": "把模块浮到最前区域",
          "statusScript": "Site.getAbsZIndexStatus('module455');",
          "evalScript": "Site.absZIndexModule('module455');"
        }], [{
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "上移模块",
          "title1": "上移模块",
          "statusScript": "Site.getModulePosTop('module455');",
          "evalScript": "Site.moveModulePosTop('module455');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "下移模块",
          "title1": "下移模块",
          "statusScript": "Site.getModulePosBottom('module455');",
          "evalScript": "Site.moveModulePosBottom('module455');"
        },
        {
          "display": "icon",
          "iconClass1": "mleft",
          "fixClass": "littleBtn",
          "text1": "左移模块",
          "title1": "左移模块",
          "statusScript": "Site.getModulePosLeft('module455');",
          "evalScript": "Site.moveModulePosLeft('module455');"
        },
        {
          "display": "icon",
          "iconClass1": "mright",
          "fixClass": "littleBtn",
          "text1": "右移模块",
          "title1": "右移模块",
          "statusScript": "Site.getModulePosRight('module455');",
          "evalScript": "Site.moveModulePosRight('module455');"
        },
        {
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "跳到中间",
          "title1": "把模块跳到中间区域",
          "statusScript": "Site.getAbsMiddleStatus('module455');",
          "evalScript": "Site.absMiddleModule('module455');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "跳到底部",
          "title1": "把模块跳到底部区域",
          "statusScript": "Site.getAbsBottomStatus('module455');",
          "evalScript": "Site.absBottomModule('module455');"
        }]);

        $('#pagenation457').find('a').hover(function() {
          $(this).addClass('g_hover')
        },
        function() {
          $(this).removeClass('g_hover')
        });
        Site.loadPhotoList(457, true, false, 3);
        Site.functionInterface({
          "name": "ImageEffect.FUNC.BASIC.Init",
          "callMethod": true
        },
        {
          "moduleId": 457,
          "imgEffOption": {
            "effType": 3,
            "borderType": false,
            "borderColor": "#000",
            "borderWidth": 1,
            "borderStyle": 1,
            "style": 4,
            "fullMaskCusBg": false,
            "fullMaskCusName": false,
            "fullMaskCusDisc": false,
            "fullMaskOpenDisc": false
          },
          "tagetOption": {
            "nameHidden": false,
            "nameWordWrap": true,
            "targetParent": "photoForm",
            "target": "imgDiv"
          },
          "callback": Site.createImageEffectContent_photo,
          "callbackArgs": []
        });
        Site.initModulePhotoListItemManage({
          'photoParent': 'photoForms457',
          'photo': 'photoForm',
          'photoChild': 'imgDiv',
          'moduleId': 457,
          'groupId': 1,
          'groupName': '服务',
          'isOpenImgEff': true
        });
        Site.initModuleLayer(457, [{
          "text": "编辑模块",
          "title": "编辑图册展示模块",
          "evalScript": "Site.popupWindow({title:'编辑图册展示模块', frameSrcUrl:'manage/photoModuleEdit.jsp?id=457&colId=2&extId=0&ram='+Math.random(), width:'600', height:'555', frameScrolling:'auto', saveBeforePopup:false});"
        },
        {
          "display": "icon",
          "iconClass": "bannerAndBorder",
          "text": "设置样式",
          "title": "设置模块标题栏、边框等样式",
          "evalScript": "Site.functionInterface({'name':'faiSettingPanel.init', 'prompt':true}, {'id':457, 'styleId':4, 'entrance':0});Site.removeAllEditLayer();return false;"
        },
        {
          "text": "编辑图册",
          "title": "编辑图片相册内容",
          "evalScript": "Site.popupWindow({title:'编辑图册', frameSrcUrl:'manage/photoGroupEdit.jsp?id=1&ram='+Math.random(),  width:'750', height:'560', frameScrolling:'auto', beforePopup:true});"
        },
        {
          "text": "高级",
          "title": "",
          "className": "setItem",
          "menu": [{
            "display": "icon",
            "iconClass1": "dockModule",
            "text1": "停靠模块",
            "title1": "把模块停靠回固定区域",
            "statusScript": "Site.getDockStatus2('module457');",
            "evalScript": "Site.dock2('module457');"
          },
          {
            "display": "icon",
            "iconClass1": "absModule",
            "text1": "浮动模块",
            "title1": "浮动模块，可随意摆放位置",
            "statusScript": "Site.getAbsStatus2('module457');",
            "evalScript": "Site.floatOut2('module457');"
          },
          {
            "display": "icon",
            "iconClass1": "lock",
            "text1": "锁定模块",
            "title1": "锁定模块在当前位置，不跟随滚动条变化位置",
            "statusScript": "Site.getLockStatus2('module457');",
            "evalScript": "Site.lock2('module457');"
          },
          {
            "display": "icon",
            "iconClass1": "sidem",
            "text1": "侧停模块",
            "title1": "侧边停靠收起模块，支持鼠标移入自动展开",
            "statusScript": "Site.getSideStatus2('module457');",
            "evalScript": "Site.sideModule2('module457');"
          },
          {
            "display": "icon",
            "iconClass1": "flutterm",
            "text1": "飘动模块",
            "title1": "飘动模块,按照轨迹飘动",
            "statusScript": "Site.getFlutterStatus('module457');",
            "evalScript": "Site.flutter('module457');"
          },
          {
            "hrLine": true
          },
          {
            "display": "icon",
            "text": "设为全站模块",
            "title": "把模块添加到整个网站的所有栏目中",
            "iconClass": "global",
            "evalScript": "Site.setGlobalModule(457, true);",
            "statusScript": "Site.getLayoutItemStatus('module457');"
          },
          {
            "display": "icon",
            "text": "加到指定栏目",
            "title": "把模块添加到指定栏目中",
            "iconClass": "apply",
            "evalScript": "Site.applyModuleTo(457);",
            "statusScript": "Site.getLayoutItemStatus('module457');"
          }]
        }], [{
          "display": "icon",
          "text": "隐藏模块",
          "title": "隐藏模块",
          "iconClass": "close",
          "evalScript": "Site.hideModule(457, false);"
        },
        {
          "display": "icon",
          "text": "隐藏标题栏与背景样式",
          "title": "隐藏标题栏与背景样式",
          "iconClass": "clearTB",
          "statusScript": "Site.getOneKeySetModuleTBStatus('module457');",
          "evalScript": "Site.oneKeySetModuleTB(457, true);",
          "setTB": "1"
        },
        {
          "display": "icon",
          "iconClass1": "add",
          "text1": "添加模块",
          "title1": "添加模块",
          "statusScript": "Site.getOpenAddModuleStatus('module457');",
          "evalScript": "Site.openAddModule(457)"
        },
        {
          "display": "icon",
          "iconClass1": "mzindex",
          "text1": "浮到最前",
          "title1": "把模块浮到最前区域",
          "statusScript": "Site.getAbsZIndexStatus('module457');",
          "evalScript": "Site.absZIndexModule('module457');"
        }], [{
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "上移模块",
          "title1": "上移模块",
          "statusScript": "Site.getModulePosTop('module457');",
          "evalScript": "Site.moveModulePosTop('module457');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "下移模块",
          "title1": "下移模块",
          "statusScript": "Site.getModulePosBottom('module457');",
          "evalScript": "Site.moveModulePosBottom('module457');"
        },
        {
          "display": "icon",
          "iconClass1": "mleft",
          "fixClass": "littleBtn",
          "text1": "左移模块",
          "title1": "左移模块",
          "statusScript": "Site.getModulePosLeft('module457');",
          "evalScript": "Site.moveModulePosLeft('module457');"
        },
        {
          "display": "icon",
          "iconClass1": "mright",
          "fixClass": "littleBtn",
          "text1": "右移模块",
          "title1": "右移模块",
          "statusScript": "Site.getModulePosRight('module457');",
          "evalScript": "Site.moveModulePosRight('module457');"
        },
        {
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "跳到中间",
          "title1": "把模块跳到中间区域",
          "statusScript": "Site.getAbsMiddleStatus('module457');",
          "evalScript": "Site.absMiddleModule('module457');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "跳到底部",
          "title1": "把模块跳到底部区域",
          "statusScript": "Site.getAbsBottomStatus('module457');",
          "evalScript": "Site.absBottomModule('module457');"
        }]);

        Site.loadNewsList(458);
        Site.initModuleNewsListItemManage({
          'newsParent': 'newsList458',
          'news': 'line',
          'newsChild': 'lineBody',
          'moduleId': 458,
          'imgMaxSize': '5',
          'frameSrcUrl': 'manage/newsEdit.jsp?ram=' + Math.random()
        });
        Site.initMixNews({
          moduleId: 458,
          leader: '1'
        });
        Site.initModuleLayer(458, [{
          "text": "编辑模块",
          "title": "编辑文章列表模块",
          "evalScript": "Site.popupWindow({title:'编辑文章列表模块', frameSrcUrl:'manage/newsModuleEdit.jsp?id=458&colId=2&extId=0&ram='+Math.random(), width:'600', height:'495', saveBeforePopup:false});"
        },
        {
          "display": "icon",
          "iconClass": "bannerAndBorder",
          "text": "设置样式",
          "title": "设置模块标题栏、边框等样式",
          "evalScript": "Site.functionInterface({'name':'faiSettingPanel.init', 'prompt':true}, {'id':458, 'styleId':7, 'entrance':0});Site.removeAllEditLayer();return false;"
        },
        {
          "text": "添加文章",
          "evalScript": "Site.popupWindow({title:'添加文章', frameSrcUrl:'manage/newsEdit.jsp?mGroupTypeIds=[1]&ram='+Math.random(), callArgs:'newsList',  closeFunc:Site.afterAddNews, width:700, height:520, beforePopup:true});"
        },
        {
          "text": "高级",
          "title": "",
          "className": "setItem",
          "menu": [{
            "display": "icon",
            "iconClass1": "dockModule",
            "text1": "停靠模块",
            "title1": "把模块停靠回固定区域",
            "statusScript": "Site.getDockStatus2('module458');",
            "evalScript": "Site.dock2('module458');"
          },
          {
            "display": "icon",
            "iconClass1": "absModule",
            "text1": "浮动模块",
            "title1": "浮动模块，可随意摆放位置",
            "statusScript": "Site.getAbsStatus2('module458');",
            "evalScript": "Site.floatOut2('module458');"
          },
          {
            "display": "icon",
            "iconClass1": "lock",
            "text1": "锁定模块",
            "title1": "锁定模块在当前位置，不跟随滚动条变化位置",
            "statusScript": "Site.getLockStatus2('module458');",
            "evalScript": "Site.lock2('module458');"
          },
          {
            "display": "icon",
            "iconClass1": "sidem",
            "text1": "侧停模块",
            "title1": "侧边停靠收起模块，支持鼠标移入自动展开",
            "statusScript": "Site.getSideStatus2('module458');",
            "evalScript": "Site.sideModule2('module458');"
          },
          {
            "display": "icon",
            "iconClass1": "flutterm",
            "text1": "飘动模块",
            "title1": "飘动模块,按照轨迹飘动",
            "statusScript": "Site.getFlutterStatus('module458');",
            "evalScript": "Site.flutter('module458');"
          },
          {
            "hrLine": true
          },
          {
            "display": "icon",
            "text": "设为全站模块",
            "title": "把模块添加到整个网站的所有栏目中",
            "iconClass": "global",
            "evalScript": "Site.setGlobalModule(458, true);",
            "statusScript": "Site.getLayoutItemStatus('module458');"
          },
          {
            "display": "icon",
            "text": "加到指定栏目",
            "title": "把模块添加到指定栏目中",
            "iconClass": "apply",
            "evalScript": "Site.applyModuleTo(458);",
            "statusScript": "Site.getLayoutItemStatus('module458');"
          }]
        }], [{
          "display": "icon",
          "text": "隐藏模块",
          "title": "隐藏模块",
          "iconClass": "close",
          "evalScript": "Site.hideModule(458, false);"
        },
        {
          "display": "icon",
          "text": "隐藏标题栏与背景样式",
          "title": "隐藏标题栏与背景样式",
          "iconClass": "clearTB",
          "statusScript": "Site.getOneKeySetModuleTBStatus('module458');",
          "evalScript": "Site.oneKeySetModuleTB(458, true);",
          "setTB": "1"
        },
        {
          "display": "icon",
          "iconClass1": "add",
          "text1": "添加模块",
          "title1": "添加模块",
          "statusScript": "Site.getOpenAddModuleStatus('module458');",
          "evalScript": "Site.openAddModule(458)"
        },
        {
          "display": "icon",
          "iconClass1": "mzindex",
          "text1": "浮到最前",
          "title1": "把模块浮到最前区域",
          "statusScript": "Site.getAbsZIndexStatus('module458');",
          "evalScript": "Site.absZIndexModule('module458');"
        }], [{
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "上移模块",
          "title1": "上移模块",
          "statusScript": "Site.getModulePosTop('module458');",
          "evalScript": "Site.moveModulePosTop('module458');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "下移模块",
          "title1": "下移模块",
          "statusScript": "Site.getModulePosBottom('module458');",
          "evalScript": "Site.moveModulePosBottom('module458');"
        },
        {
          "display": "icon",
          "iconClass1": "mleft",
          "fixClass": "littleBtn",
          "text1": "左移模块",
          "title1": "左移模块",
          "statusScript": "Site.getModulePosLeft('module458');",
          "evalScript": "Site.moveModulePosLeft('module458');"
        },
        {
          "display": "icon",
          "iconClass1": "mright",
          "fixClass": "littleBtn",
          "text1": "右移模块",
          "title1": "右移模块",
          "statusScript": "Site.getModulePosRight('module458');",
          "evalScript": "Site.moveModulePosRight('module458');"
        },
        {
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "跳到中间",
          "title1": "把模块跳到中间区域",
          "statusScript": "Site.getAbsMiddleStatus('module458');",
          "evalScript": "Site.absMiddleModule('module458');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "跳到底部",
          "title1": "把模块跳到底部区域",
          "statusScript": "Site.getAbsBottomStatus('module458');",
          "evalScript": "Site.absBottomModule('module458');"
        }]);

        Site.saveNoticeMarqueeProps({
          id: '459',
          direction: 'left',
          loop: 'infinite',
          speed: 'normal',
          moveout: true,
          isScrolling: true,
          noticeType: 1
        });
        Site.noticeMarquee({
          id: '459',
          direction: 'left',
          loop: 'infinite',
          speed: 'normal',
          moveout: true,
          isScrolling: true,
          noticeType: 1
        });
        Site.initModuleLayer(459, [{
          "text": "编辑模块",
          "title": "编辑滚动公告模块",
          "evalScript": "Site.popupWindow({title:'编辑滚动公告模块', frameSrcUrl:'manage/noticeModuleEdit.jsp?id=459&colId=2&extId=0&ram='+Math.random(), width:'705', height:'345', saveBeforePopup:false});"
        },
        {
          "display": "icon",
          "iconClass": "bannerAndBorder",
          "text": "设置样式",
          "title": "设置模块标题栏、边框等样式",
          "evalScript": "Site.functionInterface({'name':'faiSettingPanel.init', 'prompt':true}, {'id':459, 'styleId':39, 'entrance':0});Site.removeAllEditLayer();return false;"
        },
        {
          "text": "高级",
          "title": "",
          "className": "setItem",
          "menu": [{
            "display": "icon",
            "iconClass1": "dockModule",
            "text1": "停靠模块",
            "title1": "把模块停靠回固定区域",
            "statusScript": "Site.getDockStatus2('module459');",
            "evalScript": "Site.dock2('module459');"
          },
          {
            "display": "icon",
            "iconClass1": "absModule",
            "text1": "浮动模块",
            "title1": "浮动模块，可随意摆放位置",
            "statusScript": "Site.getAbsStatus2('module459');",
            "evalScript": "Site.floatOut2('module459');"
          },
          {
            "display": "icon",
            "iconClass1": "lock",
            "text1": "锁定模块",
            "title1": "锁定模块在当前位置，不跟随滚动条变化位置",
            "statusScript": "Site.getLockStatus2('module459');",
            "evalScript": "Site.lock2('module459');"
          },
          {
            "display": "icon",
            "iconClass1": "sidem",
            "text1": "侧停模块",
            "title1": "侧边停靠收起模块，支持鼠标移入自动展开",
            "statusScript": "Site.getSideStatus2('module459');",
            "evalScript": "Site.sideModule2('module459');"
          },
          {
            "display": "icon",
            "iconClass1": "flutterm",
            "text1": "飘动模块",
            "title1": "飘动模块,按照轨迹飘动",
            "statusScript": "Site.getFlutterStatus('module459');",
            "evalScript": "Site.flutter('module459');"
          },
          {
            "hrLine": true
          },
          {
            "display": "icon",
            "text": "设为全站模块",
            "title": "把模块添加到整个网站的所有栏目中",
            "iconClass": "global",
            "evalScript": "Site.setGlobalModule(459, true);",
            "statusScript": "Site.getLayoutItemStatus('module459');"
          },
          {
            "display": "icon",
            "text": "加到指定栏目",
            "title": "把模块添加到指定栏目中",
            "iconClass": "apply",
            "evalScript": "Site.applyModuleTo(459);",
            "statusScript": "Site.getLayoutItemStatus('module459');"
          }]
        }], [{
          "display": "icon",
          "text": "隐藏模块",
          "title": "隐藏模块",
          "iconClass": "close",
          "evalScript": "Site.hideModule(459, false);"
        },
        {
          "display": "icon",
          "text": "隐藏标题栏与背景样式",
          "title": "隐藏标题栏与背景样式",
          "iconClass": "clearTB",
          "statusScript": "Site.getOneKeySetModuleTBStatus('module459');",
          "evalScript": "Site.oneKeySetModuleTB(459, true);",
          "setTB": "1"
        },
        {
          "display": "icon",
          "iconClass1": "add",
          "text1": "添加模块",
          "title1": "添加模块",
          "statusScript": "Site.getOpenAddModuleStatus('module459');",
          "evalScript": "Site.openAddModule(459)"
        },
        {
          "display": "icon",
          "iconClass1": "mzindex",
          "text1": "浮到最前",
          "title1": "把模块浮到最前区域",
          "statusScript": "Site.getAbsZIndexStatus('module459');",
          "evalScript": "Site.absZIndexModule('module459');"
        }], [{
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "上移模块",
          "title1": "上移模块",
          "statusScript": "Site.getModulePosTop('module459');",
          "evalScript": "Site.moveModulePosTop('module459');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "下移模块",
          "title1": "下移模块",
          "statusScript": "Site.getModulePosBottom('module459');",
          "evalScript": "Site.moveModulePosBottom('module459');"
        },
        {
          "display": "icon",
          "iconClass1": "mleft",
          "fixClass": "littleBtn",
          "text1": "左移模块",
          "title1": "左移模块",
          "statusScript": "Site.getModulePosLeft('module459');",
          "evalScript": "Site.moveModulePosLeft('module459');"
        },
        {
          "display": "icon",
          "iconClass1": "mright",
          "fixClass": "littleBtn",
          "text1": "右移模块",
          "title1": "右移模块",
          "statusScript": "Site.getModulePosRight('module459');",
          "evalScript": "Site.moveModulePosRight('module459');"
        },
        {
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "跳到中间",
          "title1": "把模块跳到中间区域",
          "statusScript": "Site.getAbsMiddleStatus('module459');",
          "evalScript": "Site.absMiddleModule('module459');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "跳到底部",
          "title1": "把模块跳到底部区域",
          "statusScript": "Site.getAbsBottomStatus('module459');",
          "evalScript": "Site.absBottomModule('module459');"
        }]);

        Site.initModuleLayer(308, [{
          "text": "编辑模块",
          "title": "编辑在线客服模块",
          "evalScript": "Site.popupWindow({title:'编辑在线客服模块', frameSrcUrl:'manage/serviceOnlineModuleEdit.jsp?id=308&colId=2&extId=0&ram='+Math.random(), width:'655', height:'340', saveBeforePopup:false});"
        },
        {
          "display": "icon",
          "iconClass": "bannerAndBorder",
          "text": "设置样式",
          "title": "设置模块标题栏、边框等样式",
          "evalScript": "Site.functionInterface({'name':'faiSettingPanel.init', 'prompt':true}, {'id':308, 'styleId':40, 'entrance':0});Site.removeAllEditLayer();return false;"
        },
        {
          "text": "高级",
          "title": "",
          "className": "setItem",
          "menu": [{
            "display": "icon",
            "iconClass1": "dockModule",
            "text1": "停靠模块",
            "title1": "把模块停靠回固定区域",
            "statusScript": "Site.getDockStatus2('module308');",
            "evalScript": "Site.dock2('module308');"
          },
          {
            "display": "icon",
            "iconClass1": "absModule",
            "text1": "浮动模块",
            "title1": "浮动模块，可随意摆放位置",
            "statusScript": "Site.getAbsStatus2('module308');",
            "evalScript": "Site.floatOut2('module308');"
          },
          {
            "display": "icon",
            "iconClass1": "lock",
            "text1": "锁定模块",
            "title1": "锁定模块在当前位置，不跟随滚动条变化位置",
            "statusScript": "Site.getLockStatus2('module308');",
            "evalScript": "Site.lock2('module308');"
          },
          {
            "display": "icon",
            "iconClass1": "sidem",
            "text1": "侧停模块",
            "title1": "侧边停靠收起模块，支持鼠标移入自动展开",
            "statusScript": "Site.getSideStatus2('module308');",
            "evalScript": "Site.sideModule2('module308');"
          },
          {
            "display": "icon",
            "iconClass1": "flutterm",
            "text1": "飘动模块",
            "title1": "飘动模块,按照轨迹飘动",
            "statusScript": "Site.getFlutterStatus('module308');",
            "evalScript": "Site.flutter('module308');"
          },
          {
            "hrLine": true
          },
          {
            "display": "icon",
            "text": "设为全站模块",
            "title": "把模块添加到整个网站的所有栏目中",
            "iconClass": "global",
            "evalScript": "Site.setGlobalModule(308, true);",
            "statusScript": "Site.getLayoutItemStatus('module308');"
          },
          {
            "display": "icon",
            "text": "加到指定栏目",
            "title": "把模块添加到指定栏目中",
            "iconClass": "apply",
            "evalScript": "Site.applyModuleTo(308);",
            "statusScript": "Site.getLayoutItemStatus('module308');"
          }]
        }], [{
          "display": "icon",
          "text": "隐藏模块",
          "title": "隐藏模块",
          "iconClass": "close",
          "evalScript": "Site.hideModule(308, false);"
        },
        {
          "display": "icon",
          "text": "隐藏标题栏与背景样式",
          "title": "隐藏标题栏与背景样式",
          "iconClass": "clearTB",
          "statusScript": "Site.getOneKeySetModuleTBStatus('module308');",
          "evalScript": "Site.oneKeySetModuleTB(308, true);",
          "setTB": "1"
        },
        {
          "display": "icon",
          "iconClass1": "add",
          "text1": "添加模块",
          "title1": "添加模块",
          "statusScript": "Site.getOpenAddModuleStatus('module308');",
          "evalScript": "Site.openAddModule(308)"
        },
        {
          "display": "icon",
          "iconClass1": "mzindex",
          "text1": "浮到最前",
          "title1": "把模块浮到最前区域",
          "statusScript": "Site.getAbsZIndexStatus('module308');",
          "evalScript": "Site.absZIndexModule('module308');"
        }], [{
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "上移模块",
          "title1": "上移模块",
          "statusScript": "Site.getModulePosTop('module308');",
          "evalScript": "Site.moveModulePosTop('module308');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "下移模块",
          "title1": "下移模块",
          "statusScript": "Site.getModulePosBottom('module308');",
          "evalScript": "Site.moveModulePosBottom('module308');"
        },
        {
          "display": "icon",
          "iconClass1": "mleft",
          "fixClass": "littleBtn",
          "text1": "左移模块",
          "title1": "左移模块",
          "statusScript": "Site.getModulePosLeft('module308');",
          "evalScript": "Site.moveModulePosLeft('module308');"
        },
        {
          "display": "icon",
          "iconClass1": "mright",
          "fixClass": "littleBtn",
          "text1": "右移模块",
          "title1": "右移模块",
          "statusScript": "Site.getModulePosRight('module308');",
          "evalScript": "Site.moveModulePosRight('module308');"
        },
        {
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "跳到中间",
          "title1": "把模块跳到中间区域",
          "statusScript": "Site.getAbsMiddleStatus('module308');",
          "evalScript": "Site.absMiddleModule('module308');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "跳到底部",
          "title1": "把模块跳到底部区域",
          "statusScript": "Site.getAbsBottomStatus('module308');",
          "evalScript": "Site.absBottomModule('module308');"
        }]);

        Site.initModuleLayer(311, [{
          "text": "编辑模块",
          "title": "编辑分享网站模块",
          "evalScript": "Site.popupWindow({title:'编辑分享网站模块', frameSrcUrl:'manage/shareToModuleEdit.jsp?id=311&colId=2&extId=0&ram='+Math.random(), width:'500', height:'450', saveBeforePopup:false, frameScrolling: 'no'});"
        },
        {
          "display": "icon",
          "iconClass": "bannerAndBorder",
          "text": "设置样式",
          "title": "设置模块标题栏、边框等样式",
          "evalScript": "Site.functionInterface({'name':'faiSettingPanel.init', 'prompt':true}, {'id':311, 'styleId':67, 'entrance':0});Site.removeAllEditLayer();return false;"
        },
        {
          "text": "高级",
          "title": "",
          "className": "setItem",
          "menu": [{
            "display": "icon",
            "iconClass1": "dockModule",
            "text1": "停靠模块",
            "title1": "把模块停靠回固定区域",
            "statusScript": "Site.getDockStatus2('module311');",
            "evalScript": "Site.dock2('module311');"
          },
          {
            "display": "icon",
            "iconClass1": "absModule",
            "text1": "浮动模块",
            "title1": "浮动模块，可随意摆放位置",
            "statusScript": "Site.getAbsStatus2('module311');",
            "evalScript": "Site.floatOut2('module311');"
          },
          {
            "display": "icon",
            "iconClass1": "lock",
            "text1": "锁定模块",
            "title1": "锁定模块在当前位置，不跟随滚动条变化位置",
            "statusScript": "Site.getLockStatus2('module311');",
            "evalScript": "Site.lock2('module311');"
          },
          {
            "display": "icon",
            "iconClass1": "sidem",
            "text1": "侧停模块",
            "title1": "侧边停靠收起模块，支持鼠标移入自动展开",
            "statusScript": "Site.getSideStatus2('module311');",
            "evalScript": "Site.sideModule2('module311');"
          },
          {
            "display": "icon",
            "iconClass1": "flutterm",
            "text1": "飘动模块",
            "title1": "飘动模块,按照轨迹飘动",
            "statusScript": "Site.getFlutterStatus('module311');",
            "evalScript": "Site.flutter('module311');"
          },
          {
            "hrLine": true
          },
          {
            "display": "icon",
            "text": "取消全站模块",
            "title": "取消该模块在所有栏目中展示。",
            "iconClass": "global",
            "evalScript": "Site.setGlobalModule(311, false);",
            "statusScript": "Site.getLayoutItemStatus('module311');"
          },
          {
            "display": "icon",
            "text": "本页独立布局",
            "title": "该模块在本页面独立布局。",
            "iconClass": "independent",
            "evalScript": "Site.independentModule(311, true);"
          }]
        }], [{
          "display": "icon",
          "text": "隐藏模块",
          "title": "隐藏模块",
          "iconClass": "close",
          "evalScript": "Site.hideModule(311, false);"
        },
        {
          "display": "icon",
          "text": "隐藏标题栏与背景样式",
          "title": "隐藏标题栏与背景样式",
          "iconClass": "clearTB",
          "statusScript": "Site.getOneKeySetModuleTBStatus('module311');",
          "evalScript": "Site.oneKeySetModuleTB(311, true);",
          "setTB": "1"
        },
        {
          "display": "icon",
          "iconClass1": "add",
          "text1": "添加模块",
          "title1": "添加模块",
          "statusScript": "Site.getOpenAddModuleStatus('module311');",
          "evalScript": "Site.openAddModule(311)"
        },
        {
          "display": "icon",
          "iconClass1": "mzindex",
          "text1": "浮到最前",
          "title1": "把模块浮到最前区域",
          "statusScript": "Site.getAbsZIndexStatus('module311');",
          "evalScript": "Site.absZIndexModule('module311');"
        }], [{
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "上移模块",
          "title1": "上移模块",
          "statusScript": "Site.getModulePosTop('module311');",
          "evalScript": "Site.moveModulePosTop('module311');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "下移模块",
          "title1": "下移模块",
          "statusScript": "Site.getModulePosBottom('module311');",
          "evalScript": "Site.moveModulePosBottom('module311');"
        },
        {
          "display": "icon",
          "iconClass1": "mleft",
          "fixClass": "littleBtn",
          "text1": "左移模块",
          "title1": "左移模块",
          "statusScript": "Site.getModulePosLeft('module311');",
          "evalScript": "Site.moveModulePosLeft('module311');"
        },
        {
          "display": "icon",
          "iconClass1": "mright",
          "fixClass": "littleBtn",
          "text1": "右移模块",
          "title1": "右移模块",
          "statusScript": "Site.getModulePosRight('module311');",
          "evalScript": "Site.moveModulePosRight('module311');"
        },
        {
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "跳到中间",
          "title1": "把模块跳到中间区域",
          "statusScript": "Site.getAbsMiddleStatus('module311');",
          "evalScript": "Site.absMiddleModule('module311');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "跳到底部",
          "title1": "把模块跳到底部区域",
          "statusScript": "Site.getAbsBottomStatus('module311');",
          "evalScript": "Site.absBottomModule('module311');"
        }]);

        Fai.top.tabModule461Switch = false;
        Site.initModuleLayer(461, [{
          "text": "编辑模块组",
          "title": "编辑模块组模块",
          "evalScript": "Site.popupWindow({title:'编辑模块组模块', frameSrcUrl:'manage/tabModuleEdit.jsp?id=461&colId=2&extId=0&ram='+Math.random(), width:'450', height:'270', saveBeforePopup:false});"
        },
        {
          "text": "模块组样式",
          "title": "设置模块组样式",
          "iconClass": "tabStyle",
          "evalScript": "Site.popupWindow({title:'设置模块组样式', frameSrcUrl:'manage/tabStyleSetting.jsp?id=461&colId=2&extId=0&ram='+Math.random(), width:'485', height:'305', saveBeforePopup:false});"
        },
        {
          "text": "高级",
          "title": "",
          "className": "setItem",
          "menu": [{
            "display": "icon",
            "iconClass": "bannerAndBorder",
            "text": "设置样式",
            "title": "设置模块标题栏、边框等样式",
            "evalScript": "Site.functionInterface({'name':'faiSettingPanel.init', 'prompt':true}, {'id':461, 'styleId':29, 'entrance':0});Site.removeAllEditLayer();return false;"
          },
          {
            "hrLine": true
          },
          {
            "display": "icon",
            "iconClass1": "dockModule",
            "text1": "停靠模块",
            "title1": "把模块停靠回固定区域",
            "statusScript": "Site.getDockStatus2('module461');",
            "evalScript": "Site.dock2('module461');"
          },
          {
            "display": "icon",
            "iconClass1": "absModule",
            "text1": "浮动模块",
            "title1": "浮动模块，可随意摆放位置",
            "statusScript": "Site.getAbsStatus2('module461');",
            "evalScript": "Site.floatOut2('module461');"
          },
          {
            "display": "icon",
            "iconClass1": "lock",
            "text1": "锁定模块",
            "title1": "锁定模块在当前位置，不跟随滚动条变化位置",
            "statusScript": "Site.getLockStatus2('module461');",
            "evalScript": "Site.lock2('module461');"
          },
          {
            "display": "icon",
            "iconClass1": "sidem",
            "text1": "侧停模块",
            "title1": "侧边停靠收起模块，支持鼠标移入自动展开",
            "statusScript": "Site.getSideStatus2('module461');",
            "evalScript": "Site.sideModule2('module461');"
          },
          {
            "display": "icon",
            "iconClass1": "flutterm",
            "text1": "飘动模块",
            "title1": "飘动模块,按照轨迹飘动",
            "statusScript": "Site.getFlutterStatus('module461');",
            "evalScript": "Site.flutter('module461');"
          },
          {
            "hrLine": true
          },
          {
            "display": "icon",
            "text": "设为全站模块",
            "title": "把模块添加到整个网站的所有栏目中",
            "iconClass": "global",
            "evalScript": "Site.setGlobalModule(461, true);",
            "statusScript": "Site.getLayoutItemStatus('module461');"
          },
          {
            "display": "icon",
            "text": "加到指定栏目",
            "title": "把模块添加到指定栏目中",
            "iconClass": "apply",
            "evalScript": "Site.applyModuleTo(461);",
            "statusScript": "Site.getLayoutItemStatus('module461');"
          }]
        }], [{
          "display": "icon",
          "text": "隐藏模块",
          "title": "隐藏模块",
          "iconClass": "close",
          "evalScript": "Site.hideModule(461, false);"
        },
        {
          "display": "icon",
          "text": "隐藏标题栏与背景样式",
          "title": "隐藏标题栏与背景样式",
          "iconClass": "clearTB",
          "statusScript": "Site.getOneKeySetModuleTBStatus('module461');",
          "evalScript": "Site.oneKeySetModuleTB(461, true);",
          "setTB": "1"
        },
        {
          "display": "icon",
          "iconClass1": "add",
          "text1": "添加模块",
          "title1": "添加模块",
          "statusScript": "Site.getOpenAddModuleStatus('module461');",
          "evalScript": "Site.openAddModule(461)"
        },
        {
          "display": "icon",
          "iconClass1": "mzindex",
          "text1": "浮到最前",
          "title1": "把模块浮到最前区域",
          "statusScript": "Site.getAbsZIndexStatus('module461');",
          "evalScript": "Site.absZIndexModule('module461');"
        }], [{
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "上移模块",
          "title1": "上移模块",
          "statusScript": "Site.getModulePosTop('module461');",
          "evalScript": "Site.moveModulePosTop('module461');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "下移模块",
          "title1": "下移模块",
          "statusScript": "Site.getModulePosBottom('module461');",
          "evalScript": "Site.moveModulePosBottom('module461');"
        },
        {
          "display": "icon",
          "iconClass1": "mleft",
          "fixClass": "littleBtn",
          "text1": "左移模块",
          "title1": "左移模块",
          "statusScript": "Site.getModulePosLeft('module461');",
          "evalScript": "Site.moveModulePosLeft('module461');"
        },
        {
          "display": "icon",
          "iconClass1": "mright",
          "fixClass": "littleBtn",
          "text1": "右移模块",
          "title1": "右移模块",
          "statusScript": "Site.getModulePosRight('module461');",
          "evalScript": "Site.moveModulePosRight('module461');"
        },
        {
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "跳到中间",
          "title1": "把模块跳到中间区域",
          "statusScript": "Site.getAbsMiddleStatus('module461');",
          "evalScript": "Site.absMiddleModule('module461');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "跳到底部",
          "title1": "把模块跳到底部区域",
          "statusScript": "Site.getAbsBottomStatus('module461');",
          "evalScript": "Site.absBottomModule('module461');"
        }]);

        Site.bindInMulColResizableModule(462);
        Site.initMulColModuleInIE('#module462');
        Site.initModuleLayer(462, [{
          "text": "编辑模块列",
          "title": "编辑模块列模块",
          "evalScript": "Site.popupWindow({title:'编辑模块列模块', frameSrcUrl:'manage/mulModuleColEdit.jsp?id=462&colId=2&extId=0&ram='+Math.random(), width:'585', height:'280', saveBeforePopup:false});"
        },
        {
          "text": "模块列样式",
          "title": "设置模块列样式",
          "iconClass": "mulColStyle",
          "evalScript": "Site.popupWindow({title:'设置模块列样式', frameSrcUrl:'manage/mulModuleColStyleSetting.jsp?id=462&colId=2&extId=0&ram='+Math.random(), width:'485', height:'305', saveBeforePopup:false});"
        },
        {
          "text": "高级",
          "title": "",
          "className": "setItem",
          "menu": [{
            "display": "icon",
            "iconClass": "bannerAndBorder",
            "text": "设置样式",
            "title": "设置模块标题栏、边框等样式",
            "evalScript": "Site.functionInterface({'name':'faiSettingPanel.init', 'prompt':true}, {'id':462, 'styleId':35, 'entrance':0});Site.removeAllEditLayer();return false;"
          },
          {
            "hrLine": true
          },
          {
            "display": "icon",
            "iconClass1": "dockModule",
            "text1": "停靠模块",
            "title1": "把模块停靠回固定区域",
            "statusScript": "Site.getDockStatus2('module462');",
            "evalScript": "Site.dock2('module462');"
          },
          {
            "display": "icon",
            "iconClass1": "absModule",
            "text1": "浮动模块",
            "title1": "浮动模块，可随意摆放位置",
            "statusScript": "Site.getAbsStatus2('module462');",
            "evalScript": "Site.floatOut2('module462');"
          },
          {
            "display": "icon",
            "iconClass1": "lock",
            "text1": "锁定模块",
            "title1": "锁定模块在当前位置，不跟随滚动条变化位置",
            "statusScript": "Site.getLockStatus2('module462');",
            "evalScript": "Site.lock2('module462');"
          },
          {
            "display": "icon",
            "iconClass1": "sidem",
            "text1": "侧停模块",
            "title1": "侧边停靠收起模块，支持鼠标移入自动展开",
            "statusScript": "Site.getSideStatus2('module462');",
            "evalScript": "Site.sideModule2('module462');"
          },
          {
            "display": "icon",
            "iconClass1": "flutterm",
            "text1": "飘动模块",
            "title1": "飘动模块,按照轨迹飘动",
            "statusScript": "Site.getFlutterStatus('module462');",
            "evalScript": "Site.flutter('module462');"
          },
          {
            "hrLine": true
          },
          {
            "display": "icon",
            "text": "设为全站模块",
            "title": "把模块添加到整个网站的所有栏目中",
            "iconClass": "global",
            "evalScript": "Site.setGlobalModule(462, true);",
            "statusScript": "Site.getLayoutItemStatus('module462');"
          },
          {
            "display": "icon",
            "text": "加到指定栏目",
            "title": "把模块添加到指定栏目中",
            "iconClass": "apply",
            "evalScript": "Site.applyModuleTo(462);",
            "statusScript": "Site.getLayoutItemStatus('module462');"
          }]
        }], [{
          "display": "icon",
          "text": "隐藏模块",
          "title": "隐藏模块",
          "iconClass": "close",
          "evalScript": "Site.hideModule(462, false);"
        },
        {
          "display": "icon",
          "text": "隐藏标题栏与背景样式",
          "title": "隐藏标题栏与背景样式",
          "iconClass": "clearTB",
          "statusScript": "Site.getOneKeySetModuleTBStatus('module462');",
          "evalScript": "Site.oneKeySetModuleTB(462, true);",
          "setTB": "1"
        },
        {
          "display": "icon",
          "iconClass1": "add",
          "text1": "添加模块",
          "title1": "添加模块",
          "statusScript": "Site.getOpenAddModuleStatus('module462');",
          "evalScript": "Site.openAddModule(462)"
        },
        {
          "display": "icon",
          "iconClass1": "mzindex",
          "text1": "浮到最前",
          "title1": "把模块浮到最前区域",
          "statusScript": "Site.getAbsZIndexStatus('module462');",
          "evalScript": "Site.absZIndexModule('module462');"
        }], [{
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "上移模块",
          "title1": "上移模块",
          "statusScript": "Site.getModulePosTop('module462');",
          "evalScript": "Site.moveModulePosTop('module462');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "下移模块",
          "title1": "下移模块",
          "statusScript": "Site.getModulePosBottom('module462');",
          "evalScript": "Site.moveModulePosBottom('module462');"
        },
        {
          "display": "icon",
          "iconClass1": "mleft",
          "fixClass": "littleBtn",
          "text1": "左移模块",
          "title1": "左移模块",
          "statusScript": "Site.getModulePosLeft('module462');",
          "evalScript": "Site.moveModulePosLeft('module462');"
        },
        {
          "display": "icon",
          "iconClass1": "mright",
          "fixClass": "littleBtn",
          "text1": "右移模块",
          "title1": "右移模块",
          "statusScript": "Site.getModulePosRight('module462');",
          "evalScript": "Site.moveModulePosRight('module462');"
        },
        {
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "跳到中间",
          "title1": "把模块跳到中间区域",
          "statusScript": "Site.getAbsMiddleStatus('module462');",
          "evalScript": "Site.absMiddleModule('module462');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "跳到底部",
          "title1": "把模块跳到底部区域",
          "statusScript": "Site.getAbsBottomStatus('module462');",
          "evalScript": "Site.absBottomModule('module462');"
        }]);

        $('#pagenation463').find('a').hover(function() {
          $(this).addClass('g_hover')
        },
        function() {
          $(this).removeClass('g_hover')
        });
        Site.loadProductTile(463, true, false, -1, 6);
        Site.functionInterface({
          "name": "ImageEffect.FUNC.BASIC.Init",
          "callMethod": true
        },
        {
          "moduleId": 463,
          "imgEffOption": {
            "effType": 6,
            "borderType": false,
            "backgroundType": false,
            "wordType": false,
            "borderColor": "",
            "borderWidth": 1,
            "borderStyle": 1,
            "fullmaskBackgroundColor": "",
            "fullmaskBackgroundOpacity": 80,
            "fullmaskWordResize": 12,
            "fullmaskWordStyle": "",
            "fullmaskWordColor": "",
            "style": 2
          },
          "tagetOption": {
            "productTextCenter": true,
            "productNameWordWrap": true,
            "productNameShow": true,
            "propNameShow": true,
            "mallShowBuy": false,
            "targetParent": "productTileForm",
            "target": "imgDiv"
          },
          "callback": Site.createImageEffectContent_product,
          "callbackArgs": [{
            "productTileForm2": "[]",
            "productName": "产品2",
            "productBuyBtnText": "购买",
            "productBuyBtnClick": "Site.mallBuy(2,\"undefined\",\"_pp=2_463\"  );return false;"
          },
          {
            "productTileForm3": "[]",
            "productName": "产品3",
            "productBuyBtnText": "购买",
            "productBuyBtnClick": "Site.mallBuy(3,\"undefined\",\"_pp=2_463\"  );return false;"
          },
          {
            "productTileForm5": "[]",
            "productName": "产品5",
            "productBuyBtnText": "购买",
            "productBuyBtnClick": "Site.mallBuy(5,\"undefined\",\"_pp=2_463\"  );return false;"
          }]
        });
        Site.initModuleProductListItemManage({
          'productSelect': true,
          'productParent': 'productList463',
          'product': 'productTileForm',
          'productChild': 'imgDiv',
          'moduleId': 463,
          'frameSrcUrl': 'manage/productEdit.jsp?ram=' + Math.random(),
          'isOpenImgEff': true
        });
        Site.initModuleLayer(463, [{
          "text": "编辑模块",
          "title": "编辑产品展示模块",
          "evalScript": "Site.popupWindow({title:'编辑产品展示模块', frameSrcUrl:'manage/productModuleEdit.jsp?id=463&colId=2&extId=0&ram='+Math.random(), width:'600', height:'500', saveBeforePopup:false});"
        },
        {
          "display": "icon",
          "iconClass": "bannerAndBorder",
          "text": "设置样式",
          "title": "设置模块标题栏、边框等样式",
          "evalScript": "Site.functionInterface({'name':'faiSettingPanel.init', 'prompt':true}, {'id':463, 'styleId':2, 'entrance':0});Site.removeAllEditLayer();return false;"
        },
        {
          "text": "添加产品",
          "iconClass": "add",
          "evalScript": "Site.popupWindow({title:'添加产品', frameSrcUrl:'manage/productEdit.jsp?_pmid=463&src=0', width:'800', height:'455', beforePopup:true});"
        },
        {
          "text": "高级",
          "title": "",
          "className": "setItem",
          "menu": [{
            "display": "icon",
            "iconClass1": "dockModule",
            "text1": "停靠模块",
            "title1": "把模块停靠回固定区域",
            "statusScript": "Site.getDockStatus2('module463');",
            "evalScript": "Site.dock2('module463');"
          },
          {
            "display": "icon",
            "iconClass1": "absModule",
            "text1": "浮动模块",
            "title1": "浮动模块，可随意摆放位置",
            "statusScript": "Site.getAbsStatus2('module463');",
            "evalScript": "Site.floatOut2('module463');"
          },
          {
            "display": "icon",
            "iconClass1": "lock",
            "text1": "锁定模块",
            "title1": "锁定模块在当前位置，不跟随滚动条变化位置",
            "statusScript": "Site.getLockStatus2('module463');",
            "evalScript": "Site.lock2('module463');"
          },
          {
            "display": "icon",
            "iconClass1": "sidem",
            "text1": "侧停模块",
            "title1": "侧边停靠收起模块，支持鼠标移入自动展开",
            "statusScript": "Site.getSideStatus2('module463');",
            "evalScript": "Site.sideModule2('module463');"
          },
          {
            "display": "icon",
            "iconClass1": "flutterm",
            "text1": "飘动模块",
            "title1": "飘动模块,按照轨迹飘动",
            "statusScript": "Site.getFlutterStatus('module463');",
            "evalScript": "Site.flutter('module463');"
          },
          {
            "hrLine": true
          },
          {
            "display": "icon",
            "text": "设为全站模块",
            "title": "把模块添加到整个网站的所有栏目中",
            "iconClass": "global",
            "evalScript": "Site.setGlobalModule(463, true);",
            "statusScript": "Site.getLayoutItemStatus('module463');"
          },
          {
            "display": "icon",
            "text": "加到指定栏目",
            "title": "把模块添加到指定栏目中",
            "iconClass": "apply",
            "evalScript": "Site.applyModuleTo(463);",
            "statusScript": "Site.getLayoutItemStatus('module463');"
          }]
        }], [{
          "display": "icon",
          "text": "隐藏模块",
          "title": "隐藏模块",
          "iconClass": "close",
          "evalScript": "Site.hideModule(463, false);"
        },
        {
          "display": "icon",
          "text": "隐藏标题栏与背景样式",
          "title": "隐藏标题栏与背景样式",
          "iconClass": "clearTB",
          "statusScript": "Site.getOneKeySetModuleTBStatus('module463');",
          "evalScript": "Site.oneKeySetModuleTB(463, true);",
          "setTB": "1"
        },
        {
          "display": "icon",
          "iconClass1": "add",
          "text1": "添加模块",
          "title1": "添加模块",
          "statusScript": "Site.getOpenAddModuleStatus('module463');",
          "evalScript": "Site.openAddModule(463)"
        },
        {
          "display": "icon",
          "iconClass1": "mzindex",
          "text1": "浮到最前",
          "title1": "把模块浮到最前区域",
          "statusScript": "Site.getAbsZIndexStatus('module463');",
          "evalScript": "Site.absZIndexModule('module463');"
        }], [{
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "上移模块",
          "title1": "上移模块",
          "statusScript": "Site.getModulePosTop('module463');",
          "evalScript": "Site.moveModulePosTop('module463');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "下移模块",
          "title1": "下移模块",
          "statusScript": "Site.getModulePosBottom('module463');",
          "evalScript": "Site.moveModulePosBottom('module463');"
        },
        {
          "display": "icon",
          "iconClass1": "mleft",
          "fixClass": "littleBtn",
          "text1": "左移模块",
          "title1": "左移模块",
          "statusScript": "Site.getModulePosLeft('module463');",
          "evalScript": "Site.moveModulePosLeft('module463');"
        },
        {
          "display": "icon",
          "iconClass1": "mright",
          "fixClass": "littleBtn",
          "text1": "右移模块",
          "title1": "右移模块",
          "statusScript": "Site.getModulePosRight('module463');",
          "evalScript": "Site.moveModulePosRight('module463');"
        },
        {
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "跳到中间",
          "title1": "把模块跳到中间区域",
          "statusScript": "Site.getAbsMiddleStatus('module463');",
          "evalScript": "Site.absMiddleModule('module463');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "跳到底部",
          "title1": "把模块跳到底部区域",
          "statusScript": "Site.getAbsBottomStatus('module463');",
          "evalScript": "Site.absBottomModule('module463');"
        }]);

        Site.initModuleProductMallGroups(464, {
          "1": {
            "hasGrand": false,
            "list": []
          },
          "2": {
            "hasGrand": false,
            "list": []
          }
        },
        2, 0);
        Site.initModuleLayer(464, [{
          "text": "编辑模块",
          "title": "编辑产品分类模块",
          "evalScript": "Site.popupWindow({title:'编辑产品分类模块', frameSrcUrl:'manage/productGroupModuleEdit.jsp?id=464&colId=2&extId=0&ram='+Math.random(), width:'560', height:'390', saveBeforePopup:false});"
        },
        {
          "display": "icon",
          "iconClass": "bannerAndBorder",
          "text": "设置样式",
          "title": "设置模块标题栏、边框等样式",
          "evalScript": "Site.functionInterface({'name':'faiSettingPanel.init', 'prompt':true}, {'id':464, 'styleId':76, 'entrance':0});Site.removeAllEditLayer();return false;"
        },
        {
          "text": "管理分类",
          "title": "管理产品分类",
          "evalScript": "Site.popupWindow({title:'管理产品分类', frameSrcUrl:'manage/productGroupEdit.jsp?ram='+Math.random(), width:'585', height:'450', saveBeforePopup:true, beforePopup:true});"
        },
        {
          "text": "高级",
          "title": "",
          "className": "setItem",
          "menu": [{
            "display": "icon",
            "iconClass1": "dockModule",
            "text1": "停靠模块",
            "title1": "把模块停靠回固定区域",
            "statusScript": "Site.getDockStatus2('module464');",
            "evalScript": "Site.dock2('module464');"
          },
          {
            "display": "icon",
            "iconClass1": "absModule",
            "text1": "浮动模块",
            "title1": "浮动模块，可随意摆放位置",
            "statusScript": "Site.getAbsStatus2('module464');",
            "evalScript": "Site.floatOut2('module464');"
          },
          {
            "display": "icon",
            "iconClass1": "lock",
            "text1": "锁定模块",
            "title1": "锁定模块在当前位置，不跟随滚动条变化位置",
            "statusScript": "Site.getLockStatus2('module464');",
            "evalScript": "Site.lock2('module464');"
          },
          {
            "display": "icon",
            "iconClass1": "sidem",
            "text1": "侧停模块",
            "title1": "侧边停靠收起模块，支持鼠标移入自动展开",
            "statusScript": "Site.getSideStatus2('module464');",
            "evalScript": "Site.sideModule2('module464');"
          },
          {
            "display": "icon",
            "iconClass1": "flutterm",
            "text1": "飘动模块",
            "title1": "飘动模块,按照轨迹飘动",
            "statusScript": "Site.getFlutterStatus('module464');",
            "evalScript": "Site.flutter('module464');"
          },
          {
            "hrLine": true
          },
          {
            "display": "icon",
            "text": "设为全站模块",
            "title": "把模块添加到整个网站的所有栏目中",
            "iconClass": "global",
            "evalScript": "Site.setGlobalModule(464, true);",
            "statusScript": "Site.getLayoutItemStatus('module464');"
          },
          {
            "display": "icon",
            "text": "加到指定栏目",
            "title": "把模块添加到指定栏目中",
            "iconClass": "apply",
            "evalScript": "Site.applyModuleTo(464);",
            "statusScript": "Site.getLayoutItemStatus('module464');"
          }]
        }], [{
          "display": "icon",
          "text": "隐藏模块",
          "title": "隐藏模块",
          "iconClass": "close",
          "evalScript": "Site.hideModule(464, false);"
        },
        {
          "display": "icon",
          "text": "隐藏标题栏与背景样式",
          "title": "隐藏标题栏与背景样式",
          "iconClass": "clearTB",
          "statusScript": "Site.getOneKeySetModuleTBStatus('module464');",
          "evalScript": "Site.oneKeySetModuleTB(464, true);",
          "setTB": "1"
        },
        {
          "display": "icon",
          "iconClass1": "add",
          "text1": "添加模块",
          "title1": "添加模块",
          "statusScript": "Site.getOpenAddModuleStatus('module464');",
          "evalScript": "Site.openAddModule(464)"
        },
        {
          "display": "icon",
          "iconClass1": "mzindex",
          "text1": "浮到最前",
          "title1": "把模块浮到最前区域",
          "statusScript": "Site.getAbsZIndexStatus('module464');",
          "evalScript": "Site.absZIndexModule('module464');"
        }], [{
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "上移模块",
          "title1": "上移模块",
          "statusScript": "Site.getModulePosTop('module464');",
          "evalScript": "Site.moveModulePosTop('module464');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "下移模块",
          "title1": "下移模块",
          "statusScript": "Site.getModulePosBottom('module464');",
          "evalScript": "Site.moveModulePosBottom('module464');"
        },
        {
          "display": "icon",
          "iconClass1": "mleft",
          "fixClass": "littleBtn",
          "text1": "左移模块",
          "title1": "左移模块",
          "statusScript": "Site.getModulePosLeft('module464');",
          "evalScript": "Site.moveModulePosLeft('module464');"
        },
        {
          "display": "icon",
          "iconClass1": "mright",
          "fixClass": "littleBtn",
          "text1": "右移模块",
          "title1": "右移模块",
          "statusScript": "Site.getModulePosRight('module464');",
          "evalScript": "Site.moveModulePosRight('module464');"
        },
        {
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "跳到中间",
          "title1": "把模块跳到中间区域",
          "statusScript": "Site.getAbsMiddleStatus('module464');",
          "evalScript": "Site.absMiddleModule('module464');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "跳到底部",
          "title1": "把模块跳到底部区域",
          "statusScript": "Site.getAbsBottomStatus('module464');",
          "evalScript": "Site.absBottomModule('module464');"
        }]);

        Site.foldChange(465);
        Site.initModuleLayer(465, [{
          "text": "编辑模块",
          "title": "编辑产品标签模块",
          "evalScript": "Site.popupWindow({title:'编辑产品标签模块', frameSrcUrl:'manage/productLabelModuleEdit.jsp?id=465&colId=2&extId=0&ram='+Math.random(), width:'500', height:'296', saveBeforePopup:false});"
        },
        {
          "display": "icon",
          "iconClass": "bannerAndBorder",
          "text": "设置样式",
          "title": "设置模块标题栏、边框等样式",
          "evalScript": "Site.functionInterface({'name':'faiSettingPanel.init', 'prompt':true}, {'id':465, 'styleId':38, 'entrance':0});Site.removeAllEditLayer();return false;"
        },
        {
          "text": "高级",
          "title": "",
          "className": "setItem",
          "menu": [{
            "display": "icon",
            "iconClass1": "dockModule",
            "text1": "停靠模块",
            "title1": "把模块停靠回固定区域",
            "statusScript": "Site.getDockStatus2('module465');",
            "evalScript": "Site.dock2('module465');"
          },
          {
            "display": "icon",
            "iconClass1": "absModule",
            "text1": "浮动模块",
            "title1": "浮动模块，可随意摆放位置",
            "statusScript": "Site.getAbsStatus2('module465');",
            "evalScript": "Site.floatOut2('module465');"
          },
          {
            "display": "icon",
            "iconClass1": "lock",
            "text1": "锁定模块",
            "title1": "锁定模块在当前位置，不跟随滚动条变化位置",
            "statusScript": "Site.getLockStatus2('module465');",
            "evalScript": "Site.lock2('module465');"
          },
          {
            "display": "icon",
            "iconClass1": "sidem",
            "text1": "侧停模块",
            "title1": "侧边停靠收起模块，支持鼠标移入自动展开",
            "statusScript": "Site.getSideStatus2('module465');",
            "evalScript": "Site.sideModule2('module465');"
          },
          {
            "display": "icon",
            "iconClass1": "flutterm",
            "text1": "飘动模块",
            "title1": "飘动模块,按照轨迹飘动",
            "statusScript": "Site.getFlutterStatus('module465');",
            "evalScript": "Site.flutter('module465');"
          },
          {
            "hrLine": true
          },
          {
            "display": "icon",
            "text": "设为全站模块",
            "title": "把模块添加到整个网站的所有栏目中",
            "iconClass": "global",
            "evalScript": "Site.setGlobalModule(465, true);",
            "statusScript": "Site.getLayoutItemStatus('module465');"
          },
          {
            "display": "icon",
            "text": "加到指定栏目",
            "title": "把模块添加到指定栏目中",
            "iconClass": "apply",
            "evalScript": "Site.applyModuleTo(465);",
            "statusScript": "Site.getLayoutItemStatus('module465');"
          }]
        }], [{
          "display": "icon",
          "text": "隐藏模块",
          "title": "隐藏模块",
          "iconClass": "close",
          "evalScript": "Site.hideModule(465, false);"
        },
        {
          "display": "icon",
          "text": "隐藏标题栏与背景样式",
          "title": "隐藏标题栏与背景样式",
          "iconClass": "clearTB",
          "statusScript": "Site.getOneKeySetModuleTBStatus('module465');",
          "evalScript": "Site.oneKeySetModuleTB(465, true);",
          "setTB": "1"
        },
        {
          "display": "icon",
          "iconClass1": "add",
          "text1": "添加模块",
          "title1": "添加模块",
          "statusScript": "Site.getOpenAddModuleStatus('module465');",
          "evalScript": "Site.openAddModule(465)"
        },
        {
          "display": "icon",
          "iconClass1": "mzindex",
          "text1": "浮到最前",
          "title1": "把模块浮到最前区域",
          "statusScript": "Site.getAbsZIndexStatus('module465');",
          "evalScript": "Site.absZIndexModule('module465');"
        }], [{
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "上移模块",
          "title1": "上移模块",
          "statusScript": "Site.getModulePosTop('module465');",
          "evalScript": "Site.moveModulePosTop('module465');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "下移模块",
          "title1": "下移模块",
          "statusScript": "Site.getModulePosBottom('module465');",
          "evalScript": "Site.moveModulePosBottom('module465');"
        },
        {
          "display": "icon",
          "iconClass1": "mleft",
          "fixClass": "littleBtn",
          "text1": "左移模块",
          "title1": "左移模块",
          "statusScript": "Site.getModulePosLeft('module465');",
          "evalScript": "Site.moveModulePosLeft('module465');"
        },
        {
          "display": "icon",
          "iconClass1": "mright",
          "fixClass": "littleBtn",
          "text1": "右移模块",
          "title1": "右移模块",
          "statusScript": "Site.getModulePosRight('module465');",
          "evalScript": "Site.moveModulePosRight('module465');"
        },
        {
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "跳到中间",
          "title1": "把模块跳到中间区域",
          "statusScript": "Site.getAbsMiddleStatus('module465');",
          "evalScript": "Site.absMiddleModule('module465');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "跳到底部",
          "title1": "把模块跳到底部区域",
          "statusScript": "Site.getAbsBottomStatus('module465');",
          "evalScript": "Site.absBottomModule('module465');"
        }]);

        Site.foldChange(466);
        Site.initModuleLayer(466, [{
          "text": "编辑模块",
          "title": "编辑产品目录模块",
          "evalScript": "Site.popupWindow({title:'编辑产品目录模块', frameSrcUrl:'manage/productCatalogModuleEdit.jsp?id=466&colId=2&extId=0&ram='+Math.random(), width:'560', height:'375', saveBeforePopup:false});"
        },
        {
          "display": "icon",
          "iconClass": "bannerAndBorder",
          "text": "设置样式",
          "title": "设置模块标题栏、边框等样式",
          "evalScript": "Site.functionInterface({'name':'faiSettingPanel.init', 'prompt':true}, {'id':466, 'styleId':21, 'entrance':0});Site.removeAllEditLayer();return false;"
        },
        {
          "text": "高级",
          "title": "",
          "className": "setItem",
          "menu": [{
            "display": "icon",
            "iconClass1": "dockModule",
            "text1": "停靠模块",
            "title1": "把模块停靠回固定区域",
            "statusScript": "Site.getDockStatus2('module466');",
            "evalScript": "Site.dock2('module466');"
          },
          {
            "display": "icon",
            "iconClass1": "absModule",
            "text1": "浮动模块",
            "title1": "浮动模块，可随意摆放位置",
            "statusScript": "Site.getAbsStatus2('module466');",
            "evalScript": "Site.floatOut2('module466');"
          },
          {
            "display": "icon",
            "iconClass1": "lock",
            "text1": "锁定模块",
            "title1": "锁定模块在当前位置，不跟随滚动条变化位置",
            "statusScript": "Site.getLockStatus2('module466');",
            "evalScript": "Site.lock2('module466');"
          },
          {
            "display": "icon",
            "iconClass1": "sidem",
            "text1": "侧停模块",
            "title1": "侧边停靠收起模块，支持鼠标移入自动展开",
            "statusScript": "Site.getSideStatus2('module466');",
            "evalScript": "Site.sideModule2('module466');"
          },
          {
            "display": "icon",
            "iconClass1": "flutterm",
            "text1": "飘动模块",
            "title1": "飘动模块,按照轨迹飘动",
            "statusScript": "Site.getFlutterStatus('module466');",
            "evalScript": "Site.flutter('module466');"
          },
          {
            "hrLine": true
          },
          {
            "display": "icon",
            "text": "设为全站模块",
            "title": "把模块添加到整个网站的所有栏目中",
            "iconClass": "global",
            "evalScript": "Site.setGlobalModule(466, true);",
            "statusScript": "Site.getLayoutItemStatus('module466');"
          },
          {
            "display": "icon",
            "text": "加到指定栏目",
            "title": "把模块添加到指定栏目中",
            "iconClass": "apply",
            "evalScript": "Site.applyModuleTo(466);",
            "statusScript": "Site.getLayoutItemStatus('module466');"
          }]
        }], [{
          "display": "icon",
          "text": "隐藏模块",
          "title": "隐藏模块",
          "iconClass": "close",
          "evalScript": "Site.hideModule(466, false);"
        },
        {
          "display": "icon",
          "text": "隐藏标题栏与背景样式",
          "title": "隐藏标题栏与背景样式",
          "iconClass": "clearTB",
          "statusScript": "Site.getOneKeySetModuleTBStatus('module466');",
          "evalScript": "Site.oneKeySetModuleTB(466, true);",
          "setTB": "1"
        },
        {
          "display": "icon",
          "iconClass1": "add",
          "text1": "添加模块",
          "title1": "添加模块",
          "statusScript": "Site.getOpenAddModuleStatus('module466');",
          "evalScript": "Site.openAddModule(466)"
        },
        {
          "display": "icon",
          "iconClass1": "mzindex",
          "text1": "浮到最前",
          "title1": "把模块浮到最前区域",
          "statusScript": "Site.getAbsZIndexStatus('module466');",
          "evalScript": "Site.absZIndexModule('module466');"
        }], [{
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "上移模块",
          "title1": "上移模块",
          "statusScript": "Site.getModulePosTop('module466');",
          "evalScript": "Site.moveModulePosTop('module466');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "下移模块",
          "title1": "下移模块",
          "statusScript": "Site.getModulePosBottom('module466');",
          "evalScript": "Site.moveModulePosBottom('module466');"
        },
        {
          "display": "icon",
          "iconClass1": "mleft",
          "fixClass": "littleBtn",
          "text1": "左移模块",
          "title1": "左移模块",
          "statusScript": "Site.getModulePosLeft('module466');",
          "evalScript": "Site.moveModulePosLeft('module466');"
        },
        {
          "display": "icon",
          "iconClass1": "mright",
          "fixClass": "littleBtn",
          "text1": "右移模块",
          "title1": "右移模块",
          "statusScript": "Site.getModulePosRight('module466');",
          "evalScript": "Site.moveModulePosRight('module466');"
        },
        {
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "跳到中间",
          "title1": "把模块跳到中间区域",
          "statusScript": "Site.getAbsMiddleStatus('module466');",
          "evalScript": "Site.absMiddleModule('module466');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "跳到底部",
          "title1": "把模块跳到底部区域",
          "statusScript": "Site.getAbsBottomStatus('module466');",
          "evalScript": "Site.absBottomModule('module466');"
        }]);

        Site.foldChange(467);
        Site.initModuleLayer(467, [{
          "text": "编辑模块",
          "title": "编辑产品筛选模块",
          "evalScript": "Site.popupWindow({title:'编辑产品筛选模块', frameSrcUrl:'manage/productFilterModuleEdit.jsp?id=467&colId=2&extId=0&ram='+Math.random(), width:'620', height:'380', saveBeforePopup:false});"
        },
        {
          "display": "icon",
          "iconClass": "bannerAndBorder",
          "text": "设置样式",
          "title": "设置模块标题栏、边框等样式",
          "evalScript": "Site.functionInterface({'name':'faiSettingPanel.init', 'prompt':true}, {'id':467, 'styleId':9, 'entrance':0});Site.removeAllEditLayer();return false;"
        },
        {
          "text": "高级",
          "title": "",
          "className": "setItem",
          "menu": [{
            "display": "icon",
            "iconClass1": "dockModule",
            "text1": "停靠模块",
            "title1": "把模块停靠回固定区域",
            "statusScript": "Site.getDockStatus2('module467');",
            "evalScript": "Site.dock2('module467');"
          },
          {
            "display": "icon",
            "iconClass1": "absModule",
            "text1": "浮动模块",
            "title1": "浮动模块，可随意摆放位置",
            "statusScript": "Site.getAbsStatus2('module467');",
            "evalScript": "Site.floatOut2('module467');"
          },
          {
            "display": "icon",
            "iconClass1": "lock",
            "text1": "锁定模块",
            "title1": "锁定模块在当前位置，不跟随滚动条变化位置",
            "statusScript": "Site.getLockStatus2('module467');",
            "evalScript": "Site.lock2('module467');"
          },
          {
            "display": "icon",
            "iconClass1": "sidem",
            "text1": "侧停模块",
            "title1": "侧边停靠收起模块，支持鼠标移入自动展开",
            "statusScript": "Site.getSideStatus2('module467');",
            "evalScript": "Site.sideModule2('module467');"
          },
          {
            "display": "icon",
            "iconClass1": "flutterm",
            "text1": "飘动模块",
            "title1": "飘动模块,按照轨迹飘动",
            "statusScript": "Site.getFlutterStatus('module467');",
            "evalScript": "Site.flutter('module467');"
          },
          {
            "hrLine": true
          },
          {
            "display": "icon",
            "text": "设为全站模块",
            "title": "把模块添加到整个网站的所有栏目中",
            "iconClass": "global",
            "evalScript": "Site.setGlobalModule(467, true);",
            "statusScript": "Site.getLayoutItemStatus('module467');"
          },
          {
            "display": "icon",
            "text": "加到指定栏目",
            "title": "把模块添加到指定栏目中",
            "iconClass": "apply",
            "evalScript": "Site.applyModuleTo(467);",
            "statusScript": "Site.getLayoutItemStatus('module467');"
          }]
        }], [{
          "display": "icon",
          "text": "隐藏模块",
          "title": "隐藏模块",
          "iconClass": "close",
          "evalScript": "Site.hideModule(467, false);"
        },
        {
          "display": "icon",
          "text": "隐藏标题栏与背景样式",
          "title": "隐藏标题栏与背景样式",
          "iconClass": "clearTB",
          "statusScript": "Site.getOneKeySetModuleTBStatus('module467');",
          "evalScript": "Site.oneKeySetModuleTB(467, true);",
          "setTB": "1"
        },
        {
          "display": "icon",
          "iconClass1": "add",
          "text1": "添加模块",
          "title1": "添加模块",
          "statusScript": "Site.getOpenAddModuleStatus('module467');",
          "evalScript": "Site.openAddModule(467)"
        },
        {
          "display": "icon",
          "iconClass1": "mzindex",
          "text1": "浮到最前",
          "title1": "把模块浮到最前区域",
          "statusScript": "Site.getAbsZIndexStatus('module467');",
          "evalScript": "Site.absZIndexModule('module467');"
        }], [{
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "上移模块",
          "title1": "上移模块",
          "statusScript": "Site.getModulePosTop('module467');",
          "evalScript": "Site.moveModulePosTop('module467');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "下移模块",
          "title1": "下移模块",
          "statusScript": "Site.getModulePosBottom('module467');",
          "evalScript": "Site.moveModulePosBottom('module467');"
        },
        {
          "display": "icon",
          "iconClass1": "mleft",
          "fixClass": "littleBtn",
          "text1": "左移模块",
          "title1": "左移模块",
          "statusScript": "Site.getModulePosLeft('module467');",
          "evalScript": "Site.moveModulePosLeft('module467');"
        },
        {
          "display": "icon",
          "iconClass1": "mright",
          "fixClass": "littleBtn",
          "text1": "右移模块",
          "title1": "右移模块",
          "statusScript": "Site.getModulePosRight('module467');",
          "evalScript": "Site.moveModulePosRight('module467');"
        },
        {
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "跳到中间",
          "title1": "把模块跳到中间区域",
          "statusScript": "Site.getAbsMiddleStatus('module467');",
          "evalScript": "Site.absMiddleModule('module467');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "跳到底部",
          "title1": "把模块跳到底部区域",
          "statusScript": "Site.getAbsBottomStatus('module467');",
          "evalScript": "Site.absBottomModule('module467');"
        }]);

        Site.initModuleProductSearch(468);
        Site.initModuleLayer(468, [{
          "text": "编辑模块",
          "title": "编辑产品搜索模块",
          "evalScript": "Site.popupWindow({title:'编辑产品搜索模块', frameSrcUrl:'manage/productSearchModuleEdit.jsp?id=468&colId=2&extId=0&ram='+Math.random(), width:'568', height:'400', saveBeforePopup:false});"
        },
        {
          "display": "icon",
          "iconClass": "bannerAndBorder",
          "text": "设置样式",
          "title": "设置模块标题栏、边框等样式",
          "evalScript": "Site.functionInterface({'name':'faiSettingPanel.init', 'prompt':true}, {'id':468, 'styleId':45, 'entrance':0});Site.removeAllEditLayer();return false;"
        },
        {
          "text": "高级",
          "title": "",
          "className": "setItem",
          "menu": [{
            "display": "icon",
            "iconClass1": "dockModule",
            "text1": "停靠模块",
            "title1": "把模块停靠回固定区域",
            "statusScript": "Site.getDockStatus2('module468');",
            "evalScript": "Site.dock2('module468');"
          },
          {
            "display": "icon",
            "iconClass1": "absModule",
            "text1": "浮动模块",
            "title1": "浮动模块，可随意摆放位置",
            "statusScript": "Site.getAbsStatus2('module468');",
            "evalScript": "Site.floatOut2('module468');"
          },
          {
            "display": "icon",
            "iconClass1": "lock",
            "text1": "锁定模块",
            "title1": "锁定模块在当前位置，不跟随滚动条变化位置",
            "statusScript": "Site.getLockStatus2('module468');",
            "evalScript": "Site.lock2('module468');"
          },
          {
            "display": "icon",
            "iconClass1": "sidem",
            "text1": "侧停模块",
            "title1": "侧边停靠收起模块，支持鼠标移入自动展开",
            "statusScript": "Site.getSideStatus2('module468');",
            "evalScript": "Site.sideModule2('module468');"
          },
          {
            "display": "icon",
            "iconClass1": "flutterm",
            "text1": "飘动模块",
            "title1": "飘动模块,按照轨迹飘动",
            "statusScript": "Site.getFlutterStatus('module468');",
            "evalScript": "Site.flutter('module468');"
          },
          {
            "hrLine": true
          },
          {
            "display": "icon",
            "text": "设为全站模块",
            "title": "把模块添加到整个网站的所有栏目中",
            "iconClass": "global",
            "evalScript": "Site.setGlobalModule(468, true);",
            "statusScript": "Site.getLayoutItemStatus('module468');"
          },
          {
            "display": "icon",
            "text": "加到指定栏目",
            "title": "把模块添加到指定栏目中",
            "iconClass": "apply",
            "evalScript": "Site.applyModuleTo(468);",
            "statusScript": "Site.getLayoutItemStatus('module468');"
          }]
        }], [{
          "display": "icon",
          "text": "隐藏模块",
          "title": "隐藏模块",
          "iconClass": "close",
          "evalScript": "Site.hideModule(468, false);"
        },
        {
          "display": "icon",
          "text": "隐藏标题栏与背景样式",
          "title": "隐藏标题栏与背景样式",
          "iconClass": "clearTB",
          "statusScript": "Site.getOneKeySetModuleTBStatus('module468');",
          "evalScript": "Site.oneKeySetModuleTB(468, true);",
          "setTB": "1"
        },
        {
          "display": "icon",
          "iconClass1": "add",
          "text1": "添加模块",
          "title1": "添加模块",
          "statusScript": "Site.getOpenAddModuleStatus('module468');",
          "evalScript": "Site.openAddModule(468)"
        },
        {
          "display": "icon",
          "iconClass1": "mzindex",
          "text1": "浮到最前",
          "title1": "把模块浮到最前区域",
          "statusScript": "Site.getAbsZIndexStatus('module468');",
          "evalScript": "Site.absZIndexModule('module468');"
        }], [{
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "上移模块",
          "title1": "上移模块",
          "statusScript": "Site.getModulePosTop('module468');",
          "evalScript": "Site.moveModulePosTop('module468');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "下移模块",
          "title1": "下移模块",
          "statusScript": "Site.getModulePosBottom('module468');",
          "evalScript": "Site.moveModulePosBottom('module468');"
        },
        {
          "display": "icon",
          "iconClass1": "mleft",
          "fixClass": "littleBtn",
          "text1": "左移模块",
          "title1": "左移模块",
          "statusScript": "Site.getModulePosLeft('module468');",
          "evalScript": "Site.moveModulePosLeft('module468');"
        },
        {
          "display": "icon",
          "iconClass1": "mright",
          "fixClass": "littleBtn",
          "text1": "右移模块",
          "title1": "右移模块",
          "statusScript": "Site.getModulePosRight('module468');",
          "evalScript": "Site.moveModulePosRight('module468');"
        },
        {
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "跳到中间",
          "title1": "把模块跳到中间区域",
          "statusScript": "Site.getAbsMiddleStatus('module468');",
          "evalScript": "Site.absMiddleModule('module468');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "跳到底部",
          "title1": "把模块跳到底部区域",
          "statusScript": "Site.getAbsBottomStatus('module468');",
          "evalScript": "Site.absBottomModule('module468');"
        }]);

        Site.initModuleLayer(471, [{
          "text": "编辑模块",
          "title": "编辑网站二维码模块",
          "evalScript": "Site.popupWindow({title:'编辑网站二维码模块', frameSrcUrl:'manage/webSiteQRCodeModuleEdit.jsp?id=471&colId=2&extId=0&ram='+Math.random(), width:'400', height:'176', saveBeforePopup:false});"
        },
        {
          "display": "icon",
          "iconClass": "bannerAndBorder",
          "text": "设置样式",
          "title": "设置模块标题栏、边框等样式",
          "evalScript": "Site.functionInterface({'name':'faiSettingPanel.init', 'prompt':true}, {'id':471, 'styleId':64, 'entrance':0});Site.removeAllEditLayer();return false;"
        },
        {
          "text": "高级",
          "title": "",
          "className": "setItem",
          "menu": [{
            "display": "icon",
            "iconClass1": "dockModule",
            "text1": "停靠模块",
            "title1": "把模块停靠回固定区域",
            "statusScript": "Site.getDockStatus2('module471');",
            "evalScript": "Site.dock2('module471');"
          },
          {
            "display": "icon",
            "iconClass1": "absModule",
            "text1": "浮动模块",
            "title1": "浮动模块，可随意摆放位置",
            "statusScript": "Site.getAbsStatus2('module471');",
            "evalScript": "Site.floatOut2('module471');"
          },
          {
            "display": "icon",
            "iconClass1": "lock",
            "text1": "锁定模块",
            "title1": "锁定模块在当前位置，不跟随滚动条变化位置",
            "statusScript": "Site.getLockStatus2('module471');",
            "evalScript": "Site.lock2('module471');"
          },
          {
            "display": "icon",
            "iconClass1": "sidem",
            "text1": "侧停模块",
            "title1": "侧边停靠收起模块，支持鼠标移入自动展开",
            "statusScript": "Site.getSideStatus2('module471');",
            "evalScript": "Site.sideModule2('module471');"
          },
          {
            "display": "icon",
            "iconClass1": "flutterm",
            "text1": "飘动模块",
            "title1": "飘动模块,按照轨迹飘动",
            "statusScript": "Site.getFlutterStatus('module471');",
            "evalScript": "Site.flutter('module471');"
          },
          {
            "hrLine": true
          },
          {
            "display": "icon",
            "text": "设为全站模块",
            "title": "把模块添加到整个网站的所有栏目中",
            "iconClass": "global",
            "evalScript": "Site.setGlobalModule(471, true);",
            "statusScript": "Site.getLayoutItemStatus('module471');"
          },
          {
            "display": "icon",
            "text": "加到指定栏目",
            "title": "把模块添加到指定栏目中",
            "iconClass": "apply",
            "evalScript": "Site.applyModuleTo(471);",
            "statusScript": "Site.getLayoutItemStatus('module471');"
          }]
        }], [{
          "display": "icon",
          "text": "隐藏模块",
          "title": "隐藏模块",
          "iconClass": "close",
          "evalScript": "Site.hideModule(471, false);"
        },
        {
          "display": "icon",
          "text": "隐藏标题栏与背景样式",
          "title": "隐藏标题栏与背景样式",
          "iconClass": "clearTB",
          "statusScript": "Site.getOneKeySetModuleTBStatus('module471');",
          "evalScript": "Site.oneKeySetModuleTB(471, true);",
          "setTB": "1"
        },
        {
          "display": "icon",
          "iconClass1": "add",
          "text1": "添加模块",
          "title1": "添加模块",
          "statusScript": "Site.getOpenAddModuleStatus('module471');",
          "evalScript": "Site.openAddModule(471)"
        },
        {
          "display": "icon",
          "iconClass1": "mzindex",
          "text1": "浮到最前",
          "title1": "把模块浮到最前区域",
          "statusScript": "Site.getAbsZIndexStatus('module471');",
          "evalScript": "Site.absZIndexModule('module471');"
        }], [{
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "上移模块",
          "title1": "上移模块",
          "statusScript": "Site.getModulePosTop('module471');",
          "evalScript": "Site.moveModulePosTop('module471');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "下移模块",
          "title1": "下移模块",
          "statusScript": "Site.getModulePosBottom('module471');",
          "evalScript": "Site.moveModulePosBottom('module471');"
        },
        {
          "display": "icon",
          "iconClass1": "mleft",
          "fixClass": "littleBtn",
          "text1": "左移模块",
          "title1": "左移模块",
          "statusScript": "Site.getModulePosLeft('module471');",
          "evalScript": "Site.moveModulePosLeft('module471');"
        },
        {
          "display": "icon",
          "iconClass1": "mright",
          "fixClass": "littleBtn",
          "text1": "右移模块",
          "title1": "右移模块",
          "statusScript": "Site.getModulePosRight('module471');",
          "evalScript": "Site.moveModulePosRight('module471');"
        },
        {
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "跳到中间",
          "title1": "把模块跳到中间区域",
          "statusScript": "Site.getAbsMiddleStatus('module471');",
          "evalScript": "Site.absMiddleModule('module471');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "跳到底部",
          "title1": "把模块跳到底部区域",
          "statusScript": "Site.getAbsBottomStatus('module471');",
          "evalScript": "Site.absBottomModule('module471');"
        }]);

        Site.initModuleLayer(474, [{
          "text": "编辑模块",
          "title": "编辑留言提交模块",
          "evalScript": "Site.popupWindow({title:'编辑留言提交模块', frameSrcUrl:'manage/msgSubmitModuleEdit.jsp?id=474&colId=2&extId=0&ram='+Math.random(), width:'350', height:'120', saveBeforePopup:false});"
        },
        {
          "display": "icon",
          "iconClass": "bannerAndBorder",
          "text": "设置样式",
          "title": "设置模块标题栏、边框等样式",
          "evalScript": "Site.functionInterface({'name':'faiSettingPanel.init', 'prompt':true}, {'id':474, 'styleId':75, 'entrance':0});Site.removeAllEditLayer();return false;"
        },
        {
          "text": "管理留言",
          "evalScript": "window.open('/index.jsp?openmf=manageFrameMsgBoard');return false;"
        },
        {
          "text": "添加留言",
          "title": "添加新留言",
          "evalScript": "Site.popupWindow({title:'添加新留言', frameSrcUrl:'manage/msgBoardReply.jsp?mbid=1&ram=' + Math.random(), width:'650', height:'590'});"
        },
        {
          "text": "高级",
          "title": "",
          "className": "setItem",
          "menu": [{
            "display": "icon",
            "iconClass1": "dockModule",
            "text1": "停靠模块",
            "title1": "把模块停靠回固定区域",
            "statusScript": "Site.getDockStatus2('module474');",
            "evalScript": "Site.dock2('module474');"
          },
          {
            "display": "icon",
            "iconClass1": "absModule",
            "text1": "浮动模块",
            "title1": "浮动模块，可随意摆放位置",
            "statusScript": "Site.getAbsStatus2('module474');",
            "evalScript": "Site.floatOut2('module474');"
          },
          {
            "display": "icon",
            "iconClass1": "lock",
            "text1": "锁定模块",
            "title1": "锁定模块在当前位置，不跟随滚动条变化位置",
            "statusScript": "Site.getLockStatus2('module474');",
            "evalScript": "Site.lock2('module474');"
          },
          {
            "display": "icon",
            "iconClass1": "sidem",
            "text1": "侧停模块",
            "title1": "侧边停靠收起模块，支持鼠标移入自动展开",
            "statusScript": "Site.getSideStatus2('module474');",
            "evalScript": "Site.sideModule2('module474');"
          },
          {
            "display": "icon",
            "iconClass1": "flutterm",
            "text1": "飘动模块",
            "title1": "飘动模块,按照轨迹飘动",
            "statusScript": "Site.getFlutterStatus('module474');",
            "evalScript": "Site.flutter('module474');"
          },
          {
            "hrLine": true
          },
          {
            "display": "icon",
            "text": "设为全站模块",
            "title": "把模块添加到整个网站的所有栏目中",
            "iconClass": "global",
            "evalScript": "Site.setGlobalModule(474, true);",
            "statusScript": "Site.getLayoutItemStatus('module474');"
          },
          {
            "display": "icon",
            "text": "加到指定栏目",
            "title": "把模块添加到指定栏目中",
            "iconClass": "apply",
            "evalScript": "Site.applyModuleTo(474);",
            "statusScript": "Site.getLayoutItemStatus('module474');"
          }]
        }], [{
          "display": "icon",
          "text": "隐藏模块",
          "title": "隐藏模块",
          "iconClass": "close",
          "evalScript": "Site.hideModule(474, false);"
        },
        {
          "display": "icon",
          "text": "隐藏标题栏与背景样式",
          "title": "隐藏标题栏与背景样式",
          "iconClass": "clearTB",
          "statusScript": "Site.getOneKeySetModuleTBStatus('module474');",
          "evalScript": "Site.oneKeySetModuleTB(474, true);",
          "setTB": "1"
        },
        {
          "display": "icon",
          "iconClass1": "add",
          "text1": "添加模块",
          "title1": "添加模块",
          "statusScript": "Site.getOpenAddModuleStatus('module474');",
          "evalScript": "Site.openAddModule(474)"
        },
        {
          "display": "icon",
          "iconClass1": "mzindex",
          "text1": "浮到最前",
          "title1": "把模块浮到最前区域",
          "statusScript": "Site.getAbsZIndexStatus('module474');",
          "evalScript": "Site.absZIndexModule('module474');"
        }], [{
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "上移模块",
          "title1": "上移模块",
          "statusScript": "Site.getModulePosTop('module474');",
          "evalScript": "Site.moveModulePosTop('module474');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "下移模块",
          "title1": "下移模块",
          "statusScript": "Site.getModulePosBottom('module474');",
          "evalScript": "Site.moveModulePosBottom('module474');"
        },
        {
          "display": "icon",
          "iconClass1": "mleft",
          "fixClass": "littleBtn",
          "text1": "左移模块",
          "title1": "左移模块",
          "statusScript": "Site.getModulePosLeft('module474');",
          "evalScript": "Site.moveModulePosLeft('module474');"
        },
        {
          "display": "icon",
          "iconClass1": "mright",
          "fixClass": "littleBtn",
          "text1": "右移模块",
          "title1": "右移模块",
          "statusScript": "Site.getModulePosRight('module474');",
          "evalScript": "Site.moveModulePosRight('module474');"
        },
        {
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "跳到中间",
          "title1": "把模块跳到中间区域",
          "statusScript": "Site.getAbsMiddleStatus('module474');",
          "evalScript": "Site.absMiddleModule('module474');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "跳到底部",
          "title1": "把模块跳到底部区域",
          "statusScript": "Site.getAbsBottomStatus('module474');",
          "evalScript": "Site.absBottomModule('module474');"
        }]);

        Site.initModuleMemberLogin(470, 2, true, true);
        Site.initModuleLayer(470, [{
          "text": "编辑模块",
          "title": "编辑会员登录模块",
          "evalScript": "Site.popupWindow({title:'编辑会员登录模块', frameSrcUrl:'manage/memberModuleEdit.jsp?id=470&colId=2&extId=0&ram='+Math.random(), width:'515', height:'400', saveBeforePopup:false});"
        },
        {
          "display": "icon",
          "iconClass": "bannerAndBorder",
          "text": "设置样式",
          "title": "设置模块标题栏、边框等样式",
          "evalScript": "Site.functionInterface({'name':'faiSettingPanel.init', 'prompt':true}, {'id':470, 'styleId':51, 'entrance':0});Site.removeAllEditLayer();return false;"
        },
        {
          "text": "高级",
          "title": "",
          "className": "setItem",
          "menu": [{
            "display": "icon",
            "iconClass1": "dockModule",
            "text1": "停靠模块",
            "title1": "把模块停靠回固定区域",
            "statusScript": "Site.getDockStatus2('module470');",
            "evalScript": "Site.dock2('module470');"
          },
          {
            "display": "icon",
            "iconClass1": "absModule",
            "text1": "浮动模块",
            "title1": "浮动模块，可随意摆放位置",
            "statusScript": "Site.getAbsStatus2('module470');",
            "evalScript": "Site.floatOut2('module470');"
          },
          {
            "display": "icon",
            "iconClass1": "lock",
            "text1": "锁定模块",
            "title1": "锁定模块在当前位置，不跟随滚动条变化位置",
            "statusScript": "Site.getLockStatus2('module470');",
            "evalScript": "Site.lock2('module470');"
          },
          {
            "display": "icon",
            "iconClass1": "sidem",
            "text1": "侧停模块",
            "title1": "侧边停靠收起模块，支持鼠标移入自动展开",
            "statusScript": "Site.getSideStatus2('module470');",
            "evalScript": "Site.sideModule2('module470');"
          },
          {
            "display": "icon",
            "iconClass1": "flutterm",
            "text1": "飘动模块",
            "title1": "飘动模块,按照轨迹飘动",
            "statusScript": "Site.getFlutterStatus('module470');",
            "evalScript": "Site.flutter('module470');"
          },
          {
            "hrLine": true
          },
          {
            "display": "icon",
            "text": "设为全站模块",
            "title": "把模块添加到整个网站的所有栏目中",
            "iconClass": "global",
            "evalScript": "Site.setGlobalModule(470, true);",
            "statusScript": "Site.getLayoutItemStatus('module470');"
          },
          {
            "display": "icon",
            "text": "加到指定栏目",
            "title": "把模块添加到指定栏目中",
            "iconClass": "apply",
            "evalScript": "Site.applyModuleTo(470);",
            "statusScript": "Site.getLayoutItemStatus('module470');"
          }]
        }], [{
          "display": "icon",
          "text": "隐藏模块",
          "title": "隐藏模块",
          "iconClass": "close",
          "evalScript": "Site.hideModule(470, false);"
        },
        {
          "display": "icon",
          "text": "隐藏标题栏与背景样式",
          "title": "隐藏标题栏与背景样式",
          "iconClass": "clearTB",
          "statusScript": "Site.getOneKeySetModuleTBStatus('module470');",
          "evalScript": "Site.oneKeySetModuleTB(470, true);",
          "setTB": "1"
        },
        {
          "display": "icon",
          "iconClass1": "add",
          "text1": "添加模块",
          "title1": "添加模块",
          "statusScript": "Site.getOpenAddModuleStatus('module470');",
          "evalScript": "Site.openAddModule(470)"
        },
        {
          "display": "icon",
          "iconClass1": "mzindex",
          "text1": "浮到最前",
          "title1": "把模块浮到最前区域",
          "statusScript": "Site.getAbsZIndexStatus('module470');",
          "evalScript": "Site.absZIndexModule('module470');"
        }], [{
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "上移模块",
          "title1": "上移模块",
          "statusScript": "Site.getModulePosTop('module470');",
          "evalScript": "Site.moveModulePosTop('module470');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "下移模块",
          "title1": "下移模块",
          "statusScript": "Site.getModulePosBottom('module470');",
          "evalScript": "Site.moveModulePosBottom('module470');"
        },
        {
          "display": "icon",
          "iconClass1": "mleft",
          "fixClass": "littleBtn",
          "text1": "左移模块",
          "title1": "左移模块",
          "statusScript": "Site.getModulePosLeft('module470');",
          "evalScript": "Site.moveModulePosLeft('module470');"
        },
        {
          "display": "icon",
          "iconClass1": "mright",
          "fixClass": "littleBtn",
          "text1": "右移模块",
          "title1": "右移模块",
          "statusScript": "Site.getModulePosRight('module470');",
          "evalScript": "Site.moveModulePosRight('module470');"
        },
        {
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "跳到中间",
          "title1": "把模块跳到中间区域",
          "statusScript": "Site.getAbsMiddleStatus('module470');",
          "evalScript": "Site.absMiddleModule('module470');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "跳到底部",
          "title1": "把模块跳到底部区域",
          "statusScript": "Site.getAbsBottomStatus('module470');",
          "evalScript": "Site.absBottomModule('module470');"
        }]);

        Site.initModuleVote({
          id: '1',
          delay: 0,
          mid: 475,
          isVoted: false
        });
        Site.fixModuleVoteStyle(1, 475);
        Site.initModuleLayer(475, [{
          "text": "编辑模块",
          "title": "编辑在线投票模块",
          "evalScript": "Site.popupWindow({title:'编辑在线投票模块', frameSrcUrl:'manage/voteModuleEdit.jsp?id=475&colId=2&extId=0&ram='+Math.random(), width:'570', height:'468', saveBeforePopup:false});"
        },
        {
          "display": "icon",
          "iconClass": "bannerAndBorder",
          "text": "设置样式",
          "title": "设置模块标题栏、边框等样式",
          "evalScript": "Site.functionInterface({'name':'faiSettingPanel.init', 'prompt':true}, {'id':475, 'styleId':23, 'entrance':0});Site.removeAllEditLayer();return false;"
        },
        {
          "text": "编辑投票",
          "title": "编辑投票选项",
          "evalScript": "Site.popupWindow({title:'编辑投票', frameSrcUrl:'manage/voteEdit.jsp?id=1&ram='+Math.random(), width:'570', height:'468', callArgs:'top'});"
        },
        {
          "text": "高级",
          "title": "",
          "className": "setItem",
          "menu": [{
            "display": "icon",
            "iconClass1": "dockModule",
            "text1": "停靠模块",
            "title1": "把模块停靠回固定区域",
            "statusScript": "Site.getDockStatus2('module475');",
            "evalScript": "Site.dock2('module475');"
          },
          {
            "display": "icon",
            "iconClass1": "absModule",
            "text1": "浮动模块",
            "title1": "浮动模块，可随意摆放位置",
            "statusScript": "Site.getAbsStatus2('module475');",
            "evalScript": "Site.floatOut2('module475');"
          },
          {
            "display": "icon",
            "iconClass1": "lock",
            "text1": "锁定模块",
            "title1": "锁定模块在当前位置，不跟随滚动条变化位置",
            "statusScript": "Site.getLockStatus2('module475');",
            "evalScript": "Site.lock2('module475');"
          },
          {
            "display": "icon",
            "iconClass1": "sidem",
            "text1": "侧停模块",
            "title1": "侧边停靠收起模块，支持鼠标移入自动展开",
            "statusScript": "Site.getSideStatus2('module475');",
            "evalScript": "Site.sideModule2('module475');"
          },
          {
            "display": "icon",
            "iconClass1": "flutterm",
            "text1": "飘动模块",
            "title1": "飘动模块,按照轨迹飘动",
            "statusScript": "Site.getFlutterStatus('module475');",
            "evalScript": "Site.flutter('module475');"
          },
          {
            "hrLine": true
          },
          {
            "display": "icon",
            "text": "设为全站模块",
            "title": "把模块添加到整个网站的所有栏目中",
            "iconClass": "global",
            "evalScript": "Site.setGlobalModule(475, true);",
            "statusScript": "Site.getLayoutItemStatus('module475');"
          },
          {
            "display": "icon",
            "text": "加到指定栏目",
            "title": "把模块添加到指定栏目中",
            "iconClass": "apply",
            "evalScript": "Site.applyModuleTo(475);",
            "statusScript": "Site.getLayoutItemStatus('module475');"
          }]
        }], [{
          "display": "icon",
          "text": "隐藏模块",
          "title": "隐藏模块",
          "iconClass": "close",
          "evalScript": "Site.hideModule(475, false);"
        },
        {
          "display": "icon",
          "text": "隐藏标题栏与背景样式",
          "title": "隐藏标题栏与背景样式",
          "iconClass": "clearTB",
          "statusScript": "Site.getOneKeySetModuleTBStatus('module475');",
          "evalScript": "Site.oneKeySetModuleTB(475, true);",
          "setTB": "1"
        },
        {
          "display": "icon",
          "iconClass1": "add",
          "text1": "添加模块",
          "title1": "添加模块",
          "statusScript": "Site.getOpenAddModuleStatus('module475');",
          "evalScript": "Site.openAddModule(475)"
        },
        {
          "display": "icon",
          "iconClass1": "mzindex",
          "text1": "浮到最前",
          "title1": "把模块浮到最前区域",
          "statusScript": "Site.getAbsZIndexStatus('module475');",
          "evalScript": "Site.absZIndexModule('module475');"
        }], [{
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "上移模块",
          "title1": "上移模块",
          "statusScript": "Site.getModulePosTop('module475');",
          "evalScript": "Site.moveModulePosTop('module475');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "下移模块",
          "title1": "下移模块",
          "statusScript": "Site.getModulePosBottom('module475');",
          "evalScript": "Site.moveModulePosBottom('module475');"
        },
        {
          "display": "icon",
          "iconClass1": "mleft",
          "fixClass": "littleBtn",
          "text1": "左移模块",
          "title1": "左移模块",
          "statusScript": "Site.getModulePosLeft('module475');",
          "evalScript": "Site.moveModulePosLeft('module475');"
        },
        {
          "display": "icon",
          "iconClass1": "mright",
          "fixClass": "littleBtn",
          "text1": "右移模块",
          "title1": "右移模块",
          "statusScript": "Site.getModulePosRight('module475');",
          "evalScript": "Site.moveModulePosRight('module475');"
        },
        {
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "跳到中间",
          "title1": "把模块跳到中间区域",
          "statusScript": "Site.getAbsMiddleStatus('module475');",
          "evalScript": "Site.absMiddleModule('module475');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "跳到底部",
          "title1": "把模块跳到底部区域",
          "statusScript": "Site.getAbsBottomStatus('module475');",
          "evalScript": "Site.absBottomModule('module475');"
        }]);

        Site.initModuleLayer(469, [{
          "text": "编辑模块",
          "title": "编辑在线客服模块",
          "evalScript": "Site.popupWindow({title:'编辑在线客服模块', frameSrcUrl:'manage/serviceOnlineModuleEdit.jsp?id=469&colId=2&extId=0&ram='+Math.random(), width:'655', height:'340', saveBeforePopup:false});"
        },
        {
          "display": "icon",
          "iconClass": "bannerAndBorder",
          "text": "设置样式",
          "title": "设置模块标题栏、边框等样式",
          "evalScript": "Site.functionInterface({'name':'faiSettingPanel.init', 'prompt':true}, {'id':469, 'styleId':40, 'entrance':0});Site.removeAllEditLayer();return false;"
        },
        {
          "text": "高级",
          "title": "",
          "className": "setItem",
          "menu": [{
            "display": "icon",
            "iconClass1": "dockModule",
            "text1": "停靠模块",
            "title1": "把模块停靠回固定区域",
            "statusScript": "Site.getDockStatus2('module469');",
            "evalScript": "Site.dock2('module469');"
          },
          {
            "display": "icon",
            "iconClass1": "absModule",
            "text1": "浮动模块",
            "title1": "浮动模块，可随意摆放位置",
            "statusScript": "Site.getAbsStatus2('module469');",
            "evalScript": "Site.floatOut2('module469');"
          },
          {
            "display": "icon",
            "iconClass1": "lock",
            "text1": "锁定模块",
            "title1": "锁定模块在当前位置，不跟随滚动条变化位置",
            "statusScript": "Site.getLockStatus2('module469');",
            "evalScript": "Site.lock2('module469');"
          },
          {
            "display": "icon",
            "iconClass1": "sidem",
            "text1": "侧停模块",
            "title1": "侧边停靠收起模块，支持鼠标移入自动展开",
            "statusScript": "Site.getSideStatus2('module469');",
            "evalScript": "Site.sideModule2('module469');"
          },
          {
            "display": "icon",
            "iconClass1": "flutterm",
            "text1": "飘动模块",
            "title1": "飘动模块,按照轨迹飘动",
            "statusScript": "Site.getFlutterStatus('module469');",
            "evalScript": "Site.flutter('module469');"
          },
          {
            "hrLine": true
          },
          {
            "display": "icon",
            "text": "设为全站模块",
            "title": "把模块添加到整个网站的所有栏目中",
            "iconClass": "global",
            "evalScript": "Site.setGlobalModule(469, true);",
            "statusScript": "Site.getLayoutItemStatus('module469');"
          },
          {
            "display": "icon",
            "text": "加到指定栏目",
            "title": "把模块添加到指定栏目中",
            "iconClass": "apply",
            "evalScript": "Site.applyModuleTo(469);",
            "statusScript": "Site.getLayoutItemStatus('module469');"
          }]
        }], [{
          "display": "icon",
          "text": "隐藏模块",
          "title": "隐藏模块",
          "iconClass": "close",
          "evalScript": "Site.hideModule(469, false);"
        },
        {
          "display": "icon",
          "text": "隐藏标题栏与背景样式",
          "title": "隐藏标题栏与背景样式",
          "iconClass": "clearTB",
          "statusScript": "Site.getOneKeySetModuleTBStatus('module469');",
          "evalScript": "Site.oneKeySetModuleTB(469, true);",
          "setTB": "1"
        },
        {
          "display": "icon",
          "iconClass1": "add",
          "text1": "添加模块",
          "title1": "添加模块",
          "statusScript": "Site.getOpenAddModuleStatus('module469');",
          "evalScript": "Site.openAddModule(469)"
        },
        {
          "display": "icon",
          "iconClass1": "mzindex",
          "text1": "浮到最前",
          "title1": "把模块浮到最前区域",
          "statusScript": "Site.getAbsZIndexStatus('module469');",
          "evalScript": "Site.absZIndexModule('module469');"
        }], [{
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "上移模块",
          "title1": "上移模块",
          "statusScript": "Site.getModulePosTop('module469');",
          "evalScript": "Site.moveModulePosTop('module469');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "下移模块",
          "title1": "下移模块",
          "statusScript": "Site.getModulePosBottom('module469');",
          "evalScript": "Site.moveModulePosBottom('module469');"
        },
        {
          "display": "icon",
          "iconClass1": "mleft",
          "fixClass": "littleBtn",
          "text1": "左移模块",
          "title1": "左移模块",
          "statusScript": "Site.getModulePosLeft('module469');",
          "evalScript": "Site.moveModulePosLeft('module469');"
        },
        {
          "display": "icon",
          "iconClass1": "mright",
          "fixClass": "littleBtn",
          "text1": "右移模块",
          "title1": "右移模块",
          "statusScript": "Site.getModulePosRight('module469');",
          "evalScript": "Site.moveModulePosRight('module469');"
        },
        {
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "跳到中间",
          "title1": "把模块跳到中间区域",
          "statusScript": "Site.getAbsMiddleStatus('module469');",
          "evalScript": "Site.absMiddleModule('module469');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "跳到底部",
          "title1": "把模块跳到底部区域",
          "statusScript": "Site.getAbsBottomStatus('module469');",
          "evalScript": "Site.absBottomModule('module469');"
        }]);

        Fai.top.photoCard476 = {
          "moduleId": 476,
          "imgEffOption": {
            "effType": 5,
            "borderType": false,
            "borderColor": "#000",
            "borderWidth": 1,
            "borderStyle": 1,
            "fullMaskCusBg": false,
            "fullMaskCusName": false,
            "fullMaskCusDisc": false,
            "fullMaskOpenDisc": false
          },
          "tagetOption": {
            "nameHidden": false,
            "nameWordWrap": true,
            "targetParent": "cardTd",
            "target": "cardDivEffect"
          },
          "moduleType": "photoCard",
          "callback": Site.createImageEffectContent_photo,
          "callbackArgs": []
        };
        Site.initPhotoCard(476);
        Site.initModulePhotoListItemManage({
          'photoParent': 'photoCardOuter476',
          'photo': 'photoCard',
          'photoChild': 'photoCardEdit',
          'moduleId': 476,
          'groupId': 1,
          'groupName': '服务',
          'isOpenImgEff': true,
          'notChild': 'true'
        });
        Site.initModuleLayer(476, [{
          "text": "编辑模块",
          "title": "编辑魔方图册模块",
          "evalScript": "Site.popupWindow({title:'编辑魔方图册模块', frameSrcUrl:'manage/photoCardModuleEdit.jsp?id=476&colId=2&extId=0&ram='+Math.random(), width:'666', height:'594', frameScrolling:'auto', saveBeforePopup:false});"
        },
        {
          "display": "icon",
          "iconClass": "bannerAndBorder",
          "text": "设置样式",
          "title": "设置模块标题栏、边框等样式",
          "evalScript": "Site.functionInterface({'name':'faiSettingPanel.init', 'prompt':true}, {'id':476, 'styleId':83, 'entrance':0});Site.removeAllEditLayer();return false;"
        },
        {
          "text": "编辑图册",
          "title": "编辑图片相册内容",
          "evalScript": "Site.popupWindow({title:'编辑图册', frameSrcUrl:'manage/photoGroupEdit.jsp?id=1&ram='+Math.random(),  width:'750', height:'560', frameScrolling:'auto', beforePopup:true});"
        },
        {
          "text": "高级",
          "title": "",
          "className": "setItem",
          "menu": [{
            "display": "icon",
            "iconClass1": "dockModule",
            "text1": "停靠模块",
            "title1": "把模块停靠回固定区域",
            "statusScript": "Site.getDockStatus2('module476');",
            "evalScript": "Site.dock2('module476');"
          },
          {
            "display": "icon",
            "iconClass1": "absModule",
            "text1": "浮动模块",
            "title1": "浮动模块，可随意摆放位置",
            "statusScript": "Site.getAbsStatus2('module476');",
            "evalScript": "Site.floatOut2('module476');"
          },
          {
            "display": "icon",
            "iconClass1": "lock",
            "text1": "锁定模块",
            "title1": "锁定模块在当前位置，不跟随滚动条变化位置",
            "statusScript": "Site.getLockStatus2('module476');",
            "evalScript": "Site.lock2('module476');"
          },
          {
            "display": "icon",
            "iconClass1": "sidem",
            "text1": "侧停模块",
            "title1": "侧边停靠收起模块，支持鼠标移入自动展开",
            "statusScript": "Site.getSideStatus2('module476');",
            "evalScript": "Site.sideModule2('module476');"
          },
          {
            "display": "icon",
            "iconClass1": "flutterm",
            "text1": "飘动模块",
            "title1": "飘动模块,按照轨迹飘动",
            "statusScript": "Site.getFlutterStatus('module476');",
            "evalScript": "Site.flutter('module476');"
          },
          {
            "hrLine": true
          },
          {
            "display": "icon",
            "text": "设为全站模块",
            "title": "把模块添加到整个网站的所有栏目中",
            "iconClass": "global",
            "evalScript": "Site.setGlobalModule(476, true);",
            "statusScript": "Site.getLayoutItemStatus('module476');"
          },
          {
            "display": "icon",
            "text": "加到指定栏目",
            "title": "把模块添加到指定栏目中",
            "iconClass": "apply",
            "evalScript": "Site.applyModuleTo(476);",
            "statusScript": "Site.getLayoutItemStatus('module476');"
          }]
        }], [{
          "display": "icon",
          "text": "隐藏模块",
          "title": "隐藏模块",
          "iconClass": "close",
          "evalScript": "Site.hideModule(476, false);"
        },
        {
          "display": "icon",
          "text": "隐藏标题栏与背景样式",
          "title": "隐藏标题栏与背景样式",
          "iconClass": "clearTB",
          "statusScript": "Site.getOneKeySetModuleTBStatus('module476');",
          "evalScript": "Site.oneKeySetModuleTB(476, true);",
          "setTB": "1"
        },
        {
          "display": "icon",
          "iconClass1": "add",
          "text1": "添加模块",
          "title1": "添加模块",
          "statusScript": "Site.getOpenAddModuleStatus('module476');",
          "evalScript": "Site.openAddModule(476)"
        },
        {
          "display": "icon",
          "iconClass1": "mzindex",
          "text1": "浮到最前",
          "title1": "把模块浮到最前区域",
          "statusScript": "Site.getAbsZIndexStatus('module476');",
          "evalScript": "Site.absZIndexModule('module476');"
        }], [{
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "上移模块",
          "title1": "上移模块",
          "statusScript": "Site.getModulePosTop('module476');",
          "evalScript": "Site.moveModulePosTop('module476');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "下移模块",
          "title1": "下移模块",
          "statusScript": "Site.getModulePosBottom('module476');",
          "evalScript": "Site.moveModulePosBottom('module476');"
        },
        {
          "display": "icon",
          "iconClass1": "mleft",
          "fixClass": "littleBtn",
          "text1": "左移模块",
          "title1": "左移模块",
          "statusScript": "Site.getModulePosLeft('module476');",
          "evalScript": "Site.moveModulePosLeft('module476');"
        },
        {
          "display": "icon",
          "iconClass1": "mright",
          "fixClass": "littleBtn",
          "text1": "右移模块",
          "title1": "右移模块",
          "statusScript": "Site.getModulePosRight('module476');",
          "evalScript": "Site.moveModulePosRight('module476');"
        },
        {
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "跳到中间",
          "title1": "把模块跳到中间区域",
          "statusScript": "Site.getAbsMiddleStatus('module476');",
          "evalScript": "Site.absMiddleModule('module476');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "跳到底部",
          "title1": "把模块跳到底部区域",
          "statusScript": "Site.getAbsBottomStatus('module476');",
          "evalScript": "Site.absBottomModule('module476');"
        }]);

        Site.initModuleLayer(477, [{
          "text": "编辑模块",
          "title": "编辑图文链接模块",
          "evalScript": "Site.popupWindow({title:'编辑图文链接模块', frameSrcUrl:'manage/linkModuleEdit.jsp?id=477&colId=2&extId=0&ram='+Math.random(), width:'650', height:'360', saveBeforePopup:false});"
        },
        {
          "display": "icon",
          "iconClass": "bannerAndBorder",
          "text": "设置样式",
          "title": "设置模块标题栏、边框等样式",
          "evalScript": "Site.functionInterface({'name':'faiSettingPanel.init', 'prompt':true}, {'id':477, 'styleId':33, 'entrance':0});Site.removeAllEditLayer();return false;"
        },
        {
          "text": "高级",
          "title": "",
          "className": "setItem",
          "menu": [{
            "display": "icon",
            "iconClass1": "dockModule",
            "text1": "停靠模块",
            "title1": "把模块停靠回固定区域",
            "statusScript": "Site.getDockStatus2('module477');",
            "evalScript": "Site.dock2('module477');"
          },
          {
            "display": "icon",
            "iconClass1": "absModule",
            "text1": "浮动模块",
            "title1": "浮动模块，可随意摆放位置",
            "statusScript": "Site.getAbsStatus2('module477');",
            "evalScript": "Site.floatOut2('module477');"
          },
          {
            "display": "icon",
            "iconClass1": "lock",
            "text1": "锁定模块",
            "title1": "锁定模块在当前位置，不跟随滚动条变化位置",
            "statusScript": "Site.getLockStatus2('module477');",
            "evalScript": "Site.lock2('module477');"
          },
          {
            "display": "icon",
            "iconClass1": "sidem",
            "text1": "侧停模块",
            "title1": "侧边停靠收起模块，支持鼠标移入自动展开",
            "statusScript": "Site.getSideStatus2('module477');",
            "evalScript": "Site.sideModule2('module477');"
          },
          {
            "display": "icon",
            "iconClass1": "flutterm",
            "text1": "飘动模块",
            "title1": "飘动模块,按照轨迹飘动",
            "statusScript": "Site.getFlutterStatus('module477');",
            "evalScript": "Site.flutter('module477');"
          },
          {
            "hrLine": true
          },
          {
            "display": "icon",
            "text": "设为全站模块",
            "title": "把模块添加到整个网站的所有栏目中",
            "iconClass": "global",
            "evalScript": "Site.setGlobalModule(477, true);",
            "statusScript": "Site.getLayoutItemStatus('module477');"
          },
          {
            "display": "icon",
            "text": "加到指定栏目",
            "title": "把模块添加到指定栏目中",
            "iconClass": "apply",
            "evalScript": "Site.applyModuleTo(477);",
            "statusScript": "Site.getLayoutItemStatus('module477');"
          }]
        }], [{
          "display": "icon",
          "text": "隐藏模块",
          "title": "隐藏模块",
          "iconClass": "close",
          "evalScript": "Site.hideModule(477, false);"
        },
        {
          "display": "icon",
          "text": "隐藏标题栏与背景样式",
          "title": "隐藏标题栏与背景样式",
          "iconClass": "clearTB",
          "statusScript": "Site.getOneKeySetModuleTBStatus('module477');",
          "evalScript": "Site.oneKeySetModuleTB(477, true);",
          "setTB": "1"
        },
        {
          "display": "icon",
          "iconClass1": "add",
          "text1": "添加模块",
          "title1": "添加模块",
          "statusScript": "Site.getOpenAddModuleStatus('module477');",
          "evalScript": "Site.openAddModule(477)"
        },
        {
          "display": "icon",
          "iconClass1": "mzindex",
          "text1": "浮到最前",
          "title1": "把模块浮到最前区域",
          "statusScript": "Site.getAbsZIndexStatus('module477');",
          "evalScript": "Site.absZIndexModule('module477');"
        }], [{
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "上移模块",
          "title1": "上移模块",
          "statusScript": "Site.getModulePosTop('module477');",
          "evalScript": "Site.moveModulePosTop('module477');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "下移模块",
          "title1": "下移模块",
          "statusScript": "Site.getModulePosBottom('module477');",
          "evalScript": "Site.moveModulePosBottom('module477');"
        },
        {
          "display": "icon",
          "iconClass1": "mleft",
          "fixClass": "littleBtn",
          "text1": "左移模块",
          "title1": "左移模块",
          "statusScript": "Site.getModulePosLeft('module477');",
          "evalScript": "Site.moveModulePosLeft('module477');"
        },
        {
          "display": "icon",
          "iconClass1": "mright",
          "fixClass": "littleBtn",
          "text1": "右移模块",
          "title1": "右移模块",
          "statusScript": "Site.getModulePosRight('module477');",
          "evalScript": "Site.moveModulePosRight('module477');"
        },
        {
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "跳到中间",
          "title1": "把模块跳到中间区域",
          "statusScript": "Site.getAbsMiddleStatus('module477');",
          "evalScript": "Site.absMiddleModule('module477');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "跳到底部",
          "title1": "把模块跳到底部区域",
          "statusScript": "Site.getAbsBottomStatus('module477');",
          "evalScript": "Site.absBottomModule('module477');"
        }]);

        Site.foldChange(478);
        Site.initModuleLayer(478, [{
          "text": "编辑模块",
          "title": "编辑文章分类模块",
          "evalScript": "Site.popupWindow({title:'编辑文章分类模块', frameSrcUrl:'manage/newsGroupModuleEdit.jsp?id=478&colId=2&extId=0&ram='+Math.random(), width:'500', height:'280', saveBeforePopup:false});"
        },
        {
          "display": "icon",
          "iconClass": "bannerAndBorder",
          "text": "设置样式",
          "title": "设置模块标题栏、边框等样式",
          "evalScript": "Site.functionInterface({'name':'faiSettingPanel.init', 'prompt':true}, {'id':478, 'styleId':24, 'entrance':0});Site.removeAllEditLayer();return false;"
        },
        {
          "text": "管理分类",
          "title": "管理文章分类",
          "evalScript": "Site.popupWindow({title:'管理文章分类', frameSrcUrl:'manage/newsGroupEdit.jsp?ram='+Math.random(), width:'390', height:'260', saveBeforePopup:true, beforePopup:true});"
        },
        {
          "text": "高级",
          "title": "",
          "className": "setItem",
          "menu": [{
            "display": "icon",
            "iconClass1": "dockModule",
            "text1": "停靠模块",
            "title1": "把模块停靠回固定区域",
            "statusScript": "Site.getDockStatus2('module478');",
            "evalScript": "Site.dock2('module478');"
          },
          {
            "display": "icon",
            "iconClass1": "absModule",
            "text1": "浮动模块",
            "title1": "浮动模块，可随意摆放位置",
            "statusScript": "Site.getAbsStatus2('module478');",
            "evalScript": "Site.floatOut2('module478');"
          },
          {
            "display": "icon",
            "iconClass1": "lock",
            "text1": "锁定模块",
            "title1": "锁定模块在当前位置，不跟随滚动条变化位置",
            "statusScript": "Site.getLockStatus2('module478');",
            "evalScript": "Site.lock2('module478');"
          },
          {
            "display": "icon",
            "iconClass1": "sidem",
            "text1": "侧停模块",
            "title1": "侧边停靠收起模块，支持鼠标移入自动展开",
            "statusScript": "Site.getSideStatus2('module478');",
            "evalScript": "Site.sideModule2('module478');"
          },
          {
            "display": "icon",
            "iconClass1": "flutterm",
            "text1": "飘动模块",
            "title1": "飘动模块,按照轨迹飘动",
            "statusScript": "Site.getFlutterStatus('module478');",
            "evalScript": "Site.flutter('module478');"
          },
          {
            "hrLine": true
          },
          {
            "display": "icon",
            "text": "设为全站模块",
            "title": "把模块添加到整个网站的所有栏目中",
            "iconClass": "global",
            "evalScript": "Site.setGlobalModule(478, true);",
            "statusScript": "Site.getLayoutItemStatus('module478');"
          },
          {
            "display": "icon",
            "text": "加到指定栏目",
            "title": "把模块添加到指定栏目中",
            "iconClass": "apply",
            "evalScript": "Site.applyModuleTo(478);",
            "statusScript": "Site.getLayoutItemStatus('module478');"
          }]
        }], [{
          "display": "icon",
          "text": "隐藏模块",
          "title": "隐藏模块",
          "iconClass": "close",
          "evalScript": "Site.hideModule(478, false);"
        },
        {
          "display": "icon",
          "text": "隐藏标题栏与背景样式",
          "title": "隐藏标题栏与背景样式",
          "iconClass": "clearTB",
          "statusScript": "Site.getOneKeySetModuleTBStatus('module478');",
          "evalScript": "Site.oneKeySetModuleTB(478, true);",
          "setTB": "1"
        },
        {
          "display": "icon",
          "iconClass1": "add",
          "text1": "添加模块",
          "title1": "添加模块",
          "statusScript": "Site.getOpenAddModuleStatus('module478');",
          "evalScript": "Site.openAddModule(478)"
        },
        {
          "display": "icon",
          "iconClass1": "mzindex",
          "text1": "浮到最前",
          "title1": "把模块浮到最前区域",
          "statusScript": "Site.getAbsZIndexStatus('module478');",
          "evalScript": "Site.absZIndexModule('module478');"
        }], [{
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "上移模块",
          "title1": "上移模块",
          "statusScript": "Site.getModulePosTop('module478');",
          "evalScript": "Site.moveModulePosTop('module478');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "下移模块",
          "title1": "下移模块",
          "statusScript": "Site.getModulePosBottom('module478');",
          "evalScript": "Site.moveModulePosBottom('module478');"
        },
        {
          "display": "icon",
          "iconClass1": "mleft",
          "fixClass": "littleBtn",
          "text1": "左移模块",
          "title1": "左移模块",
          "statusScript": "Site.getModulePosLeft('module478');",
          "evalScript": "Site.moveModulePosLeft('module478');"
        },
        {
          "display": "icon",
          "iconClass1": "mright",
          "fixClass": "littleBtn",
          "text1": "右移模块",
          "title1": "右移模块",
          "statusScript": "Site.getModulePosRight('module478');",
          "evalScript": "Site.moveModulePosRight('module478');"
        },
        {
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "跳到中间",
          "title1": "把模块跳到中间区域",
          "statusScript": "Site.getAbsMiddleStatus('module478');",
          "evalScript": "Site.absMiddleModule('module478');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "跳到底部",
          "title1": "把模块跳到底部区域",
          "statusScript": "Site.getAbsBottomStatus('module478');",
          "evalScript": "Site.absBottomModule('module478');"
        }]);

        $('#pagenation480').find('a').hover(function() {
          $(this).addClass('g_hover')
        },
        function() {
          $(this).removeClass('g_hover')
        });
        Site.initModuleFileList(480);
        Site.initModuleLayer(480, [{
          "text": "编辑模块",
          "title": "编辑文件下载模块",
          "evalScript": "Site.popupWindow({title:'编辑文件下载模块', frameSrcUrl:'manage/fileModuleEdit.jsp?id=480&colId=2&extId=0&ram='+Math.random(), width:'530', height:'330', saveBeforePopup:false});"
        },
        {
          "display": "icon",
          "iconClass": "bannerAndBorder",
          "text": "设置样式",
          "title": "设置模块标题栏、边框等样式",
          "evalScript": "Site.functionInterface({'name':'faiSettingPanel.init', 'prompt':true}, {'id':480, 'styleId':10, 'entrance':0});Site.removeAllEditLayer();return false;"
        },
        {
          "text": "高级",
          "title": "",
          "className": "setItem",
          "menu": [{
            "display": "icon",
            "iconClass1": "dockModule",
            "text1": "停靠模块",
            "title1": "把模块停靠回固定区域",
            "statusScript": "Site.getDockStatus2('module480');",
            "evalScript": "Site.dock2('module480');"
          },
          {
            "display": "icon",
            "iconClass1": "absModule",
            "text1": "浮动模块",
            "title1": "浮动模块，可随意摆放位置",
            "statusScript": "Site.getAbsStatus2('module480');",
            "evalScript": "Site.floatOut2('module480');"
          },
          {
            "display": "icon",
            "iconClass1": "lock",
            "text1": "锁定模块",
            "title1": "锁定模块在当前位置，不跟随滚动条变化位置",
            "statusScript": "Site.getLockStatus2('module480');",
            "evalScript": "Site.lock2('module480');"
          },
          {
            "display": "icon",
            "iconClass1": "sidem",
            "text1": "侧停模块",
            "title1": "侧边停靠收起模块，支持鼠标移入自动展开",
            "statusScript": "Site.getSideStatus2('module480');",
            "evalScript": "Site.sideModule2('module480');"
          },
          {
            "display": "icon",
            "iconClass1": "flutterm",
            "text1": "飘动模块",
            "title1": "飘动模块,按照轨迹飘动",
            "statusScript": "Site.getFlutterStatus('module480');",
            "evalScript": "Site.flutter('module480');"
          },
          {
            "hrLine": true
          },
          {
            "display": "icon",
            "text": "设为全站模块",
            "title": "把模块添加到整个网站的所有栏目中",
            "iconClass": "global",
            "evalScript": "Site.setGlobalModule(480, true);",
            "statusScript": "Site.getLayoutItemStatus('module480');"
          },
          {
            "display": "icon",
            "text": "加到指定栏目",
            "title": "把模块添加到指定栏目中",
            "iconClass": "apply",
            "evalScript": "Site.applyModuleTo(480);",
            "statusScript": "Site.getLayoutItemStatus('module480');"
          }]
        }], [{
          "display": "icon",
          "text": "隐藏模块",
          "title": "隐藏模块",
          "iconClass": "close",
          "evalScript": "Site.hideModule(480, false);"
        },
        {
          "display": "icon",
          "text": "隐藏标题栏与背景样式",
          "title": "隐藏标题栏与背景样式",
          "iconClass": "clearTB",
          "statusScript": "Site.getOneKeySetModuleTBStatus('module480');",
          "evalScript": "Site.oneKeySetModuleTB(480, true);",
          "setTB": "1"
        },
        {
          "display": "icon",
          "iconClass1": "add",
          "text1": "添加模块",
          "title1": "添加模块",
          "statusScript": "Site.getOpenAddModuleStatus('module480');",
          "evalScript": "Site.openAddModule(480)"
        },
        {
          "display": "icon",
          "iconClass1": "mzindex",
          "text1": "浮到最前",
          "title1": "把模块浮到最前区域",
          "statusScript": "Site.getAbsZIndexStatus('module480');",
          "evalScript": "Site.absZIndexModule('module480');"
        }], [{
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "上移模块",
          "title1": "上移模块",
          "statusScript": "Site.getModulePosTop('module480');",
          "evalScript": "Site.moveModulePosTop('module480');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "下移模块",
          "title1": "下移模块",
          "statusScript": "Site.getModulePosBottom('module480');",
          "evalScript": "Site.moveModulePosBottom('module480');"
        },
        {
          "display": "icon",
          "iconClass1": "mleft",
          "fixClass": "littleBtn",
          "text1": "左移模块",
          "title1": "左移模块",
          "statusScript": "Site.getModulePosLeft('module480');",
          "evalScript": "Site.moveModulePosLeft('module480');"
        },
        {
          "display": "icon",
          "iconClass1": "mright",
          "fixClass": "littleBtn",
          "text1": "右移模块",
          "title1": "右移模块",
          "statusScript": "Site.getModulePosRight('module480');",
          "evalScript": "Site.moveModulePosRight('module480');"
        },
        {
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "跳到中间",
          "title1": "把模块跳到中间区域",
          "statusScript": "Site.getAbsMiddleStatus('module480');",
          "evalScript": "Site.absMiddleModule('module480');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "跳到底部",
          "title1": "把模块跳到底部区域",
          "statusScript": "Site.getAbsBottomStatus('module480');",
          "evalScript": "Site.absBottomModule('module480');"
        }]);

        Site.initModuleLayer(481, [{
          "text": "编辑模块",
          "title": "编辑在线视频模块",
          "evalScript": "Site.popupWindow({title:'编辑在线视频模块', frameSrcUrl:'manage/flvModuleEdit.jsp?id=481&colId=2&extId=0&ram='+Math.random(), width:'400', height:'220', saveBeforePopup:false});"
        },
        {
          "display": "icon",
          "iconClass": "bannerAndBorder",
          "text": "设置样式",
          "title": "设置模块标题栏、边框等样式",
          "evalScript": "Site.functionInterface({'name':'faiSettingPanel.init', 'prompt':true}, {'id':481, 'styleId':36, 'entrance':0});Site.removeAllEditLayer();return false;"
        },
        {
          "text": "高级",
          "title": "",
          "className": "setItem",
          "menu": [{
            "display": "icon",
            "iconClass1": "dockModule",
            "text1": "停靠模块",
            "title1": "把模块停靠回固定区域",
            "statusScript": "Site.getDockStatus2('module481');",
            "evalScript": "Site.dock2('module481');"
          },
          {
            "display": "icon",
            "iconClass1": "absModule",
            "text1": "浮动模块",
            "title1": "浮动模块，可随意摆放位置",
            "statusScript": "Site.getAbsStatus2('module481');",
            "evalScript": "Site.floatOut2('module481');"
          },
          {
            "display": "icon",
            "iconClass1": "lock",
            "text1": "锁定模块",
            "title1": "锁定模块在当前位置，不跟随滚动条变化位置",
            "statusScript": "Site.getLockStatus2('module481');",
            "evalScript": "Site.lock2('module481');"
          },
          {
            "display": "icon",
            "iconClass1": "sidem",
            "text1": "侧停模块",
            "title1": "侧边停靠收起模块，支持鼠标移入自动展开",
            "statusScript": "Site.getSideStatus2('module481');",
            "evalScript": "Site.sideModule2('module481');"
          },
          {
            "display": "icon",
            "iconClass1": "flutterm",
            "text1": "飘动模块",
            "title1": "飘动模块,按照轨迹飘动",
            "statusScript": "Site.getFlutterStatus('module481');",
            "evalScript": "Site.flutter('module481');"
          },
          {
            "hrLine": true
          },
          {
            "display": "icon",
            "text": "设为全站模块",
            "title": "把模块添加到整个网站的所有栏目中",
            "iconClass": "global",
            "evalScript": "Site.setGlobalModule(481, true);",
            "statusScript": "Site.getLayoutItemStatus('module481');"
          },
          {
            "display": "icon",
            "text": "加到指定栏目",
            "title": "把模块添加到指定栏目中",
            "iconClass": "apply",
            "evalScript": "Site.applyModuleTo(481);",
            "statusScript": "Site.getLayoutItemStatus('module481');"
          }]
        }], [{
          "display": "icon",
          "text": "隐藏模块",
          "title": "隐藏模块",
          "iconClass": "close",
          "evalScript": "Site.hideModule(481, false);"
        },
        {
          "display": "icon",
          "text": "隐藏标题栏与背景样式",
          "title": "隐藏标题栏与背景样式",
          "iconClass": "clearTB",
          "statusScript": "Site.getOneKeySetModuleTBStatus('module481');",
          "evalScript": "Site.oneKeySetModuleTB(481, true);",
          "setTB": "1"
        },
        {
          "display": "icon",
          "iconClass1": "add",
          "text1": "添加模块",
          "title1": "添加模块",
          "statusScript": "Site.getOpenAddModuleStatus('module481');",
          "evalScript": "Site.openAddModule(481)"
        },
        {
          "display": "icon",
          "iconClass1": "mzindex",
          "text1": "浮到最前",
          "title1": "把模块浮到最前区域",
          "statusScript": "Site.getAbsZIndexStatus('module481');",
          "evalScript": "Site.absZIndexModule('module481');"
        }], [{
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "上移模块",
          "title1": "上移模块",
          "statusScript": "Site.getModulePosTop('module481');",
          "evalScript": "Site.moveModulePosTop('module481');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "下移模块",
          "title1": "下移模块",
          "statusScript": "Site.getModulePosBottom('module481');",
          "evalScript": "Site.moveModulePosBottom('module481');"
        },
        {
          "display": "icon",
          "iconClass1": "mleft",
          "fixClass": "littleBtn",
          "text1": "左移模块",
          "title1": "左移模块",
          "statusScript": "Site.getModulePosLeft('module481');",
          "evalScript": "Site.moveModulePosLeft('module481');"
        },
        {
          "display": "icon",
          "iconClass1": "mright",
          "fixClass": "littleBtn",
          "text1": "右移模块",
          "title1": "右移模块",
          "statusScript": "Site.getModulePosRight('module481');",
          "evalScript": "Site.moveModulePosRight('module481');"
        },
        {
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "跳到中间",
          "title1": "把模块跳到中间区域",
          "statusScript": "Site.getAbsMiddleStatus('module481');",
          "evalScript": "Site.absMiddleModule('module481');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "跳到底部",
          "title1": "把模块跳到底部区域",
          "statusScript": "Site.getAbsBottomStatus('module481');",
          "evalScript": "Site.absBottomModule('module481');"
        }]);

        Site.initWeatherOfIP(460, 15);
        Site.initModuleLayer(460, [{
          "text": "编辑模块",
          "title": "编辑天气信息模块",
          "evalScript": "Site.popupWindow({title:'编辑天气信息模块', frameSrcUrl:'manage/weatherModuleEdit.jsp?id=460&colId=2&extId=0&ram='+Math.random(), width:'530', height:'340', saveBeforePopup:false});"
        },
        {
          "display": "icon",
          "iconClass": "bannerAndBorder",
          "text": "设置样式",
          "title": "设置模块标题栏、边框等样式",
          "evalScript": "Site.functionInterface({'name':'faiSettingPanel.init', 'prompt':true}, {'id':460, 'styleId':28, 'entrance':0});Site.removeAllEditLayer();return false;"
        },
        {
          "text": "高级",
          "title": "",
          "className": "setItem",
          "menu": [{
            "display": "icon",
            "iconClass1": "dockModule",
            "text1": "停靠模块",
            "title1": "把模块停靠回固定区域",
            "statusScript": "Site.getDockStatus2('module460');",
            "evalScript": "Site.dock2('module460');"
          },
          {
            "display": "icon",
            "iconClass1": "absModule",
            "text1": "浮动模块",
            "title1": "浮动模块，可随意摆放位置",
            "statusScript": "Site.getAbsStatus2('module460');",
            "evalScript": "Site.floatOut2('module460');"
          },
          {
            "display": "icon",
            "iconClass1": "lock",
            "text1": "锁定模块",
            "title1": "锁定模块在当前位置，不跟随滚动条变化位置",
            "statusScript": "Site.getLockStatus2('module460');",
            "evalScript": "Site.lock2('module460');"
          },
          {
            "display": "icon",
            "iconClass1": "sidem",
            "text1": "侧停模块",
            "title1": "侧边停靠收起模块，支持鼠标移入自动展开",
            "statusScript": "Site.getSideStatus2('module460');",
            "evalScript": "Site.sideModule2('module460');"
          },
          {
            "display": "icon",
            "iconClass1": "flutterm",
            "text1": "飘动模块",
            "title1": "飘动模块,按照轨迹飘动",
            "statusScript": "Site.getFlutterStatus('module460');",
            "evalScript": "Site.flutter('module460');"
          },
          {
            "hrLine": true
          },
          {
            "display": "icon",
            "text": "设为全站模块",
            "title": "把模块添加到整个网站的所有栏目中",
            "iconClass": "global",
            "evalScript": "Site.setGlobalModule(460, true);",
            "statusScript": "Site.getLayoutItemStatus('module460');"
          },
          {
            "display": "icon",
            "text": "加到指定栏目",
            "title": "把模块添加到指定栏目中",
            "iconClass": "apply",
            "evalScript": "Site.applyModuleTo(460);",
            "statusScript": "Site.getLayoutItemStatus('module460');"
          }]
        }], [{
          "display": "icon",
          "text": "隐藏模块",
          "title": "隐藏模块",
          "iconClass": "close",
          "evalScript": "Site.hideModule(460, false);"
        },
        {
          "display": "icon",
          "text": "隐藏标题栏与背景样式",
          "title": "隐藏标题栏与背景样式",
          "iconClass": "clearTB",
          "statusScript": "Site.getOneKeySetModuleTBStatus('module460');",
          "evalScript": "Site.oneKeySetModuleTB(460, true);",
          "setTB": "1"
        },
        {
          "display": "icon",
          "iconClass1": "add",
          "text1": "添加模块",
          "title1": "添加模块",
          "statusScript": "Site.getOpenAddModuleStatus('module460');",
          "evalScript": "Site.openAddModule(460)"
        },
        {
          "display": "icon",
          "iconClass1": "mzindex",
          "text1": "浮到最前",
          "title1": "把模块浮到最前区域",
          "statusScript": "Site.getAbsZIndexStatus('module460');",
          "evalScript": "Site.absZIndexModule('module460');"
        }], [{
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "上移模块",
          "title1": "上移模块",
          "statusScript": "Site.getModulePosTop('module460');",
          "evalScript": "Site.moveModulePosTop('module460');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "下移模块",
          "title1": "下移模块",
          "statusScript": "Site.getModulePosBottom('module460');",
          "evalScript": "Site.moveModulePosBottom('module460');"
        },
        {
          "display": "icon",
          "iconClass1": "mleft",
          "fixClass": "littleBtn",
          "text1": "左移模块",
          "title1": "左移模块",
          "statusScript": "Site.getModulePosLeft('module460');",
          "evalScript": "Site.moveModulePosLeft('module460');"
        },
        {
          "display": "icon",
          "iconClass1": "mright",
          "fixClass": "littleBtn",
          "text1": "右移模块",
          "title1": "右移模块",
          "statusScript": "Site.getModulePosRight('module460');",
          "evalScript": "Site.moveModulePosRight('module460');"
        },
        {
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "跳到中间",
          "title1": "把模块跳到中间区域",
          "statusScript": "Site.getAbsMiddleStatus('module460');",
          "evalScript": "Site.absMiddleModule('module460');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "跳到底部",
          "title1": "把模块跳到底部区域",
          "statusScript": "Site.getAbsBottomStatus('module460');",
          "evalScript": "Site.absBottomModule('module460');"
        }]);

        Site.initModuleBdMap('mapframe', 482, 'mapPanel.jsp?id=482&w=', false);
        Site.initModuleLayer(482, [{
          "text": "编辑模块",
          "title": "编辑在线地图模块",
          "evalScript": "Site.popupWindow({title:'编辑在线地图模块', frameSrcUrl:'manage/mapModuleEdit.jsp?id=482&colId=2&extId=0&ram='+Math.random(), width:'640', height:'500', saveBeforePopup:false});"
        },
        {
          "display": "icon",
          "iconClass": "bannerAndBorder",
          "text": "设置样式",
          "title": "设置模块标题栏、边框等样式",
          "evalScript": "Site.functionInterface({'name':'faiSettingPanel.init', 'prompt':true}, {'id':482, 'styleId':18, 'entrance':0});Site.removeAllEditLayer();return false;"
        },
        {
          "text": "高级",
          "title": "",
          "className": "setItem",
          "menu": [{
            "display": "icon",
            "iconClass1": "dockModule",
            "text1": "停靠模块",
            "title1": "把模块停靠回固定区域",
            "statusScript": "Site.getDockStatus2('module482');",
            "evalScript": "Site.dock2('module482');"
          },
          {
            "display": "icon",
            "iconClass1": "absModule",
            "text1": "浮动模块",
            "title1": "浮动模块，可随意摆放位置",
            "statusScript": "Site.getAbsStatus2('module482');",
            "evalScript": "Site.floatOut2('module482');"
          },
          {
            "display": "icon",
            "iconClass1": "lock",
            "text1": "锁定模块",
            "title1": "锁定模块在当前位置，不跟随滚动条变化位置",
            "statusScript": "Site.getLockStatus2('module482');",
            "evalScript": "Site.lock2('module482');"
          },
          {
            "display": "icon",
            "iconClass1": "sidem",
            "text1": "侧停模块",
            "title1": "侧边停靠收起模块，支持鼠标移入自动展开",
            "statusScript": "Site.getSideStatus2('module482');",
            "evalScript": "Site.sideModule2('module482');"
          },
          {
            "display": "icon",
            "iconClass1": "flutterm",
            "text1": "飘动模块",
            "title1": "飘动模块,按照轨迹飘动",
            "statusScript": "Site.getFlutterStatus('module482');",
            "evalScript": "Site.flutter('module482');"
          },
          {
            "hrLine": true
          },
          {
            "display": "icon",
            "text": "设为全站模块",
            "title": "把模块添加到整个网站的所有栏目中",
            "iconClass": "global",
            "evalScript": "Site.setGlobalModule(482, true);",
            "statusScript": "Site.getLayoutItemStatus('module482');"
          },
          {
            "display": "icon",
            "text": "加到指定栏目",
            "title": "把模块添加到指定栏目中",
            "iconClass": "apply",
            "evalScript": "Site.applyModuleTo(482);",
            "statusScript": "Site.getLayoutItemStatus('module482');"
          }]
        }], [{
          "display": "icon",
          "text": "隐藏模块",
          "title": "隐藏模块",
          "iconClass": "close",
          "evalScript": "Site.hideModule(482, false);"
        },
        {
          "display": "icon",
          "text": "隐藏标题栏与背景样式",
          "title": "隐藏标题栏与背景样式",
          "iconClass": "clearTB",
          "statusScript": "Site.getOneKeySetModuleTBStatus('module482');",
          "evalScript": "Site.oneKeySetModuleTB(482, true);",
          "setTB": "1"
        },
        {
          "display": "icon",
          "iconClass1": "add",
          "text1": "添加模块",
          "title1": "添加模块",
          "statusScript": "Site.getOpenAddModuleStatus('module482');",
          "evalScript": "Site.openAddModule(482)"
        },
        {
          "display": "icon",
          "iconClass1": "mzindex",
          "text1": "浮到最前",
          "title1": "把模块浮到最前区域",
          "statusScript": "Site.getAbsZIndexStatus('module482');",
          "evalScript": "Site.absZIndexModule('module482');"
        }], [{
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "上移模块",
          "title1": "上移模块",
          "statusScript": "Site.getModulePosTop('module482');",
          "evalScript": "Site.moveModulePosTop('module482');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "下移模块",
          "title1": "下移模块",
          "statusScript": "Site.getModulePosBottom('module482');",
          "evalScript": "Site.moveModulePosBottom('module482');"
        },
        {
          "display": "icon",
          "iconClass1": "mleft",
          "fixClass": "littleBtn",
          "text1": "左移模块",
          "title1": "左移模块",
          "statusScript": "Site.getModulePosLeft('module482');",
          "evalScript": "Site.moveModulePosLeft('module482');"
        },
        {
          "display": "icon",
          "iconClass1": "mright",
          "fixClass": "littleBtn",
          "text1": "右移模块",
          "title1": "右移模块",
          "statusScript": "Site.getModulePosRight('module482');",
          "evalScript": "Site.moveModulePosRight('module482');"
        },
        {
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "跳到中间",
          "title1": "把模块跳到中间区域",
          "statusScript": "Site.getAbsMiddleStatus('module482');",
          "evalScript": "Site.absMiddleModule('module482');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "跳到底部",
          "title1": "把模块跳到底部区域",
          "statusScript": "Site.getAbsBottomStatus('module482');",
          "evalScript": "Site.absBottomModule('module482');"
        }]);

        Site.initModuleLayer(484, [{
          "text": "编辑模块",
          "title": "编辑表格模块",
          "evalScript": "Site.popupWindow({title:'编辑表格模块', frameSrcUrl:'manage/tableModuleEdit.jsp?id=484&colId=2&extId=0&ram='+Math.random(), width:'630', height:'355', saveBeforePopup:false});"
        },
        {
          "display": "icon",
          "iconClass": "bannerAndBorder",
          "text": "设置样式",
          "title": "设置模块标题栏、边框等样式",
          "evalScript": "Site.functionInterface({'name':'faiSettingPanel.init', 'prompt':true}, {'id':484, 'styleId':34, 'entrance':0});Site.removeAllEditLayer();return false;"
        },
        {
          "text": "高级",
          "title": "",
          "className": "setItem",
          "menu": [{
            "display": "icon",
            "iconClass1": "dockModule",
            "text1": "停靠模块",
            "title1": "把模块停靠回固定区域",
            "statusScript": "Site.getDockStatus2('module484');",
            "evalScript": "Site.dock2('module484');"
          },
          {
            "display": "icon",
            "iconClass1": "absModule",
            "text1": "浮动模块",
            "title1": "浮动模块，可随意摆放位置",
            "statusScript": "Site.getAbsStatus2('module484');",
            "evalScript": "Site.floatOut2('module484');"
          },
          {
            "display": "icon",
            "iconClass1": "lock",
            "text1": "锁定模块",
            "title1": "锁定模块在当前位置，不跟随滚动条变化位置",
            "statusScript": "Site.getLockStatus2('module484');",
            "evalScript": "Site.lock2('module484');"
          },
          {
            "display": "icon",
            "iconClass1": "sidem",
            "text1": "侧停模块",
            "title1": "侧边停靠收起模块，支持鼠标移入自动展开",
            "statusScript": "Site.getSideStatus2('module484');",
            "evalScript": "Site.sideModule2('module484');"
          },
          {
            "display": "icon",
            "iconClass1": "flutterm",
            "text1": "飘动模块",
            "title1": "飘动模块,按照轨迹飘动",
            "statusScript": "Site.getFlutterStatus('module484');",
            "evalScript": "Site.flutter('module484');"
          },
          {
            "hrLine": true
          },
          {
            "display": "icon",
            "text": "设为全站模块",
            "title": "把模块添加到整个网站的所有栏目中",
            "iconClass": "global",
            "evalScript": "Site.setGlobalModule(484, true);",
            "statusScript": "Site.getLayoutItemStatus('module484');"
          },
          {
            "display": "icon",
            "text": "加到指定栏目",
            "title": "把模块添加到指定栏目中",
            "iconClass": "apply",
            "evalScript": "Site.applyModuleTo(484);",
            "statusScript": "Site.getLayoutItemStatus('module484');"
          }]
        }], [{
          "display": "icon",
          "text": "隐藏模块",
          "title": "隐藏模块",
          "iconClass": "close",
          "evalScript": "Site.hideModule(484, false);"
        },
        {
          "display": "icon",
          "text": "隐藏标题栏与背景样式",
          "title": "隐藏标题栏与背景样式",
          "iconClass": "clearTB",
          "statusScript": "Site.getOneKeySetModuleTBStatus('module484');",
          "evalScript": "Site.oneKeySetModuleTB(484, true);",
          "setTB": "1"
        },
        {
          "display": "icon",
          "iconClass1": "add",
          "text1": "添加模块",
          "title1": "添加模块",
          "statusScript": "Site.getOpenAddModuleStatus('module484');",
          "evalScript": "Site.openAddModule(484)"
        },
        {
          "display": "icon",
          "iconClass1": "mzindex",
          "text1": "浮到最前",
          "title1": "把模块浮到最前区域",
          "statusScript": "Site.getAbsZIndexStatus('module484');",
          "evalScript": "Site.absZIndexModule('module484');"
        }], [{
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "上移模块",
          "title1": "上移模块",
          "statusScript": "Site.getModulePosTop('module484');",
          "evalScript": "Site.moveModulePosTop('module484');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "下移模块",
          "title1": "下移模块",
          "statusScript": "Site.getModulePosBottom('module484');",
          "evalScript": "Site.moveModulePosBottom('module484');"
        },
        {
          "display": "icon",
          "iconClass1": "mleft",
          "fixClass": "littleBtn",
          "text1": "左移模块",
          "title1": "左移模块",
          "statusScript": "Site.getModulePosLeft('module484');",
          "evalScript": "Site.moveModulePosLeft('module484');"
        },
        {
          "display": "icon",
          "iconClass1": "mright",
          "fixClass": "littleBtn",
          "text1": "右移模块",
          "title1": "右移模块",
          "statusScript": "Site.getModulePosRight('module484');",
          "evalScript": "Site.moveModulePosRight('module484');"
        },
        {
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "跳到中间",
          "title1": "把模块跳到中间区域",
          "statusScript": "Site.getAbsMiddleStatus('module484');",
          "evalScript": "Site.absMiddleModule('module484');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "跳到底部",
          "title1": "把模块跳到底部区域",
          "statusScript": "Site.getAbsBottomStatus('module484');",
          "evalScript": "Site.absBottomModule('module484');"
        }]);

        Site.hoverChangeImage();
        Site.hoverStyle();
        Site.initModuleLayer(319, [{
          "text": "编辑模块",
          "title": "编辑图文展示模块",
          "evalScript": "Site.popupWindow({title:'编辑图文展示模块', frameSrcUrl:'manage/richEdit.jsp?id=319&colId=2&extId=0&ram='+Math.random(), width:'830', height:'500', saveBeforePopup:false});"
        },
        {
          "display": "icon",
          "iconClass": "bannerAndBorder",
          "text": "设置样式",
          "title": "设置模块标题栏、边框等样式",
          "evalScript": "Site.functionInterface({'name':'faiSettingPanel.init', 'prompt':true}, {'id':319, 'styleId':1, 'entrance':0});Site.removeAllEditLayer();return false;"
        },
        {
          "text": "高级",
          "title": "",
          "className": "setItem",
          "menu": [{
            "display": "icon",
            "iconClass1": "dockModule",
            "text1": "停靠模块",
            "title1": "把模块停靠回固定区域",
            "statusScript": "Site.getDockStatus2('module319');",
            "evalScript": "Site.dock2('module319');"
          },
          {
            "display": "icon",
            "iconClass1": "absModule",
            "text1": "浮动模块",
            "title1": "浮动模块，可随意摆放位置",
            "statusScript": "Site.getAbsStatus2('module319');",
            "evalScript": "Site.floatOut2('module319');"
          },
          {
            "display": "icon",
            "iconClass1": "lock",
            "text1": "锁定模块",
            "title1": "锁定模块在当前位置，不跟随滚动条变化位置",
            "statusScript": "Site.getLockStatus2('module319');",
            "evalScript": "Site.lock2('module319');"
          },
          {
            "display": "icon",
            "iconClass1": "sidem",
            "text1": "侧停模块",
            "title1": "侧边停靠收起模块，支持鼠标移入自动展开",
            "statusScript": "Site.getSideStatus2('module319');",
            "evalScript": "Site.sideModule2('module319');"
          },
          {
            "display": "icon",
            "iconClass1": "flutterm",
            "text1": "飘动模块",
            "title1": "飘动模块,按照轨迹飘动",
            "statusScript": "Site.getFlutterStatus('module319');",
            "evalScript": "Site.flutter('module319');"
          },
          {
            "hrLine": true
          },
          {
            "display": "icon",
            "text": "取消全站模块",
            "title": "取消该模块在所有栏目中展示。",
            "iconClass": "global",
            "evalScript": "Site.setGlobalModule(319, false);",
            "statusScript": "Site.getLayoutItemStatus('module319');"
          },
          {
            "display": "icon",
            "text": "本页独立布局",
            "title": "该模块在本页面独立布局。",
            "iconClass": "independent",
            "evalScript": "Site.independentModule(319, true);"
          }]
        }], [{
          "display": "icon",
          "text": "隐藏模块",
          "title": "隐藏模块",
          "iconClass": "close",
          "evalScript": "Site.hideModule(319, false);"
        },
        {
          "display": "icon",
          "text": "隐藏标题栏与背景样式",
          "title": "隐藏标题栏与背景样式",
          "iconClass": "clearTB",
          "statusScript": "Site.getOneKeySetModuleTBStatus('module319');",
          "evalScript": "Site.oneKeySetModuleTB(319, true);",
          "setTB": "1"
        },
        {
          "display": "icon",
          "iconClass1": "add",
          "text1": "添加模块",
          "title1": "添加模块",
          "statusScript": "Site.getOpenAddModuleStatus('module319');",
          "evalScript": "Site.openAddModule(319)"
        },
        {
          "display": "icon",
          "iconClass1": "mzindex",
          "text1": "浮到最前",
          "title1": "把模块浮到最前区域",
          "statusScript": "Site.getAbsZIndexStatus('module319');",
          "evalScript": "Site.absZIndexModule('module319');"
        }], [{
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "上移模块",
          "title1": "上移模块",
          "statusScript": "Site.getModulePosTop('module319');",
          "evalScript": "Site.moveModulePosTop('module319');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "下移模块",
          "title1": "下移模块",
          "statusScript": "Site.getModulePosBottom('module319');",
          "evalScript": "Site.moveModulePosBottom('module319');"
        },
        {
          "display": "icon",
          "iconClass1": "mleft",
          "fixClass": "littleBtn",
          "text1": "左移模块",
          "title1": "左移模块",
          "statusScript": "Site.getModulePosLeft('module319');",
          "evalScript": "Site.moveModulePosLeft('module319');"
        },
        {
          "display": "icon",
          "iconClass1": "mright",
          "fixClass": "littleBtn",
          "text1": "右移模块",
          "title1": "右移模块",
          "statusScript": "Site.getModulePosRight('module319');",
          "evalScript": "Site.moveModulePosRight('module319');"
        },
        {
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "跳到中间",
          "title1": "把模块跳到中间区域",
          "statusScript": "Site.getAbsMiddleStatus('module319');",
          "evalScript": "Site.absMiddleModule('module319');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "跳到底部",
          "title1": "把模块跳到底部区域",
          "statusScript": "Site.getAbsBottomStatus('module319');",
          "evalScript": "Site.absBottomModule('module319');"
        }]);

        Site.initModuleLayer(473, [{
          "text": "编辑模块",
          "title": "编辑分享网站模块",
          "evalScript": "Site.popupWindow({title:'编辑分享网站模块', frameSrcUrl:'manage/shareToModuleEdit.jsp?id=473&colId=2&extId=0&ram='+Math.random(), width:'500', height:'450', saveBeforePopup:false, frameScrolling: 'no'});"
        },
        {
          "display": "icon",
          "iconClass": "bannerAndBorder",
          "text": "设置样式",
          "title": "设置模块标题栏、边框等样式",
          "evalScript": "Site.functionInterface({'name':'faiSettingPanel.init', 'prompt':true}, {'id':473, 'styleId':67, 'entrance':0});Site.removeAllEditLayer();return false;"
        },
        {
          "text": "高级",
          "title": "",
          "className": "setItem",
          "menu": [{
            "display": "icon",
            "iconClass1": "dockModule",
            "text1": "停靠模块",
            "title1": "把模块停靠回固定区域",
            "statusScript": "Site.getDockStatus2('module473');",
            "evalScript": "Site.dock2('module473');"
          },
          {
            "display": "icon",
            "iconClass1": "absModule",
            "text1": "浮动模块",
            "title1": "浮动模块，可随意摆放位置",
            "statusScript": "Site.getAbsStatus2('module473');",
            "evalScript": "Site.floatOut2('module473');"
          },
          {
            "display": "icon",
            "iconClass1": "lock",
            "text1": "锁定模块",
            "title1": "锁定模块在当前位置，不跟随滚动条变化位置",
            "statusScript": "Site.getLockStatus2('module473');",
            "evalScript": "Site.lock2('module473');"
          },
          {
            "display": "icon",
            "iconClass1": "sidem",
            "text1": "侧停模块",
            "title1": "侧边停靠收起模块，支持鼠标移入自动展开",
            "statusScript": "Site.getSideStatus2('module473');",
            "evalScript": "Site.sideModule2('module473');"
          },
          {
            "display": "icon",
            "iconClass1": "flutterm",
            "text1": "飘动模块",
            "title1": "飘动模块,按照轨迹飘动",
            "statusScript": "Site.getFlutterStatus('module473');",
            "evalScript": "Site.flutter('module473');"
          },
          {
            "hrLine": true
          },
          {
            "display": "icon",
            "text": "取消全站模块",
            "title": "取消该模块在所有栏目中展示。",
            "iconClass": "global",
            "evalScript": "Site.setGlobalModule(473, false);",
            "statusScript": "Site.getLayoutItemStatus('module473');"
          },
          {
            "display": "icon",
            "text": "本页独立布局",
            "title": "该模块在本页面独立布局。",
            "iconClass": "independent",
            "evalScript": "Site.independentModule(473, true);"
          }]
        }], [{
          "display": "icon",
          "text": "隐藏模块",
          "title": "隐藏模块",
          "iconClass": "close",
          "evalScript": "Site.hideModule(473, false);"
        },
        {
          "display": "icon",
          "text": "隐藏标题栏与背景样式",
          "title": "隐藏标题栏与背景样式",
          "iconClass": "clearTB",
          "statusScript": "Site.getOneKeySetModuleTBStatus('module473');",
          "evalScript": "Site.oneKeySetModuleTB(473, true);",
          "setTB": "1"
        },
        {
          "display": "icon",
          "iconClass1": "add",
          "text1": "添加模块",
          "title1": "添加模块",
          "statusScript": "Site.getOpenAddModuleStatus('module473');",
          "evalScript": "Site.openAddModule(473)"
        },
        {
          "display": "icon",
          "iconClass1": "mzindex",
          "text1": "浮到最前",
          "title1": "把模块浮到最前区域",
          "statusScript": "Site.getAbsZIndexStatus('module473');",
          "evalScript": "Site.absZIndexModule('module473');"
        }], [{
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "上移模块",
          "title1": "上移模块",
          "statusScript": "Site.getModulePosTop('module473');",
          "evalScript": "Site.moveModulePosTop('module473');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "下移模块",
          "title1": "下移模块",
          "statusScript": "Site.getModulePosBottom('module473');",
          "evalScript": "Site.moveModulePosBottom('module473');"
        },
        {
          "display": "icon",
          "iconClass1": "mleft",
          "fixClass": "littleBtn",
          "text1": "左移模块",
          "title1": "左移模块",
          "statusScript": "Site.getModulePosLeft('module473');",
          "evalScript": "Site.moveModulePosLeft('module473');"
        },
        {
          "display": "icon",
          "iconClass1": "mright",
          "fixClass": "littleBtn",
          "text1": "右移模块",
          "title1": "右移模块",
          "statusScript": "Site.getModulePosRight('module473');",
          "evalScript": "Site.moveModulePosRight('module473');"
        },
        {
          "display": "icon",
          "iconClass1": "mtop",
          "fixClass": "littleBtn",
          "text1": "跳到中间",
          "title1": "把模块跳到中间区域",
          "statusScript": "Site.getAbsMiddleStatus('module473');",
          "evalScript": "Site.absMiddleModule('module473');"
        },
        {
          "display": "icon",
          "iconClass1": "mbottom",
          "fixClass": "littleBtn",
          "text1": "跳到底部",
          "title1": "把模块跳到底部区域",
          "statusScript": "Site.getAbsBottomStatus('module473');",
          "evalScript": "Site.absBottomModule('module473');"
        }]);

        Site.initPage(); // 这个要放在最后，因为模块组初始化时会把一些模块隐藏，导致没有高度，所以要放最后执行

        setTimeout("afterModuleLoaded()", 0);

        if (_manageMode) {

          Site.initManagePage();

          Site.bindFooterItemPicHover(); //绑定底部栏目图片hover效果
        }

        Site.triggerGobalEvent("siteReadyLoad");

      });

      function afterModuleLoaded() {
        Site.initPage2();
        Site.initPageDesign(false, 0, -1, 71, 1711);
        Site.initPageAuth(false, -1000, 71);

        Site.mallCartInit(_colId);
        Site.mobiWebInit();
      } // afterModuleLoaded end
      var _lcid = 2052;
      var _userHostName = 'seeyoui.faisco.cn';
      var _siteDomain = 'http://seeyoui.faisco.cn';
      var _mobiSiteDomain = 'http://m.seeyoui.icoc.in';
      var _signupDays = 71;
      var _signupHours = 1711;
      var _cid = 7570029;
      var _resRoot = 'http://0.ss.faisys.com';
      var _colId = 2;
      var _extId = 0;
      var _fromColId = -1;
      var _designAuth = true;
      var _manageMode = true;
      var _oem = false;
      var _siteAuth = -1;
      var _adm = true;
      var _siteVer = 10;
      var _manageStatus = false;

      var _resDownloadRoot = 'http://3.ss.faisys.com';
      var _canEditData = true
      var _canDesign = true;
      var _contextMenu = true;
      var _mainUrl = 'http://www.seeyoui.icoc.in';
      var _isFaier = false;
      var _manageFrameOption = {
        "siteVersion": "siteGroupFre",
        "siteTitle": "您在使用\u201C网站免费版\u201D，点击了解更多。",
        "userLabel": "boss",
        "versionLink": "http://jz.faisco.com/proFunc.html",
        "typeVersion": ""
      };
      var nav2SubMenu = [];
      var nav103SubMenu = [];
      var nav21SubMenu = [];
      var nav101SubMenu = [];
      var nav102SubMenu = [];
      var nav9SubMenu = [];

      var _customBackgroundData = {
        "styleDefault": true,
        "s": true,
        "h": false,
        "r": 3,
        "o": "",
        "sw": -1,
        "e": 0,
        "wbh": -1,
        "wbw": -1,
        "clw": -1,
        "crw": -1,
        "id": "",
        "p": "",
        "bBg": {
          "y": 0,
          "r": 3,
          "f": "",
          "p": "",
          "c": "#000"
        },
        "cBg": {
          "y": 0,
          "r": 3,
          "f": "",
          "p": "",
          "c": "#000"
        },
        "cmBg": {
          "y": 0,
          "r": 3,
          "f": "",
          "p": "",
          "c": "#000"
        }
      }; //自定义的数据
      var _templateBackgroundData = {
        "id": "",
        "bBg": {
          "y": 2,
          "r": 3,
          "f": "",
          "p": "",
          "c": "#63b4d2"
        },
        "cBg": {
          "y": 0,
          "r": 3,
          "f": "",
          "p": "",
          "c": "#000"
        },
        "cmBg": {
          "y": 0,
          "r": 3,
          "f": "",
          "p": "",
          "c": "#000"
        },
        "sw": 1000,
        "s": true,
        "h": false,
        "r": 3,
        "o": "",
        "e": 0,
        "wbh": -1,
        "wbw": -1,
        "clw": -1,
        "crw": -1,
        "p": ""
      }; // 模版的数据
      var _useTemplateBanner = true; // 是否使用全局模版
      var _templateBannerData = {
        "ce": {},
        "pl": 0,
        "l": [{
          "i": "ABUIABACGAAgia3GrgUokPy2zQcwoAs4wgM",
          "p": "./image/demo/ABUIABACGAAgia3GrgUokPy2zQcwoAs4wgM.jpg",
          "w": 1440,
          "h": 450,
          "tp": "./image/demo/ABUIABACGAAgia3GrgUokPy2zQcwoAs4wgM!100x100.jpg"
        }],
        "n": [{
          "t": 1,
          "i": "ABUIABACGAAgia3GrgUokPy2zQcwoAs4wgM",
          "e": 0,
          "u": "",
          "el": "",
          "er": "",
          "p": "./image/demo/ABUIABACGAAgia3GrgUokPy2zQcwoAs4wgM.jpg",
          "w": 1440,
          "h": 450
        }],
        "s": 4,
        "i": 4000,
        "a": 1500,
        "h": false,
        "o": false,
        "t": 1,
        "p": 0,
        "pt": 0,
        "bt": 1,
        "f": {},
        "c": 3,
        "at": 0,
        "ws": false
      }; // 模版的数据
      var _pageBannerData = {
        "s": 0,
        "i": 4000,
        "a": 1500,
        "h": false,
        "o": false,
        "t": 1,
        "p": 0,
        "pt": 0,
        "pl": 0,
        "bt": 1,
        "l": [],
        "f": {},
        "ce": {},
        "n": [],
        "c": 3,
        "at": 0,
        "ws": false
      }; // 当前页面的自定义数据（页面独立样式设置）
      var _bannerData = _templateBannerData;

      var _mallOpen = false;

      var _navStyleChanged = 0;
      var _navItemOnCkOpen = false; // 有下级菜单不可点击
      var _navStyleData = {
        "no": true,
        "s": 0,
        "ns": {
          "w": -1,
          "h": -1
        },
        "cs": {
          "w": -1,
          "h": -1
        },
        "np": {},
        "ncp": {
          "y": 0,
          "t": -1,
          "r": -1,
          "b": -1,
          "l": -1,
          "hl": -1,
          "ht": -1
        },
        "cp": {
          "y": 0,
          "t": -1,
          "l": -1
        },
        "nis": {
          "w": -1,
          "h": -1
        },
        "gt": {
          "f": "宋体",
          "s": 12,
          "w": 0,
          "c": "#000",
          "y": 0
        },
        "ht": {
          "c": "#000",
          "y": 0
        },
        "nb": {
          "c": "#000",
          "f": "",
          "r": 0,
          "p": "",
          "y": 0
        },
        "cb": {
          "c": "#000",
          "f": "",
          "r": 0,
          "p": "",
          "y": 0
        },
        "nib": {
          "c": "#000",
          "r": 0,
          "f": "",
          "p": "",
          "y": 0
        },
        "nihb": {
          "y": 1,
          "c": "#000",
          "r": 0,
          "f": "",
          "p": ""
        },
        "niss": {
          "w": -1,
          "h": -1
        },
        "nisb": {
          "c": "#000",
          "r": 0,
          "f": "",
          "p": "",
          "y": 0
        },
        "nsigt": {
          "f": "宋体",
          "s": 12,
          "w": 0,
          "c": "#000",
          "y": 0
        },
        "nsiht": {
          "c": "#000",
          "y": 0
        },
        "nsis": {
          "w": -1,
          "h": -1
        },
        "nsib": {
          "c": "#000",
          "r": 0,
          "f": "",
          "p": "",
          "y": 0
        },
        "nsihb": {
          "c": "#000",
          "r": 0,
          "f": "",
          "p": "",
          "y": 0
        },
        "nsiho": 0,
        "nmove": 0,
        "v": 2
      }; // 栏目导航样式
      var _navHidden = false; //true:隐藏；flase：显示
      var _navPositionFixTop = false; // 导航栏固定到顶部
      var _navHeightChange = false; //导航栏高度改变，逻辑分界点2015-08-21
      var moduleAttr = {
        "module320": {
          "pattern": {
            "mulModuleColPattern": {
              "mcs": 12
            },
            "systemFullmeasure": 0,
            "fullmeasurePattern": {
              "mb": {
                "y": 0,
                "o": 0
              },
              "cb": {
                "y": 0,
                "o": 0
              },
              "cw": -1,
              "i": {
                "y": 0
              },
              "b": {
                "y": 0
              }
            },
            "searchBoxPattern": {
              "iw": -1
            },
            "border": {
              "y": 1
            },
            "bannerType": 1,
            "inner": {
              "y": 1,
              "l": 15,
              "r": 10,
              "t": 20,
              "b": 5
            },
            "contentLineIcon": {
              "y": 0
            },
            "contentLink": {
              "y": 1,
              "ls": 16,
              "f": "微软雅黑",
              "fct": 0
            }
          }
        },
        "module314": {
          "pattern": {
            "mulModuleColPattern": {
              "mcs": 12
            },
            "systemFullmeasure": 0,
            "fullmeasurePattern": {
              "mb": {
                "y": 0,
                "o": 0
              },
              "cb": {
                "y": 0,
                "o": 0
              },
              "cw": -1,
              "i": {
                "y": 0
              },
              "b": {
                "y": 0
              }
            },
            "searchBoxPattern": {
              "iw": 12
            },
            "bannerAutoHeight": false,
            "bannerText": {
              "y": 1,
              "py": 0,
              "r": 0,
              "u": 0,
              "fct": 0
            },
            "bannerBg": {
              "y": 2,
              "c": "#ffffff",
              "f": "ABUIABACGAAgs5PFrgUonZebnAYw7Ac4eA",
              "r": 0,
              "p": "./image/demo/ABUIABACGAAgs5PFrgUonZebnAYw7Ac4eA.jpg"
            },
            "inner": {
              "y": 1,
              "l": 5,
              "r": 0,
              "t": 5,
              "b": 5
            },
            "contentLineIcon": {
              "y": 0
            }
          }
        },
        "module316": {
          "pattern": {
            "mulModuleColPattern": {
              "mcs": 0
            },
            "systemFullmeasure": 0,
            "fullmeasurePattern": {
              "mb": {
                "y": 0,
                "o": 0
              },
              "cb": {
                "y": 0,
                "o": 0
              },
              "cw": -1,
              "i": {
                "y": 0
              },
              "b": {
                "y": 0
              }
            },
            "searchBoxPattern": {
              "iw": -1
            },
            "border": {
              "y": 1
            },
            "bannerAutoHeight": false,
            "bannerText": {
              "y": 1,
              "py": 0,
              "r": 0,
              "u": 0,
              "fct": 0
            },
            "bannerBg": {
              "y": 2,
              "c": "transparent",
              "f": "ABUIABACGAAgwpPFrgUo_KizyAUw7Ac4eA",
              "r": 0,
              "p": "./image/demo/ABUIABACGAAgwpPFrgUo_KizyAUw7Ac4eA.jpg"
            },
            "inner": {
              "y": 1,
              "l": 0,
              "r": 0,
              "t": 0,
              "b": 0
            },
            "contentLineIcon": {
              "y": 0
            },
            "contentBg": {
              "y": 1
            }
          }
        },
        "module315": {
          "pattern": {
            "systemPattern": 60,
            "mulModuleColPattern": {
              "mcs": 20
            },
            "systemFullmeasure": 0,
            "fullmeasurePattern": {
              "mb": {
                "y": 0,
                "o": 0
              },
              "cb": {
                "y": 0,
                "o": 0
              },
              "cw": -1,
              "i": {
                "y": 0
              },
              "b": {
                "y": 0
              }
            },
            "searchBoxPattern": {
              "iw": -1
            },
            "border": {
              "y": 1
            },
            "bannerText": {
              "y": 2,
              "f": "微软雅黑",
              "s": 16,
              "w": 1,
              "c": "#000",
              "fct": 0,
              "py": 0,
              "r": 0,
              "u": 0
            },
            "contentText": {
              "y": 1,
              "fct": 0,
              "f": "微软雅黑",
              "cs": 12
            },
            "contentLineIcon": {
              "y": 0
            },
            "contentLink": {
              "y": 1,
              "ls": 16,
              "f": "微软雅黑",
              "c": "#399ec3",
              "fct": 1
            }
          }
        },
        "module307": {
          "pattern": {
            "systemPattern": 60,
            "mulModuleColPattern": {
              "mcs": 10
            },
            "systemFullmeasure": 0,
            "fullmeasurePattern": {
              "mb": {
                "y": 0,
                "o": 0
              },
              "cb": {
                "y": 0,
                "o": 0
              },
              "cw": -1,
              "i": {
                "y": 0
              },
              "b": {
                "y": 0
              }
            },
            "searchBoxPattern": {
              "iw": -1
            },
            "border": {
              "y": 1
            },
            "bannerText": {
              "y": 2,
              "f": "微软雅黑",
              "s": 16,
              "w": 1,
              "c": "#000",
              "fct": 0,
              "py": 0,
              "r": 0,
              "u": 0
            },
            "contentText": {
              "y": 1,
              "fct": 0,
              "f": "微软雅黑",
              "cs": 12
            },
            "contentLineIcon": {
              "y": 0
            },
            "contentLink": {
              "y": 1,
              "ls": 16,
              "f": "微软雅黑",
              "c": "#399ec3",
              "fct": 1
            }
          }
        },
        "module455": {
          "pattern": {
            "mulModuleColPattern": {
              "mcs": 2
            },
            "systemFullmeasure": 0,
            "fullmeasurePattern": {
              "mb": {
                "y": 0,
                "o": 0
              },
              "cb": {
                "y": 0,
                "o": 0
              },
              "cw": -1,
              "i": {
                "y": 0
              },
              "b": {
                "y": 0
              }
            },
            "searchBoxPattern": {
              "iw": -1
            },
            "contentLineIcon": {
              "y": 0
            }
          }
        },
        "module457": {
          "pattern": {
            "mulModuleColPattern": {
              "mcs": 12
            },
            "systemFullmeasure": 0,
            "fullmeasurePattern": {
              "mb": {
                "y": 0,
                "o": 0
              },
              "cb": {
                "y": 0,
                "o": 0
              },
              "cw": -1,
              "i": {
                "y": 0
              },
              "b": {
                "y": 0
              }
            },
            "searchBoxPattern": {
              "iw": -1
            },
            "contentLineIcon": {
              "y": 0
            }
          }
        },
        "module458": {
          "pattern": {
            "mulModuleColPattern": {
              "mcs": 20
            },
            "systemFullmeasure": 0,
            "fullmeasurePattern": {
              "mb": {
                "y": 0,
                "o": 0
              },
              "cb": {
                "y": 0,
                "o": 0
              },
              "cw": -1,
              "i": {
                "y": 0
              },
              "b": {
                "y": 0
              }
            },
            "searchBoxPattern": {
              "iw": -1
            },
            "contentLineIcon": {
              "y": 0
            }
          }
        },
        "module459": {
          "pattern": {
            "mulModuleColPattern": {
              "mcs": 1
            },
            "systemFullmeasure": 0,
            "fullmeasurePattern": {
              "mb": {
                "y": 0,
                "o": 0
              },
              "cb": {
                "y": 0,
                "o": 0
              },
              "cw": -1,
              "i": {
                "y": 0
              },
              "b": {
                "y": 0
              }
            },
            "searchBoxPattern": {
              "iw": 1
            },
            "contentLineIcon": {
              "y": 0
            }
          }
        },
        "module461": {
          "pattern": {
            "mulModuleColPattern": {
              "mcs": -1
            },
            "systemFullmeasure": 0,
            "fullmeasurePattern": {
              "mb": {
                "y": 0,
                "o": 0
              },
              "cb": {
                "y": 0,
                "o": 0
              },
              "cw": -1,
              "i": {
                "y": 0
              },
              "b": {
                "y": 0
              }
            },
            "searchBoxPattern": {
              "iw": -1
            },
            "border": {
              "y": 1
            },
            "bannerType": 1,
            "inner": {
              "y": 1,
              "l": 0,
              "r": 0,
              "t": 0,
              "b": 0
            },
            "contentLineIcon": {
              "y": 0
            }
          }
        },
        "module308": {
          "pattern": {
            "mulModuleColPattern": {
              "mcs": -1
            },
            "systemFullmeasure": 0,
            "fullmeasurePattern": {
              "mb": {
                "y": 0,
                "o": 0
              },
              "cb": {
                "y": 0,
                "o": 0
              },
              "cw": -1,
              "i": {
                "y": 0
              },
              "b": {
                "y": 0
              }
            },
            "searchBoxPattern": {
              "iw": -1
            },
            "contentLineIcon": {
              "y": 0
            }
          }
        },
        "module311": {
          "pattern": {
            "mulModuleColPattern": {
              "mcs": 0
            },
            "systemFullmeasure": 0,
            "fullmeasurePattern": {
              "mb": {
                "y": 0,
                "o": 0
              },
              "cb": {
                "y": 0,
                "o": 0
              },
              "cw": -1,
              "i": {
                "y": 0
              },
              "b": {
                "y": 0
              }
            },
            "searchBoxPattern": {
              "iw": -1
            },
            "border": {
              "y": 1
            },
            "bannerType": 1,
            "contentLineIcon": {
              "y": 0
            },
            "contentLink": {
              "y": 1,
              "f": "微软雅黑",
              "c": "#7f7f7f",
              "fct": 1,
              "ls": 12
            },
            "contentBg": {
              "y": 1
            }
          }
        },
        "module462": {
          "pattern": {
            "mulModuleColPattern": {
              "mcs": -1
            },
            "systemFullmeasure": 0,
            "fullmeasurePattern": {
              "mb": {
                "y": 0,
                "o": 0
              },
              "cb": {
                "y": 0,
                "o": 0
              },
              "cw": -1,
              "i": {
                "y": 0
              },
              "b": {
                "y": 0
              }
            },
            "searchBoxPattern": {
              "iw": -1
            },
            "border": {
              "y": 1
            },
            "bannerType": 1,
            "inner": {
              "y": 1,
              "l": 0,
              "r": 0,
              "t": 0,
              "b": 0
            },
            "contentLineIcon": {
              "y": 0
            },
            "contentBg": {
              "y": 1
            }
          }
        },
        "module463": {
          "pattern": {
            "mulModuleColPattern": {
              "mcs": 20
            },
            "systemFullmeasure": 0,
            "fullmeasurePattern": {
              "mb": {
                "y": 0,
                "o": 0
              },
              "cb": {
                "y": 0,
                "o": 0
              },
              "cw": -1,
              "i": {
                "y": 0
              },
              "b": {
                "y": 0
              }
            },
            "searchBoxPattern": {
              "iw": -1
            },
            "contentLineIcon": {
              "y": 0
            }
          }
        },
        "module464": {
          "pattern": {
            "mulModuleColPattern": {
              "mcs": 0
            },
            "systemFullmeasure": 0,
            "fullmeasurePattern": {
              "mb": {
                "y": 0,
                "o": 0
              },
              "cb": {
                "y": 0,
                "o": 0
              },
              "cw": -1,
              "i": {
                "y": 0
              },
              "b": {
                "y": 0
              }
            },
            "searchBoxPattern": {
              "iw": -1
            },
            "contentLineIcon": {
              "y": 0
            }
          }
        },
        "module465": {
          "pattern": {
            "mulModuleColPattern": {
              "mcs": -1
            },
            "systemFullmeasure": 0,
            "fullmeasurePattern": {
              "mb": {
                "y": 0,
                "o": 0
              },
              "cb": {
                "y": 0,
                "o": 0
              },
              "cw": -1,
              "i": {
                "y": 0
              },
              "b": {
                "y": 0
              }
            },
            "searchBoxPattern": {
              "iw": -1
            },
            "contentLineIcon": {
              "y": 0
            }
          }
        },
        "module466": {
          "pattern": {
            "mulModuleColPattern": {
              "mcs": -1
            },
            "systemFullmeasure": 0,
            "fullmeasurePattern": {
              "mb": {
                "y": 0,
                "o": 0
              },
              "cb": {
                "y": 0,
                "o": 0
              },
              "cw": -1,
              "i": {
                "y": 0
              },
              "b": {
                "y": 0
              }
            },
            "searchBoxPattern": {
              "iw": -1
            },
            "contentLineIcon": {
              "y": 0
            }
          }
        },
        "module467": {
          "pattern": {
            "mulModuleColPattern": {
              "mcs": -1
            },
            "systemFullmeasure": 0,
            "fullmeasurePattern": {
              "mb": {
                "y": 0,
                "o": 0
              },
              "cb": {
                "y": 0,
                "o": 0
              },
              "cw": -1,
              "i": {
                "y": 0
              },
              "b": {
                "y": 0
              }
            },
            "searchBoxPattern": {
              "iw": -1
            },
            "contentLineIcon": {
              "y": 0
            }
          }
        },
        "module468": {
          "pattern": {
            "mulModuleColPattern": {
              "mcs": -1
            },
            "systemFullmeasure": 0,
            "fullmeasurePattern": {
              "mb": {
                "y": 0,
                "o": 0
              },
              "cb": {
                "y": 0,
                "o": 0
              },
              "cw": -1,
              "i": {
                "y": 0
              },
              "b": {
                "y": 0
              }
            },
            "systemSearchBoxStyle": 49,
            "searchBoxPattern": {
              "iw": -1
            },
            "contentLineIcon": {
              "y": 0
            }
          }
        },
        "module471": {
          "pattern": {
            "mulModuleColPattern": {
              "mcs": 100
            },
            "systemFullmeasure": 0,
            "fullmeasurePattern": {
              "mb": {
                "y": 0,
                "o": 0
              },
              "cb": {
                "y": 0,
                "o": 0
              },
              "cw": -1,
              "i": {
                "y": 0
              },
              "b": {
                "y": 0
              }
            },
            "searchBoxPattern": {
              "iw": -1
            },
            "bannerType": 1,
            "contentLineIcon": {
              "y": 0
            }
          }
        },
        "module474": {
          "pattern": {
            "mulModuleColPattern": {
              "mcs": -1
            },
            "systemFullmeasure": 0,
            "fullmeasurePattern": {
              "mb": {
                "y": 0,
                "o": 0
              },
              "cb": {
                "y": 0,
                "o": 0
              },
              "cw": -1,
              "i": {
                "y": 0
              },
              "b": {
                "y": 0
              }
            },
            "searchBoxPattern": {
              "iw": -1
            },
            "contentLineIcon": {
              "y": 0
            }
          }
        },
        "module470": {
          "pattern": {
            "mulModuleColPattern": {
              "mcs": 2
            },
            "systemFullmeasure": 0,
            "fullmeasurePattern": {
              "mb": {
                "y": 0,
                "o": 0
              },
              "cb": {
                "y": 0,
                "o": 0
              },
              "cw": -1,
              "i": {
                "y": 0
              },
              "b": {
                "y": 0
              }
            },
            "searchBoxPattern": {
              "iw": 2
            },
            "contentLineIcon": {
              "y": 0
            }
          }
        },
        "module475": {
          "pattern": {
            "mulModuleColPattern": {
              "mcs": 1
            },
            "systemFullmeasure": 0,
            "fullmeasurePattern": {
              "mb": {
                "y": 0,
                "o": 0
              },
              "cb": {
                "y": 0,
                "o": 0
              },
              "cw": -1,
              "i": {
                "y": 0
              },
              "b": {
                "y": 0
              }
            },
            "searchBoxPattern": {
              "iw": 1
            },
            "contentLineIcon": {
              "y": 0
            }
          }
        },
        "module469": {
          "pattern": {
            "mulModuleColPattern": {
              "mcs": -1
            },
            "systemFullmeasure": 0,
            "fullmeasurePattern": {
              "mb": {
                "y": 0,
                "o": 0
              },
              "cb": {
                "y": 0,
                "o": 0
              },
              "cw": -1,
              "i": {
                "y": 0
              },
              "b": {
                "y": 0
              }
            },
            "searchBoxPattern": {
              "iw": -1
            },
            "contentLineIcon": {
              "y": 0
            }
          }
        },
        "module476": {
          "pattern": {
            "mulModuleColPattern": {
              "mcs": 1
            },
            "systemFullmeasure": 0,
            "fullmeasurePattern": {
              "mb": {
                "y": 0,
                "o": 0
              },
              "cb": {
                "y": 0,
                "o": 0
              },
              "cw": -1,
              "i": {
                "y": 0
              },
              "b": {
                "y": 0
              }
            },
            "searchBoxPattern": {
              "iw": -1
            },
            "border": {
              "y": 1
            },
            "bannerType": 1,
            "contentLineIcon": {
              "y": 0
            }
          },
          "data": {
            "photoCardSystem": 0
          }
        },
        "module477": {
          "pattern": {
            "mulModuleColPattern": {
              "mcs": 2
            },
            "systemFullmeasure": 0,
            "fullmeasurePattern": {
              "mb": {
                "y": 0,
                "o": 0
              },
              "cb": {
                "y": 0,
                "o": 0
              },
              "cw": -1,
              "i": {
                "y": 0
              },
              "b": {
                "y": 0
              }
            },
            "searchBoxPattern": {
              "iw": -1
            },
            "contentLineIcon": {
              "y": 0
            }
          }
        },
        "module478": {
          "pattern": {
            "mulModuleColPattern": {
              "mcs": -1
            },
            "systemFullmeasure": 0,
            "fullmeasurePattern": {
              "mb": {
                "y": 0,
                "o": 0
              },
              "cb": {
                "y": 0,
                "o": 0
              },
              "cw": -1,
              "i": {
                "y": 0
              },
              "b": {
                "y": 0
              }
            },
            "searchBoxPattern": {
              "iw": -1
            },
            "contentLineIcon": {
              "y": 0
            }
          }
        },
        "module480": {
          "pattern": {
            "mulModuleColPattern": {
              "mcs": 20
            },
            "systemFullmeasure": 0,
            "fullmeasurePattern": {
              "mb": {
                "y": 0,
                "o": 0
              },
              "cb": {
                "y": 0,
                "o": 0
              },
              "cw": -1,
              "i": {
                "y": 0
              },
              "b": {
                "y": 0
              }
            },
            "searchBoxPattern": {
              "iw": -1
            },
            "contentLineIcon": {
              "y": 0
            }
          }
        },
        "module481": {
          "pattern": {
            "mulModuleColPattern": {
              "mcs": 1
            },
            "systemFullmeasure": 0,
            "fullmeasurePattern": {
              "mb": {
                "y": 0,
                "o": 0
              },
              "cb": {
                "y": 0,
                "o": 0
              },
              "cw": -1,
              "i": {
                "y": 0
              },
              "b": {
                "y": 0
              }
            },
            "searchBoxPattern": {
              "iw": -1
            },
            "contentLineIcon": {
              "y": 0
            }
          }
        },
        "module460": {
          "pattern": {
            "mulModuleColPattern": {
              "mcs": 15
            },
            "systemFullmeasure": 0,
            "fullmeasurePattern": {
              "mb": {
                "y": 0,
                "o": 0
              },
              "cb": {
                "y": 0,
                "o": 0
              },
              "cw": -1,
              "i": {
                "y": 0
              },
              "b": {
                "y": 0
              }
            },
            "searchBoxPattern": {
              "iw": -1
            },
            "contentLineIcon": {
              "y": 0
            }
          }
        },
        "module482": {
          "pattern": {
            "mulModuleColPattern": {
              "mcs": 600
            },
            "systemFullmeasure": 0,
            "fullmeasurePattern": {
              "mb": {
                "y": 0,
                "o": 0
              },
              "cb": {
                "y": 0,
                "o": 0
              },
              "cw": -1,
              "i": {
                "y": 0
              },
              "b": {
                "y": 0
              }
            },
            "searchBoxPattern": {
              "iw": -1
            },
            "contentLineIcon": {
              "y": 0
            }
          }
        },
        "module484": {
          "pattern": {
            "mulModuleColPattern": {
              "mcs": -1
            },
            "systemFullmeasure": 0,
            "fullmeasurePattern": {
              "mb": {
                "y": 0,
                "o": 0
              },
              "cb": {
                "y": 0,
                "o": 0
              },
              "cw": -1,
              "i": {
                "y": 0
              },
              "b": {
                "y": 0
              }
            },
            "searchBoxPattern": {
              "iw": -1
            },
            "contentLineIcon": {
              "y": 0
            }
          }
        },
        "module456": {
          "pattern": {
            "mulModuleColPattern": {
              "mcs": -1
            },
            "systemFullmeasure": 0,
            "fullmeasurePattern": {
              "mb": {
                "y": 0,
                "o": 0
              },
              "cb": {
                "y": 0,
                "o": 0
              },
              "cw": -1,
              "i": {
                "y": 0
              },
              "b": {
                "y": 0
              }
            },
            "searchBoxPattern": {
              "iw": -1
            },
            "border": {
              "y": 1
            },
            "bannerType": 1,
            "contentLineIcon": {
              "y": 0
            },
            "contentBg": {
              "y": 1
            }
          }
        },
        "module472": {
          "pattern": {
            "mulModuleColPattern": {
              "mcs": -1
            },
            "systemFullmeasure": 0,
            "fullmeasurePattern": {
              "mb": {
                "y": 0,
                "o": 0
              },
              "cb": {
                "y": 0,
                "o": 0
              },
              "cw": -1,
              "i": {
                "y": 0
              },
              "b": {
                "y": 0
              }
            },
            "systemSearchBoxStyle": 51,
            "searchBoxPattern": {
              "iw": -1
            },
            "contentLineIcon": {
              "y": 0
            }
          }
        },
        "module479": {
          "pattern": {
            "mulModuleColPattern": {
              "mcs": -1
            },
            "systemFullmeasure": 0,
            "fullmeasurePattern": {
              "mb": {
                "y": 0,
                "o": 0
              },
              "cb": {
                "y": 0,
                "o": 0
              },
              "cw": -1,
              "i": {
                "y": 0
              },
              "b": {
                "y": 0
              }
            },
            "searchBoxPattern": {
              "iw": -1
            },
            "border": {
              "y": 1
            },
            "bannerType": 1,
            "contentLineIcon": {
              "y": 0
            },
            "contentBg": {
              "y": 1
            }
          },
          "data": {
            "floatBtnNumSystem": 304
          }
        },
        "module483": {
          "pattern": {
            "mulModuleColPattern": {
              "mcs": 1
            },
            "systemFullmeasure": 0,
            "fullmeasurePattern": {
              "mb": {
                "y": 0,
                "o": 0
              },
              "cb": {
                "y": 0,
                "o": 0
              },
              "cw": -1,
              "i": {
                "y": 0
              },
              "b": {
                "y": 0
              }
            },
            "searchBoxPattern": {
              "iw": -1
            },
            "border": {
              "y": 1
            },
            "bannerType": 1,
            "inner": {
              "y": 1,
              "l": 0,
              "r": 0,
              "t": 0,
              "b": 0
            },
            "contentLineIcon": {
              "y": 0
            },
            "contentBg": {
              "y": 1
            }
          }
        },
        "module485": {
          "pattern": {
            "mulModuleColPattern": {
              "mcs": -1
            },
            "systemFullmeasure": 0,
            "fullmeasurePattern": {
              "mb": {
                "y": 0,
                "o": 0
              },
              "cb": {
                "y": 0,
                "o": 0
              },
              "cw": -1,
              "i": {
                "y": 0
              },
              "b": {
                "y": 0
              }
            },
            "searchBoxPattern": {
              "iw": -1
            },
            "border": {
              "y": 1
            },
            "bannerType": 1,
            "contentLineIcon": {
              "y": 0
            },
            "contentBg": {
              "y": 1
            }
          }
        },
        "module319": {
          "pattern": {
            "mulModuleColPattern": {
              "mcs": 0
            },
            "systemFullmeasure": 0,
            "fullmeasurePattern": {
              "mb": {
                "y": 0,
                "o": 0
              },
              "cb": {
                "y": 0,
                "o": 0
              },
              "cw": -1,
              "i": {
                "y": 0
              },
              "b": {
                "y": 0
              }
            },
            "searchBoxPattern": {
              "iw": -1
            },
            "border": {
              "y": 1
            },
            "bannerType": 1,
            "contentLineIcon": {
              "y": 0
            },
            "contentBg": {
              "y": 1
            }
          }
        },
        "module473": {
          "pattern": {
            "mulModuleColPattern": {
              "mcs": 0
            },
            "systemFullmeasure": 0,
            "fullmeasurePattern": {
              "mb": {
                "y": 0,
                "o": 0
              },
              "cb": {
                "y": 0,
                "o": 0
              },
              "cw": -1,
              "i": {
                "y": 0
              },
              "b": {
                "y": 0
              }
            },
            "searchBoxPattern": {
              "iw": -1
            },
            "contentLineIcon": {
              "y": 0
            },
            "sideSize": {
              "w": -1,
              "h": -1
            }
          }
        }
      };

      var _frameChanged = 0; //用于记录管理frame中的页面数据是否有保存，以便在管理frame关闭时刷新页面
      var _changeStyleNum = 0; //用于记录网站风格是否更改，如果更改则在刷新或者关闭前进行提醒。
      var _templateChanged = 0; //用于记录模版是否有改动
      var _moduleMoved = 0; //用于记录模块是否有移动
      var _layoutChanged = 0; //用于布局是否有改动
      var _titleChanged = 0; //用于记录企业标题是否更改，如果是使用模板的初始化，则是-1；如果人工修改过则>0
      var _localeChanged = 0; //用于记录企业版本标题是否更改
      var _logoChanged = 0; //用于记录logo是否有更改
      var _bgImgChanged = 0; //记录页面背景是否有更改
      var _bannerPath = ""; //记录上传banner前的原banner路径，用于恢复原始banner
      var _bannerChanged = 0; //用于记录banner是否更改
      var _searchKeywordChanged = 0; //用于记录searchKeyword是否更改
      var _searchDescChanged = 0; //用于记录searchDesc是否更改
      //var _tmpDataList = null;//new Array(); //临时json，用于记录popup的iframe页面刷新前用户输入的数据
      var _templateFrame = 4003;

      var _wideNav = 0;
      var _templateType = 0;
      var _templateBannerId = 40003;
      var _templateBannerWeight = 0;
      var _moduleList = new Array(); //用于记录哪些模块的titleHidden值改变了
      var _floatOutPosition = "centerTopForms";
      var _browserTitleChanged = 0; //用于记录浏览器标题是否改变
      var _appendLayout = 2; // 用于记录添加新模块时加入的区域
      var _appendModule = -1; // 用于记录添加新模块时插入的模块
      /*
var _templateChangeLayoutList = {
	left:false, 
	right:false
};	// 在切换不同布局的模版时，左右是否需要显示，如果是用户主动隐藏的，切换时就不显示了，否则就要显示。
*/
      var _displayLayoutList = [7];
      var _newModuleIdList = [];

      var _imgPageChanged = 0;
      var _imgPage = {
        "s": true,
        "b": false,
        "img": false,
        "e": false,
        "n": 1,
        "w": 960,
        "g": 600,
        "iw": 960,
        "ih": 600,
        "r": -1,
        "c": "",
        "p": "",
        "ii": "",
        "ipath": "",
        "itpath": "",
        "i": "",
        "path": "",
        "fb": false,
        "fr": -1,
        "fc": "",
        "fp": "",
        "ib": false,
        "ir": -1,
        "ic": "",
        "ip": ""
      };
      var _imgPageOpen = false;
      var _bgMusicChanged = 0;
      var _bgMusicOpen = false;
      var _bgMusic = {
        "o": true,
        "l": true,
        "v": 60,
        "i": "",
        "p": ""
      };
      var _hiddenModuleList = [{
        "id": 452,
        "s": 0,
        "it": 0,
        "imc": 0,
        "ifm": 0,
        "x": 0,
        "o": 21
      },
      {
        "id": 453,
        "s": 0,
        "it": 0,
        "imc": 0,
        "ifm": 0,
        "x": 1,
        "o": 21
      },
      {
        "id": 454,
        "s": 0,
        "it": 0,
        "imc": 0,
        "ifm": 0,
        "x": 2,
        "o": 21
      }];

      var _headerTopStyleChanged = 0;
      var _headerTopStyle = {
        "hts": -1,
        "hg": {
          "c": "#000",
          "f": "",
          "r": 3,
          "p": "",
          "y": 0
        }
      }; // 顶部样式（模板）
      var _customHeaderTopStyle = {
        "hts": -1,
        "hg": {
          "y": 0,
          "r": 3,
          "f": "",
          "p": "",
          "c": "#000"
        }
      }; // 自定义顶部样式
      var _memberTopBarChanged = 0;
      var _memberTopBar = false; // 顶部登录条
      var _memberTopBar_myProfile = false;
      var _memberTopBar_myOrder = false;
      var _memberTopBar_addBookMark = false;
      var _memberTopBar_mobiWeb = false;
      var _memberTopBar_mallCart = false;

      var _footerStyleChanged = 0;
      var _footerStyleData = {
        "fis": 0,
        "fa": 1,
        "fh": -1,
        "f": {
          "t": 1,
          "l": 0,
          "r": 0,
          "u": 0,
          "d": 20
        },
        "rt": {
          "y": 1,
          "f": "SimSun",
          "s": 12,
          "c": "#7f7f7f"
        },
        "gt": {
          "y": 1,
          "f": "SimSun",
          "s": 12,
          "w": 0,
          "d": 0,
          "c": "#7f7f7f"
        },
        "ht": {
          "c": "#000000"
        },
        "fb": {
          "y": 2,
          "c": "#000",
          "f": "ABUIABACGAAg_5jFrgUosLbshAcw8w44_gE",
          "r": 3,
          "p": "./image/demo/ABUIABACGAAg_5jFrgUosLbshAcw8w44_gE.jpg"
        },
        "fip": 0,
        "fiw": -1,
        "fih": -1,
        "fisp": 14,
        "fiv": {
          "y": 1,
          "w": 1,
          "c": "#7f7f7f"
        },
        "fift": {
          "y": 1,
          "f": "",
          "s": -1,
          "w": 0,
          "d": 0,
          "c": "#7f7f7f",
          "hc": "#000000"
        },
        "fifc": true,
        "fiss": 0,
        "fish": -1,
        "fist": {
          "y": 0,
          "f": "",
          "s": -1,
          "w": 0,
          "d": 0,
          "c": "",
          "hc": ""
        }
      }; // 底部导航样式（模板）
      var _customFooterStyleData = {
        "fa": 0,
        "fh": -1,
        "f": {
          "t": 0,
          "l": 0,
          "r": 0,
          "u": 0,
          "d": 0
        },
        "rt": {
          "y": 0,
          "f": "",
          "s": -1,
          "c": ""
        },
        "gt": {
          "y": 0,
          "f": "",
          "s": -1,
          "w": 0,
          "d": 0,
          "c": ""
        },
        "ht": {
          "c": ""
        },
        "fb": {
          "y": 0
        },
        "fis": -1,
        "fip": 0,
        "fiw": -1,
        "fih": -1,
        "fisp": -1,
        "fiv": {
          "y": 0,
          "w": -1,
          "c": ""
        },
        "fift": {
          "y": 0,
          "f": "",
          "s": -1,
          "w": 0,
          "d": 0,
          "c": "",
          "hc": ""
        },
        "fifc": true,
        "fiss": 0,
        "fish": -1,
        "fist": {
          "y": 0,
          "f": "",
          "s": -1,
          "w": 0,
          "d": 0,
          "c": "",
          "hc": ""
        }
      }; // 自定义底部导航样式
      var _useTemplateTitle = true; // 是否使用模版
      var _titleData = {
        "x": "",
        "fp": false,
        "st": {
          "y": 0,
          "x": "",
          "f": "",
          "c": "",
          "s": 0,
          "i": 0,
          "w": 0,
          "u": 0
        },
        "jm": {
          "y": 0,
          "f": ""
        },
        "h": false,
        "t": -1,
        "l": -1,
        "f": "",
        "s": -1,
        "w": -1,
        "c": "",
        "i": 0,
        "u": 0
      }; // 当前页面的数据
      var _templateTitleData = {
        "x": "",
        "fp": false,
        "st": {
          "y": 0,
          "x": "",
          "f": "",
          "c": "",
          "s": 0,
          "i": 0,
          "w": 0,
          "u": 0
        },
        "jm": {
          "y": 0,
          "f": ""
        },
        "h": false,
        "t": -1,
        "l": -1,
        "f": "",
        "s": -1,
        "w": -1,
        "c": "",
        "i": 0,
        "u": 0
      }; // 模版的数据
      var _titlePositionFixTop = false;

      var _useTemplateLocale = true; // 是否使用模板
      var _localeData = {
        "ms": 7,
        "h": false,
        "x": "中文",
        "y": "English",
        "z": "繁体",
        "v": "日本語",
        "k": "한국어",
        "lo": "ພາສາລາວ",
        "th": "ภาษาไทย",
        "es": "lengua española",
        "ru": "русский",
        "fra": "français",
        "it": "Italia",
        "t": -1,
        "l": -1,
        "f": "",
        "s": -1,
        "w": -1,
        "fp": false
      }; // 当前页面的数据
      var _templateLocaleData = {
        "ms": 7,
        "h": false,
        "x": "中文",
        "y": "English",
        "z": "繁体",
        "v": "日本語",
        "k": "한국어",
        "lo": "ພາສາລາວ",
        "th": "ภาษาไทย",
        "es": "lengua española",
        "ru": "русский",
        "fra": "français",
        "it": "Italia",
        "t": -1,
        "l": -1,
        "f": "",
        "s": -1,
        "w": -1,
        "fp": false
      }; // 模板的数据
      var _useTemplateLogo = true; // 是否使用模版
      var _logoData = {
        "i": "ABUIABAEGAAg6ua7rgUoyMTtRDC7ATgy",
        "des": "广告创意",
        "desd": false,
        "h": false,
        "t": 65,
        "l": 58,
        "g": 50,
        "w": 187,
        "lt": 0,
        "addr": "",
        "ot": 1,
        "p": "./image/demo/ABUIABAEGAAg6ua7rgUoyMTtRDC7ATgy.png"
      }; // 当前页面的数据
      var _templateLogoData = {
        "i": "ABUIABAEGAAg6ua7rgUoyMTtRDC7ATgy",
        "des": "广告创意",
        "desd": false,
        "h": false,
        "t": 65,
        "l": 58,
        "g": 50,
        "w": 187,
        "lt": 0,
        "addr": "",
        "ot": 1,
        "p": "./image/demo/ABUIABAEGAAg6ua7rgUoyMTtRDC7ATgy.png"
      }; // 模版的数据
      var _logoPositionFixTop = false;

      var _useTemplateBackground = true; // 是否使用模版
      var _backgroundData = {
        "id": "",
        "bBg": {
          "y": 2,
          "r": 3,
          "f": "",
          "p": "",
          "c": "#63b4d2"
        },
        "cBg": {
          "y": 0,
          "r": 3,
          "f": "",
          "p": "",
          "c": "#000"
        },
        "cmBg": {
          "y": 0,
          "r": 3,
          "f": "",
          "p": "",
          "c": "#000"
        },
        "sw": 1000,
        "s": true,
        "h": false,
        "r": 3,
        "o": "",
        "e": 0,
        "wbh": -1,
        "wbw": -1,
        "clw": -1,
        "crw": -1,
        "p": ""
      }; // 当前页面的数据
      var _useTemplateBrowserTitle = true; // 是否使用全局模版
      var _browserTitleData = "智慧星河"; // 当前页面的数据
      var _browserTitleExt = ""; // 当前页面的标题扩展
      var _templateBrowserTitleData = "智慧星河"; // 模版的数据
      var _pageBrowserTitleData = "智慧星河"; // 当前页面的自定义数据（页面独立样式设置）
      var _isNewsAndProBrowserTitle = false;
      var _companyName = "智慧星河"; // 企业名称
      var _useTemplateSearchKeyword = true;
      var _searchKeywordData = "";
      var _templateSearchKeywordData = "";
      var _pageSearchKeywordData = "";

      var _useTemplateSearchDesc = true;
      var _searchDescData = "";
      var _templateSearchDescData = "";
      var _pageSearchDescData = "";

      var _delModuleIdList = []; // 用于管理模式下记录删除的模块列表,保存后生效
      var _advanceSettingData = {}; // 用于存放高级设置的高级功能和高级功能数据
      var _businessSettingData = {}; // 用于存放高级设置的高级功能和商务功能数据
      var _baiduBaseSetting = {}; //用于存放百度优化里的优化数据；
      var _floatBtn = {}; //用户存放浮动按钮设置数据
      var _siteBulletinOemVersion = "";
      var _topBarMyNewsVersion = "5b1d1d964c06a7fa2611cfab7d170c97";
      var _topBarUpdateVersion = "60ae62533c7920fbcb5c127494eac264";
      var _panelOptionData = {
        "sysIndex": 2,
        "siteColList": "{\"sysIndex\":2,\"sysProduct\":3,\"sysNews\":4,\"sysAbout\":5,\"sysContact\":6,\"sysNewsDetail\":7,\"sysProductDetail\":8,\"sysMsgBoard\":9,\"sysPhotoDetail\":10,\"sysTemplate\":11,\"sysProductResult\":12,\"sysMallCart\":13,\"sysMallOrderSettle\":14,\"sysMallOrderList\":15,\"sysMallOrderDetail\":16,\"sysMemberSignup\":17,\"sysMemberLogin\":18,\"sysMemberProfile\":19,\"sysVoteResult\":20,\"sysNewsResult\":21,\"sysPhotoResult\":22,\"sysSiteSearch\":23,\"sysMemberCenter\":24}",
        "moduleTypeList": "{\"sysRecommendProduct\":2,\"sysLatestNews\":3,\"sysProductSearch\":4,\"sysProductFilter\":5,\"sysOnlineService\":6,\"sysFriendlyLink\":7,\"sysAbout\":8,\"sysContact\":9,\"sysNews\":11,\"sysNewsDetail\":12,\"sysProduct\":13,\"sysProductDetail\":14,\"sysMsgBoard\":15,\"sysPhotoDetail\":16,\"sysPhotoSlide\":19,\"sysMember\":20,\"sysLocation\":21,\"sysProductResult\":22,\"sysMallCart\":23,\"sysMallOrderSettle\":24,\"sysMallOrderList\":25,\"sysMallOrderDetail\":26,\"sysMemberSignup\":27,\"sysMemberLogin\":28,\"sysMemberProfile\":29,\"sysVoteResult\":30,\"sysNewsResult\":31,\"sysPhotoResult\":32,\"sysIndexFavorite\":33,\"sysIndexSearch\":34,\"sysIndexSearchResult\":35,\"sysDate\":36,\"sysShareTo\":37,\"sysWebsiteQrcode\":38,\"sysMemberCenter\":39}",
        "moduleStyleList": "{\"sysLocation\":56,\"sysIndexFavorite\":65,\"sysDate\":66,\"sysShareTo\":67,\"sysSiteSearch\":62,\"sysProductSearch\":45,\"sysMember\":51,\"newsGroup\":24,\"productGroup\":26,\"productFilter\":9,\"productCatalog\":21,\"navList\":11,\"serviceOnline\":40,\"sysWebsiteQrcode\":64,\"fullmeasure\":80,\"productListMarquee\":3,\"photoMarquee\":16,\"newsList\":6,\"newsLatest\":7,\"weather\":28,\"bdMap\":18,\"iframe\":20,\"sysMemberCenter\":55,\"floatImg\":79,\"floatBtn\":81,\"shoppingCart\":82,\"photoCard\":83}",
        "schemeCust": false,
        "webDebug": false,
        "allowedStyle": true,
        "templateType_free": 0,
        "imgMode": 2,
        "fontFamilyList": [{
          "first": "SimSun",
          "second": "宋体"
        },
        {
          "first": "PMingLiU",
          "second": "新细明体"
        },
        {
          "first": "FangSong_GB2312",
          "second": "仿宋_GB2312"
        },
        {
          "first": "微软雅黑",
          "second": "微软雅黑"
        },
        {
          "first": "隶书",
          "second": "隶书"
        },
        {
          "first": "幼圆",
          "second": "幼圆"
        },
        {
          "first": "STKaiti",
          "second": "华文楷体"
        },
        {
          "first": "方正舒体",
          "second": "方正舒体"
        },
        {
          "first": "华文彩云",
          "second": "华文彩云"
        },
        {
          "first": "华文行楷",
          "second": "华文行楷"
        },
        {
          "first": "华文宋体",
          "second": "华文宋体"
        },
        {
          "first": "楷体,楷体_GB2312, SimKai",
          "second": "楷体"
        },
        {
          "first": "黑体, SimHei",
          "second": "黑体"
        },
        {
          "first": "Arial",
          "second": "Arial"
        },
        {
          "first": "Tahoma",
          "second": "Tahoma"
        },
        {
          "first": "impact",
          "second": "impact"
        },
        {
          "first": "Arial Serif",
          "second": "Arial Serif"
        },
        {
          "first": "Georgia",
          "second": "Georgia"
        },
        {
          "first": "Garamond",
          "second": "Garamond"
        },
        {
          "first": "Times New Roman",
          "second": "Times New Roman"
        },
        {
          "first": "andale mono",
          "second": "andale mono"
        },
        {
          "first": "arial black,avant garde",
          "second": "arial black"
        },
        {
          "first": "comic sans ms",
          "second": "comic sans ms"
        }],
        "selectOptionList": ["<option value='2'>首页<\/option>", "<option value='103'>我们的服务<\/option>", "<option value='21'>新闻动态<\/option>", "<option value='101'>关于我们<\/option>", "<option value='102'>联系我们<\/option>", "<option value='9'>留言板<\/option>", "<option value='12'>产品展示<\/option>", "<option value='17'>会员注册<\/option>", "<option value='-1'>[会员栏目]<\/option>", "<option value='17'>┣&nbsp;会员注册<\/option>", "<option value='18'>┣&nbsp;会员登录<\/option>", "<option value='19'>┣&nbsp;会员资料<\/option>", "<option value='24'>┗&nbsp;会员中心<\/option>", "<option value='-2'>[商城栏目]<\/option>", "<option value='13'>┣&nbsp;购物车<\/option>", "<option value='14'>┣&nbsp;订单结算<\/option>", "<option value='15'>┣&nbsp;订单列表<\/option>", "<option value='16'>┗&nbsp;订单详情<\/option>", "<option value='-3'>[特殊栏目]<\/option>", "<option value='7'>┣&nbsp;文章详情<\/option>", "<option value='8'>┣&nbsp;产品详情<\/option>", "<option value='10'>┣&nbsp;图片详情<\/option>", "<option value='20'>┣&nbsp;投票结果<\/option>", "<option value='22'>┣&nbsp;图册目录结果<\/option>", "<option value='23'>┗&nbsp;全站搜索结果<\/option>", "<option value='-9'>[未使用的模块]<\/option>"],
        "moduleIconClassList": [{
          "style": 1,
          "className": "rich"
        },
        {
          "style": 2,
          "className": "product"
        },
        {
          "style": 3,
          "className": "product"
        },
        {
          "style": 4,
          "className": "photo"
        },
        {
          "style": 5,
          "className": "photo"
        },
        {
          "style": 6,
          "className": "article"
        },
        {
          "style": 7,
          "className": "article"
        },
        {
          "style": 8,
          "className": "product"
        },
        {
          "style": 9,
          "className": "filter"
        },
        {
          "style": 10,
          "className": "file"
        },
        {
          "style": 11,
          "className": "nav"
        },
        {
          "style": 12,
          "className": "product"
        },
        {
          "style": 13,
          "className": "product"
        },
        {
          "style": 14,
          "className": "sys"
        },
        {
          "style": 16,
          "className": "photo"
        },
        {
          "style": 17,
          "className": "flash"
        },
        {
          "style": 18,
          "className": "map"
        },
        {
          "style": 19,
          "className": "media"
        },
        {
          "style": 20,
          "className": "iframe"
        },
        {
          "style": 21,
          "className": "catalog"
        },
        {
          "style": 22,
          "className": "qqonline"
        },
        {
          "style": 23,
          "className": "vote"
        },
        {
          "style": 24,
          "className": "newsgroup"
        },
        {
          "style": 26,
          "className": "productGroup"
        },
        {
          "style": 27,
          "className": "photoGroup"
        },
        {
          "style": 28,
          "className": "weather"
        },
        {
          "style": 29,
          "className": "tab"
        },
        {
          "style": 30,
          "className": "product"
        },
        {
          "style": 31,
          "className": "photo"
        },
        {
          "style": 32,
          "className": "siteForm"
        },
        {
          "style": 33,
          "className": "link"
        },
        {
          "style": 34,
          "className": "table"
        },
        {
          "style": 35,
          "className": "mulModuleCol"
        },
        {
          "style": 36,
          "className": "media"
        },
        {
          "style": 37,
          "className": "code"
        },
        {
          "style": 72,
          "className": "weiboShow"
        },
        {
          "style": 38,
          "className": "productLabel"
        },
        {
          "style": 39,
          "className": "notice"
        },
        {
          "style": 40,
          "className": "serviceOnline"
        },
        {
          "style": 41,
          "className": "product"
        },
        {
          "style": 42,
          "className": "photo"
        },
        {
          "style": 45,
          "className": "productSearch"
        },
        {
          "style": 62,
          "className": "siteSearch"
        },
        {
          "style": 64,
          "className": "siteQrCode"
        },
        {
          "style": 66,
          "className": "date"
        },
        {
          "style": 56,
          "className": "location"
        },
        {
          "style": 51,
          "className": "memberLogin"
        },
        {
          "style": 65,
          "className": "indexFavorite"
        },
        {
          "style": 67,
          "className": "shareTo"
        },
        {
          "style": 75,
          "className": "msgSubmit"
        },
        {
          "style": 80,
          "className": "fullmeasure"
        },
        {
          "style": 79,
          "className": "floatImg"
        },
        {
          "style": 81,
          "className": "floatBtn"
        },
        {
          "style": 82,
          "className": "shoppingCart"
        },
        {
          "style": 83,
          "className": "photoCard"
        }],
        "faiSettingPanelStyleLink": "./css/site/faiSettingPanel.min.css?v=201512071738",
        "colorDefList": [{
          "key": 1,
          "name": "棕黑"
        },
        {
          "key": 2,
          "name": "银灰"
        },
        {
          "key": 4,
          "name": "蓝调"
        },
        {
          "key": 8,
          "name": "青绿"
        },
        {
          "key": 16,
          "name": "红紫"
        },
        {
          "key": 32,
          "name": "黄橙"
        }],
        "patternDefList": [{
          "id": 0,
          "styleName": "默认",
          "colorType": 0
        },
        {
          "id": 60,
          "styleName": "空白",
          "colorType": 0
        },
        {
          "id": 107,
          "styleName": "P107",
          "colorType": 16
        },
        {
          "id": 108,
          "styleName": "P108",
          "colorType": 4
        },
        {
          "id": 109,
          "styleName": "P109",
          "colorType": 4
        },
        {
          "id": 110,
          "styleName": "P110",
          "colorType": 32
        },
        {
          "id": 111,
          "styleName": "P111",
          "colorType": 1
        },
        {
          "id": 112,
          "styleName": "P112",
          "colorType": 16
        },
        {
          "id": 113,
          "styleName": "P113",
          "colorType": 16
        },
        {
          "id": 61,
          "styleName": "P061",
          "colorType": 1
        },
        {
          "id": 62,
          "styleName": "P062",
          "colorType": 2
        },
        {
          "id": 63,
          "styleName": "P063",
          "colorType": 4
        },
        {
          "id": 64,
          "styleName": "P064",
          "colorType": 8
        },
        {
          "id": 65,
          "styleName": "P065",
          "colorType": 16
        },
        {
          "id": 66,
          "styleName": "P066",
          "colorType": 32
        },
        {
          "id": 67,
          "styleName": "P067",
          "colorType": 1
        },
        {
          "id": 68,
          "styleName": "P068",
          "colorType": 2
        },
        {
          "id": 69,
          "styleName": "P069",
          "colorType": 4
        },
        {
          "id": 70,
          "styleName": "P070",
          "colorType": 8
        },
        {
          "id": 71,
          "styleName": "P071",
          "colorType": 16
        },
        {
          "id": 72,
          "styleName": "P072",
          "colorType": 32
        },
        {
          "id": 73,
          "styleName": "P073",
          "colorType": 1
        },
        {
          "id": 74,
          "styleName": "P074",
          "colorType": 2
        },
        {
          "id": 75,
          "styleName": "P075",
          "colorType": 4
        },
        {
          "id": 76,
          "styleName": "P076",
          "colorType": 8
        },
        {
          "id": 77,
          "styleName": "P077",
          "colorType": 16
        },
        {
          "id": 78,
          "styleName": "P078",
          "colorType": 32
        },
        {
          "id": 79,
          "styleName": "P079",
          "colorType": 1
        },
        {
          "id": 80,
          "styleName": "P080",
          "colorType": 2
        },
        {
          "id": 81,
          "styleName": "P081",
          "colorType": 4
        },
        {
          "id": 82,
          "styleName": "P082",
          "colorType": 8
        },
        {
          "id": 83,
          "styleName": "P083",
          "colorType": 16
        },
        {
          "id": 84,
          "styleName": "P084",
          "colorType": 32
        },
        {
          "id": 85,
          "styleName": "P085",
          "colorType": 1
        },
        {
          "id": 86,
          "styleName": "P086",
          "colorType": 2
        },
        {
          "id": 87,
          "styleName": "P087",
          "colorType": 4
        },
        {
          "id": 88,
          "styleName": "P088",
          "colorType": 8
        },
        {
          "id": 89,
          "styleName": "P089",
          "colorType": 16
        },
        {
          "id": 90,
          "styleName": "P090",
          "colorType": 32
        },
        {
          "id": 91,
          "styleName": "P091",
          "colorType": 1
        },
        {
          "id": 92,
          "styleName": "P092",
          "colorType": 2
        },
        {
          "id": 93,
          "styleName": "P093",
          "colorType": 4
        },
        {
          "id": 94,
          "styleName": "P094",
          "colorType": 8
        },
        {
          "id": 95,
          "styleName": "P095",
          "colorType": 16
        },
        {
          "id": 96,
          "styleName": "P096",
          "colorType": 32
        },
        {
          "id": 1,
          "styleName": "P001",
          "colorType": 4
        },
        {
          "id": 2,
          "styleName": "P002",
          "colorType": 2
        },
        {
          "id": 3,
          "styleName": "P003",
          "colorType": 4
        },
        {
          "id": 4,
          "styleName": "P004",
          "colorType": 16
        },
        {
          "id": 5,
          "styleName": "P005",
          "colorType": 4
        },
        {
          "id": 6,
          "styleName": "P006",
          "colorType": 16
        },
        {
          "id": 7,
          "styleName": "P007",
          "colorType": 4
        },
        {
          "id": 8,
          "styleName": "P008",
          "colorType": 1
        },
        {
          "id": 9,
          "styleName": "P009",
          "colorType": 4
        },
        {
          "id": 10,
          "styleName": "P010",
          "colorType": 16
        },
        {
          "id": 11,
          "styleName": "P011",
          "colorType": 2
        },
        {
          "id": 12,
          "styleName": "P012",
          "colorType": 32
        },
        {
          "id": 13,
          "styleName": "P013",
          "colorType": 1
        },
        {
          "id": 14,
          "styleName": "P014",
          "colorType": 32
        },
        {
          "id": 15,
          "styleName": "P015",
          "colorType": 16
        },
        {
          "id": 16,
          "styleName": "P016",
          "colorType": 8
        },
        {
          "id": 17,
          "styleName": "P017",
          "colorType": 32
        },
        {
          "id": 18,
          "styleName": "P018",
          "colorType": 1
        },
        {
          "id": 19,
          "styleName": "P019",
          "colorType": 2
        },
        {
          "id": 20,
          "styleName": "P020",
          "colorType": 1
        },
        {
          "id": 21,
          "styleName": "P021",
          "colorType": 1
        },
        {
          "id": 22,
          "styleName": "P022",
          "colorType": 8
        },
        {
          "id": 23,
          "styleName": "P023",
          "colorType": 2
        },
        {
          "id": 24,
          "styleName": "P024",
          "colorType": 16
        },
        {
          "id": 25,
          "styleName": "P025",
          "colorType": 4
        },
        {
          "id": 26,
          "styleName": "P026",
          "colorType": 4
        },
        {
          "id": 27,
          "styleName": "P027",
          "colorType": 16
        },
        {
          "id": 28,
          "styleName": "P028",
          "colorType": 16
        },
        {
          "id": 29,
          "styleName": "P029",
          "colorType": 1
        },
        {
          "id": 30,
          "styleName": "P030",
          "colorType": 1
        },
        {
          "id": 31,
          "styleName": "P031",
          "colorType": 1
        },
        {
          "id": 32,
          "styleName": "P032",
          "colorType": 8
        },
        {
          "id": 33,
          "styleName": "P033",
          "colorType": 16
        },
        {
          "id": 34,
          "styleName": "P034",
          "colorType": 16
        },
        {
          "id": 35,
          "styleName": "P035",
          "colorType": 8
        },
        {
          "id": 36,
          "styleName": "P036",
          "colorType": 16
        },
        {
          "id": 37,
          "styleName": "P037",
          "colorType": 16
        },
        {
          "id": 38,
          "styleName": "P038",
          "colorType": 8
        },
        {
          "id": 39,
          "styleName": "P039",
          "colorType": 16
        },
        {
          "id": 40,
          "styleName": "P040",
          "colorType": 16
        },
        {
          "id": 41,
          "styleName": "P041",
          "colorType": 32
        },
        {
          "id": 42,
          "styleName": "P042",
          "colorType": 32
        },
        {
          "id": 43,
          "styleName": "P043",
          "colorType": 4
        },
        {
          "id": 44,
          "styleName": "P044",
          "colorType": 1
        },
        {
          "id": 45,
          "styleName": "P045",
          "colorType": 16
        },
        {
          "id": 46,
          "styleName": "P046",
          "colorType": 4
        },
        {
          "id": 47,
          "styleName": "P047",
          "colorType": 2
        },
        {
          "id": 48,
          "styleName": "P048",
          "colorType": 16
        },
        {
          "id": 49,
          "styleName": "P049",
          "colorType": 4
        },
        {
          "id": 50,
          "styleName": "P050",
          "colorType": 8
        },
        {
          "id": 51,
          "styleName": "P051",
          "colorType": 4
        },
        {
          "id": 52,
          "styleName": "P052",
          "colorType": 1
        },
        {
          "id": 53,
          "styleName": "P053",
          "colorType": 1
        },
        {
          "id": 54,
          "styleName": "P054",
          "colorType": 16
        },
        {
          "id": 55,
          "styleName": "P055",
          "colorType": 8
        },
        {
          "id": 56,
          "styleName": "P056",
          "colorType": 32
        },
        {
          "id": 57,
          "styleName": "P057",
          "colorType": 4
        },
        {
          "id": 58,
          "styleName": "P058",
          "colorType": 8
        },
        {
          "id": 59,
          "styleName": "P059",
          "colorType": 4
        },
        {
          "id": 97,
          "styleName": "P097",
          "colorType": 32
        },
        {
          "id": 98,
          "styleName": "P098",
          "colorType": 1
        },
        {
          "id": 99,
          "styleName": "P099",
          "colorType": 2
        },
        {
          "id": 100,
          "styleName": "P100",
          "colorType": 4
        },
        {
          "id": 101,
          "styleName": "P101",
          "colorType": 16
        },
        {
          "id": 102,
          "styleName": "P102",
          "colorType": 8
        },
        {
          "id": 103,
          "styleName": "P103",
          "colorType": 32
        },
        {
          "id": 104,
          "styleName": "P104",
          "colorType": 16
        },
        {
          "id": 105,
          "styleName": "P105",
          "colorType": 8
        },
        {
          "id": 106,
          "styleName": "P106",
          "colorType": 16
        }],
        "modulePatternCssList": "{\"css_pattern1\":\"./css/pattern1.min.css?v=201512281739\"}",
        "allowedPattern": true,
        "minUrlViewPattern": "http://jz.faisco.com/proFunc.jsp",
        "minVerIconPattern": "siteGroupStd",
        "minVerNamePattern": "网站标准版",
        "trialTemplate": "付费主题",
        "allowedOldStyle": true,
        "minUrlViewOldStyle": "http://jz.faisco.com/proFunc.jsp",
        "minVerIconOldStyle": "siteGroupStd",
        "minVerNameOldStyle": "网站标准版"
      };

      var _refreshInfoList = {}; // 用于存放刷新列表
      var _footerItemHasSecondChild = false;
      var file_size_limit = parseInt("1");
      //浮动按钮样式链接缓存
      var _floatBtnCssLink = "./css/floatBtn1.min.css?v=201510121802";
      //浮动购物车样式链接缓存
      var _shoppingCartCssLink = "./css/shoppingCart1.min.css?v=201512211736";
      //产品列表
      var productGroupScriptLink = "./js/comm/jquery/jquery-menu-aim.min.js?v=201510191829";
      //魔方图册
      var _photoCardCssLink = "./css/photoCard1.min.css?v=201601051532";
      var _siteDemo = false;

      var _backToTop = false;
      var _aid = 7570029;
      var _cloneAid = 6871460;
      var _templateLayout = 1;
      var _webBannerHeight = -1;
    </script>
    <script type="text/javascript">
      Site.holidayLuckyMoneySrc01 = 'http://jz.faisys.com/image/pro/20151201/holidayLuckyMoneyBg.png';
      Site.holidayLuckyMoneySrc02 = 'http://jz.faisys.com/image/pro/20151201/holidayLuckyMoneyBg02.png';
      Site.holidayLuckyMoneySrc03 = 'http://jz.faisys.com/image/pro/20151201/holidayLuckyMoney03.png';
      Site.useBtnSrc = 'http://jz.faisys.com/image/pro/20151201/useBtn.png';
      Site.isShowYuanDanLuckyGuy = 'false';
      Site.isShowYuanDanLuckyGuySmall = 'false';
      Site.yuanDanEndYear = '2015';
      Site.yuanDanEndMonth = '12';
      Site.yuanDanEndDay = '31';
      Site.yuanDanEndMs = '-1181467000';
      Site.isTenMinutes = 'false';
    </script>
    <script type="text/javascript">
      var fk_old_onload = window.onload;
      window.onload = function() {
        if (typeof fk_old_onload == "function") {
          fk_old_onload.apply(this, arguments);
        }

        Site.pageOnload();
      };

      $LAB.script("./js/productSlide.min.js?v=201512071738");

      $LAB.script("./js/photoSlide.min.js?v=201601041813");
      $LAB.script("./js/imageEffect.min.js?v=201601131153").wait(function() {
        Site.functionInterfaceTrigger({
          name: "ImageEffect.FUNC.BASIC.Init"
        });
      });

      $LAB.script("./js/siteTemplates.min.js?v=201512221730").script("./js/faiSettingPanel.min.js?v=201512292011");

      $LAB.script("./js/faiFloatPanel.min.js?v=201512281739").script("./js/faiFloatPanel_bindEvent.min.js?v=201601121610").wait(function() {

        Site.initFaiFloatPanelIcon(); //初始化浮动设置面板

        Site.siteGuideInit();
        if (false) {
          $.cookie('_loadedRegStatIframe', true, {
            expires: 2
          });
        }

      });

      //关闭登录提示
      function tipsClose() {
        top.Fai.removeIng2();
        top.Fai.removeBg();
        $.cookie('hasLoginSite', 'false', {
          expires: 1,
          path: '/'
        });
        if (!_oem) {
          window.location.href = "http://seeyoui.faisco.cn";
        } else {
          window.location.href = "http://seeyoui.vip.webportal.cc";
        }
      };
    </script>
  </body>

</html>