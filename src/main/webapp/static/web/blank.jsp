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
    <style id='stylemodule' type='text/css'>
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
    <script type="text/javascript" src="${ctx_web}/js/comm/testBrowser.min.js?v=201510121802"></script>
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
        </div>
        <div class="topBarStaffContent">
          <div class="top">
              <div class="versionIcon siteGroupFre">
              </div>
            </a>
            <div class="right">
              <div class="title">
                网站免费版
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
                    width='187' src='${ctx_web}/image/demo/ABUIABAEGAAg6ua7rgUoyMTtRDC7ATgy.png' />
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
                      <div id='banner' class='banner extBanner' style='background:url(${ctx_web}/image/demo/ABUIABACGAAgia3GrgUokPy2zQcwoAs4wgM.jpg) 50% 50% no-repeat;height:450px'
                      normalheight='450' defaultwidth='0'>
                        <div class='banner defaultBannerMain' style='background:url(${ctx_web}/image/demo/ABUIABACGAAgia3GrgUokPy2zQcwoAs4wgM.jpg) 50% 50% no-repeat;height:450px'>
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
      <div id="hiddenModuleForms" class="hiddenModuleForms">
      </div>
      <div class="floatLeftTop">
        <div id="floatLeftTopForms" class="forms sideForms floatForms">
        </div>
      </div>
      <div class="floatRightTop">
        <div id="floatRightTopForms" class="forms sideForms floatForms">
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
          "p": "${ctx_web}/image/demo/ABUIABACGAAgia3GrgUokPy2zQcwoAs4wgM.jpg",
          "w": 1440,
          "h": 450,
          "tp": "${ctx_web}/image/demo/ABUIABACGAAgia3GrgUokPy2zQcwoAs4wgM!100x100.jpg"
        }],
        "n": [{
          "t": 1,
          "i": "ABUIABACGAAgia3GrgUokPy2zQcwoAs4wgM",
          "e": 0,
          "u": "",
          "el": "",
          "er": "",
          "p": "${ctx_web}/image/demo/ABUIABACGAAgia3GrgUokPy2zQcwoAs4wgM.jpg",
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
      var _hiddenModuleList = [];

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
          "p": "${ctx_web}/image/demo/ABUIABACGAAg_5jFrgUosLbshAcw8w44_gE.jpg"
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
        "x": "",//标题文字
        "fp": false,
        "st": {//副标题
          "y": 0,
          "x": "",//标题文字
          "f": "",//字体
          "c": "",//颜色
          "s": 0,//字号
          "i": 0,//斜体
          "w": 0,//加粗
          "u": 0//下划线
        },
        "jm": {
          "y": 0,
          "f": ""
        },
        "h": false,//是否隐藏
        "t": -1,//top
        "l": -1,//left
        "f": "",//字体
        "s": -1,//字号
        "w": -1,//加粗
        "c": "",//颜色
        "i": 0,//斜体
        "u": 0//下划线
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
        "p": "${ctx_web}/image/demo/ABUIABAEGAAg6ua7rgUoyMTtRDC7ATgy.png"
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
        "p": "${ctx_web}/image/demo/ABUIABAEGAAg6ua7rgUoyMTtRDC7ATgy.png"
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
        "faiSettingPanelStyleLink": "${ctx_web}/css/site/faiSettingPanel.min.css?v=201512071738",
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
        "modulePatternCssList": "{\"css_pattern1\":\"${ctx_web}/css/pattern1.min.css?v=201512281739\"}",
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
      var _floatBtnCssLink = "${ctx_web}/css/floatBtn1.min.css?v=201510121802";
      //浮动购物车样式链接缓存
      var _shoppingCartCssLink = "${ctx_web}/css/shoppingCart1.min.css?v=201512211736";
      //产品列表
      var productGroupScriptLink = "${ctx_web}/js/comm/jquery/jquery-menu-aim.min.js?v=201510191829";
      //魔方图册
      var _photoCardCssLink = "${ctx_web}/css/photoCard1.min.css?v=201601051532";
      var _siteDemo = false;

      var _backToTop = false;
      var _aid = 7570029;
      var _cloneAid = 6871460;
      var _templateLayout = 1;
      var _webBannerHeight = -1;
    </script>
    <script type="text/javascript">
/*       Site.holidayLuckyMoneySrc01 = 'http://jz.faisys.com/image/pro/20151201/holidayLuckyMoneyBg.png';
      Site.holidayLuckyMoneySrc02 = 'http://jz.faisys.com/image/pro/20151201/holidayLuckyMoneyBg02.png';
      Site.holidayLuckyMoneySrc03 = 'http://jz.faisys.com/image/pro/20151201/holidayLuckyMoney03.png';
      Site.useBtnSrc = 'http://jz.faisys.com/image/pro/20151201/useBtn.png';
      Site.isShowYuanDanLuckyGuy = 'false';
      Site.isShowYuanDanLuckyGuySmall = 'false';
      Site.yuanDanEndYear = '2015';
      Site.yuanDanEndMonth = '12';
      Site.yuanDanEndDay = '31';
      Site.yuanDanEndMs = '-1181467000';
      Site.isTenMinutes = 'false'; */
    </script>
    <script type="text/javascript">
      var fk_old_onload = window.onload;
      window.onload = function() {
        if (typeof fk_old_onload == "function") {
          fk_old_onload.apply(this, arguments);
        }

        Site.pageOnload();
      };

      $LAB.script("${ctx_web}/js/productSlide.min.js?v=201512071738");

      $LAB.script("${ctx_web}/js/photoSlide.min.js?v=201601041813");
      $LAB.script("${ctx_web}/js/imageEffect.min.js?v=201601131153").wait(function() {
        Site.functionInterfaceTrigger({
          name: "ImageEffect.FUNC.BASIC.Init"
        });
      });

      $LAB.script("${ctx_web}/js/siteTemplates.min.js?v=201512221730").script("${ctx_web}/js/faiSettingPanel.min.js?v=201512292011");

      $LAB.script("${ctx_web}/js/faiFloatPanel.min.js?v=201512281739").script("${ctx_web}/js/faiFloatPanel_bindEvent.min.js?v=201601121610").wait(function() {

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