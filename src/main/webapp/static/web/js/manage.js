/*!
 * Manage.js
 * URL:http://www.faisco.com
 * Only for Manage mode
 * Sort as
 * 		Utils/ModuleFunction/Others
 * Sort time @2011-10-22
 * Partition time @2012-05-16
 */
$(function() {
    $(".faiButton").livequery(function() {
        $(this).faiButton()
    })
});
Site.hideManageFramItem = function(b) {
    var a = _manageFrameItemDisplay;
    if (b == "productCom" || b == null) {
        if (!a.pOpen) {
            Fai.top.$("#manageFrameProductCommentManage").parent().hide();
            Fai.top.$("#manageFrameProductCommentManage").parent().addClass("manageFrameItemHide")
        } else {
            Fai.top.$("#manageFrameProductCommentManage").parent().show();
            Fai.top.$("#manageFrameProductCommentManage").parent().removeClass("manageFrameItemHide")
        }
    }
    if (b == "newsCom" || b == null) {
        if (!a.newsOpen) {
            Fai.top.$("#manageFrameNewsCommentManage").parent().hide();
            Fai.top.$("#manageFrameNewsCommentManage").parent().addClass("manageFrameItemHide")
        } else {
            Fai.top.$("#manageFrameNewsCommentManage").parent().show();
            Fai.top.$("#manageFrameNewsCommentManage").parent().removeClass("manageFrameItemHide")
        }
    }
    if (b == "integral" || b == null) {
        if (!a.iOpen) {
            Fai.top.$("#manageFrameIntegralList").parent().hide();
            Fai.top.$("#manageFrameIntegralList").parent().addClass("manageFrameItemHide");
            Fai.top.$("#manageFrameIntegralRules").parent().hide();
            Fai.top.$("#manageFrameIntegralRules").parent().addClass("manageFrameItemHide")
        } else {
            Fai.top.$("#manageFrameIntegralList").parent().show();
            Fai.top.$("#manageFrameIntegralList").parent().removeClass("manageFrameItemHide");
            Fai.top.$("#manageFrameIntegralRules").parent().show();
            Fai.top.$("#manageFrameIntegralRules").parent().removeClass("manageFrameItemHide")
        }
    }
};
Site.onManageFrameScroll = function(a) {
    if (Fai.isNull(a) || a == "") {
        return
    }
    var c = $("#" + a);
    if (!$.isEmptyObject(c)) {
        var b = c.position();
        if (b != null) {
            if (a == "manageFrameProductManage") {} else {
                $(".manageFrameLeftPanel").scrollTop(b.top)
            }
        }
    }
};
Site.onManageFrameShowUnfold = function() {
    var b = $(".manageFrameLeftPanel").first();
    var c = $(".manageFrameLeftTop").first();
    var a = c.clone();
    a.attr("id", "manageFrameLeftTopClone").insertAfter(c).hide();
    b.scroll(function() {
        var d = b.scrollTop();
        a.hide().delay(1500).css({
            position: "absolute",
            top: d,
            "z-index": 2
        }).fadeIn();
        if (d < 100) {
            a.hide()
        }
    })
};
Site.onManageFrameItemClick = function(a) {
    a = $(a);
    try {
        var i = $("#manageFrame").find("iframe");
        if (i[0].contentWindow.Site.getPageChange()) {
            if (!window.confirm("您的修改尚未保存，确定要离开吗？")) {
                return false
            }
            i[0].contentWindow.Site.setPageChange(false)
        }
    } catch(g) {}
    var d = a.attr("pageid");
    var e = Fai.top.$("#manageFrame");
    e.attr("pageid", d);
    var h = e.find(".manageFrameBtns");
    h.children().remove();
    h.hide();
    if (a.attr("target") == "manageFramePage") {
        e.find(".manageFrameItem").removeClass("manageFrameItemSel");
        a.parent().addClass("manageFrameItemSel")
    }
    var f = $('<div class="forWaiting ajaxLoading2" style="position:absolute;background-color:#fff;height:100%;top:0px;"></div>'),
    b = Fai.top.$(window),
    j = Fai.top.$(".manageFrameCenter"),
    c = Fai.top.$(".manageFramePage");
    j.css("background", "none");
    c.css({
        position: "relative",
        zIndex: "-2"
    });
    f.css({
        width: b.width() + "px",
        height: b.height() + "px",
        zIndex: "-1",
        left: "0",
        top: 3 - Fai.top.$(".manageFrameTop").height() + "px"
    });
    f.appendTo(".manageFrameCenter");
    c.load(function() {
        j.css("background", "");
        c.css({
            position: "",
            zIndex: ""
        });
        $(".forWaiting").remove()
    });
    return true
};
Site.enableManageFrameBtn = function(d, c, a) {
    var b = $("#" + c);
    if (a) {
        b.removeAttr("disabled");
        b.faiButton("enable")
    } else {
        b.attr("disabled", true);
        b.faiButton("disable")
    }
};
Site.enablePopupFrameBtn = function(b, d, c, a) {
    if (b) {
        Site.enableManageFrameBtn(d, c, a)
    } else {
        Fai.enablePopupWindowBtn(d, c, a)
    }
};
Site.onManageFrameClose2 = function() {
    top._manageStatus = false;
    Fai.removeIng(false);
    if (Fai.getUrlParam(Fai.top.location.href, "openmf")) {
        $(".manageFrameLeftTop").eq(1).css({
            position: "absolute",
            top: 0,
            "z-index": 2
        });
        Fai.top.location.href = "index.jsp";
        return
    }
    if (Fai.top._frameChanged > 0) {
        $(".manageFrameLeftTop").eq(1).css({
            position: "absolute",
            top: 0,
            "z-index": 2
        });
        parent.Fai.top.location.reload()
    } else {
        var a = $("#manageFrame").find("iframe");
        try {
            if (a[0].contentWindow.Site.getPageChange()) {
                if (!window.confirm("您的修改尚未保存，确定要离开吗？")) {
                    return
                }
                $(".manageFrameLeftTop").eq(1).css({
                    position: "absolute",
                    top: 0,
                    "z-index": 2
                });
                $("#manageFrame").remove();
                parent.Fai.top.$("#topManageFrame").remove();
                Fai.startInterval(null);
                return
            }
        } catch(b) {}
        $(".manageFrameLeftTop").eq(1).css({
            position: "absolute",
            top: 0,
            "z-index": 2
        });
        parent.Fai.top.$("#topManageFrame").hide();
        Fai.startInterval(null)
    }
};
Site.initPageVal = "";
Site.showTopManageFrame = function(a) {
    top._manageStatus = true;
    if (Site.checkSaveBar()) {
        return
    }
    var b = false;
    topManageFrame = Fai.top.$("#topManageFrame");
    var d = 9032;
    $.each(Fai.top.$("body>"),
    function(g, h) {
        var f = $(h).css("z-index");
        if (typeof f == "undefined") {
            return
        }
        if (f == "auto") {
            return
        }
        var j = $(h).prop("id");
        if (j === "newRapidSiteTopBar" || j === "newRapidSiteMain" || j === "menuList" || j === "newRapidSitePreview") {
            return
        }
        if (f > d) {
            $(h).css("z-index", d - 1)
        }
    });
    if (topManageFrame.length > 0) {
        topManageFrame.show()
    } else {
        b = true;
        var c = "<iframe id='topManageFrame' name='topManageFrame' scrolling='auto' frameborder='0' src='' style='width:100%;height:100%;position:fixed;_position:absolute;z-index:" + d + ";left:0;top:0;'></iframe>";
        Fai.top.$(c).appendTo("body")
    }
    if (!Fai.isNull(a) && a != "" && a != "default" && Site.initPageVal != a) {
        Site.initPageVal = a;
        b = true;
        Fai.top.$("#topManageFrame").attr("src", "manageFrame.jsp?_item=" + a)
    } else {
        if (topManageFrame.length != 1) {
            Fai.top.$("#topManageFrame").attr("src", "manageFrame.jsp")
        }
    }
    if (b) {
        Fai.top.$("<div class='forWaiting ajaxLoading2' style='position:fixed;background-color:#fff;height:100%;width:100%;top:0px;z-index:9032'></div>").appendTo("body");
        Fai.top.$("#topManageFrame").load(function() {
            Fai.top.$(".forWaiting").remove()
        })
    }
};
Site.showManageFrame2 = function(d, v, f) {
    if (Site.checkSaveBar()) {
        return
    }
    Fai.removeIng();
    var c = _manageFrameOption;
    Fai.stopInterval(null);
    Fai.top._frameChanged = 0;
    var m = $("#manageFrame");
    if (m.length == 1) {
        m.show();
        if (!Fai.isNull(d) && d != "" && d != "default") {
            var h = $("#" + d);
            h.click();
            var b = h.parent().siblings(".manageFrameBanner");
            if (b.hasClass("manageFrameBanner2")) {
                b.click()
            }
            var e = m.find("iframe");
            e.attr("src", h.attr("href"));
            Site.onManageFrameScroll(d)
        }
        return
    }
    var w = [{
        id: "manageFrameBannerProduct",
        name: "产品管理",
        siteAuthFlag: [Site.siteAuth.PRODUCT_ADD, Site.siteAuth.PRODUCT_MANAGE],
        list: [{
            id: "manageFrameProductAdd",
            name: "添加产品",
            siteAuthFlag: Site.siteAuth.PRODUCT_ADD,
            href: "manage/productEdit.jsp",
            dog: "Site.logDog(100050, 1);"
        },
        {
            id: "manageFrameProductManage",
            name: "管理产品",
            siteAuthFlag: [Site.siteAuth.PRODUCT_ADD, Site.siteAuth.PRODUCT_MANAGE],
            href: "manage/productManage.jsp",
            dog: "Site.logDog(100050, 2);"
        },
        {
            id: "manageFrameProductProp",
            name: "管理产品参数",
            siteAuthFlag: Site.siteAuth.PRODUCT_MANAGE,
            href: "manage/productPropManage.jsp",
            dog: "Site.logDog(100050, 3);"
        },
        {
            id: "manageFrameProductGroup",
            name: "管理产品分类",
            siteAuthFlag: Site.siteAuth.PRODUCT_MANAGE,
            href: "manage/productGroupEdit.jsp",
            dog: "Site.logDog(100050, 4);"
        },
        {
            id: "manageFrameProductLabelManage",
            name: "管理产品标签",
            siteAuthFlag: Site.siteAuth.PRODUCT_MANAGE,
            href: "manage/productLabelEdit.jsp",
            dog: "Site.logDog(100050, 5);"
        },
        {
            id: "manageFrameProductCommentManage",
            name: "管理产品评论",
            siteAuthFlag: Site.siteAuth.PRODUCT_MANAGE,
            href: "manage/productCommentManage.jsp",
            dog: "Site.logDog(100050, 6);"
        },
        {
            id: "manageFrameProductSetting",
            name: "产品高级设置",
            siteAuthFlag: Site.siteAuth.PRODUCT_MANAGE,
            href: "manage/productSetting.jsp",
            dog: "Site.logDog(100050, 55);"
        }]
    },
    {
        id: "manageFrameBannerNews",
        name: "文章管理",
        siteAuthFlag: [Site.siteAuth.NEWS_ADD, Site.siteAuth.NEWS_MANAGE],
        list: [{
            id: "manageFrameNewsAdd",
            name: "添加文章",
            siteAuthFlag: Site.siteAuth.NEWS_ADD,
            href: "manage/newsEdit.jsp",
            dog: "Site.logDog(100050, 7);"
        },
        {
            id: "manageFrameNewsManage",
            name: "管理文章",
            siteAuthFlag: [Site.siteAuth.NEWS_ADD, Site.siteAuth.NEWS_MANAGE],
            href: "manage/newsManage.jsp",
            dog: "Site.logDog(100050, 8);"
        },
        {
            id: "manageFrameNewsManageGroups",
            name: "管理文章分类",
            siteAuthFlag: Site.siteAuth.NEWS_MANAGE,
            href: "manage/newsGroupEdit.jsp",
            dog: "Site.logDog(100050, 9);"
        },
        {
            id: "manageFrameNewsCommentManage",
            name: "管理文章评论",
            siteAuthFlag: Site.siteAuth.NEWS_MANAGE,
            href: "manage/newsCommentManage.jsp?",
            dog: "Site.logDog(100050, 10);"
        },
        {
            id: "manageFrameNewsSetting",
            name: "文章高级设置",
            siteAuthFlag: Site.siteAuth.NEWS_MANAGE,
            href: "manage/newsSetting.jsp",
            dog: "Site.logDog(100050, 11);"
        }]
    },
    {
        id: "manageFrameBannerPhoto",
        name: "图册管理",
        siteAuthFlag: Site.siteAuth.PHOTO_MANAGE,
        list: [{
            id: "manageFramePhotoAdd",
            name: "创建图册",
            href: "manage/photoGroupEdit.jsp" + (v ? "?mobiSettingState=1": ""),
            dog: "Site.logDog(100050, 17);"
        },
        {
            id: "manageFramePhotoManage",
            name: "管理图册",
            href: "manage/photoGroupManage.jsp" + (v ? "?mobiSettingState=1": ""),
            dog: "Site.logDog(100050, 18);"
        }]
    },
    {
        id: "manageFrameBannerMember",
        name: "会员管理",
        siteAuthFlag: [Site.siteAuth.MEMBER_MANAGE, Site.siteAuth.SITE_DESIGN],
        list: [{
            id: "manageFrameMemberConfig",
            name: "会员功能设置",
            siteAuthFlag: Site.siteAuth.MEMBER_MANAGE,
            href: "manage/memberConfig.jsp",
            dog: "Site.logDog(100050, 19);"
        },
        {
            id: "manageFrameMemberAdd",
            name: "添加会员",
            siteAuthFlag: Site.siteAuth.MEMBER_MANAGE,
            href: "manage/memberEdit.jsp",
            dog: "Site.logDog(100050, 20);"
        },
        {
            id: "manageFrameMemberManage",
            name: "管理会员",
            siteAuthFlag: Site.siteAuth.MEMBER_MANAGE,
            href: "manage/memberList.jsp",
            dog: "Site.logDog(100050, 21);"
        },
        {
            id: "manageFrameNotVerifiedMemberManage",
            name: "未验证会员",
            siteAuthFlag: Site.siteAuth.MEMBER_MANAGE,
            href: "manage/memberList.jsp?groupId=-1",
            dog: "Site.logDog(100050, 22);"
        },
        {
            id: "manageFrameMemberLevelManage",
            name: "管理会员等级",
            siteAuthFlag: Site.siteAuth.MEMBER_MANAGE,
            href: "manage/memberLevelManage.jsp",
            dog: "Site.logDog(100050, 23);"
        },
        {
            id: "manageFrameMemberGroupsManage",
            name: "管理会员分组",
            siteAuthFlag: Site.siteAuth.MEMBER_MANAGE,
            href: "manage/memberGroupEdit.jsp",
            dog: "Site.logDog(100050, 24);"
        },
        {
            id: "manageFrameIntegralRules",
            name: "设置积分规则",
            siteAuthFlag: Site.siteAuth.MEMBER_MANAGE,
            href: "manage/integralRulesEdit.jsp",
            dog: "Site.logDog(100050, 56);"
        },
        {
            id: "manageFrameIntegralList",
            name: "管理会员积分",
            siteAuthFlag: Site.siteAuth.MEMBER_MANAGE,
            href: "manage/integralListManage.jsp",
            dog: "Site.logDog(100050, 57);"
        },
        {
            id: "manageFrameMemberPropList",
            name: "管理会员资料项",
            siteAuthFlag: Site.siteAuth.MEMBER_MANAGE,
            href: "manage/memberPropList.jsp",
            dog: "Site.logDog(100050, 25);"
        },
        {
            id: "manageFrameMemberCol",
            name: "设计会员页面",
            siteAuthFlag: Site.siteAuth.SITE_DESIGN,
            href: "manage/memberColList.jsp",
            dog: "Site.logDog(100050, 26);"
        }]
    },
    {
        id: "manageFrameBannerMall",
        name: "商城管理",
        siteAuthFlag: [Site.siteAuth.MALL_MANAGE, Site.siteAuth.SITE_DESIGN],
        list: [{
            id: "manageFrameMallEdit",
            name: "商城功能设置",
            siteAuthFlag: Site.siteAuth.MALL_MANAGE,
            href: "manage/mallEdit.jsp",
            dog: "Site.logDog(100050, 27);"
        },
        {
            id: "manageFrameOrderManage",
            name: "管理订单",
            siteAuthFlag: Site.siteAuth.MALL_MANAGE,
            href: "manage/orderlistManage.jsp",
            dog: "Site.logDog(100050, 28);"
        },
        {
            id: "manageFrameMallCol",
            name: "设计商城页面",
            siteAuthFlag: Site.siteAuth.SITE_DESIGN,
            href: "manage/mallColList.jsp",
            dog: "Site.logDog(100050, 29);"
        }]
    },
    {
        id: "manageFrameBannerMessage",
        name: "留言管理",
        siteAuthFlag: Site.siteAuth.MSG_BOARD_MANAGE,
        list: [{
            id: "manageFrameMessageAdd",
            name: "留言功能设置",
            href: "manage/msgBoardSetting.jsp",
            dog: "Site.logDog(100050, 30);"
        },
        {
            id: "manageFrameMessageAdd",
            name: "添加留言",
            href: "manage/msgBoardReply.jsp",
            dog: "Site.logDog(100050, 31);"
        },
        {
            id: "manageFrameMsgBoard",
            name: "管理留言",
            href: "manage/msgBoardManage.jsp",
            dog: "Site.logDog(100050, 32);"
        },
        {
            id: "manageFrameMsgBoardGroups",
            name: "管理留言项",
            href: "manage/msgBoardItemsEdit.jsp",
            dog: "Site.logDog(100050, 33);"
        }]
    },
    {
        id: "manageFrameBannerVote",
        name: "投票管理",
        siteAuthFlag: Site.siteAuth.VOTE_MANAGE,
        list: [{
            id: "manageFrameVoteAdd",
            name: "添加投票主题",
            href: "manage/voteEdit.jsp",
            dog: "Site.logDog(100050, 34);"
        },
        {
            id: "manageFrameVote",
            name: "管理投票",
            href: "manage/voteManage.jsp",
            dog: "Site.logDog(100050, 35);"
        }]
    },
    {
        id: "manageFrameForm",
        name: "表单管理",
        siteAuthFlag: Site.siteAuth.FORM_MANAGE,
        list: [{
            id: "manageFrameFormAdd",
            name: "添加表单",
            href: "manage/siteFormAdd.jsp",
            dog: "Site.logDog(100050, 36);"
        },
        {
            id: "manageFrameFormManage",
            name: "管理表单",
            href: "manage/siteFormManage.jsp",
            dog: "Site.logDog(100050, 37);"
        }]
    },
    {
        id: "manageFrameBannerResourceLib",
        name: "资源库管理",
        siteAuthFlag: Site.siteAuth.SITE_IMG_MANAGE,
        list: [{
            id: "manageFrameSiteImg",
            name: "管理文件",
            href: "manage/siteImageManage.jsp",
            dog: "Site.logDog(100050, 39);"
        },
        {
            id: "manageFrameFolder",
            name: "管理文件夹",
            href: "manage/siteImageGroupEdit.jsp",
            dog: "Site.logDog(100050, 40);"
        },
        {
            id: "manageFrameSiteVirtualRoot",
            name: "管理虚拟根目录",
            href: "manage/vRootManage.jsp",
            dog: "Site.logDog(100050, 41);"
        }]
    },
    {
        id: "manageFrameSiteStatistics",
        name: "网站统计",
        siteAuthFlag: Site.siteAuth.WEB_STATISTICS,
        list: [{
            id: "manageFrameSiteStatOverview",
            name: "网站概况",
            href: "manage/siteStatOverview.jsp",
            dog: "Site.logDog(100050, 42);"
        },
        {
            id: "manageFrameSiteStatTime",
            name: "全站统计",
            href: "manage/siteStatTime.jsp",
            dog: "Site.logDog(100050, 43);"
        },
        {
            id: "manageFrameSiteStatDetailColId",
            name: "栏目统计",
            href: "manage/siteStatDetail.jsp?type=1",
            dog: "Site.logDog(100050, 44);"
        },
        {
            id: "manageFrameSiteStatDetailPdId",
            name: "产品统计",
            href: "manage/siteStatDetail.jsp?type=2",
            dog: "Site.logDog(100050, 45);"
        },
        {
            id: "manageFrameSiteStatDetailNdId",
            name: "文章统计",
            href: "manage/siteStatDetail.jsp?type=3",
            dog: "Site.logDog(100050, 46);"
        }]
    },
    {
        id: "manageFrameBannerSys",
        name: "系统设置",
        siteAuthFlag: Site.siteAuth.SYSTEM_SETTING,
        list: [{
            id: "manageFrameMailRemind",
            name: "邮件即时提醒",
            href: "manage/mailRemindManage.jsp",
            dog: "Site.logDog(100050, 47);"
        },
        {
            id: "manageFrameLanguage",
            name: "网站语言版本",
            href: "manage/languageManage.jsp",
            dog: "Site.logDog(100050, 50);"
        },
        {
            id: "manageSiteBackupRestore",
            name: "管理网站备份",
            href: "manage/siteBackupRestore.jsp",
            dog: "Site.logDog(100050, 51);"
        },
        {
            id: "manageFrameSiteDomain",
            name: "管理网站域名",
            href: "manage/siteDomainManage.jsp",
            dog: "Site.logDog(100050, 52);"
        },
        {
            id: "manageFrameSiteMobileManage",
            name: "管理手机网站",
            href: "manage/siteMobileManage.jsp",
            dog: "Site.logDog(100050, 53);"
        },
        {
            id: "manageFrameMobileSiteDomain",
            name: "管理手机网站域名",
            href: "manage/siteMDomainManage.jsp",
            dog: "Site.logDog(100050, 54);"
        }]
    }];
    var l = ["<div id='manageFrame' class='manageFrame' pageid='0'>", "<div class='manageFrameTop' colspan='2'>", "<div class='marginManageTop'>", "<div class='manageTopSite'>", "<a href='javascript:;' class='manageClose' onclick='Site.onManageFrameClose2();return false;'>", "</a>", "</div>", c.oem ? "<div class='manageTopOemIcon'></div>": "<div class='manageTopIcon'></div>", "<div class='manageTopBack'>", "<a href='javascript:;' class='tbutton manageBack' onclick='Site.onManageFrameClose2();return false;'>", "<span class='styleSettingButton'></span>", "</a>", "</div>", "<div id='styleTitleHelper' class='styleTitleHelper'></div>", (v && !Site.getCookieFlag(39)) ? "<div id='styleMobiHelper' class='styleTitleHelper'>此网站管理数据同步电脑版、手机版网站<a id='hideMobiHelper' href='javascript:;' onclick='return false;'>我知道了</a></div>": "", "<a class='manageFrameClose' hidefocus='true' href='javascript:;' onclick='Site.onManageFrameClose2();return false;' title='退出管理'>", "</a>", "</div>", "</div>", "<div class='manageFrameMiddle'>", "<table cellpadding='0' cellspacing='0' class='manageFrameTable'>", "<tr><td class='manageFrameLeft' valign='top' align='left'>", "<div class='manageFrameLeftPanel'>", "<div class='manageFrameLeftTop'>", "<div class='manageFrameLeftTopBtn manageFrameUnfold' title='全部展开'></div>", "<div class='manageFrameLeftTopBtn manageFrameFold' title='全部收起'></div>", "</div>"];
    for (var t = 0; t < w.length; ++t) {
        var z = w[t];
        var u = z.siteAuthFlag;
        if ("object" == typeof(u)) {
            var g = false;
            for (var r = 0; (r < u.length) && !g; r++) {
                if (Fai.checkBit(_siteAuth, u[r])) {
                    g = true
                }
            }
            if (!g) {
                continue
            }
        } else {
            if (!Fai.checkBit(_siteAuth, u)) {
                continue
            }
        }
        l.push("<div>");
        l.push("<ul id='" + z.id + "' class='manageFrameBanner'><span class='icon'>&nbsp;</span><span>" + z.name + "</span></ul>");
        var o = z.list;
        for (var p = 0; p < o.length; ++p) {
            var x = o[p];
            if (f && (x.id == "manageFrameSiteMobileManage" || x.id == "manageFrameMobileSiteDomain")) {
                continue
            }
            if ("object" == typeof(u)) {
                if ("object" == typeof(x.siteAuthFlag)) {
                    var a = false;
                    for (var q = 0; (q < x.siteAuthFlag.length) && !a; q++) {
                        if (Fai.checkBit(_siteAuth, x.siteAuthFlag[q])) {
                            a = true
                        }
                    }
                    if (!a) {
                        continue
                    }
                } else {
                    if (!Fai.checkBit(_siteAuth, x.siteAuthFlag)) {
                        continue
                    }
                }
            }
            if (x.hidden) {
                continue
            }
            var s = x.href;
            if (s.indexOf("?") > 0) {
                s += "&"
            } else {
                s += "?"
            }
            s += "frame=true&popupID=0";
            var y = "manageFramePage";
            if (x.target) {
                y = x.target
            }
            l.push("<ul class='manageFrameItem'><a id='" + x.id + "' hidefocus='true' onclick='" + x.dog + "return Site.onManageFrameItemClick(this);'");
            l.push(" href='" + s + "'");
            l.push(" target='" + y + "'");
            l.push(" pageid='" + x.id + "'>");
            l.push(x.name);
            l.push("</a></ul>")
        }
        if (t < w.length - 1) {
            l.push("<ul class='manageFrameSep'></ul>")
        }
        l.push("</div>")
    }
    l.push("<div class='manageFrameLeftBottom'></div>", "</div></td>", "<td class='manageFrameCenter' valign='top' align='left'>", "<iframe class='manageFramePage' name='manageFramePage' src='about:blank' scrolling='auto' frameborder='0'>浏览器不支持嵌入式框架</iframe>", "</td>", "</tr>", "</table>", "</div>", "</div>");
    m = $(l.join(""));
    m.appendTo("body");
    if (m.find("#hideMobiHelper").length > 0) {
        m.find("#hideMobiHelper").click(function() {
            $("#styleMobiHelper").hide();
            Site.setCookieFlag(39, true)
        })
    }
    Site.hideManageFramItem();
    m.find(".manageFrameItem").mouseover(function() {
        if (!$(this).hasClass("manageFrameItemSel")) {
            $(this).addClass("manageFrameItemHover")
        }
    }).mouseleave(function() {
        $(this).removeClass("manageFrameItemHover")
    });
    m.find(".manageFrameBanner").click(function() {
        var j = $(this).attr("id");
        var i = true;
        if ($(this).hasClass("manageFrameBanner2")) {
            $(this).removeClass("manageFrameBanner2");
            $(this).parent().find(".manageFrameItem").show();
            $(this).parent().find(".manageFrameItemHide").hide();
            i = true
        } else {
            $(this).addClass("manageFrameBanner2");
            $(this).parent().find(".manageFrameItem").hide();
            i = false
        }
        if (j == "manageFrameBannerProduct") {
            Site.setCookieFlag(6, i)
        } else {
            if (j == "manageFrameBannerNews") {
                Site.setCookieFlag(7, i)
            } else {
                if (j == "manageFrameBannerCol") {
                    Site.setCookieFlag(8, i)
                } else {
                    if (j == "manageFrameBannerMember") {
                        Site.setCookieFlag(9, i)
                    } else {
                        if (j == "manageFrameBannerMall") {
                            Site.setCookieFlag(10, i)
                        } else {
                            if (j == "manageFrameBannerSite") {
                                Site.setCookieFlag(11, i)
                            } else {
                                if (j == "manageFrameBannerSys") {
                                    Site.setCookieFlag(12, i)
                                } else {
                                    if (j == "manageFrameBannerPhoto") {
                                        Site.setCookieFlag(18, i)
                                    } else {
                                        if (j == "manageFrameBannerResourceLib") {
                                            Site.setCookieFlag(19, i)
                                        } else {
                                            if (j == "manageFrameBannerVote") {
                                                Site.setCookieFlag(20, i)
                                            } else {
                                                if (j == "manageFrameBannerMessage") {
                                                    Site.setCookieFlag(21, i)
                                                } else {
                                                    if (j == "manageFrameBannerModule") {
                                                        Site.setCookieFlag(23, i)
                                                    } else {
                                                        if (j == "manageFrameForm") {
                                                            Site.setCookieFlag(24, i)
                                                        } else {
                                                            if (j == "manageFrameSiteStatistics") {
                                                                Site.setCookieFlag(25, i)
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    });
    if (!Site.getCookieFlag(6)) {
        $("#manageFrameBannerProduct").click()
    }
    if (!Site.getCookieFlag(7)) {
        $("#manageFrameBannerNews").click()
    }
    if (!Site.getCookieFlag(8)) {
        $("#manageFrameBannerCol").click()
    }
    if (!Site.getCookieFlag(9)) {
        $("#manageFrameBannerMember").click()
    }
    if (!Site.getCookieFlag(10)) {
        $("#manageFrameBannerMall").click()
    }
    if (!Site.getCookieFlag(11)) {
        $("#manageFrameBannerSite").click()
    }
    if (!Site.getCookieFlag(12)) {
        $("#manageFrameBannerSys").click()
    }
    if (!Site.getCookieFlag(18)) {
        $("#manageFrameBannerPhoto").click()
    }
    if (!Site.getCookieFlag(19)) {
        $("#manageFrameBannerResourceLib").click()
    }
    if (!Site.getCookieFlag(20)) {
        $("#manageFrameBannerVote").click()
    }
    if (!Site.getCookieFlag(21)) {
        $("#manageFrameBannerMessage").click()
    }
    if (!Site.getCookieFlag(23)) {
        $("#manageFrameBannerModule").click()
    }
    if (!Site.getCookieFlag(24)) {
        $("#manageFrameForm").click()
    }
    if (!Site.getCookieFlag(25)) {
        $("#manageFrameSiteStatistics").click()
    }
    Fai.top.$("html").css("overflow", "hidden");
    Fai.top.$("body").css("overflow", "hidden");
    Fai.stopInterval(null);
    var e = m.find("iframe");
    if (!Fai.isNull(d) && d != "" && d != "default") {
        var h = $("#" + d);
        h.click();
        var b = h.parent().siblings(".manageFrameBanner");
        if (b.hasClass("manageFrameBanner2")) {
            b.click()
        }
        e.attr("src", h.attr("href"))
    } else {
        if (!Fai.top._oem) {
            e.attr("src", "manage/welcome.jsp?frame=true&popupID=0")
        } else {
            e.attr("src", "manage/welcome_oem.jsp?frame=true&popupID=0")
        }
    }
    Site.onManageFrameShowUnfold();
    Site.onManageFrameScroll(d);
    m.find("div.manageFrameLeftTopBtn").click(function() {
        var A = $(this),
        n = m.find("ul.manageFrameBanner");
        if (A.hasClass("manageFrameUnfold")) {
            for (var k = 0; k < n.length; k++) {
                var j = $(n[k]);
                if (j.hasClass("manageFrameBanner2")) {
                    j.click();
                    continue
                }
            }
        } else {
            if (Fai.isIE6()) {
                $(".manageFrameLeftPanel").scrollTop(0)
            }
            for (var k = 0; k < n.length; k++) {
                var j = $(n[k]);
                if (!j.hasClass("manageFrameBanner2")) {
                    j.click();
                    continue
                }
            }
        }
    });
    if (typeof(c.typeVersion) === "string" && c.typeVersion != "") {
        $("#styleTitleHelper").html("您正在管理“" + c.typeVersion + "”的网站数据。")
    }
};
Site.clickCloneDemoTemplate = function() {
    if ($("#cloneTemplate").attr("checked")) {
        $(".cloneTemplate").show();
        $(".cloneAll").hide()
    } else {
        $(".cloneTemplate").hide();
        $(".cloneAll").show()
    }
};
Site.showCloneDemo = function(c, e, b) {
    if (!Fai.checkBit(Fai.top._siteAuth, Site.siteAuth.SITE_DESIGN)) {
        Fai.ing("您没有网站设计的权限，无法复制网站，请联系您的企业管理员。", false);
        return
    }
    var f = 420;
    var a = 50;
    if (b > 1) {
        a = 100
    }
    var g = new Array();
    g.push("<div style='line-height:20px; color:black; text-align:center; padding:10px 0px;'>");
    g.push("使用“极速建站”后，<span class='cloneAll'>您的网站内容将全部更换为样板网站内容</span>");
    g.push("<span class='cloneTemplate' style='display:none;'>您的网站将更换为网站模版，内容不会改变</span>。");
    g.push("<div style='float:left; padding:8px 0 0 17px;'>");
    if (b > 1) {
        g.push("<div class='cloneAll' style='color:red;width:300px;'>&nbsp;&nbsp;注意：确定后您的网站数据将被全部删除，不可恢复！</div>");
        g.push("<div class='cloneAll' style='padding-left:12px;'>或者您可以首先&nbsp;<a hidefocus='true' style='color:blue;' target='_blank' href='index.jsp?openmf=manageSiteBackupRestore'>备份网站</a>&nbsp;以便于恢复。</div>")
    }
    g.push("<div style='position:absolute;left:25px;top:85px;width:100px;height:20px;'>");
    g.push("</div>");
    g.push("</div>");
    g.push("</div>");
    var d = Fai.popupBodyWindow({
        title: "极速建站",
        content: g.join(""),
        width: f,
        height: a
    });
    Fai.addPopupBodyWindowBtn(d, {
        id: "save",
        text: "确定",
        click: function() {
            var h = false;
            if ($("#cloneTemplate").attr("checked")) {
                h = true
            }
            if (b > 1) {
                if (!h && !confirm("确定复制网站？确定后您的网站数据将被全部删除，不可恢复！")) {
                    return
                }
            }
            Fai.ing("正在处理中...", false);
            $.cookie("_bannerLibWeight", null, {
                expires: 1,
                path: "/"
            });
            Fai.enablePopupBodyWindowBtn(d, "save", false);
            $.ajax({
                type: "post",
                url: Site.genAjaxUrl("site_h.jsp"),
                data: "cmd=cloneDemo&demoAid=" + c + "&template=" + h + "&templateId=" + e,
                error: function() {
                    Fai.enablePopupBodyWindowBtn(d, "save", true);
                    Fai.ing("系统繁忙，请稍候重试", false)
                },
                success: function(i) {
                    Fai.enablePopupBodyWindowBtn(d, "save", true);
                    if (Fai.successHandle(i, "操作成功", "", "", 3, 1)) {
                        Fai.top.location.href = "/index.jsp"
                    }
                }
            })
        }
    });
    Fai.addPopupBodyWindowBtn(d, {
        id: "cancel",
        text: "取消",
        click: function() {
            Fai.top.location.href = "/index.jsp"
        }
    })
};
Site.hiddenTitle = function() {
    Fai.ing("您可以从网站上方的“网站设计”-“网站设置”重新选择。", true);
    $("#corpTitle").fadeOut(600);
    Fai.top._titleData.h = true;
    if (Fai.top._useTemplateTitle) {
        Fai.top._templateTitleData.h = true
    }
    Site.styleSetting("refresh", "webSettingTab");
    Fai.top._titleChanged++;
    Site.styleChanged();
    Site.setRefreshInfo("moduleEdit", true)
};
Site.initCorpTitleManage = function(a) {
    $("#corpTitle").mouseover(function() {
        Site.addEditLayer("corpTitle", a, 0, {
            fromEditLayer: true
        })
    }).mouseleave(function() {
        Site.removeEditLayer("corpTitle")
    });
    $("#corpTitle").css("cursor", "move");
    $("#corpTitle").attr("title", "按住鼠标，可随意拖动。");
    $("#corpTitle").draggable({
        beforeStart: function() {
            var c, d = Fai.top.$("#corpTitle");
            if (d.hasClass("titlefixtop")) {
                var b;
                b = Fai.top.$(".floatLeftTop").offset().top - Fai.top.$("#webTop").offset().top;
                c = d.offset().left - d.parent().offset().left;
                d.removeClass("titlefixtop");
                d.css({
                    position: "",
                    top: b + "px",
                    left: c + "px"
                })
            }
        },
        start: function() {
            Site.disableEditLayer()
        },
        stop: function() {
            Site.enableEditLayer();
            if (Fai.top.$("#corpTitle").offset().top < 22) {
                Fai.top.$("#corpTitle").offset({
                    top: 22,
                    left: Fai.top.$("#corpTitle").offset().left
                })
            }
            if (Fai.top.$("#corpTitle").offset().left < 0) {
                Fai.top.$("#corpTitle").offset({
                    top: Fai.top.$("#corpTitle").offset().top,
                    left: 0
                })
            }
            var b = Fai.getBrowserWidth() - Fai.top.$("#corpTitle").width();
            if (Fai.top.$("#corpTitle").offset().left > b) {
                Fai.top.$("#corpTitle").offset({
                    top: Fai.top.$("#corpTitle").offset().top,
                    left: b
                })
            }
            Fai.top._titleData.t = Fai.top.$("#corpTitle").position().top;
            Fai.top._titleData.l = Fai.top.$("#corpTitle").position().left;
            if (_useTemplateTitle) {
                Fai.top._templateTitleData.t = Fai.top.$("#corpTitle").position().top;
                Fai.top._templateTitleData.l = Fai.top.$("#corpTitle").position().left
            }
            if (top._titlePositionFixTop) {
                Fai.top.$("#corpTitle").removeClass("titlefixtop");
                Site.onTitlePositionFixTop()
            }
            Fai.top._titleChanged++;
            Site.styleChanged();
            Site.setRefreshInfo("moduleDrag", true)
        },
        distance: 1
    })
};
Site.onTitlePositionFixTop = function() {
    if (!top._titlePositionFixTop) {
        return
    }
    var b = Fai.top.$(window),
    m,
    l = Fai.top.$("#corpTitle"),
    k = Fai.top.$("#g_main"),
    n = Fai.top.$("#webTop"),
    a = Fai.top.$(".webTopTable"),
    g = Fai.top.$(".floatLeftTop"),
    e,
    j = l.offset().top - n.offset().top,
    i = parseInt(l.css("left").replace("px", "")),
    d = l.position().top,
    f = l.parent(),
    h = f.offset().left - l.offset().left,
    c = false;
    k.off("scroll.corpTitle");
    k.on("scroll.corpTitle",
    function() {
        var o = l.offset().top,
        p = g.offset().top;
        m = Site.getNavInClientPosition(l).left;
        if (a.find("#corpTitle").length > 0) {
            e = a;
            e.css({
                zIndex: "60",
                position: "relative"
            })
        }
        if (!c && o < p) {
            c = true;
            l.css({
                left: m + "px",
                top: p + "px",
                position: "fixed"
            });
            l.addClass("titlefixtop")
        }
        if (c && p - n.offset().top < j && l.hasClass("titlefixtop")) {
            l.css({
                left: i + "px",
                top: d + "px",
                position: "absolute"
            });
            c = false;
            l.removeClass("titlefixtop")
        }
    });
    b.off("resize.corpTitle");
    b.on("resize.corpTitle",
    function() {
        var p;
        var o = Fai.top.$(window).width();
        if (l.hasClass("titlefixtop")) {
            setTimeout(function() {
                p = f.offset().left;
                l.css("left", (p - h) + "px")
            },
            0)
        }
    })
};
Site.hiddenBanner = function() {
    Fai.ing("您可以从网站上方的“网站设计”-“网站设置”重新选择。", true);
    $("#banner").fadeOut(600,
    function() {
        Fai.top.$("#bannereditLayer").remove()
    });
    Fai.top._bannerData.h = true;
    if (Fai.top._useTemplateBanner) {
        Fai.top._templateBannerData.h = true
    } else {
        Fai.top._pageBannerData.h = true
    }
    Site.changeBannerTabStatus(false);
    Site.styleSetting("refresh", "webSettingTab");
    Site.webSettingTabClick();
    Fai.top._bannerChanged++;
    Site.styleChanged()
};
Site.initBannerManage = function(a) {
    Fai.top.$("#banner").mousemove(function() {
        Site.addEditLayer("banner", a, 3)
    }).mouseleave(function() {
        Site.removeEditLayer("banner")
    });
    Site.bindGobalEvent("changeTemplateType",
    function(c, b) {
        Fai.top.$("#banner").attr("defaultwidth", Site.getDefaultBannerWidth(Fai.top._templateBannerWeight || 0))
    })
};
Site.getDefaultBannerWidth = function(a) {
    if (!arguments.callee.opt) {
        arguments.callee.opt = {
            "1": 960,
            "10": 960,
            "11": 960,
            "12": 960,
            "13": 960,
            "14": 960,
            "15": 960,
            "2": 700,
            "3": 400,
            "4": 280,
            "5": 1440,
            "6": 1440,
            "20": 740,
            "21": 740
        }
    }
    return arguments.callee.opt[a] || 960
};
Site.settingBannerLink = function() {
    var n = Fai.top._bannerData.n;
    var f, k, b, j;
    var a = "";
    var h = "padding:5px 0 5px 0;border-bottom:1px solid #b5c8eb;border-right:1px solid #b5c8eb;";
    var d = "padding:5px 0 5px 0;border-bottom:1px solid #b5c8eb;";
    var c = "display:inline-block;*zoom:1;width:210px;text-decoration:none;word-break:keep-all;white-space:nowrap;-o-text-overflow:ellipsis;text-overflow:ellipsis;overflow:hidden;cursor:default;";
    Fai.top.$("#popupWindowForSettingBannerLink").remove();
    var g = [];
    g.push("<div id='popupWindowForSettingBannerLink' style='font-size:12px;font-family:\"Microsoft YaHei\", \"微软雅黑\", sans-serif;color:#000;padding:5px 10px 5px 10px;'>");
    g.push("	<div>");
    g.push("		<p style='padding-left:10px;height:24px;line-height:24px;'>链接列表：</p>");
    g.push("	</div>");
    g.push("	<div style='border:1px solid #b5c8eb;border-bottom:none;'>");
    g.push("		<table cellpadding='0' cellspacing='0' style='width:100%;text-align:center;'>");
    g.push("			<tr style='background:#eef3fe;'>");
    g.push("				<th style='width:140px;" + h + "'>横幅</th>");
    g.push("				<th style='width:220px;" + h + "'>链接地址</th>");
    g.push("				<th style='width:100px;" + h + "'>文件</th>");
    g.push("				<th style='" + d + "'>操作</th>");
    g.push("			</tr>");
    if (n.length) {
        for (var e = 0; e < n.length; e++) {
            f = n[e];
            a = f.p.replace(Fai.top._resRoot, "");
            k = f.p || "";
            k = k.replace(/\/banners\//, "/bannerPreview/");
            if (f.e == 2) {
                b = f.jUrl;
                j = f.jName || "无"
            } else {
                if (f.e == 1) {
                    b = f.jUrl;
                    j = f.jName || "无"
                } else {
                    if (f.e == 0) {
                        b = "javascript:;";
                        j = "无"
                    }
                }
            }
            g.push("	<tr>");
            g.push("		<td style='" + h + "'>");
            g.push("			<img src='" + k + "'  width='100' height='30' />");
            g.push("		</td>");
            g.push("		<td style='" + h + "'>");
            g.push("			<a href='javascript:;' class='J_bannerLink_" + f.i + "' style='" + c + "'>" + j + "</a>");
            g.push("		</td>");
            g.push("		<td style='" + h + "'>");
            if (f.t == 1) {
                g.push("<a href='/view.jsp?fileID=" + f.i + "' target='_blank' style='color:#51befa;'>点击查看</a>")
            } else {
                g.push("<a href='" + (Fai.top._resDownloadRoot + a) + "' target='_blank' style='color:#51befa;'>点击下载</a>")
            }
            g.push("		</td>");
            g.push("		<td style='" + d + "'>");
            g.push("			<a href='javascript:;' onclick='Site.changeBannerLink(\"" + f.i + "\");return false;' style='color:#51befa;'>编辑</a>");
            g.push("		</td>");
            g.push("	</tr>")
        }
    }
    g.push("		</table>");
    g.push("	</div>");
    g.push("</div>");
    var m = {
        title: "编辑横幅链接",
        divContent: g.join(""),
        width: 620,
        height: 400
    };
    var l = Fai.popupWindow(m);
    Fai.addPopupWindowBtn(l, {
        id: "pbwAddPropSave",
        extClass: "saveButton",
        text: "确 定",
        click: "close"
    });
    Fai.addPopupWindowBtn(l, {
        id: "pbwAddPropClose",
        extClass: "cancelButton",
        text: "取 消",
        click: "close"
    });
    Site.bindGobalEvent("bannerLinkChange",
    function(s, q) {
        var r = Fai.top.$("#popupWindowForSettingBannerLink").find(".J_bannerLink_" + q.i);
        if (r.length > 0) {
            var p = [];
            var i = "";
            var o = "";
            if (q.e == 2) {
                i = q.jUrl;
                o = q.jName
            } else {
                if (q.e == 1) {
                    i = q.jUrl;
                    o = q.jName
                } else {
                    if (q.e == 0) {
                        i = "javascript:;";
                        o = "无"
                    }
                }
            }
            r.replaceWith("<a href='javascript:;' class='J_bannerLink_" + q.i + "' style='" + c + "'>" + o + "</a>")
        }
    })
};
Site.changeBannerLink = function(d) {
    var n = Fai.top._bannerData.n;
    if (n.length < 1) {
        return
    }
    var a = "";
    var b = "";
    var c = "";
    var k = "";
    var f;
    var h = false;
    for (var e = 0; e < n.length; e++) {
        if (n[e].i == d) {
            f = n[e];
            a = f.p.replace(Fai.top._resRoot, "");
            h = true;
            break
        }
    }
    if (!h) {
        return
    }
    b = "checked='checked'";
    c = "";
    k = "display:none;";
    if (f.e != 0 && $.trim(f.jUrl).length > 0) {
        b = "";
        c = "checked='checked'";
        k = "display:block;"
    }
    var g = [];
    g.push('<div id="setBody" style="padding:5px 0;">');
    g.push('<div id="jpmRadioPanel" style="height:25px;line-height:25px;">');
    g.push('<span style="display:inline-block;width:83px;text-align:right;">跳转方式：</span>');
    g.push('<input id="jpmNot" name="jpmRadio" type="radio" ' + b + ' onclick="Site.changeBannerLink.jumpChange(0);" style="vertical-align:-3px;"><label for="jpmNot" style="cursor:pointer;">不跳转</label>');
    g.push('<input id="jpmCus" name="jpmRadio" type="radio" ' + c + ' onclick="Site.changeBannerLink.jumpChange(1);" style="vertical-align:-3px;"><label for="jpmCus" style="cursor:pointer;">自定义链接</label>');
    g.push("</div>");
    g.push('<div id="cusUrlPanel" style="margin:9px 0;line-height:23px;float:left;' + k + '">');
    g.push('<label for="cusUrl" style="cursor:text;width:83px;text-align:right;float:left;">链接地址：</label>');
    g.push('<input id="cusUrl" type="text" name="cusUrl" size="16" style="float:left;"/>');
    g.push("</div>");
    g.push('<div id="downloadPanel" style="padding:10px 0;clear:both;">');
    g.push('<span style="display:inline-block;width:83px;text-align:right;">横幅文件：</span>');
    if (f.t == 1) {
        g.push('<a href="/view.jsp?fileID=' + d + '" target="_blank" style="color:#51BEFA;">点击查看</a>')
    } else {
        g.push('<a href="' + Fai.top._resDownloadRoot + a + '" target="_blank" style="color:#51BEFA;">点击下载</a>')
    }
    g.push("</div>");
    g.push("</div>");
    var m = {
        title: "编辑横幅链接",
        divContent: g.join(""),
        width: 320,
        height: 100
    };
    var j = Fai.popupWindow(m);
    Fai.addPopupWindowBtn(j, {
        id: "pbwAddPropSave",
        extClass: "saveButton",
        text: "确 定",
        click: Site.changeBannerLink.save
    });
    Fai.addPopupWindowBtn(j, {
        id: "pbwAddPropClose",
        extClass: "cancelButton",
        text: "取 消",
        click: "close"
    });
    var l = {
        inputId: "cusUrl",
        moduleType: 7,
        jumpType: f.jType || 0,
        jumpIde: f.u,
        jumpName: Fai.decodeHtml(f.jName) || "",
        whetherTop: true
    };
    Site.jumpControl(l);
    Site.changeBannerLink.pbwId = j;
    Site.changeBannerLink.data = f
}; (function(a, b) {
    b.jumpChange = function(d) {
        var c = Fai.top.$("#popupWindow" + b.pbwId);
        if (d == 0) {
            c.find("#cusUrlPanel").hide()
        } else {
            c.find("#cusUrlPanel").show()
        }
    };
    b.save = function() {
        var f = b.pbwId;
        var g = Fai.top.$("#popupWindow" + f);
        if (g.find("#jpmCus").prop("checked") == true) {
            var e = g.find("#jumpCtrl");
            var h = g.find("#cusUrl");
            if (a.trim(h.val()).length < 1) {
                b.data.e = 0;
                b.data.jType = 0;
                b.data.jUrl = "";
                b.data.jName = "";
                b.data.u = ""
            } else {
                var d = e.attr("_lurl");
                if (d == null) {
                    Fai.closePopupWindow(f);
                    return
                }
                var c = parseInt(e.attr("_ltype")) || 0;
                b.data.e = 1;
                b.data.jType = c;
                if (c === 103 || c === 1) {
                    b.data.jName = Fai.encodeHtml(d) || ""
                } else {
                    b.data.jName = Fai.encodeHtml(e.attr("_lname")) || ""
                }
                b.data.jUrl = d || "";
                b.data.u = e.attr("_lide") || ""
            }
        } else {
            b.data.e = 0;
            b.data.jType = 0;
            b.data.jUrl = "";
            b.data.jName = "";
            b.data.u = ""
        }
        b.data.urlChange = 1;
        Site.refreshBanner(Fai.top._bannerData.n.length - 1);
        b.data.urlChange = 0;
        Fai.top._bannerChanged++;
        Site.styleChanged();
        Site.setRefreshInfo("siteBanner", true);
        Site.triggerGobalEvent("bannerLinkChange", b.data);
        Fai.closePopupWindow(b.pbwId)
    }
})(jQuery, Site.changeBannerLink);
Site.hiddenLocaler = function() {
    Fai.ing("您可以从网站上方的“网站设计”-“网站设置”重新选择。", true);
    $("#localer").fadeOut(600);
    Fai.top._localeData.h = true;
    if (Fai.top._useTemplateLocale) {
        Fai.top._templateLocaleData.h = true
    }
    if (Fai.top._useTemplateLocale) {
        Site.styleSetting("refresh", "webSettingTab")
    } else {
        Site.styleSetting("refresh", "pageSettingTab")
    }
    Fai.top._localeChanged++;
    Site.styleChanged();
    Site.setRefreshInfo("moduleEdit", true)
};
Site.initLocalerManage = function(a) {
    $("#localer").unbind("mouseover");
    $("#localer").find(".J_localerList a").unbind("mousedown");
    $("#localer").draggable("destroy");
    $("#localer").mouseover(function() {
        Site.openLocalerList();
        var c = parseInt($("#localer").attr("_moduleStyle"));
        if (c >= 4 && c <= 9) {
            var b = setInterval(function() {
                var d = $("#localer").find(".J_localerList").height();
                if ($("#localer").find(".J_localerPanel").height() == d) {
                    Site.addEditLayer("localer", a, 0, {
                        fromEditLayer: true
                    });
                    clearInterval(b)
                }
            },
            50)
        } else {
            Site.addEditLayer("localer", a, 0, {
                fromEditLayer: true
            })
        }
    }).mouseleave(function() {
        Site.closeLocalerList(this);
        Site.removeEditLayer("localer")
    });
    $("#localer").attr("title", "按住鼠标，可随意拖动。");
    $("#localer").css("cursor", "move");
    $("#localer").draggable({
        start: function() {
            $(this).css("right", "auto");
            Site.disableEditLayer()
        },
        stop: function() {
            Site.enableEditLayer();
            if (Fai.top.$("#localer").offset().top < 22) {
                Fai.top.$("#localer").offset({
                    top: 22,
                    left: Fai.top.$("#localer").offset().left
                })
            }
            if (Fai.top.$("#localer").offset().left < 0) {
                Fai.top.$("#localer").offset({
                    top: Fai.top.$("#localer").offset().top,
                    left: 0
                })
            }
            var b = Fai.getBrowserWidth() - Fai.top.$("#localer").width();
            if (Fai.top.$("#localer").offset().left > b) {
                Fai.top.$("#localer").offset({
                    top: Fai.top.$("#localer").offset().top,
                    left: b
                })
            }
            Fai.top._localeData.t = Fai.top.$("#localer").position().top;
            Fai.top._localeData.l = Fai.top.$("#localer").position().left;
            if (_useTemplateLocale) {
                Fai.top._templateLocaleData.t = Fai.top.$("#localer").position().top;
                Fai.top._templateLocaleData.l = Fai.top.$("#localer").position().left
            }
            Fai.top._localeChanged++;
            Site.styleChanged();
            Site.setRefreshInfo("moduleDrag", true)
        },
        distance: 1,
        containment: "#g_main",
        scroll: false
    });
    $("#localer").css("cursor", "move")
};
Site.initNavList = function(c) {
    $("#nav").unbind("mouseover").unbind("mouseleave");
    var b = '<div class="navMoveHandle"><div class="draggableBtn faiDraggableHandle navMoveEdit"></div></div>',
    a = c.concat([{
        operationText: "恢复排版",
        display: "text",
        evalScript: "Site.restoreNavStyle();"
    }]);
    $("#nav").mouseover(function() {
        var d = Site.addEditLayer("nav", top._navStyleData.nmove === 1 ? a: c, 4);
        Site.resetNavOffsetLeft(this, d);
        Site.addNavDragMoveHandle(this, b, d);
        if ($(this).hasClass("ui-resizable")) {
            $(this).find("> .ui-icon").show();
            $(this).find("> .ui-resizable-n").show();
            $(this).find("> .ui-resizable-w").show();
            $(this).find("> .ui-resizable-s").show();
            $(this).find("> .ui-resizable-e").show()
        }
    }).mouseleave(function() {
        Site.removeEditLayer("nav");
        Site.removeNavDragMoveHandle();
        if ($(this).hasClass("ui-resizable")) {
            $(this).find("> .ui-icon").hide();
            $(this).find("> .ui-resizable-n").hide();
            $(this).find("> .ui-resizable-w").hide();
            $(this).find("> .ui-resizable-s").hide();
            $(this).find("> .ui-resizable-e").hide()
        }
    })
};
Site.resetNavOffsetLeft = function(c, e) {
    if (!e) {
        return
    }
    var a = $(c).outerWidth(),
    b = $(c).offset().left,
    d = document.documentElement ? document.documentElement.clientWidth: document.body.clientWidth;
    if (a >= d - 27) {
        e.css("left", ((d - 1000) / 2 + b) + "px")
    }
};
Site.addNavDragMoveHandle = function(e, d, g) {
    var c = Fai.top.$("#nav .navMoveHandle");
    if (c.length === 0 && parseInt(_templateLayout) !== 4) {
        $("#nav").append(d)
    }
    c = Fai.top.$("#nav .faiDraggableHandle");
    if (c.offset() && c.offset().top < $("#g_main").offset().top) {
        Fai.top.$("#nav .navMoveHandle").css("top", "auto");
        c.addClass("navHandleBorder");
        return
    }
    if (!g) {
        return
    }
    var f = g.offset().left,
    b = g.outerWidth(),
    a = document.documentElement ? document.documentElement.clientHeight: document.body.clientHeight;
    draggableHandleWidth = c.width(),
    draggableHandleHeight = c.height(),
    navHeight = Fai.top.$("#nav").outerHeight(),
    draggableHandleTop = c.offset() ? c.offset().top: 0,
    draggableHandleLeft = c.offset() ? c.offset().left: 0;
    if (draggableHandleLeft > f && f + b > draggableHandleLeft) {
        Fai.top.$("#nav .navMoveHandle").css("top", "auto");
        c.addClass("navHandleBorder");
        return
    }
};
Site.removeNavDragMoveHandle = function() {
    var a = $("#nav .navMoveHandle");
    if (a.length > 0) {
        a.remove()
    }
};
Site.hiddenNav = function() {
    Fai.ing("您可以从网站上方的“网站设计”-“网站设置”重新选择。", true);
    $("#nav").fadeOut(600);
    Fai.top._navStyleData.no = false;
    Fai.top._navStyleChanged++;
    Site.styleChanged()
};
Site.refreshNavContainer = function() {
    var a = Fai.top._templateLayout;
    if (a == 0 || a == 1 || a == 2 || a == 7 || a == 8) {
        Fai.top.Site.showNavItemContainer()
    } else {
        Fai.top.Site.hideNavItemContainer()
    }
};
Site.autoNavWidth = function() {
    Fai.top.Fai.removeCtrlStyleCssList("stylenav", "nav", [{
        cls: "",
        key: "width"
    },
    {
        cls: ".navMainContent",
        key: "width"
    }]);
    top.$("#nav").css("width", "")
};
Site.setNavWidth = function(a) {
    Fai.top.Fai.setCtrlStyleCssList("stylenav", "nav", [{
        cls: "",
        key: "width",
        value: a + "px"
    },
    {
        cls: ".navMainContent",
        key: "width",
        value: "100%"
    }]);
    top.$("#nav").css("width", "")
};
Site.autoNavCntPosition = function() {
    Fai.top.Fai.removeCtrlStyleCssList("stylenav", "nav", [{
        cls: "",
        key: "left"
    },
    {
        cls: "",
        key: "top"
    }])
};
Site.setNavCntPosition = function(a) {
    Fai.top.Fai.setCtrlStyleCssList("stylenav", "nav", [{
        cls: "",
        key: "top",
        value: a.t + "px"
    },
    {
        cls: "",
        key: "left",
        value: a.l + "px"
    }]);
    Fai.top.$("#nav").css("top", "").css("left", "")
};
Site.autoNavHeight = function() {
    Fai.top.Fai.removeCtrlStyleCssList("stylenav", "nav", [{
        cls: "",
        key: "height"
    },
    {
        cls: ".navMainContent",
        key: "height"
    }]);
    top.$("#nav").css("height", "")
};
Site.setNavHeight = function(a) {
    Fai.top.Fai.setCtrlStyleCssList("stylenav", "nav", [{
        cls: "",
        key: "height",
        value: a + "px"
    },
    {
        cls: ".navMainContent",
        key: "height",
        value: "100%"
    }]);
    top.$("#nav").css("height", "");
    Site.setNavBgSize()
};
Site.autoContentWidth = function() {
    Fai.top.Fai.removeCtrlStyleCssList("stylenav", "nav", [{
        cls: ".navContent",
        key: "width"
    }])
};
Site.autoContentHeight = function() {
    Fai.top.Fai.removeCtrlStyleCssList("stylenav", "nav", [{
        cls: ".navContent",
        key: "height"
    }])
};
Site.setContentWidth = function(a) {
    Fai.top.Fai.setCtrlStyleCssList("stylenav", "nav", [{
        cls: ".navContent",
        key: "width",
        value: a + "px"
    }])
};
Site.setContentHeight = function(a) {
    Fai.top.Fai.setCtrlStyleCssList("stylenav", "nav", [{
        cls: ".navContent",
        key: "height",
        value: a + "px"
    },
    {
        cls: ".navLeft",
        key: "height",
        value: "100%"
    },
    {
        cls: ".navCenterContent",
        key: "height",
        value: "100%"
    },
    {
        cls: ".navRight",
        key: "height",
        value: "100%"
    }]);
    Site.setNavContentBgSize()
};
Site.setNavBg = function(a) {
    Fai.top.Fai.setCtrlStyleCssList("stylenav", "nav", [{
        cls: "",
        key: "background",
        value: a
    }]);
    if (Fai.top._navStyleData.nb.r == 4) {
        Fai.top.Fai.setCtrlStyleCss("stylenav", "nav", "", "background-size", "100% 100%")
    } else {
        if (Fai.top._navStyleData.nb.r == 5) {
            Fai.top.Fai.setCtrlStyleCss("stylenav", "nav", "", "background-size", "100%")
        }
    }
};
Site.autoNavBg = function() {
    Fai.top.Fai.removeCtrlStyleCssList("stylenav", "nav", [{
        cls: "",
        key: "background"
    },
    {
        cls: "",
        key: "background-size"
    }])
};
Site.hideNavBg = function() {
    Fai.top.Fai.setCtrlStyleCssList("stylenav", "nav", [{
        cls: "",
        key: "background",
        value: "none"
    }])
};
Site.setNavContentBg = function(a) {
    Fai.top.Fai.setCtrlStyleCssList("stylenav", "nav", [{
        cls: ".navContent",
        key: "background",
        value: a
    },
    {
        cls: ".navTop",
        key: "background",
        value: "none"
    },
    {
        cls: ".navContent .navLeft",
        key: "background",
        value: "none"
    },
    {
        cls: ".navContent .navRight",
        key: "background",
        value: "none"
    },
    {
        cls: ".navContent .navCenterContent",
        key: "background",
        value: "none"
    },
    {
        cls: ".navContent .navCenter",
        key: "background",
        value: "none"
    },
    {
        cls: ".navBottom",
        key: "background",
        value: "none"
    }]);
    if (Fai.top._navStyleData.cb.r == 4) {
        Fai.top.Fai.setCtrlStyleCss("stylenav", "nav", ".navContent", "background-size", "100% 100% !important")
    } else {
        if (Fai.top._navStyleData.cb.r == 5) {
            Fai.top.Fai.setCtrlStyleCss("stylenav", "nav", ".navContent", "background-size", "100%  !important")
        }
    }
};
Site.autoNavContentBg = function() {
    Fai.top.Fai.removeCtrlStyleCssList("stylenav", "nav", [{
        cls: ".navContent",
        key: "background"
    },
    {
        cls: ".navContent",
        key: "background-size"
    },
    {
        cls: ".navTop",
        key: "background"
    },
    {
        cls: ".navContent .navLeft",
        key: "background"
    },
    {
        cls: ".navContent .navRight",
        key: "background"
    },
    {
        cls: ".navContent .navCenterContent",
        key: "background"
    },
    {
        cls: ".navContent .navCenter",
        key: "background"
    },
    {
        cls: ".navBottom",
        key: "background"
    }])
};
Site.hideNavContentBg = function() {
    Fai.top.Fai.setCtrlStyleCssList("stylenav", "nav", [{
        cls: ".navContent",
        key: "background",
        value: "none"
    },
    {
        cls: ".navTop",
        key: "background",
        value: "none"
    },
    {
        cls: ".navContent .navLeft",
        key: "background",
        value: "none"
    },
    {
        cls: ".navContent .navRight",
        key: "background",
        value: "none"
    },
    {
        cls: ".navContent .navCenterContent",
        key: "background",
        value: "none"
    },
    {
        cls: ".navContent .navCenter",
        key: "background",
        value: "none"
    },
    {
        cls: ".navBottom",
        key: "background",
        value: "none"
    }])
};
Site.removeNavPostionOrRect = function(a) {
    if (a === "position") {
        top.$("#nav").css("top", "").css("left", "")
    } else {
        top.$("#nav").css("width", "")
    }
};
Site.autoContentCntPosition = function() {
    Fai.top.Fai.removeCtrlStyleCssList("stylenav", "nav", [{
        cls: ".navContent",
        key: "margin-top"
    },
    {
        cls: ".navContent",
        key: "margin-left"
    }])
};
Site.setContentCntPosition = function(a) {
    Fai.top.Fai.setCtrlStyleCssList("stylenav", "nav", [{
        cls: ".navContent",
        key: "margin-top",
        value: a.t + "px"
    },
    {
        cls: ".navContent",
        key: "margin-left",
        value: a.l + "px"
    }])
};
Site.setNavItemBg = function(b) {
    var a = {
        rev: true
    };
    Fai.top.Fai.setCtrlStyleCssList("stylenav", "nav", [{
        cls: ".item",
        key: "background",
        value: b
    },
    {
        cls: ".item .itemLeft",
        key: "background",
        value: "none"
    },
    {
        cls: ".item .itemCenter",
        key: "background",
        value: "none"
    },
    {
        cls: ".item .itemRight",
        key: "background",
        value: "none"
    }], a);
    if (Fai.top._navStyleData.nib.r == 4) {
        Fai.top.Fai.setCtrlStyleCss("stylenav", "nav", ".item", "background-size", "100% 100%")
    } else {
        if (Fai.top._navStyleData.nib.r == 5) {
            Fai.top.Fai.setCtrlStyleCss("stylenav", "nav", ".item", "background-size", "100%")
        }
    }
};
Site.setNavBgSize = function() {
    if (top._navStyleData.nb.y == 0) {
        Fai.top.Fai.setCtrlStyleCssList("stylenav", "nav", [{
            cls: "",
            key: "background-size",
            value: "contain"
        }])
    }
};
Site.setNavContentBgSize = function() {
    if (top._navStyleData.cb.y == 0) {
        Fai.top.Fai.setCtrlStyleCssList("stylenav", "nav", [{
            cls: ".navContent",
            key: "background-size",
            value: "contain"
        },
        {
            cls: ".navLeft",
            key: "background-size",
            value: "100% 100%"
        },
        {
            cls: ".navCenterContent",
            key: "background-size",
            value: "contain"
        },
        {
            cls: ".navRight",
            key: "background-size",
            value: "100% 100%"
        }])
    }
};
Site.setNavItemBgSize = function() {
    if (top._navStyleData.nib.y == 0) {
        Fai.top.Fai.setCtrlStyleCssList("stylenav", "nav", [{
            cls: ".item",
            key: "background-size",
            value: "contain"
        }])
    }
};
Site.setNavItemCenterBgSize = function() {
    if (((Fai.top._templateFrame >= 4001 && Fai.top._templateFrame <= 4006) || (Fai.top._templateFrame >= 24001 && Fai.top._templateFrame <= 24006)) && Fai.top._navStyleData.s == 0) {
        return
    }
    if ((Fai.top._navStyleData.s >= 46 && Fai.top._navStyleData.s <= 50) || (Fai.top._navStyleData.s >= 64 && Fai.top._navStyleData.s <= 68)) {
        return
    }
    if (top._navHeightChange) {
        Fai.top.Fai.setCtrlStyleCssList("stylenav", "nav", [{
            cls: ".item .itemLeft",
            key: "background-size",
            value: "100% 100%"
        },
        {
            cls: ".item .itemCenter",
            key: "background-size",
            value: "contain"
        },
        {
            cls: ".item .itemRight",
            key: "background-size",
            value: "100% 100%"
        }])
    }
};
Site.setNavItemSepBgPosition = function() {
    Fai.top.Fai.setCtrlStyleCssList("stylenav", "nav", [{
        cls: ".itemSep",
        key: "background-position",
        value: "center"
    },
    ]);
    Site.setNavItemSepMarginTop()
};
Site.setNavItemSepMarginTop = function() {
    if (top._navStyleData.nis.h != -1 && top._navStyleData.niss.h != -1) {
        var a = (top._navStyleData.nis.h - top._navStyleData.niss.h) / 2;
        Fai.top.Fai.setCtrlStyleCssList("stylenav", "nav", [{
            cls: ".itemSep",
            key: "margin-top",
            value: a + "px"
        },
        ])
    }
    if (top._navStyleData.niss.h == -1) {
        Fai.top.Fai.removeCtrlStyleCssList("stylenav", "nav", [{
            cls: ".itemSep",
            key: "margin-top"
        },
        ])
    }
};
Site.autoNavBgSize = function() {
    Fai.top.Fai.removeCtrlStyleCssList("stylenav", "nav", [{
        cls: "",
        key: "background-size"
    }])
};
Site.autoNavContentBgSize = function() {
    Fai.top.Fai.removeCtrlStyleCssList("stylenav", "nav", [{
        cls: ".navContent",
        key: "background-size"
    },
    {
        cls: ".navLeft",
        key: "background-size"
    },
    {
        cls: ".navCenterContent",
        key: "background-size"
    },
    {
        cls: ".navRight",
        key: "background-size"
    }])
};
Site.autoNavItemBgSize = function() {
    Fai.top.Fai.removeCtrlStyleCssList("stylenav", "nav", [{
        cls: ".item",
        key: "background-size"
    }])
};
Site.autoNavItemCenterBgSize = function() {
    Fai.top.Fai.removeCtrlStyleCssList("stylenav", "nav", [{
        cls: ".item .itemLeft",
        key: "background-size"
    },
    {
        cls: ".item .itemCenter",
        key: "background-size"
    },
    {
        cls: ".item .itemRight",
        key: "background-size"
    }])
};
Site.autoNavItemSepBgPosition = function() {
    Fai.top.Fai.removeCtrlStyleCssList("stylenav", "nav", [{
        cls: ".itemSep",
        key: "background-position"
    },
    ])
};
Site.hideNavItemBg = function() {
    Fai.top.Fai.setCtrlStyleCssList("stylenav", "nav", [{
        cls: ".item",
        key: "background",
        value: "none"
    },
    {
        cls: ".item .itemLeft",
        key: "background",
        value: "none"
    },
    {
        cls: ".item .itemCenter",
        key: "background",
        value: "none"
    },
    {
        cls: ".item .itemRight",
        key: "background",
        value: "none"
    }])
};
Site.autoNavItemBg = function() {
    Fai.top.Fai.removeCtrlStyleCssList("stylenav", "nav", [{
        cls: ".item",
        key: "background"
    },
    {
        cls: ".item",
        key: "background-size"
    },
    {
        cls: ".item .itemLeft",
        key: "background"
    },
    {
        cls: ".item .itemCenter",
        key: "background"
    },
    {
        cls: ".item .itemRight",
        key: "background"
    }])
};
Site.setNavItemHoverBg = function(a) {
    Fai.top.Fai.setCtrlStyleCssList("stylenav", "nav", [{
        cls: ".itemSelected",
        key: "background",
        value: a + "!important"
    },
    {
        cls: ".itemHover",
        key: "background",
        value: a + "!important"
    }]);
    if (Fai.top._navStyleData.nihb.r == 4) {
        Fai.top.Fai.setCtrlStyleCssList("stylenav", "nav", [{
            cls: ".itemSelected",
            key: "background-size",
            value: "100% 100% !important"
        },
        {
            cls: ".itemHover",
            key: "background-size",
            value: "100% 100% !important"
        }])
    } else {
        if (Fai.top._navStyleData.nihb.r == 5) {
            Fai.top.Fai.setCtrlStyleCssList("stylenav", "nav", [{
                cls: ".itemSelected",
                key: "background-size",
                value: "100% !important"
            },
            {
                cls: ".itemHover",
                key: "background-size",
                value: "100% !important"
            }])
        }
    }
};
Site.hideNavItemHoverBg = function() {
    Fai.top.Fai.setCtrlStyleCssList("stylenav", "nav", [{
        cls: ".itemSelected",
        key: "background",
        value: "none!important"
    },
    {
        cls: ".itemSelected .itemLeft",
        key: "background",
        value: "none!important"
    },
    {
        cls: ".itemSelected .itemCenter",
        key: "background",
        value: "none!important"
    },
    {
        cls: ".itemSelected .itemRight",
        key: "background",
        value: "none!important"
    },
    {
        cls: ".itemSelected .itemCenter a",
        key: "background",
        value: "none!important"
    },
    {
        cls: ".itemHover",
        key: "background",
        value: "none!important"
    },
    {
        cls: ".itemHover .itemLeft",
        key: "background",
        value: "none!important"
    },
    {
        cls: ".itemHover .itemCenter",
        key: "background",
        value: "none!important"
    },
    {
        cls: ".itemHover .itemCenter a",
        key: "background",
        value: "none!important"
    },
    {
        cls: ".itemHover .itemRight",
        key: "background",
        value: "none!important"
    }])
};
Site.autoNavItemHoverBg = function() {
    Fai.top.Fai.removeCtrlStyleCssList("stylenav", "nav", [{
        cls: ".itemSelected",
        key: "background"
    },
    {
        cls: ".itemSelected",
        key: "background-size"
    },
    {
        cls: ".itemSelected .itemLeft",
        key: "background"
    },
    {
        cls: ".itemSelected .itemCenter",
        key: "background"
    },
    {
        cls: ".itemSelected .itemRight",
        key: "background"
    },
    {
        cls: ".itemSelected .itemCenter a",
        key: "background"
    },
    {
        cls: ".itemHover",
        key: "background"
    },
    {
        cls: ".itemHover",
        key: "background-size"
    },
    {
        cls: ".itemHover .itemLeft",
        key: "background"
    },
    {
        cls: ".itemHover .itemCenter",
        key: "background"
    },
    {
        cls: ".itemHover .itemRight",
        key: "background"
    },
    {
        cls: ".item .itemLeft",
        key: "background"
    },
    {
        cls: ".item .itemCenter",
        key: "background"
    },
    {
        cls: ".item .itemRight",
        key: "background"
    }])
};
Site.autoNavItemWidth = function() {
    Fai.top.Fai.removeCtrlStyleCssList("stylenav", "nav", [{
        cls: ".item",
        key: "width"
    },
    {
        cls: ".item a",
        key: "margin-left"
    },
    {
        cls: ".item a",
        key: "margin-right"
    },
    {
        cls: ".item a",
        key: "padding-left"
    },
    {
        cls: ".item a",
        key: "padding-right"
    }])
};
Site.autoNavItemHeight = function() {
    Fai.top.Fai.removeCtrlStyleCssList("stylenav", "nav", [{
        cls: ".item",
        key: "height"
    },
    {
        cls: ".item a",
        key: "margin-top"
    },
    {
        cls: ".item a",
        key: "margin-bottom"
    },
    {
        cls: ".item a",
        key: "padding-top"
    },
    {
        cls: ".item a",
        key: "padding-bottom"
    }])
};
Site.setNavItemWidth = function(a) {
    Fai.top.Fai.setCtrlStyleCssList("stylenav", "nav", [{
        cls: ".item",
        key: "width",
        value: a + "px"
    },
    {
        cls: ".item a",
        key: "margin-left",
        value: "0"
    },
    {
        cls: ".item a",
        key: "margin-right",
        value: "0"
    },
    {
        cls: ".item a",
        key: "padding-left",
        value: "0"
    },
    {
        cls: ".item a",
        key: "padding-right",
        value: "0"
    }])
};
Site.setNavItemHeight = function(a) {
    Fai.top.Fai.setCtrlStyleCssList("stylenav", "nav", [{
        cls: ".item",
        key: "height",
        value: a + "px"
    },
    {
        cls: ".item a",
        key: "margin-top",
        value: "0"
    },
    {
        cls: ".item a",
        key: "margin-bottom",
        value: "0"
    },
    {
        cls: ".item a",
        key: "padding-top",
        value: "0"
    },
    {
        cls: ".item a",
        key: "padding-bottom",
        value: "0"
    }]);
    Site.setNavItemBgSize();
    Site.setNavItemCenterBgSize();
    Site.setNavItemSepBgPosition()
};
Site.autoNavGeneralText = function() {
    Fai.top.Fai.removeCtrlStyleCssList("stylenav", "nav", [{
        cls: "a",
        key: "font-size"
    },
    {
        cls: "a",
        key: "font-weight"
    },
    {
        cls: "a",
        key: "font-family"
    },
    {
        cls: "a",
        key: "color"
    },
    {
        cls: "a",
        key: "text-decoration"
    },
    {
        cls: "a",
        key: "text-shadow"
    },
    {
        cls: "a",
        key: "-webkit-text-shadow"
    },
    {
        cls: "a",
        key: "-o-text-shadow"
    },
    {
        cls: "a",
        key: "-ms-text-shadow"
    },
    {
        cls: "a",
        key: "-moz-text-shadow"
    }])
};
Site.setNavGeneralText = function(a) {
    Fai.top.Fai.setCtrlStyleCssList("stylenav", "nav", a)
};
Site.autoNavHoverText = function() {
    Fai.top.Fai.removeCtrlStyleCssList("stylenav", "nav", [{
        cls: ".itemHover a",
        key: "font-size"
    },
    {
        cls: ".itemHover a",
        key: "font-weight"
    },
    {
        cls: ".itemHover a",
        key: "font-family"
    },
    {
        cls: ".itemHover a",
        key: "color"
    },
    {
        cls: ".itemHover a",
        key: "text-decoration"
    }]);
    Fai.top.Fai.removeCtrlStyleCssList("stylenav", "nav", [{
        cls: ".itemSelected a",
        key: "font-size"
    },
    {
        cls: ".itemSelected a",
        key: "font-weight"
    },
    {
        cls: ".itemSelected a",
        key: "font-family"
    },
    {
        cls: ".itemSelected a",
        key: "color"
    },
    {
        cls: ".itemSelected a",
        key: "text-decoration"
    }])
};
Site.autoNavItemSpacingWidth = function() {
    Fai.top.Fai.removeCtrlStyleCssList("stylenav", "nav", [{
        cls: ".itemSep",
        key: "width"
    },
    {
        cls: ".itemSep",
        key: "display"
    }])
};
Site.setNavItemSpacingWidth = function(a) {
    Fai.top.Fai.setCtrlStyleCssList("stylenav", "nav", [{
        cls: ".itemSep",
        key: "width",
        value: a + "px"
    },
    {
        cls: ".itemSep",
        key: "display",
        value: "inline"
    }])
};
Site.hideNavItemSpacingWidthAndHeight = function() {
    Fai.top.Fai.setCtrlStyleCssList("stylenav", "nav", [{
        cls: ".itemSep",
        key: "display",
        value: "none"
    }])
};
Site.autoNavItemSpacingHeight = function() {
    Fai.top.Fai.removeCtrlStyleCssList("stylenav", "nav", [{
        cls: ".itemSep",
        key: "height"
    },
    {
        cls: ".itemSep",
        key: "margin-top"
    }])
};
Site.setNavItemSpacingHeight = function(a) {
    Fai.top.Fai.setCtrlStyleCssList("stylenav", "nav", [{
        cls: ".itemSep",
        key: "height",
        value: a + "px"
    }]);
    Site.setNavItemSepBgPosition()
};
Site.setNavItemSpacingBg = function(a) {
    Fai.top.Fai.setCtrlStyleCssList("stylenav", "nav", [{
        cls: ".itemSep",
        key: "background",
        value: a
    }]);
    if (Fai.top._navStyleData.nisb.r == 4) {
        Fai.top.Fai.setCtrlStyleCss("stylenav", "nav", ".itemSep", "background-size", "100% 100%")
    } else {
        if (Fai.top._navStyleData.nisb.r == 5) {
            Fai.top.Fai.setCtrlStyleCss("stylenav", "nav", ".itemSep", "background-size", "100%")
        }
    }
};
Site.hideNavItemSpacingBg = function() {
    Fai.top.Fai.setCtrlStyleCssList("stylenav", "nav", [{
        cls: ".itemSep",
        key: "background",
        value: "none"
    }])
};
Site.autoNavItemSpacingBg = function() {
    Fai.top.Fai.removeCtrlStyleCssList("stylenav", "nav", [{
        cls: ".itemSep",
        key: "background"
    },
    {
        cls: ".itemSep",
        key: "background-size"
    }])
};
Site.autoNavSecItemWidth = function() {
    Fai.top.Fai.removeCtrlStyleCssList("stylenav", "", [{
        cls: ".navSubMenu .item",
        key: "width"
    },
    {
        cls: ".navSubMenu .item a",
        key: "padding"
    },
    {
        cls: ".navSubMenu .item a",
        key: "width"
    },
    {
        cls: ".navSubMenu .item a",
        key: "text-align"
    }])
};
Site.autoNavSecItemHeight = function() {
    Fai.top.Fai.removeCtrlStyleCssList("stylenav", "", [{
        cls: ".navSubMenu .item",
        key: "height"
    },
    {
        cls: ".navSubMenu .item a",
        key: "height"
    },
    {
        cls: ".navSubMenu .item a",
        key: "line-height"
    }])
};
Site.setNavSecItemWidth = function(a) {
    Fai.top.Fai.setCtrlStyleCssList("stylenav", "", [{
        cls: ".navSubMenu .item",
        key: "width",
        value: a + "px !important"
    },
    {
        cls: ".navSubMenu .item a",
        key: "padding",
        value: "0 !important"
    },
    {
        cls: ".navSubMenu .item a",
        key: "width",
        value: a + "px  !important"
    }])
};
Site.setNavSecItemHeight = function(a) {
    Fai.top.Fai.setCtrlStyleCssList("stylenav", "", [{
        cls: ".navSubMenu .item",
        key: "height",
        value: a + "px !important"
    },
    {
        cls: ".navSubMenu .item a",
        key: "height",
        value: a + "px !important"
    },
    {
        cls: ".navSubMenu .item a",
        key: "line-height",
        value: a + "px !important"
    }])
};
Site.hideNavSecItemBg = function() {
    Fai.top.Fai.setCtrlStyleCssList("stylenav", "", [{
        cls: ".navSubMenu .item",
        key: "background",
        value: "none !important"
    },
    {
        cls: ".navSubMenu .item .itemLeft",
        key: "background",
        value: "none !important"
    },
    {
        cls: ".navSubMenu .item .itemCenter",
        key: "background",
        value: "none !important"
    },
    {
        cls: ".navSubMenu .item .itemRight",
        key: "background",
        value: "none !important"
    },
    {
        cls: ".navSubMenu ",
        key: "background",
        value: "none !important"
    },
    {
        cls: ".navSubMenu .content",
        key: "background",
        value: "none !important"
    },
    {
        cls: ".navSubMenu .content .top",
        key: "background",
        value: "none !important"
    },
    {
        cls: ".navSubMenu .content .middle",
        key: "background",
        value: "none !important"
    },
    {
        cls: ".navSubMenu .content .middle .left",
        key: "background",
        value: "none !important"
    },
    {
        cls: ".navSubMenu .content .middle .center",
        key: "background",
        value: "none !important"
    },
    {
        cls: ".navSubMenu .content .middle .right",
        key: "background",
        value: "none !important"
    },
    {
        cls: ".navSubMenu .content .bottom",
        key: "background",
        value: "none !important"
    }])
};
Site.autoNavSecItemBg = function() {
    Fai.top.Fai.removeCtrlStyleCssList("stylenav", "", [{
        cls: ".navSubMenu .item",
        key: "background"
    },
    {
        cls: ".navSubMenu .item",
        key: "background-size"
    },
    {
        cls: ".navSubMenu .item",
        key: "border"
    },
    {
        cls: ".navSubMenu .item .itemLeft",
        key: "background"
    },
    {
        cls: ".navSubMenu .item .itemCenter",
        key: "background"
    },
    {
        cls: ".navSubMenu .item .itemRight",
        key: "background"
    },
    {
        cls: ".navSubMenu ",
        key: "border"
    },
    {
        cls: ".navSubMenu .content",
        key: "border"
    },
    {
        cls: ".navSubMenu ",
        key: "background"
    },
    {
        cls: ".navSubMenu .content",
        key: "background"
    },
    {
        cls: ".navSubMenu .content .top",
        key: "background"
    },
    {
        cls: ".navSubMenu .content .middle",
        key: "background"
    },
    {
        cls: ".navSubMenu .content .middle",
        key: "border"
    },
    {
        cls: ".navSubMenu .content .middle .left",
        key: "background"
    },
    {
        cls: ".navSubMenu .content .middle .center",
        key: "background"
    },
    {
        cls: ".navSubMenu .content .middle .center",
        key: "border"
    },
    {
        cls: ".navSubMenu .content .middle .right",
        key: "background"
    },
    {
        cls: ".navSubMenu .content .bottom",
        key: "background"
    },
    {
        cls: ".navSubMenu .content .top",
        key: "display"
    },
    {
        cls: ".navSubMenu .content .bottom",
        key: "display"
    }])
};
Site.setNavSecItemBg = function(b) {
    var a = {
        rev: true
    };
    Fai.top.Fai.setCtrlStyleCssList("stylenav", "", [{
        cls: ".navSubMenu .item",
        key: "background",
        value: b + "!important"
    },
    {
        cls: ".navSubMenu .item",
        key: "border",
        value: "none !important"
    },
    {
        cls: ".navSubMenu .item .itemLeft",
        key: "background",
        value: "none !important"
    },
    {
        cls: ".navSubMenu .item .itemCenter",
        key: "background",
        value: "none !important"
    },
    {
        cls: ".navSubMenu .item .itemRight",
        key: "background",
        value: "none !important"
    },
    {
        cls: ".navSubMenu ",
        key: "border",
        value: "none !important"
    },
    {
        cls: ".navSubMenu .content",
        key: "border",
        value: "none !important"
    },
    {
        cls: ".navSubMenu ",
        key: "background",
        value: "none !important"
    },
    {
        cls: ".navSubMenu .content",
        key: "background",
        value: "none !important"
    },
    {
        cls: ".navSubMenu .content .middle",
        key: "background",
        value: "none !important"
    },
    {
        cls: ".navSubMenu .content .middle",
        key: "border",
        value: "none !important"
    },
    {
        cls: ".navSubMenu .content .middle .left",
        key: "background",
        value: "none !important"
    },
    {
        cls: ".navSubMenu .content .middle .center",
        key: "background",
        value: "none !important"
    },
    {
        cls: ".navSubMenu .content .middle .center",
        key: "border",
        value: "none !important"
    },
    {
        cls: ".navSubMenu .content .middle .right",
        key: "background",
        value: "none !important"
    },
    {
        cls: ".navSubMenu .content .top",
        key: "display",
        value: "none !important"
    },
    {
        cls: ".navSubMenu .content .bottom",
        key: "display",
        value: "none !important"
    }], a);
    if (Fai.top._navStyleData.nsib.r == 4) {
        Fai.top.Fai.setCtrlStyleCss("stylenav", "", ".navSubMenu .item", "background-size", "100% 100% !important")
    } else {
        if (Fai.top._navStyleData.nsib.r == 5) {
            Fai.top.Fai.setCtrlStyleCss("stylenav", "", ".navSubMenu .item", "background-size", "100% !important")
        }
    }
};
Site.setNavSecItemHoverBg = function(a) {
    Fai.top.Fai.setCtrlStyleCssList("stylenav", "", [{
        cls: ".navSubMenu .center .itemHover",
        key: "background",
        value: a + " !important"
    }]);
    if (Fai.top._navStyleData.nsihb.r == 4) {
        Fai.top.Fai.setCtrlStyleCss("stylenav", "", ".navSubMenu .center .itemHover", "background-size", "100% 100% !important")
    } else {
        if (Fai.top._navStyleData.nsihb.r == 5) {
            Fai.top.Fai.setCtrlStyleCss("stylenav", "", ".navSubMenu .center .itemHover", "background-size", "100% !important")
        }
    }
};
Site.hideNavSecItemHoverBg = function() {
    Fai.top.Fai.setCtrlStyleCssList("stylenav", "", [{
        cls: ".navSubMenu .center .itemHover",
        key: "background",
        value: "none !important"
    },
    {
        cls: ".navSubMenu .itemHover .itemLeft",
        key: "background",
        value: "none !important"
    },
    {
        cls: ".navSubMenu .itemHover .itemCenter",
        key: "background",
        value: "none !important"
    },
    {
        cls: ".navSubMenu .itemHover .itemRight",
        key: "background",
        value: "none !important"
    }])
};
Site.autoNavSecItemHoverBg = function() {
    Fai.top.Fai.removeCtrlStyleCssList("stylenav", "", [{
        cls: ".navSubMenu .center .itemHover",
        key: "background"
    },
    {
        cls: ".navSubMenu .center .itemHover",
        key: "background-size"
    },
    {
        cls: ".navSubMenu .itemHover .itemLeft",
        key: "background"
    },
    {
        cls: ".navSubMenu .itemHover .itemCenter",
        key: "background"
    },
    {
        cls: ".navSubMenu .itemHover .itemRight",
        key: "background"
    }])
};
Site.setNavSecItemGeneralText = function(a) {
    Fai.top.Fai.setCtrlStyleCssList("stylenav", "", a)
};
Site.autoNavSecItemGeneralText = function() {
    Fai.top.Fai.removeCtrlStyleCssList("stylenav", "", [{
        cls: ".navSubMenu .item a",
        key: "font-size"
    },
    {
        cls: ".navSubMenu .item a",
        key: "font-weight"
    },
    {
        cls: ".navSubMenu .item a",
        key: "font-family"
    },
    {
        cls: ".navSubMenu .item a",
        key: "color"
    },
    {
        cls: ".navSubMenu .item a",
        key: "text-decoration"
    }])
};
Site.autoNavSecItemHoverText = function() {
    Fai.top.Fai.removeCtrlStyleCssList("stylenav", "", [{
        cls: ".navSubMenu .itemHover a",
        key: "font-size"
    },
    {
        cls: ".navSubMenu .itemHover a",
        key: "font-weight"
    },
    {
        cls: ".navSubMenu .itemHover a",
        key: "font-family"
    },
    {
        cls: ".navSubMenu .itemHover a",
        key: "color"
    },
    {
        cls: ".navSubMenu .itemHover a",
        key: "text-decoration"
    }])
};
Site.autoNavSecItemOpacity = function(b, a) {
    Fai.top.Fai.removeCtrlStyleCssList("stylenav", "", [{
        cls: ".g_menu.navSubMenu",
        key: "opacity"
    },
    {
        cls: ".g_menu.navSubMenu",
        key: "filter"
    }])
};
Site.setNavSecItemOpacity = function(b, a) {
    Fai.top.Fai.setCtrlStyleCssList("stylenav", "", [{
        cls: ".navSubMenu .g_menu",
        key: "opacity",
        value: b + " !important"
    },
    {
        cls: ".navSubMenu .g_menu",
        key: "filter",
        value: "alpha(opacity=" + a + ") !important"
    }])
};
Site.resetNavStyleDefault = function(a) {
    if (Fai.top._navPositionFixTop) {
        Fai.top.$("#g_main").off("scroll.nav");
        Fai.top.$(window).off("resize.nav")
    }
    top._navStyleData.gt.y = 0;
    top._navStyleData.ht.y = 0;
    top._navStyleData.ns.w = -1;
    top._navStyleData.ns.h = -1;
    top._navStyleData.ncp.type = false;
    top._navStyleData.ncp.y = 0;
    top._navStyleData.nb.y = 0;
    top._navStyleData.cs.w = -1;
    top._navStyleData.cs.h = -1;
    top._navStyleData.cp.type = false;
    top._navStyleData.cp.y = 0;
    top._navStyleData.cb.y = 0;
    top._navStyleData.nis.w = -1;
    top._navStyleData.nis.h = -1;
    top._navStyleData.nib.y = 0;
    top._navStyleData.nihb.y = 0;
    top._navStyleData.niss.w = -1;
    top._navStyleData.niss.h = -1;
    top._navStyleData.nisb.y = 0;
    top._navStyleData.nsigt.y = 0;
    top._navStyleData.nsiht.y = 0;
    top._navStyleData.nsis.w = -1;
    top._navStyleData.nsis.h = -1;
    top._navStyleData.nsib.y = 0;
    top._navStyleData.nsihb.y = 0;
    top._navStyleData.nsiho = 0;
    top._navStyleData.nmove = 0;
    Fai.top._navPositionFixTop = false;
    top._navStyleData.ncp.f = false;
    top.$("#nav").removeClass("navStyle" + top._navStyleData.s);
    top.$("#nav").removeClass("navStyle");
    top.$("#nav").removeClass("navfixtop");
    top._navStyleData.s = 0;
    top._navItemOnCkOpen = false;
    Site.autoNavWidth();
    Site.autoNavHeight();
    Site.autoContentWidth();
    Site.autoContentHeight();
    Site.autoNavBg();
    Site.autoNavContentBg();
    Site.autoNavCntPosition();
    Site.autoContentCntPosition();
    Site.autoNavItemBg();
    Site.autoNavItemHoverBg();
    Site.autoNavItemWidth();
    Site.autoNavItemHeight();
    Site.autoNavGeneralText();
    Site.autoNavHoverText();
    Site.autoNavItemSpacingWidth();
    Site.autoNavItemSpacingHeight();
    Site.autoNavItemSpacingBg();
    Site.autoNavSecItemWidth();
    Site.autoNavSecItemHeight();
    Site.autoNavSecItemBg();
    Site.autoNavSecItemHoverBg();
    Site.autoNavSecItemGeneralText();
    Site.autoNavSecItemHoverText();
    Site.autoNavSecItemOpacity();
    top.$("#nav").attr("style", "");
    top.$("#webNav").attr("style", "");
    if (parseInt(top._wideNav) === 1) {
        top.$("#webNav").removeClass("webNavDefault")
    } else {
        top.$("#webNav").addClass("webNavDefault")
    }
    Fai.top.Fai.removeCtrlStyleCssList("stylenav", "nav", [{
        cls: "",
        key: "display"
    },
    {
        cls: ".navMainContent",
        key: "width"
    },
    {
        cls: ".navMainContent",
        key: "height"
    }]);
    if (a) {
        Site.navAppendToParent(Fai.top._templateLayout)
    } else {
        Site.showNavItemContainer()
    }
    top.$("#nav .nav-resizable-restore").removeClass("ui-icon").hide();
    Fai.top._navStyleChanged++
};
Site.restoreNavStyle = function() {
    top.$("#nav").attr("style", "");
    top.$("#webNav").attr("style", "");
    top.$("#nav .nav-resizable-restore").removeClass("ui-icon").hide();
    top.$("#nav").removeClass("navfixtop");
    if (parseInt(top._wideNav) === 1) {
        top.$("#webNav").removeClass("webNavDefault")
    } else {
        top.$("#webNav").addClass("webNavDefault")
    }
    Fai.top.Fai.removeCtrlStyleCssList("stylenav", "nav", [{
        cls: ".navMainContent",
        key: "width"
    },
    {
        cls: ".navMainContent",
        key: "height"
    },
    {
        cls: ".navLeft",
        key: "height"
    },
    {
        cls: ".navCenterContent",
        key: "height"
    },
    {
        cls: ".navRight",
        key: "height"
    }]);
    top._navStyleData.ns.h = -1;
    top._navStyleData.cs.h = -1;
    top._navStyleData.ns.w = -1;
    top._navStyleData.cs.w = -1;
    top._navStyleData.ncp.y = 0;
    top._navStyleData.nmove = 0;
    top._navStyleData.nis.h = -1;
    _navHeightChange = true;
    Site.autoNavWidth();
    Site.autoNavHeight();
    Site.autoContentWidth();
    Site.autoContentHeight();
    Site.autoNavCntPosition();
    Site.autoNavItemHeight();
    Site.autoNavItemSpacingHeight();
    Site.autoNavBgSize();
    Site.autoNavContentBgSize();
    Site.autoNavItemBgSize();
    Site.autoNavItemCenterBgSize();
    Site.initTemplateLayout(Fai.top._templateLayout);
    Site.absoluteNavDraggableAndResize(Fai.top._templateLayout);
    top._navStyleData.ncp.l = top.$("#nav").position().left || 0;
    top._navStyleData.ncp.t = top.$("#nav").position().top || 0;
    if (Fai.top._navPositionFixTop) {
        Site.onManageFixTop()
    }
    Site.styleChanged();
    Fai.top._navStyleChanged++;
    Site.setRefreshInfo("moduleSetting", true)
};
Site.showNavRestoreIcon = function() {
    var a = top.$("#nav .nav-resizable-restore");
    if (!a.hasClass("ui-icon")) {
        a.addClass("ui-icon")
    }
};
Site.onManageFixTop = function(s) {
    if (Fai.top._navHidden || !Fai.top._navStyleData.no) {
        return
    }
    Fai.top._navStyleData.ncp.f = true;
    var f = false,
    k = false,
    o, c, r = Fai.top.$(window),
    l = Fai.top.$("#nav"),
    p = Fai.top.$("#g_main"),
    v = Fai.top.$("#web"),
    g = Fai.top.$("#webNav"),
    m = Fai.top.$(".floatLeftTop"),
    a = Fai.top.$(".webNavTable"),
    e = Fai.top.$(".webHeaderTable"),
    h = Fai.top.$(".webBannerTable"),
    j = Fai.top.$("#webBanner"),
    b = Fai.top.$("#webHeader"),
    g = Fai.top.$("#webNav"),
    d = l.parent(),
    n,
    t = l.offset().top - g.offset().top,
    i = parseInt(l.css("left").replace("px", "")),
    q = l.position().top,
    u = d.offset().left - l.offset().left;
    Fai.top._navStyleData.ncp.t = q;
    if (l.width() == v.width()) {
        f = true;
        o = "100%"
    } else {
        o = l.width() + "px"
    }
    p.off("scroll.nav");
    p.on("scroll.nav",
    function() {
        var y = l.width(),
        z = l.css("left"),
        A = m.offset().top,
        x = l.offset().top,
        w = l.offset().left;
        c = Site.getNavInClientPosition(l).left;
        if (!k && x < A) {
            k = true;
            l.css({
                left: c + "px",
                top: A + "px",
                width: o,
                position: "fixed"
            });
            if (f && v.width() > Fai.top.$(window).width()) {
                l.css("width", v.width() + "px");
                l.css("left", w + "px")
            } else {
                if (f) {
                    l.css("marginLeft", "-8px")
                }
            }
            l.addClass("navfixtop");
            if (a.find("#nav").length > 0) {
                n = a
            } else {
                if (e.find("#nav").length > 0) {
                    n = e
                } else {
                    if (h.find("#nav").length > 0) {
                        n = h
                    }
                }
            }
            n.css({
                zIndex: "30",
                position: "relative"
            });
            j.addClass("fix-zIndex");
            b.addClass("fix-zIndex");
            g.addClass("fix-zIndex")
        }
        if (k && A - g.offset().top <= t && l.hasClass("navfixtop")) {
            if (Fai.top._navStyleData.ncp.y == 0) {
                l.removeClass("navfixtop");
                l.css({
                    left: "",
                    top: "",
                    width: "",
                    position: ""
                })
            } else {
                l.removeClass("navfixtop");
                l.css({
                    left: i + "px",
                    top: q + "px",
                    width: o,
                    position: "absolute"
                })
            }
            if (f) {
                l.css("marginLeft", "")
            }
            n.css("zIndex", "");
            j.removeClass("fix-zIndex");
            b.removeClass("fix-zIndex");
            g.removeClass("fix-zIndex");
            k = false
        }
    });
    r.off("resize.nav");
    r.on("resize.nav",
    function() {
        var x;
        var w = Fai.top.$(window).width();
        if (l.hasClass("navfixtop") && f) {
            if (v.width() < w) {
                setTimeout(function() {
                    l.css("width", "100%")
                },
                0)
            } else {
                if (v.width() > w) {
                    setTimeout(function() {
                        l.css("width", v.width() + "px")
                    },
                    0)
                }
            }
        }
        if (l.hasClass("navfixtop") && !f) {
            setTimeout(function() {
                x = d.offset().left;
                l.css("left", (x - u) + "px")
            },
            0)
        }
    })
};
Site.refreshNavFixtop = function() {
    if (!Fai.top.$("#nav").hasClass("navfixtop")) {
        return
    }
    var b = Fai.top.$("#nav"),
    a = Fai.top.$(".floatLeftTop").offset().top;
    b.css({
        top: a + "px"
    })
};
Site.absoluteNavDraggableAndResize = function(i, l) {
    var g;
    var a = Fai.top.$("#nav"),
    i = parseInt(i),
    e = "",
    f = false;
    a.draggable("destroy");
    a.resizable("destroy");
    if (!Fai.top._designAuth) {
        return
    }
    if (i === 4) {
        return
    }
    if (l === true || (parseInt(Fai.top._wideNav) === 1 && Fai.top._navStyleData.ns.w < 0)) {
        e = "y"
    }
    a.draggable({
        beforeStart: function() {
            var n;
            Site.navAppendToWebNav(a);
            if (Fai.top._navStyleData.ncp.f && a.hasClass("navfixtop")) {
                var o;
                o = Fai.top.$(".floatLeftTop").offset().top - Fai.top.$("#webNav").offset().top;
                n = a.offset().left - a.parent().offset().left;
                a.removeClass("navfixtop");
                a.css({
                    position: "",
                    top: o + "px",
                    left: top._navStyleData.ncp.l + "px"
                })
            }
        },
        drag: function(n, o) {},
        axis: e,
        handle: ".faiDraggableHandle",
        start: function(n, o) {
            Site.removeEditLayer("nav");
            f = true
        },
        stop: function(n, s) {
            var r = s.position.left,
            p = s.position.top,
            q = s.offset.top,
            t = s.offset.left,
            u = $(this).outerWidth(),
            v = Fai.top.$("#g_main").offset().top,
            o = Fai.top.$("#webNav");
            if (q < v) {
                p = p - q + v;
                $(this).offset({
                    top: v
                })
            }
            if (t < 0) {
                r = r - t;
                $(this).offset({
                    left: 0
                })
            }
            p = o.position().top + p;
            if (Fai.top._navStyleData.ncp.f) {
                a.css("position", "");
                Fai.top.$("#nav").removeClass("navfixtop");
                Site.onManageFixTop()
            }
            Fai.top.$("#webBanner").css("z-index", "0");
            top._navStyleData.ncp.l = r;
            top._navStyleData.ncp.t = p;
            top._navStyleData.ncp.y = 1;
            top._navStyleData.nmove = 1;
            Fai.top._navStyleChanged++;
            Site.styleChanged();
            Site.logDog(100083, 0);
            Site.setRefreshInfo("moduleDrag", true)
        }
    });
    var m = 0,
    b = 0;
    var d = {};
    if (l === true) {
        var k = Fai.top.$("#webNav").width();
        d.minWidth = k;
        d.maxWidth = k
    }
    var j = false,
    h, c = false;
    a.resizable($.extend(d, {
        create: function() {},
        start: function(n, o) {
            h = Fai.top.$(".floatLeftTop").offset().top - Fai.top.$("#webNav").offset().top;
            b = o.size.height,
            m = o.size.width,
            f = true;
            Site.navAppendToWebNav(a);
            g = $("#dockTip").show();
            if (Fai.top._navStyleData.ncp.f && a.hasClass("navfixtop")) {
                c = true;
                j = true;
                a.css({
                    top: h + "px",
                    position: "absolute"
                })
            }
        },
        helper: "ui-resizable-helper",
        handles: "n, e, s, w, se, sw",
        resize: function(o, p) {
            var n = $(".ui-resizable-helper");
            if (j && Fai.top._navStyleData.ncp.f) {
                a.css({
                    top: h + "px",
                    left: Fai.top._navStyleData.ncp.l + "px"
                });
                n.css({
                    border: "0"
                })
            }
            g.html("高度:" + n.height() + "<br/>宽度:" + n.width()).css({
                left: o.pageX - 28,
                top: o.pageY + 18
            })
        },
        stop: function(p, q) {
            if (l) {
                a.css("width", "100%")
            }
            var n = q.size.height,
            o = q.size.width;
            if (m != o && !l) {
                Fai.top._navStyleData.ns.w = o;
                Fai.top._navStyleData.cs.w = o;
                Fai.top.Fai.setCtrlStyleCssList("stylenav", "nav", [{
                    cls: ".navMainContent",
                    key: "width",
                    value: "100%"
                },
                {
                    cls: ".navContent",
                    key: "width",
                    value: o + "px"
                }]);
                Site.resizeNavLeft(a);
                Site.logDog(100084, 0)
            }
            if (b != n) {
                Fai.top._navStyleData.ns.h = n;
                Fai.top._navStyleData.cs.h = n;
                Fai.top.Fai.setCtrlStyleCssList("stylenav", "nav", [{
                    cls: ".navMainContent",
                    key: "height",
                    value: "100%"
                },
                {
                    cls: ".navContent",
                    key: "height",
                    value: n + "px"
                },
                {
                    cls: ".navLeft",
                    key: "height",
                    value: n + "px"
                },
                {
                    cls: ".navCenterContent",
                    key: "height",
                    value: n + "px"
                },
                {
                    cls: ".navRight",
                    key: "height",
                    value: n + "px"
                }]);
                top._navHeightChange = true;
                Site.setNavHeight(n);
                Site.setContentHeight(n);
                top._navStyleData.nis.h = n;
                top._navStyleData.niss.h = n;
                Site.setNavItemHeight(n);
                Site.setNavItemSpacingHeight(n);
                Site.logDog(100084, 1)
            }
            if ($(this).css("left") || $(this).css("top")) {
                if (Fai.top._navStyleData.ncp.f && j) {
                    j = false;
                    a.css("top", Fai.top._navStyleData.ncp.t + "px")
                } else {
                    Fai.top._navStyleData.ncp.t = parseInt($(this).css("top").replace("px", ""))
                }
                Fai.top._navStyleData.ncp.l = parseInt($(this).css("left").replace("px", ""));
                Fai.top._navStyleData.ncp.y = 1
            }
            if (Fai.top._navStyleData.ncp.f) {
                a.removeClass("navfixtop");
                Site.onManageFixTop();
                if (c) {
                    Fai.top.$("#g_main").scrollTop(Fai.top.$("#g_main").scrollTop() + 1)
                }
            }
            Site.showNavItemContainer();
            Fai.top._navStyleData.nmove = 1;
            Fai.top._navStyleChanged++;
            Site.styleChanged();
            if (e === "y") {
                Site.absoluteNavDraggableAndResize(i, l)
            }
            g.hide();
            Site.setRefreshInfo("moduleSetting", true)
        }
    }));
    a.find(".ui-resizable-se").addClass("ui-resizable-rightTip").attr("title", "按住鼠标，可随意调整大小。");
    a.find(".ui-resizable-sw").addClass("ui-icon ui-icon-gripsmall-diagonal-ns ui-resizable-leftTip").attr("title", "按住鼠标，可随意调整大小。");
    a.find("> .ui-icon").hide();
    a.find("> .ui-resizable-n").hide();
    a.find("> .ui-resizable-w").hide();
    a.find("> .ui-resizable-s").hide();
    a.find("> .ui-resizable-e").hide()
};
Site.webNavDefault = function() {
    if (parseInt(top._wideNav) === 1 && top._navStyleData.ns.w !== -1) {
        if (!top.$("#webNav").hasClass("webNavDefault")) {
            top.$("#webNav").addClass("webNavDefault");
            return true
        }
    }
    return false
};
Site.removeWebNavDefault = function() {
    if (parseInt(top._wideNav) === 1 && Site.customNavChange() && top.$("#webNav").hasClass("webNavDefault")) {
        top.$("#webNav").removeClass("webNavDefault")
    }
};
Site.customNavChange = function() {
    if (top._navStyleData.ncp.y == 0 && top._navStyleData.ns.w == -1) {
        return true
    }
    return false
};
Site.navAppendToWebNav = function(d) {
    if (Fai.top.$("#webNav .nav").length < 1) {
        var a = Fai.top.$("#webNav"),
        c = parseInt(d.offset().left),
        b = parseInt(d.offset().top);
        d.appendTo(a);
        if (d.css("position") === "relative") {
            d.offset({
                top: b
            })
        } else {
            d.offset({
                left: c,
                top: b
            });
            if (Fai.top._navStyleData.ncp.y === 0) {
                b = b - Fai.top.$("#styleDesign").outerHeight();
                Fai.top._navStyleData.ncp.hl = c;
                Fai.top._navStyleData.ncp.ht = b
            }
        }
    }
};
Site.navWidthAndPositionChange = function() {
    var a = Fai.top.$("#nav");
    Site.navAppendToWebNav(a);
    Site.webNavDefault()
};
Site.resizeNavLeft = function(d) {
    if (top && parseInt(top._wideNav) === 1 && !top.$("#webNav").hasClass("webNavDefault")) {
        if (d.css("left")) {
            var a = parseInt(d.css("left").replace("px", "")),
            e = 960,
            c = document.documentElement ? document.documentElement.clientWidth: document.body.clientWidth,
            b = (c - e) / 2;
            d.css("left", (a - b) + "px");
            Site.webNavDefault()
        }
    }
};
Site.WebNavAppendToNav = function() {
    if (Fai.top.$("#webNav .nav").length === 1) {
        var a = Fai.top.$("#webNav"),
        b = Fai.top.$("#nav");
        b.appendTo(a)
    }
};
Site.autoHeaderTopHeight = function() {
    Fai.top._useTemplateBackground ? Fai.top._headerTopStyle.hts = -1 : Fai.top._customHeaderTopStyle.hts = -1;
    top._headerTopStyleChanged++;
    Fai.top.Fai.removeCtrlStyleCssList("styleHeaderTop", "webHeaderTable", [{
        cls: "",
        key: "display"
    },
    {
        cls: "",
        key: "_display"
    },
    {
        cls: "",
        key: "height"
    },
    {
        cls: ".webHeaderTd",
        key: "height"
    }])
};
Site.setHeaderTopHeight = function(a) {
    Fai.top._useTemplateBackground ? Fai.top._headerTopStyle.hts = parseInt(a) : Fai.top._customHeaderTopStyle.hts = parseInt(a);
    top._headerTopStyleChanged++;
    Fai.top.Fai.setCtrlStyleCssList("styleHeaderTop", "webHeaderTable", [{
        cls: "",
        key: "display",
        value: "table !important"
    },
    {
        cls: "",
        key: "_display",
        value: "block !important"
    },
    {
        cls: "",
        key: "height",
        value: a + "px !important"
    },
    {
        cls: ".webHeaderTd",
        key: "height",
        value: a + "px"
    }])
};
Site.setHeaderBg = function(a) {
    Fai.top.Fai.setCtrlStyleCss("styleHeaderTop", "", ".absTopTable", "height", "0");
    Fai.top.Fai.setCtrlStyleCssList("styleHeaderTop", "webHeaderTable", [{
        cls: "",
        key: "background",
        value: a
    },
    {
        cls: ".webHeaderTd",
        key: "background",
        value: "none"
    },
    {
        cls: ".webHeader",
        key: "background",
        value: "none"
    },
    {
        cls: ".headerCusLeft",
        key: "background",
        value: "none"
    },
    {
        cls: ".headerCusMiddle",
        key: "background",
        value: "none"
    },
    {
        cls: ".headerCusRight",
        key: "background",
        value: "none"
    }]);
    var d = Site.getHeaderStyleData(),
    c = "",
    b = false;
    if (d.r == 4) {
        c = "100% 100%";
        b = true
    } else {
        if (d.r == 5) {
            c = "100%";
            b = true
        }
    }
    if (b) {
        Fai.top.Fai.setCtrlStyleCss("styleHeaderTop", "", "#webHeaderTable", "background-size", c)
    }
};
Site.removeHeaderBg = function() {
    Fai.top._useTemplateBackground ? Fai.top._headerTopStyle.hg.y = 0 : Fai.top._customHeaderTopStyle.hg.y = 0;
    top._headerTopStyleChanged++;
    Fai.top.Fai.removeCtrlStyleCss("styleHeaderTop", "", ".absTopTable", "height");
    Fai.top.Fai.removeCtrlStyleCssList("styleHeaderTop", "webHeaderTable", [{
        cls: "",
        key: "background"
    },
    {
        cls: "",
        key: "background-size"
    },
    {
        cls: ".webHeaderTd",
        key: "background"
    },
    {
        cls: ".webHeader",
        key: "background"
    },
    {
        cls: ".headerCusLeft",
        key: "background"
    },
    {
        cls: ".headerCusMiddle",
        key: "background"
    },
    {
        cls: ".headerCusRight",
        key: "background"
    }])
};
Site.hideHeaderBg = function() {
    Fai.top.Fai.setCtrlStyleCss("styleHeaderTop", "", ".absTopTable", "height", "0");
    Fai.top.Fai.setCtrlStyleCssList("styleHeaderTop", "webHeaderTable", [{
        cls: "",
        key: "background",
        value: "none"
    },
    {
        cls: ".webHeaderTd",
        key: "background",
        value: "none"
    },
    {
        cls: ".webHeader",
        key: "background",
        value: "none"
    },
    {
        cls: ".headerCusLeft",
        key: "background",
        value: "none"
    },
    {
        cls: ".headerCusMiddle",
        key: "background",
        value: "none"
    },
    {
        cls: ".headerCusRight",
        key: "background",
        value: "none"
    }])
};
Site.refreshFooterAlign = function(a) {
    var d = "";
    var c = "";
    var b = "";
    if (a == 1) {
        d = "left";
        c = d;
        b = "left"
    } else {
        if (a == 2) {
            d = "center";
            c = "none";
            b = "none"
        } else {
            if (a == 3) {
                d = "right";
                c = d;
                b = "right"
            }
        }
    }
    Fai.top.Fai.setCtrlStyleCssList("stylefooter", "footer", [{
        cls: ".footerNav",
        key: "text-align",
        value: d
    },
    {
        cls: ".footerInfo",
        key: "text-align",
        value: d
    },
    {
        cls: ".footerInfo",
        key: "float",
        value: b
    },
    {
        cls: ".footerSupport",
        key: "text-align",
        value: d
    },
    {
        cls: ".visitorCounterPosition",
        key: "float",
        value: c
    },
    {
        cls: ".footerItemListContainer",
        key: "text-align",
        value: d
    }])
};
Site.setFooterPadding = function(b, d) {
    var c = Fai.top.$("#footer .footerInfo").find("table"),
    e = c.length;
    if ((b == 1 || b == 3) && (typeof d != "undefined")) {
        var a = "";
        if (b == 1) {
            a = "0 0 0 " + d + "px"
        } else {
            a = "0 " + d + "px 0 0"
        }
        Fai.top.Fai.setCtrlStyleCssList("stylefooter", "footer", [{
            cls: ".footerNav",
            key: "padding",
            value: a
        },
        {
            cls: ".footerInfo",
            key: "padding",
            value: a
        },
        {
            cls: ".footerSupport",
            key: "padding",
            value: a
        },
        {
            cls: ".visitorCounterWrap",
            key: "padding",
            value: a
        }])
    } else {}
};
Site.autoFooterPadding = function() {
    Fai.top.Fai.removeCtrlStyleCssList("stylefooter", "footer", [{
        cls: ".footerContent",
        key: "padding-top"
    },
    {
        cls: ".footerContent",
        key: "padding-bottom"
    },
    {
        cls: ".footerNav",
        key: "padding"
    },
    {
        cls: ".footerInfo",
        key: "padding"
    },
    {
        cls: ".footerSupport",
        key: "padding"
    },
    {
        cls: ".visitorCounterWrap",
        key: "padding"
    }])
};
Site.setFooterNavGeneralText = function(a) {
    var c = "normal";
    var b = "none";
    if (a.gt.w == 1) {
        c = "bolder"
    }
    if (a.gt.d == 1) {
        b = "underline"
    }
    Fai.top.Fai.setCtrlStyleCssList("stylefooter", "footer", [{
        cls: ".footerInfo a",
        key: "font-size",
        value: a.gt.s + "px"
    },
    {
        cls: ".footerInfo a",
        key: "font-family",
        value: a.gt.f
    },
    {
        cls: ".footerInfo a",
        key: "font-weight",
        value: c
    },
    {
        cls: ".footerInfo a",
        key: "text-decoration",
        value: b
    },
    {
        cls: ".footerInfo a",
        key: "color",
        value: a.gt.c
    },
    {
        cls: ".footerSupport a",
        key: "font-size",
        value: a.gt.s + "px"
    },
    {
        cls: ".footerSupport a",
        key: "font-family",
        value: a.gt.f
    },
    {
        cls: ".footerSupport a",
        key: "font-weight",
        value: c
    },
    {
        cls: ".footerSupport a",
        key: "text-decoration",
        value: b
    },
    {
        cls: ".footerSupport a",
        key: "color",
        value: a.gt.c
    }]);
    if (a.fis < 0) {
        Fai.top.Fai.setCtrlStyleCssList("stylefooter", "webFooterTable", [{
            cls: "div.footerItemTop .footerItemTopLink",
            key: "font-size",
            value: a.gt.s + "px"
        },
        {
            cls: "div.footerItemTop .footerItemTopLink",
            key: "font-family",
            value: a.gt.f
        },
        {
            cls: "div.footerItemTop .footerItemTopLink",
            key: "font-weight",
            value: c
        },
        {
            cls: "div.footerItemTop .footerItemTopLink",
            key: "text-decoration",
            value: b
        },
        {
            cls: "div.footerItemTop .footerItemTopLink",
            key: "color",
            value: a.gt.c
        },
        {
            cls: "div.footerItemBottom a",
            key: "font-size",
            value: a.gt.s + "px"
        },
        {
            cls: "div.footerItemBottom a",
            key: "font-family",
            value: a.gt.f
        },
        {
            cls: "div.footerItemBottom a",
            key: "font-weight",
            value: c
        },
        {
            cls: "div.footerItemBottom a",
            key: "text-decoration",
            value: b
        },
        {
            cls: "div.footerItemBottom a",
            key: "color",
            value: a.gt.c
        }]);
        Site.refreshFooterItemSpacing()
    }
};
Site.setRegularText = function(a) {
    Fai.top.Fai.setCtrlStyleCssList("stylefooter", "footer", [{
        cls: ".footerInfo",
        key: "font-size",
        value: a.rt.s + "px"
    },
    {
        cls: ".footerInfo",
        key: "font-family",
        value: a.rt.f
    },
    {
        cls: ".footerInfo",
        key: "color",
        value: a.rt.c
    },
    {
        cls: ".footerSupport",
        key: "font-size",
        value: a.rt.s + "px"
    },
    {
        cls: ".footerSupport",
        key: "font-family",
        value: a.rt.f
    },
    {
        cls: ".footerSupport",
        key: "color",
        value: a.rt.c
    }]);
    if (a.fis < 0) {
        if (a.gt.y != 1) {
            Fai.top.Fai.setCtrlStyleCssList("stylefooter", "webFooterTable", [{
                cls: "div.footerItemTop .footerItemTopLink",
                key: "font-size",
                value: a.rt.s + "px"
            },
            {
                cls: "div.footerItemBottom a",
                key: "font-size",
                value: a.rt.s + "px"
            }])
        }
        Fai.top.Fai.setCtrlStyleCssList("stylefooter", "webFooterTable", [{
            cls: "div.footerVerticalLine",
            key: "background-color",
            value: a.rt.c
        }]);
        Site.refreshFooterItemSpacing()
    }
};
Site.autoRegularText = function() {
    var a = Site.getFooterStyleData();
    Fai.top.Fai.removeCtrlStyleCssList("stylefooter", "footer", [{
        cls: ".footerInfo",
        key: "font-size"
    },
    {
        cls: ".footerInfo",
        key: "font-family"
    },
    {
        cls: ".footerInfo",
        key: "color"
    },
    {
        cls: ".footerSupport",
        key: "font-size"
    },
    {
        cls: ".footerSupport",
        key: "font-family"
    },
    {
        cls: ".footerSupport",
        key: "color"
    }]);
    if (a.fis < 0) {
        if (a.gt.y != 1) {
            Fai.top.Fai.removeCtrlStyleCssList("stylefooter", "webFooterTable", [{
                cls: "div.footerItemTop .footerItemTopLink",
                key: "font-size"
            },
            {
                cls: "div.footerItemBottom a",
                key: "font-size"
            }])
        }
        Fai.top.Fai.removeCtrlStyleCssList("stylefooter", "webFooterTable", [{
            cls: "div.footerVerticalLine",
            key: "background-color"
        }]);
        Site.refreshFooterItemSpacing()
    }
};
Site.setWebFooterHeight = function(a) {
    Fai.top.Fai.setCtrlStyleCss("stylefooter", "webFooterTable", "", "height", a + "px")
};
Site.autoWebFooterHeight = function() {
    Fai.top.Fai.removeCtrlStyleCss("stylefooter", "webFooterTable", "", "height")
};
Site.autoFooterNavGeneralText = function() {
    Fai.top.Fai.removeCtrlStyleCssList("stylefooter", "footer", [{
        cls: ".footerInfo a",
        key: "color"
    },
    {
        cls: ".footerInfo a",
        key: "text-decoration"
    },
    {
        cls: ".footerInfo a",
        key: "font-weight"
    },
    {
        cls: ".footerInfo a:hover",
        key: "color"
    },
    {
        cls: ".footerInfo a",
        key: "font-size"
    },
    {
        cls: ".footerInfo a",
        key: "font-family"
    },
    {
        cls: ".footerSupport a",
        key: "color"
    },
    {
        cls: ".footerSupport a",
        key: "text-decoration"
    },
    {
        cls: ".footerSupport a",
        key: "font-weight"
    },
    {
        cls: ".footerSupport a:hover",
        key: "color"
    },
    {
        cls: ".footerSupport a",
        key: "font-size"
    },
    {
        cls: ".footerSupport a",
        key: "font-family"
    }]);
    var a = Site.getFooterStyleData();
    if (a.fis < 0) {
        if (a.rt.y == 1) {
            Fai.top.Fai.removeCtrlStyleCssList("stylefooter", "webFooterTable", [{
                cls: "div.footerItemTop .footerItemTopLink",
                key: "font-family"
            },
            {
                cls: "div.footerItemTop .footerItemTopLink",
                key: "font-weight"
            },
            {
                cls: "div.footerItemTop .footerItemTopLink",
                key: "text-decoration"
            },
            {
                cls: "div.footerItemTop .footerItemTopLink",
                key: "color"
            },
            {
                cls: "div.footerItemTop a:hover",
                key: "color"
            },
            {
                cls: "div.footerItemBottom a",
                key: "font-family"
            },
            {
                cls: "div.footerItemBottom a",
                key: "font-weight"
            },
            {
                cls: "div.footerItemBottom a",
                key: "text-decoration"
            },
            {
                cls: "div.footerItemBottom a",
                key: "color"
            },
            {
                cls: "div.footerItemBottom a:hover",
                key: "color"
            }]);
            Fai.top.Fai.setCtrlStyleCssList("stylefooter", "webFooterTable", [{
                cls: "div.footerItemTop .footerItemTopLink",
                key: "font-size",
                value: a.rt.s + "px"
            },
            {
                cls: "div.footerItemBottom a",
                key: "font-size",
                value: a.rt.s + "px"
            }])
        } else {
            Fai.top.Fai.removeCtrlStyleCssList("stylefooter", "webFooterTable", [{
                cls: "div.footerItemTop .footerItemTopLink",
                key: "font-size"
            },
            {
                cls: "div.footerItemTop .footerItemTopLink",
                key: "font-family"
            },
            {
                cls: "div.footerItemTop .footerItemTopLink",
                key: "font-weight"
            },
            {
                cls: "div.footerItemTop .footerItemTopLink",
                key: "text-decoration"
            },
            {
                cls: "div.footerItemTop .footerItemTopLink",
                key: "color"
            },
            {
                cls: "div.footerItemTop a:hover",
                key: "color"
            },
            {
                cls: "div.footerItemBottom a",
                key: "font-size"
            },
            {
                cls: "div.footerItemBottom a",
                key: "font-family"
            },
            {
                cls: "div.footerItemBottom a",
                key: "font-weight"
            },
            {
                cls: "div.footerItemBottom a",
                key: "text-decoration"
            },
            {
                cls: "div.footerItemBottom a",
                key: "color"
            },
            {
                cls: "div.footerItemBottom a:hover",
                key: "color"
            }])
        }
        Site.refreshFooterItemSpacing()
    }
};
Site.setFooterNavHoverText = function(a) {
    if (a.fis < 0) {
        Fai.top.Fai.setCtrlStyleCssList("stylefooter", "webFooterTable", [{
            cls: "div.footerItemTop a:hover",
            key: "color",
            value: a.ht.c
        },
        {
            cls: "div.footerItemBottom a:hover",
            key: "color",
            value: a.ht.c
        }])
    }
    Fai.top.Fai.setCtrlStyleCssList("stylefooter", "footer", [{
        cls: ".footerInfo a:hover",
        key: "color",
        value: a.ht.c
    },
    {
        cls: ".footerSupport a:hover",
        key: "color",
        value: a.ht.c
    }])
};
Site.autoFooterNavHoverText = function() {
    var a = Site.getFooterStyleData();
    if (a.fis < 0) {
        Fai.top.Fai.removeCtrlStyleCssList("stylefooter", "webFooterTable", [{
            cls: "div.footerItemTop a:hover",
            key: "color"
        },
        {
            cls: "div.footerItemBottom a:hover",
            key: "color"
        }])
    }
    Fai.top.Fai.removeCtrlStyleCssList("stylefooter", "footer", [{
        cls: ".footerInfo a:hover",
        key: "color"
    },
    {
        cls: ".footerSupport a:hover",
        key: "color"
    }])
};
Site.setFooterBg = function(a) {
    Fai.top.Fai.setCtrlStyleCssList("stylefooter", "webFooterTable", [{
        cls: "",
        key: "background",
        value: a
    },
    {
        cls: ".webFooter",
        key: "background",
        value: "none"
    },
    {
        cls: ".footerTop",
        key: "display",
        value: "none"
    },
    {
        cls: ".footer",
        key: "background",
        value: "none"
    },
    {
        cls: ".footer",
        key: "border-color",
        value: "transparent"
    },
    {
        cls: ".middleLeft",
        key: "display",
        value: "none"
    },
    {
        cls: ".middleCenter",
        key: "background",
        value: "none"
    },
    {
        cls: ".footerContent",
        key: "background",
        value: "none"
    },
    {
        cls: ".footerNav",
        key: "background",
        value: "none"
    },
    {
        cls: ".footerInfo",
        key: "background",
        value: "none"
    },
    {
        cls: ".footerSupport",
        key: "background",
        value: "none"
    },
    {
        cls: ".middleRight",
        key: "display",
        value: "none"
    },
    {
        cls: ".footerBottom",
        key: "display",
        value: "none"
    }]);
    var d = Site.getFooterStyleData(),
    c = "",
    b = false;
    if (d.fb.r == 4) {
        c = "100% 100%";
        b = true
    } else {
        if (d.fb.r == 5) {
            c = "100%";
            b = true
        }
    }
    if (b) {
        Fai.top.Fai.setCtrlStyleCss("stylefooter", "webFooterTable", "", "background-size", c)
    }
};
Site.autoFooterBg = function() {
    Fai.top.Fai.removeCtrlStyleCssList("stylefooter", "webFooterTable", [{
        cls: "",
        key: "background"
    },
    {
        cls: "",
        key: "background-size"
    },
    {
        cls: ".webFooter",
        key: "background"
    },
    {
        cls: ".footerTop",
        key: "display"
    },
    {
        cls: ".footer",
        key: "background"
    },
    {
        cls: ".footer",
        key: "border-color"
    },
    {
        cls: ".middleLeft",
        key: "display"
    },
    {
        cls: ".middleCenter",
        key: "background"
    },
    {
        cls: ".footerContent",
        key: "background"
    },
    {
        cls: ".footerNav",
        key: "background"
    },
    {
        cls: ".footerInfo",
        key: "background"
    },
    {
        cls: ".footerSupport",
        key: "background"
    },
    {
        cls: ".middleRight",
        key: "display"
    },
    {
        cls: ".footerBottom",
        key: "display"
    }])
};
Site.hideFooterBg = function() {
    Fai.top.Fai.setCtrlStyleCssList("stylefooter", "webFooterTable", [{
        cls: "",
        key: "background",
        value: "none"
    },
    {
        cls: ".webFooter",
        key: "background",
        value: "none"
    },
    {
        cls: ".footerTop",
        key: "display",
        value: "none"
    },
    {
        cls: ".footer",
        key: "background",
        value: "none"
    },
    {
        cls: ".footer",
        key: "border-color",
        value: "transparent"
    },
    {
        cls: ".middleLeft",
        key: "display",
        value: "none"
    },
    {
        cls: ".middleCenter",
        key: "background",
        value: "none"
    },
    {
        cls: ".footerContent",
        key: "background",
        value: "none"
    },
    {
        cls: ".footerNav",
        key: "background",
        value: "none"
    },
    {
        cls: ".footerInfo",
        key: "background",
        value: "none"
    },
    {
        cls: ".footerSupport",
        key: "background",
        value: "none"
    },
    {
        cls: ".middleRight",
        key: "display",
        value: "none"
    },
    {
        cls: ".footerBottom",
        key: "display",
        value: "none"
    }])
};
Site.resetFooterStyleDefault = function() {
    var a = Site.getFooterStyleData();
    a.fa = 0;
    a.gt.y = 0;
    a.rt.y = 0;
    a.fb.y = 0;
    a.f.t = 0;
    Site.saveFooterStyleData(a);
    Site.refreshFooterAlign(0);
    Site.autoFooterPadding();
    Site.autoFooterNavGeneralText();
    Site.autoRegularText();
    Site.autoFooterBg()
};
Site.getFooterStyleData = function() {
    return Fai.top._useTemplateBackground ? Fai.top._footerStyleData: Fai.top._customFooterStyleData
};
Site.saveFooterStyleData = function(a) {
    Fai.top._useTemplateBackground ? Fai.top._footerStyleData = a: Fai.top._customFooterStyleData = a
};
Site.normalFooterItemStyle = function(c) {
    var b = Fai.top.$("#footerNav");
    var d = $.trim(b.attr("class"));
    if (!/\bfooterPattern1\b/.test(d)) {
        d = d.replace(/\s*\bfooterPattern[0-9]+\b/g, "").replace(/\bfooterNav\b/, "footerNav footerPattern1");
        b.attr("class", d)
    }
    Site.refreshFooterItemSpacing();
    var a = Site.getFooterStyleData();
    a.fis = parseInt(c);
    Site.saveFooterStyleData(a);
    top._footerStyleChanged++;
    Site.showSectionOfSitePage("foot");
    Site.styleChanged()
};
Site.levelFooterItemStyle = function(c) {
    var b = Fai.top.$("#footerNav");
    var d = $.trim(b.attr("class"));
    if (!/\bfooterPattern2\b/.test(d)) {
        d = d.replace(/\s*\bfooterPattern[0-9]+\b/g, "").replace(/\bfooterNav\b/, "footerNav footerPattern2");
        b.attr("class", d)
    }
    Site.refreshFooterItemSpacing();
    var a = Site.getFooterStyleData();
    a.fis = parseInt(c);
    Site.saveFooterStyleData(a);
    top._footerStyleChanged++;
    Site.showSectionOfSitePage("foot");
    Site.styleChanged()
};
Site.verticalFooterItemStyle = function(c) {
    var b = Fai.top.$("#footerNav");
    var d = $.trim(b.attr("class"));
    if (!/\bfooterPattern3\b/.test(d)) {
        d = d.replace(/\s*\bfooterPattern[0-9]+\b/g, "").replace(/\bfooterNav\b/, "footerNav footerPattern3");
        b.attr("class", d)
    }
    Site.refreshFooterItemSpacing();
    var a = Site.getFooterStyleData();
    a.fis = parseInt(c);
    Site.saveFooterStyleData(a);
    top._footerStyleChanged++;
    Site.showSectionOfSitePage("foot");
    Site.styleChanged()
};
Site.hideFooterVerticalLine = function() {
    Fai.top.Fai.setCtrlStyleCssList("stylefooter", "webFooterTable", [{
        cls: "div.footerVerticalLine",
        key: "display",
        value: "none"
    }])
};
Site.showFooterVerticalLine = function() {
    Fai.top.Fai.setCtrlStyleCssList("stylefooter", "webFooterTable", [{
        cls: "div.footerVerticalLine",
        key: "display",
        value: "block"
    }])
};
Site.autoFooterVerticalLine = function() {
    Fai.top.Fai.removeCtrlStyleCssList("stylefooter", "webFooterTable", [{
        cls: "div.footerVerticalLine",
        key: "display"
    },
    ])
};
Site.hideFooterLevelSplitline = function() {
    Fai.top.Fai.setCtrlStyleCssList("stylefooter", "webFooterTable", [{
        cls: "div.footerItemMiddle",
        key: "display",
        value: "none"
    }]);
    Site.refreshFooterItemSpacing()
};
Site.showFooterLevelSplitline = function() {
    Fai.top.Fai.setCtrlStyleCssList("stylefooter", "webFooterTable", [{
        cls: "div.footerItemMiddle",
        key: "display",
        value: "block"
    }]);
    Site.refreshFooterItemSpacing()
};
Site.autoFooterLevelSplitline = function() {
    Fai.top.Fai.removeCtrlStyleCssList("stylefooter", "webFooterTable", [{
        cls: "div.footerItemMiddle",
        key: "display"
    }]);
    Site.refreshFooterItemSpacing()
};
Site.hideFooterItemPic = function(b) {
    Fai.top.Fai.setCtrlStyleCssList("stylefooter", "webFooterTable", [{
        cls: "div.footerItemPic",
        key: "display",
        value: "none"
    }]);
    Site.refreshFooterItemSpacing();
    var a = Site.getFooterStyleData();
    a.fip = parseInt(b);
    Site.saveFooterStyleData(a);
    top._footerStyleChanged++;
    Site.showSectionOfSitePage("foot");
    Site.styleChanged()
};
Site.showFooterItemPic = function(b) {
    Fai.top.Fai.setCtrlStyleCssList("stylefooter", "webFooterTable", [{
        cls: "div.footerItemPic",
        key: "display",
        value: "block"
    }]);
    Site.refreshFooterItemSpacing();
    var a = Site.getFooterStyleData();
    a.fip = parseInt(b);
    Site.saveFooterStyleData(a);
    top._footerStyleChanged++;
    Site.showSectionOfSitePage("foot");
    Site.styleChanged()
};
Site.autoFooterItemPic = function(b) {
    Fai.top.Fai.removeCtrlStyleCssList("stylefooter", "webFooterTable", [{
        cls: "div.footerItemPic",
        key: "display"
    }]);
    Site.refreshFooterItemSpacing();
    var a = Site.getFooterStyleData();
    a.fip = parseInt(b);
    Site.saveFooterStyleData(a);
    top._footerStyleChanged++;
    Site.showSectionOfSitePage("foot");
    Site.styleChanged()
};
Site.setFooterItemSectionWidth = function(b) {
    Site.showSectionOfSitePage("foot");
    var c = b;
    if (!Fai.isNumber(c)) {
        c = parseInt($("#cusItemWidthNum").val());
        if (!Fai.isNumber(c)) {
            return
        }
    }
    Fai.top.Fai.setCtrlStyleCss("stylefooter", "webFooterTable", "li.footerItemSection", "width", c + "px");
    Site.refreshFooterItemSpacing();
    var a = Site.getFooterStyleData();
    a.fiw = parseInt(c);
    Site.saveFooterStyleData(a);
    top._footerStyleChanged++;
    Site.styleChanged()
};
Site.autoFooterItemSectionWidth = function() {
    Fai.top.Fai.removeCtrlStyleCss("stylefooter", "webFooterTable", "li.footerItemSection", "width");
    Site.refreshFooterItemSpacing();
    var a = Site.getFooterStyleData();
    a.fiw = -1;
    Site.saveFooterStyleData(a);
    top._footerStyleChanged++;
    Site.showSectionOfSitePage("foot");
    Site.styleChanged()
};
Site.setFooterItemSectionHeight = function(c) {
    Site.showSectionOfSitePage("foot");
    var a = c;
    if (!Fai.isNumber(a)) {
        a = parseInt($("#cusItemHeightNum").val());
        if (!Fai.isNumber(a)) {
            return
        }
    }
    Site.changeFooterItemSpacingState(1);
    Fai.top.Fai.setCtrlStyleCssList("stylefooter", "webFooterTable", [{
        cls: "li.footerItemSection",
        key: "height",
        value: a + "px"
    },
    {
        cls: "li.footerItemSpacing",
        key: "height",
        value: a + "px"
    }]);
    var b = Site.getFooterStyleData();
    b.fih = parseInt(a);
    Site.saveFooterStyleData(b);
    top._footerStyleChanged++;
    Site.styleChanged()
};
Site.autoFooterItemSectionHeight = function() {
    Site.changeFooterItemSpacingState(0);
    Fai.top.Fai.removeCtrlStyleCssList("stylefooter", "webFooterTable", [{
        cls: "li.footerItemSection",
        key: "height"
    },
    {
        cls: "li.footerItemSpacing",
        key: "height"
    }]);
    Site.refreshFooterItemSpacing();
    var a = Site.getFooterStyleData();
    a.fih = -1;
    Site.saveFooterStyleData(a);
    top._footerStyleChanged++;
    Site.showSectionOfSitePage("foot");
    Site.styleChanged()
};
Site.setFooterItemSpacing = function(b) {
    var c = b;
    Site.showSectionOfSitePage("foot");
    if (!Fai.isNumber(c)) {
        c = parseInt($("#cusItemSpacingWidth").val());
        if (!Fai.isNumber(c)) {
            return
        }
    }
    Fai.top.Fai.setCtrlStyleCssList("stylefooter", "webFooterTable", [{
        cls: "li.footerItemSpacing",
        key: "padding-left",
        value: (c / 2) + "px"
    },
    {
        cls: "li.footerItemSpacing",
        key: "padding-right",
        value: (c / 2) + "px"
    }]);
    var a = Site.getFooterStyleData();
    a.fisp = parseInt(c);
    Site.saveFooterStyleData(a);
    top._footerStyleChanged++;
    Site.styleChanged()
};
Site.autoFooterItemSpacing = function() {
    Fai.top.Fai.removeCtrlStyleCssList("stylefooter", "webFooterTable", [{
        cls: "li.footerItemSpacing",
        key: "padding-left"
    },
    {
        cls: "li.footerItemSpacing",
        key: "padding-right"
    }]);
    var a = Site.getFooterStyleData();
    a.fisp = -1;
    Site.saveFooterStyleData(a);
    top._footerStyleChanged++;
    Site.showSectionOfSitePage("foot");
    Site.styleChanged()
};
Site.setFooterVerticalLineWidth = function(b) {
    var c = b;
    Site.showSectionOfSitePage("foot");
    if (!Fai.isNumber(c)) {
        c = parseInt($("#cusItemVerticalLineWidth").val());
        if (!Fai.isNumber(c)) {
            return
        }
    }
    Site.showFooterVerticalLine();
    Fai.top.Fai.setCtrlStyleCss("stylefooter", "webFooterTable", "div.footerVerticalLine", "width", c + "px");
    var a = Site.getFooterStyleData();
    a.fiv.w = c;
    Site.saveFooterStyleData(a);
    top._footerStyleChanged++;
    Site.styleChanged()
};
Site.autoFooterVerticalLineWidth = function() {
    Site.autoFooterVerticalLine();
    Fai.top.Fai.removeCtrlStyleCss("stylefooter", "webFooterTable", "div.footerVerticalLine", "width");
    var a = Site.getFooterStyleData();
    a.fiv.w = -1;
    Site.saveFooterStyleData(a);
    top._footerStyleChanged++;
    Site.styleChanged()
};
Site.setFooterVerticalLineColor = function(d) {
    var b = d;
    if (typeof b != "string" || $.trim(b).length < 1) {
        return
    }
    Fai.top.Fai.setCtrlStyleCss("stylefooter", "webFooterTable", "div.footerVerticalLine", "background-color", b);
    var a = Site.getFooterStyleData();
    a.fiv.c = b;
    Site.saveFooterStyleData(a);
    top._footerStyleChanged++;
    Site.styleChanged()
};
Site.autoFooterVerticalLineColor = function() {
    Fai.top.Fai.removeCtrlStyleCss("stylefooter", "webFooterTable", "div.footerVerticalLine", "background-color")
};
Site.autoFooterVerticalLineStyle = function() {
    Fai.top.Fai.removeCtrlStyleCssList("stylefooter", "webFooterTable", [{
        cls: "div.footerVerticalLine",
        key: "background-color"
    },
    {
        cls: "div.footerVerticalLine",
        key: "width"
    }]);
    var a = Site.getFooterStyleData();
    a.fiv.y = 0;
    Site.saveFooterStyleData(a);
    top._footerStyleChanged++;
    Site.showSectionOfSitePage("foot");
    Site.styleChanged()
};
Site.cusFooterVerticalLineStyle = function() {
    var a = Site.getFooterStyleData();
    Fai.top.Fai.setCtrlStyleCssList("stylefooter", "webFooterTable", [{
        cls: "div.footerVerticalLine",
        key: "background-color",
        value: a.fiv.c
    },
    {
        cls: "div.footerVerticalLine",
        key: "width",
        value: a.fiv.w + "px"
    }]);
    var a = Site.getFooterStyleData();
    a.fiv.y = 1;
    Site.saveFooterStyleData(a);
    top._footerStyleChanged++;
    Site.showSectionOfSitePage("foot");
    Site.styleChanged()
};
Site.changeFooterItemSpacingState = function(a) {
    Fai.top.$("#footerNav").attr("cusHeight", a)
};
Site.setFooterFristItemFontSize = function(c) {
    var b = $(c).val();
    Fai.top.Fai.setCtrlStyleCss("stylefooter", "webFooterTable", "div.footerItemTop .footerItemTopLink", "font-size", b + "px");
    var a = Site.getFooterStyleData();
    a.fift.s = parseInt(b);
    Site.saveFooterStyleData(a);
    top._footerStyleChanged++;
    Site.showSectionOfSitePage("foot");
    Site.styleChanged()
};
Site.setFooterFristItemFontWeight = function(d) {
    var c = "normal";
    var a = 0;
    if ($(d).prop("checked")) {
        c = "bold";
        a = 1
    }
    Fai.top.Fai.setCtrlStyleCss("stylefooter", "webFooterTable", "div.footerItemTop .footerItemTopLink", "font-weight", c);
    var b = Site.getFooterStyleData();
    b.fift.w = a;
    Site.saveFooterStyleData(b);
    top._footerStyleChanged++;
    Site.showSectionOfSitePage("foot");
    Site.styleChanged()
};
Site.setFooterFristItemUnderline = function(c) {
    var b = "none";
    var e = 0;
    if ($(c).prop("checked")) {
        b = "underline";
        e = 1
    }
    Fai.top.Fai.setCtrlStyleCss("stylefooter", "webFooterTable", "div.footerItemTop .footerItemTopLink", "text-decoration", b);
    var a = Site.getFooterStyleData();
    a.fift.d = e;
    Site.saveFooterStyleData(a);
    top._footerStyleChanged++;
    Site.showSectionOfSitePage("foot");
    Site.styleChanged()
};
Site.setFooterFristItemFontFamily = function(c) {
    var a = $(c).val();
    Fai.top.Fai.setCtrlStyleCss("stylefooter", "webFooterTable", "div.footerItemTop .footerItemTopLink", "font-family", a);
    var b = Site.getFooterStyleData();
    b.fift.f = a;
    Site.saveFooterStyleData(b);
    top._footerStyleChanged++;
    Site.showSectionOfSitePage("foot");
    Site.styleChanged()
};
Site.setFooterFristItemFontColor = function(b) {
    Fai.top.Fai.setCtrlStyleCss("stylefooter", "webFooterTable", "div.footerItemTop .footerItemTopLink", "color", b);
    var a = Site.getFooterStyleData();
    a.fift.c = b;
    Site.saveFooterStyleData(a);
    top._footerStyleChanged++;
    Site.styleChanged()
};
Site.setFooterFristItemFontHoverColor = function(b) {
    Fai.top.Fai.setCtrlStyleCss("stylefooter", "webFooterTable", "div.footerItemTop a:hover", "color", b);
    var a = Site.getFooterStyleData();
    a.fift.hc = b;
    Site.saveFooterStyleData(a);
    top._footerStyleChanged++;
    Site.styleChanged()
};
Site.autoFooterFirstItemFontStyle = function() {
    Fai.top.Fai.removeCtrlStyleCssList("stylefooter", "webFooterTable", [{
        cls: "div.footerItemTop .footerItemTopLink",
        key: "font-size"
    },
    {
        cls: "div.footerItemTop .footerItemTopLink",
        key: "font-weight"
    },
    {
        cls: "div.footerItemTop .footerItemTopLink",
        key: "font-family"
    },
    {
        cls: "div.footerItemTop .footerItemTopLink",
        key: "text-decoration"
    },
    {
        cls: "div.footerItemTop .footerItemTopLink",
        key: "color"
    },
    {
        cls: "div.footerItemTop a:hover",
        key: "color"
    }]);
    var a = Site.getFooterStyleData();
    a.fift.y = 0;
    Site.saveFooterStyleData(a);
    top._footerStyleChanged++;
    Site.showSectionOfSitePage("foot");
    Site.styleChanged()
};
Site.cusFooterFirstItemFontStyle = function() {
    var a = Site.getFooterStyleData();
    Fai.top.Fai.setCtrlStyleCssList("stylefooter", "webFooterTable", [{
        cls: "div.footerItemTop .footerItemTopLink",
        key: "font-size",
        value: a.fift.s + "px"
    },
    {
        cls: "div.footerItemTop .footerItemTopLink",
        key: "font-weight",
        value: a.fift.w == 0 ? "normal": "bold"
    },
    {
        cls: "div.footerItemTop .footerItemTopLink",
        key: "font-family",
        value: a.fift.f
    },
    {
        cls: "div.footerItemTop .footerItemTopLink",
        key: "text-decoration",
        value: a.fift.d == 0 ? "none": "underline"
    },
    {
        cls: "div.footerItemTop .footerItemTopLink",
        key: "color",
        value: a.fift.c
    },
    {
        cls: "div.footerItemTop a:hover",
        key: "color",
        value: a.fift.hc
    }]);
    var a = Site.getFooterStyleData();
    a.fift.y = 1;
    Site.saveFooterStyleData(a);
    top._footerStyleChanged++;
    Site.showSectionOfSitePage("foot");
    Site.styleChanged()
};
Site.setFooterSecondItemFontSize = function(c) {
    var b = $(c).val();
    Fai.top.Fai.setCtrlStyleCss("stylefooter", "webFooterTable", "div.footerItemBottom a", "font-size", b + "px");
    var a = Site.getFooterStyleData();
    a.fist.s = parseInt(b);
    Site.saveFooterStyleData(a);
    top._footerStyleChanged++;
    Site.showSectionOfSitePage("foot");
    Site.styleChanged()
};
Site.setFooterSecondItemFontWeight = function(d) {
    var c = "normal";
    var a = 0;
    if ($(d).prop("checked")) {
        c = "bold";
        a = 1
    }
    Fai.top.Fai.setCtrlStyleCss("stylefooter", "webFooterTable", "div.footerItemBottom a", "font-weight", c);
    var b = Site.getFooterStyleData();
    b.fist.w = a;
    Site.saveFooterStyleData(b);
    top._footerStyleChanged++;
    Site.showSectionOfSitePage("foot");
    Site.styleChanged()
};
Site.setFooterSecondItemUnderline = function(c) {
    var b = "none";
    var e = 0;
    if ($(c).prop("checked")) {
        b = "underline";
        e = 1
    }
    Fai.top.Fai.setCtrlStyleCss("stylefooter", "webFooterTable", "div.footerItemBottom a", "text-decoration", b);
    var a = Site.getFooterStyleData();
    a.fist.d = e;
    Site.saveFooterStyleData(a);
    top._footerStyleChanged++;
    Site.showSectionOfSitePage("foot");
    Site.styleChanged()
};
Site.setFooterSecondItemFontFamily = function(c) {
    var a = $(c).val();
    Fai.top.Fai.setCtrlStyleCss("stylefooter", "webFooterTable", "div.footerItemBottom a", "font-family", a);
    var b = Site.getFooterStyleData();
    b.fist.f = a;
    Site.saveFooterStyleData(b);
    top._footerStyleChanged++;
    Site.showSectionOfSitePage("foot");
    Site.styleChanged()
};
Site.setFooterSecondItemFontColor = function(b) {
    Fai.top.Fai.setCtrlStyleCss("stylefooter", "webFooterTable", "div.footerItemBottom a", "color", b);
    var a = Site.getFooterStyleData();
    a.fist.c = b;
    Site.saveFooterStyleData(a);
    top._footerStyleChanged++;
    Site.styleChanged()
};
Site.setFooterSecondItemFontHoverColor = function(b) {
    Fai.top.Fai.setCtrlStyleCss("stylefooter", "webFooterTable", "div.footerItemBottom a:hover", "color", b);
    var a = Site.getFooterStyleData();
    a.fist.hc = b;
    Site.saveFooterStyleData(a);
    top._footerStyleChanged++;
    Site.styleChanged()
};
Site.autoFooterSecondItemFontStyle = function() {
    Fai.top.Fai.removeCtrlStyleCssList("stylefooter", "webFooterTable", [{
        cls: "div.footerItemBottom a",
        key: "font-size"
    },
    {
        cls: "div.footerItemBottom a",
        key: "font-weight"
    },
    {
        cls: "div.footerItemBottom a",
        key: "font-family"
    },
    {
        cls: "div.footerItemBottom a",
        key: "text-decoration"
    },
    {
        cls: "div.footerItemBottom a",
        key: "color"
    },
    {
        cls: "div.footerItemBottom a:hover",
        key: "color"
    }]);
    var a = Site.getFooterStyleData();
    a.fist.y = 0;
    Site.saveFooterStyleData(a);
    top._footerStyleChanged++;
    Site.showSectionOfSitePage("foot");
    Site.styleChanged()
};
Site.cusFooterSecondItemFontStyle = function() {
    var a = Site.getFooterStyleData();
    Fai.top.Fai.setCtrlStyleCssList("stylefooter", "webFooterTable", [{
        cls: "div.footerItemBottom a",
        key: "font-size",
        value: a.fist.s + "px"
    },
    {
        cls: "div.footerItemBottom a",
        key: "font-weight",
        value: a.fist.w == 0 ? "normal": "bold"
    },
    {
        cls: "div.footerItemBottom a",
        key: "font-family",
        value: a.fist.f
    },
    {
        cls: "div.footerItemBottom a",
        key: "text-decoration",
        value: a.fist.d == 0 ? "none": "underline"
    },
    {
        cls: "div.footerItemBottom a",
        key: "color",
        value: a.fist.c
    },
    {
        cls: "div.footerItemBottom a:hover",
        key: "color",
        value: a.fist.hc
    }]);
    var a = Site.getFooterStyleData();
    a.fist.y = 1;
    Site.saveFooterStyleData(a);
    top._footerStyleChanged++;
    Site.showSectionOfSitePage("foot");
    Site.styleChanged()
};
Site.setFooterSecondItemHeight = function(c) {
    var a = c;
    if (!Fai.isNumber(a)) {
        a = parseInt($("#cusSecondItemHeightNum").val());
        if (!Fai.isNumber(a)) {
            return
        }
    }
    Fai.top.Fai.setCtrlStyleCssList("stylefooter", "webFooterTable", [{
        cls: "div.footerItemBottom",
        key: "height",
        value: a + "px"
    }]);
    Site.refreshFooterItemSpacing();
    var b = Site.getFooterStyleData();
    b.fish = parseInt(a);
    Site.saveFooterStyleData(b);
    top._footerStyleChanged++;
    Site.styleChanged()
};
Site.autoFooterSecondItemHeight = function() {
    Fai.top.Fai.removeCtrlStyleCssList("stylefooter", "webFooterTable", [{
        cls: "div.footerItemBottom",
        key: "height"
    }]);
    Site.refreshFooterItemSpacing();
    var a = Site.getFooterStyleData();
    a.fish = -1;
    Site.saveFooterStyleData(a);
    top._footerStyleChanged++;
    Site.styleChanged()
};
Site.useLevelStyleForFooterSecondItem = function() {
    Fai.top.$("#footerNav").removeClass("verticalStyle").addClass("levelStyle");
    Site.refreshFooterItemSpacing();
    var a = Site.getFooterStyleData();
    a.fiss = 1;
    Site.saveFooterStyleData(a);
    top._footerStyleChanged++;
    Site.showSectionOfSitePage("foot");
    Site.styleChanged()
};
Site.useVerticalStyleForFooterSecondItem = function() {
    Fai.top.$("#footerNav").removeClass("levelStyle").addClass("verticalStyle");
    Site.refreshFooterItemSpacing();
    var a = Site.getFooterStyleData();
    a.fiss = 2;
    Site.saveFooterStyleData(a);
    top._footerStyleChanged++;
    Site.showSectionOfSitePage("foot");
    Site.styleChanged()
};
Site.useAutoStyleForFooterSecondItem = function() {
    Fai.top.$("#footerNav").removeClass("levelStyle verticalStyle");
    Site.refreshFooterItemSpacing();
    var a = Site.getFooterStyleData();
    a.fiss = 0;
    Site.saveFooterStyleData(a);
    top._footerStyleChanged++;
    Site.showSectionOfSitePage("foot");
    Site.styleChanged()
};
Site.hideFooterSecondItem = function() {
    Fai.top.Fai.setCtrlStyleCssList("stylefooter", "webFooterTable", [{
        cls: "div.footerItemBottom",
        key: "display",
        value: "none"
    }]);
    Site.refreshFooterItemSpacing()
};
Site.showFooterSecondItem = function() {
    Fai.top.Fai.setCtrlStyleCssList("stylefooter", "webFooterTable", [{
        cls: "div.footerItemBottom",
        key: "display",
        value: "block"
    }]);
    Site.refreshFooterItemSpacing()
};
Site.autoFooterSecondItem = function() {
    Fai.top.Fai.removeCtrlStyleCssList("stylefooter", "webFooterTable", [{
        cls: "div.footerItemBottom",
        key: "display"
    }]);
    Site.refreshFooterItemSpacing()
};
Site.bindFooterItemPicHover = function() {
    Fai.top.$("#footerNav").delegate(".footerItemPicEdit", "mouseenter",
    function() {
        $(this).addClass("footerItemPicEdit-hover");
        var b = Fai.top.$(".footerItemPicCover");
        if (b.length < 1) {
            var a = [];
            a.push("	<div class='footerItemPicCover footerItemPicCover-n'></div>\n");
            a.push("	<div class='footerItemPicCover footerItemPicCover-s'></div>\n");
            a.push("	<div class='footerItemPicCover footerItemPicCover-w'></div>\n");
            a.push("	<div class='footerItemPicCover footerItemPicCover-e'></div>\n");
            Fai.top.$("body").append(a.join(""))
        }
        var f = $(this).offset().top - 3;
        var d = $(this).offset().top + 46 - 4;
        var e = $(this).offset().left - 3;
        var c = $(this).offset().left + 46 - 4;
        Fai.top.$(".footerItemPicCover-n").css({
            top: f + "px",
            left: e + "px"
        });
        Fai.top.$(".footerItemPicCover-s").css({
            top: d + "px",
            left: e + "px"
        });
        Fai.top.$(".footerItemPicCover-w").css({
            top: f + "px",
            left: e + "px"
        });
        Fai.top.$(".footerItemPicCover-e").css({
            top: f + "px",
            left: c + "px"
        });
        Fai.top.$(".footerItemPicCover").show()
    });
    Fai.top.$("#footerNav").delegate(".footerItemPicEdit", "mouseleave",
    function() {
        $(this).removeClass("footerItemPicEdit-hover");
        Fai.top.$(".footerItemPicCover").hide()
    })
};
Site.refreshFooterFirstItemClickStatus = function(b) {
    var a = Fai.top.$("#footerNav").find("ul.footerItemListContainer");
    if (a.length < 1) {
        return
    }
    var d = a.find(".footerItemTopLink");
    if (b) {
        $.each(d,
        function(e, g) {
            var f = $.trim($(g).prop("outerHTML"));
            f = f.replace(/^<span/i, "<a");
            f = f.replace(/\/span>$/i, "/a>");
            $(g).replaceWith(f)
        })
    } else {
        $.each(d,
        function(e, g) {
            var f = $.trim($(g).prop("outerHTML"));
            if ($(g).attr("child") == 1) {
                f = f.replace(/^<a/i, "<span");
                f = f.replace(/\/a>$/i, "/span>");
                $(g).replaceWith(f)
            } else {
                f = f.replace(/^<span/i, "<a");
                f = f.replace(/\/span>$/i, "/a>");
                $(g).replaceWith(f)
            }
        })
    }
    var c = Site.getFooterStyleData();
    c.fifc = b;
    Site.saveFooterStyleData(c);
    top._footerStyleChanged++;
    Site.styleChanged()
};
Site.resetDefaultFooterItemStyle = function() {
    Site.autoFooterItemSectionHeight();
    Site.useAutoStyleForFooterSecondItem();
    setTimeout(function() {
        Site.normalFooterItemStyle(0);
        Site.autoFooterItemPic(0);
        Site.autoFooterItemSectionWidth();
        Site.autoFooterFirstItemFontStyle();
        Site.autoFooterItemSpacing();
        Site.autoFooterVerticalLineStyle();
        Site.refreshFooterFirstItemClickStatus(true);
        Site.autoFooterSecondItemHeight();
        Site.autoFooterSecondItemFontStyle()
    },
    50)
};
Site.refreshFooterItemStyle = function(c) {
    if (c.fis < 0) {
        return
    }
    var b = Fai.top.$("#footerNav");
    var d = b.attr("class");
    var a = 1;
    var e = /\bfooterPattern1\b/;
    if (c.fis == 1) {
        a = 2;
        e = /\bfooterPattern2\b/
    } else {
        if (c.fis == 2) {
            a = 3;
            e = /\bfooterPattern3\b/
        }
    }
    if (!e.test(d)) {
        d = d.replace(/\bfooterPattern\d+/g, "").replace(/\bfooterNav\b/, "footerNav footerPattern" + a + " ");
        b.attr("class", d)
    }
    if (c.fip == 0) {
        Fai.top.Fai.removeCtrlStyleCssList("stylefooter", "webFooterTable", [{
            cls: "div.footerItemPic",
            key: "display"
        }])
    } else {
        if (c.fip == 1) {
            Fai.top.Fai.setCtrlStyleCssList("stylefooter", "webFooterTable", [{
                cls: "div.footerItemPic",
                key: "display",
                value: "block"
            }])
        } else {
            if (c.fip == 2) {
                Fai.top.Fai.setCtrlStyleCssList("stylefooter", "webFooterTable", [{
                    cls: "div.footerItemPic",
                    key: "display",
                    value: "none"
                }])
            }
        }
    }
    if (c.fiw < 0) {
        Fai.top.Fai.removeCtrlStyleCss("stylefooter", "webFooterTable", "li.footerItemSection", "width")
    } else {
        Fai.top.Fai.setCtrlStyleCss("stylefooter", "webFooterTable", "li.footerItemSection", "width", c.fiw + "px")
    }
    if (c.fih < 0) {
        Site.changeFooterItemSpacingState(0);
        Fai.top.Fai.removeCtrlStyleCssList("stylefooter", "webFooterTable", [{
            cls: "li.footerItemSection",
            key: "height"
        },
        {
            cls: "li.footerItemSpacing",
            key: "height"
        }])
    } else {
        Site.changeFooterItemSpacingState(1);
        Fai.top.Fai.setCtrlStyleCssList("stylefooter", "webFooterTable", [{
            cls: "li.footerItemSection",
            key: "height",
            value: c.fih + "px"
        },
        {
            cls: "li.footerItemSpacing",
            key: "height",
            value: c.fih + "px"
        }])
    }
    if (c.fift.y == 1) {
        Fai.top.Fai.setCtrlStyleCssList("stylefooter", "webFooterTable", [{
            cls: "div.footerItemTop .footerItemTopLink",
            key: "font-size",
            value: c.fift.s + "px"
        },
        {
            cls: "div.footerItemTop .footerItemTopLink",
            key: "font-weight",
            value: c.fift.w == 0 ? "normal": "bold"
        },
        {
            cls: "div.footerItemTop .footerItemTopLink",
            key: "font-family",
            value: c.fift.f
        },
        {
            cls: "div.footerItemTop .footerItemTopLink",
            key: "text-decoration",
            value: c.fift.d == 0 ? "none": "underline"
        },
        {
            cls: "div.footerItemTop .footerItemTopLink",
            key: "color",
            value: c.fift.c
        },
        {
            cls: "div.footerItemTop a:hover",
            key: "color",
            value: c.fift.hc
        }])
    } else {
        if (c.fift.y == 0) {
            Fai.top.Fai.removeCtrlStyleCssList("stylefooter", "webFooterTable", [{
                cls: "div.footerItemTop .footerItemTopLink",
                key: "font-size"
            },
            {
                cls: "div.footerItemTop .footerItemTopLink",
                key: "font-weight"
            },
            {
                cls: "div.footerItemTop .footerItemTopLink",
                key: "font-family"
            },
            {
                cls: "div.footerItemTop .footerItemTopLink",
                key: "text-decoration"
            },
            {
                cls: "div.footerItemTop .footerItemTopLink",
                key: "color"
            },
            {
                cls: "div.footerItemTop a:hover",
                key: "color"
            }])
        }
    }
    if (c.fisp < 0) {
        Fai.top.Fai.removeCtrlStyleCssList("stylefooter", "webFooterTable", [{
            cls: "li.footerItemSpacing",
            key: "padding-left"
        },
        {
            cls: "li.footerItemSpacing",
            key: "padding-right"
        }])
    } else {
        Fai.top.Fai.setCtrlStyleCssList("stylefooter", "webFooterTable", [{
            cls: "li.footerItemSpacing",
            key: "padding-left",
            value: (c.fisp / 2) + "px"
        },
        {
            cls: "li.footerItemSpacing",
            key: "padding-right",
            value: (c.fisp / 2) + "px"
        }])
    }
    if (c.fiv.y == 1) {
        Fai.top.Fai.setCtrlStyleCssList("stylefooter", "webFooterTable", [{
            cls: "div.footerVerticalLine",
            key: "background-color",
            value: c.fiv.c
        },
        {
            cls: "div.footerVerticalLine",
            key: "width",
            value: c.fiv.w + "px"
        }])
    } else {
        if (c.fiv.y == 0) {
            Fai.top.Fai.removeCtrlStyleCssList("stylefooter", "webFooterTable", [{
                cls: "div.footerVerticalLine",
                key: "background-color"
            },
            {
                cls: "div.footerVerticalLine",
                key: "width"
            }])
        }
    }
    Site.refreshFooterFirstItemClickStatus(c.fifc);
    if (c.fiss == 0) {
        Fai.top.$("#footerNav").removeClass("levelStyle verticalStyle")
    } else {
        if (c.fiss == 1) {
            Fai.top.$("#footerNav").removeClass("verticalStyle").addClass("levelStyle")
        } else {
            if (c.fiss == 2) {
                Fai.top.$("#footerNav").removeClass("levelStyle").addClass("verticalStyle")
            }
        }
    }
    if (c.fish < 0) {
        Fai.top.Fai.removeCtrlStyleCssList("stylefooter", "webFooterTable", [{
            cls: "div.footerItemBottom",
            key: "height"
        }])
    } else {
        Fai.top.Fai.setCtrlStyleCssList("stylefooter", "webFooterTable", [{
            cls: "div.footerItemBottom",
            key: "height",
            value: height + "px"
        }])
    }
    if (c.fist.y == 1) {
        Fai.top.Fai.setCtrlStyleCssList("stylefooter", "webFooterTable", [{
            cls: "div.footerItemBottom a",
            key: "font-size",
            value: c.fist.s + "px"
        },
        {
            cls: "div.footerItemBottom a",
            key: "font-weight",
            value: c.fist.w == 0 ? "normal": "bold"
        },
        {
            cls: "div.footerItemBottom a",
            key: "font-family",
            value: c.fist.f
        },
        {
            cls: "div.footerItemBottom a",
            key: "text-decoration",
            value: c.fist.d == 0 ? "none": "underline"
        },
        {
            cls: "div.footerItemBottom a",
            key: "color",
            value: c.fist.c
        },
        {
            cls: "div.footerItemBottom a:hover",
            key: "color",
            value: c.fist.hc
        }])
    } else {
        if (c.fist.y == 0) {
            Fai.top.Fai.removeCtrlStyleCssList("stylefooter", "webFooterTable", [{
                cls: "div.footerItemBottom a",
                key: "font-size"
            },
            {
                cls: "div.footerItemBottom a",
                key: "font-weight"
            },
            {
                cls: "div.footerItemBottom a",
                key: "font-family"
            },
            {
                cls: "div.footerItemBottom a",
                key: "text-decoration"
            },
            {
                cls: "div.footerItemBottom a",
                key: "color"
            },
            {
                cls: "div.footerItemBottom a:hover",
                key: "color"
            }])
        }
    }
    Site.refreshFooterItemSpacing()
};
Site.changeFooterItemImg = function(c) {
    var a = {
        title: "添加图片",
        maxSize: 1,
        type: ["jpg", "jpeg", "gif", "png"],
        from: "footer",
        entry: "footerItemPic"
    };
    Site.fileUpload2(false, a, b);
    function b(l) {
        if (l) {
            var d = $.parseJSON(l);
            var g = d.data[0].fileId;
            var h = d.data[0].filePath;
            var o = d.data[0].fileWidth;
            var n = d.data[0].fileHeight;
            var e = Fai.top.$("#footerItemPic" + c);
            e.children("img").remove();
            e.append("<img src='" + h + "' alt='' title='' width='100%' height='100%' imgid='" + g + "' />");
            var k = {};
            k.colId = parseInt(c);
            k.imgId = g;
            var f = false;
            if (typeof Fai.top._footerItemImgList == "undefined") {
                Fai.top._footerItemImgList = []
            }
            for (var j = 0,
            m = Fai.top._footerItemImgList.length; j < m; j++) {
                if (Fai.top._footerItemImgList[j].colId == k.colId) {
                    Fai.top._footerItemImgList[j] = k;
                    f = true;
                    break
                }
            }
            if (!f) {
                Fai.top._footerItemImgList.push(k)
            }
            Site.styleChanged()
        }
    }
};
Site.addFooterItemImg = function(c) {
    var a = {
        title: "添加图片",
        maxSize: 1,
        type: ["jpg", "jpeg", "gif", "png"],
        from: "footer",
        entry: "footerItemPic"
    };
    Site.fileUpload2(false, a, b);
    function b(l) {
        if (l) {
            var d = $.parseJSON(l);
            var g = d.data[0].fileId;
            var h = d.data[0].filePath;
            var o = d.data[0].fileWidth;
            var n = d.data[0].fileHeight;
            var e = Fai.top.$("#footerItemPic" + c);
            e.removeAttr("onclick").removeClass("footerItemAddPic");
            e.append("<div class='footerItemPicEdit' onclick='Site.changeFooterItemImg(\"" + c + "\");return false;'></div>");
            e.append("<img src='" + h + "' alt='' title='' width='100%' height='100%' imgid='" + g + "' />");
            var k = {};
            k.colId = parseInt(c);
            k.imgId = g;
            var f = false;
            if (typeof Fai.top._footerItemImgList == "undefined") {
                Fai.top._footerItemImgList = []
            }
            for (var j = 0,
            m = Fai.top._footerItemImgList.length; j < m; j++) {
                if (Fai.top._footerItemImgList[j].colId == k.colId) {
                    Fai.top._footerItemImgList[j] = k;
                    f = true;
                    break
                }
            }
            if (!f) {
                Fai.top._footerItemImgList.push(k)
            }
            Site.styleChanged()
        }
    }
};
Site.resetAllFooterStyle = function() {
    if (Fai.top.$("#footer").length < 1) {
        return
    }
    var c = "0 0 0 0",
    d = 0,
    b = 0,
    a = Site.getFooterStyleData();
    Fai.top.Fai.setCtrlStyleCssList("stylefooter", "footer", [{
        cls: ".footerContent",
        key: "padding-top",
        value: b + "px"
    },
    {
        cls: ".footerContent",
        key: "padding-bottom",
        value: d + "px"
    },
    {
        cls: ".footerNav",
        key: "padding",
        value: c
    },
    {
        cls: ".footerInfo",
        key: "padding",
        value: c
    },
    {
        cls: ".footerSupport",
        key: "padding",
        value: c
    },
    {
        cls: ".visitorCounterWrap",
        key: "padding",
        value: c
    }]);
    a.f.u = 0;
    a.f.d = 0;
    Site.saveFooterStyleData(a);
    top._footerStyleChanged++;
    Site.setRefreshInfo("siteStyleSetting", true);
    Site.logDog(100080, 9);
    Fai.top._useTemplateBackground ? Fai.top._footerStyleData.f.t = 0 : Fai.top._customFooterStyleData.f.t = 0;
    if (Fai.top.panelFunc) {
        $("#footerEdgeDistance0").attr("checked", "checked");
        $("#footerPaddingCus").hide();
        $("#upFooterPadding").val(0);
        $("#downFooterPadddng").val(0)
    }
    Site.styleChanged()
};
Site.hiddenLogo = function() {
    $("#logo").fadeOut(600);
    Fai.top._logoData.h = true;
    if (Fai.top._useTemplateLogo) {
        Fai.top._templateLogoData.h = true
    }
    Site.styleSetting("refresh", "webSettingTab");
    Fai.top._logoChanged = Fai.top._logoChanged + 2;
    Site.styleChanged();
    Site.setRefreshInfo("moduleEdit", true)
};
Site.initLogoManage = function(a) {
    var b;
    $("#logo").mouseover(function() {
        Site.addEditLayer("logo", a, 0, {
            fromEditLayer: true
        });
        Fai.top.$("#logo").find(".ui-resizable-se").show()
    }).mouseleave(function() {
        Site.removeEditLayer("logo");
        Fai.top.$("#logo").find(".ui-resizable-se").hide()
    });
    $("#logoLink").mousedown(function() {
        $(this).removeAttr("href")
    }).mouseup(function() {
        $(this).attr("href", $(this).attr("link"))
    });
    $("#logo").draggable({
        handle: "#logo",
        beforeStart: function() {
            var e, c = Fai.top.$("#logo");
            if (c.hasClass("logofixtop")) {
                var d;
                d = Fai.top.$(".floatLeftTop").offset().top - Fai.top.$("#webTop").offset().top;
                e = c.offset().left - c.parent().offset().left;
                c.removeClass("logofixtop");
                c.css({
                    position: "",
                    top: d + "px",
                    left: e + "px"
                })
            }
        },
        start: function() {
            Site.disableEditLayer();
            var c = $(this).children("#logoLink");
            c.removeAttr("href")
        },
        stop: function() {
            Site.enableEditLayer();
            var f = Fai.top.$("#logo");
            if (f.offset().top < Fai.top.$("#webTop").offset().top) {
                f.offset({
                    top: Fai.top.$("#webTop").offset().top,
                    left: f.offset().left
                })
            }
            var d = Site.getFooterBottom();
            if (f.offset().top + f.height() > d) {
                f.offset({
                    top: d - f.height(),
                    left: f.offset().left
                })
            }
            if (f.offset().left < 0) {
                f.offset({
                    top: f.offset().top,
                    left: 0
                })
            }
            var e = Fai.getBrowserWidth() - f.width();
            if (f.offset().left > e) {
                f.offset({
                    top: f.offset().top,
                    left: e
                })
            }
            Fai.top._logoData.t = parseInt(f.position().top);
            Fai.top._logoData.l = parseInt(f.position().left);
            if (Fai.top._useTemplateLogo) {
                Fai.top._templateLogoData.t = parseInt(f.position().top);
                Fai.top._templateLogoData.l = parseInt(f.position().left)
            }
            Fai.top._logoChanged = Fai.top._logoChanged + 2;
            if (top._logoPositionFixTop) {
                Fai.top.$("#logo").removeClass("logofixtop");
                Site.onLogoPositionFixTop()
            }
            Site.styleChanged();
            Site.setRefreshInfo("moduleDrag", true);
            var c = $(this).children("#logoLink");
            c.attr("href", c.attr("link"))
        },
        distance: 1
    });
    Fai.top.$("#logo").css("cursor", "move");
    Fai.top.$("#logo").resizable({
        helper: "ui-resizable-helper",
        start: function() {
            var c = $(this).children("#logoLink");
            c.removeAttr("href");
            b = $("#dockTip").show()
        },
        resize: function(d, e) {
            var c = $(".ui-resizable-helper");
            b.html("高度:" + c.height() + "<br/>宽度:" + c.width()).css({
                left: d.pageX - 28,
                top: d.pageY + 18
            })
        },
        stop: function() {
            $("#logoImg").css("height", Fai.getCssInt(Fai.top.$("#logo"), "height"));
            $("#logoImg").css("width", Fai.getCssInt(Fai.top.$("#logo"), "width"));
            Site.styleChanged();
            Fai.top._logoData.w = parseInt(Fai.top.$("#logoImg").width());
            Fai.top._logoData.g = parseInt(Fai.top.$("#logoImg").height());
            if (Fai.top._useTemplateLogo) {
                Fai.top._templateLogoData.w = parseInt(Fai.top.$("#logoImg").width());
                Fai.top._templateLogoData.g = parseInt(Fai.top.$("#logoImg").height())
            }
            Fai.top._logoChanged++;
            b.hide();
            Site.setRefreshInfo("moduleSetting", true);
            var c = $(this).children("#logoLink");
            c.attr("href", c.attr("link"))
        }
    });
    Fai.top.$("#logo").find(".ui-resizable-se").addClass("ui-resizable-rightTip").attr("title", "按住鼠标，可随意调整大小。").hide()
};
Site.onLogoPositionFixTop = function() {
    if (!top._logoPositionFixTop) {
        return
    }
    var c = Fai.top.$(window),
    g,
    f = Fai.top.$("#logo"),
    m = Fai.top.$("#g_main"),
    n = Fai.top.$("#webTop"),
    a = Fai.top.$(".webTopTable"),
    k = Fai.top.$(".floatLeftTop"),
    h,
    l = f.offset().top - n.offset().top,
    e = parseInt(f.css("left").replace("px", "")),
    j = f.position().top,
    b = f.parent(),
    i = b.offset().left - f.offset().left,
    d = false;
    m.off("scroll.logo");
    m.on("scroll.logo",
    function() {
        var o = f.offset().top,
        p = k.offset().top;
        g = Site.getNavInClientPosition(f).left;
        if (a.find("#logo").length > 0) {
            h = a;
            h.css({
                zIndex: "60",
                position: "relative"
            })
        }
        if (!d && o < p) {
            d = true;
            f.css({
                left: g + "px",
                top: p + "px",
                position: "fixed"
            });
            f.addClass("logofixtop")
        }
        if (d && p - n.offset().top < l && f.hasClass("logofixtop")) {
            f.css({
                left: e + "px",
                top: j + "px",
                position: "absolute"
            });
            d = false;
            f.removeClass("logofixtop")
        }
    });
    c.off("resize.logo");
    c.on("resize.logo",
    function() {
        var p;
        var o = Fai.top.$(window).width();
        if (f.hasClass("logofixtop")) {
            setTimeout(function() {
                p = b.offset().left;
                f.css("left", (p - i) + "px")
            },
            0)
        }
    })
};
Site.refreshStyleTemplatePanel = function(a) {
    if (Fai.top._templateType == 2) {
        return
    }
    if (Fai.top.$("#webTemplateFrame").attr("src")) {
        Site.stylePanesShow(true);
        Fai.top.$("#webTemplate").show();
        Fai.top.$("#webTemplateTab").addClass("current");
        Site.styleDesignLoading("webTemplate", "webTemplateFrame");
        Fai.top.$("#webTemplateFrame").attr("src", "manage/styleTemplate.jsp?ram=" + Math.random())
    }
};
Site.refreshStyleLayoutPanel = function(a) {
    if (Fai.top.$("#pageLayoutFrame").attr("src")) {
        Site.stylePanesShow(true);
        Fai.top.$("#pageLayout").show();
        Fai.top.$("#pageLayoutTab").addClass("current");
        if (a) {
            Site.styleDesignLoading("pageLayout", "pageLayoutFrame");
            Fai.top.$("#pageLayoutFrame").attr("src", "manage/styleLayout.jsp?ram=" + Math.random())
        } else {
            Fai.top.$("#pageLayoutFrame")[0].contentWindow.refreshAllLayout()
        }
    }
};
Site.refreshStyleWebPanel = function(a) {
    if (Fai.top.$("#webSettingFrame").attr("src")) {
        if (a) {
            Site.stylePanesShow(true);
            Fai.top.$("#webSetting").show();
            Fai.top.$("#webSettingTab").addClass("current");
            Site.styleDesignLoading("webSetting", "webSettingFrame");
            Fai.top.$("#webSettingFrame").attr("src", "manage/styleGlobal.jsp?ram=" + Math.random())
        } else {
            Fai.top.$("#webSettingFrame")[0].contentWindow.refreshSetting()
        }
    }
};
Site.refreshStylePagePanel = function(a) {
    if (Fai.top.$("#pageSettingFrame").attr("src")) {
        Site.stylePanesShow(true);
        Fai.top.$("#pageSetting").show();
        Fai.top.$("#pageSettingTab").addClass("current");
        Fai.top.$("#pageSettingFrame").attr("src", "manage/stylePage.jsp?ram=" + Math.random() + "&colId=" + Fai.top._colId)
    }
};
Site.refreshStyleBannerPanel = function(a) {
    if (Fai.top.$("#webBannerFrame").attr("src")) {
        if (a) {
            Site.stylePanesShow(true);
            Fai.top.$("#webBannerStyle").show();
            Fai.top.$("#webBannerTab").addClass("current")
        }
        Site.styleDesignLoading("webBannerStyle", "webBannerFrame");
        Fai.top.$("#webBannerFrame").attr("src", "manage/styleBanner.jsp?ram=" + Math.random())
    }
};
Site.styleDesignLoading = function(e, g) {
    var a = Fai.top.$("#webTemplate");
    var d = a.first();
    var b = d.height();
    var f = $('<div class="forWaiting ajaxLoading2" style="position:absolute;background-color:#f7f7f7;width:100%;height:' + b + 'px;top:37px;left:0;"></div>');
    f.appendTo("#" + e);
    var c = $(".forWaiting");
    $("#" + g).load(function() {
        c.remove()
    })
};
Site.styleDefaultClick = function() {
    Site.stylePanesHide()
};
Site.webTemplateTabClick = function(b) {
    if (Fai.top._templateType == 2) {
        Site.webBannerTabClick();
        return
    }
    Site.stylePanesShow(true);
    Fai.top.$("#webTemplate").show();
    Fai.top.$("#webTemplateTab").addClass("current");
    if (!Fai.top.$("#webTemplateFrame").attr("src")) {
        Site.styleDesignLoading("webTemplate", "webTemplateFrame");
        Fai.top.$("#webTemplateFrame").attr("src", "manage/styleTemplate.jsp?ram=" + Math.random());
        Fai.top.$("#webTemplateFrame").load(function() {
            Fai.top.$("#webTemplateFrame")[0].contentWindow.parentShow();
            var c = Fai.top.$("#webTemplateFrame")[0].contentWindow.document.getElementById(b);
            if (c) {
                c.click()
            }
        })
    } else {
        Fai.top.$("#webTemplateFrame")[0].contentWindow.parentShow();
        var a = Fai.top.$("#webTemplateFrame")[0].contentWindow.document.getElementById(b);
        if (a) {
            a.click()
        }
    }
};
Site.webTemplateTabClick2 = function(b) {
    if (Fai.top._templateType == 2) {
        Site.webBannerTabClick();
        return
    }
    Site.stylePanesShow(true);
    Fai.top.$("#webTemplate").show();
    Fai.top.$("#webTemplateTab").addClass("current");
    if (!Fai.top.$("#webTemplateFrame").attr("src")) {
        Site.styleDesignLoading("webTemplate", "webTemplateFrame");
        Fai.top.$("#webTemplateFrame").attr("src", "manage/styleTemplate2.jsp?ram=" + Math.random());
        Fai.top.$("#webTemplateFrame").load(function() {
            Fai.top.$("#webTemplateFrame")[0].contentWindow.parentShow();
            var c = Fai.top.$("#webTemplateFrame")[0].contentWindow.document.getElementById(b);
            if (c) {
                c.click()
            }
        })
    } else {
        Fai.top.$("#webTemplateFrame")[0].contentWindow.parentShow();
        var a = Fai.top.$("#webTemplateFrame")[0].contentWindow.document.getElementById(b);
        if (a) {
            a.click()
        }
    }
};
Site.webBannerTabClick = function(b) {
    Site.stylePanesShow(true);
    Fai.top.$("#webBannerStyle").show();
    Fai.top.$("#webBannerTab").addClass("current");
    if (!Fai.top.$("#webBannerFrame").attr("src")) {
        Site.styleDesignLoading("webBannerStyle", "webBannerFrame");
        Fai.top.$("#webBannerFrame").attr("src", "manage/styleBanner.jsp?ram=" + Math.random());
        Fai.top.$("#webBannerFrame").load(function() {
            Fai.top.$("#webBannerFrame")[0].contentWindow.refreshPage();
            var c = Fai.top.$("#webBannerFrame")[0].contentWindow.document.getElementById(b);
            if (c) {
                c.click()
            }
        })
    } else {
        Fai.top.$("#webBannerFrame")[0].contentWindow.refreshPage();
        var a = Fai.top.$("#webBannerFrame")[0].contentWindow.document.getElementById(b);
        if (a) {
            a.click()
        }
    }
};
Site.webSettingTabClick = function(c) {
    Site.stylePanesShow(true);
    Fai.top.$("#webSetting").show();
    Fai.top.$("#webSettingTab").addClass("current");
    if (!Fai.top.$("#webSettingFrame").attr("src")) {
        Site.styleDesignLoading("webSetting", "webSettingFrame");
        var b = "manage/styleGlobal.jsp?ram=" + Math.random() + "&colId=" + Fai.top._colId;
        Fai.top.$("#webSettingFrame").attr("src", b);
        Fai.top.$("#webSettingFrame").load(function() {
            var d = Fai.top.$("#webSettingFrame")[0].contentWindow.document.getElementById(c);
            if (d) {
                d.click()
            }
        })
    } else {
        var a = Fai.top.$("#webSettingFrame")[0].contentWindow.document.getElementById(c);
        if (a) {
            a.click()
        }
    }
};
Site.baiduOptClick = function() {
    Site.stylePanesShow(true);
    Fai.top.$("#baiduOpt").show();
    Fai.top.$("#baiduOptTab").addClass("current");
    if (!Fai.top.$("#baiduOptFrame").attr("src")) {
        Site.styleDesignLoading("baiduOpt", "baiduOptFrame");
        Fai.top.$("#baiduOptFrame").attr("src", "manage/stylePage.jsp?ram=" + Math.random() + "&colId=" + Fai.top._colId)
    }
};
Site.pageLayoutTabClick = function(b, c) {
    if (c == undefined) {
        c = function() {}
    }
    Site.stylePanesShow(true);
    Fai.top.$("#pageLayout").show();
    Fai.top.$("#pageLayoutTab").addClass("current");
    if (!Fai.top.$("#pageLayoutFrame").attr("src")) {
        Site.styleDesignLoading("pageLayout", "pageLayoutFrame");
        Fai.top.$("#pageLayoutFrame").attr("src", "manage/styleLayout.jsp?ram=" + Math.random());
        Fai.top.$("#pageLayoutFrame").load(function() {
            var d = Fai.top.$("#pageLayoutFrame")[0].contentWindow.document.getElementById(b);
            if (d) {
                $(d).click();
                c()
            }
        })
    } else {
        Fai.top.$("#pageLayoutFrame")[0].contentWindow.refreshAllLayout();
        var a = Fai.top.$("#pageLayoutFrame")[0].contentWindow.document.getElementById(b);
        if (a) {
            $(a).click();
            c()
        }
    }
};
Site.freeLayoutClick = function() {
    var a = Fai.top.$("#pageLayoutFrame")[0].contentWindow.document.getElementById("layout" + Fai.top._appendLayout);
    if (a) {
        $(a).click()
    }
};
Site.stylePanesHide = function() {
    var b = Fai.top.$("#faiFloatPanel");
    var a = 0;
    Fai.top.$("#panes").hide();
    Fai.top.$(".g_styleDesign").css("height", (37 + a) + "px");
    $("#styleDesignArrow").removeClass("g_styleDesignArrowUp").addClass("g_styleDesignArrow");
    $("#styleDesignArrow").attr("title", "点击展开设计面板");
    Fai.top.Site.resetGmainPos();
    Site.functionInterface({
        name: "refreshPanelStyle"
    });
    Site.functionInterface({
        name: "refreshFaiFloatPanelIconStyle"
    },
    true);
    Fai.top.Site.faiSettingPanel && Fai.top.Site.faiSettingPanel.refreshPanelStyle()
};
Site.stylePanesShow = function(b) {
    Fai.top.$("#panes").show();
    if (b) {
        Fai.top.$("#panes > div").hide();
        Fai.top.$("#tabs a").removeClass("current")
    }
    var a = ~~ ($.cookie("styleDesignHeight", {
        path: "/"
    }));
    a = a > 100 ? a: 240;
    Fai.top.$(".g_styleDesign").css("height", a + "px");
    Fai.top.$("#styleDesignArrow").removeClass("g_styleDesignArrow").addClass("g_styleDesignArrowUp");
    Fai.top.$("#styleDesignArrow").attr("title", "点击收起设计面板");
    Fai.top.Site.resetGmainPos();
    Fai.top.$("#tabs > li").hover(function() {
        var c = $(this).find("a").hasClass("current");
        if (!c) {
            $(this).addClass("tabHover").siblings().removeClass("tabHover")
        }
    },
    function() {
        var c = $(this).find("a").hasClass("current");
        if (!c) {
            $(this).removeClass("tabHover")
        }
    });
    Fai.top.$("#tabs > li").bind("click",
    function() {
        $(this).removeClass("tabHover")
    });
    Fai.top.$("#tabs .saveBtn").hover(function() {
        if ($(this).hasClass("buttonDisabled")) {
            return
        }
        $(this).addClass("saveBtnHover")
    },
    function() {
        $(this).removeClass("saveBtnHover")
    });
    Fai.top.$("#tabs .cancelBtn").hover(function() {
        $(this).addClass("cancelBtnHover")
    },
    function() {
        $(this).removeClass("cancelBtnHover")
    });
    Site.functionInterface({
        name: "hideFaiFloatPanel"
    },
    true);
    Site.functionInterface({
        name: "refreshFaiFloatPanelIconStyle"
    },
    true);
    Fai.top.Site.faiSettingPanel && Fai.top.Site.faiSettingPanel.hide(true, true)
};
function deleteCookie() {
    try {
        $.cookie("progressNumCookie", null, {
            expires: 1,
            path: "/"
        });
        $.cookie("topSiteDomain", null, {
            expires: 1,
            path: "/"
        });
        userAddItem;
        $.cookie("submitUrl", null, {
            expires: 1,
            path: "/"
        });
        $.cookie("browserTitle", null, {
            expires: 1,
            path: "/"
        });
        $.cookie("keyword", null, {
            expires: 1,
            path: "/"
        });
        $.cookie("description", null, {
            expires: 1,
            path: "/"
        });
        $.cookie("useHtmlUrl", null, {
            expires: 1,
            path: "/"
        });
        $.cookie("openSitemap", null, {
            expires: 1,
            path: "/"
        });
        $.cookie("cdnAndMonitor", null, {
            expires: 1,
            path: "/"
        })
    } catch(a) {}
}
Site.closeStyleDesign = function() {
    deleteCookie();
    Site.styleSetting("close");
    Site.removeBannerTradeSelect();
    Site.removeAdvanceContent()
};
Site.removeBannerTradeSelect = function() {
    if (Fai.top.$("#bannerTradeSelectDiv").length > 0) {
        Fai.top.$("#bannerTradeSelectTop").remove();
        Fai.top.$("#bannerTradeSelectDiv").remove()
    }
};
Site.removeAdvanceContent = function() {
    if (Fai.top.$(".setContentDiv2").length > 0) {
        Fai.top.$(".setContentDiv2").remove()
    }
    if (Fai.top.$(".setContentDiv").length > 0) {
        Fai.top.$(".setContentDiv").remove()
    }
};
Site.changeStyleDesignPanes = function() {
    if ($("#styleDesignArrow").hasClass("g_styleDesignArrowUp")) {
        Site.stylePanesHide();
        Site.fixWebFooterHeight()
    } else {
        Site.stylePanesShow(false)
    }
};
Site.designInitStyleTabs = function() {
    Fai.top.$("ul.tabs").tabs("div.panes > div")
};
Site.changeBannerTabStatus = function(a) {
    if ( !! a) {
        Fai.top.$("#webBannerTab").parent().show()
    } else {
        Fai.top.$("#webBannerTab").parent().hide()
    }
    var b = Fai.top.$("#tabs").find(".tabsMenu:visible").length;
    Fai.top.$("#styleDesignBtnContainer").removeAttr("class").addClass("styleDesignBtnContainer-" + b)
};
Site.initModuleLayer = function(moduleId, moduleLayerList, shortcutLayerList, directionList) {
    var initModule = Fai.top.$("#module" + moduleId);
    initModule.off("mouseover").off("mouseleave").mouseover(function() {
        var module = $(this);
        var id = module.attr("id");
        var moduleId = id.replace("module", "");
        module.attr("_mouseIn", 1);
        var isFullmeasure = false;
        var inFullmeasure = false;
        var isMultiModule = false;
        var inMultiModule = false;
        if (module.hasClass("formStyle80")) {
            isFullmeasure = true
        }
        if (module.attr("_infullmeasure") > 0) {
            inFullmeasure = true
        }
        if (module.hasClass("formStyle35") || module.hasClass("formStyle29")) {
            isMultiModule = true
        }
        if (module.attr("_inmulmcol") > 0 || module.attr("_intab") > 0) {
            inMultiModule = true
        }
        Site.addMoveFrame(id);
        Site.refreshResizableHandles(module);
        if (Fai.top._canDesign) {
            if (!isMultiModule && !isFullmeasure) {
                if (module.children(".draggableBtn").length < 1) {
                    var html = [];
                    html.push("<div class='draggableBtn' _mouseIn='0'>");
                    html.push("	<a href='javascript:;' onclick='return false;' class='J_handle dragHandle'></a>");
                    var directionBtnTop = 0;
                    if (!inMultiModule && !module.hasClass("formStyle82")) {
                        var floatFunc = 'Site.floatOut2("' + id + '", "f");';
                        var dockFunc = 'Site.dock2("' + id + '", "d");';
                        var floatTitle = "浮动模块，可随意摆放位置";
                        var dockTitle = "把模块停靠回固定区域";
                        var dockStatus;
                        var draggableFunc = floatFunc;
                        var floatAndDockBtnClass = "float";
                        var btnTitle = floatTitle;
                        dockStatus = Site.getDockStatus2(id);
                        if (dockStatus == 1) {
                            draggableFunc = dockFunc;
                            floatAndDockBtnClass = "dock";
                            btnTitle = dockTitle
                        }
                        directionBtnTop = 18;
                        html.push("<a class='subShortcut subShortcut-" + floatAndDockBtnClass + "' title='" + btnTitle + "' href='javascript:;' onclick='" + draggableFunc + ";Site.removeModuleDragBtn(" + moduleId + ");Site.removeAllEditLayer();return false;'></a>")
                    }
                    if (!module.hasClass("formStyle82")) {
                        if (typeof directionList != "undefined") {
                            var showLength = 0;
                            var tmpHtml = [];
                            var initwidth = 18;
                            for (var i = 0,
                            len = directionList.length; i < len; i++) {
                                var data = directionList[i];
                                var statusScript = data.statusScript;
                                var dataTitle = "";
                                var dataIconClass = "";
                                data.status = 0;
                                if (statusScript) {
                                    data.status = eval(statusScript)
                                }
                                if (data.status != -1) {
                                    dataTitle = (data.status == 0 ? data.title: data.title1);
                                    dataIconClass = (data.status == 0 ? data.iconClass: data.iconClass1);
                                    if (typeof dataTitle === "undefined") {
                                        dataTitle = ""
                                    }
                                    showLength += 1;
                                    tmpHtml.push("		<a class='subShortcut_pos " + dataIconClass + "' href='javascript:;' title='" + dataTitle + "' onclick=\"" + data.evalScript + ";Site.removeModuleDragBtn(" + moduleId + ');Site.removeAllEditLayer();return false;"></a>')
                                }
                            }
                            if (showLength > 0) {
                                var directionBoxWidth = showLength * initwidth;
                                html.push("<div class='J_subShortcut_pos subShortcut2 ' style='top:" + directionBtnTop + "px;' initwidth='" + initwidth + "' totalwidth='" + directionBoxWidth + "'>");
                                html.push(tmpHtml.join(""));
                                html.push("	</div>")
                            }
                        }
                    }
                    html.push("</div>");
                    module.append(html.join(""));
                    var leftPos = module.width() / 2 - 30;
                    module.children(".draggableBtn").css("left", leftPos + "px");
                    module.find(".J_subShortcut_pos").hover(function() {
                        $(this).stop(true).animate({
                            width: $(this).attr("totalwidth") + "px"
                        },
                        200)
                    },
                    function() {
                        $(this).stop(true).animate({
                            width: $(this).attr("initwidth") + "px"
                        },
                        200)
                    });
                    module.off("Fai_onModuleSizeChange.dragBtn");
                    module.off("Fai_onModuleLayoutChange.dragBtn");
                    module.on("Fai_onModuleSizeChange.dragBtn",
                    function() {
                        Site.fixDragBtnPos(module)
                    });
                    module.on("Fai_onModuleLayoutChange.dragBtn",
                    function() {
                        Site.fixDragBtnPos(module)
                    })
                }
                var moduleLayerMenu = $("#module" + moduleId + "moduleLayer").find(".menu");
                if (typeof moduleLayerMenu != "undefined" && moduleLayerMenu.length > 0) {
                    moduleLayerMenu.hide()
                }
            } else {
                var gtIE8 = true;
                if (Fai.isIE6() || Fai.isIE7() || Fai.isIE8()) {
                    gtIE8 = false
                }
                if (module.hasClass("formStyle35") && module.find(".J_multiHandle").length < 1) {
                    if (gtIE8) {
                        module.append('<div class="J_multiHandle mulColTabSortIcon rightSortIcon" title="按住鼠标，可随意拖动模块列布局。"></div>')
                    } else {
                        module.append('<div class="J_multiHandle mulColTabSortIcon" title="按住鼠标，可随意拖动模块列布局。"></div>')
                    }
                } else {
                    if (module.hasClass("formStyle29") && module.find(".J_tabHandle").length < 1) {
                        if (gtIE8) {
                            module.append('<div class="J_tabHandle mulColTabSortIcon rightSortIcon" title="按住鼠标，可随意拖动模块组布局。"></div>')
                        } else {
                            module.append('<div class="J_tabHandle mulColTabSortIcon" title="按住鼠标，可随意拖动模块组布局。"></div>')
                        }
                        module.find(".formTabButton").attr("title", "按住鼠标，可随意调整模块组内模块顺序");
                        module.find(".formTab").addClass("column")
                    } else {
                        if (isFullmeasure && module.find(".J_fullmeasureHandle").length < 1) {
                            module.append('<div class="J_fullmeasureHandle fullmeasureSortIcon" title="按住鼠标，可随意拖动通栏模块布局。"></div>');
                            module.off("mouseover.fullmeasureLayer");
                            module.on("mouseover.fullmeasureLayer",
                            function() {
                                Site.addModuleLayer("module" + moduleId, moduleLayerList, 0);
                                Fai.top.$("#module" + moduleId + "moduleLayer").css({
                                    opacity: "1"
                                })
                            })
                        }
                    }
                }
            }
            Site.addDragBtnHandle(module)
        }
        var photoGroupId = module.data("groupIdCheck");
        if (photoGroupId != null) {
            moduleLayerList[3].evalScript = "Site.popupWindow({title:'编辑图册', frameSrcUrl:'manage/photoGroupEdit.jsp?id=" + photoGroupId + "&ram='+Math.random(),  width:'750', height:'590', frameScrolling:'auto'});";
            module.removeData("groupIdCheck")
        }
        if (!Fai.top._canDesign) {
            Site.removeDesignEditLayer()
        }
        if (!Fai.top._canEditData) {
            Site.removeAllDataEditLayer()
        }
        if (isMultiModule) {
            if (inMultiModule) {
                var multiModuleId = module.attr("_intab");
                if (parseInt(module.attr("_inmulmcol")) > 0) {
                    multiModuleId = module.attr("_inmulmcol")
                }
                Fai.top.$("module" + multiModuleId).attr("_mouseIn", 1);
                Site.removeModuleLayer("module" + multiModuleId);
                Site.removeShortcutLayer("module" + multiModuleId)
            }
            module.children(".mulColTabSortIcon").on("mouseover",
            function() {
                Site.addModuleLayer(id, moduleLayerList, 0);
                Site.addShortcutLayer(id, shortcutLayerList, directionList, 0)
            })
        } else {
            if (isFullmeasure) {
                module.children(".fullmeasureSortIcon").show()
            } else {
                Site.showModuleDragBtn(module);
                var draggableBtnMouseIn = module.children(".draggableBtn").attr("_mouseIn");
                if (inMultiModule) {
                    var multiModuleId = module.attr("_intab");
                    if (parseInt(module.attr("_inmulmcol")) > 0) {
                        multiModuleId = module.attr("_inmulmcol")
                    }
                    Fai.top.$("module" + multiModuleId).attr("_mouseIn", 1);
                    Site.removeModuleLayer("module" + multiModuleId);
                    Site.removeShortcutLayer("module" + multiModuleId);
                    $(".multiModuleLayer").remove();
                    $(".multiModuleShortcutLayer").remove()
                }
                Site.addModuleLayer(id, moduleLayerList, draggableBtnMouseIn);
                Site.addShortcutLayer(id, shortcutLayerList, directionList, draggableBtnMouseIn)
            }
        }
        if (isMultiModule) {
            module.children(".mulColTabSortIcon").removeAttr("style").css({
                right: 0
            }).show();
            if (module.attr("_inmulmcol") != 0 && module.hasClass("formStyle29")) {
                module.children(".mulColTabSortIcon").removeClass("rightSortIcon").addClass("mulColTabSortIcon2").removeAttr("style").css({
                    left: "0"
                }).show()
            }
            var thisIndex = module.css("z-index");
            if (thisIndex != "auto" && Fai.isNumber(thisIndex)) {
                module.find(".mulColTabSortIcon").css("z-index", parseInt(thisIndex) + 1)
            }
            module.find(".formBanner" + moduleId).on("mouseover",
            function() {
                Site.addModuleLayer(id, moduleLayerList, 0);
                Site.addShortcutLayer(id, shortcutLayerList, directionList, 0)
            });
            module.find("table.titleTable").on("mouseover",
            function() {
                Site.addModuleLayer(id, moduleLayerList, 0);
                Site.addShortcutLayer(id, shortcutLayerList, directionList, 0)
            });
            module.find("table.titleTable").find(".formTabButton").on("mouseover",
            function() {
                Fai.top.$("#module" + moduleId + "moduleLayer").css({
                    opacity: "0"
                });
                Fai.top.$("#module" + moduleId + "ShortcutLayer").css({
                    opacity: "0"
                })
            });
            module.find("table.titleTable").find(".formTabButton").on("mouseleave",
            function() {
                Fai.top.$("#module" + moduleId + "moduleLayer").css({
                    opacity: "1"
                });
                Fai.top.$("#module" + moduleId + "ShortcutLayer").css({
                    opacity: "1"
                })
            })
        }
        if (module.hasClass("ui-resizable")) {
            module.children(".J_resizableTip").show();
            if (module.children(".draggableBtn").attr("_mousein") != 1) {
                module.children(".J_resizableTip").css({
                    opacity: 1
                })
            }
        }
    }).mouseleave(function() {
        var module = $(this);
        var isFullmeasure = false;
        var inFullmeasure = false;
        var isMultiModule = false;
        var inMultiModule = false;
        var id = module.attr("id");
        var moduleId = id.replace("module", "");
        var _inFullmeasure = module.attr("_infullmeasure") || 0;
        var _inTab = module.attr("_intab") || 0;
        var _inMulCol = module.attr("_inmulmcol") || 0;
        if (module.hasClass("formStyle80")) {
            isFullmeasure = true
        }
        if (_inFullmeasure > 0) {
            inFullmeasure = true;
            Site.removeMoveFrame("module" + _inFullmeasure)
        }
        if (module.hasClass("formStyle35") || module.hasClass("formStyle29")) {
            isMultiModule = true
        }
        if (_inTab > 0) {
            inMultiModule = true;
            Site.removeMoveFrame("module" + _inTab)
        }
        if (_inMulCol > 0) {
            inMultiModule = true;
            Site.removeMoveFrame("module" + _inMulCol)
        }
        if (module.data("bottomLine") == 1) {
            Fai.top.$("#module" + moduleId + "moveFrameBottom").css({
                opacity: 1
            })
        }
        if (module.data("topLine") == 1) {
            Fai.top.$("#module" + moduleId + "moveFrameTop").css({
                opacity: 1
            })
        }
        if (module.data("leftLine") == 1) {
            Fai.top.$("#module" + moduleId + "moveFrameLeft").css({
                opacity: 1
            })
        }
        if (module.data("rightLine") == 1) {
            Fai.top.$("#module" + moduleId + "moveFrameRight").css({
                opacity: 1
            })
        }
        module.children(".ui-resizable-handle").hide();
        module.attr("_mouseIn", 0);
        if (!isFullmeasure) {
            if (isMultiModule) {
                setTimeout(function() {
                    if (module.attr("_mouseIn") != 1 && module.attr("_side") == 1) {
                        Site.removeOverlay();
                        Site.reSetSidePosition(module);
                        Site.removeMoveFrame(id)
                    }
                },
                50)
            }
            Site.removeModuleLayer(id);
            Site.removeShortcutLayer(id);
            if (Fai.top._canDesign) {
                module.children(".draggableBtn").remove()
            }
            var sideStatus = module.attr("_side");
            var flutterSwitch = module.attr("_flutterSwitch");
            if (flutterSwitch == "false" || !flutterSwitch) {
                Site.startFlutterInterval(module)
            }
            if (isMultiModule) {
                module.find(".mulColTabSortIcon").hide();
                module.find(".mulColTabSortIcon").removeClass("mulColTabSortIcon2");
                if (module.hasClass("formStyle29")) {
                    if (! (Fai.isIE6() || Fai.isIE7() || Fai.isIE8())) {
                        module.find(".mulColTabSortIcon").addClass("rightSortIcon")
                    }
                }
            }
        } else {
            Site.removeModuleLayer(id);
            module.children(".fullmeasureSortIcon").hide()
        }
        if (module.hasClass("ui-resizable")) {
            module.children(".J_resizableTip").hide()
        }
    }).delegate(".draggableBtn", "mouseover",
    function() {
        $(this).attr("_mouseIn", 1).stop(true).show();
        if ($(this).hasClass("formStyle35") || $(this).hasClass("formStyle29")) {
            Site.removeAllEditLayer()
        }
        $(this).siblings(".ui-resizable-handle").hide();
        $(this).siblings(".ui-resizable-cancelTip").css({
            opacity: 0
        });
        var module = Fai.top.$("#module" + moduleId);
        if (module.data("bottomLine") == 1) {
            Fai.top.$("#module" + moduleId + "moveFrameBottom").css({
                opacity: 1
            })
        }
        if (module.data("topLine") == 1) {
            Fai.top.$("#module" + moduleId + "moveFrameTop").css({
                opacity: 1
            })
        }
        if (module.data("leftLine") == 1) {
            Fai.top.$("#module" + moduleId + "moveFrameLeft").css({
                opacity: 1
            })
        }
        if (module.data("rightLine") == 1) {
            Fai.top.$("#module" + moduleId + "moveFrameRight").css({
                opacity: 1
            })
        }
    }).delegate(".draggableBtn", "mouseleave",
    function() {
        $(this).attr("_mouseIn", 0);
        $(this).siblings(".ui-resizable-handle").show();
        $(this).siblings(".ui-resizable-cancelTip").css({
            opacity: 1
        });
        var module = Fai.top.$("#module" + moduleId);
        if (module.data("bottomLine") == 1) {
            Fai.top.$("#module" + moduleId + "moveFrameBottom").css({
                opacity: 0
            })
        }
        if (module.data("topLine") == 1) {
            Fai.top.$("#module" + moduleId + "moveFrameTop").css({
                opacity: 0
            })
        }
        if (module.data("leftLine") == 1) {
            Fai.top.$("#module" + moduleId + "moveFrameLeft").css({
                opacity: 0
            })
        }
        if (module.data("rightLine") == 1) {
            Fai.top.$("#module" + moduleId + "moveFrameRight").css({
                opacity: 0
            })
        }
    }).delegate(".ui-resizable-handle, .ui-resizable-cancelTip", "mouseover",
    function() {
        var handle = $(this);
        handle.attr("_mousein", 1);
        setTimeout(function() {
            if (handle.attr("_mousein") == 1) {
                var thisModuleId = handle.attr("parentid");
                Fai.top.$("#" + thisModuleId + "moduleLayer").attr("canshow", 0).css({
                    opacity: 0
                });
                Fai.top.$("#" + thisModuleId + "ShortcutLayer").attr("canshow", 0).css({
                    opacity: 0
                });
                handle.siblings(".draggableBtn").hide()
            }
        },
        300)
    }).delegate(".ui-resizable-handle, .ui-resizable-cancelTip", "mouseleave",
    function() {
        var thisModuleId = $(this).attr("parentid");
        $(this).attr("_mousein", 0);
        Fai.top.$("#" + thisModuleId + "moduleLayer").attr("canshow", 1).show().css({
            opacity: 1
        });
        Fai.top.$("#" + thisModuleId + "ShortcutLayer").attr("canshow", 1).show().css({
            opacity: 1
        });
        $(this).siblings(".draggableBtn").show()
    });
    Site.bindGobalEvent("moduleInnerEdit",
    function(event, option) {
        Site.initModuleLayer.innerEdit = option
    })
};
Site.fixDragBtnPos = function(b) {
    var a = b.width() / 2 - 30;
    b.children(".draggableBtn").css("left", a + "px")
};
Site.addDragBtnHandle = function(d) {
    if (d.length > 0) {
        var a = Site.getDockStatus2(d.attr("id"));
        var b = "faiHandle";
        var c = "faiDraggableHandle";
        if (a != -1) {
            b = "faiDraggableHandle";
            c = "faiHandle"
        }
        if (d.hasClass("formStyle29")) {
            d.find(".J_tabHandle").addClass(b).removeClass(c)
        } else {
            if (d.hasClass("formStyle35")) {
                d.find(".J_multiHandle").addClass(b).removeClass(c)
            } else {
                if (d.hasClass("formStyle80")) {
                    d.find(".J_fullmeasureHandle").addClass(b).removeClass(c)
                } else {
                    d.children(".draggableBtn").find(".J_handle").addClass(b).removeClass(c)
                }
            }
        }
    }
};
Site.isLayoutHidden = function(b) {
    var c = false;
    for (var a = 0; a < Fai.top._displayLayoutList.length; ++a) {
        if (b == Fai.top._displayLayoutList[a]) {
            c = true;
            if (b == 1) {
                if (!Fai.top.$("#containerFormsLeft").is(":visible")) {
                    c = false
                }
            } else {
                if (b == 2) {
                    if (!Fai.top.$("#centerTopForms").is(":visible")) {
                        c = false
                    }
                } else {
                    if (b == 3) {
                        if (!Fai.top.$("#containerFormsRight").is(":visible")) {
                            c = false
                        }
                    } else {
                        if (b == 4) {
                            if (!Fai.top.$("#middleLeftForms").is(":visible")) {
                                c = false
                            }
                        } else {
                            if (b == 5) {
                                if (!Fai.top.$("#middleRightForms").is(":visible")) {
                                    c = false
                                }
                            } else {
                                if (b == 6) {
                                    if (!Fai.top.$("#centerBottomForms").is(":visible")) {
                                        c = false
                                    }
                                } else {
                                    if (b == 7) {
                                        if (!Fai.top.$("#topForms").is(":visible")) {
                                            c = false
                                        }
                                    } else {
                                        if (b == 8) {
                                            if (!Fai.top.$("#bottomForms").is(":visible")) {
                                                c = false
                                            }
                                        } else {
                                            if (b == 24) {
                                                if (!Fai.top.$("#fullmeasureTopForms").is(":visible")) {
                                                    c = false
                                                }
                                            } else {
                                                if (b == 25) {
                                                    if (!Fai.top.$("#fullmeasureBottomForms").is(":visible")) {
                                                        c = false
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            break
        }
    }
    return ! c
};
Site.showLayout = function(b) {
    if (b == 1) {
        Fai.top.$("#containerFormsLeft").show()
    } else {
        if (b == 2) {
            Fai.top.$("#centerTopForms").show()
        } else {
            if (b == 3) {
                Fai.top.$("#containerFormsRight").show()
            } else {
                if (b == 4) {
                    Fai.top.$("#middleLeftForms").show()
                } else {
                    if (b == 5) {
                        Fai.top.$("#middleRightForms").show()
                    } else {
                        if (b == 6) {
                            Fai.top.$("#centerBottomForms").show()
                        } else {
                            if (b == 7) {
                                Fai.top.$("#topForms").show()
                            } else {
                                if (b == 8) {
                                    Fai.top.$("#bottomForms").show()
                                } else {
                                    if (b == 24) {
                                        Fai.top.$("#fullmeasureTopForms").show()
                                    } else {
                                        if (b == 25) {
                                            Fai.top.$("#fullmeasureBottomForms").show()
                                        } else {
                                            return
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    var c = false;
    for (var a = 0; a < Fai.top._displayLayoutList.length; ++a) {
        if (b == Fai.top._displayLayoutList[a]) {
            c = true;
            break
        }
    }
    if (!c) {
        Fai.top._displayLayoutList.push(b)
    }
};
Site.hideLayout = function(b, c) {
    if (!c) {
        for (var a = 0; a < Fai.top._displayLayoutList.length; ++a) {
            if (b == Fai.top._displayLayoutList[a]) {
                Fai.top._displayLayoutList.splice(a, 1);
                break
            }
        }
    }
    if (b == 1) {
        Fai.top.$("#containerFormsLeft").hide()
    } else {
        if (b == 2) {
            Fai.top.$("#centerTopForms").hide()
        } else {
            if (b == 3) {
                Fai.top.$("#containerFormsRight").hide()
            } else {
                if (b == 4) {
                    Fai.top.$("#middleLeftForms").hide()
                } else {
                    if (b == 5) {
                        Fai.top.$("#middleRightForms").hide()
                    } else {
                        if (b == 6) {
                            Fai.top.$("#centerBottomForms").hide()
                        } else {
                            if (b == 7) {
                                Fai.top.$("#topForms").hide()
                            } else {
                                if (b == 8) {
                                    Fai.top.$("#bottomForms").hide()
                                } else {
                                    if (b == 24) {
                                        Fai.top.$("#fullmeasureTopForms").hide()
                                    } else {
                                        if (b == 25) {
                                            Fai.top.$("#fullmeasureBottomForms").hide()
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
};
Site.getLayoutForms = function(a) {
    arguments.callee._cache = arguments.callee._cache || {
        1 : "leftForms",
        2 : "centerTopForms",
        3 : "rightForms",
        4 : "middleLeftForms",
        5 : "middleRightForms",
        6 : "centerBottomForms",
        7 : "topForms",
        8 : "bottomForms",
        10 : "floatLeftTopForms",
        11 : "floatRightTopForms",
        12 : "floatLeftBottomForms",
        13 : "floatRightBottomForms",
        20 : "absForms",
        22 : "absTopForms",
        23 : "absBottomForms",
        24 : "fullmeasureTopForms",
        25 : "fullmeasureBottomForms"
    };
    return arguments.callee._cache[a] || ""
};
Site.getLayoutFormsById = function(a) {
    arguments.callee._cache = arguments.callee._cache || {
        leftForms: 1,
        centerTopForms: 2,
        rightForms: 3,
        middleLeftForms: 4,
        middleRightForms: 5,
        centerBottomForms: 6,
        topForms: 7,
        bottomForms: 8,
        floatLeftTopForms: 10,
        floatRightTopForms: 11,
        floatLeftBottomForms: 12,
        floatRightBottomForms: 13,
        absForms: 20,
        absTopForms: 22,
        absBottomForms: 23,
        fullmeasureTopForms: 24,
        fullmeasureBottomForms: 25
    };
    return arguments.callee._cache[a] || ""
};
Site.isLayoutEmpty = function(b) {
    var a = Site.getLayoutForms(b);
    if (a == "") {
        return true
    }
    return Fai.top.$("#" + a + " .form").length == 0
};
Site.getAppendLayoutForms = function(a) {
    var b = Fai.top._appendLayout;
    if (b == 24 || b == 25) {
        Site.showLayout(b);
        return Site.getLayoutForms(b)
    } else {
        if (Site.isLayoutHidden(b)) {
            if (!Site.isLayoutHidden(2)) {
                b = 2
            } else {
                if (!Site.isLayoutHidden(1)) {
                    b = 1
                } else {
                    if (!Site.isLayoutHidden(3)) {
                        b = 3
                    } else {
                        if (!Site.isLayoutHidden(4)) {
                            b = 4
                        } else {
                            if (!Site.isLayoutHidden(5)) {
                                b = 5
                            } else {
                                if (!Site.isLayoutHidden(6)) {
                                    b = 6
                                } else {
                                    if (!Site.isLayoutHidden(7)) {
                                        b = 7
                                    } else {
                                        if (!Site.isLayoutHidden(8)) {
                                            b = 8
                                        } else {
                                            b = -1
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if (b == -1 && !a) {
        return "absForms"
    } else {
        if (b == -1 && a) {
            return ""
        }
    }
    return Site.getLayoutForms(b)
};
Site.getAppendLayoutModule = function() {
    var a = null;
    if (Fai.top._appendModule > 0) {
        a = Fai.top.$("#module" + Fai.top._appendModule);
        if (a.length < 1) {
            a = null
        }
    }
    return a
};
Site.getLayoutPosition = function(a) {
    if (a == 1) {
        return "left"
    } else {
        if (a == 2) {
            return "center"
        } else {
            if (a == 3) {
                return "right"
            } else {
                return "center"
            }
        }
    }
};
Site.bindMousewheel = function() {
    if (typeof g_bindMousewheel == "undefined") {
        g_bindMousewheel = 1;
        $("body").bind("mousewheel",
        function() {
            Site.removeAllEditLayer();
            $(".msgBoardEditLayer").remove();
            if (Fai.isIE()) {
                $(".g_m_s_J").remove()
            }
        })
    }
};
Site.addCoverLayer = function(a, g) {
    if ($("#" + a).find("#" + a + "coverLayer").length < 1) {
        var e = $("#" + a);
        if (e.length <= 0 || e.css("display") == "none") {
            return
        }
        var f = "";
        var h = "button";
        if (g && g.length > 1) {
            g.reverse()
        }
        $.each(g,
        function(l, m) {
            if (m.type == "design") {
                if (m.display != "text") {
                    h = m.className;
                    f += "<a class='" + h + "' title='" + m.operationText + "' href='javascript:;' onclick=\"" + m.evalScript + ';return false;"></a>'
                } else {
                    f += "<a class='" + h + "' title='" + m.operationText + "' href='javascript:;' onclick=\"" + m.evalScript + ';return false;">' + m.operationText + "</a>"
                }
            }
        });
        if (f || f == "") {
            var i = '<div id="' + a + 'coverLayer" class="coverLayer" ></div>';
            i += '<div id="' + a + "Operation\" class='coverLayerOperation'>";
            i += f;
            i += "</div>";
            $(i).appendTo(e);
            var j = 0;
            var d = 0;
            var c = 0;
            var b = e.width() + j + d + c;
            if (b < 100) {
                b = 100
            }
            var k = e.height();
            if (k < 30) {
                k = 30
            }
            if (e.css("position") == "static") {
                $("#" + a + "coverLayer").css("left", e.position().left + Fai.getCssInt(e, "margin-left") + Fai.getCssInt(e, "padding-left"));
                $("#" + a + "coverLayer").css("top", e.position().top + Fai.getCssInt(e, "margin-top") + Fai.getCssInt(e, "padding-top"))
            }
            $("#" + a + "coverLayer").width(b);
            $("#" + a + "coverLayer").height(k)
        }
    }
};
Site.removeCoverLayer = function(a) {
    $("#" + a + "coverLayer").remove();
    $("#" + a + "Operation").remove()
};
Site.addMoveLayer = function(c) {
    var b = $("#" + c).find(".moveLayer");
    if (b.length < 1) {
        var d = $("#" + c);
        if (d.length <= 0 || d.css("display") == "none") {
            return
        }
        var a = "<div class='moveLayer'></div>";
        b = $(a);
        b.appendTo(d);
        b.height(d.height());
        b.mouseover(function() {
            $(this).attr("_mouseIn", 1)
        }).mouseleave(function() {
            $(this).attr("_mouseIn", 0);
            Site.removeMoveLayer(c)
        })
    } else {
        b.attr("_mouseIn", 1)
    }
};
Site.removeMoveLayer = function(a) {
    var b = $("#" + a).find(".moveLayer");
    b.attr("_mouseIn", 0);
    setTimeout("Site.removeMoveLayer_Internal('" + a + "')", 100)
};
Site.removeMoveLayer_Internal = function(a) {
    var b = $("#" + a).find("moveLayer");
    if (b.length >= 1) {
        if (b.attr("_mouseIn") != 1) {
            b.remove()
        }
    }
};
Site.addMoveFrame = function(a, j) {
    if (!Fai.isNull(Site._enableEditLayer) && !Site._enableEditLayer) {
        return
    }
    var e = $("#" + a);
    var h = false;
    var f = false;
    if (e.length <= 0 || e.css("display") == "none") {
        return
    }
    var k = false;
    if (e.hasClass("form")) {
        k = true
    }
    var i = true;
    var n = true;
    var d = true;
    var m = true;
    if (k) {
        if (e.hasClass("formStyle79")) {
            return
        }
        if (e.hasClass("formStyle81")) {
            return
        }
        if (e.hasClass("formStyle35") || e.hasClass("formStyle29")) {
            h = true
        } else {
            if (e.hasClass("formStyle80")) {
                f = true
            }
        }
        if (Site.getFlutterStatus2(a) == 0 || Site.getSideStatus(a) == 0 || Site.getLockStatus(a) == 0 || Site.getAbsStatus(a) == 0) {
            i = false;
            n = false;
            d = false;
            m = false
        } else {
            m = false;
            if (h) {
                m = true
            }
        }
        if (e.attr("_intab") > 0 || e.attr("_inmulmcol") > 0) {
            i = true;
            n = true;
            d = true;
            m = true
        }
    }
    var b = e.outerWidth() - 2;
    var l = e.outerHeight() - 2;
    var c = $("#" + a + "moveFrameLeft");
    if (c.length < 1) {
        var g = "<div id='" + a + "moveFrameLeft' class='moveFrame'></div>";
        c = $(g);
        c.appendTo("body");
        c.css("width", "0px");
        c.css("height", l + "px");
        c.css("left", e.offset().left);
        c.css("top", e.offset().top);
        if (Fai.isIE6() || Fai.isIE7()) {
            c.css("width", "1px");
            c.css("left", e.offset().left - 1)
        }
        c.css("background", "#FFF");
        c.css("border-left-width", "1px");
        if (h) {
            c.css("border-color", "#555")
        }
        c.css({
            opacity: i ? 1 : 0
        });
        if (!j) {
            c.mouseover(function() {
                $(this).attr("_mouseIn", 1)
            }).mouseleave(function() {
                $(this).attr("_mouseIn", 0)
            })
        }
    }
    var c = $("#" + a + "moveFrameRight");
    if (c.length < 1) {
        var g = "<div id='" + a + "moveFrameRight' class='moveFrame'></div>";
        c = $(g);
        c.appendTo("body");
        c.css("height", l + "px");
        c.css("left", e.offset().left + b + 1);
        c.css("top", e.offset().top);
        c.css("width", "0px");
        if (Fai.isIE6() || Fai.isIE7()) {
            c.css("width", "1px")
        }
        c.css("background", "#FFF");
        c.css("border-right-width", "1px");
        if (h) {
            c.css("border-color", "#555")
        }
        c.css({
            opacity: n ? 1 : 0
        });
        if (!j) {
            c.mouseover(function() {
                $(this).attr("_mouseIn", 1)
            }).mouseleave(function() {
                $(this).attr("_mouseIn", 0)
            })
        }
    }
    var c = $("#" + a + "moveFrameTop");
    if (c.length < 1) {
        var g = "<div id='" + a + "moveFrameTop' class='moveFrame'></div>";
        c = $(g);
        c.appendTo("body");
        c.css("left", e.offset().left);
        c.css("top", e.offset().top);
        c.css("width", b + "px");
        c.css("height", "0px");
        if (Fai.isIE6() || Fai.isIE7()) {
            c.css("height", "1px");
            c.css("top", e.offset().top - 1)
        }
        c.css("background", "#FFF");
        c.css("border-top-width", "1px");
        if (h) {
            c.css("border-color", "#555")
        }
        c.css({
            opacity: d ? 1 : 0
        });
        if (!j) {
            c.mouseover(function() {
                $(this).attr("_mouseIn", 1)
            }).mouseleave(function() {
                $(this).attr("_mouseIn", 0)
            })
        }
    }
    var c = $("#" + a + "moveFrameBottom");
    if (c.length < 1) {
        var g = "<div id='" + a + "moveFrameBottom' class='moveFrame'></div>";
        c = $(g);
        c.appendTo("body");
        c.css("width", b + "px");
        c.css("height", "0px");
        if (Fai.isIE6() || Fai.isIE7()) {
            c.css("height", "1px")
        }
        c.css("left", e.offset().left);
        c.css("top", e.offset().top + l + 1);
        c.css("background", "#FFF");
        c.css("border-bottom-width", "1px");
        if (h) {
            c.css("border-color", "#555")
        }
        c.css({
            opacity: m ? 1 : 0
        });
        if (!j) {
            c.mouseover(function() {
                $(this).attr("_mouseIn", 1)
            }).mouseleave(function() {
                $(this).attr("_mouseIn", 0)
            })
        }
    }
};
Site.removeMoveFrame = function(a) {
    $("#" + a + "moveFrameLeft").remove();
    $("#" + a + "moveFrameRight").remove();
    $("#" + a + "moveFrameTop").remove();
    $("#" + a + "moveFrameBottom").remove()
};
Site.addEditLayer = function(objId, editJson, positionMode, options) {
    var moduleId = $(objId).parents(".form").attr("id");
    if (!Fai.isNull(Site._enableEditLayer) && !Site._enableEditLayer) {
        return
    }
    if (!options) {
        options = {}
    }
    var extId = "";
    if (!Fai.isNull(options.extId)) {
        extId = options.extId
    }
    var extCls = "";
    if (!Fai.isNull(options.extCls)) {
        extCls = options.extCls
    }
    if (options.fromEditLayer) {
        Site.addMoveFrame(objId, options.fromEditLayer)
    }
    var obj = null;
    if (typeof objId == "object") {
        if (objId.length == 1) {
            obj = objId
        } else {
            obj = $(objId)
        }
        objId = obj.attr("id");
        if (typeof objId == "undefined") {
            objId = obj.parents("div").first().attr("id")
        }
    } else {
        obj = $("#" + objId)
    }
    Site.triggerGobalEvent("moduleInnerEdit", true);
    var layerId = objId + "editLayer" + extId;
    if ($("#" + layerId).length < 1) {
        var html = "";
        var tipsText = "";
        var tipsTarget = "";
        var tipsFlag = "";
        $.each(editJson,
        function(i, n) {
            var statusScript = n.statusScript;
            var text = n.operationText;
            var className = n.className;
            var status = 0;
            var extScript = "Site.removeAllEditLayer();return false;";
            var id = n.id;
            if (statusScript) {
                status = eval(statusScript);
                text = n["operationText" + status];
                className = n["className" + status]
            }
            if (n.tipText && n.tipFlag && !Site.getCookieFlag(n.tipFlag)) {
                tipsText = n.tipText;
                if (id) {
                    tipsTarget = id
                } else {
                    tipsTarget = layerId + className;
                    id = layerId + className
                }
                tipsFlag = n.tipFlag;
                extScript = "Site.setCookieFlag(" + n.tipFlag + ", true);" + extScript
            }
            if (status != -1) {
                if (n.display != "text") {
                    if (id) {
                        if (extScript) {
                            html += "<a id='" + id + "' class='" + className + "' title='" + text + "' href='javascript:;' onclick=\"" + n.evalScript + ";" + extScript + '"></a>'
                        } else {
                            html += "<a id='" + id + "' class='" + className + "' title='" + text + "' href='javascript:;' onclick=\"" + n.evalScript + ';Site.removeAllEditLayer();return false;"></a>'
                        }
                    } else {
                        html += "<a class='" + className + "' title='" + text + "' href='javascript:;' onclick=\"" + n.evalScript + ";" + extScript + '"></a>'
                    }
                } else {
                    className = "button";
                    title = n.operationTitle;
                    if (n.judge && n.judge == "banner") {
                        if (top._bannerData.s == 3) {
                            className += " disabledBtn"
                        }
                    }
                    if (!title) {
                        title = ""
                    }
                    if (id) {
                        if (extScript) {
                            html += "<a id='" + id + "' class='" + className + "' title='" + title + "' href='javascript:;' onclick=\"" + n.evalScript + ";" + extScript + '">' + text + "</a>"
                        } else {
                            html += "<a id='" + id + "' class='" + className + "' title='" + title + "' href='javascript:;' onclick=\"" + n.evalScript + ';Site.removeAllEditLayer();return false;">' + text + "</a>"
                        }
                    } else {
                        html += "<a class='" + className + "' title='" + title + "' href='javascript:;' onclick=\"" + n.evalScript + ";" + extScript + '">' + text + "</a>"
                    }
                }
                if (i < editJson.length - 1) {
                    var tmpHrClass = "";
                    if (n.judge && n.judge == "banner") {
                        if (top._bannerData.s == 3) {
                            tmpHrClass += " disabledBtn"
                        }
                    }
                    html += "<div class='itemHr " + tmpHrClass + "'></div>"
                }
            }
        });
        if (html) {
            var className = "editLayer";
            if (positionMode == 7) {
                className += " editLayerV"
            }
            if (extCls) {
                className += " " + extCls
            }
            var html2 = "<div id='" + layerId + "' class='" + className + "'>";
            html2 += "	<div class='tools'>";
            html2 += html;
            html2 += "	</div>";
            html2 += "</div>";
            var div = $(html2);
            div.appendTo("body");
            div.attr("ancestorModule", moduleId);
            if (positionMode == 1) {
                div.css("margin", 0);
                div.css("left", obj.offset().left + obj.width() - div.width());
                div.css("top", obj.offset().top)
            } else {
                if (positionMode == 2) {
                    div.css("margin", 0);
                    div.css("left", obj.offset().left);
                    div.css("top", obj.offset().top + obj.height() - div.height())
                } else {
                    if (positionMode == 3) {
                        div.css("margin", 0);
                        if (obj.width() > 1000) {
                            div.css("left", (obj.width() - 960) / 2)
                        } else {
                            div.css("left", obj.offset().left)
                        }
                        div.css("top", obj.offset().top)
                    } else {
                        if (positionMode == 4) {
                            div.css("margin", 0);
                            div.css("left", obj.offset().left);
                            div.css("top", obj.offset().top - div.height())
                        } else {
                            if (positionMode == 5) {
                                div.css("margin", 0);
                                div.css("left", obj.offset().left + obj.width() - div.width() - 2);
                                div.css("top", obj.offset().top);
                                if (div.height() + 10 >= obj.height()) {
                                    div.css("top", obj.offset().top - div.height())
                                }
                            } else {
                                if (positionMode == 6) {
                                    div.css("margin", 0);
                                    div.css("left", obj.offset().left + obj.width() - div.width() - 3);
                                    div.css("top", obj.offset().top + obj.height() - div.height() - 4)
                                } else {
                                    if (positionMode == 7) {
                                        div.css("margin", 0);
                                        div.css("left", obj.offset().left - div.width() - 1);
                                        div.css("top", obj.offset().top)
                                    } else {
                                        if (positionMode == 8) {
                                            div.css("margin", 0);
                                            div.css("left", obj.offset().left + (obj.width() - div.width()) / 2);
                                            div.css("top", obj.offset().top - div.height() - 1)
                                        } else {
                                            if (positionMode == 9) {
                                                div.css("margin", 0);
                                                div.css("left", obj.offset().left + obj.width() - div.width());
                                                div.css("top", obj.offset().top + obj.height())
                                            } else {
                                                if (positionMode == 100) {
                                                    div.css("margin", 0);
                                                    div.css("left", obj.offset().left + obj.width() - div.width() - 35);
                                                    div.css("top", obj.offset().top)
                                                } else {
                                                    if (positionMode == 106) {
                                                        div.css("margin", 0);
                                                        var imgPdPoBorderTop = $("<div id='" + objId + "imgPdPoBorderTop' class='img_ProductPhoto_TB_Border'></div>");
                                                        var imgPdPoBorderBottom = $("<div id='" + objId + "imgPdPoBorderBottom' class='img_ProductPhoto_TB_Border'></div>");
                                                        var imgPdPoBorderLeft = $("<div id='" + objId + "imgPdPoBorderLeft' class='img_ProductPhoto_LR_Border'></div>");
                                                        var imgPdPoBorderRight = $("<div id='" + objId + "imgPdPoBorderRight' class='img_ProductPhoto_LR_Border'></div>");
                                                        imgPdPoBorderTop.appendTo("body");
                                                        imgPdPoBorderBottom.appendTo("body");
                                                        imgPdPoBorderLeft.appendTo("body");
                                                        imgPdPoBorderRight.appendTo("body");
                                                        $(div.find(".tools").find("a").eq(0)).before('<div class="itemHr"></div>');
                                                        var imgBorderWidth = "";
                                                        var imgBorderHeight = "";
                                                        var editLayerWidth = "";
                                                        var imgWidth = "";
                                                        var imgHeight = "";
                                                        if (obj.hasClass("formTable")) {
                                                            var doubleListPicWidth = obj.find(".imgDiv").eq(0);
                                                            imgBorderWidth = doubleListPicWidth.width();
                                                            imgBorderHeight = doubleListPicWidth.height();
                                                            editLayerWidth = doubleListPicWidth.width();
                                                            imgWidth = doubleListPicWidth.width();
                                                            imgHeight = doubleListPicWidth.height();
                                                            imgPdPoBorderTop.width(imgBorderWidth);
                                                            imgPdPoBorderBottom.width(imgBorderWidth);
                                                            imgPdPoBorderLeft.height(imgBorderHeight);
                                                            imgPdPoBorderRight.height(imgBorderHeight);
                                                            imgPdPoBorderTop.css("left", Math.round(obj.offset().left));
                                                            imgPdPoBorderBottom.css("left", Math.round(obj.offset().left));
                                                            imgPdPoBorderLeft.css("left", Math.round(obj.offset().left));
                                                            imgPdPoBorderRight.css("left", Math.round(obj.offset().left + imgBorderWidth));
                                                            imgPdPoBorderTop.css("top", Math.round(obj.offset().top - 1));
                                                            imgPdPoBorderBottom.css("top", Math.round(obj.offset().top + imgBorderHeight - 1));
                                                            imgPdPoBorderLeft.css("top", Math.round(obj.offset().top - 1));
                                                            imgPdPoBorderRight.css("top", Math.round(obj.offset().top - 1));
                                                            div.css("margin", 0);
                                                            div.css("left", Math.round(obj.offset().left));
                                                            div.css("top", Math.round(obj.offset().top + imgHeight - div.height() - 2));
                                                            div.css("width", editLayerWidth - 1);
                                                            div.find(".tools").css("float", "right")
                                                        } else {
                                                            imgBorderWidth = obj.outerWidth();
                                                            imgBorderHeight = obj.outerHeight();
                                                            editLayerWidth = obj.outerWidth() - 2;
                                                            imgWidth = obj.outerWidth();
                                                            imgHeight = obj.outerHeight();
                                                            imgPdPoBorderTop.width(imgBorderWidth);
                                                            imgPdPoBorderBottom.width(imgBorderWidth);
                                                            imgPdPoBorderLeft.height(imgBorderHeight);
                                                            imgPdPoBorderRight.height(imgBorderHeight);
                                                            imgPdPoBorderTop.css("left", Math.round(obj.offset().left));
                                                            imgPdPoBorderBottom.css("left", Math.round(obj.offset().left));
                                                            imgPdPoBorderLeft.css("left", Math.round(obj.offset().left));
                                                            imgPdPoBorderRight.css("left", Math.round(obj.offset().left + imgBorderWidth - 1));
                                                            imgPdPoBorderTop.css("top", Math.round(obj.offset().top));
                                                            imgPdPoBorderBottom.css("top", Math.round(obj.offset().top + imgBorderHeight - 1));
                                                            imgPdPoBorderLeft.css("top", Math.round(obj.offset().top));
                                                            imgPdPoBorderRight.css("top", Math.round(obj.offset().top));
                                                            div.css("margin", 0);
                                                            div.css("left", Math.round(obj.offset().left));
                                                            div.css("top", Math.round(obj.offset().top + imgHeight - div.height() - 2));
                                                            div.css("width", editLayerWidth);
                                                            div.find(".tools").css("float", "right")
                                                        }
                                                    } else {
                                                        div.css("margin", 0);
                                                        div.css("left", obj.offset().left + obj.width() - div.width());
                                                        div.css("top", obj.offset().top - div.height() - 1)
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            var minTop = 0,
            maxTop = document.documentElement.clientHeight;
            if ($("#web").length > 0) {
                minTop = $("#web").offset().top
            }
            if (div.offset().top <= minTop) {
                if (typeof positionMode == "undefined" || positionMode == 0 || positionMode == 5) {
                    div.css("top", obj.offset().top + obj.height())
                } else {
                    if (positionMode == 4) {
                        if (obj.height() < div.height() * 4) {
                            div.css("top", obj.offset().top + obj.height())
                        } else {
                            div.css("top", minTop + "px")
                        }
                    } else {
                        div.css("top", minTop + "px")
                    }
                }
            }
            if ((div.offset().top + div.height()) >= maxTop) {
                if (positionMode == 9) {
                    div.css("top", obj.offset().top - div.height())
                }
            }
            if (div.offset().left <= 0) {
                div.css("left", 0)
            }
            if (tipsTarget) {
                if (!Site.getCookieFlag(tipsFlag)) {
                    Fai.showTip({
                        id: layerId + "tips",
                        tid: "#" + tipsTarget,
                        content: tipsText,
                        closeSwitch: false,
                        mode: "bottom",
                        cls: "editLayerTips",
                        beforeClose: function() {
                            if (Site.getCookieFlag(tipsFlag)) {
                                Site.setCookieFlag(tipsFlag, true)
                            }
                        }
                    })
                }
            }
            div.mouseover(function() {
                $(this).attr("_mouseIn", 1);
                var moduleId = $(this).attr("ancestorModule");
                if (moduleId) {
                    var module = $("#" + moduleId);
                    var sideStatus = module.attr("_side");
                    if (sideStatus == 2) {
                        Site.stopFlutterInterval(module)
                    }
                    var parentId = module.parent().attr("id");
                    if (parentId == "floatLeftTopForms" || parentId == "floatLeftBottomForms") {
                        Site.triggerGobalEvent("moduleInnerEdit", true);
                        module.mouseenter()
                    } else {
                        if (parentId == "floatRightTopForms" || parentId == "floatRightBottomForms") {
                            Site.triggerGobalEvent("moduleInnerEdit", true);
                            module.mouseenter()
                        }
                    }
                }
            });
            if (positionMode != 106) {
                div.mouseleave(function() {
                    $(this).attr("_mouseIn", 0);
                    Site.removeEditLayer(objId, extId)
                })
            } else {
                div.mouseleave(function() {
                    $(this).attr("_mouseIn", 0);
                    Site.removeEditLayer(objId, extId, 106)
                })
            }
            Site.bindMousewheel();
            return div
        }
    } else {
        var div = $("#" + layerId);
        div.attr("_mouseIn", 1);
        return div
    }
};
Site.removeEditLayer = function(c, b, a) {
    var d = null;
    if (!b) {
        b = ""
    }
    if (typeof c == "object") {
        if (c.length == 1) {
            d = c
        } else {
            d = $(c)
        }
        c = d.attr("id")
    } else {
        d = $("#" + c)
    }
    var e = $("#" + c + "editLayer" + b);
    e.attr("_mouseIn", 0);
    Site.triggerGobalEvent("moduleInnerEdit", false);
    if (a == 106) {
        setTimeout("Site.removeEditLayer_Internal('" + c + "','" + b + "',106)", 100)
    } else {
        setTimeout("Site.removeEditLayer_Internal('" + c + "','" + b + "')", 100)
    }
};
Site.removeEditLayer_Internal = function(b, e, f) {
    var g = b + "editLayer" + e;
    var a = $("#" + g);
    var h = $("#" + b + "moveFrameLeft");
    var c = $("#" + b + "moveFrameRight");
    var i = $("#" + b + "moveFrameTop");
    var d = $("#" + b + "moveFrameBottom");
    if (a.length == 1) {
        if (a.attr("_mouseIn") != 1) {
            if (h.length == 1) {
                if (h.attr("_mouseIn") == 1 || c.attr("_mouseIn") == 1 || i.attr("_mouseIn") == 1 || d.attr("_mouseIn") == 1) {
                    return
                }
                setTimeout("Site.removeMoveFrame('" + b + "')", 100)
            }
            if (f == 106) {
                a.remove();
                $("#" + b + "imgPdPoBorderTop").remove();
                $("#" + b + "imgPdPoBorderBottom").remove();
                $("#" + b + "imgPdPoBorderLeft").remove();
                $("#" + b + "imgPdPoBorderRight").remove()
            } else {
                a.remove()
            }
            $("#" + g + "tips").remove()
        }
    }
};
Site.removeAllEditLayer = function() {
    Site.removeDesignEditLayer();
    Site.removeAllDataEditLayer()
};
Site.removeAllDataEditLayer = function() {
    $(".img_ProductPhoto_LR_Border").remove();
    $(".img_ProductPhoto_TB_Border").remove();
    $(".editLayer").remove()
};
Site.removeDesignEditLayer = function() {
    $(".moveFrame").remove();
    $(".moduleLayer").remove();
    $(".flutterLayer").remove();
    $(".editLayerTips").remove();
    $(".shortcutLayer").remove();
    $(".fk-moduleToolbar").remove()
};
Site.disableEditLayer = function() {
    Site._enableEditLayer = false;
    Site.removeAllEditLayer()
};
Site.enableEditLayer = function() {
    Site._enableEditLayer = true
};
Site.addModuleLayer = function(objId, editJson, draggableBtnMouseIn) {
    var draggableBtnMouseIn = draggableBtnMouseIn;
    if (!Fai.isNull(Site._enableEditLayer) && !Site._enableEditLayer) {
        Site.replaceDocumentwrite(Fai.top.$("#" + objId));
        return
    }
    var obj = $("#" + objId);
    var isMultiModule = false;
    if (obj.hasClass("formStyle35") || obj.hasClass("formStyle29") || obj.hasClass("formStyle80")) {
        isMultiModule = true
    }
    var layerId = objId + "moduleLayer";
    if ($("#" + layerId).length < 1) {
        var html = new Array();
        var extLayerClass = "";
        if (isMultiModule) {
            extLayerClass = "multiModuleLayer"
        }
        html.push("<div id='" + layerId + "' class='moduleLayer " + extLayerClass + "'>");
        var tipsText = "";
        var tipsTarget = "";
        var tipsFlag = "";
        var pedometer = [];
        $.each(editJson,
        function(i, n) {
            var statusScript = n.statusScript;
            var status = 0;
            if (statusScript) {
                status = eval(statusScript)
            }
            if (status == -1) {
                return true
            }
            var text = n.text;
            var title = n.title;
            var menu = n.menu;
            var className = "item";
            if (n.className) {
                className += " " + n.className
            }
            if (menu) {
                var tmp_num = 0;
                for (var x = 0; x < menu.length; x++) {
                    var data = menu[x];
                    var statusScript = data.statusScript;
                    data.status = 0;
                    if (statusScript) {
                        data.status = eval(statusScript)
                    }
                    if (data.status != -1) {
                        if (data.hrLine) {
                            continue
                        }
                        tmp_num += 1
                    }
                }
                if (tmp_num < 1) {
                    return true
                }
            }
            var extScript = "Site.removeAllEditLayer();return false;";
            var id = n.id;
            if (id == null) {
                id = layerId + "item" + i
            }
            var tipScript = "";
            if (n.tipText && n.tipFlag && !Site.getCookieFlag(n.tipFlag)) {
                tipsText = n.tipText;
                tipsFlag = n.tipFlag;
                tipsTarget = id;
                tipScript = "Site.setCookieFlag(" + n.tipFlag + ", true);"
            }
            var onclick;
            if (menu) {
                if (n.log > 0) {
                    onclick = "Site.logClick(" + n.log + ");"
                } else {
                    onclick = ""
                }
                onclick += "Site.showModuleLayerMenu('" + layerId + "', '" + id + "');" + tipScript + ";return false;"
            } else {
                onclick = n.evalScript + ";" + tipScript + extScript
            }
            html.push("<div class='" + className + "'>");
            html.push("<a hidefocus='true' id='" + id + "' class='tool " + (n.toolClass ? n.toolClass: "") + "' ");
            if (title) {
                html.push("title='" + title + "' ")
            }
            if (n.toolDisplay == "toolIcon") {
                html.push("href='javascript:;' onclick=\"" + onclick + '">&nbsp;</a>')
            } else {
                html.push("href='javascript:;' onclick=\"" + onclick + '">' + text + "</a>")
            }
            if (menu) {
                html.push("<div id='" + id + "menu' class='menu'>");
                for (var x = 0; x < menu.length; x++) {
                    var data = menu[x];
                    var statusScript = data.statusScript;
                    data.status = 0;
                    if (statusScript) {
                        data.status = eval(statusScript)
                    }
                }
                for (var x = 0; x < menu.length; ++x) {
                    var data = menu[x];
                    if (data.hrLine) {
                        for (var y = x + 1; y < menu.length; y++) {
                            var dataAfter = menu[y];
                            if (!dataAfter.hrLine && dataAfter.status != -1) {
                                html.push('<div class="hrLine"></div>');
                                break
                            }
                        }
                        continue
                    }
                    var iconClass = "menuIcon";
                    if (data.iconClass) {
                        iconClass += " " + data.iconClass
                    }
                    var text = data.text;
                    var title = data.title;
                    var status = data.status;
                    if (status == -1) {
                        continue
                    }
                    if (data["text" + status]) {
                        text = data["text" + status]
                    }
                    if (data["iconClass" + status]) {
                        iconClass += " " + data["iconClass" + status]
                    }
                    if (data["title" + status]) {
                        title = data["title" + status]
                    }
                    var onclick = data.evalScript + ";Site.removeAllEditLayer();return false;";
                    html.push("<a hidefocus='true' class='menuItem' href='javascript:;' ");
                    if (title) {
                        html.push("title='" + title + "' ")
                    }
                    html.push('onclick="' + onclick + '">');
                    html.push("<span class='" + iconClass + "'></span>");
                    html.push("<span class='menuText'>");
                    html.push(text);
                    html.push("</span>");
                    html.push("</a>")
                }
                html.push("</div>")
            }
            html.push("</div>");
            pedometer.push(html.length)
        });
        if (pedometer.length > 1) {
            for (var i = 0,
            len = pedometer.length - 1; i < len; i++) {
                html.splice(pedometer[i] + i, 0, '<div class="itemHr"></div>')
            }
        }
        if (html) {
            html.push("</div>");
            var div = $(html.join(""));
            div.appendTo("body");
            div.css("margin", 0);
            var objWidth = obj.outerWidth() - 2;
            if (obj.offset().left + obj.width() >= Fai.top.document.documentElement.clientWidth - 20) {
                div.css("left", Fai.top.document.documentElement.clientWidth - 20 - div.width())
            } else {
                if (obj.offset().left + objWidth - div.width() <= 0) {
                    div.css("left", 0)
                } else {
                    if (obj.attr("_inmulmcol") > 0 || obj.attr("_intab") > 0) {
                        div.css("left", obj.offset().left)
                    } else {
                        div.css("left", obj.offset().left + objWidth - div.width())
                    }
                }
            }
            var divTop = (obj.offset().top - div.height() - 1);
            if (divTop < $("#web").offset().top) {
                div.addClass("moduleLayerBottom");
                divTop = obj.offset().top + obj.height()
            }
            div.css("top", divTop + "px");
            if (isMultiModule) {
                if (Fai.isIE6() || Fai.isIE7()) {
                    div.css("top", (divTop - 2) + "px")
                } else {
                    div.css("top", (divTop - 1) + "px")
                }
            }
            if (tipsTarget) {
                if (!Site.getCookieFlag(tipsFlag)) {
                    Fai.showTip({
                        id: layerId + "tips",
                        tid: "#" + tipsTarget,
                        content: tipsText,
                        closeSwitch: false,
                        mode: "bottom",
                        cls: "editLayerTips",
                        beforeClose: function() {
                            if (Site.getCookieFlag(tipsFlag)) {
                                Site.setCookieFlag(tipsFlag)
                            }
                        }
                    })
                }
            }
            div.mouseover(function() {
                $(this).attr("_mouseIn", 1);
                $(this).attr("_realmousein", 1);
                var id = $(this).attr("id").replace(/moduleLayer/g, "");
                var module = $("#" + id);
                Site.stopFlutterInterval(module);
                $("#" + objId + "ShortcutLayer").hide();
                var multiModuleId = module.attr("_intab");
                if (parseInt(module.attr("_inmulmcol")) > 0) {
                    multiModuleId = module.attr("_inmulmcol")
                }
                if (obj.hasClass("formStyle29") || obj.hasClass("formStyle35")) {
                    multiModuleId = obj.attr("id").replace("module", "")
                }
                if (multiModuleId != 0) {
                    Fai.top.$("#module" + multiModuleId).attr("_mouseIn", 1)
                }
            });
            div.mouseleave(function() {
                var id = $(this).attr("id").replace(/moduleLayer/g, "");
                $(this).attr("_mouseIn", 0);
                $(this).attr("_realmousein", 0);
                var module = $("#" + id);
                var sideStatus = module.attr("_side");
                var flutterSwitch = module.attr("_flutterSwitch");
                if (flutterSwitch == "false" || !flutterSwitch) {
                    Site.startFlutterInterval(module)
                }
                Site.removeAllEditLayer();
                var multiModuleId = module.attr("_intab");
                if (parseInt(module.attr("_inmulmcol")) > 0) {
                    multiModuleId = module.attr("_inmulmcol")
                }
                if (obj.hasClass("formStyle29") || obj.hasClass("formStyle35")) {
                    multiModuleId = obj.attr("id").replace("module", "")
                }
                if (multiModuleId != 0) {
                    Fai.top.$("#module" + multiModuleId).attr("_mouseIn", 0)
                }
            });
            Site.bindMousewheel();
            $.each(editJson,
            function(i, n) {
                var menu = n.menu;
                var id = n.id;
                if (id == null) {
                    id = layerId + "item" + i
                }
                if (typeof menu !== "undefined" && menu.length > 0) {
                    $("#" + id).on("mouseenter",
                    function() {
                        var firstClick = $("#" + layerId).data("firstClick");
                        if (firstClick) {
                            var menu = $("#" + id + "menu");
                            if (menu.length > 0 && menu.css("display") != "none") {
                                return
                            }
                            Site.showModuleLayerMenu(layerId, id)
                        }
                    })
                }
            });
            return div
        }
    } else {
        var div = $("#" + layerId);
        div.attr("_mouseIn", 1);
        if (!div.hasClass("multiModuleLayer")) {
            var $btn = $(".draggableBtn");
            var tmpTimer = setInterval(function() {
                draggableBtnMouseIn = $btn.attr("_mouseIn")
            },
            20);
            clearTimeout(Site.addModuleLayer.timer);
            var timer = setTimeout(function() {
                clearInterval(tmpTimer);
                var $layer = Fai.top.$("#" + objId + "ShortcutLayer");
                if (typeof draggableBtnMouseIn != "undefined" && draggableBtnMouseIn != 1 && $layer.attr("_realmousein") != 1 && $layer.attr("canshow") != 0 && Site.initModuleLayer.innerEdit != true) {
                    div.stop(true).css("opacity", "1").show()
                } else {
                    div.find(".menu").hide();
                    div.stop(true).fadeOut()
                }
            },
            300);
            Site.addModuleLayer.timer = timer
        } else {
            if (typeof draggableBtnMouseIn != "undefined" && draggableBtnMouseIn != 1) {
                div.show()
            } else {
                div.find(".menu").hide();
                div.hide()
            }
        }
        return div
    }
};
Site.showModuleLayerMenu = function(a, i, c) {
    var h = $("#" + i + "menu");
    if (h.length > 0 && h.css("display") != "none") {
        h.hide();
        return
    }
    Fai.top.$(".moduleLayer .menu").hide();
    Fai.top.$(".moduleLayer .item").removeClass("itemOn");
    var b = Fai.top.$(document).height();
    var f = $("#" + a).height();
    h.show();
    if (h.offset().top + h.height() > b) {
        h.css("top", (h.position().top - h.height() - f - 4) + "px");
        h.addClass("menuBottom")
    }
    Fai.top.$("#" + i).parent().addClass("itemOn");
    $("#" + a).data("firstClick", true);
    try {
        var g = parseInt(i.replace(a + "item", ""));
        if (g == 0) {
            Site.logDog(100045, 1)
        } else {
            if (g == 1) {
                Site.logDog(100045, 2)
            }
        }
    } catch(d) {}
};
Site.removeModuleLayer = function(a) {
    var b = $("#" + a);
    var c = $("#" + a + "moduleLayer");
    c.attr("_mouseIn", 0);
    setTimeout("Site.removeModuleLayer_Internal('" + a + "')", 100)
};
Site.removeModuleLayer_Internal = function(b) {
    var g = b + "moduleLayer";
    var i = b + "ShortcutLayer";
    var a = $("#" + g);
    var j = $("#" + b + "moveFrameLeft");
    var e = $("#" + b + "moveFrameRight");
    var k = $("#" + b + "moveFrameTop");
    var f = $("#" + b + "moveFrameBottom");
    var c = $("#" + i);
    if (a.length == 1) {
        if (a.attr("_mouseIn") != 1 && j.attr("_mouseIn") != 1 && e.attr("_mouseIn") != 1 && k.attr("_mouseIn") != 1 && f.attr("_mouseIn") != 1 && c.attr("_mouseIn") != 1) {
            setTimeout("Site.removeMoveFrame('" + b + "')", 100);
            a.remove();
            c.remove();
            $("#" + g + "tips").remove();
            var h = $("#" + b);
            var d = h.attr("_side");
            if (d == 1) {
                Site.reSetSidePosition(h)
            }
        }
    }
};
Site.getLayoutItemStatus = function(d) {
    var c = parseInt($("#" + d).attr("_intab"));
    var a = parseInt($("#" + d).attr("_inmulmcol"));
    var b = parseInt($("#" + d).attr("_infullmeasure"));
    if (c > 0 || a > 0 || b > 0) {
        return - 1
    } else {
        return 0
    }
};
Site.flutterSetStartLocation = function(b) {
    var e = b;
    var a = $("#" + e);
    Site.refreshAbsFloatForm(a);
    var f = a.position().left;
    var d = a.position().top;
    a.data("startFlutterXPos", f);
    a.data("startFlutterYPos", d);
    a.data("startFlutterParentId", a.parent().attr("id"));
    var c = a.attr("_flutterSwitch");
    if (c == "false" || !c) {
        Site.startFlutterInterval(a)
    }
    Fai.top._moduleMoved++;
    Site.styleChanged()
};
Site.flutterStopSwitch = function(d) {
    var g = d;
    var c = $("#" + g);
    var f = c.attr("_flutterSwitch");
    if (f == "true") {
        c.attr("_flutterSwitch", false);
        Site.removeAllEditLayer();
        Site.flutterStart(c, true)
    } else {
        c.attr("_flutterSwitch", true);
        var e = c.data("startFlutterXPos");
        var b = c.data("startFlutterYPos");
        var a = c.parent().attr("id");
        var h = c.data("startFlutterParentId");
        if (a != h) {
            c.appendTo("#" + h)
        }
        c.css("left", e);
        c.css("top", b);
        c.data("flutterXPos", c.offset().left);
        c.data("flutterYPos", c.offset().top);
        Site.removeAllEditLayer()
    }
};
Site.addShortcutLayer = function(objId, shortcutLayerList, directionList, draggableBtnMouseIn) {
    if (!Fai.isNull(Site._enableEditLayer) && !Site._enableEditLayer) {
        return
    }
    var layerId = objId + "ShortcutLayer";
    var moduleLayerId = objId + "moduleLayer";
    var obj = $("#" + objId);
    var inMultiModule = false;
    if (obj.attr("_inmulmcol") > 0 || obj.attr("_intab") > 0) {
        inMultiModule = true
    }
    var inFullmeasure = false;
    if (obj.attr("_infullmeasure") > 0) {
        inFullmeasure = true
    }
    var isFullmeasure = false;
    if (obj.hasClass("formStyle80")) {
        isFullmeasure = true
    }
    var isMultiModule = false;
    var multiModuleClass = "";
    if (obj.hasClass("formStyle35") || obj.hasClass("formStyle29")) {
        isMultiModule = true;
        multiModuleClass = "multiModuleShortcutLayer"
    }
    var id = objId.replace(/\D/gi, "");
    var moudleAttr = Site.getModuleAttrPattern(id);
    var needResetTB = false;
    if (moudleAttr.border.y === 1 && moudleAttr.bannerType === 1 && moudleAttr.contentBg.y === 1) {
        needResetTB = true
    }
    if ($("#" + layerId).length < 1) {
        var html = new Array();
        html.push("<div id='" + layerId + "' class='shortcutLayer " + multiModuleClass + "'>");
        if (Fai.top._canDesign && isMultiModule && !inMultiModule) {
            var floatFunc = 'Site.floatOut2("' + objId + '", "f");';
            var dockFunc = 'Site.dock2("' + objId + '", "d");';
            var floatTitle = "浮动模块，可随意摆放位置";
            var dockTitle = "把模块停靠回固定区域";
            var dockStatus;
            var draggableFunc = floatFunc;
            var floatAndDockBtnClass = "float";
            var btnTitle = floatTitle;
            dockStatus = Site.getDockStatus2(objId);
            if (dockStatus == 1) {
                draggableFunc = dockFunc;
                floatAndDockBtnClass = "dock";
                btnTitle = dockTitle
            }
            html.push("<div class='shortcutContainer'>");
            html.push("<a class='shortcutBtn " + floatAndDockBtnClass + "' title='" + btnTitle + "' href='javascript:;' onclick='" + draggableFunc + ";Site.removeAllEditLayer();return false;'></a>");
            html.push("</div>")
        }
        if (typeof directionList != "undefined" && isMultiModule) {
            var showLength = 0;
            var tmp = [];
            var initwidth = 27;
            for (var i = 0,
            len = directionList.length; i < len; i++) {
                var data = directionList[i];
                var statusScript = data.statusScript;
                var dataTitle = "";
                var dataIconClass = "";
                data.status = 0;
                if (statusScript) {
                    data.status = eval(statusScript)
                }
                if (data.status != -1) {
                    dataTitle = (data.status == 0 ? data.title: data.title1);
                    dataIconClass = (data.status == 0 ? data.iconClass: data.iconClass1);
                    if (typeof dataTitle === "undefined") {
                        dataTitle = ""
                    }
                    showLength += 1;
                    tmp.push("		<a class='directionBtn " + dataIconClass + "' href='javascript:;' title='" + dataTitle + "' onclick=\"" + data.evalScript + ';Site.removeAllEditLayer();return false;"></a>')
                }
            }
            if (showLength > 0) {
                var directionBoxWidth = showLength * initwidth;
                html.push("<div class='shortcutContainer shortcutContainer_direction'>");
                html.push("	<div class='J_directionBox direction-box' initwidth='" + initwidth + "' totalwidth='" + directionBoxWidth + "'>");
                html.push(tmp.join(""));
                html.push("	</div>");
                html.push("</div>")
            }
        }
        if (typeof shortcutLayerList != "undefined") {
            var menu = shortcutLayerList;
            for (var x = 0; x < menu.length; x++) {
                var data = menu[x];
                var statusScript = data.statusScript;
                data.status = 0;
                if (statusScript) {
                    data.status = eval(statusScript)
                }
                var dataTitle = "";
                var dataIconClass = "";
                if (!data.status) {
                    if (needResetTB && data.setTB) {
                        data.iconClass = "resetTB";
                        data.title = "恢复标题栏与背景";
                        data.evalScript = "Site.oneKeySetModuleTB(" + id + ", false)"
                    } else {
                        if (data.setTB) {
                            data.iconClass = "clearTB";
                            data.title = "隐藏标题栏与背景";
                            data.evalScript = "Site.oneKeySetModuleTB(" + id + ", true)"
                        }
                    }
                }
                if (data.status === 0 || data.status === 1) {
                    dataTitle = (data.status == 0 ? data.title: data.title1);
                    dataIconClass = (data.status == 0 ? data.iconClass: data.iconClass1);
                    if (typeof dataTitle === "undefined") {
                        dataTitle = ""
                    }
                    var fixClass = "";
                    if (typeof data.fixClass !== "undefined") {
                        fixClass = data.fixClass
                    }
                    html.push("<div class='shortcutContainer " + fixClass + "'>");
                    html.push("<a class='shortcutBtn " + dataIconClass + "' title='" + dataTitle + "'  href='javascript:;' onclick=\"" + data.evalScript + ';Site.removeAllEditLayer();return false;"></a>');
                    html.push("</div>")
                }
            }
        }
        var sideStatus = obj.attr("_side");
        var flutterSwitch = obj.attr("_flutterSwitch");
        if (sideStatus == 2 && Fai.top._canDesign) {
            var spanClass = "";
            var title = "";
            if (flutterSwitch == "true") {
                spanClass = "flutterStart";
                title = "开始飘动"
            } else {
                spanClass = "flutterStop";
                title = "停止飘动"
            }
            html.push("<div id='flutterStatus' class='shortcutContainer'>");
            html.push("<a class='shortcutBtn " + spanClass + "' title='" + title + "' href='javascript:;' onclick='Site.flutterStopSwitch(\"" + objId + "\");  return false;'></a>");
            html.push("</div>");
            html.push("<div id='flutterLocation' class='shortcutContainer'>");
            html.push("<a class='shortcutBtn flutterLocation' title='将此处设置为飘动起始位置' href='javascript:;' onclick='Site.flutterSetStartLocation(\"" + objId + "\");return false;'></a>");
            html.push("</div>")
        }
        html.push("</div>");
        var div = $(html.join(""));
        div.appendTo("body");
        div.css("margin", 0);
        var scrollLeft = document.body.scrollLeft;
        if (Fai.isIE8() || Fai.isIE7()) {
            scrollLeft = document.documentElement.scrollLeft
        }
        var rightBoundary = document.documentElement.clientWidth + scrollLeft - 16;
        var nowPosition = obj.offset().left + obj.width() + div.width();
        var moveFrameLeft = $("#" + objId + "moveFrameLeft");
        var moveFrameRight = $("#" + objId + "moveFrameRight");
        if (nowPosition > rightBoundary || inMultiModule || obj.find(".formMiddleContent" + id).children(".pd_mall_G_J").length > 0 || obj.find(".formMiddleContent" + id).children(".navA_C_J").length > 0) {
            isMultiModule ? $("#" + layerId).addClass("multiModuleShortcutLayer-fixLeft") : $("#" + layerId).addClass("shortcutLayer-fixLeft");
            var divOuterWidth = div.outerWidth();
            var moduleLayerLeft = obj.offset().left;
            var tmpModuleLayerLeft = Fai.top.$("#" + moduleLayerId).css("left");
            if (typeof tmpModuleLayerLeft == "string") {
                moduleLayerLeft = parseInt(tmpModuleLayerLeft.split("p")[0])
            }
            var flutterLayerLeft = parseInt(obj.offset().left - divOuterWidth);
            var nowLayerLeft = parseInt(flutterLayerLeft);
            if (Fai.isIE6() || Fai.isIE7()) {
                div.css("left", nowLayerLeft - 1)
            } else {
                div.css("left", nowLayerLeft)
            }
            if (sideStatus == 2) {
                var flutterStatus = $("#flutterStatus span");
                var flutterLocation = $("#flutterLocation span");
                if (flutterStatus.hasClass("flutterStopImg")) {
                    flutterStatus.removeClass("flutterStopImg").addClass("flutterStopImgLeft")
                } else {
                    flutterStatus.removeClass("flutterStartImg").addClass("flutterStartImgLeft")
                }
                if (flutterLocation.hasClass("flutterLocationImg")) {
                    flutterLocation.removeClass("flutterLocationImg").addClass("flutterLocationImgLeft")
                }
            }
        } else {
            isMultiModule ? $("#" + layerId).removeClass("multiModuleShortcutLayer-fixLeft") : $("#" + layerId).removeClass("shortcutLayer-fixLeft");
            if (Fai.isIE6() || Fai.isIE7()) {
                div.css("left", obj.offset().left + obj.outerWidth() + 1)
            } else {
                div.css("left", obj.offset().left + obj.outerWidth())
            }
        }
        div.css("top", obj.offset().top);
        var fixCover = (obj.offset().top + div.outerHeight()) - Fai.top.$(".floatLeftBottom").offset().top;
        if (fixCover > 0) {
            div.css("top", obj.offset().top - fixCover)
        }
        div.mouseover(function() {
            div.attr("_mouseIn", 1);
            div.attr("_realmousein", 1);
            if (sideStatus == 2) {
                Site.stopFlutterInterval(obj)
            }
            $("#" + moduleLayerId).hide();
            var multiModuleId = obj.attr("_intab");
            if (parseInt(obj.attr("_inmulmcol")) > 0) {
                multiModuleId = obj.attr("_inmulmcol")
            }
            if (obj.hasClass("formStyle29") || obj.hasClass("formStyle35")) {
                multiModuleId = obj.attr("id").replace("module", "")
            }
            if (multiModuleId != 0) {
                Fai.top.$("#module" + multiModuleId).attr("_mouseIn", 1)
            }
        });
        div.mouseleave(function() {
            div.attr("_mouseIn", 0);
            div.attr("_realmousein", 0);
            var sideStatus = obj.attr("_side");
            var flutterSwitch = obj.attr("_flutterSwitch");
            if (flutterSwitch == "false" || !flutterSwitch) {
                Site.startFlutterInterval(obj)
            }
            Site.removeAllEditLayer();
            var multiModuleId = obj.attr("_intab");
            if (parseInt(obj.attr("_inmulmcol")) > 0) {
                multiModuleId = obj.attr("_inmulmcol")
            }
            if (obj.hasClass("formStyle29") || obj.hasClass("formStyle35")) {
                multiModuleId = obj.attr("id").replace("module", "")
            }
            if (multiModuleId != 0) {
                Fai.top.$("#module" + multiModuleId).attr("_mouseIn", 0)
            }
        });
        div.find(".J_directionBox").hover(function() {
            $(this).stop(true).animate({
                width: $(this).attr("totalwidth") + "px"
            },
            200)
        },
        function() {
            $(this).stop(true).animate({
                width: $(this).attr("initwidth") + "px"
            },
            200)
        });
        Site.bindMousewheel();
        return div
    } else {
        var div = $("#" + layerId);
        div.attr("_mouseIn", 1);
        if (!div.hasClass("multiModuleShortcutLayer")) {
            var $btn = $(".draggableBtn");
            var tmpTimer = setInterval(function() {
                draggableBtnMouseIn = $btn.attr("_mouseIn")
            },
            20);
            clearTimeout(Site.addShortcutLayer.timer);
            var timer = setTimeout(function() {
                clearInterval(tmpTimer);
                var $layer = Fai.top.$("#" + objId + "moduleLayer");
                if (typeof draggableBtnMouseIn != "undefined" && draggableBtnMouseIn != 1 && $layer.attr("_realmousein") != 1 && $layer.attr("canshow") != 0 && Site.initModuleLayer.innerEdit != true) {
                    div.stop(true).css("opacity", "1").show()
                } else {
                    div.stop(true).fadeOut()
                }
            },
            300);
            Site.addShortcutLayer.timer = timer
        } else {
            if (typeof draggableBtnMouseIn != "undefined" && draggableBtnMouseIn != 1) {
                div.show()
            } else {
                div.hide()
            }
        }
        return div
    }
};
Site.removeShortcutLayer = function(a) {
    var b = $("#" + a);
    var c = $("#" + a + "ShortcutLayer");
    c.attr("_mouseIn", 0);
    setTimeout("Site.removeShortcutLayer_Internal('" + a + "')", 100)
};
Site.removeShortcutLayer_Internal = function(b) {
    var j = b + "ShortcutLayer";
    var g = b + "moduleLayer";
    var a = $("#" + j);
    var l = $("#" + b + "moveFrameLeft");
    var e = $("#" + b + "moveFrameRight");
    var m = $("#" + b + "moveFrameTop");
    var h = $("#" + b + "moveFrameBottom");
    var f = $("#" + g);
    if (a.length == 1) {
        var d = Fai.top.$("#" + b);
        var k = false;
        if (d.hasClass("formStyle29")) {
            k = true
        }
        if (a.attr("_mouseIn") != 1 && l.attr("_mouseIn") != 1 && e.attr("_mouseIn") != 1 && m.attr("_mouseIn") != 1 && h.attr("_mouseIn") != 1 && f.attr("_mouseIn") != 1) {
            setTimeout("Site.removeMoveFrame('" + b + "')", 100);
            a.remove();
            f.remove();
            var c = $("#" + b).attr("_side");
            $("#" + g + "tips").remove();
            var i = $("#" + b);
            var c = i.attr("_side");
            if (c == 1) {
                Site.reSetSidePosition(i)
            }
        }
    }
};
Site.removeModuleDragBtn = function(a) {
    Fai.top.$("#module" + a).children(".draggableBtn").remove()
};
Site.showModuleDragBtn = function(a) {
    if (a.length < 1) {
        return
    }
    clearTimeout(Site.showModuleDragBtn.timer);
    var b = setTimeout(function() {
        if (Site.initModuleLayer.innerEdit) {
            a.children(".draggableBtn").stop(true).fadeOut()
        } else {
            a.children(".draggableBtn").stop(true).css("opacity", "1").show()
        }
    },
    300);
    Site.showModuleDragBtn.timer = b
};
Site.addResizableExtHandles = function(c) {
    if (!c || c.length < 1) {
        return
    }
    var a = 1;
    var b = c.attr("id");
    if (Site.getFlutterStatus2(b) == 0) {
        a = 2
    } else {
        if (Site.getSideStatus(b) == 0) {
            a = 3
        } else {
            if (Site.getLockStatus(b) == 0) {
                a = 4
            } else {
                if (Site.getAbsStatus(b) == 0) {
                    a = 5
                }
            }
        }
    }
    var j = "";
    var l = "";
    var e = "";
    var g = false;
    var i = false;
    if (c.hasClass("formStyle80")) {
        g = true
    } else {
        if (c.hasClass("formStyle29")) {
            i = true
        } else {
            if (c.hasClass("formStyle35")) {
                i = true
            }
        }
    }
    if (g || i) {
        j += "ui-resizable-line2";
        l += "ui-resizable-icon2";
        e += "ui-resizable-tip2"
    }
    var h = [];
    var f = c.children(".ui-resizable-s");
    if (f.length > 0) {
        h = [];
        h.push("	<div class='ui-resizable-line " + j + " ui-resizable-bline'></div>");
        h.push("	<div class='ui-resizable-icon " + l + " ui-resizable-blIcon" + (a == 1 ? "2": "") + "'></div>");
        h.push("	<div class='ui-resizable-icon " + l + " ui-resizable-bcIcon'></div>");
        h.push("	<div class='ui-resizable-icon " + l + " ui-resizable-brIcon" + (a == 1 ? "2": "") + "'></div>");
        f.empty();
        f.addClass("ui-resizable-bottomLine").append(h.join(""));
        c.data("bottomLine", 1)
    } else {
        c.data("bottomLine", 0)
    }
    var m = c.children(".ui-resizable-n");
    if (m.length > 0) {
        h = [];
        h.push("	<div class='ui-resizable-line " + j + " ui-resizable-tline'></div>");
        h.push("	<div class='ui-resizable-icon " + l + " ui-resizable-tlIcon'></div>");
        h.push("	<div class='ui-resizable-icon " + l + " ui-resizable-tcIcon'></div>");
        h.push("	<div class='ui-resizable-icon " + l + " ui-resizable-trIcon'></div>");
        m.empty();
        m.addClass("ui-resizable-topLine").append(h.join(""));
        c.data("topLine", 1)
    } else {
        c.data("topLine", 0)
    }
    var q = c.children(".ui-resizable-w");
    if (q.length > 0) {
        h = [];
        h.push("	<div class='ui-resizable-line " + j + " ui-resizable-lline'></div>");
        h.push("	<div class='ui-resizable-icon " + l + " ui-resizable-llIcon'></div>");
        h.push("	<div class='ui-resizable-icon " + l + " ui-resizable-lcIcon'></div>");
        h.push("	<div class='ui-resizable-icon " + l + " ui-resizable-lrIcon'></div>");
        q.empty();
        q.addClass("ui-resizable-leftLine").append(h.join(""));
        c.data("leftLine", 1)
    } else {
        c.data("leftLine", 0)
    }
    var k = c.children(".ui-resizable-e");
    if (k.length > 0) {
        h = [];
        h.push("	<div class='ui-resizable-line " + j + " ui-resizable-rline'></div>");
        h.push("	<div class='ui-resizable-icon " + l + " ui-resizable-rlIcon'></div>");
        h.push("	<div class='ui-resizable-icon " + l + " ui-resizable-rcIcon'></div>");
        h.push("	<div class='ui-resizable-icon " + l + " ui-resizable-rrIcon'></div>");
        k.empty();
        k.addClass("ui-resizable-rightLine").append(h.join(""));
        c.data("rightLine", 1)
    } else {
        c.data("rightLine", 0)
    }
    var n = c.children(".ui-resizable-nw");
    if (n.length > 0) {
        n.addClass("ui-resizable-tip " + e + " ui-resizable-nwTip")
    }
    var p = c.children(".ui-resizable-ne");
    if (p.length > 0) {
        p.addClass("ui-resizable-tip " + e + " ui-resizable-neTip")
    }
    var d = c.children(".ui-resizable-se");
    if (d.length > 0) {
        d.addClass("ui-resizable-tip " + e + " ui-resizable-seTip")
    }
    var o = c.children(".ui-resizable-sw");
    if (o.length > 0) {
        o.addClass("ui-resizable-tip " + e + " ui-resizable-swTip")
    }
};
Site.refreshResizableHandles = function(b) {
    if (!b || b.length < 1) {
        return
    }
    var k = Fai.isIE() ? b[0].currentStyle.getAttribute("borderTopWidth") : b.css("borderTopWidth");
    k = typeof k == "undefined" ? 0 : (parseInt(k.replace(/[a-zA-Z]+/, "")) || 0);
    var c = Fai.isIE() ? b[0].currentStyle.getAttribute("borderBottomWidth") : b.css("borderBottomWidth");
    c = typeof c == "undefined" ? 0 : (parseInt(c.replace(/[a-zA-Z]+/, "")) || 0);
    var n = Fai.isIE() ? b[0].currentStyle.getAttribute("borderLeftWidth") : b.css("borderLeftWidth");
    n = typeof n == "undefined" ? 0 : (parseInt(n.replace(/[a-zA-Z]+/, "")) || 0);
    var a = Fai.isIE() ? b[0].currentStyle.getAttribute("borderRightWidth") : b.css("borderRightWidth");
    a = typeof a == "undefined" ? 0 : (parseInt(a.replace(/[a-zA-Z]+/, "")) || 0);
    var l = b.width() + n + a;
    var i = b.height() + k + c;
    var h = b.children(".ui-resizable-topLine");
    if (h.length > 0) {
        h.css({
            top: ( - k) + "px",
            left: ( - n) + "px",
            width: l + "px"
        })
    }
    var e = b.children(".ui-resizable-bottomLine");
    if (e.length > 0) {
        e.css({
            bottom: ( - c) + "px",
            left: ( - n) + "px",
            width: l + "px"
        })
    }
    var m = b.children(".ui-resizable-leftLine");
    if (m.length > 0) {
        m.css({
            top: ( - k) + "px",
            left: ( - n) + "px",
            height: i + "px"
        })
    }
    var g = b.children(".ui-resizable-rightLine");
    if (g.length > 0) {
        g.css({
            top: ( - k) + "px",
            right: ( - a) + "px",
            height: i + "px"
        })
    }
    var d = b.children(".ui-resizable-nwTip");
    if (d.length > 0) {
        d.css({
            top: ( - k - 4) + "px",
            left: ( - n - 4) + "px"
        })
    }
    var o = b.children(".ui-resizable-neTip");
    if (o.length > 0) {
        o.css({
            top: ( - k - 4) + "px",
            right: ( - a - 4) + "px"
        })
    }
    var j = b.children(".ui-resizable-swTip");
    if (j.length > 0) {
        j.css({
            bottom: ( - c - 4) + "px",
            left: ( - n - 4) + "px"
        })
    }
    var f = b.children(".ui-resizable-seTip");
    if (f.length > 0) {
        f.css({
            bottom: ( - c - 4) + "px",
            right: ( - a - 4) + "px"
        })
    }
};
Site.initModuleMsgBoardItemManage = function(b, a) {
    Fai.top.$("#" + b).mouseover(function() {
        Site.addEditLayer(b, a, 1)
    }).mouseleave(function() {
        Site.removeEditLayer(b)
    })
};
Site.msgBoardDelMsg = function(b, a) {
    if (!confirm("确定删除“" + a + "”的留言？")) {
        return
    }
    Fai.bg();
    Fai.ing("正在删除", false);
    $.ajax({
        type: "post",
        url: "ajax/msgBoard_h.jsp",
        data: "cmd=del&id=" + b,
        error: function() {
            Fai.ing("error page", true)
        },
        success: function(c) {
            Fai.removeBg();
            Fai.successHandle(c, "", "", document.location.href, 1, 1)
        }
    })
};
Site.msgBoardPublicThisMsg = function(c, b, a) {
    Fai.bg();
    Fai.ing("正在保存", false);
    $.ajax({
        type: "post",
        url: "ajax/msgBoard_h.jsp",
        data: "cmd=singlePub&id=" + c + "&flag" + b + "=" + a,
        error: function() {
            Fai.ing("error page", true)
        },
        success: function(d) {
            Fai.removeBg();
            Fai.successHandle(d, "", "", document.location.href, 1, 1)
        }
    })
};
Site.initModuleNewsListItemManage = function(c) {
    if (!c) {
        return
    }
    if (!c.moduleId) {
        return
    }
    $("#" + c.newsParent).find(">." + c.news).each(function() {
        var d = $(this).find("." + c.newsChild)[0];
        $(this).mouseover(function() {
            var e = $(this).attr("newsId"),
            f = $(this).attr("newsName"),
            i = $(this).attr("topClassName"),
            h = $(this).attr("topSwitch");
            var g = [{
                operationText: "编辑文章",
                className: "edit",
                evalScript: "Site.popupWindow({title:'编辑文章', frameSrcUrl:'" + c.frameSrcUrl + "&id=" + e + "', width:700, height:520, beforePopup:true});"
            },
            {
                operationText: "删除文章",
                className: "close",
                evalScript: "Site.delNews('" + e + "', '" + Fai.encodeHtmlJs(f) + "', document.location.href, 0);"
            },
            {
                operationText: (h == "off" ? "取消置顶": "设为置顶"),
                className: "" + i + "",
                evalScript: "Site.setTop(" + e + ",'" + h + "',document.location.href)"
            }];
            Site.addEditLayer(d, g, 1)
        }).mouseleave(function() {
            Site.removeEditLayer(d)
        })
    });
    var b = [];
    var a = $("#" + c.newsParent).find("div.articlePhotoBox");
    a.each(function(d, e) {
        b = [];
        b.push("<a class='editBtn' style='display:none;' title='编辑文章附图' onclick=\"Site.changeNewsListPic(" + $(e).attr("newid") + "," + c.imgMaxSize + ', this); return false;"></a>');
        if ($(e).children(".editBtn").length < 1) {
            $(e).prepend(b.join(""))
        }
    });
    a.hover(function() {
        $(this).children("a.editBtn").show()
    },
    function() {
        $(this).children("a.editBtn").hide()
    })
};
Site.delNews = function(d, c, a, b) {
    Site.removeAllEditLayer();
    if (Site.checkSaveBar()) {
        return
    }
    if (window.confirm("确定删除“" + c + "”?")) {
        Fai.ing("正在删除……", false);
        $.ajax({
            type: "post",
            url: Site.genAjaxUrl("news_h.jsp"),
            data: "cmd=del&_clicka=46&id=" + d,
            error: function() {
                Fai.ing("系统繁忙，请稍候重试", false)
            },
            success: function(e) {
                Fai.successHandle(e, "删除成功", "", a, b, 1)
            }
        })
    }
};
Site.setTop = function(c, b, a) {
    Site.removeAllEditLayer();
    if (Site.checkSaveBar()) {
        return
    }
    Fai.ing("正在设置……", false);
    $.ajax({
        type: "post",
        url: Site.genAjaxUrl("news_h.jsp"),
        data: "cmd=set&id=" + c + "&top=" + b,
        error: function() {
            Fai.ing("系统繁忙，请稍候重试", false)
        },
        success: function(d) {
            Fai.successHandle(d, "设置成功", "", a, 0, 1)
        }
    })
};
Site.deleteNewsComment = function(b, a) {
    if (confirm("是否删除该评论?")) {
        Fai.ing("正在处理中，请稍候...", false);
        $.ajax({
            type: "post",
            url: "ajax/newsComment_h.jsp",
            data: "cmd=delComment&type=single&id=" + Fai.encodeUrl(b),
            success: function(c) {
                var d = jQuery.parseJSON(c);
                if (d && d.success) {
                    $("#" + a).remove();
                    Fai.ing(d.msg, true)
                } else {
                    Fai.ing(d.msg, false)
                }
            }
        })
    }
};
Site.initModuleProductListItemManage = function(a) {
    if (!a) {
        return
    }
    if (!a.moduleId) {
        return
    }
    if (a) {
        $("#module" + a.moduleId).data("productOptions", a)
    }
    $("#" + a.productParent).find(">." + a.product).each(function() {
        var b = $(this).find("." + a.productChild).eq(0);
        $(this).off("mouseover.moduleProductList").off("mouseleave.moduleProductList");
        $(this).on("mouseover.moduleProductList",
        function() {
            var d = $(this).attr("productId"),
            e = $(this).attr("productName"),
            i = $(this).attr("topClassName"),
            h = $(this).attr("topSwitch");
            var f = [{
                operationText: "编辑产品",
                className: "edit",
                evalScript: "Site.logDog(100073, 0);Site.popupWindow({title:'编辑产品', frameSrcUrl:'" + a.frameSrcUrl + "&id=" + d + "', width:800, height:455, beforePopup:true })"
            },
            {
                operationText: "删除产品",
                className: "close",
                evalScript: "Site.delProduct('" + d + "', '" + Fai.encodeHtmlJs(e) + "', document.location.href, 0)"
            }];
            var g = true;
            if (a.productSelect) {
                g = false
            }
            if (g) {
                f.push({
                    operationText: (h == "off" ? "取消置顶": "设为置顶"),
                    operationTitle: (h == "off" ? "当前产品已置顶，点击取消": "设为置顶"),
                    display: (h == "off" ? "text": ""),
                    className: "" + i + "",
                    evalScript: "Site.setProductTop(" + d + ",'" + h + "',document.location.href)"
                })
            }
            var c = "";
            if (a.isOpenImgEff) {
                c = Site.addEditLayer(b, f, 5)
            } else {
                if (a.productChild === "productTextTable") {
                    b = $(this).find("#module" + a.moduleId + "product" + d)[0];
                    c = Site.addEditLayer(b, f, 6);
                    $(this).addClass("g_hover")
                } else {
                    if (a.product === "productTextListTable") {
                        b = $(this).find("#module" + a.moduleId + "product" + d)[0];
                        c = Site.addEditLayer(b, f, 6)
                    } else {
                        if (a.product === "productHotTextListHot" || a.product === "productPicListForm") {
                            c = Site.addEditLayer(b, f, 6)
                        } else {
                            if (a.product === "product-container" && $("#" + a.productParent).is(":animated")) {} else {
                                c = Site.addEditLayer(b, f, 106)
                            }
                        }
                    }
                }
            }
            if (a.product === "productMarqueeForm") {
                if (!c) {
                    return
                }
                c.mouseover(function() {
                    Fai.stopInterval("marquee" + a.moduleId)
                }).mouseout(function() {
                    Fai.startInterval("marquee" + a.moduleId)
                })
            }
        }).on("mouseleave.moduleProductList",
        function() {
            if (a.product === "productHotTextListHot" || a.product === "productPicListForm" || a.isOpenImgEff) {
                Site.removeEditLayer(b)
            } else {
                Site.removeEditLayer(b, null, 106)
            }
            if (a.productChild === "productTextTable") {
                Site.removeEditLayer(b);
                $(this).removeClass("g_hover")
            }
        })
    })
};
Site.initModuleProductDoubleListItemManage = function(a) {
    if (!a) {
        return
    }
    if (!a.moduleId) {
        return
    }
    $("#" + a.productParent).find(">div.doubleProduct").each(function() {
        $(this).find(">." + a.product).each(function() {
            var b = $(this).find("." + a.productChild).eq(0);
            $(this).mouseover(function() {
                var c = $(this).attr("productId"),
                d = $(this).attr("productName"),
                h = $(this).attr("topClassName"),
                g = $(this).attr("topSwitch");
                var e = [{
                    operationText: "编辑产品",
                    className: "edit",
                    evalScript: "Site.logDog(100073, 0);Site.popupWindow({title:'编辑产品', frameSrcUrl:'" + a.frameSrcUrl + "&id=" + c + "', width:800, height:455, beforePopup:true })"
                },
                {
                    operationText: "删除产品",
                    className: "close",
                    evalScript: "Site.delProduct('" + c + "', '" + Fai.encodeHtmlJs(d) + "', document.location.href, 0)"
                }];
                var f = true;
                if (a.productSelect) {
                    f = false
                }
                if (f) {
                    e.push({
                        operationText: (g == "off" ? "取消置顶": "设为置顶"),
                        operationTitle: (g == "off" ? "当前产品已置顶，点击取消": "设为置顶"),
                        display: (g == "off" ? "text": ""),
                        className: "" + h + "",
                        evalScript: "Site.setProductTop(" + c + ",'" + g + "',document.location.href)"
                    })
                }
                if (a.isOpenImgEff) {
                    Site.addEditLayer(b, e, 5)
                } else {
                    Site.addEditLayer(b, e, 106)
                }
            }).mouseleave(function() {
                if (a.isOpenImgEff) {
                    Site.removeEditLayer(b)
                } else {
                    Site.removeEditLayer(b, null, 106)
                }
            })
        })
    })
};
Site.initModuleProductSmallPicItemManage = function(b, d, f) {
    var c = $("#" + b);
    var h = c.find("div.containerLeft");
    var e = h.attr("productid"),
    j = h.attr("productname"),
    g = h.attr("topclassname");
    topSwitch = h.attr("topswitch");
    frameSrcUrl = "manage/productEdit.jsp?ram=" + Math.random();
    var i = [{
        operationText: "编辑产品",
        className: "edit",
        evalScript: "Site.popupWindow({title:'编辑产品', frameSrcUrl:'" + frameSrcUrl + "&id=" + e + "', width:800, height:455, beforePopup:true });"
    },
    {
        operationText: "删除产品",
        className: "close",
        evalScript: "Site.delProduct('" + e + "', '" + Fai.encodeHtmlJs(j) + "', document.location.href, 0);"
    }];
    var a = true;
    if (d) {
        a = false
    }
    if (a) {
        i.push({
            operationText: (topSwitch == "off" ? "取消置顶": "设为置顶"),
            operationTitle: (topSwitch == "off" ? "当前产品已置顶，点击取消": "设为置顶"),
            display: (topSwitch == "off" ? "text": ""),
            className: "" + g + "",
            evalScript: "Site.setProductTop(" + e + ",'" + topSwitch + "',document.location.href)"
        })
    }
    if (f) {
        Site.addEditLayer(h, i, 5)
    } else {
        Site.addEditLayer(h, i, 106)
    }
};
Site.initModuleProductDetailItemManage = function(d, b) {
    var c = $("#imgDiv" + d);
    var a = "manage/productEdit.jsp?ram=" + Math.random();
    var e = [{
        operationText: "编辑产品",
        className: "edit",
        display: "text",
        evalScript: "Site.popupWindow({title:'编辑产品', frameSrcUrl:'" + a + "&id=" + b + "', width:800, height:455, beforePopup:true });"
    }];
    c.mouseover(function() {
        Site.addEditLayer(c, e, 106)
    }).mouseout(function() {
        Site.removeEditLayer(c, null, 106)
    })
};
Site.delProduct = function(f, c, a, b) {
    Site.removeAllEditLayer();
    if (Site.checkSaveBar()) {
        return
    }
    if (c.length > 15) {
        c = c.slice(0, 15) + "..."
    }
    var e = new Array();
    e.push("<div style='line-height:20px; font-size: 14px; color:black; padding:55px 0px; text-align:center;'>");
    e.push("确定删除产品“" + c + "”?");
    e.push("</div>");
    var d = Fai.popupBodyWindow({
        title: "删除产品",
        content: e.join(""),
        width: 370,
        height: 130
    });
    Fai.addPopupBodyWindowCheckBox(d, {
        id: "checkbox",
        text: "同时删除产品图片",
        init: "checked",
        click: function() {}
    });
    Fai.addPopupBodyWindowBtn(d, {
        id: "save",
        text: "确 定",
        extClass: "saveButton",
        click: function() {
            var g = $("#popup" + d + "checkbox").attr("checked") ? true: false;
            Fai.ing("正在处理中，请稍候...", false);
            $.ajax({
                type: "post",
                url: Site.genAjaxUrl("product_h.jsp"),
                data: "cmd=del&id=" + f + "&delImgs=" + g,
                error: function() {
                    Fai.ing("系统繁忙，请稍候重试", false)
                },
                success: function(h) {
                    Fai.successHandle(h, "删除成功", "", a, b, 1)
                }
            });
            Fai.closePopupBodyWindow(d)
        }
    });
    Fai.addPopupBodyWindowBtn(d, {
        id: "cancel",
        text: "取 消",
        click: "close"
    })
};
Site.setProductRecommend = function(c, b, a) {
    Site.removeAllEditLayer();
    if (Site.checkSaveBar()) {
        return
    }
    Fai.ing("正在设置……", false);
    $.ajax({
        type: "post",
        url: Site.genAjaxUrl("product_h.jsp"),
        data: "cmd=setRecommend&id=" + c + "&recommend=" + b,
        error: function() {
            Fai.ing("系统繁忙，请稍候重试", false)
        },
        success: function(d) {
            Fai.successHandle(d, "设置成功", "", a, 0, 1)
        }
    })
};
Site.setProductLastest = function(c, b, a) {
    Site.removeAllEditLayer();
    if (Site.checkSaveBar()) {
        return
    }
    Fai.ing("正在设置……", false);
    $.ajax({
        type: "post",
        url: Site.genAjaxUrl("product_h.jsp"),
        data: "cmd=setLastest&id=" + c + "&lastest=" + b,
        error: function() {
            Fai.ing("系统繁忙，请稍候重试", false)
        },
        success: function(d) {
            Fai.successHandle(d, "设置成功", "", a, 0, 1)
        }
    })
};
Site.setProductTop = function(c, b, a) {
    Site.removeAllEditLayer();
    if (Site.checkSaveBar()) {
        return
    }
    Fai.ing("正在设置……", false);
    $.ajax({
        type: "post",
        url: Site.genAjaxUrl("product_h.jsp"),
        data: "cmd=batchSetTop&id=" + c + "&top=" + b,
        error: function() {
            Fai.ing("系统繁忙，请稍候重试", false)
        },
        success: function(d) {
            Fai.successHandle(d, "修改成功", "", a, 0, 1)
        }
    })
};
Site.sendProductMail = function(b, a) {
    if (Fai.top._oem) {
        return
    }
    Site.removeAllEditLayer();
    window.open("http://" + Fai.top._portalHost + "/mail/index.jsp?url=" + Fai.encodeUrl("write.jsp?cmd=product&wid=" + b + "&productId=" + a))
};
Site.deleteProductComment = function(b, a) {
    if (confirm("是否删除该评论?")) {
        Fai.ing("正在处理中，请稍候...", false);
        $.ajax({
            type: "post",
            url: "ajax/productComment_h.jsp",
            data: "cmd=delPC&type=single&id=" + Fai.encodeUrl(b),
            success: function(c) {
                var d = jQuery.parseJSON(c);
                if (d && d.success) {
                    $("#" + a).remove();
                    Fai.ing(d.msg, true)
                } else {
                    Fai.ing(d.msg, false)
                }
            }
        })
    }
};
Site.initFooterManage = function(a) {
    $("#footer").mouseover(function() {
        Site.addEditLayer("footer", a, 8)
    }).mouseleave(function() {
        Site.removeEditLayer("footer")
    })
};
Site.hideOnlineHelp = function() {
    var a = parseInt($("#choiceService").attr("_mouseIn"));
    if (a == 0) {
        $(".serviceList").hide();
        $("#choiceService").removeClass("choiceServiceInfo-hover")
    }
};
Site.hideMailTip = function() {
    var a = parseInt($("#mailInfo").attr("_mouseIn"));
    if (a == 0) {
        $(".mailTip").hide();
        $("#mailInfo").removeClass("mailInfo-hover")
    }
};
Site.initTopBar = function(e) {
    $("#scrollbar").hide();
    $("#choiceService").mouseleave(function() {
        $(this).attr("_mouseIn", 0);
        setTimeout("Site.hideOnlineHelp()", 100)
    }).mouseover(function() {
        $(this).attr("_mouseIn", 1);
        $(this).addClass("choiceServiceInfo-hover");
        var f = $(".serviceList");
        f.css("left", $(this).position().left);
        f.css("top", $(this).position().top + 24);
        f.show()
    });
    $(".serviceList").mouseover(function() {
        $("#choiceService").attr("_mouseIn", 1);
        $(".serviceList").show()
    }).mouseleave(function() {
        $("#choiceService").attr("_mouseIn", 0);
        setTimeout("Site.hideOnlineHelp()", 100)
    });
    $(".serviceList").find(".siteweixin").mouseover(function() {
        $(this).find(".spanDIV").css("display", "block")
    }).mouseleave(function() {
        $(this).find(".spanDIV").css("display", "none");
        setTimeout("Site.hideOnlineHelp()", 100)
    });
    $("#topBarStaff").mouseleave(function() {
        $(this).attr("_mouseIn", 0);
        setTimeout(function() {
            var f = parseInt($("#topBarStaff").attr("_mouseIn"));
            if (f == 0) {
                $(".topBarStaffContent").hide();
                $("#topBarStaff").removeClass("siteTitle-hover")
            }
        },
        100)
    }).mouseover(function() {
        $(this).attr("_mouseIn", 1);
        $(this).addClass("siteTitle-hover");
        var f = $(".topBarStaffContent");
        f.css("left", $(this).position().left - f.outerWidth() + $(this).outerWidth());
        f.css("top", $(this).position().top + 26);
        f.show()
    });
    $(".topBarStaffContent").mouseover(function() {
        $("#topBarStaff").attr("_mouseIn", 1);
        $(this).show()
    }).mouseleave(function() {
        $("#topBarStaff").attr("_mouseIn", 0);
        setTimeout(function() {
            var f = parseInt($("#topBarStaff").attr("_mouseIn"));
            if (f == 0) {
                $(".topBarStaffContent").hide();
                $("#topBarStaff").removeClass("siteTitle-hover")
            }
        },
        100)
    });
    $("#topBarStaffAcct").focusin(function() {
        if ($(this).val() == "请输入员工帐号") {
            $(this).val("")
        }
    }).blur(function() {
        if ($(this).val() == "") {
            $(this).val("请输入员工帐号")
        }
    });
    if (Fai.isIE7()) {
        $(".topBarStaffContent .bottom").width($(".topBarStaffContent").width())
    }
    $("#mySite").mouseleave(function() {
        $(this).attr("_mouseIn", 0);
        setTimeout(function() {
            var f = parseInt($("#mySite").attr("_mouseIn"));
            if (f == 0) {
                $("#topBarMySiteContent").hide();
                $("#mySite").removeClass("mySite-hover")
            }
        },
        100)
    }).mouseover(function() {
        $(this).attr("_mouseIn", 1);
        $(this).addClass("mySite-hover");
        var f = $("#topBarMySiteContent");
        f.css("left", $(this).position().left);
        f.css("top", $(this).position().top + 26);
        f.show();
        if ($("#topBarMySiteCheckDomain").length == 1 && !Fai.top.topBarHasCheckDomain) {
            $("#topBarMySiteDomainCheck").click()
        }
    });
    $("#topBarMySiteContent").mouseover(function() {
        $("#mySite").attr("_mouseIn", 1);
        $("#topBarMySiteContent").show()
    }).mouseleave(function(f) {
        if ($(f.target).attr("id") == "topBarMySiteCopyBtn" || $(f.target).attr("id") == "topBarMySiteDomainSuffix") {
            $("#mySite").attr("_mouseIn", 1)
        } else {
            $("#mySite").attr("_mouseIn", 0)
        }
        setTimeout(function() {
            var g = parseInt($("#mySite").attr("_mouseIn"));
            if (g == 0) {
                $("#topBarMySiteContent").hide();
                $("#mySite").removeClass("mySite-hover")
            }
        },
        300)
    });
    $("#topBarMySiteDomainCheck").click(function() {
        if (Fai.top.topBarHasCheckDomain) {
            $("#topBarMySiteCheckResult").show()
        }
        Fai.top.topBarMySiteDomain = "";
        var g = $("#topBarMySiteDomain").val();
        if (g.indexOf(".") != -1) {
            g = g.slice(0, g.indexOf("."));
            $("#topBarMySiteDomain").val(g)
        }
        var i = f(g);
        if (i != "") {
            $("#topBarMySiteCheckResultIco").removeClass().addClass("icoNo");
            $("#topBarMySiteCheckResult .text").html(i);
            return
        }
        var h = new Array();
        g = g + $("#topBarMySiteDomainSuffix").val();
        h.push(g);
        $("#topBarMySiteDomain").attr("disabled", true);
        $("#topBarMySiteDomainSuffix").attr("disabled", true);
        $("#topBarMySiteDomainCheck").attr("disabled", true);
        $("#topBarMySiteCheckResultIco").removeClass().addClass("icoWait");
        $("#topBarMySiteCheckResult .text").html("正在查询域名...");
        $.ajax({
            type: "post",
            url: "../static/web/ajax/siteDomain_h.jsp?cmd=checkRegistered&domainList=" + Fai.encodeUrl($.toJSON(h)),
            error: function() {
                $("#topBarMySiteDomain").removeAttr("disabled");
                $("#topBarMySiteDomainSuffix").removeAttr("disabled");
                $("#topBarMySiteDomainCheck").removeAttr("disabled");
                Fai.ing("服务繁忙，请稍候重试", false)
            },
            success: function(j) {
                $("#topBarMySiteDomain").removeAttr("disabled");
                $("#topBarMySiteDomainSuffix").removeAttr("disabled");
                $("#topBarMySiteDomainCheck").removeAttr("disabled");
                j = jQuery.parseJSON(j);
                if (j.success) {
                    $(j.regList).each(function() {
                        if (this.msg) {
                            $("#topBarMySiteCheckResultIco").removeClass().addClass("icoNo");
                            $("#topBarMySiteCheckResult .text").html("检查错误，请稍后重试。")
                        } else {
                            if (this.reg) {
                                if (!Fai.top.topBarHasCheckDomain) {
                                    $("#topBarMySiteDomain").val("");
                                    $("#topBarMySiteDomain").focus()
                                }
                                $("#topBarMySiteCheckResultIco").removeClass().addClass("icoNo");
                                $("#topBarMySiteCheckResult .text").html("此域名已被注册，请重新查询！")
                            } else {
                                if (!Fai.top.topBarHasCheckDomain) {
                                    $("#topBarMySiteCheckResult").show()
                                }
                                Fai.top.topBarMySiteDomain = g;
                                $("#topBarMySiteCheckResultIco").removeClass().addClass("icoYes");
                                $("#topBarMySiteCheckResult .text").html("恭喜您，此域名可注册！")
                            }
                        }
                    })
                } else {
                    $("#topBarMySiteCheckResultIco").removeClass().addClass("icoNo");
                    $("#topBarMySiteCheckResult .text").html(i)
                }
                if (Fai.top.topBarHasCheckDomain) {
                    Site.logDog(100038, 24)
                }
                Fai.top.topBarHasCheckDomain = true
            }
        });
        function f(j) {
            Fai.removeIng();
            if (!j) {
                return "请先输入域名"
            }
            if (!Fai.isDomain(j)) {
                if (j.indexOf("-") == 0 || j.lastIndexOf("-") == j.length - 1) {
                    return "域名的开头及结尾均不能含有-"
                } else {
                    if (j.indexOf("--") >= 0) {
                        return "域名不能含有连续的-"
                    } else {
                        if (j.indexOf(".") >= 0) {
                            return "域名不能含有."
                        }
                    }
                }
                return "域名由英文a-z、数字0-9和-组成"
            }
            return ""
        }
    }).hover(function() {
        $(this).addClass("topBarMySiteDomainCheck-hover")
    },
    function() {
        $(this).removeClass("topBarMySiteDomainCheck-hover")
    });
    $("#topBarMySiteDomainBuy").click(function() {
        $("#topBarMySiteCheckResult").show();
        var f = $("#topBarMySiteDomain").val() + $("#topBarMySiteDomainSuffix").val();
        if (Fai.top.topBarMySiteDomain == "" || Fai.top.topBarMySiteDomain != f) {
            $("#topBarMySiteCheckResultIco").removeClass().addClass("icoNo");
            $("#topBarMySiteCheckResult .text").html("请先查询域名");
            return
        } else {
            if (Fai.isDbg()) {
                window.open("http://www.aaa.cn/jump.jsp?t=23&domain=" + Fai.encodeUrl(f))
            } else {
                window.open("http://www.faisco.cn/jump.jsp?t=23&domain=" + Fai.encodeUrl(f))
            }
        }
    });
    $(".topBarBulletin").mouseleave(function() {
        $(this).attr("_mouseIn", 0);
        setTimeout(function() {
            var f = parseInt($(".topBarBulletin").attr("_mouseIn"));
            if (f == 0) {
                $(".topBarBulletinContent").hide();
                $(".topBarBulletin").removeClass("topBarBulletin-hover");
                if ($.cookie("topBarUpdateVer") != null && $.cookie("topBarUpdateVer") != Fai.top._topBarUpdateVersion) {
                    $(".topBarBulletinRemind").html("有新功能更新");
                    $(".topBarBulletinRemind").hide();
                    $(".topBarBulletin").addClass("topBarBulletin-hasNew");
                    $(".topBarBulletinContent .redPoint").show()
                }
            }
        },
        100)
    }).mouseover(function() {
        $(this).attr("_mouseIn", 1);
        $(this).addClass("topBarBulletin-hover");
        var f = $(".topBarBulletinContent");
        f.css("left", $(this).position().left - f.outerWidth() + $(this).outerWidth());
        f.css("top", $(this).position().top + 26);
        f.show();
        $(".topBarBulletinRemind").hide();
        $(".topBarBulletin").removeClass("topBarBulletin-hasNew");
        $.cookie("topBarMyNewsVer", Fai.top._topBarMyNewsVersion, {
            expires: 365,
            domain: document.domain,
            path: "/"
        });
        if ($(".topBarBulletinRemind").html() == "有新功能更新") {
            $("#menuUpdate").click()
        }
    });
    $(".topBarBulletinContent").mouseover(function() {
        $(".topBarBulletin").attr("_mouseIn", 1);
        $(this).show()
    }).mouseleave(function() {
        $(".topBarBulletin").attr("_mouseIn", 0);
        setTimeout(function() {
            var f = parseInt($(".topBarBulletin").attr("_mouseIn"));
            if (f == 0) {
                $(".topBarBulletinContent").hide();
                $(".topBarBulletin").removeClass("topBarBulletin-hover");
                if ($.cookie("topBarUpdateVer") != null && $.cookie("topBarUpdateVer") != Fai.top._topBarUpdateVersion) {
                    $(".topBarBulletinRemind").html("有新功能更新");
                    $(".topBarBulletinRemind").hide();
                    $(".topBarBulletin").addClass("topBarBulletin-hasNew");
                    $(".topBarBulletinContent .redPoint").show()
                }
            }
        },
        100)
    });
    $(".topBarBulletinContent .menu").click(function() {
        $(".topBarBulletinContent .menu").removeClass("menu-check");
        $(this).addClass("menu-check");
        if ($(this).attr("id") == "menuMessage") {
            $(".topBarBulletinContent #message").show();
            $(".topBarBulletinContent #update").hide()
        } else {
            $(".topBarBulletinContent #message").hide();
            $(".topBarBulletinContent #update").show();
            $(".topBarBulletinContent .redPoint").hide();
            $.cookie("topBarUpdateVer", Fai.top._topBarUpdateVersion, {
                expires: 365,
                domain: document.domain,
                path: "/"
            })
        }
    });
    if (!_oem) {
        if ($.cookie("topBarMyNewsVer") == null && $.cookie("topBarUpdateVer") == null) {
            $.cookie("topBarMyNewsVer", "-", {
                expires: 365,
                domain: document.domain,
                path: "/"
            });
            $.cookie("topBarUpdateVer", Fai.top._topBarUpdateVersion, {
                expires: 365,
                domain: document.domain,
                path: "/"
            })
        } else {
            var b = ["<span class='topBarBulletinRemind'></span>"];
            if ($.cookie("topBarMyNewsVer") != null && $.cookie("topBarMyNewsVer") != Fai.top._topBarMyNewsVersion) {
                $("#topBar").append(b.join(""));
                $(".topBarBulletinRemind").html("您有新消息");
                $(".topBarBulletinRemind").css("left", $(".topBarBulletin").position().left - $(".topBarBulletinRemind").outerWidth() / 2 + $(".topBarBulletin").outerWidth() / 2);
                $(".topBarBulletinRemind").css("top", 34);
                $(".topBarBulletinRemind").hide();
                $(".topBarBulletin").addClass("topBarBulletin-hasNew");
                if ($.cookie("topBarUpdateVer") != null && $.cookie("topBarUpdateVer") != Fai.top._topBarUpdateVersion) {
                    $(".topBarBulletinContent .redPoint").show()
                }
            } else {
                if ($.cookie("topBarUpdateVer") != null && $.cookie("topBarUpdateVer") != Fai.top._topBarUpdateVersion) {
                    $("#topBar").append(b.join(""));
                    $(".topBarBulletinRemind").html("有新功能更新");
                    $(".topBarBulletinRemind").css("left", $(".topBarBulletin").position().left - $(".topBarBulletinRemind").outerWidth() / 2 + $(".topBarBulletin").outerWidth() / 2);
                    $(".topBarBulletinRemind").css("top", 34);
                    $(".topBarBulletinRemind").hide();
                    $(".topBarBulletin").addClass("topBarBulletin-hasNew");
                    $(".topBarBulletinContent .redPoint").show()
                }
            }
        }
    }
    var d = $("#mailInfo");
    if (d.length > 0) {
        var a = 99;
        $.ajax({
            type: "post",
            url: Site.genAjaxUrl("mail_h.jsp"),
            data: "cmd=getNewMailCount",
            success: function(f) {
                var l = $.parseJSON(f);
                if (l.success) {
                    if (l.newMail > 0) {
                        $("#mailInfo").attr("title", "");
                        var k = l.newMail;
                        if (k > a) {
                            k = "99+"
                        }
                        $('<div class="mailNum">' + k + '</div><div class="mailArrows"></div>').insertAfter($(".mailIco"));
                        for (var h = 0; h < l.group.length; h++) {
                            var m = l.group[h];
                            if (m.n > 0) {
                                var j = $("#mailTip").attr("mailHref");
                                var g = m.n;
                                if (g > a) {
                                    g = "99+"
                                }
                                aliasLink = [];
                                aliasLink.push("<div class='alias'>");
                                if (g != l.newMail) {
                                    aliasLink.push("<span class='num'>[" + g + "]</span>")
                                }
                                aliasLink.push("<a title='" + g + "封未读邮件' href='http://" + j);
                                aliasLink.push("?aliasId=" + m.i + "' target='_blank' onclick='Site.logDog(100038, 14);'>");
                                aliasLink.push(m.a + "</a>");
                                aliasLink.push("</div>");
                                if (h < l.group.length - 1) {
                                    aliasLink.push("<div class='mailTipLine'></div>")
                                }
                                $("#mailTip").append(aliasLink.join(""))
                            }
                        }
                    }
                }
            }
        });
        d.mouseover(function() {
            $(this).attr("_mouseIn", 1);
            if ($(this).find(".mailNum").length > 0) {
                $(this).addClass("mailInfo-hover")
            }
            var f = $("#mailTip");
            if (f.find(".alias").length > 0) {
                f.css("left", ($(this).position().left));
                f.css("top", $(this).position().top + 25);
                $("#mailTip").show()
            }
        }).mouseleave(function() {
            $(this).attr("_mouseIn", 0);
            setTimeout("Site.hideMailTip()", 100)
        });
        $(".mailTip").mouseover(function() {
            d.attr("_mouseIn", 1);
            $(".mailTip").show()
        }).mouseleave(function() {
            d.attr("_mouseIn", 0);
            setTimeout("Site.hideMailTip()", 100)
        })
    }
    $("#prayForLove").click(function() {
        var f = true;
        if ($(this).hasClass("prayIco_on")) {
            f = false
        }
        var g = [];
        g.push("&indexGrayscale=");
        if (f) {
            g.push("true")
        } else {
            g.push("false")
        }
        $.ajax({
            type: "post",
            url: "./static/web/ajax/site_h.jsp?cmd=set",
            data: g.join(""),
            error: function() {
                Fai.ing("服务繁忙，请稍候重试", false)
            },
            success: function(h) {
                var i = $.parseJSON(h);
                if (i.success) {
                    if (f) {
                        Fai.ing("设置成功。管理状态下不置灰，请通过您的网站网址查看效果（部分浏览器可能无效）。", true);
                        $("#prayForLove").removeClass("prayIco_off").addClass("prayIco_on").attr("title", "点击取消首页置灰。")
                    } else {
                        Fai.ing("关闭成功。", true);
                        $("#prayForLove").removeClass("prayIco_on").addClass("prayIco_off").attr("title", "点击首页置灰，为雅安人民祈福。")
                    }
                }
            }
        })
    });
    ZeroClipboard.setDefaults({
        moviePath: Fai.top._resRoot + "/js/comm/ZeroClipboard/ZeroClipboard.swf",
        trustedDomains: [window.location.host],
        hoverClass: "btn-hover"
    });
    if (window.clipboardData) {
        Fai.top.$("#topBarMySiteCopyBtn").on("click",
        function() {
            var f = $(this).attr("data-clipboard-target");
            var g = $("#" + f).text();
            window.clipboardData.setData("text", g);
            Fai.ing("复制成功，快把网址发送给您的好友吧", true);
            Site.logDog(100038, 17)
        });
        Fai.top.$("#topBarMySiteCopyBtn").hover(function() {
            $(this).addClass("btn-hover")
        },
        function() {
            $(this).removeClass("btn-hover")
        })
    } else {
        var c = new ZeroClipboard(Fai.top.$("#topBarMySiteCopyBtn"));
        c.on("mouseover",
        function(f, h) {
            var g = Fai.top.$("#topBarMySiteCopyBtn").attr("data-clipboard-target");
            c.setText($("#" + g + " option:selected").text())
        });
        c.on("complete",
        function(f, g) {
            Fai.ing("复制成功，快把网址发送给您的好友吧", true);
            Site.logDog(100038, 17)
        })
    }
    $("#topBarArea").find(".styleSettingButton").first().css("border-left-color", "#2f86d3");
    if ($(".memberBarArea").height()) {
        $("#topBarArea").addClass("g_topBarArea_noShadow")
    }
};
Site.saveSacct = function(a) {
    var b = $.trim($("#topBarStaffAcct").val());
    if (b == "") {
        Fai.ing("请输入员工帐号", true);
        return
    }
    reg = /^[a-zA-Z][a-zA-Z0-9]{0,19}$/;
    if (!reg.test(b)) {
        Fai.ing("员工帐号由1-20个字符组成（字母或数字;首字为字母）");
        return
    }
    $.ajax({
        type: "post",
        url: Site.genAjaxUrl("staff_h.jsp"),
        data: "cmd=set&sid=" + a + "&sacct=" + b,
        error: function() {
            Fai.ing("系统繁忙，请稍候重试", false)
        },
        success: function(c) {
            if (Fai.successHandle(c, "保存成功", "", "", 3, 1)) {
                top.document.location.reload()
            }
        }
    })
};
Site.addNewModuleCallBack = function(b, f, d, c) {
    var a = Fai.top.Site.getModuleAttrPattern(f);
    a.changed = true;
    a.bannerType = 1;
    Fai.top.Site.setModuleStyleCss(f, ".formBanner" + f, "display", "none");
    a.border.y = 1;
    Fai.top.Site.hideModuleBorder(f);
    a.inner.y = 1;
    a.inner.l = 0;
    a.inner.r = 0;
    a.inner.t = 0;
    a.inner.b = 0;
    Fai.top.Site.setModuleStyleCssList(f, [{
        cls: ".formMiddleContent" + f,
        key: "margin-right",
        value: 0 + "px"
    },
    {
        cls: ".formMiddleContent" + f,
        key: "margin-left",
        value: 0 + "px"
    },
    {
        cls: ".formMiddleContent" + f,
        key: "margin-top",
        value: 0 + "px"
    },
    {
        cls: ".formMiddleContent" + f,
        key: "margin-bottom",
        value: 0 + "px"
    }]);
    b.reverse();
    if (b.length > 0) {
        var e = b[0];
        Fai.top.Site.addModule(e, d, c, {
            callback: null,
            parentId: "formTabContent" + f,
            callbackforTab: Fai.top.Site.addModuleCallBackForTab,
            allCheckList: b,
            iCount: b.length - 1
        })
    }
    Site.setModuleHeight(f, 200)
};
Site.addModuleCallBackForTab = function(k, b, a, o, t, f, d) {
    var m = "";
    if (d) {
        m = " style='height:" + d + "px !important;'"
    }
    var s = o.replace("formTabContent", "");
    var c = Fai.top.$("#module" + k);
    var q = c.attr("class").split(" "),
    h,
    e = false;
    for (var p in q) {
        if (/formStyle*/.test(q[p])) {
            h = q[p].substring(9)
        }
    }
    if (h == 3 || h == 16) {
        e = true
    }
    c.attr("_intab", parseInt(s));
    c.addClass("formInTab");
    var r = c.find(".titleText").text();
    if (!$("#formTabButton" + k) || $("#formTabButton" + k).length <= 0) {
        var g = Fai.top.$("#formTabButtonList" + s);
        var j = [];
        j.push("<div class='formTabButton" + (f == 0 ? " formTabButtonHover": "") + "' id='formTabButton" + k + "' tabModuleId='" + k + "' onclick='Site.changeLiCnt(" + k + ", " + e + ", 29)'>");
        j.push("<div class='formTabLeft" + (f == 0 ? " formTabLeftHover": "") + "'></div>");
        j.push("<div class='formTabMiddle" + (f == 0 ? " formTabMiddleHover": "") + "'>");
        j.push("<span class='tabButtonText'>");
        j.push(r);
        j.push("</span>");
        j.push("</div>");
        j.push("<div class='formTabRight" + (f == 0 ? " formTabRightHover": "") + "'></div>");
        j.push("</div>");
        g.prepend(j.join(""));
        if (g.hasClass("formTabButtonYList") && g.find(".tabYListPlaceholder").length < 1) {
            g.append($("<div class='tabYListPlaceholder'></div>"))
        }
    }
    if (!c.parent().hasClass("formTabCntId") && !c.hasClass("formTabCntId")) {
        c.wrap("<div class='formTabCntId' styleId='" + h + "' id='formTabCntId" + k + "'" + m + "></div>")
    }
    t.splice(0, 1);
    if (t.length > 0) {
        var l = t[0];
        f--;
        Fai.top.Site.addModule(l, b, a, {
            callback: null,
            parentId: o,
            callbackforTab: Fai.top.Site.addModuleCallBackForTab,
            allCheckList: t,
            iCount: f,
            firstTabHeight: d
        })
    }
    if (f == 0) {
        Site.bindInTabSwitch();
        Fai.top.Site.sortable();
        Fai.top.Site.computeTabsWidthHideMore(parseInt(s))
    }
};
Site.addNewMulMColModuleCallBack = function(b, g, e, c) {
    var f = $.parseJSON(b);
    var a = Fai.top.Site.getModuleAttrPattern(g);
    var d = a.contentBg;
    d.y = 1;
    Fai.top.Site.hideModuleContentBg(g);
    Site.refreshMulMColModule(g, e, c, b)
};
Site.addModuleCallBackForMulMCol = function(b, c, f, g, i, a, h) {
    var d = g.replace("mulMColContent", "");
    var j = Fai.top.$("#module" + b);
    j.attr("_inmulmcol", parseInt(d));
    j.addClass("formInMulMCol");
    j.appendTo("#mulMCol" + d + "_cid_" + i);
    a.splice(0, 1);
    if (a.length > 0) {
        var e = a[0];
        h--;
        Fai.top.Site.addModule(e, c, f, {
            callback: null,
            parentId: g,
            addToMulColId: i,
            callbackforMulMCol: Fai.top.Site.addModuleCallBackForMulMCol,
            allCheckList: a,
            iCount: h
        })
    }
    if (h == 0) {
        Fai.top.Site.displayAddModule()
    }
};
Site.refreshMulMColModule = function(p, c, b, r, s) {
    var j = $.parseJSON(r);
    var h = j.realOpenColNum;
    var k = j.inThisMulMColList;
    var m = p;
    var a = j.inThisMulMColListWidth;
    var e = j.mulColSpacing;
    var g = Fai.top.Site.getModuleAttrPattern(m);
    g.changed = true;
    if (g.bannerType != 0 || typeof(s) == "undefined") {
        g.bannerType = 1;
        Fai.top.Site.setModuleStyleCss(m, ".formBanner" + m, "display", "none")
    }
    if (typeof(s) != "undefined" && s.length >= 0) {
        $("#module" + p).find(".titleText" + p).find("span").text(s)
    }
    g.border.y = 1;
    Fai.top.Site.hideModuleBorder(m);
    g.inner.y = 1;
    g.inner.l = 0;
    g.inner.r = 0;
    g.inner.t = 0;
    g.inner.b = 0;
    Fai.top.Site.setModuleStyleCssList(m, [{
        cls: ".formMiddleContent" + m,
        key: "margin-right",
        value: 0 + "px"
    },
    {
        cls: ".formMiddleContent" + m,
        key: "margin-left",
        value: 0 + "px"
    },
    {
        cls: ".formMiddleContent" + m,
        key: "margin-top",
        value: 0 + "px"
    },
    {
        cls: ".formMiddleContent" + m,
        key: "margin-bottom",
        value: 0 + "px"
    }]);
    var o = [];
    o.push('<table width="100%" border="0" cellspacing="0" class="mulMColContentTable" cellpadding="0">');
    o.push("<tbody>");
    o.push("<tr>");
    for (var n = 1; n <= h; n++) {
        var f = 'style="';
        var d = "";
        if (n != h) {
            $.each(a,
            function(i, t) {
                if (t.i == n) {
                    d = "width:" + t.w + "px;";
                    return false
                }
            })
        }
        var q = "";
        if (e != -1) {
            q = "padding-right:" + e + "px;"
        }
        f = f + d + q + '"';
        if (n != h) {
            o.push('<td class="mulColLayout mulColPadding" ' + f + ">")
        } else {
            o.push('<td class="mulColLayout">')
        }
        o.push('<div id="mulMCol' + m + "_cid_" + n + '" class="mulMColList column"></div>');
        if (n < h) {
            var l = "";
            if (e != -1) {
                l = "right:" + (e - 2) / 2 + "px;"
            }
            o.push('<div class="mulModuleColStyleLine" style="' + l + '"></div>')
        }
        o.push("</td>")
    }
    o.push("</tr>");
    o.push("</tbody>");
    o.push("</table>");
    Fai.top.$("#mulMColContent" + m).html(o.join(""));
    if (Fai.isIE10()) {
        setTimeout(function() {
            Fai.top.$("#module" + p).find(".mulModuleColStyleLine").css("height", Fai.top.$("#module" + p).find(".mulMColContentTable").height() - 45 - 10 + "px")
        },
        0)
    }
    $.each(k,
    function(u, v) {
        var i = v.cId;
        var x = v.cList;
        var t;
        if (i <= h) {
            t = i
        } else {
            t = h
        }
        if (x.length > 0) {
            var w = x[0];
            Fai.top.Site.addModule(w, c, b, {
                callback: null,
                parentId: "mulMColContent" + m,
                addToMulColId: i,
                callbackforMulMCol: Fai.top.Site.addModuleCallBackForMulMCol,
                allCheckList: x,
                iCount: x.length - 1
            })
        } else {
            Fai.top.Site.displayAddModule();
            Fai.top.Site.sortable()
        }
    })
};
Site.bindInMulColResizableModule = function(d) {
    var b = Fai.top.$("#module" + d);
    $(b).mousemove(function() {
        $.each($(this).find(".ui-resizable-mulCol-handle"),
        function(g, j) {
            var h = -1;
            h = $(b).find(".mulMColContent .mulColLayout:not(:last)").css("padding-right").replace("px", "") || -1;
            if (typeof h != "undefined") {
                $(j).css("right", (h - 4) / 2)
            }
            $(j).css({
                zIndex: 9029
            }).show()
        })
    });
    if (Fai.isIE10()) {
        setTimeout(function() {
            b.find(".mulModuleColStyleLine").css("height", b.find(".mulMColContentTable").height() - 45 - 10 + "px")
        },
        0)
    }
    b.hover(function() {
        var g = true;
        if ($(this).attr("_autoheight") != 1) {
            g = false
        }
        var i = $(this).find(".mulMColContent .mulColLayout:not(:last)");
        $(this).disableSelection().find(".mulMColContent .mulColLayout:not(:last)").resizable({
            create: function() {
                $(this).css("position", "relative");
                $(this).children(".ui-resizable-handle").addClass("ui-resizable-mulCol-handle");
                $(this).find(".ui-resizable-mulCol-handle").attr("title", "按住鼠标调整列宽");
                $(this).find(".ui-resizable-mulCol-handle").css("right", ($(this).css("padding-right").replace("px", "") - 4) / 2);
                $(this).css({
                    width: $(this).width() + "px"
                });
                if (Fai.isIE6()) {
                    $(this).find(".ui-resizable-mulCol-handle").height($(this).height() - 2)
                }
                if (Fai.isMozilla() && parseInt($.browser.version) < 30) {
                    var j = $(this).outerWidth();
                    $(this).find(".ui-resizable-mulCol-handle").css("left", $(this).position().left + j - ($(this).css("padding-right").replace("px", "") / 2) - 3)
                }
                if (Fai.isIE10()) {
                    $(this).find(".ui-resizable-mulCol-handle").css("height", b.find(".mulMColContentTable").height())
                }
            },
            start: function(j, k) {
                Site.disableEditLayer();
                e($(this))
            },
            minWidth: 100,
            handles: "e",
            resize: function() {
                if ($(this).next().width() <= 99) {
                    $(this).resizable("option", "maxWidth", $(this).width());
                    return false
                }
                c($(this));
                if (Fai.isMozilla() && parseInt($.browser.version) < 30) {
                    var j = $(this).outerWidth();
                    $(this).find(".ui-resizable-mulCol-handle").css("left", $(this).position().left + j - ($(this).css("padding-right").replace("px", "") / 2) - 3);
                    $(this).siblings().each(function(l, m) {
                        var k = $(m).outerWidth();
                        $(m).find(".ui-resizable-mulCol-handle").css("left", $(m).position().left + k - ($(m).css("padding-right").replace("px", "") / 2) - 3)
                    })
                }
                Site.adjustPhotoCard(b)
            },
            stop: function() {
                Site.enableEditLayer();
                f($(this));
                Site.getModuleAttrData(d).changed = true;
                Site.styleChanged();
                if (g) {
                    i.css({
                        height: "auto"
                    })
                }
                Site.adjustPhotoCard(b)
            }
        });
        $(this).find(".mulMColContent .mulColLayout:not(:last)").find(".ui-resizable-mulCol-handle").each(function() {
            $(this).live("mousedown",
            function() {
                $(this).removeAttr("title");
                $(this).parents(".mulMColContent").unbind("mousemove",
                function(j) {
                    a(j)
                });
                $(this).parents(".mulMColContent").bind("mousemove",
                function(j) {
                    a(j)
                })
            }).live("mouseup",
            function() {
                $(this).attr("title", "按住鼠标调整列宽");
                $("body").enableSelection()
            })
        });
        var h = $(this).find("img.richModuleSlaveImg");
        Site.richModuleSlaveImgResize(h);
        Site.richModulePicEdit(h)
    },
    function() {
        $(this).find(".mulMColContent .mulColLayout:not(:last)").resizable("destroy")
    });
    function e(h) {
        f(h);
        var g = '<div id="_resizableToShowWidth" class="resizableToShowWidth"></div>';
        $("body").append(g)
    }
    function c(g) {
        $("#_resizableToShowWidth").show().html("左列宽: " + $(g).width() + "<br>右列宽: " + $(g).next().width() + "<br>列间距: " + $(g).css("padding-right").replace("px", ""))
    }
    function a(g) {
        $("#_resizableToShowWidth").css({
            left: g.pageX,
            top: g.pageY + 20
        })
    }
    function f(g) {
        $("#_resizableToShowWidth").remove()
    }
};
Site.bindInLayoutResizableModule = function() {
    Site.noCheckCreateMLFH();
    var b = Fai.top.$("#containerFormsCenter > .containerFormsCenterMiddle");
    b.unbind("mouseout").unbind("mouseover");
    var e = b.width();
    var f = Fai.top.$("#middleLeftForms").css("padding-right").replace("px", "");
    Fai.top.$("#middleLeftForms > .ui-resizable-handle").resizable("destroy");
    if (Fai.top.$("#middleLeftForms").css("display") == "block" && Fai.top.$("#middleRightForms").css("display") == "block") {
        Fai.top.$("#middleLeftForms").resizable({
            create: function() {
                $(this).children(".ui-resizable-handle").addClass("ui-resizable-layoutResize-handle");
                Fai.top.$("#middleLeftForms > .ui-resizable-handle").hide();
                $(this).css("position", "relative");
                Fai.top.$("#middleLeftForms > .ui-resizable-handle").attr("title", "按住鼠标调整列宽");
                Fai.top.$("#middleLeftForms > .ui-resizable-handle").css("right", f / 2);
                if (Fai.isIE6()) {
                    Fai.top.$("#middleLeftForms > .ui-resizable-handle").height($(this).height() - 2)
                }
            },
            start: function() {
                Site.disableEditLayer();
                d($(this));
                var h = b.width();
                var i = Fai.top.$("#middleLeftForms").css("padding-right").replace("px", "");
                $(this).resizable("option", "maxWidth", h - i - 215)
            },
            minWidth: 215,
            maxWidth: e - f - 215,
            handles: "e",
            resize: function() {
                if ($(this).next().width() <= 209) {
                    $(this).resizable("option", "maxWidth", $(this).width())
                }
                c($(this));
                Site.adjustPhotoCard(b)
            },
            stop: function() {
                Site.enableEditLayer();
                g($(this));
                Fai.top._colOtherStyleData.layout4Width = $(this).width();
                Fai.top._colOtherStyleData.layout5Width = Fai.top.$("#middleRightForms").width();
                Site.styleChanged();
                $(this).height("auto");
                Site.adjustPhotoCard(b)
            }
        })
    }
    Fai.top.$("#middleLeftForms > .ui-resizable-handle").mousedown(function() {
        $(this).removeAttr("title");
        b.unbind("mousemove",
        function(h) {
            a(h)
        });
        b.bind("mousemove",
        function(h) {
            a(h)
        })
    }).mouseup(function() {
        $(this).attr("title", "按住鼠标调整列宽");
        Fai.top.$("body").enableSelection()
    });
    b.hover(function() {
        if (Fai.top.$("#middleLeftForms").css("display") == "block" && Fai.top.$("#middleRightForms").css("display") == "block") {
            Fai.top.$("#middleLeftForms > .ui-resizable-handle").css({
                zIndex: 9029
            }).show()
        }
    },
    function() {
        if (Fai.top.$("#middleLeftForms").css("display") == "block" && Fai.top.$("#middleRightForms").css("display") == "block") {
            Fai.top.$("#middleLeftForms > .ui-resizable-handle").hide()
        }
    });
    function d(i) {
        g(i);
        var h = '<div id="_resizableToShowWidth" class="resizableToShowWidth"></div>';
        Fai.top.$("body").append(h)
    }
    function c(i) {
        var h = Fai.top.$("#containerFormsCenter > .containerFormsCenterMiddle").width();
        Fai.top.$("#middleRightForms").css("width", (h - $(i).width() - Math.floor($(i).css("padding-right").replace("px", ""))) + "px");
        Fai.top.$("#_resizableToShowWidth").show().html("左列宽: " + $(i).width() + "<br>右列宽: " + $(i).next().width() + "<br>列间距: " + $(i).css("padding-right").replace("px", ""))
    }
    function a(h) {
        Fai.top.$("#_resizableToShowWidth").css({
            left: h.pageX,
            top: h.pageY + 20
        })
    }
    function g(h) {
        Fai.top.$("#_resizableToShowWidth").remove()
    }
};
Site.createMiddleLeftFormsHider = function(a) {
    if ($(a).parent().hasClass("middleLeftForms") || $(a).parent().hasClass("middleRightForms")) {
        Site.noCheckCreateMLFH()
    }
};
Site.noCheckCreateMLFH = function() {
    Fai.top.$("#middleLeftFormsHider").remove();
    var b = Fai.top.$("#middleLeftForms");
    var a = Fai.top.$("#middleRightForms");
    if (b.height() < a.height()) {
        var c = $("<div id='middleLeftFormsHider' class='middleLeftFormsHider'></div>").appendTo(b);
        c.css("height", a.height() - b.height())
    }
    if (Fai.isIE6()) {
        b.find(".ui-resizable-handle").height(b.height() - 2)
    }
};
Site.isMulColModuleInIE = function(a) {
    if (Fai.isIE10()) {
        $(a).find(".ui-resizable-handle").css("height", $(a).find(".mulMColContentTable").height() + "px");
        $(a).find(".mulModuleColStyleLine").css("height", $(a).find(".mulMColContentTable").height() - 45 - 10 + "px")
    } else {
        if (Fai.isIE6()) {
            $(a).find(".ui-resizable-handle").css("height", $(a).find(".mulMColContentTable").height() + "px")
        }
    }
};
Site.adjustLayout4And5Width = function() {
    var d = Fai.top.$("#containerFormsCenter > .containerFormsCenterMiddle"),
    e = Fai.top.$("#middleLeftForms"),
    c = Fai.top.$("#middleRightForms"),
    g = d.width();
    if (e.is(":hidden") || c.is(":hidden")) {
        return
    }
    if (Fai.top._colOtherStyleData.layout4Width != 0 && Fai.top._colOtherStyleData.layout5Width != 0) {
        var b = Math.floor(e.css("paddingRight").replace("px", "")),
        a = (g - e.width() - b),
        f = e.width();
        if (a < 209) {
            a = 209;
            f = (g - 209 - b);
            e.css("width", (g - 209 - b) + "px")
        }
        Fai.top.$("#middleRightForms").css("width", a + "px");
        Fai.top._colOtherStyleData.layout4Width = f;
        Fai.top._colOtherStyleData.layout5Width = a
    } else {
        if (Fai.top._colOtherStyleData.layout4Width == 0 && Fai.top._colOtherStyleData.layout5Width == 0) {
            e.css("paddingRight", Math.floor(g * 0.02))
        }
    }
};
Site.initSiteBulletin = function(h) {
    var c = $("#siteBulletin_box");
    var g = c.height();
    if (c.length == 0) {
        return
    }
    var i = 0;
    var e = Fai.Cookie.get("siteBulletinOem_version");
    if (h && (typeof e == "undefined" || e == null)) {
        i = 1;
        var b = new Date();
        b.setTime(b.getTime() + 365 * 24 * 60 * 60 * 1000);
        Fai.Cookie.set("siteBulletinOem_version", "-", b)
    } else {
        if (Fai.top._siteBulletinOemVersion == e) {
            i = Fai.Cookie.get("siteBulletin_off")
        } else {
            i = 0;
            var b = new Date();
            b.setTime(b.getTime() + 365 * 24 * 60 * 60 * 1000);
            Fai.Cookie.set("siteBulletinOem_version", Fai.top._siteBulletinOemVersion, b)
        }
    }
    var f = $("#siteBulletin_small_box");
    var d = f.height();
    var a = $("#siteBulletin_close");
    if (i == 0) {
        c.slideDown("normal");
        a.attr("title", "点击隐藏公告")
    } else {
        f.delay(100).fadeIn(600);
        f.attr("title", "点击查看公告")
    }
    $("#siteBulletin_close").live("click",
    function() {
        c.slideUp("normal",
        function() {
            f.delay(100).fadeIn(600);
            f.attr("title", "点击查看公告");
            var j = new Date();
            j.setTime(j.getTime() + 7 * 24 * 60 * 60 * 1000);
            Fai.Cookie.set("siteBulletin_off", 1, j)
        })
    });
    f.live("click",
    function() {
        f.hide();
        c.slideDown("normal");
        a.attr("title", "点击隐藏公告")
    })
};
Site.initSiteRenewNotice = function(c) {
    var a = $("#siteRenewNotice_small_box");
    var f = $("#siteRenewNotice_close");
    var d = Fai.Cookie.get("siteRenewNotice_on");
    var e = $("#siteRenewNotice_box");
    if (7 < c && c < 31) {
        if (d != 0) {
            Site.showSiteRenewNoticeTime(e, a, 3)
        }
    } else {
        if ( - 8 < c && c < 8) {
            if (d != 0) {
                Site.showSiteRenewNoticeTime(e, a, 1)
            }
        } else {
            if ( - 31 < c && c < -7) {
                if (d != 0) {
                    Site.showSiteRenewNoticeTime(e, a, 7)
                }
            } else {
                d = -1;
                var b = new Date();
                Fai.Cookie.set("siteRenewNotice_on", 0, b)
            }
        }
    }
    if (d == 0) {
        a.show();
        $("#siteRenewNotice_close,#siteRenewNotice_close_a").live("click",
        function() {
            $("#siteRenewNotice_box").slideUp("normal",
            function() {
                a.delay(100).fadeIn(600);
                a.attr("title", "点击查看付费公告")
            })
        })
    }
    a.live("click",
    function() {
        a.hide();
        e.slideDown("normal");
        $("#siteRenewNotice_close").attr("title", "点击隐藏付费公告")
    })
};
Site.showSiteRenewNoticeTime = function(c, a, b) {
    c.show();
    $("#siteRenewNotice_close,#siteRenewNotice_close_a").live("click",
    function() {
        $("#siteRenewNotice_box").slideUp("normal",
        function() {
            a.delay(100).fadeIn(600);
            a.attr("title", "点击查看付费公告");
            var d = new Date();
            d.setTime(d.getTime() + b * 24 * 60 * 60 * 1000);
            Fai.Cookie.set("siteRenewNotice_on", 0, d)
        })
    })
};
Site.openMallEdit = function() {
    Site.popupWindow({
        title: "商城设置",
        frameSrcUrl: "manage/mallEdit.jsp?_clicka=96",
        width: 600,
        height: 484
    })
};
Site.addModule = function(M, h, z, B, F) {
    var O = null;
    var e = null;
    var X = null;
    var W = null;
    var P = null;
    var Z = null;
    var k = null;
    var r = null;
    if (typeof B == "object" && B) {
        if (!Fai.isNull(B.callback)) {
            O = B.callback
        }
        if (!Fai.isNull(B.parentId)) {
            e = B.parentId
        }
        if (!Fai.isNull(B.callbackforTab)) {
            X = B.callbackforTab
        }
        if (!Fai.isNull(B.allCheckList)) {
            W = B.allCheckList
        }
        if (!Fai.isNull(B.iCount)) {
            P = B.iCount
        }
        if (!Fai.isNull(B.firstTabHeight)) {
            Z = B.firstTabHeight
        }
        if (!Fai.isNull(B.callbackforMulMCol)) {
            k = B.callbackforMulMCol
        }
        if (!Fai.isNull(B.addToMulColId)) {
            r = B.addToMulColId
        }
    }
    var n = "";
    var I = false;
    var T = "";
    var m = true;
    if ( !! e) {
        T = e;
        I = true
    } else {
        n = Site.getAppendLayoutForms();
        if (n == "") {
            Fai.ing("当前页面没有可以添加的区域，请在页面版式中修改布局。", true);
            return
        }
    }
    var ab = Site.getAppendLayoutModule();
    if (Fai.top.$("#module" + M).length == 1) {
        var aa = Fai.top.$("#module" + M);
        if ( !! e) {
            aa.css({
                position: "relative",
                top: "0px",
                left: "0px",
                width: "100%"
            });
            aa.draggable("destroy");
            aa.resizable("destroy");
            if (aa.attr("_side") == 1) {
                aa.attr("_side", 0)
            }
            aa.unbind("mouseenter.sideModule", Site.bindSideIn1).unbind("mouseleave.sideModule", Site.bindSideOut1).unbind("mouseenter.sideModule", Site.bindSideIn2).unbind("mouseleave.sideModule", Site.bindSideOut2)
        }
        var N = parseInt(aa.attr("_inmulmcol")) || 0;
        var a = parseInt(aa.attr("_intab")) || 0;
        var s = parseInt(aa.attr("_infullmeasure")) || 0;
        if (a > 0) {
            Fai.top.Site.getModuleAttrData(a).changed = true;
            if (Fai.top.$("#module" + a).attr("_inmulmcol") > 0) {
                Fai.top.Site.getModuleAttrData(Fai.top.$("#module" + a).attr("_inmulmcol")).changed = true
            }
        }
        if (N > 0) {
            Fai.top.Site.getModuleAttrData(N).changed = true;
            if (Fai.top.$("#module" + N).attr("_infullmeasure") > 0) {
                Fai.top.Site.getModuleAttrData(Fai.top.$("#module" + N).attr("_infullmeasure")).changed = true
            }
        }
        if (s > 0) {
            Fai.top.Site.getModuleAttrData(s).changed = true
        }
        if (a > 0) {
            var f = Fai.top.$("#formTabButton" + M).parent();
            aa.attr("_intab", 0);
            aa.removeClass("formInTab");
            Fai.top.$("#formTabCntId" + M).remove();
            Fai.top.$("#formTabButton" + M).remove();
            f.find(".formTabButton").first().click()
        }
        if (N > 0) {
            aa.attr("_inmulmcol", 0);
            aa.removeClass("formInMulMCol")
        }
        Site.replaceDocumentwrite(aa);
        if (I) {
            var S = Fai.top.$("#" + T);
            if (S.length > 0) {
                if (S.hasClass("mulMColList")) {
                    if (aa.hasClass("formStyle35") || aa.hasClass("formStyle80")) {
                        I = false
                    }
                } else {
                    if (S.hasClass("fullmeasureContent")) {
                        if (aa.hasClass("formStyle80")) {
                            I = false
                        }
                    }
                }
            } else {
                I = false;
                Fai.top._appendArea = ""
            }
        }
        if ( !! ab) {
            if (ab.attr("_inmulmcol") > 0) {
                if (aa.hasClass("formStyle35")) {
                    m = false
                }
            } else {
                if (ab.attr("_intab") > 0) {
                    m = false
                } else {
                    if (ab.attr("_infullmeasure") > 0) {
                        if (aa.hasClass("formStyle80")) {
                            m = false
                        }
                    }
                }
            }
            if (ab.hasClass("formStyle80")) {
                if (!aa.hasClass("formStyle80")) {
                    m = false;
                    Fai.top._appendLayout = 2;
                    n = Site.getAppendLayoutForms()
                }
            }
        } else {
            m = false
        }
        if (I) {
            Fai.top.$("#" + T).append(aa)
        } else {
            if (m) {
                aa.insertAfter(ab)
            } else {
                if (aa.hasClass("formStyle80")) {
                    if (Site.getLayoutFormsById(n) != 24 && Site.getLayoutFormsById(n) != 25) {
                        Fai.top._appendLayout = 24;
                        n = Site.getAppendLayoutForms()
                    }
                } else {
                    if (Site.getLayoutFormsById(n) == 24 || Site.getLayoutFormsById(n) == 25) {
                        Fai.top._appendLayout = 2;
                        n = Site.getAppendLayoutForms()
                    }
                }
                var t = true;
                if (aa.hasClass("formStyle80")) {
                    t = false
                } else {
                    for (var Y = 1; Y <= 8; Y++) {
                        if (!Site.isLayoutHidden(Y)) {
                            t = false;
                            break
                        }
                    }
                }
                if (aa.data("parentId") && !Fai.top.$("#" + n).hasClass("formTabContent")) {
                    var L = aa.data("parentId");
                    var ac = Fai.top.$("#" + L);
                    if (ac.length == 1 && ac.is(":visible")) {
                        n = L;
                        t = false
                    }
                    if (L == "floatLeftTopForms" || L == "floatRightTopForms" || L == "floatLeftBottomForms" || L == "floatRightBottomForms") {
                        n = L;
                        t = false
                    }
                    if (aa.attr("_side") == 1) {
                        n = L;
                        t = false
                    }
                }
                var y = false;
                if (t) {
                    var H = Fai.top.$("#fullmeasureTopForms").children(".formStyle80");
                    var G = Fai.top.$("#fullmeasureBottomForms").children(".formStyle80");
                    if (!Site.isLayoutHidden(24) && H.length > 0) {
                        var p = parseInt(H.eq(0).attr("id").replace("module", "")) || 0;
                        Fai.top.$("#fullmeasureContent" + p).append(aa);
                        y = true;
                        n = "";
                        Fai.top.Site.getModuleAttrData(p).changed = true
                    } else {
                        if (!Site.isLayoutHidden(25) && G.length > 0) {
                            var p = parseInt(G.eq(0).attr("id").replace("module", "")) || 0;
                            Fai.top.$("#fullmeasureContent" + p).append(aa);
                            y = true;
                            n = "";
                            Fai.top.Site.getModuleAttrData(p).changed = true
                        }
                    }
                }
                if (!y) {
                    if (Fai.top.$("#" + n + " #banner").length > 0) {
                        aa.insertAfter(Fai.top.$("#banner"))
                    } else {
                        if (parseInt(aa.data("index")) < Fai.top.$("#" + n).children(".form").length) {
                            Fai.top.$("#" + n).children(".form").each(function(i, ad) {
                                if (parseInt(aa.data("index")) == i) {
                                    aa.insertBefore(ad);
                                    return
                                }
                            })
                        } else {
                            if (Fai.top.$("#" + n).hasClass("formTabContent")) {
                                aa.prependTo(Fai.top.$("#" + n));
                                var V = Fai.encodeHtml(aa.find(".titleText").text());
                                V = V.replace(/<br\/>/, "");
                                var o = aa.parents(".form").attr("id").replace("module", "");
                                var q = $("#module" + o).attr("class").split(" ");
                                var v;
                                var l = false;
                                for (var Y in q) {
                                    if (/formStyle*/.test(q[Y])) {
                                        v = q[Y].substring(9)
                                    }
                                }
                                if (v == 3 || v == 16) {
                                    l = true
                                }
                                var Z = 200;
                                var j = top.$("#formTabContent" + o).find(">.formTabCntId");
                                if (j.length > 0) {
                                    Z = j.first().height()
                                }
                                var A = "";
                                if (Z) {
                                    A = " style='height:" + Z + "px !important;'"
                                }
                                var K = Fai.top.$("#formTabButtonList" + o);
                                if (K.find("#formTabButton" + M).length < 1) {
                                    var U = [];
                                    U.push("<div class='formTabButton' id='formTabButton" + M + "' tabModuleId='" + M + "' onclick='Site.changeLiCnt(" + M + ", " + l + ")'>");
                                    U.push("<div class='formTabLeft'></div>");
                                    U.push("<div class='formTabMiddle'>");
                                    tmpTabButtom.push("<span class='tabButtonText'>");
                                    U.push(V);
                                    tmpTabButtom.push("</span>");
                                    U.push("</div>");
                                    U.push("<div class='formTabRight'></div>");
                                    U.push("</div>");
                                    $(U.join("")).prependTo(K);
                                    if (K.hasClass("formTabButtonYList") && K.find(".formTabButtonTopRight").length < 1) {
                                        K.append($("<td class='formTabButtonTopRight'></td>"))
                                    }
                                }
                                if (!aa.parent().hasClass("formTabCntId") && !aa.hasClass("formTabCntId")) {
                                    aa.wrap("<div class='formTabCntId' id='formTabCntId" + M + "'" + A + "></div>")
                                }
                                Fai.top.Site.bindInTabSwitch();
                                if (aa.attr("_autoheight") == "1") {
                                    Site.autoModuleHeight(M);
                                    Fai.top.Site.getModuleAttrPattern(M).changed = true
                                }
                                Fai.top.Site.getModuleAttrData(o).changed = true;
                                aa.attr("_intab", o);
                                aa.addClass("formInTab")
                            } else {
                                aa.appendTo(Fai.top.$("#" + n))
                            }
                        }
                    }
                }
                aa = Fai.top.$("#module" + M);
                if (!y && n == "absForms") {
                    var b = Fai.top.$("#absForms");
                    var d = b.find(".formStyle45 ,.form6 ,.formStyle40");
                    if (aa.hasClass("formStyle45") || aa.hasClass("form6") || aa.hasClass("formStyle40")) {
                        aa.css("width", "210px");
                        if (d.length == 0) {
                            aa.css("left", "0px");
                            aa.css("top", "0px")
                        } else {
                            if (d.length > 0) {
                                aa.css("left", "0px");
                                aa.css("top", d.length * 30 + "px")
                            }
                        }
                    }
                    var c = b.find(".formStyle62 ,.formStyle66 ,.formStyle65 ,.formStyle67 ,.formStyle56 ,.formStyle45 ,.form6 ,.formStyle40 ,.formStyle81");
                    var Q = b.find(".form").length - c.length;
                    if (!aa.hasClass("formStyle45") && !aa.hasClass("form6") && !aa.hasClass("formStyle40") && !aa.hasClass("formStyle79") && !aa.hasClass("formStyle81") && !aa.hasClass("formStyle82") && !aa.hasClass("formStyle83")) {
                        aa.css("width", "520px");
                        if (Q == 0) {
                            aa.css("left", "220px");
                            aa.css("top", "0px")
                        } else {
                            if (Q > 0) {
                                aa.css("left", "220px");
                                aa.css("top", Q * 30 + "px")
                            }
                        }
                    }
                }
                Site.setAbsFormsHolder2();
                var J = aa.parents(".form");
                var w = J.attr("id");
                if (J.hasClass("formStyle35")) {
                    var E = w.replace("module", "");
                    Fai.top.Site.getModuleAttrData(E).changed = true;
                    aa.attr("_inmulmcol", E)
                }
            }
        }
        if (!y && n == "absForms") {
            top.Site.floatModuleDraggable(aa)
        }
        Fai.top._moduleMoved++;
        Site.getModuleAttrPattern(M).changed = true;
        Site.styleChanged();
        Site.moduleSizeChange("module" + M);
        Site.refreshForms();
        Fai.refreshClass(aa);
        for (var Y = 0; Y < Fai.top._hiddenModuleList.length; ++Y) {
            if (Fai.top._hiddenModuleList[Y].id == M) {
                Fai.top._hiddenModuleList.splice(Y, 1);
                break
            }
        }
        Site.scrollToDiv(aa);
        if (O) {
            O(aa, true, B)
        }
        if (X) {
            X(M, h, z, e, W, P, Z)
        }
        if (k) {
            k(M, h, z, e, r, W, P)
        }
        var R = aa.attr("_side");
        if (R == 1) {
            Site.checkSideModule(aa)
        }
        if (aa.is(":hidden")) {
            aa.show()
        }
        var D = parseInt(aa.attr("_inmulmcol")) || 0;
        var g = parseInt(aa.attr("_intab")) || 0;
        var x = parseInt(aa.attr("_infullmeasure")) || 0;
        if (g > 0) {
            Fai.top.Site.getModuleAttrData(g).changed = true;
            if (Fai.top.$("#module" + g).attr("_inmulmcol") > 0) {
                Fai.top.Site.getModuleAttrData(Fai.top.$("#module" + g).attr("_inmulmcol")).changed = true
            }
        }
        if (D > 0) {
            Fai.top.Site.getModuleAttrData(D).changed = true;
            if (Fai.top.$("#module" + D).attr("_infullmeasure") > 0) {
                Fai.top.Site.getModuleAttrData(Fai.top.$("#module" + D).attr("_infullmeasure")).changed = true
            }
        }
        if (x > 0) {
            Fai.top.Site.getModuleAttrData(x).changed = true
        }
        Site.createMiddleLeftFormsHider(aa);
        Site.isMulColModuleInIE("#module" + M);
        Fai.top.$("#module" + M).trigger("Fai_onModuleLayoutChange");
        Site.triggerGobalEvent("site_addModule", M)
    } else {
        Fai.top._appendArea = "";
        Fai.ing("正在加载模块……", true);
        var u = top.location.href;
        var C = top.Fai.encodeUrl(u);
        if (h == 0 && F) {
            h = F
        }
        $.ajax({
            type: "post",
            url: Site.genAjaxUrl("module_h.jsp"),
            data: "cmd=getModuleDiv&id=" + M + "&colId=" + h + "&extId=" + z + "&qurl=" + C,
            error: function() {
                Fai.ing("系统繁忙，请稍候重试", false)
            },
            success: function(an) {
                if (Fai.successHandle(an, "添加成功", "", "", 3, 1)) {
                    if (Fai.top.$("#module" + M).length >= 1) {
                        Site.dockModuleResize(Fai.top.$("#module" + M));
                        Site.createMiddleLeftFormsHider(Fai.top.$("#module" + M));
                        Site.isMulColModuleInIE("#module" + M);
                        if (Fai.top.$("#module" + M).hasClass("formStyle80")) {
                            Fai.top.$(".fullmeasureContent").each(function(i, aI) {
                                Site.inFullmeasureModuleSortable($(aI).attr("id"))
                            })
                        }
                        return
                    }
                    an = jQuery.parseJSON(an);
                    var ap = Fai.top.$(Site.replaceDocumentwriteText(an.div));
                    Site.checkAddSpecialModule(ap, an.id);
                    if (h != Fai.top._colId) {
                        n = Site.getLayoutForms(an.layout);
                        if (n == "") {
                            n = "centerTopForms"
                        }
                        var ad = Fai.top.$("#" + n);
                        if (ad.is(":hidden")) {
                            Site.showLayout(an.layout)
                        }
                    }
                    if (I) {
                        var ae = Fai.top.$("#" + T);
                        if (ae.length > 0) {
                            if (ae.hasClass("mulMColList")) {
                                if (ap.hasClass("formStyle35") || ap.hasClass("formStyle80")) {
                                    I = false
                                }
                            } else {
                                if (ae.hasClass("fullmeasureContent")) {
                                    if (ap.hasClass("formStyle80")) {
                                        I = false
                                    }
                                }
                            }
                        } else {
                            I = false;
                            Fai.top._appendArea = ""
                        }
                    }
                    if ( !! ab) {
                        if (ab.attr("_inmulmcol") > 0) {
                            if (ap.hasClass("formStyle35")) {
                                m = false
                            }
                        } else {
                            if (ab.attr("_intab") > 0) {
                                m = false
                            } else {
                                if (ab.attr("_infullmeasure") > 0) {
                                    if (ap.hasClass("formStyle80")) {
                                        m = false
                                    }
                                }
                            }
                        }
                        if (ab.hasClass("formStyle80")) {
                            if (!ap.hasClass("formStyle80")) {
                                m = false;
                                Fai.top._appendLayout = 2;
                                n = Site.getAppendLayoutForms()
                            }
                        }
                    } else {
                        m = false
                    }
                    if (I) {
                        Fai.top.$("#" + T).append(ap)
                    } else {
                        if (m) {
                            ap.insertAfter(ab);
                            ap = Fai.top.$("#module" + M)
                        } else {
                            if (ap.hasClass("formStyle80")) {
                                if (Site.getLayoutFormsById(n) != 24 && Site.getLayoutFormsById(n) != 25) {
                                    Fai.top._appendLayout = 24;
                                    n = Site.getAppendLayoutForms()
                                }
                            } else {
                                if (Site.getLayoutFormsById(n) == 24 || Site.getLayoutFormsById(n) == 25) {
                                    Fai.top._appendLayout = 2;
                                    n = Site.getAppendLayoutForms()
                                }
                            }
                            var au = true;
                            if (ap.hasClass("formStyle80")) {
                                au = false
                            } else {
                                for (var ay = 1; ay <= 8; ay++) {
                                    if (!Site.isLayoutHidden(ay)) {
                                        au = false;
                                        break
                                    }
                                }
                            }
                            var aq = false;
                            if (au) {
                                var ah = Fai.top.$("#fullmeasureTopForms").children(".formStyle80");
                                var ai = Fai.top.$("#fullmeasureBottomForms").children(".formStyle80");
                                if (!Site.isLayoutHidden(24) && ah.length > 0) {
                                    var ao = parseInt(ah.eq(0).attr("id").replace("module", "")) || 0;
                                    Fai.top.$("#fullmeasureContent" + ao).append(ap);
                                    aq = true;
                                    n = "";
                                    Fai.top.Site.getModuleAttrData(ao).changed = true
                                } else {
                                    if (!Site.isLayoutHidden(25) && ai.length > 0) {
                                        var ao = parseInt(ai.eq(0).attr("id").replace("module", "")) || 0;
                                        Fai.top.$("#fullmeasureContent" + ao).append(ap);
                                        aq = true;
                                        n = "";
                                        Fai.top.Site.getModuleAttrData(ao).changed = true
                                    }
                                }
                            }
                            if (!aq) {
                                if (Fai.top.$("#" + n + " #banner").length > 0) {
                                    ap.insertAfter(Fai.top.$("#banner"))
                                } else {
                                    ap.appendTo(Fai.top.$("#" + n))
                                }
                            }
                            ap = Fai.top.$("#module" + M);
                            if (n == "absForms") {
                                var ax = Fai.top.$("#absForms");
                                var aF = ax.find(".formStyle45 ,.form6 ,.formStyle40");
                                if (ap.hasClass("formStyle45") || ap.hasClass("form6") || ap.hasClass("formStyle40")) {
                                    ap.css("width", "210px");
                                    if (aF.length == 0) {
                                        ap.css("left", "0px");
                                        ap.css("top", "0px")
                                    } else {
                                        if (aF.length > 0) {
                                            ap.css("left", "0px");
                                            ap.css("top", aF.length * 30 + "px")
                                        }
                                    }
                                }
                                var aD = ax.find(".formStyle62 ,.formStyle66 ,.formStyle65 ,.formStyle67 ,.formStyle56 ,.formStyle45 ,.form6 ,.formStyle40 .formStyle81");
                                var aB = ax.find(".form").length - aD.length;
                                if (!ap.hasClass("formStyle62") && !ap.hasClass("form36") && !ap.hasClass("form33") && !ap.hasClass("form37") && !ap.hasClass("form21") && !ap.hasClass("formStyle45") && !ap.hasClass("form6") && !ap.hasClass("formStyle40") && !ap.hasClass("formStyle79") && !ap.hasClass("formStyle81") && !ap.hasClass("formStyle82") && !ap.hasClass("formStyle83")) {
                                    ap.css("width", "520px");
                                    if (aB == 0) {
                                        ap.css("left", "220px");
                                        ap.css("top", "0px")
                                    } else {
                                        if (aB > 0) {
                                            ap.css("left", "220px");
                                            ap.css("top", aB * 30 + "px")
                                        }
                                    }
                                }
                            }
                            Site.setAbsFormsHolder2();
                            var ak = ap.parents(".form");
                            var aG = ak.attr("id");
                            if (ak.hasClass("formStyle35")) {
                                var aC = aG.replace("module", "");
                                Fai.top.Site.getModuleAttrData(aC).changed = true;
                                ap.attr("_inmulmcol", aC)
                            }
                        }
                    }
                    if (n == "floatLeftTopForms" || n == "floatRightTopForms" || n == "floatLeftBottomForms" || n == "floatRightBottomForms" || n == "absForms" || n == "absTopForms" || n == "absBottomForms") {
                        top.Site.floatModuleDraggable(ap)
                    }
                    if (ap.attr("_side") == 2) {
                        var am = ap.position().left;
                        var at = ap.position().top;
                        var aH = ap.data("toFlutterFlag");
                        var ag = ap.attr("_flutterSwitch");
                        if (!aH) {
                            ap.data("startFlutterXPos", am);
                            ap.data("startFlutterYPos", at)
                        } else {
                            var al = ap.data("startFlutterXPos");
                            var ar = ap.data("startFlutterYPos");
                            if (!al && !ar) {
                                ap.data("startFlutterXPos", am);
                                ap.data("startFlutterYPos", at)
                            }
                        }
                        var aw = ap.data("startFlutterParentId");
                        if (!aw) {
                            ap.data("startFlutterParentId", ap.parent().attr("id"))
                        }
                        ap.data("flutterXPos", ap.offset().left);
                        ap.data("flutterYPos", ap.offset().top);
                        ap.data("flutterXon", true);
                        ap.data("flutterYon", true);
                        ap.attr("_flutterSwitch", true)
                    }
                    ap.mouseover(function() {
                        var i = ap.attr("_side");
                        if (i == 2) {
                            Site.stopFlutterInterval(ap)
                        }
                    });
                    ap.mouseleave(function() {
                        var aI = ap.attr("_side");
                        var i = ap.attr("_flutterSwitch");
                        if (aI == 2 && (i == "false" || !i)) {
                            Site.startFlutterInterval(ap)
                        }
                    });
                    if (ap.attr("_side") == 1) {
                        top.Site.refreshSideBtn(ap)
                    }
                    var av = Fai.top.$("#module" + M).find(".formTab .form");
                    if (av.length > 0) {
                        var aA = [];
                        Fai.top.$("#formTab" + M).find(".form").each(function() {
                            var aI = parseInt($(this).attr("_intab"));
                            var i = $(this).attr("id");
                            i = parseInt(i.replace("module", ""));
                            if (aI > 0) {
                                if (M == aI) {
                                    aA.push(parseInt(i))
                                }
                            }
                        });
                        $.each(aA,
                        function(aI, aJ) {
                            Fai.top.$(".form" + aJ).each(function() {
                                if (parseInt($(this).attr("_intab")) != M) {
                                    $(this).remove()
                                }
                            })
                        })
                    }
                    var az = Site.getModuleAttrPattern(M);
                    az.outside.y = 0;
                    az.changed = true;
                    Site.removeModuleStyleCssList(M, [{
                        cls: "",
                        key: "padding"
                    },
                    {
                        cls: "",
                        key: "margin-right"
                    },
                    {
                        cls: "",
                        key: "margin-left"
                    },
                    {
                        cls: "",
                        key: "margin-top"
                    },
                    {
                        cls: "",
                        key: "margin-bottom"
                    }]);
                    Fai.top._moduleMoved++;
                    Site.styleChanged();
                    Site.refreshForms();
                    Fai.refreshClass(ap);
                    for (var ay = 0; ay < Fai.top._hiddenModuleList.length; ++ay) {
                        if (Fai.top._hiddenModuleList[ay].id == M) {
                            Fai.top._hiddenModuleList.splice(ay, 1);
                            break
                        }
                    }
                    Site.scrollToDiv(ap);
                    if (O) {
                        O(ap, false, B)
                    }
                    if (X) {
                        X(M, h, z, e, W, P, Z)
                    }
                    if (k) {
                        k(M, h, z, e, r, W, P)
                    }
                    var aj = parseInt(ap.attr("_inmulmcol")) || 0;
                    var af = parseInt(ap.attr("_intab")) || 0;
                    var aE = parseInt(ap.attr("_infullmeasure")) || 0;
                    if (af > 0) {
                        Fai.top.Site.getModuleAttrData(af).changed = true;
                        if (Fai.top.$("#module" + af).attr("_inmulmcol") > 0) {
                            Fai.top.Site.getModuleAttrData(Fai.top.$("#module" + af).attr("_inmulmcol")).changed = true
                        }
                    }
                    if (aj > 0) {
                        Fai.top.Site.getModuleAttrData(aj).changed = true;
                        if (Fai.top.$("#module" + aj).attr("_infullmeasure") > 0) {
                            Fai.top.Site.getModuleAttrData(Fai.top.$("#module" + aj).attr("_infullmeasure")).changed = true
                        }
                    }
                    if (aE > 0) {
                        Fai.top.Site.getModuleAttrData(aE).changed = true
                    }
                    Site.dockModuleResize(Fai.top.$("#module" + M));
                    Site.createMiddleLeftFormsHider(Fai.top.$("#module" + M));
                    Site.isMulColModuleInIE("#module" + M);
                    if (Fai.top.$("#module" + M).hasClass("formStyle80")) {
                        Fai.top.$(".fullmeasureContent").each(function(i, aI) {
                            Site.inFullmeasureModuleSortable($(aI).attr("id"))
                        })
                    }
                    Site.triggerGobalEvent("site_addModule", M)
                }
            }
        })
    }
    Fai.top.choiceAppendLocation = false
};
Site.delHiddenModule = function(b) {
    for (var a = 0; a < Fai.top._hiddenModuleList.length; ++a) {
        if (Fai.top._hiddenModuleList[a].id == b) {
            Fai.top._hiddenModuleList.splice(a, 1);
            break
        }
    }
};
Site.setGlobalModule = function(e, d) {
    var c = new Array(),
    b = d ? 55 : 85;
    c.push("<div style='line-height:20px; color:black; padding:10px 0px; text-align:center;'>");
    if (d) {
        c.push("设置后，该模块将出现在所有栏目页面中。")
    } else {
        c.push("取消后，该模块的布局修改将不会同步到所有栏目。")
    }
    c.push("</div>");
    if (!d) {
        c.push("<div style='color:black; padding:10px 5px;'>");
        c.push("<input id='removeInOtherPages' type='checkbox' checked='checked' />");
        c.push("<span style='cursor:pointer;' onclick=\"$('#removeInOtherPages')[0].click();\">同时从其他页面中移除</span>");
        c.push("</div>")
    }
    var a = Fai.popupBodyWindow({
        title: "操作提示",
        content: c.join(""),
        width: 350,
        height: b
    });
    Fai.addPopupBodyWindowBtn(a, {
        id: "save",
        text: "确 定",
        click: function() {
            Fai.top._removeOthers = $("#removeInOtherPages").attr("checked") ? true: false;
            if (Fai.top._changeStyleNum > 0) {
                var f = {};
                f.fun = Site.setGlobalModule2;
                f.args = new Array();
                f.args.push(e);
                f.args.push(d);
                Site.popupStyleChangeBodyWindow("网站设计已更改，保存后才可应用，是否立即保存？", f)
            } else {
                Site.setGlobalModule2(e, d)
            }
            Fai.closePopupBodyWindow(a)
        }
    });
    Fai.addPopupBodyWindowBtn(a, {
        id: "cancel",
        text: "取 消",
        click: "close"
    });
    if (d) {
        Site.logDog(100045, 32)
    } else {
        Site.logDog(100045, 33)
    }
};
Site.setGlobalModule2 = function(e, c) {
    var b = Fai.top._colId,
    a = Fai.top._extId,
    d = "cmd=setGlobalModule&_clicka=26&global=" + c + "&id=" + e + "&colId=" + b + "&extId=" + a;
    if (Fai.top._removeOthers) {
        d += "&removeOthers=true"
    }
    if (c) {
        Fai.ing("正在设置模块为全站模块……", true)
    } else {
        Fai.ing("正在取消全站模块……", true)
    }
    $.ajax({
        type: "post",
        url: Site.genAjaxUrl("site_h.jsp"),
        data: d,
        error: function() {
            Fai.ing("系统繁忙，请稍候重试", false)
        },
        success: function(f) {
            if (Fai.successHandle(f, "", "", "", 3, 1)) {
                Fai.top.location.reload()
            }
        }
    })
};
Site.setModuleStyle = function(a) {
    Site.popupWindow(a);
    Site.logDog(100045, 31)
};
Site.applyModuleTo = function(b) {
    if (Fai.top._changeStyleNum > 0) {
        var a = {};
        a.fun = Site.applyModuleTo2;
        a.args = [];
        a.args.push(b);
        Site.popupStyleChangeBodyWindow("网站设计已更改，保存后才可应用，是否立即保存？", a);
        return
    }
    Site.applyModuleTo2(b);
    Site.logDog(100045, 34)
};
Site.applyModuleTo2 = function(c) {
    var b = Fai.top._colId;
    var a = Fai.top._extId;
    Site.popupWindow({
        title: "添加模块到指定栏目",
        frameSrcUrl: "manage/applyModuleTo.jsp?id=" + c + "&colId=" + b + "&extId=" + a + "&ran=" + Math.random(),
        width: "500",
        height: "320"
    })
};
Site.removeModuleInAll = function(c, a) {
    if (a) {
        if (!confirm("移除后全部页面栏目都将隐藏此模块，确定移除？")) {
            return
        }
    } else {
        if (!confirm("移除后其他页面栏目都将隐藏此模块，只保留本页面的，确定移除？")) {
            return
        }
    }
    if (Fai.top._changeStyleNum > 0) {
        var b = {};
        b.fun = Site.removeModuleInAll2;
        b.args = new Array();
        b.args.push(c);
        b.args.push(a);
        Site.popupStyleChangeBodyWindow("网站设计已更改，保存后才可移除，是否立即保存？", b);
        return
    }
    Site.removeModuleInAll2(c, a)
};
Site.removeModuleInAll2 = function(b, a) {
    Fai.ing("正在移除模块……", true);
    $.ajax({
        type: "post",
        url: Site.genAjaxUrl("site_h.jsp"),
        data: "cmd=removeModuleInAll&_clicka=52&id=" + b + "&colId=" + Fai.top._colId + "&extId=" + Fai.top._extId + "&all=" + a,
        error: function() {
            Fai.ing("系统繁忙，请稍候重试", false)
        },
        success: function(c) {
            if (Fai.successHandle(c, "移除成功", "", "", 3, 1)) {
                Fai.top.location.reload()
            }
        }
    })
};
Site.delModule = function(c, a, k, h) {
    Site.removeAllEditLayer();
    if (!confirm("删除后模块将无法恢复，同时从所有使用到的栏目中移除，确定删除“" + a + "”？")) {
        return
    }
    Fai.ing("正在删除模块……", true);
    var e = Fai.top.$("#module" + c);
    var d = false;
    var f = e.attr("_intab");
    var l = Fai.top.$("#formTabButton" + c).parent();
    if (e.parent().hasClass("middleLeftForms") || e.parent().hasClass("middleRightForms")) {
        d = true
    }
    if (f > 0) {
        Fai.top.$("#formTabCntId" + c).remove();
        Fai.top.$("#formTabButton" + c).remove();
        l.find(".formTabButton").first().click()
    }
    if (Fai.top.$("#" + c + "tips").length > 0) {
        Fai.top.Fai.closeTip("#formTabButtonList" + c)
    }
    if (e.hasClass("formStyle29")) {
        var b = [];
        Fai.top.$("#formTab" + c).find(".form").each(function() {
            var m = parseInt($(this).attr("_intab"));
            var i = $(this).attr("id");
            i = parseInt(i.replace("module", ""));
            if (m > 0) {
                if (c == m) {
                    b.push(parseInt(i))
                }
            }
        });
        $.each(b,
        function(m, o) {
            Fai.top.Site.hideModule(o, true)
        })
    }
    if (e.hasClass("formStyle35")) {
        var j = [];
        e.find(".mulMColContent .mulColLayout .form").each(function(m, n) {
            var o = parseInt($(this).attr("_inmulmcol"));
            var i = $(this).attr("id");
            i = parseInt(i.replace("module", ""));
            if (o > 0) {
                if (c == o) {
                    j.push(parseInt(i))
                }
            }
        });
        $.each(j,
        function(m, o) {
            Fai.top.Site.hideModule(o, true)
        })
    }
    if (k == 29 || k == 35) {
        if (typeof h != "undefined") {
            $.each(h,
            function(m, o) {
                if (Fai.top.$("#module" + o).length == 0) {
                    Fai.top._hiddenModuleList.push(o)
                }
            })
        }
    }
    e.remove();
    Site.refreshForms();
    Site.refreshAllAbsForms();
    for (var g = 0; g < Fai.top._hiddenModuleList.length; ++g) {
        if (Fai.top._hiddenModuleList[g].id == c) {
            Fai.top._hiddenModuleList.splice(g, 1);
            break
        }
    }
    if ($.inArray(c, Fai.top._delModuleIdList) == -1) {
        Fai.top._delModuleIdList.push(c)
    }
    Site.triggerGobalEvent("site_delModule", [c]);
    Fai.removeIng();
    Site.styleChanged();
    if (d) {
        Site.noCheckCreateMLFH()
    }
    Site.setRefreshInfo("moduleEdit", true)
};
Site.oneKeySetModuleTB = function(d, c) {
    var a = Site.getModuleAttrPattern(d);
    var b = Fai.top.$("#module" + d);
    if (c) {
        a.border.y = 1;
        Site.hideModuleBorder(d);
        a.bannerType = 1;
        Site.setModuleStyleCss(d, ".formBanner" + d, "display", "none");
        a.contentBg.y = 1;
        Site.hideModuleContentBg(d);
        if (b.hasClass("formStyle81")) {
            Site.setFlBtnHasBannerModuleHeight(d)
        }
        a.changed = true
    } else {
        a.border.y = 0;
        Site.showModuleBorder(d);
        a.bannerType = 0;
        Site.removeModuleStyleCss(d, ".formBanner" + d, "display");
        if (b.hasClass("formStyle81")) {
            Site.setFlBtnHasBannerModuleHeight(d)
        } else {
            a.contentBg.y = 0;
            Site.showModuleContentBg(d)
        }
        a.changed = true
    }
    Site.logDog(100045, 40);
    Site.styleChanged()
};
Site.getOneKeySetModuleTBStatus = function(d) {
    var a = Site.getLockStatus(d);
    var b = Site.getAbsStatus(d);
    var c = Site.getSideStatus(d);
    var e = Site.getFlutterStatus2(d);
    if (a == 0 || b == 0 || e == 0) {
        return 0
    } else {
        if (c == 0) {
            return - 1
        } else {
            return - 1
        }
    }
};
Site.hideModule = function(p, t, f, v) {
    var b = Fai.top.$("#module" + p);
    if (b.length == 0) {
        return false
    }
    var d = {};
    d.id = p;
    d.top = b.offset().top;
    d.left = b.offset().left;
    d.width = b.outerWidth();
    d.height = b.outerHeight();
    d.show = !t;
    Site.triggerGobalEvent("site_hideModule_before", d);
    var r = b.parent().attr("id");
    var m = b.parent().hasClass("middleLeftForms");
    var s = b.parent().hasClass("middleRightForms");
    var k = parseInt(b.attr("_inmulmcol")) || 0;
    var a = parseInt(b.attr("_intab")) || 0;
    var g = parseInt(b.attr("_infullmeasure")) || 0;
    if (a > 0) {
        Fai.top.Site.getModuleAttrData(a).changed = true;
        if (Fai.top.$("#module" + a).attr("_inmulmcol") > 0) {
            Fai.top.Site.getModuleAttrData(Fai.top.$("#module" + a).attr("_inmulmcol")).changed = true
        }
    }
    if (k > 0) {
        Fai.top.Site.getModuleAttrData(k).changed = true;
        if (Fai.top.$("#module" + k).attr("_infullmeasure") > 0) {
            Fai.top.Site.getModuleAttrData(Fai.top.$("#module" + k).attr("_infullmeasure")).changed = true
        }
    }
    if (g > 0) {
        Fai.top.Site.getModuleAttrData(g).changed = true
    }
    var l = b.attr("_intab");
    var u = b.attr("_inmulmcol");
    if (l == 0 && u == 0) {
        Fai.top.$("#" + r).children(".form").each(function(i, w) {
            var x = $(this).attr("id").replace("module", "");
            if (x == p) {
                b.data("index", i)
            }
        })
    }
    if (l > 0) {
        b.attr("_intab", 0);
        b.removeClass("formInTab");
        r = b.parent().parent().attr("id");
        var j = b.parents(".form");
        if (j.length > 0) {
            var n = parseInt(j.attr("id").replace("module", ""));
            Fai.top.Site.getModuleAttrData(n).changed = true
        }
    }
    if (u > 0) {
        b.attr("_inmulmcol", 0);
        b.removeClass("formInMulMCol");
        var j = b.parents(".form");
        var n = parseInt(j.attr("id").replace("module", ""));
        Fai.top.Site.getModuleAttrData(n).changed = true
    }
    Site.removeAllEditLayer();
    Site.replaceDocumentwrite(b);
    b.data("parentId", r);
    b.appendTo(Fai.top.$("#hiddenModuleForms"));
    if (l > 0) {
        var o = Fai.top.$("#formTabButton" + p).parent();
        o.find(".formTabButton").first().click();
        Fai.top.$("#formTabCntId" + p).remove();
        Fai.top.$("#formTabButton" + p).remove()
    }
    Fai.top._moduleMoved++;
    Site.styleChanged();
    Site.refreshForms();
    Site.refreshAllAbsForms();
    for (var q = 0; q < Fai.top._hiddenModuleList.length; ++q) {
        if (Fai.top._hiddenModuleList[q].id == p) {
            Fai.top._hiddenModuleList.splice(q, 1);
            break
        }
    }
    var c = b.attr("_global");
    var h = b.attr("_independent");
    if (c == "true") {
        if (v || h === "true") {
            Fai.top._hiddenModuleList.push({
                id: parseInt(p)
            })
        } else {
            Fai.top._hiddenModuleList.push({
                id: parseInt(p),
                global: true
            })
        }
    } else {
        Fai.top._hiddenModuleList.push({
            id: parseInt(p)
        })
    }
    var e = b.find(".form");
    if (e.length > 0) {
        e.each(function() {
            childId = $(this).attr("id").replace("module", "");
            for (var w = 0; w < Fai.top._hiddenModuleList.length; ++w) {
                if (Fai.top._hiddenModuleList[w].id == childId) {
                    Fai.top._hiddenModuleList.splice(w, 1);
                    break
                }
            }
            Fai.top._hiddenModuleList.push({
                id: parseInt(childId)
            })
        })
    }
    if (!t) {
        Site.functionInterface({
            name: "faiFloatPanel"
        },
        1)
    }
    if (typeof f != "undefined" && f != null) {
        f()
    }
    Site.clearModuleOutSide("module" + p);
    Site.triggerGobalEvent("site_hideModule", [p]);
    if (!v) {
        Site.logDog(100045, 12)
    } else {
        Site.logDog(100045, 35)
    }
    if (m || s) {
        Site.noCheckCreateMLFH()
    }
    Site.isMulColModuleInIE("#module" + p)
};
Site.independentModule = function(f, c) {
    var b = Fai.top.$("#module" + f);
    if (b.length == 0) {
        return
    }
    var d = b.attr("_global");
    var a = b.attr("_independent");
    if (c) {
        if (!d) {
            return
        }
    } else {
        if (!a) {
            return
        }
    }
    if (Fai.top._changeStyleNum > 0) {
        var e = {};
        e.fun = Site.independentModule2;
        e.args = new Array();
        e.args.push(f);
        e.args.push(c);
        Site.popupStyleChangeBodyWindow("网站设计已更改，保存后才可设置，是否立即保存？", e);
        return
    }
    Site.independentModule2(f, c)
};
Site.independentModule2 = function(b, a) {
    if (a) {
        Site.logDog(100045, 38)
    } else {
        Site.logDog(100045, 39)
    }
    Fai.ing("正在设置模块独立布局……", true);
    $.ajax({
        type: "post",
        url: Site.genAjaxUrl("site_h.jsp"),
        data: "cmd=independentModule&_clicka=52&id=" + b + "&colId=" + Fai.top._colId + "&extId=" + Fai.top._extId + "&independent=" + a,
        error: function() {
            Fai.ing("系统繁忙，请稍候重试", false)
        },
        success: function(c) {
            if (Fai.successHandle(c, "设置成功", "", "", 3, 1)) {
                Fai.top.location.reload()
            }
        }
    })
};
Site.addNewModule = function(A, s, w, t, q) {
    var D = null;
    var I = null;
    var d = null;
    var g = null;
    var p = null;
    var B = null;
    if (typeof q == "object" && q) {
        if (q.callback) {
            D = q.callback
        }
        if (q.allCheckList) {
            I = q.allCheckList
        }
        if (q.parentId) {
            d = q.parentId
        }
        if (q.colId) {
            g = q.colId
        }
        if (q.extId) {
            p = q.extId
        }
        if (q.returnModuledata) {
            returnModuledata = q.returnModuledata
        }
    }
    if (A === void 0 || !A) {
        return
    }
    var j = "";
    var x = false;
    var G = "";
    var h = true;
    if (typeof w == "undefined" || !w) {
        j = Site.getAppendLayoutForms()
    } else {
        j = w
    }
    if ($.trim(Fai.top._appendArea) != "") {
        x = true;
        G = Fai.top._appendArea
    }
    Fai.top._appendArea = "";
    if (j == "") {
        Fai.ing("当前页面没有可以添加的区域，请在页面版式中修改布局。", true);
        return
    }
    var K = Site.getAppendLayoutModule();
    var y = Fai.top.$("#module" + A);
    var e = false;
    if (y.length > 0) {
        e = true;
        y.remove()
    }
    var f = Fai.top.$(Site.replaceDocumentwriteText(s));
    if (x) {
        var F = Fai.top.$("#" + G);
        if (F.length > 0) {
            if (F.hasClass("mulMColList")) {
                if (f.hasClass("formStyle35") || f.hasClass("formStyle80")) {
                    x = false
                }
            } else {
                if (F.hasClass("fullmeasureContent")) {
                    if (f.hasClass("formStyle80")) {
                        x = false
                    }
                }
            }
        } else {
            x = false;
            Fai.top._appendArea = ""
        }
    }
    if ( !! K) {
        if (K.attr("_inmulmcol") > 0) {
            if (f.hasClass("formStyle35")) {
                h = false
            }
        } else {
            if (K.attr("_intab") > 0) {
                h = false
            } else {
                if (K.attr("_infullmeasure") > 0) {
                    if (f.hasClass("formStyle80")) {
                        h = false
                    }
                }
            }
        }
        if (K.hasClass("formStyle80")) {
            if (!f.hasClass("formStyle80")) {
                h = false;
                Fai.top._appendLayout = 2;
                j = Site.getAppendLayoutForms()
            }
        }
    } else {
        h = false
    }
    var C = false;
    if (x) {
        var H = Fai.top.$("#" + G);
        H.append(f);
        if (H.hasClass("formTabContent")) {
            Site.addModuleCallBackForTab(A, 1, null, G, [], 0, 200);
            H.find(".addNewModule").remove();
            var k = parseInt(G.replace("formTabContent", ""));
            Site.getModuleAttrData(k).changed = true;
            Site.sortable()
        }
    } else {
        if (h) {
            if (Fai.top.addModule_insertBefore) {
                f.insertBefore(K);
                Fai.top.addModule_insertBefore = false
            } else {
                f.insertAfter(K)
            }
        } else {
            C = true;
            if (f.hasClass("formStyle80")) {
                if (Site.getLayoutFormsById(j) != 24 && Site.getLayoutFormsById(j) != 25) {
                    Fai.top._appendLayout = 24;
                    j = Site.getAppendLayoutForms()
                }
            } else {
                if (Site.getLayoutFormsById(j) == 24 || Site.getLayoutFormsById(j) == 25) {
                    Fai.top._appendLayout = 2;
                    j = Site.getAppendLayoutForms()
                }
            }
            var m = true;
            if (f.hasClass("formStyle80")) {
                m = false
            } else {
                for (var J = 1; J <= 8; J++) {
                    if (!Site.isLayoutHidden(J)) {
                        m = false;
                        break
                    }
                }
            }
            var o = false;
            if (m) {
                var v = Fai.top.$("#fullmeasureTopForms").children(".formStyle80");
                var u = Fai.top.$("#fullmeasureBottomForms").children(".formStyle80");
                if (!Site.isLayoutHidden(24) && v.length > 0) {
                    var l = parseInt(v.eq(0).attr("id").replace("module", "")) || 0;
                    Fai.top.$("#fullmeasureContent" + l).append(f);
                    o = true;
                    j = "";
                    Fai.top.Site.getModuleAttrData(l).changed = true;
                    Site.dockModuleAutoHeight(l)
                } else {
                    if (!Site.isLayoutHidden(25) && u.length > 0) {
                        var l = parseInt(u.eq(0).attr("id").replace("module", "")) || 0;
                        Fai.top.$("#fullmeasureContent" + l).append(f);
                        o = true;
                        j = "";
                        Fai.top.Site.getModuleAttrData(l).changed = true;
                        Site.dockModuleAutoHeight(l)
                    }
                }
            }
            if (!o) {
                if (Fai.top.$("#" + j + " #banner").length > 0) {
                    f.insertAfter(Fai.top.$("#banner"))
                } else {
                    if (q.onhead) {
                        f.prependTo(Fai.top.$("#" + j))
                    } else {
                        f.appendTo(Fai.top.$("#" + j))
                    }
                }
            }
        }
    }
    f = Fai.top.$("#module" + A);
    if (C && j == "absForms") {
        var a = Fai.top.$("#absForms");
        var c = a.find(".formStyle45 ,.form6 ,.formStyle40");
        if (f.hasClass("formStyle45") || f.hasClass("form6") || f.hasClass("formStyle40")) {
            f.css("width", "210px");
            if (c.length == 0) {
                f.css("left", "0px");
                f.css("top", "0px")
            } else {
                if (c.length >= 1) {
                    f.css("left", "0px");
                    f.css("top", c.length * 30 + "px")
                }
            }
        }
        var b = a.find(".formStyle62 ,.formStyle66 ,.formStyle65 ,.formStyle67 ,.formStyle56 ,.formStyle45 ,.form6 ,.formStyle40 ");
        var E = a.find(".form").length - b.length;
        if (!f.hasClass("formStyle62") && !f.hasClass("form36") && !f.hasClass("form33") && !f.hasClass("form37") && !f.hasClass("form21") && !f.hasClass("formStyle45") && !f.hasClass("form6") && !f.hasClass("formStyle40") && !f.hasClass("formStyle79") && !f.hasClass("formStyle81") && !f.hasClass("formStyle82") && !f.hasClass("formStyle83")) {
            f.css("width", "520px");
            if (E == 0) {
                f.css("left", "220px");
                f.css("top", "0px")
            } else {
                if (E > 0) {
                    f.css("left", "220px");
                    f.css("top", E * 30 + "px")
                }
            }
        }
    }
    if (C) {
        if (j == "floatLeftTopForms" || j == "floatRightTopForms" || j == "floatLeftBottomForms" || j == "floatRightBottomForms" || j == "absForms" || j == "absTopForms" || j == "absBottomForms") {
            f.css("position", "absolute");
            top.Site.floatModuleDraggable(f)
        }
    }
    Fai.refreshClass(f);
    f.css("display", "block");
    if (typeof t != "undefined" && t) {
        f.css(t);
        Site.getModuleAttrPattern(A).changed = true
    }
    var z = f.parents(".form");
    var n = z.attr("id");
    if (z.hasClass("formStyle35")) {
        var r = n.replace("module", "");
        Fai.top.Site.getModuleAttrData(r).changed = true;
        f.attr("_inmulmcol", r)
    } else {
        if (z.hasClass("formStyle80")) {
            var r = n.replace("module", "");
            Fai.top.Site.getModuleAttrData(r).changed = true;
            f.attr("_infullmeasure", r)
        }
    }
    Site.setAbsFormsHolder2();
    Site.refreshForms();
    Site.getModuleAttrPattern(A).changed = true;
    Fai.top._moduleMoved++;
    Site.styleChanged();
    if (Fai.top.$.inArray(A, Fai.top._newModuleIdList) == -1) {
        Fai.top._newModuleIdList.push(A)
    }
    if (typeof D != "undefined" && D != null) {
        D(I, d, g, p)
    } else {
        Site.triggerGobalEvent("funcTab_addNewModule", {
            id: A,
            moduleData: $.toJSON(returnModuledata)
        })
    }
    top.Site.scrollToModuleDiv(f);
    Site.addModuleCallBack(f, q);
    Site.triggerGobalEvent("site_addNewModule", A);
    Site.triggerGobalEvent("showFindModuleDiv", A);
    Fai.top.setTimeout("Fai.closePopupWindow_Internal()");
    top.Site.dockModuleResize(f);
    Site.createMiddleLeftFormsHider(f);
    Site.isMulColModuleInIE("#module" + A)
};
Site.addModuleCallBack = function(o, d) {
    var c = d.returnModuledata;
    var n = "module" + c.id;
    var g = c.id;
    var e = c.style;
    var u = false;
    if (!Fai.top.draggableDiv_out && Fai.top.choiceAppendLocation) {
        Fai.top.choiceAppendLocation = false;
        return
    }
    if (e == 80) {
        return
    }
    if (e == 83) {
        Site.addPhotoCardModuleHeight(g)
    }
    if (e !== 67 && e !== 66 && e !== 65 && e !== 62 && e !== 79 && e !== 81 && e !== 82) {
        return
    } else {
        if (!Fai.top.draggableDiv_enable) {
            return
        }
    }
    top.Site.absModule(n);
    top.Site.absTopModule(n);
    Site.getModuleAttrPattern(g).changed = true;
    if (!u) {
        if (e == 67) {
            var i = 170,
            j = o.children("table.formMiddle");
            i += j.outerWidth(true) - j.width();
            var v = j.find("td.formMiddleLeft");
            if (v.length > 0 && v.is(":visible")) {
                i += v.outerWidth(true)
            }
            var s = j.find("td.formMiddleRight");
            if (s.length > 0 && s.is(":visible")) {
                i += s.outerWidth(true)
            }
            var t = j.find("td.formMiddleCenter").children("div.formMiddleContent");
            var b = t.outerWidth(true) - t.width();
            i += b;
            var l = "100px";
            var h = 0;
            var a = false;
            $.each(Fai.top.$(".formStyle67"),
            function(y, w) {
                if ($(w).attr("id") === n) {
                    return true
                }
                var x = $(w).css("top");
                if (x === l) {
                    a = true
                }
                if (h < x.replace(/px/, "")) {
                    h = parseInt(x.replace(/px/, ""))
                }
            });
            if (a) {
                h += 50;
                l = h + "px"
            }
            o.css({
                width: i + "px",
                left: "auto",
                right: "100px",
                top: l,
                height: "auto"
            });
            top.Site.lock(n);
            top.$("#" + n).css({
                top: h
            });
            o.attr("_side", 0);
            top.Site.sideModule(n)
        } else {
            if (e == 66) {
                var l = "10px";
                var h = 0;
                var a = false;
                $.each(Fai.top.$(".formStyle66"),
                function(y, w) {
                    if ($(w).attr("id") === n) {
                        return true
                    }
                    var x = $(w).css("top");
                    if (x === l) {
                        a = true
                    }
                    if (h < x.replace(/px/, "")) {
                        h = parseInt(x.replace(/px/, ""))
                    }
                });
                if (a) {
                    h += 20;
                    l = h + "px"
                }
                o.css({
                    width: "140px",
                    left: "120px",
                    right: "auto",
                    top: l
                });
                var p = Site.getModuleAttrPattern(g).contentBg;
                p.y = 1;
                top.Site.hideModuleContentBg(g);
                var q = Site.getModuleAttrPattern(g);
                q.bannerType = 1;
                q.border.y = 1;
                q.inner.t = 0;
                q.inner.b = 0;
                q.inner.l = 0;
                q.inner.r = 0;
                q.inner.y = 1;
                top.Site.setModuleHeight(g, 20);
                top.Site.setModuleStyleCssList(g, [{
                    cls: ".formMiddleContent",
                    key: "margin-right",
                    value: "0px"
                },
                {
                    cls: ".formMiddleContent",
                    key: "margin-left",
                    value: "0px"
                },
                {
                    cls: ".formMiddleContent",
                    key: "margin-top",
                    value: "0px"
                },
                {
                    cls: ".formMiddleContent",
                    key: "margin-bottom",
                    value: "0px"
                }]);
                top.Site.setModuleStyleCss(g, ".formBanner" + g, "display", "none");
                top.Site.hideModuleBorder(g)
            } else {
                if (e == 62) {
                    var l = "40px";
                    var h = 0;
                    var a = false;
                    $.each(Fai.top.$(".formStyle62"),
                    function(y, w) {
                        if ($(w).attr("id") === n) {
                            return true
                        }
                        var x = $(w).css("top");
                        if (x === l) {
                            a = true
                        }
                        if (h < x.replace(/px/, "")) {
                            h = parseInt(x.replace(/px/, ""))
                        }
                    });
                    if (a) {
                        h += 20;
                        l = h + "px"
                    }
                    o.css({
                        width: "250px",
                        left: "auto",
                        right: "0px",
                        top: l,
                        height: "auto"
                    });
                    top.Site.setModuleStyleCssList(g, [{
                        cls: ".formMiddleContent",
                        key: "margin-right",
                        value: "0px"
                    },
                    {
                        cls: ".formMiddleContent",
                        key: "margin-left",
                        value: "10px"
                    },
                    {
                        cls: ".formMiddleContent",
                        key: "margin-top",
                        value: "10px"
                    },
                    {
                        cls: ".formMiddleContent",
                        key: "margin-bottom",
                        value: "0px"
                    }])
                } else {
                    if (e == 65) {
                        var l = "10px";
                        var h = 0;
                        var a = false;
                        $.each(Fai.top.$(".formStyle65"),
                        function(y, w) {
                            if ($(w).attr("id") === n) {
                                return true
                            }
                            var x = $(w).css("top");
                            if (x === l) {
                                a = true
                            }
                            if (h < x.replace(/px/, "")) {
                                h = parseInt(x.replace(/px/, ""))
                            }
                        });
                        if (a) {
                            h += 20;
                            l = h + "px"
                        }
                        o.css({
                            width: "140px",
                            left: "auto",
                            right: "120px",
                            top: l,
                            height: "auto"
                        });
                        var p = Site.getModuleAttrPattern(g).contentBg;
                        p.y = 1;
                        top.Site.hideModuleContentBg(g);
                        var q = Site.getModuleAttrPattern(g);
                        q.bannerType = 1;
                        q.border.y = 1;
                        q.inner.t = 0;
                        q.inner.b = 0;
                        q.inner.l = 0;
                        q.inner.r = 0;
                        q.inner.y = 0;
                        top.Site.setModuleStyleCssList(g, [{
                            cls: ".formMiddleContent",
                            key: "margin-right",
                            value: "0px"
                        },
                        {
                            cls: ".formMiddleContent",
                            key: "margin-left",
                            value: "10px"
                        },
                        {
                            cls: ".formMiddleContent",
                            key: "margin-top",
                            value: "10px"
                        },
                        {
                            cls: ".formMiddleContent",
                            key: "margin-bottom",
                            value: "0px"
                        }]);
                        top.Site.setModuleStyleCss(g, ".formBanner" + g, "display", "none");
                        top.Site.hideModuleBorder(g)
                    } else {
                        if (e === 79) {
                            if (Fai.top.draggableDiv_out) {
                                o.css({
                                    width: "110px",
                                    height: "110px",
                                    left: draggableDiv_pageX - Fai.top.$("#container").offset().left - 100,
                                    top: draggableDiv_pageY + Fai.top.draggableDiv_scrollTop - 100
                                })
                            } else {
                                var l = 50,
                                f = 200;
                                o.css({
                                    top: l + parseInt(Math.random() * 101),
                                    left: f + parseInt(Math.random() * 101),
                                    width: "110px",
                                    height: "110px"
                                })
                            }
                            o.find(".float_in_img").css({
                                width: "110px",
                                height: "110px"
                            });
                            o.attr("_autoheight", "0");
                            top.Site.setModuleStyleCssList(g, [{
                                cls: ".formMiddleContent",
                                key: "margin-right",
                                value: "0px"
                            },
                            {
                                cls: ".formMiddleContent",
                                key: "margin-left",
                                value: "0px"
                            },
                            {
                                cls: ".formMiddleContent",
                                key: "margin-top",
                                value: "0px"
                            },
                            {
                                cls: ".formMiddleContent",
                                key: "margin-bottom",
                                value: "0px"
                            }])
                        } else {
                            if (e == 81) {
                                var l = "10px";
                                var h = 0;
                                var a = false;
                                $.each(Fai.top.$(".formStyle81"),
                                function(y, w) {
                                    if ($(w).attr("id") === n) {
                                        return true
                                    }
                                    var x = $(w).css("top");
                                    if (x === l) {
                                        a = true
                                    }
                                    if (h < x.replace(/px/, "")) {
                                        h = parseInt(x.replace(/px/, ""))
                                    }
                                });
                                if (a) {
                                    h += 20;
                                    l = h + "px"
                                }
                                if (Fai.top.draggableDiv_out) {
                                    o.css({
                                        left: Fai.top.draggableDiv_pageX - Fai.top.$("#container").offset().left - 100,
                                        top: Fai.top.draggableDiv_pageY + Fai.top.draggableDiv_scrollTop - 100
                                    })
                                } else {
                                    o.css({
                                        left: "520px",
                                        top: l
                                    })
                                }
                                var r = o.find(".floatBtn");
                                o.css("width", r.outerWidth() + "px");
                                o.css("height", r.outerHeight() + "px");
                                o.find(".formMiddleContent").css("overflow", "visible");
                                o.find(".formWrap").css("overflow", "visible");
                                Site.setFlBtnResizeHandleSize(o);
                                top.Site.setModuleStyleCssList(g, [{
                                    cls: ".formMiddleContent",
                                    key: "margin-right",
                                    value: "0px"
                                },
                                {
                                    cls: ".formMiddleContent",
                                    key: "margin-left",
                                    value: "0px"
                                },
                                {
                                    cls: ".formMiddleContent",
                                    key: "margin-top",
                                    value: "0px"
                                },
                                {
                                    cls: ".formMiddleContent",
                                    key: "margin-bottom",
                                    value: "0px"
                                }]);
                                top.Site.removeModuleStyleCssList(g, [{
                                    cls: ".floatBtnBox",
                                    key: "padding-right"
                                },
                                {
                                    cls: ".floatBtnBox",
                                    key: "padding-left"
                                },
                                {
                                    cls: ".floatBtnBox",
                                    key: "padding-top"
                                },
                                {
                                    cls: ".floatBtnBox",
                                    key: "padding-bottom"
                                }])
                            } else {
                                if (e == 82) {
                                    var l = "10px";
                                    var h = 0;
                                    var a = false;
                                    $.each(Fai.top.$(".formStyle82"),
                                    function(y, w) {
                                        if ($(w).attr("id") === n) {
                                            return true
                                        }
                                        var x = $(w).css("top");
                                        if (x === l) {
                                            a = true
                                        }
                                        if (h < x.replace(/px/, "")) {
                                            h = parseInt(x.replace(/px/, ""))
                                        }
                                    });
                                    if (a) {
                                        h += 20;
                                        l = h + "px"
                                    }
                                    if (Fai.top.draggableDiv_out) {
                                        o.css({
                                            left: Fai.top.draggableDiv_pageX - Fai.top.$("#container").offset().left - 100,
                                            top: Fai.top.draggableDiv_pageY + Fai.top.draggableDiv_scrollTop - 100
                                        })
                                    } else {
                                        o.css({
                                            left: "620px",
                                            top: l
                                        })
                                    }
                                    o.css({
                                        width: "auto",
                                        height: "auto"
                                    })
                                }
                            }
                        }
                    }
                }
            }
        }
    } else {
        var m = Fai.top.draggableDiv_pageX - Fai.top.$("#container").offset().left;
        var k = Fai.top.draggableDiv_pageY + Fai.top.draggableDiv_scrollTop;
        top.$("#" + n).css({
            top: k + "px",
            left: m + "px"
        })
    }
    top.Site.refreshAbsFloatForm(o);
    top.Site.scrollToModuleDiv(o)
};
Site.checkAddSpecialModule = function(a, c) {
    var b = null;
    if (a.hasClass("formStyle29")) {
        a.find("#formTabContent" + c).find(".form").each(function(d, e) {
            b = $(e).attr("id").replace("module", "") || 0;
            if (Fai.top.$("#module" + b).length > 0) {
                a.find("#formTabCntId" + b).remove();
                a.find("#formTabButton" + b).remove();
                Fai.top.Site.getModuleAttrData(c).changed = true
            }
        })
    } else {
        if (a.hasClass("formStyle35")) {
            a.find("#mulMColContent" + c).find(".mulMColList").children(".form").each(function(d, e) {
                b = $(e).attr("id").replace("module", "") || 0;
                if (Fai.top.$("#module" + b).length > 0) {
                    $(e).remove();
                    Fai.top.Site.getModuleAttrData(c).changed = true
                } else {
                    if ($(e).hasClass("formStyle29")) {
                        Site.checkAddSpecialModule($(e), b)
                    }
                }
            })
        } else {
            if (a.hasClass("formStyle80")) {
                a.find("#fullmeasureContent" + c).children(".form").each(function(d, e) {
                    b = $(e).attr("id").replace("module", "") || 0;
                    if (Fai.top.$("#module" + b).length > 0) {
                        $(e).remove();
                        Fai.top.Site.getModuleAttrData(c).changed = true
                    } else {
                        if ($(e).hasClass("formStyle29")) {
                            Site.checkAddSpecialModule($(e), b)
                        } else {
                            if ($(e).hasClass("formStyle35")) {
                                Site.checkAddSpecialModule($(e), b)
                            }
                        }
                    }
                })
            }
        }
    }
};
Site.refreshModule = function(h, g, e, c) {
    var b = Fai.top.$("#module" + h);
    var d = b.attr("_autoheight");
    if (d > 0) {
        b.css("height", "auto")
    }
    if (c != null) {
        var f = b.attr("class");
        f = f.replace(/formStyle\d+/, "formStyle" + c);
        b.attr("class", f)
    }
    b.find(".formWrap" + h).remove().end().prepend(Site.replaceDocumentwriteText(g));
    var a = b.attr("_intab");
    if (a > 0) {
        Fai.top.$("#formTabButton" + h + " .formTabMiddle").text(Fai.top.$("#module" + h + " .formBannerTitle .titleText").text())
    }
    if (b.attr("_autoheight") > 0) {
        Site.autoModuleHeight(h)
    }
    if (parseInt(b.attr("_side")) === 1 && parseInt(b.attr("_autoheight")) === 0) {
        Site.refreshModuleHeight(h)
    }
    Site.triggerGobalEvent("site_refreshModule", h)
};
Site.getBgHiddenStatus = function(a) {
    if (Fai.top.$("#module" + a).attr("_bgHidden") == "true") {
        return 0
    }
    return 1
};
Site.fixPlaceHolder = function(a) {
    var b = "placeholder" in document.createElement("input");
    if (!b) {
        Fai.top.$("#module" + a).find(":input[placeholder]").each(function(g, c) {
            var f = $(this),
            d = f.attr("placeholder");
            var j = f.position(),
            e = f.outerHeight(true),
            k = f.outerWidth(true),
            m = f.css("padding-left"),
            l = f.css("padding-top");
            var l = parseInt(e / 4);
            var i = $("<span></span>").text(d).css({
                position: "absolute",
                left: j.left,
                top: j.top,
                height: e,
                lienHeight: e,
                paddingLeft: 8,
                paddingTop: l,
                color: "#aaa"
            });
            i = f.parent().append($(i)[0].outerHTML);
            f.focusin(function(h) {}).focusout(function(h) {
                if (!f.val()) {
                    i.show()
                }
            });
            f.keydown(function(h) {
                i.hide();
                f.focus()
            });
            i.click(function() {
                f.focus()
            })
        })
    }
};
Site.refreshModuleHeight = function(b) {
    var a = Fai.top.$("#module" + b);
    if (a.attr("_autoHeight") == 0) {
        Site.setModuleHeight(b, a.height())
    }
};
Site.setModuleHeight = function(c, a) {
    var b = Fai.top.$("#module" + c);
    b.attr("_autoHeight", "0");
    Site.setModuleHeight2(c, a)
};
Site.autoModuleHeight = function(b) {
    var c = Fai.top.$("#module" + b);
    c.css("height", "auto");
    if (c.hasClass("formStyle80")) {
        return
    }
    c.find(".formMiddle" + b).css("height", "auto");
    var e = c.find(".formMiddleContent" + b);
    e.css("height", "auto");
    if (!c.hasClass("formStyle81") && !c.hasClass("formStyle82")) {
        e.css("overflow-y", "auto")
    }
    if (c.hasClass("formStyle29")) {
        var a = c.find(".formTabContent");
        a.css("height", "auto");
        var g = a.children(".formTabCntId");
        g.removeAttr("style").css("height", "auto");
        var j = g.children(".form");
        var i = 300;
        var f = true;
        $.each(j,
        function() {
            var k = $(this).outerHeight(true);
            if (f) {
                i = k;
                f = false
            } else {
                if (k > i) {
                    i = k
                }
            }
        });
        a.css("height", i);
        g.css("height", i);
        if (c.find(".formTabButtonYList").length > 0) {
            e.css("height", e.height())
        }
    }
    var d = parseInt(c.attr("_intab")) || 0;
    if (d > 0) {
        var h = Fai.top.$("#module" + d);
        if (h.length > 0 && h.attr("_autoheight") == 1) {
            Site.autoModuleHeight(d);
            Fai.top.Site.getModuleAttrPattern(d).changed = true
        }
    }
};
Site.showModuleBorder = function(a) {
    Site.removeModuleStyleCssList(a, [{
        cls: "",
        key: "border"
    },
    {
        cls: "",
        key: "padding"
    },
    {
        cls: ".formMiddle" + a,
        key: "border"
    },
    {
        cls: ".formMiddle" + a,
        key: "padding"
    },
    {
        cls: ".formMiddle" + a + " .formMiddleCenter" + a,
        key: "border"
    },
    {
        cls: ".formMiddle" + a + " .formMiddleCenter" + a,
        key: "padding"
    },
    {
        cls: ".formTop" + a,
        key: "display"
    },
    {
        cls: ".formBottom" + a,
        key: "display"
    },
    {
        cls: ".formMiddle" + a + " .formMiddleLeft" + a,
        key: "display"
    },
    {
        cls: ".formMiddle" + a + " .formMiddleRight" + a,
        key: "display"
    }])
};
Site.hideModuleBorder = function(a) {
    Site.setModuleStyleCssList(a, [{
        cls: "",
        key: "border",
        value: "none"
    },
    {
        cls: "",
        key: "padding",
        value: "0px"
    },
    {
        cls: ".formMiddle" + a,
        key: "border",
        value: "none"
    },
    {
        cls: ".formMiddle" + a,
        key: "padding",
        value: "0px"
    },
    {
        cls: ".formMiddle" + a + " .formMiddleCenter" + a,
        key: "border",
        value: "none"
    },
    {
        cls: ".formMiddle" + a + " .formMiddleCenter" + a,
        key: "padding",
        value: "0px"
    },
    {
        cls: ".formTop" + a,
        key: "display",
        value: "none"
    },
    {
        cls: ".formBottom" + a,
        key: "display",
        value: "none"
    },
    {
        cls: ".formMiddle" + a + " .formMiddleLeft" + a,
        key: "display",
        value: "none"
    },
    {
        cls: ".formMiddle" + a + " .formMiddleRight" + a,
        key: "display",
        value: "none"
    }])
};
Site.showModuleContentBg = function(a) {
    Site.removeModuleStyleCssList(a, [{
        cls: "",
        key: "background"
    },
    {
        cls: ".formMiddle" + a,
        key: "background"
    },
    {
        cls: ".formMiddle" + a,
        key: "background-size"
    },
    {
        cls: ".formMiddle" + a + " .formMiddleCenter" + a,
        key: "background"
    },
    {
        cls: ".formMiddleContent" + a,
        key: "background"
    }])
};
Site.hideModuleContentBg = function(a) {
    Site.setModuleStyleCssList(a, [{
        cls: "",
        key: "background",
        value: "none"
    },
    {
        cls: ".formMiddle" + a,
        key: "background",
        value: "none"
    },
    {
        cls: ".formMiddle" + a + " .formMiddleCenter" + a,
        key: "background",
        value: "none"
    },
    {
        cls: ".formMiddleContent" + a,
        key: "background",
        value: "none"
    }])
};
Site.hideModuleContentSplitLine = function(a) {
    Site.setModuleStyleCssList(a, [{
        cls: ".g_separator",
        key: "display",
        value: "none"
    }])
};
Site.showModuleContentSplitLine = function(a) {
    Site.removeModuleStyleCssList(a, [{
        cls: ".g_separator",
        key: "display"
    },
    {
        cls: ".g_separator",
        key: "border-color"
    },
    {
        cls: ".g_separator",
        key: "border-width"
    },
    {
        cls: ".g_separator",
        key: "border-style"
    },
    {
        cls: ".g_separator",
        key: "border-left"
    },
    {
        cls: ".g_separator",
        key: "border-top"
    },
    {
        cls: ".g_separator",
        key: "border-right"
    }])
};
Site.hideModuleContentLineIcon = function(a) {
    if (Fai.top.$("#module" + a).find("#newsList" + a).find(".contentLineIcon").length > 0) {
        Site.setModuleStyleCssList(a, [{
            cls: ".line",
            key: "background-image",
            value: "none"
        },
        {
            cls: ".line",
            key: "padding-left",
            value: "5px"
        }]);
        if (Fai.top.$("#module" + a).find("#newsList" + a).find(".top_with_line_icon").length > 0) {
            Site.setModuleStyleCssList(a, [{
                cls: ".top_with_line_icon",
                key: "padding-left",
                value: "25px"
            }])
        }
    }
    Site.setModuleStyleCssList(a, [{
        cls: ".contentLineIcon",
        key: "display",
        value: "none"
    },
    {
        cls: ".g_vertFold .g_foldContainerValue a",
        key: "background",
        value: "none"
    },
    {
        cls: ".g_vertFold .g_foldContainerValue a",
        key: "padding-left",
        value: "3px"
    },
    {
        cls: ".productFilterVert .productFilterValue a",
        key: "background",
        value: "none"
    },
    {
        cls: ".productFilterVert .productFilterValue a",
        key: "padding-left",
        value: "3px"
    }])
};
Site.defaultModuleLineIcon = function(a) {
    if (Fai.top.$("#module" + a).find("#newsList" + a).find(".contentLineIcon").length > 0) {
        Site.removeModuleStyleCssList(a, [{
            cls: ".line",
            key: "background-image"
        },
        {
            cls: ".line",
            key: "padding-left"
        }]);
        if (Fai.top.$("#module" + a).find("#newsList" + a).find(".top_with_line_icon").length > 0) {
            Site.setModuleStyleCssList(a, [{
                cls: ".top_with_line_icon",
                key: "padding-left",
                value: "25px"
            },
            {
                cls: ".top_with_line_icon",
                key: "background",
                value: "none"
            }])
        }
    }
    Site.removeModuleStyleCssList(a, [{
        cls: ".contentLineIcon",
        key: "background"
    },
    {
        cls: ".contentLineIcon",
        key: "display"
    },
    {
        cls: ".contentLineIcon",
        key: "width"
    },
    {
        cls: ".g_vertFold .g_foldContainerValue a",
        key: "background"
    },
    {
        cls: ".g_vertFold .g_foldContainerValue a",
        key: "padding-left"
    },
    {
        cls: ".productFilterVert .productFilterValue a",
        key: "background"
    },
    {
        cls: ".productFilterVert .productFilterValue a",
        key: "padding-left"
    }]);
    if (Fai.top.$("#module" + a).find(".productList").length > 0) {
        Site.setModuleStyleCssList(a, [{
            cls: ".contentLineIcon",
            key: "display",
            value: "none"
        }])
    }
};
Site.showModuleBannerBg = function(a) {
    Site.removeModuleStyleCssList(a, [{
        cls: ".formBanner" + a,
        key: "background"
    },
    {
        cls: ".formBanner" + a,
        key: "background-size"
    },
    {
        cls: ".formBanner" + a + " .center" + a,
        key: "background"
    },
    {
        cls: ".formBanner" + a + " .right" + a,
        key: "background"
    },
    {
        cls: ".formBanner" + a + " .formBannerTitle" + a,
        key: "background"
    },
    {
        cls: ".formBanner" + a + " .titleCenter" + a,
        key: "background"
    },
    {
        cls: ".formBanner" + a + " .titleRight" + a,
        key: "background"
    },
    {
        cls: ".formBanner" + a + " .titleText" + a,
        key: "background"
    }])
};
Site.hideModuleBannerBg = function(a) {
    Site.setModuleStyleCssList(a, [{
        cls: ".formBanner" + a,
        key: "background",
        value: "none"
    },
    {
        cls: ".formBanner" + a + " .center" + a,
        key: "background",
        value: "none"
    },
    {
        cls: ".formBanner" + a + " .right" + a,
        key: "background",
        value: "none"
    },
    {
        cls: ".formBanner" + a + " .formBannerTitle" + a,
        key: "background",
        value: "none"
    },
    {
        cls: ".formBanner" + a + " .titleCenter" + a,
        key: "background",
        value: "none"
    },
    {
        cls: ".formBanner" + a + " .titleRight" + a,
        key: "background",
        value: "none"
    },
    {
        cls: ".formBanner" + a + " .titleText" + a,
        key: "background",
        value: "none"
    }])
};
Site.showModuleSideBg = function(a) {
    Site.removeModuleStyleCssList(a, [{
        cls: ".g_sideBtn_t",
        key: "display"
    },
    {
        cls: ".g_sideBtn_c",
        key: "background"
    },
    {
        cls: ".g_sideBtn_c",
        key: "background-size"
    },
    {
        cls: ".g_sideBtn_c .left",
        key: "background"
    },
    {
        cls: ".g_sideBtn_c .center",
        key: "background"
    },
    {
        cls: ".g_sideBtn_c .right",
        key: "background"
    },
    {
        cls: ".g_sideBtn_c .formBannerTitle",
        key: "background"
    },
    {
        cls: ".g_sideBtn_c .titleLeft",
        key: "background"
    },
    {
        cls: ".g_sideBtn_c .titleCenter",
        key: "background"
    },
    {
        cls: ".g_sideBtn_c .titleRight",
        key: "background"
    },
    {
        cls: ".g_sideBtn_c .titleText",
        key: "background"
    },
    {
        cls: ".g_sideBtn_b",
        key: "display"
    }])
};
Site.hideModuleSideBg = function(a) {
    Site.setModuleStyleCssList(a, [{
        cls: ".g_sideBtn_t",
        key: "display",
        value: "none"
    },
    {
        cls: ".g_sideBtn_c",
        key: "background",
        value: "none"
    },
    {
        cls: ".g_sideBtn_c .left",
        key: "background",
        value: "none"
    },
    {
        cls: ".g_sideBtn_c .center",
        key: "background",
        value: "none"
    },
    {
        cls: ".g_sideBtn_c .right",
        key: "background",
        value: "none"
    },
    {
        cls: ".g_sideBtn_c .formBannerTitle",
        key: "background",
        value: "none"
    },
    {
        cls: ".g_sideBtn_c .titleLeft",
        key: "background",
        value: "none"
    },
    {
        cls: ".g_sideBtn_c .titleCenter",
        key: "background",
        value: "none"
    },
    {
        cls: ".g_sideBtn_c .titleRight",
        key: "background",
        value: "none"
    },
    {
        cls: ".g_sideBtn_c .titleText",
        key: "background",
        value: "none"
    },
    {
        cls: ".g_sideBtn_b",
        key: "display",
        value: "none"
    }])
};
Site.specialTemplateBannerIcon = function(d, b, c) {
    var a = new Array();
    if (c == "d") {
        if (b == 532) {
            a.push({
                cls: " .formBanner" + d,
                key: "background-image"
            })
        } else {
            if (b == 474) {
                a.push({
                    cls: " .formBanner" + d + " .center" + d + " .titleCenter" + d,
                    key: "background"
                })
            } else {
                if (b == 313) {
                    a.push({
                        cls: " .formBanner" + d + " .formBannerTitle" + d,
                        key: "background-image"
                    })
                } else {
                    if (b == 377) {
                        a.push({
                            cls: ".formBanner" + d + " .center" + d,
                            key: "padding-left"
                        });
                        a.push({
                            cls: ".formBanner" + d + " .center" + d,
                            key: "background-image"
                        })
                    }
                }
            }
        }
        Site.removeModuleStyleCssList(d, a)
    } else {
        if (c == "h") {
            if (b == 532) {
                a.push({
                    cls: " .formBanner" + d,
                    key: "background-image",
                    value: "none"
                })
            } else {
                if (b == 474) {
                    a.push({
                        cls: " .formBanner" + d + " .center" + d + " .titleCenter" + d,
                        key: "background",
                        value: "none"
                    })
                } else {
                    if (b == 313) {
                        a.push({
                            cls: " .formBanner" + d + " .formBannerTitle" + d,
                            key: "background-image",
                            value: "none"
                        })
                    } else {
                        if (b == 377) {
                            a.push({
                                cls: ".formBanner" + d + " .center" + d,
                                key: "padding-left",
                                value: "0px"
                            });
                            a.push({
                                cls: ".formBanner" + d + " .center" + d,
                                key: "background-image",
                                value: "none"
                            })
                        }
                    }
                }
            }
            Site.setModuleStyleCssList(d, a)
        }
    }
};
Site.hideModuleBannerIcon = function(a) {
    Site.specialTemplateBannerIcon(a, top._templateFrame, "h");
    Site.setModuleStyleCssList(a, [{
        cls: ".formBanner" + a + " .left" + a,
        key: "display",
        value: "none"
    },
    {
        cls: ".formBanner" + a + " .center" + a + " .titleLeft" + a,
        key: "display",
        value: "none"
    }])
};
Site.defaultModuleBannerIcon = function(a) {
    Site.specialTemplateBannerIcon(a, top._templateFrame, "d");
    Site.removeModuleStyleCssList(a, [{
        cls: ".formBanner" + a + " .left" + a,
        key: "display"
    },
    {
        cls: ".formBanner" + a + " .left" + a,
        key: "width"
    },
    {
        cls: ".formBanner" + a + " .left" + a,
        key: "background"
    },
    {
        cls: ".formBanner" + a + " .center" + a + " .titleLeft" + a,
        key: "display"
    },
    {
        cls: ".formBanner" + a + " .center" + a + " .titleLeft" + a,
        key: "width"
    },
    {
        cls: ".formBanner" + a + " .center" + a + " .titleLeft" + a,
        key: "background"
    }])
};
Site.addAddModuleButton = function(k, m) {
    var n = Site.getLayoutForms(k);
    var b = Fai.top.$("#" + n);
    var o = b.find(".form");
    var l = o.length;
    var p = false;
    var f = o.filter(".formStyle35");
    var e = o.filter(".formStyle29");
    if (m && l == 2) {
        l = 0
    }
    if (k == 24 || k == 25) {
        p = true
    }
    if (!p) {
        if (!Site.isLayoutHidden(k) && l == 0) {
            if (b.children(".addNewModule").length > 0) {
                return
            }
            var h = [];
            if (k == 1 || k == 3) {
                h = ['<div class="addNewModule" layout=' + k + " >", '<div class="addBtn" ><div class="closeDiv" title="移除" onclick="Fai.top._appendLayout=' + k + ";Fai.top._appendModule=-1;Site.styleSetting('open', 'pageLayoutTab', '', 'freeLayoutShow',Site.freeLayoutClick);\"></div>", '<div class="left_right_Icon" onclick="Fai.top._appendLayout=' + k + ";Fai.top._appendModule=-1;Fai.top.choiceAppendLocation=1;Site.functionInterface({'name':'faiFloatPanel'}, 0);\"></div></div></div>"]
            } else {
                h = ['<div class="addNewModule" layout=' + k + " >", '<div class="addBtn" ><div class="closeDiv" title="移除" onclick="Fai.top._appendLayout=' + k + ";Fai.top._appendModule=-1;Site.styleSetting('open', 'pageLayoutTab', '', 'freeLayoutShow',Site.freeLayoutClick);\"></div>", '<div class="other_Icon" onclick="Fai.top._appendLayout=' + k + ";Fai.top._appendModule=-1;Fai.top.choiceAppendLocation=1;Site.functionInterface({'name':'faiFloatPanel'}, 0);\"></div></div></div>"]
            }
            var c = Fai.top.$(h.join(""));
            c.appendTo(b);
            c.mouseover(function() {
                $(this).addClass("addNewModuleOver")
            }).mouseleave(function() {
                $(this).removeClass("addNewModuleOver")
            });
            var g = c.find(".closeDiv")[0];
            $(g).mouseover(function() {
                $(g).addClass("closeReady")
            }).mouseleave(function() {
                $(g).removeClass("closeReady")
            })
        } else {
            b.children(".addNewModule").remove()
        }
    }
    if (f.length > 0) {
        var h = [];
        var a = "";
        var d;
        f.each(function(q, r) {
            $(r).find(".mulMColList").each(function(s, t) {
                if ($(t).children(".form").length < 1) {
                    if ($(t).children(".addNewModule").length > 0) {
                        return true
                    }
                    a = $(t).attr("id");
                    h = [];
                    h.push('<div class="addNewModule">');
                    h.push('<div class="addBtn" >');
                    h.push('<div class="mulMCol_Icon" onclick="Fai.top._appendLayout=' + k + ";");
                    h.push("Fai.top._appendModule=-1;Fai.top._appendArea='" + a + "';Fai.top.choiceAppendLocation=1;Site.functionInterface({'name':'faiFloatPanel'}, 0);\">");
                    h.push('<div class="addBtnToolTip">可以拖动模块进来</div>');
                    h.push("</div>");
                    h.push("</div></div>");
                    $(t).append(h.join(""));
                    d = $(t).find(".addBtn");
                    if (d) {
                        d.mouseover(function() {
                            $(this).addClass("addNewModuleOver")
                        }).mousedown(function() {
                            $(this).addClass("addNewModuleDown")
                        }).mouseup(function() {
                            $(this).removeClass("addNewModuleDown");
                            $(this).addClass("addNewModuleOver")
                        }).mouseleave(function() {
                            $(this).removeClass("addNewModuleOver");
                            $(this).removeClass("addNewModuleDown")
                        })
                    }
                } else {
                    $(t).children(".addNewModule").remove()
                }
            })
        })
    }
    if (e.length > 0) {
        var h = [];
        var a = "";
        var d;
        e.each(function(q, r) {
            $(r).find(".formTabContent").each(function(s, t) {
                if ($(t).children(".formTabCntId").length < 1) {
                    if ($(t).children(".addNewModule").length > 0) {
                        return true
                    }
                    a = $(t).attr("id");
                    h = [];
                    h.push('<div class="addNewModule">');
                    h.push('<div class="addBtn" >');
                    h.push('<div class="mulMCol_Icon" onclick="Fai.top._appendLayout=' + k + ";");
                    h.push("Fai.top._appendModule=-1;Fai.top._appendArea='" + a + "';Fai.top.choiceAppendLocation=1;Site.functionInterface({'name':'faiFloatPanel'}, 0);\">");
                    h.push('<div class="addBtnToolTip">可以拖动模块进来</div>');
                    h.push("</div>");
                    h.push("</div></div>");
                    $(t).append(h.join(""));
                    d = $(t).find(".addBtn");
                    if (d) {
                        d.mouseover(function() {
                            $(this).addClass("addNewModuleOver")
                        }).mousedown(function() {
                            $(this).addClass("addNewModuleDown")
                        }).mouseup(function() {
                            $(this).removeClass("addNewModuleDown");
                            $(this).addClass("addNewModuleOver")
                        }).mouseleave(function() {
                            $(this).removeClass("addNewModuleOver");
                            $(this).removeClass("addNewModuleDown")
                        })
                    }
                } else {
                    $(t).children(".addNewModule").remove()
                }
            })
        })
    }
    if (p) {
        var j = b.children(".formStyle80");
        var i;
        var h = [];
        j.each(function(q, r) {
            i = $(r).find(".fullmeasureContent");
            i.removeClass("nullOfFullmeasureContent");
            if (i.children(".form").length < 1) {
                i.addClass("nullOfFullmeasureContent");
                if (i.children(".addNewFmModule").length > 0) {
                    return true
                }
                h = [];
                h.push("<div class='addNewFmModule'>");
                h.push("	<div class='addFmBtn'>");
                h.push("		<div class='fullmeasure_Icon' onclick='Fai.top._appendLayout=" + k + ';Fai.top._appendArea="' + i.attr("id") + '";Fai.top._appendModule=-1;Fai.top.choiceAppendLocation=1;Site.functionInterface({"name":"faiFloatPanel"}, 0);\'></div>');
                h.push("		<div class='addFmBtnToolTip' onclick='Fai.top._appendLayout=" + k + ';Fai.top._appendArea="' + i.attr("id") + '";Fai.top._appendModule=-1;Fai.top.choiceAppendLocation=1;Site.functionInterface({"name":"faiFloatPanel"}, 0);\'>可以拖动模块进来</div>');
                h.push("	</div>");
                h.push("</div>");
                i.append(h.join(""))
            } else {
                i.children(".addNewFmModule").remove()
            }
        })
    }
};
Site.openAddModule = function(a) {
    Fai.top._appendModule = a;
    Site.functionInterface({
        name: "faiFloatPanel"
    },
    0);
    Site.logDog(100045, 11)
};
Site.setModuleStyleCss = function(c, a, b, d) {
    Fai.top.Fai.setCtrlStyleCss("stylemodule", "module" + c, a, b, d);
    Fai.top.Fai.refreshClass(Fai.top.$("#module" + c))
};
Site.setModuleStyleCssList = function(b, a) {
    Fai.top.Fai.setCtrlStyleCssList("stylemodule", "module" + b, a);
    Fai.top.Fai.refreshClass(Fai.top.$("#module" + b))
};
Site.getModuleStyleCss = function(c, a, b) {
    return Fai.top.Fai.getCtrlStyleCss("stylemodule", "module" + c, a, b)
};
Site.removeModuleStyleCss = function(c, a, b) {
    Fai.top.Fai.removeCtrlStyleCss("stylemodule", "module" + c, a, b);
    Fai.top.Fai.refreshClass(Fai.top.$("#module" + c))
};
Site.removeModuleStyleCssList = function(b, a) {
    Fai.top.Fai.removeCtrlStyleCssList("stylemodule", "module" + b, a);
    Fai.top.Fai.refreshClass(Fai.top.$("#module" + b))
};
Site.addModuleStyle = function(a) {
    Fai.top.Fai.addCtrlStyle("stylemodule", a)
};
Site.getModuleAttr = function(b) {
    var a = Fai.top.moduleAttr["module" + b];
    if (typeof a == "undefined") {
        Fai.top.moduleAttr["module" + b] = {};
        a = Fai.top.moduleAttr["module" + b]
    }
    if (typeof a.pattern == "undefined") {
        a.pattern = {}
    }
    if (typeof a.data == "undefined") {
        a.data = {}
    }
    var d = a.data;
    if (typeof d.changed == "undefined") {
        d.changed = false
    }
    var c = a.pattern;
    if (typeof c.changed == "undefined") {
        c.changed = false
    }
    if (typeof c.border == "undefined") {
        c.border = {
            y: 0
        }
    }
    if (typeof c.outside == "undefined") {
        c.outside = {
            y: 0
        }
    }
    if (typeof c.bannerType == "undefined") {
        c.bannerType = 0
    }
    if (typeof c.bannerAutoHeight == "undefined") {
        c.bannerAutoHeight = true
    }
    if (typeof c.bannerText == "undefined") {
        c.bannerText = {
            y: 0
        }
    }
    if (typeof c.bannerMore == "undefined") {
        c.bannerMore = {
            y: 0
        }
    }
    if (typeof c.bannerBg == "undefined") {
        c.bannerBg = {
            y: 0
        }
    }
    if (typeof c.bannerIcon == "undefined") {
        c.bannerIcon = {
            y: 0
        }
    }
    if (typeof c.inner == "undefined") {
        c.inner = {
            y: 0
        }
    }
    if (typeof c.contentText == "undefined") {
        c.contentText = {
            y: 0
        }
    }
    if (typeof c.contentLink == "undefined") {
        c.contentLink = {
            y: 0
        }
    }
    if (typeof c.contentBg == "undefined") {
        c.contentBg = {
            y: 0
        }
    }
    if (typeof c.contentSplitLine == "undefined") {
        c.contentSplitLine = {
            y: 0
        }
    }
    if (typeof c.contentLineIcon == "undefined") {
        c.contentLineIcon = {
            y: 0
        }
    }
    if (typeof c.contentItemSpace == "undefined") {
        c.contentItemSpace = {
            y: 0
        }
    }
    if (typeof c.contentHoverFont == "undefined") {
        c.contentHoverFont = {
            y: 0
        }
    }
    if (typeof c.contentHoverBg == "undefined") {
        c.contentHoverBg = {
            y: 0
        }
    }
    if (typeof c.contentSelectFont == "undefined") {
        c.contentSelectFont = {
            y: 0
        }
    }
    if (typeof c.contentSelectBg == "undefined") {
        c.contentSelectBg = {
            y: 0
        }
    }
    if (typeof c.contentRowHeight == "undefined") {
        c.contentRowHeight = {
            y: 0
        }
    }
    if (typeof c.sideText == "undefined") {
        c.sideText = {
            y: 0
        }
    }
    if (typeof c.sideSize == "undefined") {
        c.sideSize = {
            w: -1,
            h: -1
        }
    }
    if (typeof c.sideBg == "undefined") {
        c.sideBg = {
            y: 0
        }
    }
    if (typeof c.systemPattern == "undefined") {
        c.systemPattern = 0
    }
    if (typeof c.transparent == "undefined") {
        c.transparent = 100
    }
    if (typeof c.groupText == "undefined") {
        c.groupText = {
            y: 0
        }
    }
    if (typeof c.groupHeight == "undefined") {
        c.groupHeight = {
            y: 0
        }
    }
    if (typeof c.groupBg == "undefined") {
        c.groupBg = {
            y: 0
        }
    }
    if (typeof c.groupBorder == "undefined") {
        c.groupBorder = {
            y: 0
        }
    }
    if (typeof c.groupPosition == "undefined") {
        c.groupPosition = {
            y: 0
        }
    }
    if (typeof c.itemWidth == "undefined") {
        c.itemWidth = {
            y: 0
        }
    }
    if (typeof c.itemHeight == "undefined") {
        c.itemHeight = {
            y: 0
        }
    }
    if (typeof c.itemBg == "undefined") {
        c.itemBg = {
            y: 0
        }
    }
    if (typeof c.itemHBg == "undefined") {
        c.itemHBg = {
            y: 0
        }
    }
    if (typeof c.itemSp == "undefined") {
        c.itemSp = {
            y: 0
        }
    }
    if (typeof c.systemTabDirection == "undefined") {
        c.systemTabDirection = false
    }
    if (typeof c.systemTab == "undefined") {
        c.systemTab = 0
    }
    if (typeof c.systemMulModuleCol == "undefined") {
        c.systemMulModuleCol = 0
    }
    if (typeof c.mulModuleColPattern == "undefined") {
        c.mulModuleColPattern = {
            mcs: -1
        }
    }
    if (typeof c.systemSearchBoxStyle == "undefined") {
        c.systemSearchBoxStyle = 0
    }
    if (typeof c.searchBoxPattern == "undefined") {
        c.searchBoxPattern = {
            iw: -1
        }
    }
    if (typeof c.fullmeasurePattern == "undefined") {
        c.fullmeasurePattern = {};
        c.fullmeasurePattern.mb = {
            y: 0
        };
        c.fullmeasurePattern.cb = {
            y: 0
        };
        c.fullmeasurePattern.i = {
            y: 0
        };
        c.fullmeasurePattern.b = {
            y: 0
        };
        c.fullmeasurePattern.cw = -1
    }
    return a
};
Site.getModuleAttrData = function(b) {
    var a = Site.getModuleAttr(b);
    return a.data
};
Site.getModuleAttrPattern = function(b) {
    var a = Site.getModuleAttr(b);
    return a.pattern
};
Site.getModuleAttrInColStg = function(e) {
    var c = e.parents(".form"),
    h = 0,
    f = 0,
    a = 0,
    b,
    g,
    j,
    i,
    d;
    h = parseInt(e.attr("_intab"));
    if (h != 0 && c.length > 0 && c.hasClass("formStyle29")) {
        return null
    }
    f = parseInt(e.attr("_inmulmcol"));
    if (f != 0 && c.length > 0 && c.hasClass("formStyle35")) {
        return null
    }
    a = parseInt(e.attr("_infullmeasure"));
    if (a != 0 && c.length > 0 && c.hasClass("formStyle80")) {
        return null
    }
    b = parseInt(e.attr("id").replace("module", ""));
    g = {
        id: b
    };
    j = e.parent().attr("id");
    if (e.hasClass("formStyle80")) {
        if (j !== "fullmeasureTopForms" && j !== "fullmeasureBottomForms") {
            return null
        }
    }
    if (j == "floatLeftTopForms" || j == "floatLeftBottomForms" || j == "floatRightTopForms" || j == "floatRightBottomForms") {
        i = e.css("display") != "none";
        d = e.attr("_side");
        if (d == 2) {
            g.t = parseInt((i == true) ? e.data("startFlutterYPos") : e.data("top"));
            g.l = parseInt((i == true) ? e.data("startFlutterXPos") : e.data("left"));
            g.s = parseInt(e.attr("_side"))
        } else {
            g.t = parseInt((i == true) ? e.position().top: e.data("top"));
            g.l = parseInt((i == true) ? e.position().left: e.data("left"));
            g.s = parseInt(e.attr("_side"))
        }
    } else {
        if (j == "absForms" || j == "absTopForms" || j == "absBottomForms") {
            g.t = parseInt(e.position().top);
            g.l = parseInt(e.position().left)
        }
    }
    return g
};
Site.getModuleAttrPatternStg = function(k) {
    var h = Fai.top.$("#module" + k);
    var X = {};
    var l = Site.getModuleAttrPattern(k);
    var a = 0;
    var e = 0;
    if (h.length > 0) {
        var d = h.parent().attr("id");
        if (d == "floatLeftTopForms" || d == "floatLeftBottomForms" || d == "floatRightTopForms" || d == "floatRightBottomForms" || d == "absForms" || d == "absTopForms" || d == "absBottomForms") {
            a = parseInt(h.width())
        }
        if (a > 0) {
            X.w = a
        }
        e = parseInt(h.height());
        if (h.attr("_autoHeight") == 0 && e > 0) {
            X.h = e
        }
        if (h.hasClass("formStyle29")) {
            if (h.attr("_autoHeight") == 1 && e > 0) {
                X.h = -e
            }
        }
        if (h.hasClass("formStyle79")) {
            var I = parseInt($(h).find(".floatImg img").width());
            var N = parseInt($(h).find(".floatImg img").height());
            var G = parseInt(h.width());
            var f = parseInt(h.height());
            if (I > G || N > f) {
                I = G;
                N = f
            }
            if (l.bannerType == 0) {
                var Q = h.find(".formBanner").height();
                N += Q
            }
            X.w = I;
            X.h = N
        }
    }
    var M = l.systemPattern;
    X.sp = parseInt(M);
    var P = l.transparent;
    X.tran = parseInt(P);
    var v = l.systemTab;
    X.ts = parseInt(v);
    var o = l.systemMulModuleCol;
    X.mmcs = parseInt(o);
    var j = l.mulModuleColPattern;
    X.mmcp = j;
    var Y = l.systemFullmeasure;
    X.fms = parseInt(Y);
    var y = l.fullmeasurePattern;
    X.fmp = y;
    var O = l.systemSearchBoxStyle;
    X.sbs = parseInt(O);
    var n = l.searchBoxPattern;
    X.sbp = n;
    var q = l.groupText;
    if (q.y == 0) {
        X.gt = {};
        X.gt.y = 0
    } else {
        X.gt = {};
        X.gt.y = 1;
        X.gt.f = q.f;
        X.gt.s = parseInt(q.s);
        X.gt.c = q.c;
        X.gt.h = q.h
    }
    var V = l.groupHeight;
    if (V.y == 0) {
        X.gh = {};
        X.gh.y = 0
    } else {
        X.gh = {};
        X.gh.y = 1;
        X.gh.h = parseInt(V.h)
    }
    var m = l.groupBg;
    X.gb = {};
    X.gb.y = 0;
    if (m.f) {
        X.gb.f = m.f
    }
    if (m.y == 1) {
        X.gb.y = 1
    } else {
        if (m.y == 2) {
            X.gb.y = 2;
            X.gb.c = m.c;
            X.gb.r = parseInt(m.r)
        }
    }
    var i = l.groupBorder;
    X.gd = {};
    X.gd.y = 0;
    if (i.y == 1) {
        X.gd.y = 1
    } else {
        if (i.y == 2) {
            X.gd.y = 2;
            X.gd.c = i.c;
            X.gd.w = parseInt(i.w);
            X.gd.s = parseInt(i.s)
        }
    }
    var x = l.groupPosition;
    X.gp = {};
    X.gp.y = 0;
    if (x.y == 1) {
        X.gp.y = 1;
        X.gp.l = parseInt(x.l);
        X.gp.t = parseInt(x.t)
    }
    var g = l.itemWidth;
    X.iw = {};
    X.iw.y = 0;
    if (g.y == 1) {
        X.iw.y = 1;
        X.iw.w = parseInt(g.w)
    }
    var U = l.itemHeight;
    X.ih = {};
    X.ih.y = 0;
    if (U.y == 1) {
        X.ih.y = 1;
        X.ih.h = parseInt(U.h)
    }
    var L = l.itemBg;
    X.ib = {};
    X.ib.y = 0;
    if (L.f) {
        X.ib.f = L.f
    }
    if (L.y == 1) {
        X.ib.y = 1
    } else {
        if (L.y == 2) {
            X.ib.y = 2;
            X.ib.c = L.c;
            X.ib.r = parseInt(L.r)
        }
    }
    var s = l.itemHBg;
    X.ig = {};
    X.ig.y = 0;
    if (s.f) {
        X.ig.f = s.f
    }
    if (s.y == 1) {
        X.ig.y = 1
    } else {
        if (s.y == 2) {
            X.ig.y = 2;
            X.ig.c = s.c;
            X.ig.r = parseInt(s.r)
        }
    }
    var b = l.itemSp;
    X.is = {};
    X.is.y = 0;
    if (b.y == 1) {
        X.is.y = 1;
        X.is.w = parseInt(b.w)
    }
    var r = l.border;
    if (r.y == 1) {
        X.d = {};
        X.d.y = 1
    } else {
        if (r.y == 2) {
            X.d = {};
            X.d.y = 2;
            X.d.c = r.c;
            X.d.w = parseInt(r.w);
            X.d.s = parseInt(r.s)
        }
    }
    if (l.bannerType == 1) {
        X.e = 1
    }
    if (l.bannerAutoHeight == false) {
        X.bh = parseInt(h.find(".formBanner")[0].clientHeight)
    }
    var R = l.bannerText;
    if (R.y == 1) {
        X.bt = {};
        X.bt.y = 1
    } else {
        if (R.y == 2) {
            X.bt = {};
            X.bt.y = 2;
            X.bt.f = R.f;
            X.bt.s = parseInt(R.s);
            X.bt.w = parseInt(R.w);
            X.bt.c = R.c;
            X.bt.fct = parseInt(R.fct);
            X.bt.a = parseInt(R.a);
            if (R.py == 1) {
                X.bt.py = 1;
                X.bt.r = parseInt(R.r);
                X.bt.u = parseInt(R.u);
                X.bt.p = R.p
            }
        }
    }
    var Z = l.bannerMore;
    if (Z.y == 1) {
        X.bm = {};
        X.bm.y = 1;
        X.bm.f = Z.f;
        X.bm.s = parseInt(Z.s);
        X.bm.w = parseInt(Z.w);
        X.bm.d = parseInt(Z.d);
        X.bm.c = Z.c;
        X.bm.fct = parseInt(Z.fct);
        if (Z.py == 1) {
            X.bm.py = 1;
            X.bm.r = parseInt(Z.r);
            X.bm.u = parseInt(Z.u)
        }
    }
    var p = l.bannerBg;
    X.bg = {};
    X.bg.y = 0;
    if (p.f) {
        X.bg.f = p.f
    }
    if (p.y == 1) {
        X.bg.y = 1
    } else {
        if (p.y == 2) {
            X.bg.y = 2;
            X.bg.c = p.c;
            X.bg.r = parseInt(p.r)
        }
    }
    var H = l.bannerIcon;
    X.bi = {};
    X.bi.y = 0;
    if (H.f) {
        X.bi.f = H.f
    }
    if (H.y == 1) {
        X.bi.y = 1
    } else {
        if (H.y == 2) {
            X.bi.y = 2
        }
    }
    var t = l.outside;
    if (t.y == 1) {
        X.o = {};
        X.o.y = 1;
        X.o.l = parseInt(t.l);
        X.o.r = parseInt(t.r);
        X.o.t = parseInt(t.t);
        X.o.b = parseInt(t.b)
    }
    var E = l.inner;
    if (E.y == 1) {
        X.i = {};
        X.i.y = 1;
        X.i.l = parseInt(E.l);
        X.i.r = parseInt(E.r);
        X.i.t = parseInt(E.t);
        X.i.b = parseInt(E.b)
    }
    var S = l.contentText;
    if (S.y == 1) {
        X.ct = {};
        X.ct.y = 1;
        X.ct.f = S.f;
        X.ct.c = S.c;
        X.ct.fct = parseInt(S.fct);
        X.ct.cs = parseInt(S.cs)
    }
    var D = l.contentLink;
    if (D.y == 1) {
        X.cl = {};
        X.cl.y = 1;
        X.cl.f = D.f;
        X.cl.d = parseInt(D.d);
        X.cl.c = D.c;
        X.cl.fct = parseInt(D.fct);
        X.cl.ls = parseInt(D.ls);
        X.cl.b = parseInt(D.b)
    }
    var C = l.contentBg;
    X.cb = {};
    X.cb.y = 0;
    if (C.f) {
        X.cb.f = C.f
    }
    if (C.y == 1) {
        X.cb.y = 1
    } else {
        if (C.y == 2) {
            X.cb.y = 2;
            X.cb.c = C.c;
            X.cb.r = parseInt(C.r)
        }
    }
    var c = l.contentSplitLine;
    X.csl = {};
    X.csl.y = 0;
    if (c.y == 1) {
        X.csl.y = 1
    } else {
        if (c.y == 2) {
            X.csl.y = 2;
            X.csl.s = parseInt(c.s);
            X.csl.c = c.c;
            X.csl.w = parseInt(c.w)
        }
    }
    var F = l.contentRowHeight;
    X.crh = {};
    X.crh.y = 0;
    if (F.y == 1) {
        X.crh.y = 1;
        X.crh.h = parseInt(F.h) || 0
    }
    var W = l.contentLineIcon;
    X.cli = {};
    X.cli.y = 0;
    if (W.y == 1) {
        X.cli.y = 1
    } else {
        if (W.y == 2) {
            X.cli.y = 2
        }
    }
    if (W.f) {
        X.cli.f = W.f;
        X.cli.p = W.p
    }
    var A = l.contentItemSpace;
    X.cis = {};
    X.cis.y = 0;
    if (A.y == 1) {
        X.cis.y = 1;
        X.cis.w = parseInt(A.w)
    }
    var B = l.contentHoverFont;
    if (B.y == 1) {
        X.chf = {};
        X.chf.y = 1;
        X.chf.s = parseInt(B.s);
        X.chf.w = parseInt(B.w);
        X.chf.u = parseInt(B.u);
        X.chf.f = B.f;
        X.chf.c = B.c
    }
    var K = l.contentHoverBg;
    X.chb = {};
    X.chb.y = 0;
    if (K.f) {
        X.chb.f = K.f
    }
    if (K.y == 1) {
        X.chb.y = 1
    } else {
        if (K.y == 2) {
            X.chb.y = 2;
            X.chb.c = K.c;
            X.chb.r = parseInt(K.r)
        }
    }
    var z = l.contentSelectFont;
    if (z.y == 1) {
        X.csf = {};
        X.csf.y = 1;
        X.csf.s = parseInt(z.s);
        X.csf.w = parseInt(z.w);
        X.csf.u = parseInt(z.u);
        X.csf.f = z.f;
        X.csf.c = z.c
    }
    var T = l.contentSelectBg;
    X.csb = {};
    X.csb.y = 0;
    if (T.f) {
        X.csb.f = T.f
    }
    if (T.y == 1) {
        X.csb.y = 1
    } else {
        if (T.y == 2) {
            X.csb.y = 2;
            X.csb.c = T.c;
            X.csb.r = parseInt(T.r)
        }
    }
    var J = l.sideText;
    if (J.y == 1) {
        X.st = {};
        X.st.y = 1
    } else {
        if (J.y == 2) {
            X.st = {};
            X.st.y = 2;
            X.st.f = J.f;
            X.st.s = parseInt(J.s);
            X.st.w = parseInt(J.w);
            X.st.c = J.c;
            X.st.fct = parseInt(J.fct)
        }
    }
    var u = l.sideSize;
    if (u.w == -1 && u.h == -1) {
        X.ss = {};
        X.ss.w = -1;
        X.ss.h = -1
    } else {
        if (u.w == -1) {
            X.ss = {};
            X.ss.w = -1;
            X.ss.h = parseInt(u.h)
        } else {
            if (u.h == -1) {
                X.ss = {};
                X.ss.w = parseInt(u.w);
                X.ss.h = -1
            } else {
                X.ss = {};
                X.ss.w = parseInt(u.w);
                X.ss.h = parseInt(u.h)
            }
        }
    }
    var w = l.sideBg;
    X.sb = {};
    X.sb.y = 0;
    if (w.f) {
        X.sb.f = w.f
    }
    if (w.y == 1) {
        X.sb.y = 1
    } else {
        if (w.y == 2) {
            X.sb.y = 2;
            X.sb.c = w.c;
            X.sb.r = parseInt(w.r)
        }
    }
    return X
};
Site.getModuleAttrDataStg = function(r) {
    var b = Fai.top.$("#module" + r);
    var t = Site.getModuleAttrData(r);
    var o;
    if (b.hasClass("formStyle29")) {
        var p = [];
        var h = [];
        var l;
        if (b.find(".formTabButtonYList").length > 0) {
            l = b.find(".formTabButtonYList .formTabButton")
        } else {
            l = b.find(".formTabButtonList .formTabButton")
        }
        l.each(function() {
            var u = $(this).attr("id").replace("formTabButton", "");
            u = parseInt(u);
            if (u > 0) {
                o = Fai.top.$("#module" + u);
                if (o.hasClass("formStyle29") || o.hasClass("formStyle35") || o.hasClass("formStyle80")) {
                    return true
                }
                h.push(parseInt(u))
            }
        });
        var c = [];
        var n = b.find(".formTabContent .form");
        n.each(function() {
            var u = $(this).attr("id").replace("module", "");
            u = parseInt(u);
            if (u > 0) {
                o = Fai.top.$("#module" + u);
                if (o.hasClass("formStyle29") || o.hasClass("formStyle35") || o.hasClass("formStyle80")) {
                    return true
                }
                c.push(parseInt(u))
            }
        });
        $.each(h,
        function(u, v) {
            if ($.inArray(v, c) != -1) {
                p.push({
                    i: v
                })
            }
        });
        t.prop1 = $.toJSON(p)
    }
    if (b.hasClass("formStyle35")) {
        var k = b.find(".mulMColContent .mulColLayout");
        var f = [];
        k.each(function(w, x) {
            var v = {};
            v.i = w + 1;
            v.ls = [];
            v.w = -1;
            $(this).find(".mulMColList>.form").each(function() {
                var y = parseInt($(this).attr("id").replace("module", ""));
                if (y > 0) {
                    o = Fai.top.$("#module" + y);
                    if (o.hasClass("formStyle35") || o.hasClass("formStyle80")) {
                        return true
                    }
                    v.ls.push({
                        i: y
                    })
                }
            });
            var u = parseInt($(this).width());
            if (!isNaN(u)) {
                v.w = u
            }
            f.push(v)
        });
        t.prop2 = k.length;
        t.prop1 = $.toJSON(f)
    }
    if (b.hasClass("formStyle1")) {
        var e = b.find("img.richModuleSlaveImg");
        if (e && e.length > 0) {
            var s = {};
            s.i = e.attr("imgid");
            s.w = parseInt(e.width());
            s.h = parseInt(e.height());
            s.u = e.attr("imgurl");
            s.c = parseInt(e.attr("imgcolid"));
            s.l = parseInt(e.attr("imglinktype"));
            s.d = e.attr("title");
            s.path = e.attr("imgpath");
            t.prop1 = $.toJSON(s)
        }
    }
    if (b.hasClass("formStyle80")) {
        var m = b.find(".fullmeasureContent").children(".form");
        var a = [];
        var i = 0;
        m.each(function(u, v) {
            i = parseInt($(v).attr("id").replace("module", ""));
            if (i > 0) {
                o = Fai.top.$("#module" + i);
                if (o.hasClass("formStyle80")) {
                    return true
                }
                a.push({
                    i: i
                })
            }
        });
        t.prop1 = $.toJSON(a)
    }
    if (b.hasClass("formStyle81")) {
        var j = b.find(".floatBtn");
        if (j.length > 0) {
            if (Fai.top._floatBtn != undefined && Fai.top._floatBtn["_floatBtnData" + r] != undefined) {
                var q = Fai.top._floatBtn["_floatBtnData" + r];
                var d = {};
                d.bs = {};
                d.bns = q.bns;
                d.bs.v = q.bs.v;
                d.bs.hn = q.bs.hn;
                d.bs.h = q.bs.h;
                d.bs.hi = q.bs.hi;
                d.s = {};
                if (q.s.t == 1) {
                    d.s.t = 1
                }
                d.s.w = parseInt(j.width()) || 0;
                d.s.h = parseInt(j.height()) || 0;
                d.bg = {};
                if (q.bg.t == 1) {
                    d.bg.t = 1;
                    d.bg.c = q.bg.c;
                    d.bg.i = q.bg.i;
                    d.bg.r = q.bg.r
                }
                d.r = {};
                if (q.r.t == 2) {
                    d.r.t = 2;
                    d.r.lt = q.r.lt;
                    d.r.rt = q.r.rt;
                    d.r.lb = q.r.lb;
                    d.r.rb = q.r.rb
                } else {
                    if (q.r.t == 1) {
                        d.r.t = 1
                    }
                }
                d.sh = {};
                if (q.sh.t == 2) {
                    d.sh.t = 2;
                    d.sh.dx = q.sh.dx;
                    d.sh.dy = q.sh.dy;
                    d.sh.f = q.sh.f;
                    d.sh.c = Site.toRgba(q.sh.c, 0.5)
                } else {
                    if (q.sh.t == 1) {
                        d.sh.t = 1
                    }
                }
                d.b = {};
                if (q.b.t == 2) {
                    d.b.t = 2;
                    d.b.w = q.b.w;
                    d.b.c = q.b.c
                } else {
                    if (q.b.t == 1) {
                        d.b.t = 1
                    }
                }
                t.prop1 = $.toJSON(d)
            } else {
                var g = {};
                g.s = {};
                g.s.t = 1;
                g.s.w = parseInt(j.width()) || 0;
                g.s.h = parseInt(j.height()) || 0;
                t.prop1 = $.toJSON(g)
            }
        }
    }
    return t
};
Site.getOpenAddModuleStatus = function(b) {
    if ($("#" + b).css("position") == "absolute") {
        return - 1
    }
    var a = $("#" + b).parent().attr("id");
    if (a == "floatLeftTopForms" || a == "floatRightTopForms" || a == "floatLeftBottomForms" || a == "floatRightBottomForms") {
        return - 1
    }
    return 1
};
Site.moduleSizeChange = function(k) {
    var b = $("#" + k);
    if (b.hasClass("formStyle30") || b.hasClass("formStyle31")) {
        var c = b.find("div.product-container");
        if (c.length == 0) {
            return
        }
        var e = c.first();
        var l = b.find("a.gallery-control-prev"),
        o = b.find("a.gallery-control-next"),
        m = l.width();
        var i = 1,
        d = b.find("div.formMiddleContent").width(),
        n = d - 20 - (m * 2),
        s = e.outerWidth(true),
        a = e.outerWidth(),
        g = s - a;
        if (n > s) {
            i = parseInt(n / s)
        }
        var f = (i * s) - g;
        b.find("div.product-gallery-preview").width(f);
        var q = c.length;
        var r = q % i == 0 ? q / i: Math.floor(q / i) + 1;
        b.find("div.product-gallery-container").width(q * s).css("left", "0px");
        var h = c.length < i ? c.length: i;
        for (var p = 0; p < h; p++) {
            var t = $(c[p]).find("img");
            if (!t.attr("src")) {
                t.attr("src", t.attr("lzurl"))
            }
            t.show()
        }
        l.addClass("gallery-control-prev-disabled");
        o.removeClass("gallery-control-next-disabled");
        if (r == 1) {
            o.addClass("gallery-control-next-disabled")
        }
        l.unbind("click").click(function() {
            var v = $(this);
            if (v.hasClass("gallery-control-prev-disabled")) {
                return false
            }
            var w = v.parent(),
            u = w.find("div.product-gallery-container"),
            x = w.find("a.gallery-control-next");
            if (x.hasClass("gallery-control-next-disabled")) {
                x.removeClass("gallery-control-next-disabled")
            }
            if (u.position().left == 0 || u.is(":animated")) {
                return false
            }
            var j = f + g;
            u.animate({
                left: "+=" + j + "px"
            },
            function() {
                if (u.position().left == 0) {
                    v.addClass("gallery-control-prev-disabled")
                }
            })
        });
        o.unbind("click").click(function() {
            var B = $(this);
            if (B.hasClass("gallery-control-next-disabled")) {
                return false
            }
            var w = B.parent(),
            j = w.find("div.product-gallery-container"),
            v = w.find("a.gallery-control-prev");
            if (v.hasClass("gallery-control-prev-disabled")) {
                v.removeClass("gallery-control-prev-disabled")
            }
            var C = f + g,
            D = -(r - 1) * (C);
            left_position = parseInt(j.css("left").replace("px"));
            if (left_position == D || j.is(":animated")) {
                return false
            }
            if (!B.data("loading_finish")) {
                var A = (Math.abs(left_position) / (s * i)) + 1;
                var u = A <= 1 ? 1 * i: A * i,
                y = u + i > c.length ? c.length: u + i;
                for (var x = u; x < y; x++) {
                    var z = $(c[x]).find("img");
                    if (!z.attr("src")) {
                        z.attr("src", z.attr("lzurl"))
                    }
                    z.show()
                }
            }
            j.animate({
                left: "-=" + C + "px"
            },
            function() {
                var E = parseInt(j.css("left").replace("px", ""));
                if (E == D) {
                    B.data("loading_finish", true);
                    B.addClass("gallery-control-next-disabled")
                }
            })
        })
    }
    Site.setRefreshInfo("moduleSetting", true)
};
Site.bindEventToOverLayer = function() {
    top.$(top.document).delegate("#findModuleDiv", "mouseleave click",
    function() {
        Site.removeOverlay()
    });
    Fai.top.$("#styleDesign").click(function() {
        Site.removeOverlay()
    });
    Site.bindGobalEvent("showFindModuleDiv",
    function(b, a) {
        setTimeout(function() {
            var f = Fai.top.$("#module" + a);
            var d = f.offset().top;
            var h = f.offset().left;
            var g = f.outerWidth();
            var e = f.outerHeight();
            f.find(".draggableBtn").remove();
            Site.removeOverlay();
            var c = {};
            c.moduleWidth = g;
            c.moduleHeight = e;
            c.moduleLeft = h;
            c.moduleTop = d;
            Site.overlay(c);
            setTimeout(function() {
                var i = Fai.top.$("#findModuleDiv");
                top.$(top.document).mousemove(function() {
                    i.mouseenter(function() {
                        i.remove()
                    })
                });
                Fai.top.$("#g_main").scroll(function() {
                    i.remove()
                })
            },
            200);
            setTimeout(function() {
                if (typeof Fai.top.draggableDiv_out != "undefined" && Fai.top.draggableDiv_out) {
                    Fai.top.draggableDiv_out = false;
                    Site.functionInterface({
                        name: "faiFloatPanel"
                    },
                    0)
                }
            },
            200)
        },
        250)
    })
};
Site.scrollToModuleDiv = function(a) {
    if (typeof a == "undefined" || a.length < 1) {
        return
    }
    var e = top.$(top.document).find("body");
    var l = $("#g_main");
    var f = e.children(".floatLeftTop");
    var h = 0;
    if (f.length > 0) {
        h = parseInt(f.css("top").split("p")[0])
    }
    var g = a.offset().top;
    var c = a.offset().left;
    var k = a.outerWidth();
    var i = a.outerHeight();
    var m = g - h;
    var b = $(window).height() - h;
    var d = l.scrollTop();
    var j = (b / 4);
    if (m < 0) {
        l.scrollTop(d + m - j)
    } else {
        if (m < b) {
            if (m < j) {
                l.scrollTop(d - (j - m))
            } else {
                l.scrollTop(d + (m - j))
            }
        } else {
            l.scrollTop(d + m - j)
        }
    }
};
Site.productGetPicClick = function(c) {
    var a = Fai.top.$(c).parent();
    var b = Fai.top.$("#" + (a.attr("id").replace("imgBorder", "")));
    var d = b.find("a").eq(0);
    if (d.attr("onclick")) {
        d.click()
    } else {
        if (d.attr("href") != "javascript:;") {
            window.open(d.attr("href"))
        }
    }
};
Site.productGetPicHrefClick = function(c) {
    var a = Fai.top.$(c).parent();
    var b = Fai.top.$("#" + (a.attr("id").replace("imgBorder", "")));
    var d = b.find(".imgDiv a").eq(0);
    if (d.attr("onclick")) {
        d.click()
    } else {
        if (d.attr("href") != "javascript:;") {
            window.open(d.attr("href"))
        }
    }
};
Site.productGetPicNameHrefClick = function(c) {
    var a = Fai.top.$(c).parent();
    var b = Fai.top.$("#" + (a.attr("id").replace("imgBorder", "")));
    var d = b.find(".productName a").eq(0);
    if (d.attr("onclick")) {
        d.click()
    } else {
        if (d.attr("href") != "javascript:;") {
            window.open(d.attr("href"))
        }
    }
};
Site.getSideStatus = function(b) {
    var a = Fai.top.$("#" + b).attr("_side");
    if (parseInt(a) == 1) {
        return 0
    }
    return 1
};
Site.getSideStatus2 = function(e) {
    var b = Site.getSideStatus(e);
    var d = parseInt($("#" + e).attr("_intab"));
    var a = parseInt($("#" + e).attr("_inmulmcol"));
    var c = parseInt($("#" + e).attr("_infullmeasure"));
    if (d > 0 || a > 0 || c > 0 || b == 0) {
        b = -1
    }
    return b
};
Site.sideModule = function(b) {
    var e = $("#" + b);
    var g = e.parent().attr("id");
    var c = e.attr("_side");
    var d = e.offset().top;
    var i = Fai.top.Fai.getBrowserWidth();
    var f = e.outerWidth();
    if (c == 1) {
        var h = 0;
        if (g == "floatLeftTopForms" || g == "floatLeftBottomForms") {
            h = 1
        } else {
            if (g == "floatRightTopForms" || g == "floatRightBottomForms") {
                h = 0
            }
        }
        e.attr("_side", 0);
        if (g != "absForms" && g != "absTopForms" && g != "absBottomForms") {}
        if (h == 0) {
            e.offset({
                top: d,
                left: i - f
            })
        } else {
            e.offset({
                top: d,
                left: 0
            })
        }
        Site.placeFloatModule(e);
        e.off("mouseenter.sideModule").off("mouseleave.sideModule");
        Fai.top.$("#" + b + "SideBtn").remove()
    } else {
        e.attr("_side", 1);
        if (g == "floatLeftTopForms" || g == "floatRightTopForms" || g == "floatLeftBottomForms" || g == "floatRightBottomForms") {} else {
            if (g != "absForms" && g != "absTopForms" && g != "absBottomForms") {
                Site.floatOut(b)
            }
            Site.placeFloatModule(e)
        }
        Site.reSetSidePosition(e)
    }
    var a = parseInt(b.replace("module", ""));
    Site.getModuleAttrPattern(a).changed = true;
    Fai.top._moduleMoved++;
    Site.styleChanged()
};
Site.refreshSideBtn = function(b) {
    var c = b.attr("_side");
    var e = 0;
    var r = Fai.getCssInt(b, "border-left-width");
    var a = Fai.top.Fai.getBrowserHeight();
    var j = b.outerWidth();
    var p = b.height();
    var i = b.find(".titleText").first().text();
    var l = b.parent().attr("id");
    var g = b.attr("id");
    var f = [];
    var m = Fai.top.$("#" + g + "SideBtn");
    m.remove();
    if (c == 1) {
        if (l == "floatLeftTopForms" || l == "floatLeftBottomForms") {
            e = 1;
            f = ["<div id='" + g + "SideBtn' class='g_sideBtn'><div class='g_sideBtn_t g_sB_lt'></div><div class='g_sideBtn_c g_sB_lc'><span class='g_sideBtn_tl'>" + i + "</span></div><div class='g_sideBtn_b g_sB_lb'></div><div class='g_sideBtn_extend g_sB_le'></div></div>"]
        } else {
            if (l == "floatRightTopForms" || l == "floatRightBottomForms") {
                e = 0;
                f = ["<div id='" + g + "SideBtn' class='g_sideBtn'><div class='g_sideBtn_t g_sB_rt'></div><div class='g_sideBtn_c g_sB_rc'><span class='g_sideBtn_tl'>" + i + "</span></div><div class='g_sideBtn_b g_sB_rb'></div><div class='g_sideBtn_extend g_sB_re'></div></div>"]
            }
        }
        b.css("overflow", "visible")
    }
    b.append(f.join(""));
    var h = Fai.top.$("#" + g + "SideBtn");
    if (h.length > 0) {
        var o = h.width();
        var d = h.height();
        var n = parseInt((p - d) / 2);
        if (e == 0) {
            h.css({
                top: n,
                left: -o - r
            })
        } else {
            h.css({
                top: n,
                left: j - r
            })
        }
        var k = h.position().top;
        var q = h.position().top + d;
        if (c == 1) {
            if (l == "floatLeftTopForms" || l == "floatRightTopForms") {
                if (q <= 0) {
                    h.css({
                        top: p - d
                    })
                }
            } else {
                if (l == "floatLeftBottomForms" || l == "floatRightBottomForms") {
                    if ((k - a) >= 0) {
                        h.css({
                            top: 0
                        })
                    }
                }
            }
        }
    }
};
Site.autoSideWidth = function(a) {
    Site.removeModuleStyleCssList(a, [{
        cls: ".g_sideBtn",
        key: "width"
    },
    {
        cls: ".g_sideBtn_c",
        key: "width"
    }])
};
Site.autoSideHeight = function(a) {
    Site.removeModuleStyleCssList(a, [{
        cls: ".g_sideBtn_c",
        key: "height"
    }])
};
Site.flutter = function(g) {
    if (Fai.top.$("#" + g).hasClass("formStyle80")) {
        return
    }
    var a = $("div[_side='2']").length;
    if (a >= 3) {
        Fai.ing("页面至多支持3个飘动模块！");
        return
    }
    Site.reSetOutSideMargin(g);
    var c = $("#" + g);
    var e = Site.getDockStatus(g);
    var d = Site.getSideStatus(g);
    if (d == 0) {
        Site.unSideModule2(g)
    } else {
        var f = c.parent().attr("id");
        if (f != "floatLeftTopForms" && f != "floatRightTopForms" && f != "floatLeftBottomForms" && f != "floatRightBottomForms") {
            if (f != "absForms" && f != "absTopForms" && f != "absBottomForms") {
                Site.floatOut(g)
            }
            Site.placeFloatModule(c);
            if (c.attr("_autoheight") > 0) {
                c.css("height", "auto")
            }
        }
    }
    c.data("toFlutterFlag", true);
    c.attr("_side", 2);
    c.draggable("destroy");
    c.resizable("destroy");
    Site.floatModuleDraggable(c);
    if (c.hasClass("formStyle1")) {
        var b = c.find("img.richModuleSlaveImg");
        Site.richModuleSlaveImgResize(b);
        Site.richModulePicEdit(b)
    }
    if (c.hasClass("formStyle81")) {
        c.css("width", c.find(".floatBtn").outerWidth() + "px")
    }
    c.removeAttr("_flutterSwich");
    Site.flutterStart(c, true);
    Fai.top._moduleMoved++;
    Site.styleChanged();
    Site.logDog(100045, 24);
    Site.setRefreshInfo("moduleSetting", true)
};
Site.unFlutter = function(a) {
    Site.stopFlutterInterval(a);
    a.attr("_side", 0)
};
Site.getFlutterStatus = function(e) {
    var d = $("#" + e).attr("_side");
    var c = parseInt($("#" + e).attr("_intab"));
    var a = parseInt($("#" + e).attr("_inmulmcol"));
    var b = parseInt($("#" + e).attr("_infullmeasure"));
    if (c > 0 || a > 0 || b > 0 || d == 2) {
        return - 1
    } else {
        return 1
    }
};
Site.getFlutterStatus2 = function(b) {
    var a = $("#" + b).attr("_side");
    if (a == 2) {
        return 0
    } else {
        return 1
    }
};
Site.placeFloatModule = function(d) {
    var k = Site.getTopHeight();
    var c = d.offset().top;
    var f = d.offset().left;
    var g = d.width();
    var l = d.height();
    var e = d.offset().top - k;
    var a = d.offset().left;
    var i = e + parseInt(l / 2);
    var h = a + parseInt(g / 2);
    var j = Fai.top.Fai.getBrowserWidth();
    var b = Fai.top.Fai.getBrowserHeight() - k;
    Site.replaceDocumentwrite(d);
    if (i > parseInt(b / 2)) {
        if (h > parseInt(j / 2)) {
            d.appendTo(Fai.top.$("#floatRightBottomForms"))
        } else {
            d.appendTo(Fai.top.$("#floatLeftBottomForms"))
        }
    } else {
        if (h > parseInt(j / 2)) {
            d.appendTo(Fai.top.$("#floatRightTopForms"))
        } else {
            d.appendTo(Fai.top.$("#floatLeftTopForms"))
        }
    }
    d.offset({
        top: c,
        left: f
    });
    Site.checkFloatModulePosition(d)
};
Site.refreshAbsFloatForm = function(b) {
    if (b.length < 1) {
        return
    }
    if (b.offset().left <= 0) {
        b.offset({
            top: b.offset().top,
            left: 0
        })
    }
    if (b.offset().left >= (Fai.top.Fai.getBrowserWidth() - b.width())) {
        b.offset({
            top: b.offset().top,
            left: Fai.top.Fai.getBrowserWidth() - b.width()
        })
    }
    if (b.parent().hasClass("absForms")) {
        Site.placeAbsModule(b)
    } else {
        if (b.parent().hasClass("floatForms")) {
            if (b.offset().top >= (Fai.top.Fai.getBrowserHeight() - b.height())) {
                b.offset({
                    top: Fai.top.Fai.getBrowserHeight() - b.height(),
                    left: b.offset().left
                })
            }
            if (b.offset().top < Fai.top.$("#g_main").position().top) {
                b.offset({
                    top: Fai.top.$("#g_main").position().top,
                    left: b.offset().left
                })
            }
            var a = b.attr("_side");
            if (a != 2) {
                Site.placeFloatModule(b)
            }
        }
    }
};
Site.floatModuleDraggable = function(b) {
    if (b.length > 0) {
        var a = Site.absAlignLine;
        var c;
        $.each(b,
        function(e, j) {
            var f = $(this).attr("_intab");
            if (f > 0) {
                return true
            }
            var d = $(this).attr("_inmulmcol");
            if (d > 0) {
                return true
            }
            var h = $(this).attr("_side");
            var g = $(this).attr("id");
            $(this).draggable("destroy");
            $(this).draggable({
                smartguides: ".form",
                tolerance: 2,
                drag: function(i, k) {
                    Site.setAbsFormsHolder2();
                    if (h == 2) {
                        Site.stopFlutterInterval($(this))
                    }
                    $(".flutterLayer").remove()
                },
                handle: ".faiDraggableHandle",
                cancel: 'embed[type="application/x-shockwave-flash"], object[type="application/x-shockwave-flash"], input',
                start: function() {
                    Site.disableEditLayer();
                    $(this).unbind("mouseenter.sideModule", Site.bindSideIn1).unbind("mouseleave.sideModule", Site.bindSideOut1).unbind("mouseenter.sideModule", Site.bindSideIn2).unbind("mouseleave.sideModule", Site.bindSideOut2);
                    Fai.top.$("body").disableSelection()
                },
                stop: function(k, l) {
                    if (h == 2) {
                        var i = $(this).offset().left;
                        var m = $(this).offset().top;
                        $(this).data("flutterXPos", i);
                        $(this).data("flutterYPos", m)
                    }
                    Site.refreshAbsFloatForm($(this));
                    Site.refreshSideBtn($(this));
                    Site.styleChanged();
                    Fai.top._moduleMoved++;
                    Site.enableEditLayer();
                    Fai.top.$("body").enableSelection();
                    $(this).trigger("Fai_onModuleLayoutChange");
                    Site.setRefreshInfo("moduleDrag", true)
                }
            });
            $(this).resizable("destroy");
            if ($(this).hasClass("formStyle35")) {
                Site.bindInMulColResizableModule($(this).attr("id").replace("module", ""))
            }
            $(this).find(".ui-resizable-cancelTip").remove();
            if ($(this).hasClass("formStyle79")) {
                Site.floatImgResize($(this));
                return
            }
            if ($(this).hasClass("formStyle81")) {
                Site.floatBtnResize($(this));
                return
            }
            if ($(this).hasClass("formStyle82")) {
                return
            }
            $(this).resizable({
                helper: "ui-resizable-helper",
                handles: "n, e, s, w, se, sw, ne, nw",
                autoHide: true,
                create: function() {
                    if (($(this).attr("_autoHeight") == 0) && ($(this).children(".ui-resizable-cancelTip").length < 1)) {
                        var l = $(this).attr("id").replace("module", "");
                        var k = $(this).find(".ui-resizable-se").css("z-index");
                        var i = "";
                        if ($(this).hasClass("formStyle29") || $(this).hasClass("formStyle35") || $(this).hasClass("formStyle80")) {
                            i += " ui-resizable-cancelTip2 fk-resizable-cancelTip2"
                        }
                        $(this).append("<a href='javascript:;' class='J_resizableTip ui-resizable-cancelTip fk-resizable-cancelTip" + i + "' style='z-index:" + k + ";' parentid='" + $(this).attr("id") + "' title='还原模块默认高度' onclick='Site.absModuleAutoHeight(" + l + ");return false;'></a>")
                    }
                    Site.addResizableExtHandles($(this));
                    Site.refreshResizableHandles($(this))
                },
                start: function(i, k) {
                    $(this).unbind("mouseenter", Site.bindSideIn1).unbind("mouseleave", Site.bindSideOut1).unbind("mouseenter", Site.bindSideIn2).unbind("mouseleave", Site.bindSideOut2);
                    Site.disableEditLayer();
                    Fai.top.$("body").disableSelection();
                    if ($(this).hasClass("formStyle35") || $(this).hasClass("formStyle29")) {
                        $(this).attr("_mousein", 1)
                    }
                    c = $("#dockTip").show();
                    a.resize.begin = true;
                    if ($(this).hasClass("formStyle83")) {
                        var l = $(this);
                        $(k.originalElement).find("> .ui-resizable-handle").each(function(m, n) {
                            if ($(n).data("on")) {
                                if ($(n).hasClass("ui-resizable-nw") || $(n).hasClass("ui-resizable-ne") || $(n).hasClass("ui-resizable-sw") || $(n).hasClass("ui-resizable-se")) {
                                    l.resizable("option", "aspectRatio", true);
                                    return false
                                }
                            } else {
                                l.resizable("option", "aspectRatio", false)
                            }
                        })
                    }
                },
                resize: function(k, l) {
                    var i = $(".ui-resizable-helper");
                    $(this).find(".formMiddle").find(".formMiddleCenter").css("vertical-align", "top");
                    var m = ["top", "right", "bottom", "left"];
                    a.resize.init($(this), i, k, m);
                    if ($(this).hasClass("formStyle35") || $(this).hasClass("formStyle29")) {
                        $(this).attr("_mousein", 1)
                    }
                    c.html("高度:" + i.height() + "<br/>宽度:" + i.width()).css({
                        left: k.pageX - 28,
                        top: k.pageY + 18
                    })
                },
                stop: function(k, l) {
                    if ($(this).hasClass("formStyle35") || $(this).hasClass("formStyle29")) {
                        $(this).attr("_mousein", 1)
                    }
                    var n = $(this).attr("id").replace("module", "");
                    if ($(this).children(".ui-resizable-cancelTip").length < 1) {
                        var m = $(this).find(".ui-resizable-se").css("z-index");
                        var i = "";
                        if ($(this).hasClass("formStyle29") || $(this).hasClass("formStyle35") || $(this).hasClass("formStyle80")) {
                            i += " ui-resizable-cancelTip2 fk-resizable-cancelTip2"
                        }
                        $(this).append("<a href='javascript:;' class='J_resizableTip ui-resizable-cancelTip fk-resizable-cancelTip" + i + "' style='z-index:" + m + ";' parentid='" + $(this).attr("id") + "' title='还原模块默认高度' onclick='Site.absModuleAutoHeight(" + n + ");return false;'></a>")
                    }
                    Site.styleChanged();
                    Fai.top._moduleMoved++;
                    Site.getModuleAttrPattern(n).changed = true;
                    $(l.originalElement).find("> .ui-resizable-handle").each(function(o, p) {
                        if ($(p).data("on")) {
                            if ($(p).hasClass("ui-resizable-e") || $(p).hasClass("ui-resizable-w")) {
                                Site.autoModuleHeight(n);
                                return false
                            } else {
                                $(l.originalElement).attr("_autoHeight", 0);
                                return false
                            }
                        }
                    });
                    Site.refreshModuleHeight(n);
                    if (h != 2) {
                        Site.refreshAbsFloatForm($(this))
                    }
                    Site.refreshSideBtn($(this));
                    Site.enableEditLayer();
                    Site.moduleSizeChange("module" + n);
                    if ($(this).hasClass("formStyle5") || $(this).hasClass("formStyle77")) {
                        Site.refreshModulePhotoSwitch(n)
                    }
                    Fai.top.$("body").enableSelection();
                    $(this).trigger("Fai_onModuleSizeChange");
                    c.hide();
                    Site.logDog(100092, 0);
                    if (Site.getFlutterStatus2(g) == 0) {
                        Site.logDog(100092, 5)
                    } else {
                        if (Site.getSideStatus(g) == 0) {
                            Site.logDog(100092, 4)
                        } else {
                            if (Site.getLockStatus(g) == 0) {
                                Site.logDog(100092, 3)
                            } else {
                                if (Site.getAbsStatus(g) == 0) {
                                    Site.logDog(100092, 2)
                                }
                            }
                        }
                    }
                    Site.triggerGobalEvent("resizableModuleChange", n);
                    Fai.top.$("#absAlignTop, #absAlignRight, #absAlignBottom,#absAlignLeft").hide();
                    if ($(this).hasClass("formStyle83")) {
                        Site.initPhotoCard(n)
                    }
                }
            });
            $(this).find(".formMiddle").find(".formMiddleCenter").css("vertical-align", "top");
            $(this).children(".ui-resizable-handle").attr("title", "按住鼠标，可随意调整宽高。").attr("parentid", g);
            $(this).find("> .ui-resizable-handle").bind("mousedown",
            function(l, i) {
                $(this).data("on", true).siblings().data("on", false)
            })
        })
    }
};
Site.getDockStatus = function(d) {
    var a = Site.getLockStatus(d);
    var b = Site.getAbsStatus(d);
    var c = Site.getSideStatus(d);
    if (a != 0 && b != 0 && c != 0) {
        return 0
    }
    return 1
};
Site.getDockStatus2 = function(d) {
    var b = Site.getDockStatus(d);
    var c = parseInt($("#" + d).attr("_intab"));
    var a = parseInt($("#" + d).attr("_inmulmcol"));
    if (c > 0 || a > 0 || b == 0) {
        b = -1
    }
    return b
};
Site.dock = function(c) {
    var d = $("#" + c);
    Site.disableEditLayer();
    d.removeAttr("style");
    var g = "";
    var h;
    if (Fai.top.$("#" + Fai.top._floatOutPosition).css("display") != "none") {
        g = Fai.top._floatOutPosition
    } else {
        g = Site.getAppendLayoutForms()
    }
    var i = false;
    if (g == "absForms" || g == "" || g == Site.getLayoutForms(24) || g == Site.getLayoutForms(25)) {
        if (d.hasClass("formStyle80")) {
            if (!Site.isLayoutHidden(24)) {
                h = Fai.top.$("#" + Site.getLayoutForms(24));
                i = true
            } else {
                if (!Site.isLayoutHidden(25)) {
                    h = Fai.top.$("#" + Site.getLayoutForms(25));
                    i = true
                }
            }
        } else {
            var e = Fai.top.$("#" + Site.getLayoutForms(24)).children(".formStyle80");
            var f = Fai.top.$("#" + Site.getLayoutForms(25)).children(".formStyle80");
            if (!Site.isLayoutHidden(24) && e.length > 0) {
                var a = parseInt(e.eq(0).attr("id").replace("module", "")) || 0;
                h = Fai.top.$("#fullmeasureContent" + a);
                i = true;
                Fai.top.Site.getModuleAttrData(a).changed = true
            } else {
                if (!Site.isLayoutHidden(25) && f.length > 0) {
                    var a = parseInt(f.eq(0).attr("id").replace("module", "")) || 0;
                    h = Fai.top.$("#fullmeasureContent" + a);
                    i = true;
                    Fai.top.Site.getModuleAttrData(a).changed = true
                }
            }
        }
        if (!i) {
            Fai.ing("当前页面没有可以停靠的区域，请修改页面布局。", true);
            return
        }
    }
    Site.replaceDocumentwrite(d);
    if (!i) {
        d.prependTo(Fai.top.$("#" + g))
    } else {
        h.append(d)
    }
    Site.refreshAllAbsForms();
    $("#g_middleContent").css("height", "auto");
    d.draggable("destroy");
    d.resizable("destroy");
    Site.sortable();
    Site.moduleSizeChange(c);
    var b = parseInt(c.replace("module", ""));
    Site.getModuleAttrPattern(b).changed = true;
    Fai.top._moduleMoved++;
    Site.styleChanged();
    Site.enableEditLayer();
    d.trigger("Fai_onModuleLayoutChange")
};
Site.floatOut = function(g) {
    var c = $("#" + g);
    Site.disableEditLayer();
    var e = c.parent().attr("id");
    if (e != "absForms" && e != "absTopForms" && e != "absBottomForms") {
        Fai.top._floatOutPosition = e
    }
    var b = c.css("position");
    c.css("width", c.width() + "px");
    c.css("height", c.height() + "px");
    if (b != "absolute") {
        c.css("top", c.position().top + 10);
        c.css("left", c.position().left + 10)
    }
    c.css("position", "absolute");
    Site.replaceDocumentwrite(c);
    c.appendTo(Fai.top.$("#absForms"));
    var f = c.find(".formTab .form");
    if (f.length > 0) {
        f.each(function() {
            $(this).css("position", "relative")
        })
    }
    var a = c.find(".formInMulMCol");
    if (a.length > 0) {
        a.each(function() {
            $(this).css("position", "relative")
        })
    }
    Site.placeAbsModule(c);
    Site.floatModuleDraggable(c);
    Site.refreshAllAbsForms();
    var d = parseInt(g.replace("module", ""));
    Site.getModuleAttrPattern(d).changed = true;
    Fai.top._moduleMoved++;
    Site.styleChanged();
    Site.enableEditLayer()
};
Site.absModuleAutoHeight = function(d) {
    var b = Fai.top.$("#module" + d);
    if (b.length < 1) {
        return
    }
    Site.autoModuleHeight(d);
    b.attr("_autoHeight", "1");
    Site.refreshAbsFloatForm(b);
    var c = b.attr("_side");
    if (c == 1) {
        Site.reSetSidePosition(b)
    }
    if (b.length > 0 && b.attr("_autoheight") == 1) {
        Site.autoModuleHeight(d);
        Fai.top.Site.getModuleAttrPattern(d).changed = true
    }
    var a = Site.getModuleAttrPattern(d);
    a.changed = true;
    Fai.top._moduleMoved++;
    Site.styleChanged();
    if (b.hasClass("formStyle5") || b.hasClass("formStyle77")) {
        Site.refreshModulePhotoSwitch(d)
    }
    if (b.find(".ui-resizable-cancelTip").length > 0) {
        b.find(".ui-resizable-cancelTip").remove()
    }
    Site.moduleSizeChange("module" + d);
    b.trigger("Fai_onModuleSizeChange");
    b.children(".ui-resizable-handle").hide();
    Site.triggerGobalEvent("resizableModuleChange", d)
};
Site.placeAbsModule = function(a) {
    if (a.hasClass("formStyle80")) {
        return
    }
    var e = a.parent().attr("id");
    if (e == "absForms" || e == "absTopForms") {
        var d = a.offset().left;
        var b = a.offset().top;
        var c = Fai.top.$("#webContainer").offset().top;
        if (b < c) {
            if (e != "absTopForms") {
                Site.replaceDocumentwrite(a);
                a.appendTo(Fai.top.$("#absTopForms"));
                a.offset({
                    top: b,
                    left: d
                })
            }
        } else {
            if (e != "absForms") {
                Site.replaceDocumentwrite(a);
                a.appendTo(Fai.top.$("#absForms"));
                a.offset({
                    top: b,
                    left: d
                })
            }
        }
    }
    Site.checkAbsModulePosition(a)
};
Site.refreshAllAbsForms = function() {
    Fai.top.$(".absForms .form").each(function(a) {
        Site.refreshAbsFloatForm($(this))
    })
};
Site.absModule = function(a) {
    if (Fai.top.$("#" + a).hasClass("formStyle80")) {
        return
    }
    if ($("#" + a).css("position") == "absolute") {
        Site.dock(a)
    } else {
        Site.floatOut(a)
    }
    $("#" + a).trigger("Fai_onModuleLayoutChange")
};
Site.absTopModule = function(b) {
    if (Fai.top.$("#" + b).hasClass("formStyle80")) {
        return
    }
    var a = Fai.top.$("#" + b);
    Site.replaceDocumentwrite(a);
    a.appendTo(Fai.top.$("#absTopForms"));
    Site.checkAbsModulePosition(a);
    Fai.top._moduleMoved++;
    Site.styleChanged();
    a.trigger("Fai_onModuleLayoutChange")
};
Site.absZIndexModule = function(g) {
    var b = Fai.top.$("#" + g),
    c = b.parent(),
    f = c.attr("id"),
    e = c.children(".form");
    if (e.length > 1) {
        var d = e.last();
        var a = d.attr("id");
        if (a != g) {
            d.after(b);
            Site.refreshFormIndexClass2({
                id: f,
                inFullmeasure: "0"
            })
        }
    }
    Site.checkAbsModulePosition(b);
    Fai.top._moduleMoved++;
    Site.styleChanged();
    b.trigger("Fai_onModuleLayoutChange");
    Site.logDog(100045, 19)
};
Site.absBottomModule = function(c) {
    if (Fai.top.$("#" + c).hasClass("formStyle80")) {
        return
    }
    var a = Fai.top.$("#" + c);
    var b = c.replace("module", "");
    Site.replaceDocumentwrite(a);
    a.appendTo(Fai.top.$("#absBottomForms"));
    Site.checkAbsModulePosition(a);
    Site.setAbsFormsHolder2();
    Site.scrollToModuleDiv(a);
    Site.triggerGobalEvent("showFindModuleDiv", b);
    Fai.top._moduleMoved++;
    Site.styleChanged();
    a.trigger("Fai_onModuleLayoutChange");
    Site.logDog(100045, 18)
};
Site.absMiddleModule = function(c) {
    var a = Fai.top.$("#" + c);
    var b = c.replace("module", "");
    Site.replaceDocumentwrite(a);
    a.appendTo(Fai.top.$("#absForms"));
    Site.placeAbsModule(a);
    Site.scrollToModuleDiv(a);
    Site.triggerGobalEvent("showFindModuleDiv", b);
    Fai.top._moduleMoved++;
    Site.styleChanged();
    a.trigger("Fai_onModuleLayoutChange");
    Site.logDog(100045, 17)
};
Site.getAbsZIndexStatus = function(d) {
    var b = Fai.top.$("#" + d);
    var c = b.parent().attr("id");
    var a = b.attr("_side");
    if (a == 2) {
        return - 1
    }
    if (c == "absForms" || c == "absBottomForms" || c == "absTopForms") {
        return 1
    }
    if (c == "floatLeftTopForms" || c == "floatRightTopForms" || c == "floatLeftBottomForms" || c == "floatRightBottomForms") {
        return 1
    }
    return - 1
};
Site.getAbsStatus = function(d) {
    var c = Fai.top.$("#" + d).attr("_side");
    if (parseInt(c) == 1) {
        return - 1
    }
    var b = $("#" + d);
    var a = b.parent();
    if (Fai.top.$("#" + d).css("position") == "absolute" && a.hasClass("absForms")) {
        return 0
    }
    return 1
};
Site.getAbsStatus2 = function(e) {
    var b = Site.getAbsStatus(e);
    var d = parseInt($("#" + e).attr("_intab"));
    var a = parseInt($("#" + e).attr("_inmulmcol"));
    var c = parseInt($("#" + e).attr("_infullmeasure"));
    if (d > 0 || a > 0 || c > 0) {
        return - 1
    } else {
        if (b == -1) {
            return 1
        }
        if (b == 0) {
            b = -1
        }
    }
    return b
};
Site.getAbsTopStatus = function(c) {
    var a = Fai.top.$("#" + c);
    var b = a.parent().attr("id");
    if (b == "absForms" || b == "absBottomForms") {
        return 1
    }
    return - 1
};
Site.getAbsMiddleStatus = function(c) {
    var a = Fai.top.$("#" + c);
    var b = a.parent().attr("id");
    if (b == "absBottomForms") {
        return 1
    }
    return - 1
};
Site.getAbsBottomStatus = function(c) {
    var a = Fai.top.$("#" + c);
    var b = a.parent().attr("id");
    if (b == "absForms" || b == "absTopForms") {
        return 1
    }
    return - 1
};
Site.getLockStatus = function(c) {
    var a = Fai.top.$("#" + c).attr("_side");
    if (parseInt(a) == 1) {
        return - 1
    }
    var b = Fai.top.$("#" + c).parent().attr("id");
    if (b == "floatLeftTopForms" || b == "floatRightTopForms" || b == "floatLeftBottomForms" || b == "floatRightBottomForms") {
        return 0
    }
    return 1
};
Site.reSetOutSideMargin = function(e) {
    var b = Fai.top.$("#" + e),
    c = parseInt(e.replace("module", "")),
    a = Site.getModuleAttrPattern(c),
    d = Site.getModuleAttrPattern(c).outside;
    if (d.y == 1) {
        d.y = 0;
        Site.removeModuleStyleCssList(c, [{
            cls: "",
            key: "padding"
        },
        {
            cls: "",
            key: "margin-right"
        },
        {
            cls: "",
            key: "margin-left"
        },
        {
            cls: "",
            key: "margin-top"
        },
        {
            cls: "",
            key: "margin-bottom"
        }])
    }
};
Site.getLockStatus2 = function(e) {
    var b = Site.getLockStatus(e);
    var d = parseInt($("#" + e).attr("_intab"));
    var a = parseInt($("#" + e).attr("_inmulmcol"));
    var c = parseInt($("#" + e).attr("_infullmeasure"));
    if (d > 0 || a > 0 || c > 0) {
        return - 1
    } else {
        if (b == -1) {
            return 1
        }
        if (b == 0) {
            b = -1
        }
    }
    return b
};
Site.lock = function(e) {
    if (Fai.top.$("#" + e).hasClass("formStyle80")) {
        return
    }
    var a = $("#" + e);
    var d = a.parent().attr("id");
    if (d == "floatLeftTopForms" || d == "floatRightTopForms" || d == "floatLeftBottomForms" || d == "floatRightBottomForms") {
        var b = a.offset().top;
        var c = a.offset().left;
        Site.replaceDocumentwrite(a);
        a.appendTo(Fai.top.$("#absForms"));
        a.offset({
            top: b,
            left: c
        });
        Site.placeAbsModule(a)
    } else {
        if (d != "absForms" && d != "absTopForms" && d != "absBottomForms") {
            Site.floatOut(e)
        }
        Site.placeFloatModule(a)
    }
    Fai.top._moduleMoved++;
    Site.styleChanged()
};
Site.dock2 = function(e, a) {
    if (Fai.top.$("#" + e).hasClass("formStyle80")) {
        return
    }
    var q = Site.getLockStatus(e);
    var m = Site.getAbsStatus(e);
    var o = Site.getSideStatus(e);
    var d = Site.getFlutterStatus2(e);
    var g = $("#" + e);
    var f = parseInt(e.replace("module", "")) || 0;
    var l = Site.getAppendLayoutForms(true);
    if (q == 0 && d != 0) {
        if (Site.checkNormalModuleCanAppendLayoutForms(l)) {
            Site.unFloatOut2(e)
        } else {
            Fai.ing("当前页面没有可以停靠的区域，请选择你要停靠的区域。", true);
            Site.styleSetting("open", "webTemplateTab");
            Site.pageLayoutTabClick();
            return
        }
    } else {
        if (o == 0) {
            if (Site.checkNormalModuleCanAppendLayoutForms(l)) {
                Site.unSideModule2(e);
                Site.unFloatOut2(e)
            } else {
                Fai.ing("当前页面没有可以停靠的区域，请选择你要停靠的区域。", true);
                Site.styleSetting("open", "webTemplateTab");
                Site.pageLayoutTabClick();
                return
            }
        } else {
            if (d == 0) {
                if (Site.checkNormalModuleCanAppendLayoutForms(l)) {
                    Site.unFlutter(g);
                    Site.unFloatOut2(e)
                } else {
                    Fai.ing("当前页面没有可以停靠的区域，请选择你要停靠的区域。", true);
                    Site.styleSetting("open", "webTemplateTab");
                    Site.pageLayoutTabClick();
                    return
                }
            } else {
                if (Fai.top.$("#" + Fai.top._floatOutPosition).css("display") != "none") {
                    l = Fai.top._floatOutPosition
                } else {
                    l = Site.getAppendLayoutForms(true)
                }
                var k;
                var p = false;
                if (l == "absForms" || l == "" || l == Site.getLayoutForms(24) || l == Site.getLayoutForms(25)) {
                    if (g.hasClass("formStyle80")) {
                        if (!Site.isLayoutHidden(24)) {
                            k = Fai.top.$("#" + Site.getLayoutForms(24));
                            p = true
                        } else {
                            if (!Site.isLayoutHidden(25)) {
                                k = Fai.top.$("#" + Site.getLayoutForms(25));
                                p = true
                            }
                        }
                    } else {
                        var h = Fai.top.$("#" + Site.getLayoutForms(24)).children(".formStyle80");
                        var i = Fai.top.$("#" + Site.getLayoutForms(25)).children(".formStyle80");
                        if (!Site.isLayoutHidden(24) && h.length > 0) {
                            var c = parseInt(h.eq(0).attr("id").replace("module", "")) || 0;
                            k = Fai.top.$("#fullmeasureContent" + c);
                            p = true;
                            Fai.top.Site.getModuleAttrData(c).changed = true
                        } else {
                            if (!Site.isLayoutHidden(25) && i.length > 0) {
                                var c = parseInt(i.eq(0).attr("id").replace("module", "")) || 0;
                                k = Fai.top.$("#fullmeasureContent" + c);
                                p = true;
                                Fai.top.Site.getModuleAttrData(c).changed = true
                            }
                        }
                    }
                    if (!p) {
                        Site.styleSetting("open", "webTemplateTab");
                        Site.pageLayoutTabClick();
                        Fai.top.$("#pageLayoutFrame").bind("load",
                        function() {
                            this.contentWindow.freeLayoutShow()
                        });
                        Fai.ing("当前页面没有可以停靠的区域，请选择你要停靠的区域。", true);
                        return
                    }
                }
                Site.disableEditLayer();
                g.removeAttr("style");
                Site.replaceDocumentwrite(g);
                if (!p) {
                    g.prependTo(Fai.top.$("#" + l))
                } else {
                    k.append(g)
                }
                Site.refreshAllAbsForms();
                $("#g_middleContent").css("height", "auto");
                g.draggable("destroy");
                Site.sortable();
                Site.moduleSizeChange(e);
                Site.getModuleAttrPattern(f).changed = true;
                Fai.top._moduleMoved++;
                Site.styleChanged();
                Site.enableEditLayer();
                g.trigger("Fai_onModuleLayoutChange")
            }
        }
    }
    Site.autoModuleHeight(f);
    Site.dockModuleAutoHeight(f);
    g.attr("_autoHeight", "1");
    if (g.hasClass("formStyle3") || g.hasClass("formStyle16")) {
        Site.restartMarquee(f, true)
    }
    if (a == "d") {
        Site.logDog(100045, 37)
    } else {
        Site.logDog(100045, 20)
    }
    Site.refreshForms();
    Site.dockModuleResize(g);
    Site.refreshModuleSizeHandle(g);
    var b = parseInt(g.attr("_infullmeasure")) || 0;
    if (b > 0) {
        Site.getModuleAttrData(b).changed = true
    }
    if (g.hasClass("formStyle1")) {
        var j = g.find("img.richModuleSlaveImg");
        Site.richModuleSlaveImgResize(j);
        Site.richModulePicEdit(j)
    }
    if (g.hasClass("formStyle81")) {
        var n = Site.getModuleAttr(f).data;
        Site.setFlBtnBoxPadding(e, n, true)
    }
    if (g.hasClass("formStyle83")) {
        Site.adjustPhotoCard(e.replace("module", ""));
        g.attr("_autoheight", 0)
    }
    Site.scrollToModuleDiv(g);
    Site.triggerGobalEvent("showFindModuleDiv", f);
    Site.setRefreshInfo("moduleSetting", true)
};
Site.checkNormalModuleCanAppendLayoutForms = function(c) {
    if (c == "" || c == Site.getLayoutForms(24) || c == Site.getLayoutForms(25)) {
        var b = Fai.top.$("#" + Site.getLayoutForms(24)).children(".formStyle80");
        var a = Fai.top.$("#" + Site.getLayoutForms(25)).children(".formStyle80");
        if (!Site.isLayoutHidden(24) && b.length > 0) {
            return true
        } else {
            if (!Site.isLayoutHidden(25) && a.length > 0) {
                return true
            } else {
                return false
            }
        }
    } else {
        if (Fai.top.$("#" + c).length > 0) {
            return true
        } else {
            return false
        }
    }
};
Site.floatOut2 = function(f, a) {
    if (Fai.top.$("#" + f).hasClass("formStyle80")) {
        return
    }
    Site.reSetOutSideMargin(f);
    var p = Site.getLockStatus(f);
    var o = Site.getSideStatus(f);
    var d = Site.getFlutterStatus2(f);
    if (p == 0 && d != 0) {
        Site.unLock2(f)
    } else {
        if (d == 0) {
            var i = $("#" + f);
            Site.unFlutter(i);
            Site.unLock2(f)
        } else {
            if (o == 0) {
                Site.unSideModule2(f);
                Site.unLock2(f)
            } else {
                var g = parseInt(f.replace("module", ""));
                if ($("#" + f).css("position") != "absolute") {
                    var i = $("#" + f);
                    Site.disableEditLayer();
                    var e = i.parent().attr("id");
                    if (e != "absForms" && e != "absTopForms" && e != "absBottomForms") {
                        Fai.top._floatOutPosition = e
                    }
                    var k = i.css("position");
                    i.css("width", i.width() + "px");
                    i.css("height", i.height() + "px");
                    if (k != "absolute") {
                        i.css("top", i.position().top + 10);
                        i.css("left", i.position().left + 10)
                    }
                    if (i.hasClass("formStyle81")) {
                        var h = i.find(".floatBtn");
                        i.css({
                            width: h.outerWidth() + "px",
                            height: h.outerHeight() + "px"
                        });
                        var n = Site.getModuleAttr(g).data;
                        Site.setFlBtnBoxPadding(f, n, false)
                    }
                    i.css("position", "absolute");
                    Site.replaceDocumentwrite(i);
                    i.appendTo(Fai.top.$("#absForms"));
                    var c = i.find(".formTab .form");
                    if (c.length > 0) {
                        c.each(function() {
                            $(this).css("position", "relative")
                        })
                    }
                    var m = i.find(".formInMulMCol");
                    if (m.length > 0) {
                        m.each(function() {
                            $(this).css("position", "relative")
                        })
                    }
                    var b = parseInt(i.attr("_infullmeasure")) || 0;
                    if (b > 0) {
                        if (i.hasClass("formStyle29") || i.hasClass("formStyle35")) {
                            Site.getModuleAttrData(g).changed = true
                        }
                        Site.getModuleAttrData(b).changed = true;
                        i.attr("_infullmeasure", 0)
                    }
                    Site.placeAbsModule(i);
                    Site.floatModuleDraggable(i);
                    Site.refreshAllAbsForms();
                    if (i.attr("_autoheight") > 0) {
                        i.css("height", "auto")
                    }
                    Site.getModuleAttrPattern(g).changed = true;
                    Fai.top._moduleMoved++;
                    Site.styleChanged();
                    Site.enableEditLayer();
                    i.trigger("Fai_onModuleLayoutChange")
                }
            }
        }
    }
    if (a == "f") {
        Site.logDog(100045, 36)
    } else {
        Site.logDog(100045, 21)
    }
    Site.refreshForms();
    var j = Fai.top.$("#" + f);
    Site.floatModuleDraggable(j);
    if (j.hasClass("formStyle1")) {
        var l = j.find("img.richModuleSlaveImg");
        Site.richModuleSlaveImgResize(l);
        Site.richModulePicEdit(l)
    }
    Site.scrollToModuleDiv(j);
    Site.triggerGobalEvent("showFindModuleDiv", f.replace("module", ""));
    Site.setRefreshInfo("moduleSetting", true)
};
Site.unFloatOut2 = function(b) {
    var a = Fai.top.$("#" + b);
    if (a.css("position") == "absolute") {
        Site.dock(b)
    }
    a.trigger("Fai_onModuleLayoutChange")
};
Site.lock2 = function(a) {
    if (Fai.top.$("#" + a).hasClass("formStyle80")) {
        return
    }
    Site.reSetOutSideMargin(a);
    var i = Site.getSideStatus(a);
    if (i == 0) {
        Site.unSideModule2(a)
    } else {
        var c = $("#" + a);
        var e = c.parent().attr("id");
        if (e != "floatLeftTopForms" && e != "floatRightTopForms" && e != "floatLeftBottomForms" && e != "floatRightBottomForms") {
            if (e != "absForms" && e != "absTopForms" && e != "absBottomForms") {
                Site.floatOut(a)
            }
            Site.placeFloatModule(c);
            if (c.attr("_autoheight") > 0) {
                c.css("height", "auto")
            }
        }
        Fai.top._moduleMoved++;
        Site.styleChanged()
    }
    Site.refreshForms();
    $("#" + a).trigger("Fai_onModuleLayoutChange");
    var f = Fai.top.$("#" + a);
    if (f.hasClass("formStyle1")) {
        var g = f.find("img.richModuleSlaveImg");
        Site.richModuleSlaveImgResize(g);
        Site.richModulePicEdit(g)
    }
    if (f.hasClass("formStyle81")) {
        var b = a.replace("module", ""),
        d = f.find(".floatBtn"),
        h = Site.getModuleAttr(b).data;
        f.css({
            width: d.width() + "px"
        });
        Site.setFlBtnHasBannerModuleHeight(b);
        Site.setFlBtnBoxPadding(a, h, false)
    }
    Site.logDog(100045, 22);
    Site.setRefreshInfo("moduleSetting", true)
};
Site.unLock2 = function(e) {
    if (Fai.top.$("#" + e).hasClass("formStyle80")) {
        return
    }
    var a = $("#" + e);
    var d = a.parent().attr("id");
    if (d == "floatLeftTopForms" || d == "floatRightTopForms" || d == "floatLeftBottomForms" || d == "floatRightBottomForms") {
        var b = a.offset().top;
        var c = a.offset().left;
        Site.replaceDocumentwrite(a);
        a.appendTo(Fai.top.$("#absForms"));
        a.offset({
            top: b,
            left: c
        });
        Site.placeAbsModule(a)
    }
    Fai.top._moduleMoved++;
    Site.styleChanged();
    a.trigger("Fai_onModuleLayoutChange")
};
Site.sideModule2 = function(a) {
    if (Fai.top.$("#" + a).hasClass("formStyle80")) {
        return
    }
    Site.reSetOutSideMargin(a);
    var e = $("#" + a);
    var g = e.parent().attr("id");
    var c = e.attr("_side");
    var d = e.offset().top;
    var i = Fai.top.Fai.getBrowserWidth();
    var f = e.outerWidth();
    if (c != 1) {
        e.attr("_side", 1);
        if (g == "floatLeftTopForms" || g == "floatRightTopForms" || g == "floatLeftBottomForms" || g == "floatRightBottomForms") {} else {
            if (g != "absForms" && g != "absTopForms" && g != "absBottomForms") {
                Site.floatOut(a)
            }
            Site.placeFloatModule(e)
        }
        Site.reSetSidePosition(e)
    }
    Site.clearModuleOutSide(a);
    if (e.attr("_autoheight") == 1) {
        e.css({
            height: "auto"
        })
    }
    Site.refreshForms();
    var b = parseInt(a.replace("module", ""));
    Site.getModuleAttrPattern(b).changed = true;
    Fai.top._moduleMoved++;
    Site.styleChanged();
    e.trigger("Fai_onModuleLayoutChange");
    if (e.hasClass("formStyle1")) {
        var h = e.find("img.richModuleSlaveImg");
        Site.richModuleSlaveImgResize(h);
        Site.richModulePicEdit(h)
    }
    if (e.hasClass("formStyle81")) {
        e.css("width", e.find(".floatBtn").outerWidth() + "px")
    }
    Site.logDog(100045, 23);
    Site.setRefreshInfo("moduleSetting", true)
};
Site.unSideModule2 = function(b) {
    var e = $("#" + b);
    var g = e.parent().attr("id");
    var c = e.attr("_side");
    var d = e.offset().top;
    var i = Fai.top.Fai.getBrowserWidth();
    var f = e.outerWidth();
    if (c == 1) {
        var h = 0;
        if (g == "floatLeftTopForms" || g == "floatLeftBottomForms") {
            h = 1
        } else {
            if (g == "floatRightTopForms" || g == "floatRightBottomForms") {
                h = 0
            }
        }
        e.attr("_side", 0);
        if (h == 0) {
            e.offset({
                top: d,
                left: i - f
            })
        } else {
            e.offset({
                top: d,
                left: 0
            })
        }
        Site.placeFloatModule(e);
        Fai.top.$("#" + b + "SideBtn").remove()
    }
    var a = parseInt(b.replace("module", ""));
    Site.getModuleAttrPattern(a).changed = true;
    Fai.top._moduleMoved++;
    Site.styleChanged();
    e.trigger("Fai_onModuleLayoutChange")
};
Site.saveStyle = function(V, Q) {
    if (Fai.top._changeStyleNum == 0) {
        return
    }
    Fai.top._changeStyleNum = 0;
    Fai.ing("正在保存……", false);
    $("#saveButton").attr("disabled", true).addClass("buttonDisabled");
    var aj = "set";
    var p = new Array();
    p.push("cmd=" + aj);
    p.push("&_di=100005");
    p.push("&colId=" + Fai.top._colId);
    p.push("&extId=" + Fai.top._extId);
    if (Fai.top._templateChanged > 0) {
        p.push("&templateFrame=" + Fai.top._templateFrame + "&templateLayout=" + Fai.top._templateLayout)
    }
    if (Fai.top._moduleMoved > 0) {
        var T = new Array();
        var v = Fai.top.$("#topForms .form");
        var u = new Array();
        $.each(v,
        function(al, an) {
            var am = Site.getModuleAttrInColStg($(this));
            if (am != null && jQuery.inArray(am.id, T) == -1 && !Site.isCartModule($(this))) {
                T.push(am.id);
                u.push(am)
            }
        });
        var N = Fai.encodeUrl($.toJSON(u));
        var af = Fai.top.$("#leftForms .form");
        var ag = new Array();
        $.each(af,
        function(al, an) {
            var am = Site.getModuleAttrInColStg($(this));
            if (am != null && jQuery.inArray(am.id, T) == -1 && !Site.isCartModule($(this))) {
                T.push(am.id);
                ag.push(am)
            }
        });
        var H = Fai.encodeUrl($.toJSON(ag));
        var L = Fai.top.$("#centerTopForms .form");
        var b = new Array();
        $.each(L,
        function(al, an) {
            var am = Site.getModuleAttrInColStg($(this));
            if (am != null && jQuery.inArray(am.id, T) == -1 && !Site.isCartModule($(this))) {
                T.push(am.id);
                b.push(am)
            }
        });
        var K = Fai.encodeUrl($.toJSON(b));
        var k = Fai.top.$("#middleLeftForms .form");
        var ae = new Array();
        $.each(k,
        function(al, an) {
            var am = Site.getModuleAttrInColStg($(this));
            if (am != null && jQuery.inArray(am.id, T) == -1 && !Site.isCartModule($(this))) {
                T.push(am.id);
                ae.push(am)
            }
        });
        var C = Fai.encodeUrl($.toJSON(ae));
        var q = Fai.top.$("#middleRightForms .form");
        var l = new Array();
        $.each(q,
        function(al, an) {
            var am = Site.getModuleAttrInColStg($(this));
            if (am != null && jQuery.inArray(am.id, T) == -1 && !Site.isCartModule($(this))) {
                T.push(am.id);
                l.push(am)
            }
        });
        var W = Fai.encodeUrl($.toJSON(l));
        var S = Fai.top.$("#centerBottomForms .form");
        var Z = new Array();
        $.each(S,
        function(al, an) {
            var am = Site.getModuleAttrInColStg($(this));
            if (am != null && jQuery.inArray(am.id, T) == -1 && !Site.isCartModule($(this))) {
                T.push(am.id);
                Z.push(am)
            }
        });
        var I = Fai.encodeUrl($.toJSON(Z));
        var w = Fai.top.$("#rightForms .form");
        var y = new Array();
        $.each(w,
        function(al, an) {
            var am = Site.getModuleAttrInColStg($(this));
            if (am != null && jQuery.inArray(am.id, T) == -1 && !Site.isCartModule($(this))) {
                T.push(am.id);
                y.push(am)
            }
        });
        var f = Fai.encodeUrl($.toJSON(y));
        var X = Fai.top.$("#bottomForms .form");
        var aa = new Array();
        $.each(X,
        function(al, an) {
            var am = Site.getModuleAttrInColStg($(this));
            if (am != null && jQuery.inArray(am.id, T) == -1 && !Site.isCartModule($(this))) {
                T.push(am.id);
                aa.push(am)
            }
        });
        var A = Fai.encodeUrl($.toJSON(aa));
        var R = Fai.top.$("#floatLeftTopForms .form");
        var D = new Array();
        $.each(R,
        function(al, an) {
            var am = Site.getModuleAttrInColStg($(this));
            if (am != null && jQuery.inArray(am.id, T) == -1) {
                T.push(am.id);
                D.push(am)
            }
        });
        var ai = Fai.encodeUrl($.toJSON(D));
        var ad = Fai.top.$("#floatLeftBottomForms .form");
        var ab = new Array();
        $.each(ad,
        function(al, an) {
            var am = Site.getModuleAttrInColStg($(this));
            if (am != null && jQuery.inArray(am.id, T) == -1) {
                T.push(am.id);
                ab.push(am)
            }
        });
        var c = Fai.encodeUrl($.toJSON(ab));
        var m = Fai.top.$("#floatRightTopForms .form");
        var g = new Array();
        $.each(m,
        function(al, an) {
            var am = Site.getModuleAttrInColStg($(this));
            if (am != null && jQuery.inArray(am.id, T) == -1) {
                T.push(am.id);
                g.push(am)
            }
        });
        var J = Fai.encodeUrl($.toJSON(g));
        var B = Fai.top.$("#floatRightBottomForms .form");
        var x = new Array();
        $.each(B,
        function(al, an) {
            var am = Site.getModuleAttrInColStg($(this));
            if (am != null && jQuery.inArray(am.id, T) == -1) {
                T.push(am.id);
                x.push(am)
            }
        });
        var a = Fai.encodeUrl($.toJSON(x));
        var s = Fai.top.$("#absForms .form");
        var P = new Array();
        $.each(s,
        function(al, an) {
            var am = Site.getModuleAttrInColStg($(this));
            if (am != null && jQuery.inArray(am.id, T) == -1) {
                T.push(am.id);
                P.push(am)
            }
        });
        var O = Fai.encodeUrl($.toJSON(P));
        var ak = Fai.top.$("#absTopForms .form");
        var e = new Array();
        $.each(ak,
        function(al, an) {
            var am = Site.getModuleAttrInColStg($(this));
            if (am != null && jQuery.inArray(am.id, T) == -1) {
                T.push(am.id);
                e.push(am)
            }
        });
        var ac = Fai.encodeUrl($.toJSON(e));
        var d = Fai.top.$("#absBottomForms .form");
        var j = new Array();
        $.each(d,
        function(al, an) {
            var am = Site.getModuleAttrInColStg($(this));
            if (am != null && jQuery.inArray(am.id, T) == -1) {
                T.push(am.id);
                j.push(am)
            }
        });
        var Y = Fai.encodeUrl($.toJSON(j));
        var G = Fai.top.$("#fullmeasureTopForms .form");
        var F = new Array();
        $.each(G,
        function(al, an) {
            var am = Site.getModuleAttrInColStg($(this));
            if (am != null && jQuery.inArray(am.id, T) == -1 && !Site.isCartModule($(this))) {
                T.push(am.id);
                F.push(am)
            }
        });
        var r = Fai.encodeUrl($.toJSON(F));
        var E = Fai.top.$("#fullmeasureBottomForms .form");
        var M = new Array();
        $.each(E,
        function(al, an) {
            var am = Site.getModuleAttrInColStg($(this));
            if (am != null && jQuery.inArray(am.id, T) == -1 && !Site.isCartModule($(this))) {
                T.push(am.id);
                M.push(am)
            }
        });
        var t = Fai.encodeUrl($.toJSON(M));
        var U = new Array();
        for (var ah = 0; ah < Fai.top._hiddenModuleList.length; ++ah) {
            var o = parseInt(Fai.top._hiddenModuleList[ah].id);
            if (jQuery.inArray(o, T) == -1) {
                T.push(o);
                U.push(Fai.top._hiddenModuleList[ah])
            }
        }
        var h = Fai.encodeUrl($.toJSON(U));
        var n = new Array();
        for (var ah = 0; ah < Fai.top._displayLayoutList.length; ++ah) {
            if (Fai.top._displayLayoutList[ah] > 0) {
                n.push(Fai.top._displayLayoutList[ah])
            }
        }
        if (n.length == 0) {
            n.push( - 1)
        }
        n = Fai.encodeUrl($.toJSON(n));
        p.push("&moduleTop=" + N);
        p.push("&moduleBottom=" + A);
        p.push("&moduleLeft=" + H);
        p.push("&moduleCenterTop=" + K);
        p.push("&moduleRight=" + f);
        p.push("&moduleMiddleLeft=" + C);
        p.push("&moduleMiddleRight=" + W);
        p.push("&moduleCenterBottom=" + I);
        p.push("&moduleFloatLeftTop=" + ai);
        p.push("&moduleFloatLeftBottom=" + c);
        p.push("&moduleFloatRightTop=" + J);
        p.push("&moduleFloatRightBottom=" + a);
        p.push("&moduleAbs=" + O);
        p.push("&moduleAbsTop=" + ac);
        p.push("&moduleAbsBottom=" + Y);
        p.push("&moduleFullmeasureTop=" + r);
        p.push("&moduleFullmeasureBottom=" + t);
        p.push("&moduleHidden=" + h);
        p.push("&newModuleIdList=" + $.toJSON(Fai.top._newModuleIdList))
    }
    if (typeof Fai.top.moduleAttr != "undefined") {
        var z = [];
        $.each(Fai.top.moduleAttr,
        function(am, al) {
            var ao = parseInt(am.replace("module", ""));
            if (ao <= 0) {
                return true
            }
            if (Fai.top.$("#module" + ao).length == 0) {
                return true
            }
            var ap = {};
            var an = false;
            var i = Site.getModuleAttr(ao);
            if (i.data.changed) {
                ap = Site.getModuleAttrDataStg(ao);
                an = true
            }
            if (i.pattern.changed) {
                ap.pattern = $.toJSON(Site.getModuleAttrPatternStg(ao));
                an = true
            }
            if (an) {
                ap.id = ao;
                z.push(ap)
            }
        });
        if (z.length > 0) {
            p.push("&moduleList=");
            p.push(Fai.encodeUrl($.toJSON(z)))
        }
    }
    if (Fai.top._layoutChanged > 0) {
        var n = new Array();
        for (var ah = 0; ah < Fai.top._displayLayoutList.length; ++ah) {
            if (Fai.top._displayLayoutList[ah] > 0) {
                n.push(Fai.top._displayLayoutList[ah])
            }
        }
        if (n.length == 0) {
            n.push( - 1)
        }
        n = Fai.encodeUrl($.toJSON(n));
        p.push("&displayLayout=" + n)
    }
    if (Fai.top._titleChanged > 0) {
        p.push("&titleFixTop=" + Fai.top._titlePositionFixTop);
        p.push("&title=" + Fai.encodeUrl($.toJSON(Fai.top._titleData)))
    }
    p.push("&_colOtherStyle=" + Fai.encodeUrl($.toJSON(Fai.top._colOtherStyleData)));
    p.push("&_templateOtherStyle=" + Fai.encodeUrl($.toJSON(Fai.top._templateOtherStyleData)));
    if (Fai.top._localeChanged > 0) {
        p.push("&locale=" + Fai.encodeUrl($.toJSON(Fai.top._localeData)))
    }
    if (Fai.top._bannerChanged > 0) {
        p.push("&pageBanner=" + !Fai.top._useTemplateBanner);
        p.push("&banner=" + Fai.encodeUrl($.toJSON(Fai.top._pageBannerData)));
        p.push("&templateBannerData=" + Fai.encodeUrl($.toJSON(Fai.top._templateBannerData)))
    }
    if (Fai.top._logoChanged > 0) {
        p.push("&logoFixTop=" + Fai.top._logoPositionFixTop);
        p.push("&logo=" + Fai.encodeUrl($.toJSON(Fai.top._logoData)))
    }
    if (Fai.top._bgImgChanged > 0) {
        p.push("&background=" + Fai.encodeUrl($.toJSON(Fai.top._backgroundData)));
        p.push("&templateBackground=" + Fai.encodeUrl($.toJSON(Fai.top._templateBackgroundData)));
        p.push("&customBackground=" + Fai.encodeUrl($.toJSON(Fai.top._customBackgroundData)))
    }
    if (Fai.top._imgPageChanged > 0) {
        p.push("&schemeFlag8=" + Fai.top._imgPageOpen);
        p.push("&imgPage=" + Fai.encodeUrl($.toJSON(Fai.top._imgPage)))
    }
    if (Fai.top._browserTitleChanged > 0) {
        p.push("&pageBrowserTitle=" + !Fai.top._useTemplateBrowserTitle);
        p.push("&browserTitle=" + Fai.encodeUrl(Fai.top._pageBrowserTitleData));
        p.push("&templateBrowserTitle=" + Fai.encodeUrl(Fai.top._templateBrowserTitleData))
    }
    if (Fai.top._searchKeywordChanged > 0) {
        p.push("&pageSearchKeyword=" + !Fai.top._useTemplateSearchKeyword);
        p.push("&searchKeyword=" + Fai.encodeUrl(Fai.top._pageSearchKeywordData));
        p.push("&templateSearchKeyword=" + Fai.encodeUrl(Fai.top._templateSearchKeywordData))
    }
    if (Fai.top._searchDescChanged > 0) {
        p.push("&pageSearchDesc=" + !Fai.top._useTemplateSearchDesc);
        p.push("&searchDesc=" + Fai.encodeUrl(Fai.top._pageSearchDescData));
        p.push("&templateSearchDesc=" + Fai.encodeUrl(Fai.top._templateSearchDescData))
    }
    if (Fai.top._bgMusicChanged > 0) {
        p.push("&schemeFlag2=" + Fai.top._bgMusicOpen);
        p.push("&bgMusic=" + Fai.encodeUrl($.toJSON(Fai.top._bgMusic)))
    }
    if (Fai.top._navStyleChanged > 0) {
        p.push("&navFixTop=" + Fai.top._navPositionFixTop);
        p.push("&schemeFlag16=" + Fai.top._navItemOnCkOpen);
        p.push("&navHightChange=" + Fai.top._navHeightChange);
        p.push("&navStyle=" + Fai.encodeUrl($.toJSON(Fai.top._navStyleData)));
        p.push("&navHidden=" + Fai.top._navHidden)
    }
    if (Fai.top._headerTopStyleChanged > 0) {
        p.push("&headerTopStyle=" + Fai.encodeUrl($.toJSON(Fai.top._headerTopStyle)));
        p.push("&customHeaderTopStyle=" + Fai.encodeUrl($.toJSON(Fai.top._customHeaderTopStyle)))
    }
    if (Fai.top._footerStyleChanged > 0) {
        p.push("&footerStyle=" + Fai.encodeUrl($.toJSON(Fai.top._footerStyleData)));
        p.push("&customFooterStyle=" + Fai.encodeUrl($.toJSON(Fai.top._customFooterStyleData)))
    }
    if (Fai.top._delModuleIdList.length > 0) {
        p.push("&delModuleIdList=" + Fai.encodeUrl($.toJSON(Fai.top._delModuleIdList)))
    }
    if (typeof Fai.top._advanceSettingData != "undefined") {
        p.push("&advanceSettingData=" + Fai.encodeUrl($.toJSON(Fai.top._advanceSettingData)));
        if ($.toJSON(Fai.top._advanceSettingData) != "{}") {
            Site.setRefreshInfo("siteSetting", true)
        }
    }
    if (typeof Fai.top._businessSettingData != "undefined") {
        p.push("&businessSettingData=" + Fai.encodeUrl($.toJSON(Fai.top._businessSettingData)));
        if ($.toJSON(Fai.top._businessSettingData) != "{}") {
            Site.setRefreshInfo("siteSetting", true)
        }
    }
    if (typeof Fai.top._baiduBaseSetting != "undefined") {
        p.push("&baiduBaseSetting=" + Fai.encodeUrl($.toJSON(Fai.top._baiduBaseSetting)));
        if ($.toJSON(Fai.top._baiduBaseSetting) != "{}") {
            Site.setRefreshInfo("siteBaidu", true)
        }
    }
    if (typeof Fai.top._useTemplateBackground != "undefined") {
        p.push("&useTemplateBackground=" + Fai.top._useTemplateBackground)
    }
    if (_memberTopBarChanged > 0) {
        p.push("&memberTopBar=" + Fai.top._memberTopBar);
        p.push("&memberTopBar_myProfile=" + Fai.top._memberTopBar_myProfile);
        p.push("&memberTopBar_myOrder=" + Fai.top._memberTopBar_myOrder);
        p.push("&memberTopBar_addBookMark=" + Fai.top._memberTopBar_addBookMark);
        p.push("&memberTopBar_mobiWeb=" + Fai.top._memberTopBar_mobiWeb);
        p.push("&memberTopBar_mallCart=" + Fai.top._memberTopBar_mallCart)
    }
    if (typeof Fai.top._pdIndependence != "undefined") {
        p.push("&pdIndependence=" + Fai.top._pdIndependence)
    }
    if (typeof Fai.top._ndIndependence != "undefined") {
        p.push("&ndIndependence=" + Fai.top._ndIndependence)
    }
    if (typeof Fai.top._prIndependence != "undefined") {
        p.push("&prIndependence=" + Fai.top._prIndependence)
    }
    if (typeof Fai.top._nrIndependence != "undefined") {
        p.push("&nrIndependence=" + Fai.top._nrIndependence)
    }
    if (Fai.top._footerItemImgList && Fai.top._footerItemImgList.length > 0) {
        p.push("&_footerItemImgList=" + $.toJSON(Fai.top._footerItemImgList))
    }
	console.info(p.join(""));
    $.ajax({
        type: "post",
        url: Site.genAjaxUrl("site_h.jsp"),
        data: p.join(""),
        error: function() {
            $("#saveButton").removeAttr("disabled").removeClass("buttonDisabled");
            Fai.ing("系统繁忙，请稍候重试", false);
            Fai.top._changeStyleNum++
        },
        success: function(i) {
            $("#saveButton").removeAttr("disabled").removeClass("buttonDisabled");
            var al = Fai.successHandle(i, "保存成功", "", "", 3, 1);
            if (al) {
                if (typeof V === "object") {
                    Site.closeStyleDesign();
                    if (typeof V.fun === "function") {
                        setTimeout(function() {
                            V.fun.apply(window, V.args)
                        },
                        10)
                    }
                } else {
                    Site.isRefresh(Q)
                }
            } else {
                Fai.top._changeStyleNum++
            }
        }
    })
};
Site.styleSetting = function(b, a, d, e, f) {
    Site.removeAllEditLayer();
    if (b == "open") {
        if (Fai.top.$("#styleDesign").css("display") == "none") {
            Fai.top.$("#styleDesign").css("display", "block");
            Site.showTopBar();
            Site.styleDefaultClick()
        }
        if (!Fai.top._oem && Fai.top._cloneAid != 0 && a == "webTemplateTab") {
            if (Site.getWebTemplateSetting()) {
                if (Fai.top.$("#webBannerTab").parent().is(":visible")) {
                    a = "webBannerTab"
                } else {
                    if (Fai.top.$("#pageLayoutTab").parent().is(":visible")) {
                        a = "pageLayoutTab"
                    }
                }
            }
        }
        Site.refreshWebTemplateTabStyle();
        if (a == "webTemplateTab") {
            Site.webTemplateTabClick2(e);
            if (Fai.top._signupDays < 1 && $.cookie("usedRapidSiteNum") != null) {
                var c = parseInt($.cookie("usedRapidSiteNum"));
                $.cookie("usedRapidSiteNum", c + 1, {
                    expires: 7
                })
            }
        } else {
            if (a == "webBannerTab") {
                if (Fai.top.$("#webBannerTab").is(":visible")) {
                    Site.webBannerTabClick(e)
                }
            } else {
                if (a == "webSettingTab") {
                    Site.webSettingTabClick(e)
                } else {
                    if (a == "pageLayoutTab") {
                        Site.pageLayoutTabClick(e, f)
                    }
                }
            }
        }
        Site.resetGmainPos()
    } else {
        if (b == "refresh") {
            if (Fai.top.$("#styleDesign").css("display") == "none") {
                Fai.top.$("#styleDesign").css("display", "block");
                Site.showTopBar();
                Site.styleDefaultClick()
            }
            if (a == "webTemplateTab") {
                Site.refreshStyleTemplatePanel(d)
            } else {
                if (a == "webSettingTab") {
                    Site.refreshStyleWebPanel(d)
                } else {
                    if (a == "webBannerTab") {
                        Site.refreshStyleBannerPanel(d)
                    } else {
                        if (a == "pageSettingTab") {
                            Site.refreshStylePagePanel(d)
                        } else {
                            if (a == "pageLayoutTab") {
                                Site.refreshStyleLayoutPanel(d)
                            }
                        }
                    }
                }
            }
            Site.resetGmainPos()
        } else {
            if (b == "close") {
                Fai.top.Fai.closeTip("#webBannerTab");
                Fai.top.$("#helpScrollbar").marquee("resume");
                if (_changeStyleNum == 0) {
                    Fai.top.$("#styleDesign").css("display", "none");
                    Site.showTopBar()
                } else {
                    Fai.top.location.reload()
                }
                Site.functionInterface({
                    name: "refreshFaiFloatPanelIconStyle"
                })
            }
        }
    }
    Site.refreshNavFixtop()
};
Site.styleChanged = function() {
    Fai.top._changeStyleNum++;
    Site.styleSetting("open");
    Fai.top.$("#saveButton").removeAttr("disabled").removeClass("buttonDisabled")
};
Site.isRefresh = function(g) {
    var c = Fai.top._refreshInfoList.siteTemp;
    var b = Fai.top._refreshInfoList.siteBanner;
    var d = Fai.top._refreshInfoList.siteLayout;
    var l = Fai.top._refreshInfoList.siteSetting;
    var f = Fai.top._refreshInfoList.siteBaidu;
    var i = Fai.top._refreshInfoList.siteStyleSetting;
    var e = Fai.top._refreshInfoList.moduleDrag;
    var h = Fai.top._refreshInfoList.moduleStyle;
    var k = Fai.top._refreshInfoList.moduleSetting;
    var j = Fai.top._refreshInfoList.moduleEdit;
    var a = Fai.top._refreshInfoList.oemChangeTemplate;
    if (g) {
        Site.resetPageToken()
    } else {
        if (a || l || f || i || e || j || h || k) {
            Fai.top.location.reload()
        } else {
            if (c || b || d) {
                Site.resetPageToken()
            } else {
                Fai.top.location.reload()
            }
        }
    }
};
Site.setRefreshInfo = function(a, b) {
    if (!Fai.top._refreshInfoList[a]) {
        Fai.top._refreshInfoList[a] = b
    }
};
Site.resetPageToken = function() {
    if (Fai.top._bannerChanged > 0) {
        Fai.top._bannerChanged = 0
    }
    if (Fai.top._layoutChanged > 0) {
        Fai.top._layoutChanged = 0
    }
    if (Fai.top._templateChanged > 0) {
        Fai.top._templateChanged = 0
    }
    if (Fai.top._titleChanged > 0) {
        Fai.top._titleChanged = 0
    }
    if (Fai.top._localeChanged > 0) {
        Fai.top._localeChanged = 0
    }
    if (Fai.top._logoChanged > 0) {
        Fai.top._logoChanged = 0
    }
    if (Fai.top._bgImgChanged > 0) {
        Fai.top._bgImgChanged = 0
    }
    if (Fai.top._navStyleChanged > 0) {
        Fai.top._navStyleChanged = 0
    }
    if (Fai.top._headerTopStyleChanged > 0) {
        Fai.top._headerTopStyleChanged = 0
    }
    if (Fai.top._footerStyleChanged > 0) {
        Fai.top._footerStyleChanged = 0
    }
    if (Fai.top._changeStyleNum > 0) {
        Fai.top._changeStyleNum = 0
    }
    $("#saveButton").attr("disabled", true).addClass("buttonDisabled");
    Fai.top._refreshInfoList = {}
};
Site.isCartModule = function(a) {
    return a.hasClass("formStyle82") || false
};
Site.toggleSetWebTemplateTab = function() {
    var a = Fai.top.localStorage,
    c = Fai.top.$("#styleDesignBtnContainer"),
    b = c.find(".tabsMenu:visible").length;
    if (!a) {
        return
    }
    if (Site.getWebTemplateSetting()) {
        a.removeItem("hideWebTemplateSetting")
    } else {
        a.setItem("hideWebTemplateSetting", 1)
    }
    Site.refreshWebTemplateTabStyle()
};
Site.refreshWebTemplateTabStyle = function() {
    var e = Fai.top.$("#styleDesignBtnContainer"),
    c = Fai.top.$("#tabs"),
    b = c.find(".tabsMenu:visible").length,
    d = Fai.top.$("#webTemplateTab").parent(),
    a = true;
    if (Site.getWebTemplateSetting()) {
        a = false
    }
    if (a) {
        if (!d.is(":visible")) {
            b += 1;
            d.show();
            if (c.children().index(d) == 1) {
                e.before(d)
            }
        }
        e.find(".J_webTemplateTabSwitch").addClass("fk-webTemplateTabSwitch-on").removeClass("fk-webTemplateTabSwitch-off")
    } else {
        if (d.is(":visible")) {
            b -= 1;
            d.hide()
        }
        e.find(".J_webTemplateTabSwitch").addClass("fk-webTemplateTabSwitch-off").removeClass("fk-webTemplateTabSwitch-on")
    }
    e.removeAttr("class").addClass("styleDesignBtnContainer-" + b)
};
Site.getWebTemplateSetting = function() {
    var a = Fai.top.localStorage;
    return a && !!a.getItem("hideWebTemplateSetting")
};
Site.setWebTemplateSettingTabFlag = function() {
    var a = Fai.top.localStorage;
    a && a.setItem && a.setItem("hideWebTemplateSetting", 1)
};
Site.removeWebTemplateSettingTabFlag = function() {
    var a = Fai.top.localStorage;
    a && a.removeItem && a.removeItem("hideWebTemplateSetting")
};
Site.initModulePhotoListItemManage = function(b) {
    if (b == null || !b.moduleId) {
        return
    }
    if (b) {
        $("#module" + b.moduleId).data("photoOptions", b)
    }
    var a = ">." + b.photo;
    if (b.photo == "photoCard") {
        a = ".photoCard:has(.cardImgView)"
    }
    $("#" + b.photoParent).find(a).each(function() {
        var c = $(this).find("." + b.photoChild).eq(0);
        $(this).off("mouseover.modulePhotoList").off("mouseleave.modulePhotoList");
        $(this).on("mouseover.modulePhotoList",
        function() {
            var e = $(this).attr("photoId"),
            f = $(this).attr("photoName"),
            d = "manage/photoDetailEdit.jsp?id=" + b.groupId + "&phId=" + e;
            var g = [{
                operationText: "编辑图片",
                className: "edit",
                evalScript: "Site.popupWindow({title:'编辑图片', frameSrcUrl:'" + d + "', width:700, height:500, beforePopup:true });"
            },
            {
                operationText: "删除图片",
                className: "close",
                evalScript: "Site.deletePhotoDetail(" + e + ", " + b.groupId + ", '" + Fai.encodeHtmlJs(f) + "','" + Fai.encodeHtmlJs(b.groupName) + "');"
            }];
            if (b.photo === "photo-container" && $("#" + b.photoParent).is(":animated")) {} else {
                if (b.isOpenImgEff) {
                    var h = Site.addEditLayer(c, g, 5)
                } else {
                    var h = Site.addEditLayer(c, g, 106)
                }
            }
            if (b.photo === "photoMarqueeForm") {
                if (!h) {
                    return
                }
                h.mouseover(function() {
                    Fai.stopInterval("marquee" + b.moduleId)
                }).mouseout(function() {
                    Fai.startInterval("marquee" + b.moduleId)
                })
            }
        }).on("mouseleave.modulePhotoList",
        function() {
            if (b.isOpenImgEff) {
                Site.removeEditLayer(c, null, 5)
            } else {
                Site.removeEditLayer(c, null, 106)
            }
        })
    })
};
Site.initModulePhotoSmallPicItemManage = function(c, h) {
    var d = $("#" + c);
    var i = d.find("div.photoContainerLeft");
    var b = i.attr("phoid"),
    f = i.attr("photoname"),
    j = i.attr("groupname"),
    g = i.attr("groupid"),
    a = "manage/photoDetailEdit.jsp?id=" + g + "&phId=" + b;
    var e = [{
        operationText: "编辑图片",
        className: "edit",
        evalScript: "Site.popupWindow({title:'编辑图片', frameSrcUrl:'" + a + "', width:700, height:500 });"
    },
    {
        operationText: "删除图片",
        className: "close",
        evalScript: "Site.deletePhotoDetail(" + b + ", " + g + ", '" + Fai.encodeHtmlJs(f) + "','" + Fai.encodeHtmlJs(j) + "');"
    }];
    if (h) {
        Site.addEditLayer(i, e, 5)
    } else {
        Site.addEditLayer(i, e, 106)
    }
};
Site.deletePhotoDetail = function(a, d, b, f) {
    Site.removeAllEditLayer();
    if (a == "undefined") {
        return
    }
    if (Site.checkSaveBar()) {
        return
    }
    var e = new Array();
    var c = new Array();
    if (parseInt(a)) {
        c[c.length] = parseInt(a)
    }
    e.push("name=" + Fai.encodeUrl(f));
    if (c.length > 0) {
        e.push("&delList=" + Fai.encodeUrl($.toJSON(c)))
    }
    if (window.confirm("确定删除“" + b + "”?")) {
        Fai.ing("正在删除……", false);
        $.ajax({
            type: "post",
            url: "../static/web/ajax/photoGroup_h.jsp?cmd=set&id=" + d,
            data: e.join(""),
            error: function() {
                Fai.ing("服务繁忙，请稍后重试。", true)
            },
            success: function(g) {
                var h = $.parseJSON(g);
                Fai.successHandle(g, "删除成功", "", document.location.href, 0, 1)
            }
        })
    }
};
Site.changeRichPic = function(c) {
    var f = $(".formMiddleContent" + c);
    var h = f.find(".richModuleSlaveImgContainer");
    var d = h.find(".richModuleSlaveImg");
    var j = $(d).attr("imgurl") || "";
    var b = $(d).attr("imglinktype") || 0;
    var e = $(d).attr("alt") || "";
    var a = $(d).attr("imgcolid") || 0;
    var i = {
        title: "添加图片",
        maxSize: 5,
        type: ["jpg", "jpeg", "gif", "png"],
        from: "rich",
        entry: "rich"
    };
    Site.fileUpload2(false, i, g);
    function g(k) {
        if (k) {
            var q = $.parseJSON(k);
            var n = q.data[0].fileId;
            var m = q.data[0].fileWidth;
            var o = q.data[0].fileHeight;
            var l = "../static/web/ajax/module_h.jsp?cmd=setBack&id=" + c + "&colId=" + Fai.top._colId + "&extId=" + Fai.top._extId;
            var p = "";
            if (b == 2) {
                p = "{'i':'" + n + "','w':" + m + ",'h':" + o + ",'l':" + b + ",'d':'" + e + "','u':'" + j + "','c':" + a + "}"
            } else {
                p = "{'i':'" + n + "','w':" + m + ",'h':" + o + ",'l':" + b + ",'d':'" + e + "','c':" + a + "}"
            }
            $.ajax({
                type: "post",
                url: l,
                data: "prop1=" + Fai.encodeUrl(p),
                error: function() {
                    Fai.ing("服务繁忙，请稍后重试。", true)
                },
                success: function(s) {
                    var r = jQuery.parseJSON(s);
                    Site.refreshModule(r.id, r.div || "", "")
                }
            })
        }
    }
};
Site.changeNewsListPic = function(f, c, d) {
    var e = $(d);
    if (Fai.top._changeStyleNum > 0) {
        Site.popupStyleChangeBodyWindow("您的网站设计已经更改，是否立即保存？")
    } else {
        var a = {
            title: "添加图片",
            maxSize: c,
            type: ["jpg", "jpeg", "bmp", "png", "gif"],
            maxUploadList: 1,
            maxChoiceList: 1,
            crossiframe: "",
            from: "news",
            entry: "news"
        };
        Site.fileUpload2(false, a, b)
    }
    function b(h) {
        if (h) {
            var k = $.parseJSON(h),
            j = k.data,
            g = j[0].fileId,
            i = j[0].filePath;
            $.ajax({
                type: "post",
                url: "ajax/news_h.jsp?cmd=set&id=" + f,
                data: "pictureId=" + g,
                error: function() {
                    Fai.ing("服务繁忙，请稍后重试。", true)
                },
                success: function(l) {
                    Fai.successHandle(l, "", "系统错误", "", 0, 1);
                    Fai.top.$(".formStyle7").find(".newsList [newsid='" + f + "']").each(function() {
                        $(this).find("img").attr("src", i)
                    });
                    Fai.top.$(".formStyle47").find(".newsList [newsid='" + f + "']").each(function() {
                        $(this).find("img").attr("src", i)
                    });
                    Fai.top.$(".formStyle46").find(".newsDetail[newsid='" + f + "']").each(function() {
                        $(this).find(".newsDetailImg").attr("src", i)
                    })
                }
            })
        }
    }
};
Site.richModulePicEdit = function(a) {
    if (a.length <= 0) {
        return
    }
    $(".richEditPic").mouseleave(function() {
        $(this).hide();
        $(this).attr("_onMouseIn", 0);
        Site.triggerGobalEvent("moduleInnerEdit", true)
    });
    $(".richEditPic").mouseover(function() {
        $(this).show();
        $(this).attr("_onMouseIn", 1);
        Site.triggerGobalEvent("moduleInnerEdit", true)
    });
    $.each(a,
    function(b, c) {
        $(this).hover(function() {
            var h = $(this).parents("div.richModuleSlaveImgContainer");
            var d = h.find(".richModuleSlaveImg");
            var g = h.find(".richEditPic");
            var f = d.offset().left - h.offset().left;
            var e = d.offset().top - h.offset().top;
            g.css("top", e);
            g.css("left", f);
            g.show()
        },
        function() {
            var e = $(this).parents("div.richModuleSlaveImgContainer");
            var d = e.find(".richEditPic");
            if (d.attr("_onMouseIn") == 0) {
                d.hide()
            }
        })
    })
};
Site.richModuleSlaveImgResize = function(b) {
    if (b.length <= 0) {
        return
    }
    var a = 11;
    $.each(b,
    function(c, d) {
        $(d).resizable("destroy");
        $(d).resizable({
            handles: "n,e,s,w,ne,nw,sw,se",
            autoHide: true,
            maxWidth: $(this).parents("div.formMiddleContent").width(),
            minWidth: 16,
            minHeight: 16,
            aspectRatio: true,
            alsoResize: $(d),
            create: function(s, p) {
                var i = $(this).parents("div.formStyle1");
                var j = i.find("div.richModuleSlaveImgContainer");
                var q = i.find("div.formMiddleContent");
                var u = $(this);
                var k = j.find(".richModuleSlaveImg");
                var v = 0;
                var l = k.width();
                var w = k.height();
                var e = (parseInt(l) - a) / 2;
                var g = (parseInt(w) - a) / 2;
                if (j.hasClass("textImg3")) {
                    $(this).css({
                        position: "relative",
                        "float": "none",
                        margin: "0 auto",
                        overflow: "visible"
                    })
                } else {
                    if (j.hasClass("textImg6")) {
                        $(this).css({
                            position: "relative",
                            "float": "none",
                            margin: "0 auto",
                            overflow: "visible"
                        })
                    } else {
                        $(this).css({
                            position: "relative",
                            "float": "left",
                            overflow: "visible"
                        })
                    }
                }
                var m = "<div class='imgResizeLine imgResizeLine-first'></div><div class='imgResizeLine imgResizeLine-second'></div>";
                var n = $(this).children(".ui-resizable-sw");
                var A = $(this).children(".ui-resizable-se");
                var x = $(this).children(".ui-resizable-nw");
                var h = $(this).children(".ui-resizable-ne");
                var t = $(this).children(".ui-resizable-s");
                var r = $(this).children(".ui-resizable-w");
                var z = $(this).children(".ui-resizable-n");
                var f = $(this).children(".ui-resizable-e");
                n.addClass("ui-resizable-imgBottomLeftTip").css({
                    "z-index": "5"
                });
                A.addClass("ui-resizable-imgBottomRightTip").css({
                    "z-index": "5"
                });
                x.addClass("ui-resizable-imgTopLeftTip").css({
                    "z-index": "5"
                });
                h.addClass("ui-resizable-imgTopRightTip").css({
                    "z-index": "5"
                });
                t.addClass("ui-resizable-imgBottomTip").css({
                    "z-index": "5"
                }).append(m);
                r.addClass("ui-resizable-imgLeftTip").css({
                    "z-index": "5"
                }).append(m);
                z.addClass("ui-resizable-imgTopTip").css({
                    "z-index": "5"
                }).append(m);
                f.addClass("ui-resizable-imgRightTip").css({
                    "z-index": "5"
                }).append(m);
                t.children(".imgResizeLine").css({
                    width: e + "px"
                });
                z.children(".imgResizeLine").css({
                    width: e + "px"
                });
                f.children(".imgResizeLine").css({
                    height: g + "px"
                });
                r.children(".imgResizeLine").css({
                    height: g + "px"
                });
                if (j.hasClass("textImg6")) {
                    v = j.siblings(".richContent").height() || 0
                }
                if (i.attr("_intab") > 0) {
                    var y = Fai.top.$("#formTabContent" + i.attr("_intab"));
                    $(this).resizable("option", "maxHeight", parseInt(y.height()))
                } else {
                    if (i.attr("_autoheight") != 1) {
                        $(this).resizable("option", "maxHeight", parseInt(q.height() - v))
                    } else {
                        $(this).resizable("option", "maxHeight", "auto")
                    }
                }
                var o = $(this).parent();
                $(this).children(".ui-resizable-handle").mousedown(function(C) {
                    var B = o.attr("href");
                    if (typeof B != "undefined" && B.length > 0) {
                        o.removeAttr("href");
                        o.attr("onclick", "return false;")
                    }
                });
                $(this).mousemove(function() {
                    u.children(".ui-resizable-handle").show()
                });
                n.mouseover(function() {
                    u.attr("aspectRatio", "1")
                });
                A.mouseover(function() {
                    u.attr("aspectRatio", "1")
                });
                h.mouseover(function() {
                    u.attr("aspectRatio", "1")
                });
                x.mouseover(function() {
                    u.attr("aspectRatio", "1")
                });
                z.mouseover(function() {
                    u.attr("aspectRatio", "0")
                });
                f.mouseover(function() {
                    u.attr("aspectRatio", "0")
                });
                t.mouseover(function() {
                    u.attr("aspectRatio", "0")
                });
                r.mouseover(function() {
                    u.attr("aspectRatio", "0")
                });
                $(this).children(".ui-resizable-handle").hover(function() {
                    Site.triggerGobalEvent("moduleInnerEdit", true)
                },
                function() {
                    Site.triggerGobalEvent("moduleInnerEdit", false)
                })
            },
            start: function(f, k) {
                if ($(this).attr("aspectRatio") == "1") {
                    $(this).resizable("option", "aspectRatio", true)
                } else {
                    $(this).resizable("option", "aspectRatio", false)
                }
                var p = $(this).parents("div.formStyle1");
                var m = $(this).parents("div.formMiddleContent");
                var i = $(this).parents("div.richModuleSlaveImgContainer");
                var i = $(this).parents("div.richModuleSlaveImgContainer");
                var e = i.find(".richModuleSlaveImg");
                var g = 0;
                var l = e.width();
                var j = e.height();
                var h = (parseInt(l) - a) / 2;
                var n = (parseInt(j) - a) / 2;
                $(this).children(".ui-resizable-s").children(".imgResizeLine").css({
                    width: h + "px"
                });
                $(this).children(".ui-resizable-n").children(".imgResizeLine").css({
                    width: h + "px"
                });
                $(this).children(".ui-resizable-e").children(".imgResizeLine").css({
                    height: n + "px"
                });
                $(this).children(".ui-resizable-w").children(".imgResizeLine").css({
                    height: n + "px"
                });
                if (i.hasClass("textImg6")) {
                    g = i.siblings(".richContent").height() || 0
                }
                $(this).resizable("option", "maxWidth", m.width());
                if (p.attr("_intab") > 0) {
                    var o = Fai.top.$("#formTabContent" + p.attr("_intab"));
                    $(this).resizable("option", "maxHeight", parseInt(o.height()))
                } else {
                    if (p.attr("_autoheight") != 1) {
                        $(this).resizable("option", "maxHeight", parseInt(m.height() - g))
                    } else {
                        $(this).resizable("option", "maxHeight", "auto")
                    }
                }
                Site.removeAllEditLayer();
                Site.disableEditLayer();
                $(".ui-resizable-bottomTip").css({
                    opacity: "0"
                });
                $(".ui-resizable-cancelTip").css({
                    opacity: "0"
                });
                $(".draggableBtn").css({
                    opacity: "0"
                })
            },
            resize: function(f, g) {
                var k = $(this).parents("div.richModuleSlaveImgContainer");
                var e = k.find(".richModuleSlaveImg");
                var j = k.find(".richEditPic");
                $(this).css({
                    left: "auto",
                    top: "auto"
                });
                $(this).children(".ui-resizable-handle").hide();
                var i = e.offset().left - k.offset().left;
                var h = e.offset().top - k.offset().top;
                j.css("top", h);
                j.css("left", i)
            },
            stop: function(h, o) {
                Site.logDog(100087, 0);
                Site.enableEditLayer();
                var t = $(this).parents("div.formStyle1");
                var q = $(this).parents("div.formMiddleContent");
                var m = $(this).parents("div.richModuleSlaveImgContainer");
                var e = m.find(".richModuleSlaveImg");
                var j = 0;
                var p = e.width();
                var n = e.height();
                var l = (parseInt(p) - a) / 2;
                var r = (parseInt(n) - a) / 2;
                $(this).children(".ui-resizable-s").children(".imgResizeLine").css({
                    width: l + "px"
                });
                $(this).children(".ui-resizable-n").children(".imgResizeLine").css({
                    width: l + "px"
                });
                $(this).children(".ui-resizable-e").children(".imgResizeLine").css({
                    height: r + "px"
                });
                $(this).children(".ui-resizable-w").children(".imgResizeLine").css({
                    height: r + "px"
                });
                if (m.hasClass("textImg6")) {
                    j = m.siblings(".richContent").height() || 0
                }
                if (t.attr("_intab") > 0) {
                    var s = Fai.top.$("#formTabContent" + t.attr("_intab"));
                    $(this).resizable("option", "maxHeight", parseInt(s.height()))
                } else {
                    if (t.attr("_autoheight") != 1) {
                        $(this).resizable("option", "maxHeight", parseInt(q.height() - j))
                    }
                }
                $(".ui-resizable-bottomTip").css({
                    opacity: "1"
                });
                $(".ui-resizable-cancelTip").css({
                    opacity: "1"
                });
                $(".draggableBtn").css({
                    opacity: "1"
                });
                var g = $(this).parents(".formStyle1");
                if (g && g.length > 0) {
                    var i = g.attr("id").replace("module", "");
                    Site.getModuleAttrData(i).changed = true;
                    Site.styleChanged()
                }
                m.find("img.richModuleSlaveImg").attr("resize", "1");
                var k = $(this).parent();
                var f = k.attr("link");
                if (typeof f != "undefined" && f.length > 0) {
                    setTimeout(function() {
                        k.attr("href", f);
                        k.removeAttr("onclick")
                    },
                    100)
                }
            }
        });
        $(d).off(".richModuleSlaveImg");
        $(d).on("mouseover.richModuleSlaveImg",
        function() {
            Site.triggerGobalEvent("moduleInnerEdit", true)
        });
        $(d).on("mouseleave.richModuleSlaveImg",
        function() {
            Site.triggerGobalEvent("moduleInnerEdit", false)
        })
    })
};
Site.getFlutter = function(a) {
    return 1
};
Site.setSiteBg = function(b, a, c) {
    var f = Site.getWebBackgroundData(),
    e = "",
    d = false;
    useNorepeatStyle = false;
    if (f.r == 4) {
        e = "100% 100%";
        d = true
    } else {
        if (f.r == 5) {
            e = "100%";
            d = true
        }
    }
    Fai.top.Fai.setCtrlStyleCss("styleSiteBg", "", "body", "background", a);
    if (c == 1) {
        if (Fai.isIE6()) {
            b = b + " fixed"
        }
        Fai.top.Fai.setCtrlStyleCss("styleSiteBg", "", "#g_main", "background", b);
        Fai.top.Fai.setCtrlStyleCss("styleSiteBg", "", "#web", "background", "none");
        if (d) {
            Fai.top.Fai.setCtrlStyleCss("styleSiteBg", "", "#g_main", "background-size", e)
        }
    } else {
        Fai.top.Fai.setCtrlStyleCss("styleSiteBg", "", "#web", "background", b);
        Fai.top.Fai.setCtrlStyleCss("styleSiteBg", "", "#g_main", "background", "none");
        switch (f.r) {
        case 6:
            useNorepeatStyle = true;
            Fai.top.Fai.setCtrlStyleCss("styleSiteBg", "", "#web", "background-position", "left");
            break;
        case 7:
            useNorepeatStyle = true;
            Fai.top.Fai.setCtrlStyleCss("styleSiteBg", "", "#web", "background-position", "right");
            break;
        case 8:
            useNorepeatStyle = true;
            Fai.top.Fai.setCtrlStyleCss("styleSiteBg", "", "#web", "background-position", "top");
            break;
        case 9:
            useNorepeatStyle = true;
            Fai.top.Fai.setCtrlStyleCss("styleSiteBg", "", "#web", "background-position", "bottom");
            break;
        case 13:
            useNorepeatStyle = true;
            Fai.top.Fai.setCtrlStyleCss("styleSiteBg", "", "#web", "background-position", "left top");
            break;
        case 14:
            useNorepeatStyle = true;
            Fai.top.Fai.setCtrlStyleCss("styleSiteBg", "", "#web", "background-position", "right top");
            break;
        case 15:
            useNorepeatStyle = true;
            Fai.top.Fai.setCtrlStyleCss("styleSiteBg", "", "#web", "background-position", "left bottom");
            break;
        case 16:
            useNorepeatStyle = true;
            Fai.top.Fai.setCtrlStyleCss("styleSiteBg", "", "#web", "background-position", "right bottom");
            break;
        default:
            return false;
            break
        }
        if (useNorepeatStyle) {
            Fai.top.Fai.setCtrlStyleCss("styleSiteBg", "", "#web", "background-repeat", "no-repeat")
        }
        if (d) {
            Fai.top.Fai.setCtrlStyleCss("styleSiteBg", "", "#web", "background-size", e)
        }
    }
};
Site.removeSiteBg = function() {
    Fai.top.Fai.removeCtrlStyleCss("styleSiteBg", "", "body", "background");
    Fai.top.Fai.removeCtrlStyleCss("styleSiteBg", "", "#web", "background");
    Fai.top.Fai.removeCtrlStyleCss("styleSiteBg", "", "#g_main", "background");
    Fai.top.Fai.removeCtrlStyleCss("styleSiteBg", "", "#web", "background-size");
    Fai.top.Fai.removeCtrlStyleCss("styleSiteBg", "", "#g_main", "background-size")
};
Site.hideSiteBg = function() {
    Fai.top.Fai.setCtrlStyleCss("styleSiteBg", "", "body", "background", "none");
    Fai.top.Fai.setCtrlStyleCss("styleSiteBg", "", "#web", "background", "none");
    Fai.top.Fai.setCtrlStyleCss("styleSiteBg", "", "#g_main", "background", "none")
};
Site.setBannerBg = function(a) {
    Fai.top.Fai.setCtrlStyleCss("styleBannerBg", "", ".webBannerTable", "background", a);
    Fai.top.Fai.setCtrlStyleCss("styleBannerBg", "", ".webBanner", "background", "none");
    Fai.top.Fai.setCtrlStyleCss("styleBannerBg", "webBanner", ".bannerLeft", "background", "none");
    Fai.top.Fai.setCtrlStyleCss("styleBannerBg", "webBanner", ".bannerRight", "background", "none");
    var e = Site.getBannerBackgroundData(),
    d = "",
    b = false,
    c = false;
    switch (e.r) {
    case 4:
        d = "100% 100%";
        b = true;
        break;
    case 5:
        d = "100%";
        b = true;
        break;
    case 6:
        c = true;
        Fai.top.Fai.setCtrlStyleCss("styleBannerBg", "", ".webBannerTable", "background-position", "left");
        break;
    case 7:
        c = true;
        Fai.top.Fai.setCtrlStyleCss("styleBannerBg", "", ".webBannerTable", "background-position", "right");
        break;
    case 8:
        c = true;
        Fai.top.Fai.setCtrlStyleCss("styleBannerBg", "", ".webBannerTable", "background-position", "top");
        break;
    case 9:
        c = true;
        Fai.top.Fai.setCtrlStyleCss("styleBannerBg", "", ".webBannerTable", "background-position", "bottom");
        break;
    case 13:
        c = true;
        Fai.top.Fai.setCtrlStyleCss("styleBannerBg", "", ".webBannerTable", "background-position", "left top");
        break;
    case 14:
        c = true;
        Fai.top.Fai.setCtrlStyleCss("styleBannerBg", "", ".webBannerTable", "background-position", "right top");
        break;
    case 15:
        c = true;
        Fai.top.Fai.setCtrlStyleCss("styleBannerBg", "", ".webBannerTable", "background-position", "left bottom");
        break;
    case 16:
        c = true;
        Fai.top.Fai.setCtrlStyleCss("styleBannerBg", "", ".webBannerTable", "background-position", "right bottom");
        break;
    default:
        return false;
        break
    }
    if (c) {
        Fai.top.Fai.setCtrlStyleCss("styleBannerBg", "", ".webBannerTable", "background-repeat", "no-repeat")
    }
    if (b) {
        Fai.top.Fai.setCtrlStyleCss("styleBannerBg", "", ".webBannerTable", "background-size", d)
    }
};
Site.removeBannerBg = function() {
    Fai.top.Fai.removeCtrlStyleCss("styleBannerBg", "", ".webBannerTable", "background");
    Fai.top.Fai.removeCtrlStyleCss("styleBannerBg", "", ".webBannerTable", "background-size");
    Fai.top.Fai.removeCtrlStyleCss("styleBannerBg", "", ".webBanner", "background");
    Fai.top.Fai.removeCtrlStyleCss("styleBannerBg", "webBanner", ".bannerLeft", "background");
    Fai.top.Fai.removeCtrlStyleCss("styleBannerBg", "webBanner", ".bannerRight", "background")
};
Site.hideBannerBg = function() {
    Fai.top.Fai.setCtrlStyleCss("styleBannerBg", "", ".webBannerTable", "background", "none");
    Fai.top.Fai.setCtrlStyleCss("styleBannerBg", "", ".webBanner", "background", "none");
    Fai.top.Fai.setCtrlStyleCss("styleBannerBg", "webBanner", ".bannerLeft", "background", "none");
    Fai.top.Fai.setCtrlStyleCss("styleBannerBg", "webBanner", ".bannerRight", "background", "none")
};
Site.setContentBg = function(b, a) {
    Fai.top.Fai.setCtrlStyleCss("styleContentBg", "", ".webContainerTable", "background", b);
    Fai.top.Fai.setCtrlStyleCss("styleContentBg", "", "#webContainer", "background", a);
    Fai.top.Fai.setCtrlStyleCss("styleContentBg", "", "#container", "background", a);
    Fai.top.Fai.setCtrlStyleCss("styleContentBg", "webContainer", ".containerTop", "display", "none");
    Fai.top.Fai.setCtrlStyleCss("styleContentBg", "webContainer", ".containerBottom", "display", "none");
    Fai.top.Fai.setCtrlStyleCss("styleContentBg", "", "#containerMiddleLeft", "background", a);
    Fai.top.Fai.setCtrlStyleCss("styleContentBg", "", "#containerMiddleRight", "background", a);
    Fai.top.Fai.setCtrlStyleCss("styleContentBg", "webContainer", ".containerMiddleCenter", "background", a);
    Fai.top.Fai.setCtrlStyleCss("styleContentBg", "webContainer", ".container .containerForms", "background", a);
    Fai.top.Fai.setCtrlStyleCss("styleContentBg", "container", ".containerFormsLeft", "background", "none");
    Fai.top.Fai.setCtrlStyleCss("styleContentBg", "container", ".containerFormsCenter", "background", "none");
    Fai.top.Fai.setCtrlStyleCss("styleContentBg", "container", ".containerFormsRight", "background", "none");
    var f = Site.getContentBackgroundData(),
    e = "",
    c = false,
    d = false;
    switch (f.r) {
    case 4:
        e = "100% 100%";
        c = true;
        break;
    case 5:
        e = "100%";
        c = true;
        break;
    case 6:
        d = true;
        Fai.top.Fai.setCtrlStyleCss("styleContentBg", "", ".webContainerTable", "background-position", "left");
        break;
    case 7:
        d = true;
        Fai.top.Fai.setCtrlStyleCss("styleContentBg", "", ".webContainerTable", "background-position", "right");
        break;
    case 8:
        d = true;
        Fai.top.Fai.setCtrlStyleCss("styleContentBg", "", ".webContainerTable", "background-position", "top");
        break;
    case 9:
        d = true;
        Fai.top.Fai.setCtrlStyleCss("styleContentBg", "", ".webContainerTable", "background-position", "bottom");
        break;
    case 13:
        d = true;
        Fai.top.Fai.setCtrlStyleCss("styleContentBg", "", ".webContainerTable", "background-position", "left top");
        break;
    case 14:
        d = true;
        Fai.top.Fai.setCtrlStyleCss("styleContentBg", "", ".webContainerTable", "background-position", "right top");
        break;
    case 15:
        d = true;
        Fai.top.Fai.setCtrlStyleCss("styleContentBg", "", ".webContainerTable", "background-position", "left bottom");
        break;
    case 16:
        d = true;
        Fai.top.Fai.setCtrlStyleCss("styleContentBg", "", ".webContainerTable", "background-position", "right bottom");
        break;
    default:
        return false;
        break
    }
    if (d) {
        Fai.top.Fai.setCtrlStyleCss("styleContentBg", "", ".webContainerTable", "background-repeat", "no-repeat")
    }
    if (c) {
        Fai.top.Fai.setCtrlStyleCss("styleContentBg", "", ".webContainerTable", "background-size", e)
    }
};
Site.removeContentBg = function() {
    Fai.top.Fai.removeCtrlStyleCss("styleContentBg", "", ".webContainerTable", "background");
    Fai.top.Fai.removeCtrlStyleCss("styleContentBg", "", ".webContainerTable", "background-size");
    Fai.top.Fai.removeCtrlStyleCss("styleContentBg", "", "#webContainer", "background");
    Fai.top.Fai.removeCtrlStyleCss("styleContentBg", "", "#container", "background");
    Fai.top.Fai.removeCtrlStyleCss("styleContentBg", "webContainer", ".containerTop", "display");
    Fai.top.Fai.removeCtrlStyleCss("styleContentBg", "webContainer", ".containerBottom", "display");
    Fai.top.Fai.removeCtrlStyleCss("styleContentBg", "", "#containerMiddleLeft", "background");
    Fai.top.Fai.removeCtrlStyleCss("styleContentBg", "", "#containerMiddleRight", "background");
    Fai.top.Fai.removeCtrlStyleCss("styleContentBg", "webContainer", ".containerMiddleCenter", "background");
    Fai.top.Fai.removeCtrlStyleCss("styleContentBg", "webContainer", ".container .containerForms", "background");
    Fai.top.Fai.removeCtrlStyleCss("styleContentBg", "container", ".containerFormsLeft", "background");
    Fai.top.Fai.removeCtrlStyleCss("styleContentBg", "container", ".containerFormsCenter", "background");
    Fai.top.Fai.removeCtrlStyleCss("styleContentBg", "container", ".containerFormsRight", "background")
};
Site.hideContentBg = function() {
    Fai.top.Fai.setCtrlStyleCss("styleContentBg", "", ".webContainerTable", "background", "none");
    Fai.top.Fai.setCtrlStyleCss("styleContentBg", "", "#webContainer", "background", "none");
    Fai.top.Fai.setCtrlStyleCss("styleContentBg", "webContainer", ".containerTop", "display", "none");
    Fai.top.Fai.setCtrlStyleCss("styleContentBg", "webContainer", ".containerBottom", "display", "none");
    Fai.top.Fai.setCtrlStyleCss("styleContentBg", "", "#containerMiddleLeft", "background", "none");
    Fai.top.Fai.setCtrlStyleCss("styleContentBg", "", "#containerMiddleRight", "background", "none");
    Fai.top.Fai.setCtrlStyleCss("styleContentBg", "webContainer", ".containerMiddleCenter", "background", "none");
    Fai.top.Fai.setCtrlStyleCss("styleContentBg", "webContainer", ".container .containerForms", "background", "none");
    Fai.top.Fai.setCtrlStyleCss("styleContentBg", "container", ".containerFormsLeft", "background", "none");
    Fai.top.Fai.setCtrlStyleCss("styleContentBg", "container", ".containerFormsCenter", "background", "none");
    Fai.top.Fai.setCtrlStyleCss("styleContentBg", "container", ".containerFormsRight", "background", "none")
};
Site.setContentMiddleBg = function(a) {
    Fai.top.Fai.setCtrlStyleCss("styleContentMiddleBg", "", "div#container", "background", a);
    var e = Site.getContentMiddleBackgroundData(),
    d = "",
    b = false,
    c = false;
    switch (e.r) {
    case 4:
        d = "100% 100%";
        b = true;
        break;
    case 5:
        d = "100%";
        b = true;
        break;
    case 6:
        c = true;
        Fai.top.Fai.setCtrlStyleCss("styleContentMiddleBg", "", "div#container", "background-position", "left");
        break;
    case 7:
        c = true;
        Fai.top.Fai.setCtrlStyleCss("styleContentMiddleBg", "", "div#container", "background-position", "right");
        break;
    case 8:
        c = true;
        Fai.top.Fai.setCtrlStyleCss("styleContentMiddleBg", "", "div#container", "background-position", "top");
        break;
    case 9:
        c = true;
        Fai.top.Fai.setCtrlStyleCss("styleContentMiddleBg", "", "div#container", "background-position", "bottom");
        break;
    case 13:
        c = true;
        Fai.top.Fai.setCtrlStyleCss("styleContentMiddleBg", "", "div#container", "background-position", "left top");
        break;
    case 14:
        c = true;
        Fai.top.Fai.setCtrlStyleCss("styleContentMiddleBg", "", "div#container", "background-position", "right top");
        break;
    case 15:
        c = true;
        Fai.top.Fai.setCtrlStyleCss("styleContentMiddleBg", "", "div#container", "background-position", "left bottom");
        break;
    case 16:
        c = true;
        Fai.top.Fai.setCtrlStyleCss("styleContentMiddleBg", "", "div#container", "background-position", "right bottom");
        break;
    default:
        return false;
        break
    }
    if (c) {
        Fai.top.Fai.setCtrlStyleCss("styleContentMiddleBg", "", "div#container", "background-repeat", "no-repeat")
    }
    if (b) {
        Fai.top.Fai.setCtrlStyleCss("styleContentMiddleBg", "", "div#container", "background-size", d)
    }
};
Site.removeContentMiddleBg = function() {
    Fai.top.Fai.removeCtrlStyleCssList("styleContentMiddleBg", "", [{
        cls: "div#container",
        key: "background"
    },
    {
        cls: "div#container",
        key: "background-size"
    }])
};
Site.hideContentMiddleBg = function() {
    Fai.top.Fai.setCtrlStyleCss("styleContentMiddleBg", "", "div#container", "background", "none")
};
Site.setSiteWidth = function(a) {
    Fai.top.Fai.setCtrlStyleCss("styleWebSite", "", "#memberBar", "width", a);
    Fai.top.Fai.setCtrlStyleCss("styleWebSite", "", "#webTop", "width", a);
    Fai.top.Fai.setCtrlStyleCss("styleWebSite", "", "#absTopForms", "width", a);
    Fai.top.Fai.setCtrlStyleCss("styleWebSite", "", "#webHeader", "width", a);
    Fai.top.Fai.setCtrlStyleCss("styleWebSite", "", ".webNavigatorDefault", "width", a);
    Fai.top.Fai.setCtrlStyleCss("styleWebSite", "", "#webBanner", "width", a);
    Fai.top.Fai.setCtrlStyleCss("styleWebSite", "", "#absForms", "width", a);
    Fai.top.Fai.setCtrlStyleCss("styleWebSite", "", "#webContainer", "width", a);
    Fai.top.Fai.setCtrlStyleCss("styleWebSite", "", "#absBottomForms", "width", a);
    Fai.top.Fai.setCtrlStyleCss("styleWebSite", "", "#webFooter", "width", a);
    Fai.top.Fai.setCtrlStyleCss("styleWebSite", "", "div.webNav .navMainContent", "width", a);
    Fai.top.Fai.setCtrlStyleCss("styleWebSite", "", "div.nav .navMainContent", "width", a);
    Fai.top.Fai.setCtrlStyleCss("styleWebSite", "", ".fullmeasureContent", "width", a)
};
Site.removeSiteWidth = function() {
    Fai.top.Fai.removeCtrlStyleCss("styleWebSite", "", "#memberBar", "width");
    Fai.top.Fai.removeCtrlStyleCss("styleWebSite", "", "#webTop", "width");
    Fai.top.Fai.removeCtrlStyleCss("styleWebSite", "", "#absTopForms", "width");
    Fai.top.Fai.removeCtrlStyleCss("styleWebSite", "", "#webHeader", "width");
    Fai.top.Fai.removeCtrlStyleCss("styleWebSite", "", ".webNavigatorDefault", "width");
    Fai.top.Fai.removeCtrlStyleCss("styleWebSite", "", "#webBanner", "width");
    Fai.top.Fai.removeCtrlStyleCss("styleWebSite", "", "#absForms", "width");
    Fai.top.Fai.removeCtrlStyleCss("styleWebSite", "", "#webContainer", "width");
    Fai.top.Fai.removeCtrlStyleCss("styleWebSite", "", "#absBottomForms", "width");
    Fai.top.Fai.removeCtrlStyleCss("styleWebSite", "", "#webFooter", "width");
    Fai.top.Fai.removeCtrlStyleCss("styleWebSite", "", "div.webNav .navMainContent", "width");
    Fai.top.Fai.removeCtrlStyleCss("styleWebSite", "", "div.nav .navMainContent", "width");
    Fai.top.Fai.removeCtrlStyleCss("styleWebSite", "", ".fullmeasureContent", "width")
};
Site.setWebBannerHeight = function(a) {
    Fai.top.Fai.setCtrlStyleCss("styleWebSite", "", ".webBanner", "height", a + "px");
    Fai.top.Fai.setCtrlStyleCss("styleWebSite", "", ".webBanner", "min-height", "auto")
};
Site.autoWebBannerHeight = function() {
    Fai.top.Fai.removeCtrlStyleCss("styleWebSite", "", ".webBanner", "height");
    Fai.top.Fai.removeCtrlStyleCss("styleWebSite", "", ".webBanner", "min-height")
};
Site.setWebBannerWidth = function(a) {
    Fai.top.Fai.setCtrlStyleCss("styleWebSite", "", ".webBanner", "width", a + "px !important");
    Fai.top.Fai.setCtrlStyleCss("styleWebSite", "", ".webBanner .banner", "width", "auto !important");
    Fai.top.Fai.setCtrlStyleCss("styleWebSite", "", ".webBanner .switchGroup", "width", a + "px !important")
};
Site.autoWebBannerWidth = function() {
    Fai.top.Fai.removeCtrlStyleCss("styleWebSite", "", ".webBanner", "width");
    Fai.top.Fai.removeCtrlStyleCss("styleWebSite", "", ".webBanner .banner", "width");
    Fai.top.Fai.removeCtrlStyleCss("styleWebSite", "", ".webBanner .switchGroup", "width")
};
Site.setContentLeftWidth = function(a) {
    Fai.top.Fai.setCtrlStyleCss("styleWebSite", "", "#containerFormsLeft", "width", a + "px")
};
Site.autoContentLeftWidth = function() {
    Fai.top.Fai.removeCtrlStyleCss("styleWebSite", "", "#containerFormsLeft", "width")
};
Site.setContentRightWidth = function(a) {
    Fai.top.Fai.setCtrlStyleCss("styleWebSite", "", "#containerFormsRight", "width", a + "px")
};
Site.autoContentRightWidth = function() {
    Fai.top.Fai.removeCtrlStyleCss("styleWebSite", "", "#containerFormsRight", "width")
};
Site.resetBackgroundStyleDefault = function(b) {
    var a = Site.getWebBackgroundData();
    a.h = false;
    a.s = true;
    if (b) {
        a.sw = -1
    }
    a.wbh = -1;
    a.wbw = -1;
    a.clw = -1;
    a.crw = -1;
    if (Fai.top._bannerData.s == 0) {
        Fai.top.$("#banner").removeAttr("style")
    }
    Site.saveWebBackgroundData(a);
    var f = Site.getHeaderStyleData();
    f.hts = -1;
    f.y = 1;
    Site.saveHeaderStyleData(f);
    var d = Site.getBannerBackgroundData();
    d.y = 0;
    Site.saveBannerBackgroundData(d);
    var c = Site.getContentBackgroundData();
    c.y = 0;
    Site.saveContentBackgroundData(c);
    var e = Site.getContentMiddleBackgroundData();
    e.y = 0;
    Site.saveContentMiddleBackgroundData(e);
    Site.removeSiteBg();
    Site.autoHeaderTopHeight();
    Site.removeHeaderBg();
    Site.removeBannerBg();
    Site.autoWebBannerHeight();
    Site.autoWebBannerWidth();
    Site.removeContentBg();
    Site.removeContentMiddleBg();
    Site.autoContentLeftWidth();
    Site.autoContentRightWidth();
    Site.resetFooterStyleDefault();
    Fai.top._footerStyleChanged++;
    Fai.top._headerTopStyleChanged++;
    Fai.top._bgImgChanged++
};
Site.getWebBackgroundData = function() {
    return Fai.top._useTemplateBackground ? Fai.top._templateBackgroundData: Fai.top._customBackgroundData
};
Site.saveWebBackgroundData = function(a) {
    Fai.top._useTemplateBackground ? Fai.top._templateBackgroundData = a: Fai.top._customBackgroundData = a
};
Site.getHeaderStyleData = function() {
    return Fai.top._useTemplateBackground ? Fai.top._headerTopStyle.hg: Fai.top._customHeaderTopStyle.hg
};
Site.saveHeaderStyleData = function(a) {
    Fai.top._useTemplateBackground ? Fai.top._headerTopStyle.hg = a: Fai.top._customHeaderTopStyle.hg = a
};
Site.getBannerBackgroundData = function() {
    return Fai.top._useTemplateBackground ? Fai.top._templateBackgroundData.bBg: Fai.top._customBackgroundData.bBg
};
Site.saveBannerBackgroundData = function(a) {
    Fai.top._useTemplateBackground ? Fai.top._templateBackgroundData.bBg = a: Fai.top._customBackgroundData.bBg = a
};
Site.getContentBackgroundData = function() {
    return Fai.top._useTemplateBackground ? Fai.top._templateBackgroundData.cBg: Fai.top._customBackgroundData.cBg
};
Site.saveContentBackgroundData = function(a) {
    Fai.top._useTemplateBackground ? Fai.top._templateBackgroundData.cBg = a: Fai.top._customBackgroundData.cBg = a
};
Site.getContentMiddleBackgroundData = function() {
    return Fai.top._useTemplateBackground ? Fai.top._templateBackgroundData.cmBg: Fai.top._customBackgroundData.cmBg
};
Site.saveContentMiddleBackgroundData = function(a) {
    Fai.top._useTemplateBackground ? Fai.top._templateBackgroundData.cmBg = a: Fai.top._customBackgroundData.cmBg = a
};
Site.dockModuleResize = function(b) {
    if (b.length == 0) {
        return
    }
    if (Fai.top.$("#dockTip").length < 1) {
        Fai.top.$("body").append("<div id='dockTip' class='resizableToShowWidth dockTip'></div>")
    }
    var a = Fai.top.$("#dockTip");
    $.each(b,
    function(j, g) {
        var h = $(this).attr("_intab");
        if (h > 0) {
            Site.dockModuleResize_disable($(this));
            return true
        }
        var d = $(this).attr("_inmulmcol");
        if (d > 0) {
            Site.dockModuleResize_disable($(this));
            return true
        }
        if ($(this).hasClass("formStyle35") || $(this).hasClass("formStyle29")) {
            if ($(this).find(".form").length < 1) {
                return true
            }
        }
        var f = $(this).attr("id");
        var e = f.replace("module", "");
        var o = Site.getLockStatus(f);
        var k = Site.getAbsStatus(f);
        var m = Site.getSideStatus(f);
        var c = Site.getFlutterStatus2(f);
        if (o == 0 || k == 0 || m == 0 || c == 0) {
            return true
        }
        $(this).resizable("destroy");
        if ($(this).hasClass("formStyle35")) {
            Site.bindInMulColResizableModule(e)
        }
        var l = Site.absAlignLine.resize;
        $(this).resizable({
            handles: "s",
            helper: "ui-resizable-helper",
            distance: 0,
            autoHide: true,
            maxWidth: $(this).parent().width(),
            minWidth: $(this).parent().width(),
            create: function() {
                if (($(this).attr("_autoHeight") == 0) && ($(this).children(".ui-resizable-cancelTip").length < 1)) {
                    var n = "";
                    if ($(this).find(".formMiddleContent" + e).children(".pd_mall_G_J").length > 0) {
                        n += "ui-resizable-cancelLeftTip fk-resizable-cancelLeftTip"
                    }
                    if ($(this).hasClass("formStyle29") || $(this).hasClass("formStyle35") || $(this).hasClass("formStyle80")) {
                        n += " ui-resizable-cancelTip2 fk-resizable-cancelTip2"
                    }
                    $(this).append("<a href='javascript:;' class='J_resizableTip ui-resizable-cancelTip fk-resizable-cancelTip " + n + "' parentid='" + $(this).attr("id") + "' title='还原模块高度' onclick='Site.dockModuleAutoHeight(" + e + ");return false;'></a>")
                }
                var p = $(this).children(".ui-resizable-s");
                p.attr("title", "按住鼠标，可随意调整高度").attr("parentid", f);
                Site.addResizableExtHandles($(this));
                Site.refreshResizableHandles($(this));
                var i = parseInt($(this).attr("_infullmeasure")) || 0;
                if (i > 0) {
                    p.css({
                        zIndex: 1009
                    })
                }
            },
            start: function(i, n) {
                if (i.shiftKey) {
                    Fai.ing("请不要按住shift键进行拖拽！")
                }
                Site.disableEditLayer();
                Fai.top.$("body").disableSelection();
                if ($(this).parent().hasClass("middleLeftForms")) {
                    $(this).css({
                        width: "auto"
                    })
                }
                a.show();
                l.begin = true
            },
            resize: function(n, p) {
                var i = $(".ui-resizable-helper");
                if (n.shiftKey) {
                    Fai.ing("请不要按住shift键进行拖拽！")
                }
                Site.stopFlutterInterval($(this));
                l.init($(this), i, n, ["bottom"]);
                a.html("高度:" + p.helper.height()).css({
                    left: n.pageX - 28,
                    top: n.pageY + 18
                })
            },
            stop: function(n, p) {
                if ($(this).children(".ui-resizable-cancelTip").length < 1) {
                    var i = "";
                    if ($(this).find(".formMiddleContent" + e).children(".pd_mall_G_J").length > 0) {
                        i += "ui-resizable-cancelLeftTip fk-resizable-cancelLeftTip"
                    }
                    if ($(this).hasClass("formStyle29") || $(this).hasClass("formStyle35") || $(this).hasClass("formStyle80")) {
                        i += " ui-resizable-cancelTip2 fk-resizable-cancelTip2"
                    }
                    $(this).append("<a href='javascript:;' class='J_resizableTip ui-resizable-cancelTip fk-resizable-cancelTip " + i + "' parentid='" + $(this).attr("id") + "' title='还原模块高度' onclick='Site.dockModuleAutoHeight(" + e + ");return false;'></a>")
                }
                Site.styleChanged();
                Fai.top._moduleMoved++;
                Site.getModuleAttrPattern(e).changed = true;
                $(p.originalElement).attr("_autoheight", 0);
                Site.enableEditLayer();
                Site.refreshModuleHeight(e);
                Site.moduleSizeChange(f);
                Site.setModuleStyleCss(e, "", "height", $(this).height() + "px");
                if ($(this).hasClass("formStyle5") || $(this).hasClass("formStyle77")) {
                    Site.refreshModulePhotoSwitch(e)
                }
                if ($(this).parent().hasClass("middleLeftForms") || $(this).parent().hasClass("middleRightForms")) {
                    $(this).css({
                        width: "auto"
                    });
                    $(this).parent().css({
                        height: "auto"
                    });
                    Site.createMiddleLeftFormsHider(this)
                }
                Site.isMulColModuleInIE(this);
                Fai.top.$("body").enableSelection();
                $(this).css({
                    width: "auto"
                });
                $(this).trigger("Fai_onModuleSizeChange");
                Site.triggerGobalEvent("resizableModuleChange", e);
                a.hide();
                Fai.top.$("#absAlignTop, #absAlignRight, #absAlignBottom,#absAlignLeft").hide();
                if ($(this).hasClass("formStyle83")) {
                    Site.initPhotoCard(e)
                }
                Site.logDog(100092, 0);
                Site.logDog(100092, 1)
            }
        });
        if ($(this).find(".formMiddleContent" + e).children(".pd_mall_G_J").length > 0) {
            $(this).children(".ui-resizable-s").addClass("ui-resizable-bottomLeftTip")
        }
        $(this).children(".ui-icon").hide()
    })
};
Site.dockModuleAutoHeight = function(c) {
    var b = Fai.top.$("#module" + c);
    if (b) {
        b.attr("_autoHeight", 1);
        if (b.hasClass("formStyle80")) {
            Site.autoModuleHeight(c);
            if (b.children(".ui-resizable-cancelTip").length > 0) {
                b.children(".ui-resizable-cancelTip").remove()
            }
        } else {
            var a = b.find(".formMiddleContent" + c);
            a.css({
                height: "auto"
            });
            Site.autoModuleHeight(c);
            Site.refreshModuleHeight(c);
            Site.moduleSizeChange("module" + c);
            if (b.hasClass("formStyle29")) {
                b.find(".titleTable").css({
                    zoom: "0.9"
                }).css({
                    zoom: "1"
                });
                b.find(".formTabContent").css({
                    zoom: "0.9"
                }).css({
                    zoom: "1"
                });
                b.find(".formMiddleContent").css({
                    zoom: "0.9"
                }).css({
                    zoom: "1"
                });
                if (Fai.isIE7()) {
                    b.find(".formMiddleContent").css({
                        "overflow-y": "hidden"
                    })
                }
                a.css("height", a.height() + "px")
            }
            if (b.hasClass("formStyle35")) {
                b.find(".mulMColContent .mulColLayout:not(:last)").css({
                    height: "auto"
                })
            }
            if (b.children(".ui-resizable-cancelTip").length > 0) {
                b.children(".ui-resizable-cancelTip").remove()
            }
            if (b.parent().hasClass("middleLeftForms") || b.parent().hasClass("middleRightForms")) {
                b.css({
                    width: "auto"
                });
                b.parent().css({
                    height: "auto"
                });
                Site.createMiddleLeftFormsHider(b)
            }
            Site.isMulColModuleInIE(b);
            if (b.hasClass("formStyle5") || b.hasClass("formStyle77")) {
                Site.refreshModulePhotoSwitch(c)
            }
        }
        if (b.hasClass("formStyle83")) {
            b.attr("_autoHeight", 0)
        }
        Site.styleChanged();
        Fai.top._moduleMoved++;
        Site.getModuleAttrPattern(c).changed = true;
        b.trigger("Fai_onModuleSizeChange")
    }
};
Site.dockModuleResize_disable = function(a) {
    if (typeof a == "undefined" || a.length < 1) {
        return
    }
    a.resizable("destroy");
    a.children(".ui-resizable-cancelTip").remove();
    if (a.hasClass("formStyle35")) {
        Site.bindInMulColResizableModule(a.attr("id").replace("module", ""))
    }
};
Site.refreshModuleSizeHandle = function(b) {
    if (typeof b == "undefined" || b.length < 1) {
        return
    }
    if (b.attr("_autoHeight") == 0 && b.children(".ui-resizable-s").length > 0 && b.children(".ui-resizable-cancelTip").length < 1) {
        var c = b.attr("id").replace("module", "");
        var a = "";
        if (b.hasClass("formStyle29") || b.hasClass("formStyle35") || b.hasClass("formStyle80")) {
            a += " ui-resizable-cancelTip2 fk-resizable-cancelTip2"
        }
        b.append("<a href='javascript:;' class='J_resizableTip ui-resizable-cancelTip fk-resizable-cancelTip " + a + "' title='还原模块高度' onclick='Site.dockModuleAutoHeight(" + c + ");return false;'></a>");
        if (b.find(".pd_mall_G_J").length > 0) {
            b.children(".ui-resizable-cancelTip").css({
                left: "0",
                right: "auto"
            })
        }
    } else {
        if (b.attr("_autoHeight") == 1 && b.children(".ui-resizable-cancelTip").length > 0) {
            b.children(".ui-resizable-cancelTip").remove()
        }
    }
};
Site.addNewFloatImg = function(d) {
    var a = $("#module" + d);
    var c = {
        title: "添加图片",
        maxSize: 5,
        type: ["jpg", "jpeg", "gif", "png"],
        from: "rich",
        entry: "floatimg"
    };
    Site.fileUpload2(false, c, b);
    function b(j) {
        if (j) {
            var k = $.parseJSON(j).data[0],
            h = k.fileId,
            g = k.fileWidth,
            e = k.fileHeight,
            i = "ajax/module_h.jsp?cmd=setBack&id=" + d + "&colId=" + Fai.top._colId + "&extId=" + Fai.top._extId,
            f = "{'i':'" + h + "'}";
            $.ajax({
                type: "POST",
                url: i,
                data: "prop1=" + Fai.encodeUrl(f),
                error: function() {
                    Fai.ing("服务器繁忙,请稍后重试", true)
                },
                success: function(m) {
                    var l = $.parseJSON(m);
                    Site.refreshModule(l.id, l.div, "");
                    a.width(g);
                    a.height(e);
                    a.find(".float_in_img").width(g);
                    a.find(".float_in_img").height(e);
                    Fai.top._moduleMoved++;
                    Site.getModuleAttrPattern(d).changed = true;
                    Site.styleChanged();
                    Site.floatImgResize(a)
                }
            })
        }
    }
};
Site.floatImgResize = function(c) {
    if (!c.length) {
        return
    }
    var d = 8,
    a = Site.absAlignLine.resize;
    var e = c,
    b = (e.outerWidth() - e.width()) / 2;
    if (e.find(".floatImg_J").hasClass("floatImg_noImg_J")) {
        return
    }
    e.resizable("destory");
    e.resizable({
        handles: "n,e,s,w,ne,nw,sw,se",
        minWidth: 16,
        minHeight: 16,
        autoHide: true,
        aspectRatio: true,
        alsoResize: e,
        create: function(f, g) {
            e.css("overflow", "visible");
            var i = $(this);
            var h = e.find(".floatImg_J").hasClass("floatImg_noImg_J");
            Site.addResizableImgHandles(e, i, b, d)
        },
        start: function(g, h) {
            if ($(this).attr("aspectRatio") == "1") {
                $(this).resizable("option", "aspectRatio", true)
            } else {
                $(this).resizable("option", "aspectRatio", false)
            }
            var f = Math.floor((e.width() - d) / 2),
            j = Math.floor((e.height() - d) / 2);
            e.children(".ui-resizable-s").children(".imgResizeLine").css({
                width: f + "px"
            });
            e.children(".ui-resizable-n").children(".imgResizeLine").css({
                width: f + "px"
            });
            e.children(".ui-resizable-e").children(".imgResizeLine").css({
                height: j + "px"
            });
            e.children(".ui-resizable-w").children(".imgResizeLine").css({
                height: j + "px"
            });
            Site.disableEditLayer();
            var i = $("#dockTip");
            i.show();
            e.find(".formMiddleContent").css("overflow", "visible");
            e.find(".formMiddleContent").css("overflow-y", "visible");
            a.begin = true;
            if (e.find("map").length) {
                e.attr("_width", e.width());
                e.attr("_height", e.height())
            }
        },
        resize: function(i, j) {
            $(".draggableBtn").css({
                opacity: "0"
            });
            var g = Math.floor((e.width() - d) / 2) - 1,
            m = Math.floor((e.height() - d) / 2) - 1;
            e.children(".ui-resizable-s").children(".imgResizeLine").width(g);
            e.children(".ui-resizable-n").children(".imgResizeLine").width(g);
            e.children(".ui-resizable-e").children(".imgResizeLine").height(m);
            e.children(".ui-resizable-w").children(".imgResizeLine").height(m);
            var l = $("#dockTip");
            l.html("高度:" + e.height() + "<br/>宽度:" + e.width()).css({
                left: i.pageX - 28,
                top: i.pageY + 18
            });
            var k = ["top", "right", "bottom", "left"];
            a.init($(this), e, i, k);
            var f = e.find(".formBanner"),
            h = f.is(":visible") ? f.height() : 0;
            e.find(".float_in_img").css({
                width: e.width() - 1,
                height: e.height() - h
            })
        },
        stop: function(g, h) {
            $(".draggableBtn").css({
                opacity: "1"
            });
            Site.enableEditLayer();
            e.children(".ui-resizable-handle").show();
            var i = $("#dockTip");
            i.hide();
            var f = e.attr("id").replace("module", "");
            Fai.top._moduleMoved++;
            Site.getModuleAttrPattern(f).changed = true;
            Site.styleChanged();
            Site.moduleSizeChange("module" + f);
            e.trigger("Fai_onModuleSizeChange");
            Fai.top.$("#absAlignTop, #absAlignRight, #absAlignBottom,#absAlignLeft").hide();
            if (e.find("map").length) {
                Site.refreshFloatImgHotArea(c)
            }
        }
    })
};
Site.refreshFloatImgHotArea = function(a) {
    var c = a,
    e = c.attr("_width"),
    b = c.attr("_height"),
    f = c.width() / e,
    d = c.height() / b;
    c.find("area").each(function(h, j) {
        var m = $(this).attr("coords").split(","),
        g = parseInt(m[0] * f),
        i = parseInt(m[1] * d),
        n = parseInt(m[2] * f),
        k = parseInt(m[3] * d);
        $(this).attr("coords", g + "," + i + "," + n + "," + k)
    })
};
Site.initFloatImgHotArea = function(c, e, d) {
    var b = $("#module" + c).width(),
    a = $("#module" + c).height();
    if (b != e && a != d) {
        $("#module" + c).find("area").each(function(m, k) {
            var n = $(this).attr("coords").split(","),
            j = b / e,
            h = a / d,
            i = parseInt(n[0] * j),
            o = parseInt(n[1] * h),
            g = parseInt(n[2] * j),
            f = parseInt(n[3] * h);
            $(this).attr("coords", i + "," + o + "," + g + "," + f)
        })
    }
};
Site.addResizableImgHandles = function(m, n, p, o) {
    var j = "<div class='imgResizeLine imgResizeLine-first'></div><div class='imgResizeLine imgResizeLine-second'></div>",
    k = m.children(".ui-resizable-sw"),
    h = m.children(".ui-resizable-se"),
    g = m.children(".ui-resizable-nw"),
    d = m.children(".ui-resizable-ne"),
    i = m.children(".ui-resizable-s"),
    e = m.children(".ui-resizable-w"),
    l = m.children(".ui-resizable-n"),
    c = m.children(".ui-resizable-e");
    var a = -4 - p;
    var b = -9 - p;
    k.addClass("ui-resizable-imgBottomLeftTip ui-resizable-floatImgBottomLeft").css({
        bottom: b,
        left: b,
        "z-index": "5"
    });
    h.addClass("ui-resizable-imgBottomRightTip ui-resizable-floatImgBottomRight").css({
        bottom: b,
        right: b,
        "z-index": "5"
    });
    g.addClass("ui-resizable-imgTopLeftTip ui-resizable-floatImgTopLeft").css({
        top: b,
        left: b,
        "z-index": "5"
    });
    d.addClass("ui-resizable-imgTopRightTip ui-resizable-floatImgTopRight").css({
        top: b,
        right: b,
        "z-index": "5"
    });
    i.addClass("ui-resizable-imgBottomTip ui-resizable-floatImgBottom").css({
        bottom: a,
        "z-index": "5"
    }).append(j);
    e.addClass("ui-resizable-imgLeftTip ui-resizable-floatImgLeft").css({
        left: a,
        "z-index": "5"
    }).append(j);
    l.addClass("ui-resizable-imgTopTip ui-resizable-floatImgTop").css({
        top: a,
        "z-index": "5"
    }).append(j);
    c.addClass("ui-resizable-imgRightTip ui-resizable-floatImgRight").css({
        right: a,
        "z-index": "5"
    }).append(j);
    var f = parseInt((m.width() - o) / 2),
    q = parseInt((m.height() - o) / 2);
    i.children(".imgResizeLine").css({
        width: f + "px"
    });
    l.children(".imgResizeLine").css({
        width: f + "px"
    });
    c.children(".imgResizeLine").css({
        height: q + "px"
    });
    e.children(".imgResizeLine").css({
        height: q + "px"
    });
    m.find("img.float_in_img").css({
        padding: 0,
        margin: 0
    });
    k.mouseover(function() {
        n.attr("aspectRatio", "1")
    });
    h.mouseover(function() {
        n.attr("aspectRatio", "1")
    });
    d.mouseover(function() {
        n.attr("aspectRatio", "1")
    });
    g.mouseover(function() {
        n.attr("aspectRatio", "1")
    });
    l.mouseover(function() {
        n.attr("aspectRatio", "0")
    });
    c.mouseover(function() {
        n.attr("aspectRatio", "0")
    });
    i.mouseover(function() {
        n.attr("aspectRatio", "0")
    });
    e.mouseover(function() {
        n.attr("aspectRatio", "0")
    })
};
Site.initManageFlBtnStyle = function(d, f, g) {
    var c = "module" + d,
    h = g.sh;
    mulColLayout = Fai.top.$(".mulMColContent"),
    module = Fai.top.$("#" + c),
    floatBtn = module.find(".floatBtn");
    if (Fai.top._manageMode && Fai.isIE8()) {
        floatBtn.css("zoom", "1")
    }
    Fai.top._floatBtn["_floatBtnData" + d] = g;
    var e = Site.getModuleAttr(d);
    e.data.w = parseInt(floatBtn.width());
    e.data.h = parseInt(floatBtn.height());
    e.data.f = h.f;
    e.data.dx = h.dx;
    e.data.dy = h.dy;
    var j = Site.getLockStatus(c),
    i = Site.getSideStatus(c),
    b = Site.getFlutterStatus2(c),
    a = Site.getAbsStatus(c);
    if (j != 0 && i != 0 && b != 0 && a != 0) {
        Site.setFlBtnBoxPadding(c, h, true)
    }
    if (Site.checkFloatBtnStatus(c)) {
        module.css({
            width: floatBtn.outerWidth() + "px",
            height: floatBtn.outerHeight() + "px"
        });
        if (e.pattern.bannerType == 0) {
            var l = module.find(".formBanner"),
            k = l.is(":visible") ? l.height() : 0;
            module.css("height", (k + floatBtn.outerHeight()) + "px")
        }
    } else {
        module.css("width", "100%")
    }
    floatBtn.removeClass("g_specialClass")
};
Site.checkFloatBtnStatus = function(h) {
    var e = Fai.top.$("#floatLeftBottomForms").find("#" + h).length > 0,
    d = Fai.top.$("#floatRightTopForms").find("#" + h).length > 0,
    c = Fai.top.$("#floatLeftTopForms").find("#" + h).length > 0,
    b = Fai.top.$("#floatRightBottomForms").find("#" + h).length > 0,
    a = Fai.top.$("#absTopForms").find("#" + h).length > 0,
    g = Fai.top.$("#absForms").find("#" + h).length > 0,
    f = Fai.top.$("#absBottomForms").find("#" + h).length > 0;
    if (e || d || c || b || a || g || f) {
        return true
    } else {
        return false
    }
};
Site.floatBtnResize = function(e, d) {
    d = e.attr("id").replace("module", "");
    if (!e.length) {
        return
    }
    var h = 8,
    f = e,
    i = (f.outerWidth() - f.width()) / 2,
    c,
    a = Site.getModuleAttr(d),
    g = a.pattern.bannerType,
    b = Site.absAlignLine.resize;
    f.resizable("destory");
    f.resizable({
        handles: "n,e,s,w,ne,nw,sw,se",
        minWidth: 16,
        minHeight: 16,
        maxWidth: 999,
        maxHeight: 999,
        autoHide: true,
        aspectRatio: true,
        alsoResize: f,
        create: function(j, k) {
            f.find(".formMiddle").css("height", "auto");
            f.css("overflow", "visible");
            var l = $(this);
            Site.addResizableImgHandles(f, l, i, h)
        },
        start: function(k, m) {
            c = f.find(".floatBtn");
            var o = Site.getModuleAttr(d);
            var l = o.pattern.bannerType;
            if ($(this).attr("aspectRatio") == "1") {
                $(this).resizable("option", "aspectRatio", true)
            } else {
                $(this).resizable("option", "aspectRatio", false)
            }
            var j = Math.floor((f.width() - h) / 2),
            p = Math.floor((f.height() - h) / 2);
            f.children(".ui-resizable-s").children(".imgResizeLine").css({
                width: j + "px"
            });
            f.children(".ui-resizable-n").children(".imgResizeLine").css({
                width: j + "px"
            });
            f.children(".ui-resizable-e").children(".imgResizeLine").css({
                height: p + "px"
            });
            f.children(".ui-resizable-w").children(".imgResizeLine").css({
                height: p + "px"
            });
            Site.disableEditLayer();
            var n = $("#dockTip");
            n.show();
            b.begin = true
        },
        resize: function(n, o) {
            $(".draggableBtn").css({
                opacity: "0"
            });
            var q = $("#dockTip");
            q.html("高度:" + f.height() + "<br/>宽度:" + f.width()).css({
                left: n.pageX - 28,
                top: n.pageY + 18
            });
            Site.setFlBtnResizeHandleSize(f);
            var j = f.find(".formBanner"),
            m = j.is(":visible") ? j.height() : 0;
            var l = 2 * parseInt(c.css("borderLeftWidth")) || 0,
            k = c.height();
            var p = ["top", "right", "bottom", "left"];
            b.init($(this), f, n, p);
            c.css({
                width: (f.width() - l - 1) + "px",
                height: (f.height() - l - m) + "px",
                lineHeight: k + "px"
            })
        },
        stop: function(l, m) {
            $(".draggableBtn").css({
                opacity: "1"
            });
            Site.enableEditLayer();
            f.children(".ui-resizable-handle").show();
            var o = $("#dockTip");
            o.hide();
            var k = f.attr("id").replace("module", "");
            var n = Site.getModuleAttr(k).data;
            Fai.top._moduleMoved++;
            Site.getModuleAttrData(k).changed = true;
            Site.getModuleAttrPattern(k).changed = true;
            n.w = parseInt(c.width());
            n.h = parseInt(c.height());
            Fai.top._floatBtn["_floatBtnData" + k] = Fai.top._floatBtn["_floatBtnData" + k] || {};
            var j = Fai.top._floatBtn["_floatBtnData" + k];
            j.s = j.s || {};
            j.s.t = 1;
            j.s.w = parseInt(c.width());
            j.s.h = parseInt(c.height());
            Site.setFlBtnModuleWidth(f);
            Site.styleChanged();
            Site.moduleSizeChange("module" + k);
            f.trigger("Fai_onModuleSizeChange");
            Fai.top.$("#absAlignTop, #absAlignRight, #absAlignBottom,#absAlignLeft").hide()
        }
    })
};
Site.setFlBtnResizeHandleSize = function(b) {
    var c = 8,
    a = Math.floor((b.width() - c) / 2) - 1,
    d = Math.floor((b.height() - c) / 2) - 1;
    b.children(".ui-resizable-s").children(".imgResizeLine").width(a);
    b.children(".ui-resizable-n").children(".imgResizeLine").width(a);
    b.children(".ui-resizable-e").children(".imgResizeLine").height(d);
    b.children(".ui-resizable-w").children(".imgResizeLine").height(d)
};
Site.setFlBtnHasBannerModuleHeight = function(c) {
    var d = Fai.top.$("#module" + c),
    e = d.find(".floatBtn"),
    g = Site.getLockStatus(c),
    f = Site.getSideStatus(c),
    a = Site.getFlutterStatus2(c),
    b = Site.getAbsStatus(c);
    var b = Site.getAbsBottomStatus("module" + c);
    if (b == 1 || g == 0 || f == 1 || a) {
        var i = d.find(".formBanner"),
        h = i.is(":visible") ? i.outerHeight() : 0;
        d.css({
            height: (e.outerHeight() + h) + "px"
        })
    }
};
Site.setFlBtnModuleWidth = function(a) {
    var b = a.find(".floatBtn").outerWidth();
    a.css("width", b + "px");
    Site.setFlBtnResizeHandleSize(a)
};
Site.setFlBtnValue = function(c, b) {
    var a = Fai.top.$("#module" + c + "FlBtn");
    a.text(b);
    Site.getModuleAttrData(c).changed = true;
    Site.styleChanged()
};
Site.setFlBtnHref = function(c, b) {
    var a = Fai.top.$("#module" + c + "FlBtn");
    a.attr("href", b);
    Site.getModuleAttrData(c).changed = true;
    Site.styleChanged()
};
Site.setFlBtnSysNum = function(d, b) {
    var a = Fai.top.$("#module" + d + "FlBtn");
    var c = Fai.top.$("#module" + d);
    c.find(".J_floatBtnBox").attr("class", "J_floatBtnBox floatBtnBox floatBtnStyle" + b);
    Site.getModuleAttrData(d).changed = true;
    Fai.top._floatBtn["_floatBtnData" + d].bns = b;
    Site.styleChanged()
};
Site.setFlBtnSizeType = function(d, c) {
    var a = Fai.top.$("#module" + d + "FlBtn");
    var b = Fai.top.$("#module" + d);
    if (c.t == 0) {
        a.css({
            width: "",
            height: ""
        });
        b.css("width", a.outerWidth() + "px")
    } else {
        a.css({
            width: c.w + "px",
            height: c.h + "px",
            lineHeight: c.h + "px"
        });
        if (Site.checkFloatBtnStatus("module" + d)) {
            b.css("width", c.w + "px")
        } else {
            b.css("width", "100%")
        }
    }
    Site.setFlBtnHasBannerModuleHeight(d);
    a.css("lineHeight", a.height() + "px");
    Site.setFlBtnResizeHandleSize(b);
    Site.getModuleAttrData(d).changed = true;
    Site.styleChanged()
};
Site.setFlBtnBgType = function(h, e) {
    var b = Fai.top.$("#module" + h + "FlBtn");
    if (e.t == 0) {
        b.css("background", "")
    } else {
        var a = e.c;
        if (e.p != undefined) {
            var d = e.r;
            if (d != -1) {
                var f = "";
                var c = "";
                if (d == 0) {
                    c = "no-repeat"
                }
                if (d == 1 || d == 11 || d == 12) {
                    c = "repeat-x"
                }
                if (d == 2 || d == 21 || d == 22) {
                    c = "repeat-y"
                }
                if (d == 3) {
                    c = "repeat"
                }
                var g = "center";
                if (d == 11) {
                    g = "top"
                }
                if (d == 12) {
                    g = "bottom"
                }
                if (d == 21) {
                    g = "left"
                }
                if (d == 22) {
                    g = "right"
                }
                f += c + " " + g;
                a += " url(" + e.p + ") " + f
            }
        }
        b.css("background", a)
    }
    Site.getModuleAttrData(h).changed = true;
    Site.styleChanged()
};
Site.setFlBtnRadiusType = function(c, b) {
    var a = Fai.top.$("#module" + c + "FlBtn");
    if (b.t == 0) {
        a.css({
            "-moz-border-radius": "",
            "-webkit-border-radius": "",
            "border-radius": ""
        })
    } else {
        if (b.t == 1) {
            a.css({
                "-moz-border-radius": 0,
                "-webkit-border-radius": 0,
                "border-radius": 0
            })
        } else {
            a.css({
                "-moz-border-radius": +b.lt + "px " + b.rt + "px " + b.rb + "px " + b.lb + "px",
                "-webkit-border-radius": +b.lt + "px " + b.rt + "px " + b.rb + "px " + b.lb + "px",
                "border-radius": +b.lt + "px " + b.rt + "px " + b.rb + "px " + b.lb + "px"
            })
        }
    }
    Site.getModuleAttrData(c).changed = true;
    Site.styleChanged()
};
Site.setFlBtnShadowType = function(d, b) {
    var a = Fai.top.$("#module" + d + "FlBtn");
    if (b.t == 0) {
        a.css({
            "-webkit-box-shadow": "",
            "-moz-box-shadow": "",
            "box-shadow": ""
        })
    } else {
        if (b.t == 1) {
            a.css({
                "-webkit-box-shadow": "none",
                "-moz-box-shadow": "none",
                "box-shadow": "none"
            })
        } else {
            var c = b.dx + "px " + b.dy + "px " + b.f + "px " + b.c;
            a.css({
                "-webkit-box-shadow": c,
                "-moz-box-shadow": c,
                "box-shadow": c
            })
        }
    }
    Site.getModuleAttrData(d).changed = true;
    Site.styleChanged()
};
Site.setFlBtnBorderType = function(c, b) {
    var a = Fai.top.$("#module" + c + "FlBtn");
    if (b.t == 0) {
        a.css("border", "")
    } else {
        if (b.t == 1) {
            a.css("border", "none")
        } else {
            a.css("border", b.w + "px solid " + b.c)
        }
    }
    Site.getModuleAttrData(c).changed = true;
    Site.styleChanged()
};
Site.setFlBtnWidthChange = function(d, c) {
    var a = Fai.top.$("#module" + d + "FlBtn"),
    b = Fai.top.$("#module" + d);
    a.css("width", c + "px");
    if (Site.checkFloatBtnStatus("module" + d)) {
        b.css("width", a.outerWidth() + "px")
    } else {
        b.css("width", "100%")
    }
    Site.setFlBtnResizeHandleSize(b);
    Site.getModuleAttrData(d).changed = true;
    Site.styleChanged()
};
Site.setFlBtnHeightChange = function(d, a) {
    var b = Fai.top.$("#module" + d + "FlBtn");
    var c = Fai.top.$("#module" + d);
    b.css({
        height: a + "px",
        lineHeight: a + "px"
    });
    Site.setFlBtnHasBannerModuleHeight(d);
    b.css("lineHeight", b.height() + "px");
    Site.setFlBtnResizeHandleSize(c);
    Site.getModuleAttrData(d).changed = true;
    Site.styleChanged()
};
Site.setFlBtnBgChange = function(h, e) {
    var b = Fai.top.$("#module" + h + "FlBtn");
    var a = e.c;
    if (e.p != undefined) {
        var c = e.r;
        if (c != -1) {
            var f = "";
            var d = "";
            if (c == 0 || c == 6 || c == 7 || c == 8 || c == 9 || c == 13 || c == 14 || c == 15 || c == 16) {
                d = "no-repeat"
            }
            if (c == 1 || c == 11 || c == 12) {
                d = "repeat-x"
            }
            if (c == 2 || c == 21 || c == 22) {
                d = "repeat-y"
            }
            if (c == 3) {
                d = "repeat"
            }
            if (c == 4 || c == 5) {
                d = "repeat"
            }
            var g = "center";
            if (c == 9 || c == 12) {
                g = "bottom"
            }
            if (c == 6 || c == 21) {
                g = "left"
            }
            if (c == 7 || c == 22) {
                g = "right"
            }
            if (c == 4 || c == 5 || c == 8 || c == 11) {
                g = "top"
            }
            if (c == 13) {
                g = "left top"
            }
            if (c == 14) {
                g = "right top"
            }
            if (c == 15) {
                g = "left bottom"
            }
            if (c == 16) {
                g = "right bottom"
            }
            f += d + " " + g;
            a += " url(" + e.p + ") " + f
        }
    }
    b.css("background", a);
    Site.getModuleAttrData(h).changed = true;
    Site.styleChanged()
};
Site.setFlBtnRadiusChange = function(c, b) {
    var a = Fai.top.$("#module" + c + "FlBtn");
    a.css({
        "-moz-border-radius": +b.lt + "px " + b.rt + "px " + b.rb + "px " + b.lb + "px",
        "-webkit-border-radius": +b.lt + "px " + b.rt + "px " + b.rb + "px " + b.lb + "px",
        "border-radius": +b.lt + "px " + b.rt + "px " + b.rb + "px " + b.lb + "px"
    });
    Site.getModuleAttrData(c).changed = true;
    Site.styleChanged()
};
Site.setFlBtnShadowChange = function(d, b) {
    var a = Fai.top.$("#module" + d + "FlBtn");
    var c = b.dx + "px " + b.dy + "px " + b.f + "px " + b.c;
    a.css({
        "-webkit-box-shadow": c,
        "-moz-box-shadow": c,
        "box-shadow": c
    });
    Site.getModuleAttrData(d).changed = true;
    Site.styleChanged()
};
Site.setFlBtnBorderChang = function(c, b) {
    var a = Fai.top.$("#module" + c + "FlBtn");
    a.css("border", b.w + "px solid " + b.c);
    Site.getModuleAttrData(c).changed = true;
    Site.styleChanged()
};
Site.toRgba = function(c, b) {
    if (c.charAt(0) == "#") {
        if (c.length == 7) {
            c = c.substring(1, 7);
            return "rgba(" + parseInt(c.substring(0, 2), 16) + "," + parseInt(c.substring(2, 4), 16) + "," + parseInt(c.substring(4, 6), 16) + "," + b + ")"
        } else {
            c = c.substring(1, 4);
            return "rgba(" + parseInt(c.substring(0, 1), 16) + "," + parseInt(c.substring(1, 2), 16) + "," + parseInt(c.substring(2, 3), 16) + "," + b + ")"
        }
    }
    return c
};
Site.loadPageChange = function(a) {
    $("#cancel").faiButton("enable");
    Site.unSave = false;
    if (typeof a.btnID == "undefined") {
        a.btnID = "save"
    }
    if (typeof a != "undefined") {
        Site.setPageChange(false, a.popupID, a.btnID)
    }
    $(window).bind("beforeunload",
    function() {
        if (Site.unSave) {
            return "您的修改尚未保存，确定要离开吗？"
        }
    });
    $(":input").each(function(d, c) {
        var f = $(c);
        var b = f.attr("id");
        if (b && typeof a != "undefined" && typeof a.unBindId != "undefined") {
            var e = false;
            $.each(a.unBindId,
            function(g, h) {
                if (b == h) {
                    e = true;
                    return false
                }
            });
            if (e) {
                return true
            }
        }
        if (typeof a != "undefined" && a.unBindClass != "undefined") {
            var e = false;
            $(a.unBindClass).each(function(g, h) {
                if (f.hasClass(h)) {
                    e = true;
                    return false
                }
            });
            if (e) {
                return true
            }
        }
        if (f.attr("type") == "radio" || f.attr("type") == "checkbox") {
            f.bind("click",
            function() {
                Site.setPageChange(true, a.popupID, a.btnID)
            })
        } else {
            f.bind("change",
            function() {
                Site.setPageChange(true, a.popupID, a.btnID)
            });
            f.bind("keyup",
            function() {
                Site.setPageChange(true, a.popupID, a.btnID)
            })
        }
    })
};
Site.setPageChange = function(b, a, c) {
    if (typeof c == "undefined") {
        c = "save"
    }
    Site.unSave = b;
    if (typeof a == "undefined") {
        return
    }
    if ($("#" + c).length > 0) {
        if (b) {
            $("#" + c).faiButton("enable")
        } else {
            $("#" + c).faiButton("disable")
        }
    } else {
        Fai.setPopupWindowChange(a, b);
        Fai.enablePopupWindowBtn(a, c, b)
    }
};
Site.getPageChange = function() {
    return Site.unSave
};
Site.showTip = function(a, b) {
    if (!a.tid) {
        return
    }
    if (!Site.getCookieFlag(b)) {
        a.closeSwitch = true;
        a.beforeClose = function() {
            Site.setCookieFlag(b, true)
        };
        Fai.showTip(a)
    }
};
Site.closeTip = function(b, a) {
    Fai.closeTip(b)
};
Site.replaceDocumentwrite = function(b) {
    var a = b.find("script");
    a.each(function() {
        var c = $(this).html().replace("document.write", "void");
        $(this).html(c)
    })
};
Site.replaceDocumentwriteText = function(b) {
    var a = b.replace(/(.*?<script[\s\S]*?)document\.write([\s\S]*?<\/script>.*?)/gi, "$1void$2");
    return a
};
Site.sortable = function() {
    var b = false;
    var c = false;
    $(".column").sortable("destroy");
    $(".column").sortable({
        connectWith: ".column:visible,.formTabButtonList,.formTabButtonYList,.formTabContent,.fullmeasureContent:visible",
        items: '.form:not(".formUnsortable, .formStyle80")',
        cancel: 'input, textarea, select, .formUnsortable, embed[type="application/x-shockwave-flash"], object[type="application/x-shockwave-flash"], .addNewModule',
        distance: 3,
        handle: ".faiHandle",
        placeholder: "g_middlePlaceholder",
        tolerance: "pointer",
        zIndex: 30,
        dropOnEmpty: true,
        scrollSensitivity: 100,
        beforeStart: function(d, k) {
            Site.disableEditLayer();
            Fai.stopInterval(null);
            Fai.top.$("body").disableSelection();
            var l = parseInt($(k.item).attr("_inmulmcol")) || 0;
            var i = parseInt($(k.item).attr("_intab")) || 0;
            var f = parseInt($(k.item).attr("_infullmeasure")) || 0;
            if (Fai.top.dragToAddModule) {
                Fai.top.dragInSortable = true;
                if ($.inArray("column", Fai.top.inSortableList) < 0) {
                    Fai.top.inSortableList.push("column")
                }
            } else {
                Fai.top.originSortable = "column"
            }
            var h = k.item;
            if (h.hasClass("formStyle35") || h.hasClass("panelModuleIcon_mulModuleCol")) {
                $(".mulMColList").sortable("option", "disabled", true);
                $(".mulMColList .form").addClass("formUnsortable");
                $(".mulMColList").removeClass("column");
                $(".formTabButtonList").sortable("option", "disabled", true);
                $(".formTabButtonYList").sortable("option", "disabled", true);
                $(".formTabContent").sortable("option", "disabled", true);
                $(".formTab").sortable("option", "disabled", true)
            }
            if (h.hasClass("formStyle29") || h.hasClass("panelModuleIcon_tab")) {
                $(".formTabButtonList").sortable("option", "disabled", true);
                $(".formTabButtonYList").sortable("option", "disabled", true);
                $(".formTabContent").sortable("option", "disabled", true);
                $(".formTab").sortable("option", "disabled", true)
            }
            if (!Fai.top.dragToAddModule) {
                if (l > 0) {
                    Fai.top.Site.getModuleAttrData(l).changed = true
                } else {
                    if (i > 0) {
                        Fai.top.Site.getModuleAttrData(i).changed = true
                    } else {
                        if (f > 0) {
                            Fai.top.Site.getModuleAttrData(f).changed = true
                        }
                    }
                }
                if (i >= 0) {
                    $(".formTabCntId").sortable("option", "disabled", true);
                    $(".formTabCntId .form").addClass("formUnsortable");
                    $(".formMiddleContent" + i).addClass("formContentOverflow")
                }
                $(".column").each(function() {
                    var m = $(this);
                    if (m.find(".form").length == 0) {
                        m.data("_sortabletmpForm", $("<div class='form column tmpForm' style='width:100%;height:10px;background:none;border:none;padding:0;margin:0;'></div>").appendTo(m))
                    } else {
                        if (k.item.parent().attr("id") == m.attr("id")) {
                            if (k.item.parent().find(".form").length < 2) {
                                if (!m.data("_sortabletmpForm")) {
                                    m.data("_sortabletmpForm", $("<div class='form column tmpForm' style='width:100%;height:10px;background:none;border:none;padding:0;margin:0;'></div>").appendTo(m))
                                }
                            }
                        }
                    }
                })
            }
            $(".column .form").each(function() {
                var m = $(this);
                m.css("filter", "filter: alpha(opacity=80)");
                m.css("opacity", "0.8")
            });
            $(".column .form, .floatForms .form, .absForms .form").each(function() {
                if ($(this).hasClass("formStyle35")) {
                    $(this).find(".form .formTab").removeClass("column")
                }
            });
            if (Fai.top.dragToAddModule) {
                $(".formTabButtonList").sortable("option", "disabled", true);
                $(".formTabButtonYList").sortable("option", "disabled", true);
                $(".formTabContent").sortable("option", "disabled", true);
                $(".formTab").sortable("option", "disabled", true);
                $(".mulMColList").sortable("option", "placeholder", "noPlaceholder")
            }
            if (!Fai.top.dragToAddModule) {
                var e = $(".faiHandle");
                if (e.length > 0 && $(e[0]).height() > 0) {
                    h.height($(e[0]).height() + "px")
                }
                var g = Site.getLayoutFormsById(h.parent().attr("id"));
                if (l == 0 && i == 0 && h.siblings().length < 2) {
                    Site.addAddModuleButton(g, true)
                }
            }
            var j = $("#container").height() + 28;
            $("#leftForms").css({
                height: j + "px"
            });
            if ($("#centerBottomForms").is(":visible")) {
                $("#centerBottomForms").css({
                    height: (j - $("#centerTopForms").height() - $(".containerFormsCenterMiddle").height()) + "px"
                })
            } else {
                if ($("#middleLeftForms").is(":visible") || $("#middleRightForms").is(":visible")) {
                    $(".containerFormsCenterMiddle").css({
                        height: (j - $("#centerTopForms").height()) + "px"
                    });
                    $("#middleLeftForms").css({
                        height: "100%"
                    });
                    $("#middleRightForms").css({
                        height: "100%"
                    })
                } else {
                    $("#centerTopForms").css({
                        height: j + "px"
                    })
                }
            }
            $("#rightForms").css({
                height: j + "px"
            });
            $(".formTab").sortable("option", "disabled", true)
        },
        start: function(d, e) {
            Fai.top.$("body").disableSelection();
            Fai.top.$("#middleLeftFormsHider").remove()
        },
        sort: function(d, n) {
            var q = $(".g_middlePlaceholder");
            var r = q.parent();
            if (!Fai.top.dragToAddModule) {
                var g = q.parents(".form"),
                s = $(".formTabButtonList"),
                t = $(".formTabButtonYList"),
                o = $(".formTabCntId");
                if (s.find(".g_middlePlaceholder").length > 0) {
                    q.addClass("g_middlePlaceholder2")
                } else {
                    q.removeClass("g_middlePlaceholder2")
                }
                if (t.find(".g_middlePlaceholder").length > 0) {
                    q.addClass("g_middlePlaceholder2")
                } else {
                    q.removeClass("g_middlePlaceholder2")
                }
                if (o.find(".g_middlePlaceholder").length > 0) {
                    q.addClass("g_middlePlaceholder2")
                } else {
                    q.removeClass("g_middlePlaceholder2")
                }
                var l = r.children();
                if (!q.hasClass(".g_middlePlaceholder2") && !q.hasClass(".g_middlePlaceholder3")) {
                    if (l.last().hasClass("g_middlePlaceholder")) {
                        var j = 0;
                        $.each(l,
                        function(h, u) {
                            if (!$(u).hasClass("g_middlePlaceholder")) {
                                j += $(u).height() + parseInt($(u).css("marginTop")) + parseInt($(u).css("marginBottom"))
                            }
                        });
                        q.css({
                            "min-height": "60px",
                            height: (r.height() - j - 60) + "px"
                        });
                        b = true
                    } else {
                        q.css({
                            height: "60px"
                        });
                        b = false
                    }
                }
                if ( !! $(this).data("addNewModuleBtn")) {
                    $(this).data("addNewModuleBtn").show();
                    $(this).data("addNewModuleBtn", false)
                }
                if (r.hasClass("mulMColList") && !q.hasClass(".g_middlePlaceholder3")) {
                    var k = n.placeholder.siblings(".addNewModule");
                    if (k.length > 0) {
                        n.placeholder.css({
                            height: k.height() + "px"
                        });
                        $(this).data("addNewModuleBtn", k);
                        k.hide()
                    } else {
                        if (n.placeholder.next().not(".tmpForm").length < 1) {
                            var e = n.placeholder.parents(".mulMColContent");
                            var i = (e.offset().top + e.height() - n.placeholder.offset().top - 6) || 26;
                            if (i < 60) {
                                i = 60
                            }
                            n.placeholder.css({
                                height: i + "px"
                            })
                        }
                    }
                }
            } else {
                var m = Fai.top.$("#g_main").find(".g_middlePlaceholder");
                if (m.length > 1) {
                    m.not(n.placeholder).hide();
                    n.placeholder.show()
                }
            }
            if (q.hasClass("g_middlePlaceholder2")) {
                q.css({
                    height: "26px",
                    minHeight: "26px"
                })
            }
            if (r.hasClass("formTabButtonYList")) {
                r.find(".addNewModule").remove();
                q.attr("style", "").removeClass("formTabListSortPlaceholder").addClass("formTabYListSortPlaceholder")
            } else {
                if (r.hasClass("formTabButtonList")) {
                    q.attr("style", "").removeClass("formTabYListSortPlaceholder").addClass("formTabListSortPlaceholder")
                } else {
                    q.removeClass("formTabListSortPlaceholder formTabYListSortPlaceholder");
                    q.css({
                        width: "98%",
                        "float": "none"
                    })
                }
            }
            var p = q.height() || 26;
            q.css({
                lineHeight: p + "px"
            });
            q.html("放在这里");
            if (r.hasClass("formTabContent")) {
                var f = "formTabButtonList" + (r.attr("id").replace("formTabContent", "") || 0);
                Fai.top.$("#" + f).prepend(q)
            }
        },
        beforeStop: function(d, e) {},
        receive: function(f, g) {
            if (Fai.top.dragToAddModule && $.inArray("column", Fai.top.inSortableList) > -1) {
                for (var e = 0,
                d = Fai.top.inSortableList.length; e < d; e++) {
                    if (Fai.top.inSortableList[e] == "column") {
                        Fai.top.inSortableList.splice(e, 1);
                        break
                    }
                }
            }
        },
        update: function(d, e) {
            if (!Fai.top.dragToAddModule && Fai.top.originSortable == "fullmeasureContent") {}
        },
        stop: function(ai, W) {
            if (!Fai.top.dragToAddModule) {
                if (!c) {
                    Site.logClick(34);
                    c = true
                }
                var T = $(W.item).attr("id");
                var t = parseInt(T.replace("module", ""));
                var U = parseInt($(W.item).attr("_inmulmcol")) || 0;
                var d = parseInt($(W.item).attr("_intab")) || 0;
                var x = parseInt($(W.item).attr("_infullmeasure")) || 0;
                var g = "";
                if (d > 0) {
                    g = d
                }
                if (U > 0) {
                    g = U
                }
                Site.enableEditLayer();
                Fai.top.$("body").enableSelection();
                Fai.startInterval(null);
                $(".column .form").each(function() {
                    var h = $(this);
                    h.removeAttr("style")
                });
                $(".column").each(function() {
                    var h = $(this);
                    if (h.data("_sortabletmpForm")) {
                        h.data("_sortabletmpForm").remove()
                    }
                });
                $(".column .form, .floatForms .form, .absForms .form").each(function() {
                    if ($(this).hasClass("formStyle35")) {
                        $(this).find(".form .formTab").addClass("column")
                    }
                });
                Site.refreshForms();
                Site.refreshAllAbsForms();
                Fai.top._moduleMoved++;
                Site.styleChanged();
                var M = parseInt($(W.item).attr("_inmulmcol")) || 0;
                var k = parseInt($(W.item).attr("_intab")) || 0;
                var D = parseInt($(W.item).attr("_infullmeasure")) || 0;
                var P = W.item;
                var R = P.parents(".form");
                if (R.length > 0) {
                    R = R.eq(0)
                }
                var B = R.attr("id");
                if (R.hasClass("formStyle35")) {
                    if (P.hasClass("formStyle35")) {
                        Fai.ing("模块列模块不能插入模块列模块之中", true);
                        return false
                    }
                }
                if (R.hasClass("formStyle29")) {
                    if (P.hasClass("formStyle35")) {
                        Fai.ing("模块列模块不能插入模块组模块之中", true);
                        return false
                    }
                    if (P.hasClass("formStyle29")) {
                        Fai.ing("模块组模块不能插入模块组模块之中", true);
                        return false
                    }
                }
                if (d > 0) {
                    var j = Fai.top.$("#formTabButton" + t).parent();
                    if ($(W.item).parent().attr("id") != ("formTabCntId" + t) || d != k) {
                        if (Fai.top.$("#module" + d).attr("_autoheight") == 1) {
                            Site.autoModuleHeight(d);
                            Fai.top.Site.getModuleAttrPattern(d).changed = true
                        }
                        Fai.top.$("#formTabCntId" + t).remove();
                        Fai.top.$("#formTabButton" + t).remove()
                    }
                    j.find(".formTabButton").first().click()
                }
                var z = false,
                n = "formTabButtonList";
                if ($(W.item).parent().hasClass("formTabButtonYList")) {
                    n = "formTabButtonYList";
                    z = true
                }
                if ((k > 0 || $(W.item).parent().hasClass(n)) && !$(W.item).parent().hasClass("formTabContent")) {
                    var I = Fai.top.$("#module" + t).index();
                    var ah = $(W.item).parent().children(".formTabButton").length;
                    if (I > ah) {
                        I = ah - 1
                    }
                    if ($(W.item).parent().hasClass(n)) {
                        k = parseInt($(W.item).parent().attr("id").replace("formTabButtonList", "")) || k;
                        M = 0;
                        D = 0;
                        $(W.item).attr("_intab", k);
                        $(W.item).attr("_inmulmcol", 0);
                        $(W.item).attr("_infullmeasure", 0);
                        if (I > 0) {
                            Fai.top.$("#formTabContent" + k).children().eq((I - 1)).after($(W.item))
                        } else {
                            Fai.top.$("#formTabContent" + k).prepend($(W.item))
                        }
                    }
                    var l = Fai.encodeHtml($(W.item).find(".titleText").text());
                    l = l.replace(/<br\/>/, "");
                    var v = Fai.top.$("#module" + t).attr("class").split(" "),
                    A,
                    q = false;
                    for (var ab in v) {
                        if (/formStyle*/.test(v[ab])) {
                            A = v[ab].substring(9)
                        }
                    }
                    if (A == 3 || A == 16) {
                        q = true
                    }
                    Fai.top.$("#formTabButton" + t).remove();
                    var Z = [];
                    Z.push("<div class='formTabButton' id='formTabButton" + t + "' tabModuleId='" + t + "' onclick='Site.changeLiCnt(" + t + ", " + q + ", 29)'>");
                    Z.push("<div class='formTabLeft'></div>");
                    Z.push("<div class='formTabMiddle'>");
                    if (z) {
                        Z.push("<span class='tabButtonText'>")
                    }
                    Z.push(l);
                    if (z) {
                        Z.push("</span>")
                    }
                    Z.push("</div>");
                    Z.push("<div class='formTabRight'></div>");
                    Z.push("</div>");
                    var S = Fai.top.$("#formTabButtonList" + k);
                    if (I > 0) {
                        S.children().eq((I - 1)).after(Z.join(""))
                    } else {
                        S.prepend(Z.join(""))
                    }
                    if (S.hasClass("formTabButtonYList") && S.find(".tabYListPlaceholder").length < 1) {
                        S.append($("<td class='tabYListPlaceholder'></td>"))
                    }
                    var ac = 200;
                    var o = top.$("#formTabContent" + t).children(".formTabCntId");
                    if (o.length > 0) {
                        ac = o.first().height()
                    }
                    var J = "";
                    if (ac) {
                        J = " style='height:" + ac + "px !important;'"
                    }
                    if (!Fai.top.$("#module" + t).parent().hasClass("formTabCntId") && !Fai.top.$("#module" + t).hasClass("formTabCntId")) {
                        Fai.top.$("#module" + t).wrap("<div class='formTabCntId' id='formTabCntId" + t + "'" + J + "></div>")
                    }
                    Fai.top.Site.bindInTabSwitch()
                }
                if ($(W.item).parent().hasClass("formTabContent")) {
                    var f = $(W.item).parent().attr("id"),
                    G = parseInt(f.replace("formTabContent", ""));
                    Site.getModuleAttrData(G).changed = true;
                    Site.addModuleCallBackForTab(t, 1, null, f, [], 0, 200);
                    Fai.top.Site.bindInTabSwitch()
                }
                Site.dockModuleResize(P);
                if (k > 0 && R.attr("_autoheight") == "1") {
                    Site.autoModuleHeight(k);
                    Fai.top.Site.getModuleAttrPattern(k).changed = true
                }
                if (d > 0) {
                    Fai.top.Site.getModuleAttrData(d).changed = true;
                    if (Fai.top.$("#module" + d).attr("_inmulmcol") > 0) {
                        Fai.top.Site.getModuleAttrData(Fai.top.$("#module" + d).attr("_inmulmcol")).changed = true
                    }
                }
                if (U > 0) {
                    Fai.top.Site.getModuleAttrData(U).changed = true;
                    if (Fai.top.$("#module" + U).attr("_infullmeasure") > 0) {
                        Fai.top.Site.getModuleAttrData(Fai.top.$("#module" + U).attr("_infullmeasure")).changed = true
                    }
                }
                if (x > 0) {
                    Fai.top.Site.getModuleAttrData(x).changed = true
                }
                if (k > 0) {
                    Fai.top.Site.getModuleAttrData(k).changed = true;
                    if (Fai.top.$("#module" + k).attr("_infullmeasure") > 0) {
                        Fai.top.Site.getModuleAttrData(Fai.top.$("#module" + k).attr("_infullmeasure")).changed = true
                    }
                    $(W.item).removeClass("formInMulMCol").addClass("formInTab");
                    Site.dockModuleResize(R)
                }
                if (M > 0) {
                    Fai.top.Site.getModuleAttrData(M).changed = true;
                    if (Fai.top.$("#module" + M).attr("_infullmeasure") > 0) {
                        Fai.top.Site.getModuleAttrData(Fai.top.$("#module" + M).attr("_infullmeasure")).changed = true
                    }
                    $(W.item).removeClass("formInTab").addClass("formInMulMCol");
                    Site.dockModuleResize(R)
                }
                if (D > 0) {
                    Fai.top.Site.getModuleAttrData(D).changed = true;
                    if ($(W.item).hasClass("formStyle35") || $(W.item).hasClass("formStyle29")) {
                        Fai.top.Site.getModuleAttrData(t).changed = true
                    }
                    $(W.item).removeClass("formInTab formInMulMCol")
                }
                P.removeAttr("style");
                $(".mulMColList").sortable("option", "disabled", false);
                $(".mulMColList").addClass("column");
                $(".formTabCntId").sortable("option", "disabled", false);
                $(".form").removeClass("formUnsortable");
                $(".formTabButtonList").sortable("option", "disabled", false);
                $(".formTabButtonYList").sortable("option", "disabled", false);
                $(".formTabContent").sortable("option", "disabled", false);
                $(".formTab").sortable("option", "disabled", false);
                $(".column").sortable("refreshPositions");
                $("#module" + t).trigger("Fai_onModuleLayoutChange");
                var K = P.data("posId");
                var r = P.parent().attr("id");
                if (K != r) {
                    var u = Fai.top.Site.getModuleAttrPattern(t);
                    u.outside.y = 0;
                    u.changed = true;
                    Site.removeModuleStyleCssList(t, [{
                        cls: "",
                        key: "padding"
                    },
                    {
                        cls: "",
                        key: "margin-right"
                    },
                    {
                        cls: "",
                        key: "margin-left"
                    },
                    {
                        cls: "",
                        key: "margin-top"
                    },
                    {
                        cls: "",
                        key: "margin-bottom"
                    }]);
                    Fai.top.Site.styleChanged()
                }
                if (P.attr("_autoheight") > 0) {
                    Site.autoModuleHeight(t)
                }
                if (!Site.getCookieFlag(36)) {
                    Site.logDog(100049, 0);
                    Site.setCookieFlag(36, true)
                }
                if (P.hasClass("formStyle1")) {
                    var ag = P.find("img.richModuleSlaveImg");
                    Site.richModuleSlaveImgResize(ag);
                    Site.richModulePicEdit(ag)
                }
                if (g != "") {
                    var F = Fai.top.$("#module" + g);
                    if (F && F.find(".form").length < 1) {
                        Site.dockModuleAutoHeight(g);
                        Site.dockModuleResize_disable(F)
                    }
                }
                Site.noCheckCreateMLFH();
                if (W.item.parent().hasClass("mulMColList")) {
                    var p = W.item.parent().attr("id");
                    var L = p.split("_");
                    var C = L[0].replace("mulMCol", "");
                    Site.isMulColModuleInIE("#module" + C)
                }
                if (P.hasClass("formStyle5") || P.hasClass("formStyle77")) {
                    Site.refreshModulePhotoSwitch(t)
                }
                Site.moduleSizeChange(T);
                Site.adjustPhotoCard(t);
                Fai.top.originSortable = "";
                if (d >= 0) {
                    var O = Site.getLayoutFormsById(Fai.top.$("#module" + d).parent().attr("id"));
                    Site.addAddModuleButton(O);
                    $(".formMiddleContent" + d).removeClass("formContentOverflow")
                }
            } else {
                $(".column .form").each(function() {
                    var h = $(this);
                    h.removeAttr("style")
                });
                $(".column").each(function() {
                    var h = $(this);
                    if (h.data("_sortabletmpForm")) {
                        h.data("_sortabletmpForm").remove()
                    }
                });
                $(".column .form, .floatForms .form, .absForms .form").each(function() {
                    if ($(this).hasClass("formStyle35")) {
                        $(this).find(".form .formTab").addClass("column")
                    }
                });
                if ($(this).hasClass("mulMColList")) {
                    return
                }
                if (!c) {
                    Site.logClick(34);
                    c = true
                }
                Fai.top.$("body").enableSelection();
                Site.enableEditLayer();
                Fai.startInterval(null);
                Site.styleChanged();
                var P = W.item;
                var R = P.parents(".form");
                if (R.length > 0) {
                    R = R.eq(0)
                }
                var B = R.attr("id");
                if (R.hasClass("formStyle35")) {
                    if (P.hasClass(" panelModuleIcon_mulModuleCol")) {
                        Fai.ing("模块列模块不能插入模块列模块之中", true);
                        return false
                    }
                }
                if (R.hasClass("formStyle29")) {
                    if (P.hasClass("panelModuleIcon_mulModuleCol")) {
                        Fai.ing("模块列模块不能插入模块组模块之中", true);
                        return false
                    }
                    if (P.hasClass("panelModuleIcon_tab")) {
                        Fai.ing("模块组模块不能插入模块组模块之中", true);
                        return false
                    }
                }
                $(".mulMColList").sortable("option", "disabled", false);
                $(".mulMColList").addClass("column");
                $(".mulMColList").sortable("option", "placeholder", "g_middlePlaceholder");
                $(".formTabCntId").sortable("option", "disabled", false);
                $(".form").removeClass("formUnsortable");
                $(".formTabButtonList").sortable("option", "disabled", false);
                $(".formTabButtonYList").sortable("option", "disabled", false);
                $(".formTabContent").sortable("option", "disabled", false);
                $(".formTab").sortable("option", "disabled", false);
                $(".column").sortable("refreshPositions");
                if (!Site.getCookieFlag(36)) {
                    Site.logDog(100049, 0);
                    Site.setCookieFlag(36, true)
                }
                var e = W.item.prev().attr("id");
                var E = W.item.next().attr("id");
                var Q = W.item.parent();
                var H = Q.find(".noPlaceholder");
                var Y = false;
                if (e) {
                    var y = parseInt(e.replace("module", "")) || -1;
                    Fai.top.addModule_insertBefore = false;
                    Fai.top._appendModule = y;
                    if (!W.item.parent().is(":visible")) {
                        Fai.top._appendModule = -1
                    }
                    Y = true
                } else {
                    if (E) {
                        var V = parseInt(E.replace("module", "")) || -1;
                        Fai.top.addModule_insertBefore = true;
                        Fai.top._appendModule = V;
                        if (!W.item.parent().is(":visible")) {
                            Fai.top._appendModule = -1
                        }
                        Y = true
                    } else {
                        if (Q.hasClass("mulMColList")) {
                            var N = H.prev().attr("id");
                            var ae = H.next().attr("id");
                            if (N) {
                                var y = parseInt(N.replace("module", "")) || -1;
                                Fai.top.addModule_insertBefore = false;
                                Fai.top._appendModule = y
                            } else {
                                if (ae) {
                                    var V = parseInt(ae.replace("module", "")) || -1;
                                    Fai.top.addModule_insertBefore = true;
                                    Fai.top._appendModule = V
                                } else {
                                    Fai.top.addModule_insertBefore = false;
                                    Fai.top._appendModule = -1;
                                    Fai.top._appendArea = Q.attr("id")
                                }
                            }
                            Y = true
                        } else {
                            var af = W.item.siblings(".addNewModule");
                            if (typeof af != "undefined" && af.length > 0) {
                                Fai.top._appendLayout = parseInt(af.attr("layout")) || 2;
                                Fai.top._appendModule = -1;
                                Y = true
                            }
                        }
                    }
                }
                if (Y) {
                    Fai.top.draggableDiv_enable = false;
                    W.item.children().eq(0).trigger("click")
                }
                Site.noCheckCreateMLFH();
                if (Q.hasClass("mulMColList")) {
                    var p = W.item.parent().attr("id");
                    var L = p.split("_");
                    var C = L[0].replace("mulMCol", "");
                    Site.isMulColModuleInIE("#module" + C)
                }
            }
            $("#leftForms").css({
                height: ""
            });
            $("#centerTopForms").css({
                height: ""
            });
            $("#centerBottomForms").css({
                height: ""
            });
            $("#rightForms").css({
                height: ""
            });
            $(".containerFormsCenterMiddle").css({
                height: ""
            });
            $("#middleLeftForms").css({
                height: ""
            });
            $("#middleRightForms").css({
                height: ""
            });
            var aa = W.item.offset().top;
            if (b && aa < 0) {
                var X = $("#g_main").scrollTop();
                var s = $("#memberBar").is(":visible") ? $("#memberBar").height() : 0;
                var ad = X + aa - s - $("#topBar").height() + 10;
                $("#g_main").animate({
                    scrollTop: ad,
                    complete: function() {
                        b = false
                    }
                })
            }
            if (t == 28 || P.hasClass("formStyle51")) {
                Site.memberLoginCompatibility(t)
            }
            if (t == 27) {
                Site.memberSignupCompatibility(t)
            }
        }
    });
    $(".form.formStyle29 .formTabButtonList").sortable("destroy");
    $(".form.formStyle29 .formTabButtonList").sortable({
        items: ".formTabButton",
        axis: "x",
        dropOnEmpty: true,
        stop: function(g, i) {
            var e = i.item;
            var f = e.parents(".form");
            if (f.length > 0) {
                f = f.eq(0)
            }
            var h = f.attr("id");
            if (f.hasClass("formStyle29")) {
                var d = h.replace("module", "");
                Fai.top.Site.getModuleAttrData(d).changed = true
            }
            Fai.top._moduleMoved++;
            Site.styleChanged();
            if (!Fai.top.dragToAddModule) {
                Fai.top.originSortable = ""
            }
        }
    });
    $(".form.formStyle29 .formTabButtonYList").sortable("destroy");
    $(".form.formStyle29 .formTabButtonYList").sortable({
        items: ".formTabButton",
        axis: "y",
        dropOnEmpty: true,
        stop: function(g, i) {
            var e = i.item;
            var f = e.parents(".form");
            if (f.length > 0) {
                f = f.eq(0)
            }
            var h = f.attr("id");
            if (f.hasClass("formStyle29")) {
                var d = h.replace("module", "");
                Fai.top.Site.getModuleAttrData(d).changed = true
            }
            Fai.top._moduleMoved++;
            Site.styleChanged();
            if (!Fai.top.dragToAddModule) {
                Fai.top.originSortable = ""
            }
        }
    });
    var a = "<div id='webContainerCover' class='webContainerCover'></div>";
    Fai.top.$(".fullmeasureContainer").sortable("destroy");
    Fai.top.$(".fullmeasureContainer").sortable({
        connectWith: ".fullmeasureContainer:visible",
        items: ".formStyle80",
        distance: 3,
        handle: ".faiHandle",
        placeholder: "g_middlePlaceholder",
        tolerance: "pointer",
        zIndex: 30,
        opacity: 0.9,
        axis: "y",
        dropOnEmpty: true,
        create: function() {},
        beforeStart: function(e, f) {
            var d = $(this);
            Site.disableEditLayer();
            Fai.stopInterval(null);
            Fai.top.$("body").disableSelection();
            if (Fai.top.dragToAddModule) {
                Fai.top.dragInSortable = true;
                if ($.inArray("fullmeasureContainer", Fai.top.inSortableList) < 0) {
                    Fai.top.inSortableList.push("fullmeasureContainer")
                }
            } else {
                Fai.top.originSortable = "fullmeasureContainer"
            }
            $(".fullmeasureContainer").each(function() {
                var g = $(this);
                if (g.children(".form").length < 1) {
                    g.data("_sortabletmpForm", $("<div class='form' style='width:100%;height:10px;background:none;border:none;padding:0;margin:0;'></div>").appendTo(g))
                }
            });
            if (!Fai.top.dragToAddModule && d.children(".form").length == 1) {
                if (!d.data("_sortabletmpForm")) {
                    d.data("_sortabletmpForm", $("<div class='form' style='width:100%;height:10px;background:none;border:none;padding:0;margin:0;'></div>").appendTo(d))
                }
            }
        },
        start: function(d, e) {
            if (Fai.top.$("#webContainerCover").length < 1) {
                Fai.top.$("#webContainer").addClass("webContainer-disabled").append(a)
            }
            $(this).sortable("refreshPositions")
        },
        sort: function(e, f) {
            var g = $(".g_middlePlaceholder");
            var d = g.height() || 26;
            g.css({
                lineHeight: d + "px"
            });
            g.html("放在这里")
        },
        receive: function(f, g) {
            if (Fai.top.dragToAddModule && $.inArray("fullmeasureContainer", Fai.top.inSortableList) > -1) {
                for (var e = 0,
                d = Fai.top.inSortableList.length; e < d; e++) {
                    if (Fai.top.inSortableList[e] == "fullmeasureContainer") {
                        Fai.top.inSortableList.splice(e, 1);
                        break
                    }
                }
            }
        },
        stop: function(i, j) {
            Fai.top.$("#webContainer").removeClass("webContainer-disabled");
            Fai.top.$("#webContainerCover").remove();
            $(".fullmeasureContainer").each(function() {
                var k = $(this);
                if (k.data("_sortabletmpForm")) {
                    k.data("_sortabletmpForm").remove()
                }
            });
            Site.enableEditLayer();
            Fai.top.$("body").enableSelection();
            Fai.startInterval(null);
            if (Fai.top.dragToAddModule) {
                Fai.top._appendLayout = Site.getLayoutFormsById($(this).attr("id"));
                var f = j.item.prev().attr("id");
                var e = j.item.next().attr("id");
                if (f) {
                    var g = parseInt(f.replace("module", ""));
                    Fai.top.addModule_insertBefore = false;
                    Fai.top._appendModule = g
                } else {
                    if (e) {
                        var d = parseInt(e.replace("module", ""));
                        Fai.top.addModule_insertBefore = true;
                        Fai.top._appendModule = d
                    } else {
                        Fai.top._appendLayout = Site.getLayoutFormsById($(this).attr("id"));
                        Fai.top._appendModule = -1
                    }
                }
                j.item.children().eq(0).trigger("click");
                Fai.top.draggableDiv_enable = false
            }
            if (!Fai.top.dragToAddModule) {
                Site.refreshForms();
                Site.refreshAllAbsForms();
                Fai.top._moduleMoved++;
                Site.styleChanged();
                var h = $(j.item).attr("id");
                Site.scrollToModuleDiv(Fai.top.$("#" + h));
                Fai.top.originSortable = ""
            }
        },
        update: function() {}
    });
    Fai.top.$(".fullmeasureContent").each(function(d, e) {
        Site.inFullmeasureModuleSortable($(e).attr("id"))
    })
};
Site.inFullmeasureModuleSortable = function(a) {
    Fai.top.$("#" + a).sortable("destroy");
    Fai.top.$("#" + a).sortable({
        connectWith: ".column:visible, .fullmeasureContent, .formTabButtonList, .formTabButtonYList, .formTabContent",
        items: '.form:not(".formUnsortable, .formStyle80 ")',
        cancel: 'input, textarea, select, .formUnsortable, embed[type="application/x-shockwave-flash"], object[type="application/x-shockwave-flash"], .addNewModule',
        distance: 3,
        handle: ".faiHandle",
        placeholder: "g_middlePlaceholder",
        tolerance: "pointer",
        zIndex: 30,
        opacity: 0.9,
        dropOnEmpty: true,
        create: function() {},
        beforeStart: function(b, h) {
            Fai.top.$("#g_main").find(".g_middlePlaceholder").remove();
            var j = $(this);
            Site.disableEditLayer();
            Fai.stopInterval(null);
            Fai.top.$("body").disableSelection();
            var i = parseInt($(h.item).attr("_inmulmcol")) || 0;
            var g = parseInt($(h.item).attr("_intab")) || 0;
            var d = parseInt($(h.item).attr("_infullmeasure")) || 0;
            if (Fai.top.dragToAddModule) {
                Fai.top.dragInSortable = true;
                if ($.inArray("fullmeasureContent", Fai.top.inSortableList) < 0) {
                    Fai.top.inSortableList.push("fullmeasureContent")
                }
            } else {
                Fai.top.originSortable = "fullmeasureContent"
            }
            var f = h.item;
            if (f.hasClass("formStyle35") || f.hasClass("panelModuleIcon_mulModuleCol")) {
                $(".mulMColList").sortable("option", "disabled", true);
                $(".mulMColList .form").addClass("formUnsortable");
                $(".mulMColList").removeClass("column");
                $(".formTabButtonList").sortable("option", "disabled", true);
                $(".formTabButtonYList").sortable("option", "disabled", true);
                $(".formTabContent").sortable("option", "disabled", true);
                $(".formTab").sortable("option", "disabled", true)
            }
            if (f.hasClass("formStyle29") || f.hasClass("panelModuleIcon_tab")) {
                $(".formTabButtonList").sortable("option", "disabled", true);
                $(".formTabButtonYList").sortable("option", "disabled", true);
                $(".formTab").sortable("option", "disabled", true)
            }
            if (!Fai.top.dragToAddModule) {
                if (i > 0) {
                    Fai.top.Site.getModuleAttrData(i).changed = true
                } else {
                    if (g > 0) {
                        Fai.top.Site.getModuleAttrData(g).changed = true
                    } else {
                        if (d > 0) {
                            Fai.top.Site.getModuleAttrData(d).changed = true
                        }
                    }
                }
                if (g >= 0) {
                    $(".formTabCntId").sortable("option", "disabled", true);
                    $(".formTabCntId .form").addClass("formUnsortable")
                }
            }
            if (Fai.top.dragToAddModule) {
                $(".formTabCntId").sortable("option", "disabled", true);
                $(".formTabCntId .form").addClass("formUnsortable");
                $(".formTabButtonList").sortable("option", "disabled", true);
                $(".formTabButtonYList").sortable("option", "disabled", true);
                $(".formTabContent").sortable("option", "disabled", true);
                $(".formTab").sortable("option", "disabled", true);
                $(".mulMColList").sortable("option", "placeholder", "noPlaceholder")
            }
            if (!Fai.top.dragToAddModule) {
                var c = $(".faiHandle");
                if (c.length > 0 && $(c[0]).height() > 0) {
                    f.height($(c[0]).height() + "px")
                }
                var e = Site.getLayoutFormsById(f.parent().attr("id"));
                if (f.attr("_intab") == 0 && f.attr("_inmulmcol") == 0 && f.siblings().length < 2) {
                    Site.addAddModuleButton(e, true)
                }
            }
            $(".fullmeasureContent").each(function(k, l) {
                if ($(l).children(".form").length == 0) {
                    $(l).data("_sortabletmpForm", $("<div class='form tmpForm' style='width:100%;height:50px;background:none;border:none;padding:0;margin:0;'></div>").prependTo($(l)))
                }
            });
            if (!Fai.top.dragToAddModule && j.children(".form").length == 1) {
                if (!j.data("_sortabletmpForm")) {
                    j.data("_sortabletmpForm", $("<div class='form tmpForm' style='width:100%;height:50px;background:none;border:none;padding:0;margin:0;'></div>").prependTo(j))
                }
            }
        },
        start: function(b, c) {
            Fai.top.$("body").disableSelection();
            Fai.top.$("#middleLeftFormsHider").remove()
        },
        sort: function(d, f) {
            if (!Fai.top.dragToAddModule) {
                var e = $(".g_middlePlaceholder").parents(".form");
                if (e.hasClass("formStyle29")) {
                    $(".g_middlePlaceholder").addClass("g_middlePlaceholder2")
                } else {
                    $(".g_middlePlaceholder").removeClass("g_middlePlaceholder2")
                }
            } else {
                var b = Fai.top.$("#g_main").find(".g_middlePlaceholder");
                if (b.length > 1) {
                    b.not(f.placeholder).hide();
                    f.placeholder.show()
                }
            }
            var g = $(".g_middlePlaceholder");
            var c = g.height() || 26;
            g.css({
                lineHeight: c + "px"
            });
            g.html("放在这里")
        },
        receive: function(d, e) {
            if (Fai.top.dragToAddModule && $.inArray("fullmeasureContent", Fai.top.inSortableList) > -1) {
                for (var c = 0,
                b = Fai.top.inSortableList.length; c < b; c++) {
                    if (Fai.top.inSortableList[c] == "fullmeasureContent") {
                        Fai.top.inSortableList.splice(c, 1);
                        break
                    }
                }
            }
        },
        update: function(c, d) {
            if (!Fai.top.dragToAddModule && Fai.top.originSortable == "column") {
                var b = $(d.item);
                if (b.data("_sortabletmpForm")) {
                    b.data("_sortabletmpForm").remove()
                }
                b.css("opacity", b.data("_sortableopacity"));
                b.css("filter", b.data("_sortablefilter"));
                if (b.hasClass("formStyle35")) {
                    b.find(".form .formTab").addClass("column");
                    b.find(".form").each(function(e, f) {
                        $(f).css("opacity", $(f).data("_sortableopacity"));
                        $(f).css("filter", $(f).data("_sortablefilter"))
                    })
                }
                if (b.hasClass("formStyle29")) {
                    b.find(".J_tabHandle").remove()
                } else {
                    if (b.hasClass("formStyle35")) {
                        b.find(".J_multiHandle").remove()
                    } else {
                        if (b.hasClass("formStyle80")) {
                            b.find(".J_fullmeasureHandle").remove()
                        } else {
                            b.find(".J_handle").remove()
                        }
                    }
                }
            }
        },
        stop: function(ac, S) {
            if (!S.placeholder) {
                return
            }
            $(".fullmeasureContent").each(function(i, ad) {
                if ($(ad).data("_sortabletmpForm")) {
                    $(ad).data("_sortabletmpForm").remove()
                }
            });
            Site.enableEditLayer();
            Fai.top.$("body").enableSelection();
            Fai.startInterval(null);
            if (Fai.top.dragToAddModule) {
                var c = S.item.prev().attr("id");
                var z = S.item.next().attr("id");
                var L = S.item.parent();
                var B = L.find(".noPlaceholder");
                if (L.hasClass("fullmeasureContent")) {
                    var J = S.item.prev();
                    var T = Fai.top.$("#module" + J.attr("_infullmeasure"));
                    if (T.length > 0 && T.attr("_autoheight") == 0 && J) {
                        var r = T.offset().top;
                        var V = T.height();
                        var W = r + V;
                        var p = J.offset().top;
                        var O = J.height();
                        var I = p + O;
                        if (I >= W) {
                            var X = false;
                            L.children(".form").each(function(i, ad) {
                                if (($(ad).offset().top + $(ad).height()) < W) {
                                    c = $(ad).attr("id");
                                    X = true
                                } else {
                                    return true
                                }
                            });
                            if (!X) {
                                z = L.children(".form").first().attr("id");
                                c = ""
                            }
                        }
                    }
                }
                if (c) {
                    var t = parseInt(c.replace("module", "")) || -1;
                    Fai.top.addModule_insertBefore = false;
                    Fai.top._appendModule = t
                } else {
                    if (z) {
                        var R = parseInt(z.replace("module", "")) || -1;
                        Fai.top.addModule_insertBefore = true;
                        Fai.top._appendModule = R
                    } else {
                        if (L.hasClass("mulMColList")) {
                            var H = B.prev().attr("id");
                            var aa = B.next().attr("id");
                            if (H) {
                                var t = parseInt(H.replace("module", "")) || -1;
                                Fai.top.addModule_insertBefore = false;
                                Fai.top._appendModule = t
                            } else {
                                if (aa) {
                                    var R = parseInt(aa.replace("module", "")) || -1;
                                    Fai.top.addModule_insertBefore = true;
                                    Fai.top._appendModule = R
                                } else {
                                    Fai.top.addModule_insertBefore = false;
                                    Fai.top._appendModule = -1;
                                    Fai.top._appendArea = L.attr("id")
                                }
                            }
                        } else {
                            Fai.top._appendModule = -1;
                            if (L.hasClass("mulMColList")) {
                                Fai.top._appendArea = L.attr("id")
                            } else {
                                Fai.top._appendArea = $(this).attr("id")
                            }
                        }
                    }
                }
                Fai.top._appendLayout = Site.getLayoutFormsById($(this).parents(".fullmeasureForms").attr("id"));
                S.item.children().eq(0).trigger("click");
                Fai.top.draggableDiv_enable = false
            }
            if (!Fai.top.dragToAddModule) {
                var P = $(S.item).attr("id");
                var o = parseInt(P.replace("module", ""));
                var Q = parseInt($(S.item).attr("_inmulmcol")) || 0;
                var b = parseInt($(S.item).attr("_intab")) || 0;
                var s = parseInt($(S.item).attr("_infullmeasure")) || 0;
                var d = "";
                if (b > 0) {
                    d = b
                }
                if (Q > 0) {
                    d = Q
                }
                Site.refreshForms();
                Site.refreshAllAbsForms();
                Fai.top._moduleMoved++;
                Site.styleChanged();
                Fai.top.originSortable = "";
                var G = parseInt($(S.item).attr("_inmulmcol")) || 0;
                var f = parseInt($(S.item).attr("_intab")) || 0;
                var y = parseInt($(S.item).attr("_infullmeasure")) || 0;
                var K = S.item;
                var M = K.parents(".form");
                if (M.length > 0) {
                    M = M.eq(0)
                }
                var w = M.attr("id");
                if (M.hasClass("formStyle35")) {
                    if (K.hasClass("formStyle35")) {
                        Fai.ing("模块列模块不能插入模块列模块之中", true);
                        return false
                    }
                }
                if (M.hasClass("formStyle29")) {
                    if (K.hasClass("formStyle35")) {
                        Fai.ing("模块列模块不能插入模块组模块之中", true);
                        return false
                    }
                    if (K.hasClass("formStyle29")) {
                        Fai.ing("模块组模块不能插入模块组模块之中", true);
                        return false
                    }
                }
                if (b > 0) {
                    var e = Fai.top.$("#formTabButton" + o).parent();
                    if ($(S.item).parent().attr("id") != ("formTabCntId" + o) || b != f) {
                        if (Fai.top.$("#module" + b).attr("_autoheight") == 1) {
                            Site.autoModuleHeight(b);
                            Fai.top.Site.getModuleAttrPattern(b).changed = true
                        }
                        Fai.top.$("#formTabCntId" + o).remove();
                        Fai.top.$("#formTabButton" + o).remove()
                    }
                    e.find(".formTabButton").first().click()
                }
                var u = false,
                j = "formTabButtonList";
                if ($(S.item).parent().hasClass("formTabButtonYList")) {
                    j = "formTabButtonYList";
                    u = true
                }
                if (f > 0 || $(S.item).parent().hasClass(j)) {
                    var C = Fai.top.$("#module" + o).index();
                    if ($(S.item).parent().hasClass(j)) {
                        f = parseInt($(S.item).parent().attr("id").replace("formTabButtonList", "")) || f;
                        G = 0;
                        y = 0;
                        $(S.item).attr("_intab", f);
                        $(S.item).attr("_inmulmcol", 0);
                        $(S.item).attr("_infullmeasure", 0);
                        if (C > 0) {
                            Fai.top.$("#formTabContent" + f).children().eq((C - 1)).after($(S.item))
                        } else {
                            Fai.top.$("#formTabContent" + f).prepend($(S.item))
                        }
                    }
                    var h = Fai.encodeHtml($(S.item).find(".titleText").text());
                    h = h.replace(/<br\/>/, "");
                    var q = Fai.top.$("#module" + o).attr("class").split(" "),
                    v,
                    l = false;
                    for (var Z in q) {
                        if (/formStyle*/.test(q[Z])) {
                            v = q[Z].substring(9)
                        }
                    }
                    if (v == 3 || v == 16) {
                        l = true
                    }
                    Fai.top.$("#formTabButton" + o).remove();
                    var U = [];
                    U.push("<div class='formTabButton' id='formTabButton" + o + "' tabModuleId='" + o + "' onclick='Site.changeLiCnt(" + o + ", " + l + ", 29)'>");
                    U.push("<div class='formTabLeft'></div>");
                    U.push("<div class='formTabMiddle'>");
                    if (u) {
                        U.push("<span class='tabButtonText'>")
                    }
                    U.push(h);
                    if (u) {
                        U.push("</span>")
                    }
                    U.push("</div>");
                    U.push("<div class='formTabRight'></div>");
                    U.push("</div>");
                    var N = Fai.top.$("#formTabButtonList" + f);
                    if (C > 0) {
                        N.children().eq((C - 1)).after(U.join(""))
                    } else {
                        N.prepend(U.join(""))
                    }
                    if (N.hasClass("formTabButtonYList") && N.find(".tabYListPlaceholder").length < 1) {
                        N.append($("<td class='tabYListPlaceholder'></td>"))
                    }
                    var Y = 200;
                    var g = top.$("#formTabContent" + o).children(".formTabCntId");
                    if (g.length > 0) {
                        Y = g.first().height()
                    }
                    var D = "";
                    if (Y) {
                        D = " style='height:" + Y + "px !important;'"
                    }
                    if (!Fai.top.$("#module" + o).parent().hasClass("formTabCntId") && !Fai.top.$("#module" + o).hasClass("formTabCntId")) {
                        Fai.top.$("#module" + o).wrap("<div class='formTabCntId' id='formTabCntId" + o + "'" + D + "></div>")
                    }
                    Fai.top.Site.bindInTabSwitch()
                }
                if (f > 0 && M.attr("_autoheight") == "1") {
                    Site.autoModuleHeight(f);
                    Fai.top.Site.getModuleAttrPattern(f).changed = true
                }
                Site.dockModuleResize(K);
                if (b > 0) {
                    Fai.top.Site.getModuleAttrData(b).changed = true;
                    if (Fai.top.$("#module" + b).attr("_inmulmcol") > 0) {
                        Fai.top.Site.getModuleAttrData(Fai.top.$("#module" + b).attr("_inmulmcol")).changed = true
                    }
                }
                if (Q > 0) {
                    Fai.top.Site.getModuleAttrData(Q).changed = true;
                    if (Fai.top.$("#module" + Q).attr("_infullmeasure") > 0) {
                        Fai.top.Site.getModuleAttrData(Fai.top.$("#module" + Q).attr("_infullmeasure")).changed = true
                    }
                }
                if (s > 0) {
                    Fai.top.Site.getModuleAttrData(s).changed = true
                }
                if (f > 0) {
                    Fai.top.Site.getModuleAttrData(f).changed = true;
                    if (Fai.top.$("#module" + f).attr("_infullmeasure") > 0) {
                        Fai.top.Site.getModuleAttrData(Fai.top.$("#module" + f).attr("_infullmeasure")).changed = true
                    }
                    $(S.item).removeClass("formInMulMCol").addClass("formInTab");
                    Site.dockModuleResize(M)
                }
                if (G > 0) {
                    Fai.top.Site.getModuleAttrData(G).changed = true;
                    if (Fai.top.$("#module" + G).attr("_infullmeasure") > 0) {
                        Fai.top.Site.getModuleAttrData(Fai.top.$("#module" + G).attr("_infullmeasure")).changed = true
                    }
                    $(S.item).removeClass("formInTab").addClass("formInMulMCol");
                    Site.dockModuleResize(M)
                }
                if (y > 0) {
                    Fai.top.Site.getModuleAttrData(y).changed = true;
                    if ($(S.item).hasClass("formStyle35") || $(S.item).hasClass("formStyle29")) {
                        Fai.top.Site.getModuleAttrData(o).changed = true
                    }
                    $(S.item).removeClass("formInTab formInMulMCol")
                }
                $(S.item).removeAttr("style");
                $(".mulMColList").sortable("option", "disabled", false);
                $(".mulMColList").addClass("column");
                $(".formTabCntId").sortable("option", "disabled", false);
                $(".form").removeClass("formUnsortable");
                $(".formTabButtonList").sortable("option", "disabled", false);
                $(".formTabButtonYList").sortable("option", "disabled", false);
                $(".formTabContent").sortable("option", "disabled", false);
                $(".formTab").sortable("option", "disabled", false);
                $("#module" + o).trigger("Fai_onModuleLayoutChange");
                var E = K.data("posId");
                var m = K.parent().attr("id");
                if (E != m) {
                    var n = Fai.top.Site.getModuleAttrPattern(o);
                    n.outside.y = 0;
                    n.changed = true;
                    Site.removeModuleStyleCssList(o, [{
                        cls: "",
                        key: "padding"
                    },
                    {
                        cls: "",
                        key: "margin-right"
                    },
                    {
                        cls: "",
                        key: "margin-left"
                    },
                    {
                        cls: "",
                        key: "margin-top"
                    },
                    {
                        cls: "",
                        key: "margin-bottom"
                    }]);
                    Fai.top.Site.styleChanged()
                }
                if (K.attr("_autoheight") > 0) {
                    Site.autoModuleHeight(o)
                }
                if (K.hasClass("formStyle1")) {
                    var ab = K.find("img.richModuleSlaveImg");
                    Site.richModuleSlaveImgResize(ab);
                    Site.richModulePicEdit(ab)
                }
                if (d != "") {
                    var A = Fai.top.$("#module" + d);
                    if (A && A.find(".form").length < 1) {
                        Site.dockModuleAutoHeight(d);
                        Site.dockModuleResize_disable(A)
                    }
                }
                Site.noCheckCreateMLFH();
                if (S.item.parent().hasClass("mulMColList")) {
                    var k = S.item.parent().attr("id");
                    var F = k.split("_");
                    var x = F[0].replace("mulMCol", "");
                    Site.isMulColModuleInIE("#module" + x)
                }
                if (K.hasClass("formStyle5") || K.hasClass("formStyle77")) {
                    Site.refreshModulePhotoSwitch(o)
                }
                if (K.hasClass("formStyle83")) {
                    Site.adjustPhotoCard(o)
                }
                Site.moduleSizeChange(P);
                Site.scrollToModuleDiv(Fai.top.$("#" + P))
            }
        }
    })
};
Site.popupStyleChangeBodyWindow = function(d, k, f, g, a, i, l) {
    var b = false;
    var h = "确定";
    var j = "取消";
    if (typeof f != "undefined" && f == 1) {
        b = true
    }
    if (typeof a != "undefined") {
        h = "" + a
    }
    if (typeof i != "undefined") {
        j = "" + i
    }
    var e = "<div style='line-height:20px;color:black;padding:7px 0 5px 0;'><p style='padding:0 6px 0 5px;text-align:center;'>" + d + "</p><div style='padding:2px 0 0 66px;'><p style='padding:5px 0 5px 0;'><input type='radio' name='save' id='popupWindowSaveChangeBtn' checked='checked' style='vertical-align:-2px;_vertical-align:-1px;' /><label for='popupWindowSaveChangeBtn' style='cursor:pointer;'>立即保存</label></p><p><input type='radio' name='save' id='popupWindowCancelChangeBtn' style='vertical-align:-2px;_vertical-align:-1px;' /><label for='popupWindowCancelChangeBtn' style='cursor:pointer;'>不保存</label></p></div></div>";
    if (b) {
        e = "<div style='line-height:20px;color:black;padding:28px 0 5px 72px;'><p>" + d + "</p></div>"
    }
    var c = Fai.top.Fai.popupBodyWindow({
        title: "操作提示",
        content: "" + e,
        width: 350,
        height: 85
    });
    Fai.top.Fai.addPopupBodyWindowBtn(c, {
        id: "save",
        text: h,
        extClass: "saveButton",
        click: function() {
            if (typeof l != "undefined" && l.beforePopup) {
                l.closeFunc = function() {
                    Fai.top.location.reload()
                }
            }
            if (b) {
                $(window).unbind("beforeunload");
                Site.closeStyleDesign()
            } else {
                if (top.$(top.document).find("#popupWindowSaveChangeBtn").length > 0 && top.$(top.document).find("#popupWindowSaveChangeBtn").prop("checked")) {
                    if (typeof l != "undefined" && l.beforePopup) {
                        Fai.top.Site.saveStyle(k, l.beforePopup);
                        Fai.popupWindow(l)
                    } else {
                        Fai.top.Site.saveStyle(k)
                    }
                } else {
                    if (typeof k != "undefined" && typeof k.fun === "function" && typeof g != "undefined" && g) {
                        $(window).unbind("beforeunload");
                        setTimeout(function() {
                            k.fun.apply(window, k.args)
                        },
                        10)
                    } else {
                        Fai.top._changeStyleNum = 0;
                        if (l.beforePopup) {
                            Fai.popupWindow(l)
                        } else {
                            Fai.top.location.reload()
                        }
                    }
                }
                Fai.top.Fai.closePopupBodyWindow(c)
            }
        }
    });
    Fai.top.Fai.addPopupBodyWindowBtn(c, {
        id: "cancel",
        text: j,
        click: "close"
    })
};
Site.showEditTip = function(c, a, b) {
    var d = $("#" + a + "editLayer").attr("_mouseIn");
    if (d == 1) {
        if ($("#tip-" + a + "-simple").length == 0) {
            if (!Site.getCookieFlag(1)) {
                Fai.showTip({
                    id: "tip-" + a + "-simple",
                    tid: c,
                    content: b,
                    showMode: "bottom",
                    closeSwitch: true,
                    beforeClose: function() {
                        Site.setCookieFlag(1, true)
                    }
                });
                $(".tip-yellowsimple").mouseover(function() {
                    $("#" + a + "editLayer").attr("_mouseIn", 1)
                })
            }
        }
    } else {
        Fai.closeTip(c)
    }
};
Site.siteAuth = {
    AUTH_NOT_ALL: 1,
    SITE_DESIGN: 2,
    COLUMN_MANAGE: 4,
    MODULE_MANAGE: 8,
    PRODUCT_ADD: 16,
    PRODUCT_MANAGE: 32,
    PHOTO_MANAGE: 64,
    NEWS_ADD: 128,
    NEWS_MANAGE: 256,
    SITE_IMG_MANAGE: 512,
    MEMBER_MANAGE: 1024,
    FORM_MANAGE: 2048,
    VOTE_MANAGE: 4096,
    MALL_MANAGE: 8192,
    MSG_BOARD_MANAGE: 16384,
    WEB_STATISTICS: 65536,
    SYSTEM_SETTING: 131072,
    ADVANCED_SETTING: 262144
};
Site.renderUEditor = function(c, b) {
    var f;
    var a = {
        ueditorId: null,
        setPageChange: null,
        initContent: null,
        minFrameHeight: 0,
        faiscoRichTip: null,
        imageExtends: false,
        wordCount: false,
        maximumWords: 0,
        withPage: null,
        flash: null,
        fixUrl: false,
        customDomain: true,
        isPasteImage: true,
        swfuploadSrc: null,
        htmlChoiceFlash: "Site.htmlChoiceFlash(editor)",
        htmlChoiceImage: "Site.htmlChoiceImage(editor)",
        openHoverImage: false,
        openSetLinkStyle: false,
        htmlChoiceDefImage: "Site.htmlChoiceDefImage(editor)",
        htmlChoiceHoverImage: "Site.htmlChoiceHoverImage(editor)",
        htmlChoiceMP4: Site.htmlChoiceMP4,
        fontfamily: null,
        useDefaultFontsizeComBox: false,
        isMobi: false,
        jumpControl: Site.jumpControl,
        difSource: false,
        fullscreenCallback: function(g) {
            if (!b) {
                return
            }
            if (Fai.top.$("#popupWindowIframe" + b).length === 0) {
                return
            }
            if (!f) {
                f = Fai.top.$("#popupWindowIframe" + b).parent().outerWidth(true)
            }
            if (g) {
                Fai.top.$("#popupWindowIframe" + b).parent().css("width", 960 + "px")
            } else {
                Fai.top.$("#popupWindowIframe" + b).parent().css("width", f + "px")
            }
        },
        initComplete: null,
        initSetLinkStyle: null,
        initHoverStyle: null
    };
    $.extend(a, c);
    var d = {
        hoverChangeImage: Site.hoverChangeImage,
        hoverStyle: Site.hoverStyle,
        logFontFamilyUse: Site.logFontFamilyUse,
        fileUpload2: Site.fileUpload2
    };
    $.extend(d, a.outerFunction);
    var e = new baidu.editor.ui.Editor({
        upLoadFlashUrl: "/static/web/ajax/upfile_h.jsp?type=50",
        ueditorChangeEvent: a.setPageChange,
        htmlModuleRichTip: a.faiscoRichTip,
        initialContent: a.initContent,
        imageExtends: a.imageExtends,
        minFrameHeight: a.minFrameHeight,
        wordCount: a.wordCount,
        customDomain: a.customDomain,
        maximumWords: a.maximumWords,
        swfuploadSrc: a.swfuploadSrc,
        fixUrl: a.fixUrl,
        isPasteImage: a.isPasteImage,
        htmlChoiceFlash: a.htmlChoiceFlash,
        htmlChoiceImage: a.htmlChoiceImage,
        openHoverImage: a.openHoverImage,
        openSetLinkStyle: a.openSetLinkStyle,
        htmlChoiceDefImage: a.htmlChoiceDefImage,
        htmlChoiceHoverImage: a.htmlChoiceHoverImage,
        htmlChoiceMP4: a.htmlChoiceMP4,
        toolbars: [["shrinkopenup", "removeformat", "|", "bold", "italic", "underline", "|", "fontfamily", "fontsize", "forecolor", "backcolor", "|", "insertorderedlist", "insertunorderedlist", "lineheight", "justifyright", "|", "link", "unlink", "qqservice", (Fai.top.Mobi ? "phone": ""), "insertimage", "hoverimage", "insertmp4", a.flash, "inserttable", a.withPage, "|", "swfuploadWord", "|", "source", "||", "pasteplain", "selectall", "undo", "redo", "|", "strikethrough", "superscript", "subscript", "horizontal", "zhspace", "|", "indent", "rowspacingtop", "rowspacingbottom", "|", "deletetable", "edittd", "insertparagraphbeforetable", "insertrow", "deleterow", "insertcol", "deletecol", "mergecells", "mergeright", "mergedown", "splittocells", "splittorows", "splittocols", "|", "fullscreen"]],
        fontfamily: a.fontfamily,
        useDefaultFontsizeComBox: a.useDefaultFontsizeComBox,
        openJumpCtrl: true,
        isMobi: a.isMobi,
        jumpCtrlFunc: a.jumpControl,
        difSource: a.difSource,
        fullscreenCallback: a.fullscreenCallback,
        initComplete: a.initComplete,
        initSetLinkStyle: a.initSetLinkStyle,
        initHoverStyle: a.initHoverStyle,
        outerFunction: d
    });
    e.render(a.ueditorId);
    return e
};
Site.faiscoRichTip = function(a) {
    $("#" + a).show()
};
Site.fixUrl = function(a, b) {
    if (!a || !b) {
        return
    }
    b = Fai.fixUrl(b);
    a = Fai.fixUrl(a);
    subStrUrl = a.substring(0, b.length);
    if (subStrUrl === b) {
        return subStrUrl == a ? "/": a.substring(b.length, a.length)
    } else {
        return a
    }
};
Site.jumpControl = function(i) {
    var c = {
        inputId: null,
        moduleType: 1,
        ueditor: false,
        jumpType: null,
        jumpIde: null,
        jumpUrl: null,
        jumpName: null,
        jumpCusId: "jumpCtrl",
        jumpCusUEId: "jumpCtrlUE",
        setPageChange: null,
        skipMobiColId: null,
        fromMobi: false,
        difSource: false,
        whetherTop: false
    };
    if (c.inputId) {
        return
    }
    $.extend(c, i);
    var f, h;
    if (c.ueditor) {
        f = c.jumpCusUEId
    } else {
        f = c.jumpCusId
    }
    var e = $("#" + f),
    d = $("#" + c.inputId);
    if (c.whetherTop) {
        e = Fai.top.$("#" + f);
        d = Fai.top.$("#" + c.inputId)
    }
    if (!c.ueditor) {
        d.css("float", "left")
    }
    var b = c.jumpType;
    if (b != 103 && b != 0) {
        d.attr("disabled", true)
    } else {
        d.attr("disabled", false)
    }
    if (c.jumpName != null) {
        d.val(Fai.decodeHtml(c.jumpName))
    } else {
        d.val("")
    }
    var g = false;
    if (c.fromMobi) {
        if (b == 0 && (c.skipMobiColId > 0 || c.skipMobiColId == -2)) {
            d.attr("disabled", true)
        }
        if (b == 100 && c.skipMobiColId === 0) {
            d.attr("disabled", false)
        }
        if (c.mJName != null) {
            d.val(c.mJName)
        }
        if (c.skipMobiColId != null) {
            g = true
        }
    }
    if (e.length === 0) {
        if (c.ueditor) {
            h = ["<td colspan='4'>", "<div id='" + c.jumpCusUEId + "' class='jumpCtrlUE' ", "_lType='", c.jumpType, "' _lIde='", c.jumpIde, c.mJUrl ? "' _extJUrl='" + c.mJUrl: "", c.mJType ? "' _extType='" + c.mJType: "", c.mJIde ? "' _extJIde='" + c.mJIde: "", c.mJName ? "' _extJName='" + c.mJName: "", "'>设置链接</div>", "</td>"];
            d.parent().after(h.join(""))
        } else {
            h = ["<div id='" + c.jumpCusId + "' class='jumpCtrl' ", "_lType='", c.jumpType, "' _lIde='", c.jumpIde, g ? "' _skipMobiColId='" + c.skipMobiColId: "", "'>设置链接</div>"];
            d.after(h.join(""))
        }
        e = c.whetherTop ? Fai.top.$("#" + f) : $("#" + f);
        e.hover(function() {
            $(this).addClass("j_ctrl_hover")
        },
        function() {
            $(this).removeClass("j_ctrl_hover")
        })
    } else {
        e.attr("_lType", c.jumpType);
        e.attr("_lIde", c.jumpIde);
        e.removeAttr("_lname _lurl _extJUrl");
        if (c.ueditor) {
            if (c.mJType == null) {
                e.removeAttr("_extType")
            } else {
                e.attr("_extType", c.mJType)
            }
            if (c.mJIde == null) {
                e.removeAttr("_extJIde")
            } else {
                e.attr("_extJIde", c.mJIde)
            }
            if (c.mJName == null) {
                e.removeAttr("_extJName")
            } else {
                e.attr("_extJName", c.mJName)
            }
        }
    }
    d.unbind("keyup change").bind("keyup change",
    function() {
        e.attr("_lType", 103);
        if (d.val() === "") {
            e.attr("_lIde", "");
            e.attr("_lUrl", "")
        } else {
            e.attr("_lIde", Site.fixUrl(d.val(), Fai.top._userHostName));
            e.attr("_lUrl", Site.fixUrl(d.val(), Fai.top._userHostName));
            e.attr("_lname", Site.fixUrl(d.val(), Fai.top._userHostName));
            e.removeAttr("_extType _extJUrl _extJIde _extJName")
        }
        if (c.setPageChange != null) {
            c.setPageChange()
        }
    });
    var a = "manage/linkSetting.jsp?ram=" + Math.random();
    if (c.fromMobi && c.frameSrcUrl != null) {
        a = c.frameSrcUrl + "/manage/linkSetting.jsp?ram=" + Math.random() + "&fromMobi=true"
    }
    a += "&m=" + c.moduleType + (c.ueditor ? "&editor=true": "");
    if (c.difSource) {
        a += "&difSource=true"
    }
    if (c.colOff) {
        a += "&colOff=true"
    }
    e.unbind("click").bind("click",
    function() {
        var j = a + "&lType=" + e.attr("_lType") + "&lIde=" + Fai.encodeUrl(e.attr("_lIde"));
        if (g) {
            j += "&skipMobiColId=" + e.attr("_skipMobiColId")
        }
        var k = e.attr("_extJIde");
        if (k != null) {
            j += "&jExtIde=" + k
        }
        Fai.popupWindow({
            title: "设置链接地址",
            width: 460,
            height: 240,
            frameScrolling: false,
            frameSrcUrl: j,
            closeFunc: function(m) {
                if (m != null) {
                    e.removeAttr("_extType _extJUrl _extJIde _extJName");
                    if (m.type == 103) {
                        d.val(m.url);
                        d.attr("disabled", false);
                        e.attr("_lType", m.type);
                        e.attr("_lIde", m.jIde);
                        if (m.jumpUrl) {
                            e.attr("_lUrl", m.jumpUrl)
                        }
                    } else {
                        var l = m.name;
                        if (m.extName && c.fromMobi) {
                            l = m.extName
                        }
                        d.val(l);
                        d.attr("disabled", true);
                        e.attr("_lType", m.type);
                        e.attr("_lIde", m.jIde);
                        e.attr("_lName", m.name);
                        if (m.jumpUrl) {
                            e.attr("_lUrl", m.jumpUrl)
                        }
                        if (m.skipMobiColId) {
                            e.attr("_skipMobiColId", m.skipMobiColId)
                        }
                        if (m.extType) {
                            e.attr("_extType", m.extType)
                        }
                        if (m.extJUrl) {
                            e.attr("_extJUrl", m.extJUrl)
                        }
                        if (m.extJIde) {
                            e.attr("_extJIde", m.extJIde)
                        }
                        if (m.extName) {
                            e.attr("_extJName", m.extName)
                        }
                    }
                    if (c.setPageChange != null) {
                        c.setPageChange()
                    }
                }
            }
        })
    })
};
Site.setLinkStyle = function(b) {
    var c = $("#linkStyle");
    var a = {
        ueditor: false,
        setPageChange: null,
        fromMobi: false
    };
    $.extend(a, b);
    c.unbind("click").bind("click",
    function() {
        Site.popupWindow({
            title: "设置链接样式",
            frameSrcUrl: "manage/linkSetStyle.jsp?options=" + Fai.encodeUrl($.toJSON(a)) + "&ram=" + Math.random(),
            width: "490",
            height: "330",
            saveBeforePopup: false,
            closeFunc: function(d) {
                if (d != null) {
                    a.linkStyleObj.linkStyleClose = d.linkStyleClose;
                    a.linkStyleObj.wUnderline = d.wUnderline;
                    a.linkStyleObj.wfontSize = d.wfontSize;
                    a.linkStyleObj.wBold = d.wBold;
                    a.linkStyleObj.wfontfamily = d.wfontfamily;
                    a.linkStyleObj.wColor = d.wColor;
                    a.linkStyleObj.wbackColorClose = d.wbackColorClose;
                    a.linkStyleObj.wbackColor = d.wbackColor;
                    a.linkHoverStyleObj.wo = d.wHoverOpen;
                    a.linkHoverStyleObj.u = d.wUnderline_h;
                    a.linkHoverStyleObj.fs = d.wfontSize_h;
                    a.linkHoverStyleObj.b = d.wBold_h;
                    a.linkHoverStyleObj.ff = d.wfontfamily_h;
                    a.linkHoverStyleObj.c = d.wColor_h;
                    a.linkbackHoverColorObj.bo = d.wbackHoverOpen;
                    a.linkbackHoverColorObj.bc = d.wbackColor_h
                } else {
                    return false
                }
            }
        })
    })
};
Site.addModuleMask = function(l) {
    var c = {};
    c.lt = {
        x: 0,
        y: 0
    };
    c.lb = {
        x: 0,
        y: 0
    };
    c.rt = {
        x: 0,
        y: 0
    };
    c.rb = {
        x: 0,
        y: 0
    };
    var E = {
        id: 0,
        refresh: false,
        useClass: false,
        leftClass: "",
        rightClass: "",
        topClass: "",
        bottomClass: "",
        centerClass: "",
        enableTopBar: false,
        callback: false,
        extFn: []
    };
    $.extend(E, l);
    Fai.top.$(window).off("resize.addModuleMask");
    var f = Fai.top.$("#module" + E.id);
    if (f.length < 1) {
        return
    }
    Fai.top.$(window).on("resize.addModuleMask",
    function() {
        Site.addModuleMask($.extend({},
        E, {
            refresh: true
        }))
    });
    var J = Fai.top.$(".moduleMaskContainer");
    if (J.length < 1 && l.refresh) {
        return
    }
    Site.removeAllEditLayer();
    var C = document.documentElement ? document.documentElement.clientWidth: document.body.clientWidth;
    var m = document.documentElement ? document.documentElement.clientHeight: document.body.clientHeight;
    var w = f.outerWidth();
    var p = f.outerHeight();
    var e = f.offset();
    var h = e.top;
    var I = e.left;
    var k = h + p;
    var n = I + w;
    var t = 0;
    if (E.enableTopBar) {
        var G = Fai.top.$("#memberBarArea");
        var z = 0;
        if (G.length > 0) {
            z = G.is(":visible") ? G.height() : 0
        }
        t = Fai.top.$(".floatLeftTop").offset().top - z
    }
    c.lt.x = I > 0 ? I: 0;
    c.lt.y = h > 0 ? h: 0;
    c.lb.x = c.lt.x;
    c.lb.y = k > m ? m: k;
    c.rt.x = n > C ? C: n;
    c.rt.y = c.lt.y;
    c.rb.x = c.rt.x;
    c.rb.y = c.lb.y;
    var g = "position:absolute;top:" + t + "px;left:0;width:" + c.lt.x + "px;height:" + (m - t) + "px;";
    var b = "position:absolute;top:" + t + "px;left:" + c.rt.x + "px;width:" + (C - c.rt.x) + "px;height:" + (m - t) + "px;";
    var v = "position:absolute;top:" + t + "px;left:" + c.lt.x + "px;width:" + w + "px;height:" + (c.lt.y - t) + "px;";
    var F = "position:absolute;top:" + c.lb.y + "px;left:" + c.lb.x + "px;width:" + w + "px;height:" + (m - c.lb.y) + "px;";
    var o = "position:absolute;top:" + c.lt.y + "px;left:" + c.lt.x + "px;width:" + w + "px;height:" + p + "px;";
    if (J.length > 0) {
        var s = J;
        var y = s.children(".moduleMask-left");
        var x = s.children(".moduleMask-right");
        var d = s.children(".moduleMask-top");
        var u = s.children(".moduleMask-bottom");
        var j = s.children(".moduleMask-center");
        y.attr("style", g);
        x.attr("style", b);
        d.attr("style", v);
        u.attr("style", F);
        j.attr("style", o);
        if ( !! s.attr("useClass")) {
            y.removeClass().addClass("moduleMask moduleMask-left");
            x.removeClass().addClass("moduleMask moduleMask-right");
            d.removeClass().addClass("moduleMask moduleMask-top");
            u.removeClass().addClass("moduleMask moduleMask-bottom");
            j.removeClass().addClass("moduleMask moduleMask-center")
        }
        if (E.useClass) {
            y.addClass(" " + E.leftClass);
            x.addClass(" " + E.rightClass);
            d.addClass(" " + E.topClass);
            u.addClass(" " + E.bottomClass);
            j.addClass(" " + E.centerClass)
        }
        s.attr("useClass", E.useClass ? 1 : 0);
        s.appendTo(Fai.top.$("body"))
    } else {
        var r = [];
        r.push("<div class='moduleMaskContainer' useClass='" + (E.useClass ? 1 : 0) + "'>");
        r.push("	<div class='moduleMask moduleMask-left " + (E.useClass ? E.leftClass: "") + "' style='" + g + "'></div>");
        r.push("	<div class='moduleMask moduleMask-right " + (E.useClass ? E.rightClass: "") + "' style='" + b + "'></div>");
        r.push("	<div class='moduleMask moduleMask-top " + (E.useClass ? E.topClass: "") + "' style='" + v + "'></div>");
        r.push("	<div class='moduleMask moduleMask-bottom " + (E.useClass ? E.bottomClass: "") + "' style='" + F + "'></div>");
        r.push("	<div class='moduleMask moduleMask-center " + (E.useClass ? E.centerClass: "") + "' style='" + o + "'></div>");
        r.push("</div>");
        Fai.top.$("body").append(r.join(""))
    }
    J = Fai.top.$(".moduleMaskContainer");
    if (!E.refresh) {
        var D = J.data("extFn");
        if (D) {
            for (var A = 0,
            B = D.length; A < B; A++) {
                var q = D[A].obj || J;
                var a = D[A].name;
                q.off(a)
            }
        }
    }
    if (E.extFn.length > 0) {
        for (var A = 0,
        B = E.extFn.length; A < B; A++) {
            var q = E.extFn[A].obj || J;
            var a = E.extFn[A].name;
            var H = E.extFn[A].fn;
            q.off(a);
            q.on(a, H)
        }
        J.data("extFn", E.extFn)
    }
    if (E.callback) {
        E.callback()
    }
};
Site.removeModuleMask = function() {
    var c = Fai.top.$(".moduleMaskContainer");
    Fai.top.$(window).off("resize.addModuleMask");
    var f = c.data("extFn");
    if (f) {
        for (var e = 0,
        b = f.length; e < b; e++) {
            var a = f[e].obj || c;
            var d = f[e].name;
            a.off(d)
        }
    }
    c.remove()
};
Site.initManagePage = function() {
    Site.bindGobalEvent("resizableModuleChange",
    function(a, b) {
        Site.refreshResizableHandles(Fai.top.$("module" + b))
    });
    Site.bindGobalEvent("siteLayoutChange",
    function(b, a) {
        $(".form").each(function() {
            if ($(this).hasClass("formStyle5") || $(this).hasClass("formStyle77")) {
                Site.refreshModulePhotoSwitch($(this).attr("id").replace("module", ""))
            }
        });
        Site.checkNormalLayoutChange()
    });
    Site.bindGobalEvent("changeTemplateType",
    function(b, a) {
        Site.checkNormalLayoutChange()
    })
};
Site.checkNormalLayoutChange = function() {
    var d = [1, 2, 3, 4, 5, 6, 7, 8],
    b = true,
    a = Fai.top.$("#webContainerTable");
    for (var c = 0; c < d.length; c++) {
        if (!Site.isLayoutHidden(d[c])) {
            b = false;
            break
        }
    }
    if (b) {
        a.addClass("fk-webContainerTableForNoLayout")
    } else {
        a.removeClass("fk-webContainerTableForNoLayout")
    }
};
Site.faiTagList = {
    UI: {},
    FUNC: {},
    DATA: {}
}; (function(c, a) {
    a.FUNC.init = function(d, e) {
        a.DATA.init = false;
        a.DATA.tagListId = "faiTagList";
        a.DATA.callback = e;
        a.DATA.dataNum = 0;
        a.DATA.timer = null;
        a.UI.tagList = "<ul tabindex='-1' id='" + a.DATA.tagListId + "' class='faiTagList'></ul>";
        a.UI.tagListItem = "<li class='item' _itemKey='_$itemKey' title='_$itemName'>_$itemName</li>";
        a.FUNC.create(d);
        b()
    };
    a.FUNC.create = function(g) {
        c("body").append(a.UI.tagList);
        var e = [];
        for (var d = 0; d < g.length; d++) {
            var f = g[d];
            e.push(a.FUNC.addItem(f.key, f.label))
        }
        c("#" + a.DATA.tagListId).append(e);
        a.DATA.init = true
    };
    a.FUNC.show = function(k) {
        var i = c("#" + a.DATA.tagListId);
        var g = a.DATA.init || i.find(".item").length != 0;
        if (!g) {
            return
        }
        var f = i.width();
        var e = c(k);
        var j = e.offset();
        var h = e.width() + Fai.getCssInt(e, "padding-left") + (Fai.getCssInt(e, "border-width") * 2);
        var d = e.height() + 5;
        j.top += d;
        j.left -= f - h;
        i.css({
            top: j.top + "px",
            left: j.left + "px"
        }).show()
    };
    a.FUNC.hide = function() {
        var d = c("#" + a.DATA.tagListId);
        if (d.length == 1) {
            d.hide()
        }
    };
    a.FUNC.addItem = function(f, e) {
        var d = a.UI.tagListItem.replace("_$itemKey", f).replace("_$itemName", Fai.encodeHtml(e)).replace("_$itemName", Fai.encodeHtml(e));
        if (!a.DATA.init) {
            return d
        } else {
            c("#" + a.DATA.tagListId).append(d)
        }
    };
    a.FUNC.removeItem = function(d) {
        c("#" + a.DATA.tagListId).find("[_itemKey='" + d + "']").remove()
    };
    a.FUNC.showItem = function(d) {
        c("#" + a.DATA.tagListId).find("[_itemKey='" + d + "']").show()
    };
    a.FUNC.hideItem = function(d) {
        c("#" + a.DATA.tagListId).find("[_itemKey='" + d + "']").hide()
    };
    a.FUNC.isExist = function(g, e) {
        var d = c("#" + a.DATA.tagListId).find(".item");
        var f = false;
        c.each(d,
        function(j, k) {
            var h = c(k).text();
            if (h == g) {
                if ( !! e) {
                    e.id = parseInt(c(k).attr("_itemKey"));
                    e.name = h
                }
                f = true;
                return false
            }
        });
        return f
    };
    a.FUNC.showAllItem = function() {
        c("#" + a.DATA.tagListId).find(".item").show()
    };
    a.FUNC.hideAllItem = function() {
        c("#" + a.DATA.tagListId).find(".item").hide()
    };
    a.FUNC.searchItem = function(e) {
        var d = c("#" + a.DATA.tagListId).find(".item");
        var f = [];
        c.each(d,
        function(g, h) {
            var j = {
                id: parseInt(c(h).attr("_itemKey")),
                name: c.trim(c(h).text())
            };
            if (j.name.indexOf(e) >= 0) {
                f.push(h)
            }
        });
        return f
    };
    function b() {
        c("#" + a.DATA.tagListId).off(".faiTagList").on("mouseenter.faiTagList",
        function() {
            c(this).attr("_mouseIn", 1)
        }).on("mouseleave.faiTagList",
        function() {
            c(this).attr("_mouseIn", 0)
        });
        c("#" + a.DATA.tagListId).find(".item").die().live("mouseenter",
        function() {
            c(this).addClass("hoverItem")
        }).live("mouseleave",
        function() {
            c(this).removeClass("hoverItem")
        }).live("click",
        function() {
            if (a.DATA.callback) {
                var d = c(this).text();
                var e = c(this).attr("_itemKey");
                a.DATA.callback(e, d)
            }
            a.FUNC.hide();
            c("#" + a.DATA.tagListId).attr("_mouseIn", 0)
        })
    }
})(jQuery, Site.faiTagList);
Site.faiTag = {
    UI: {},
    FUNC: {}
}; (function(c, b) {
    b.UI.tag = "<div class='J_faiTag faiTag'></div>";
    b.UI.tagContent = "<span class='faiTagText' _tagKey='_$tagKey' title='_$tagName'>_$tagName</span><a class='faiTagClose' href='javascript:;' onclick='Site.faiTag.FUNC.remove(this);return false;' ></a>";
    b.UI.tagEditContent = "<input class='faiTagInput' type='text' maxlength='50' />";
    b.FUNC.add = function(g, e, h) {
        c(".J_tagAddBtn").hide();
        c("#" + g).append(c(b.UI.tag).append(b.UI.tagEditContent));
        var f = c("#" + g).find(".J_faiTag input");
        if ( !! e) {
            e(g, f)
        } else {
            a(g)
        }
        if (h) {
            h(f)
        }
    };
    b.FUNC.remove = function(e, f) {
        if (c(e).hasClass("faiTag")) {
            c(e).remove()
        } else {
            c(e).parent(".faiTag").remove()
        }
        c(".J_tagAddBtn").removeAttr("style");
        b.FUNC.checkTagNum(f)
    };
    b.FUNC.create = function(j, h, g) {
        var e = c(".J_faiTag");
        var f = c(e).parent();
        var i = b.UI.tagContent.replace("_$tagKey", j).replace("_$tagName", Fai.encodeHtml(h)).replace("_$tagName", Fai.encodeHtml(h));
        c(e).find("input").remove();
        c(e).append(i).removeClass("J_faiTag");
        c(f).prepend(e);
        d();
        c(".J_tagAddBtn").removeAttr("style");
        b.FUNC.checkTagNum(g)
    };
    b.FUNC.createTags = function(i) {
        if ( !! !i && i.length == 0) {
            return
        }
        var h = "";
        for (var f = 0; f < i.length; f++) {
            var j = i[f];
            if (j.name == -1) {
                continue
            }
            var g = b.UI.tagContent.replace("_$tagKey", j.id).replace("_$tagName", Fai.encodeHtml(j.name)).replace("_$tagName", Fai.encodeHtml(j.name));
            var e = c(b.UI.tag).prepend(g).removeClass("J_faiTag")[0].outerHTML;
            h += e
        }
        return h
    };
    b.FUNC.refreshTagEvent = function() {
        d()
    };
    b.FUNC.getTagData = function(h, g, f) {
        var e = c(".faiTag").find(".faiTagText");
        c.each(e,
        function(k, j) {
            j = {
                id: parseInt(c(j).attr("_tagkey")),
                name: c.trim(c(j).text())
            };
            if (j.id == -1 && !!h) {
                h.push(j)
            } else {
                if ( !! g) {
                    g.push(j.id)
                }
            }
            if ( !! f) {
                f.push(j.id)
            }
        })
    };
    b.FUNC.isExist = function(f) {
        var e = c(".faiTag").find(".faiTagText");
        var g = false;
        c.each(e,
        function(k, h) {
            var j = c.trim(c(h).text());
            if (j == f) {
                g = true;
                return false
            }
        });
        return g
    };
    b.FUNC.checkTagNum = function(g) {
        var e = c(".faiTag");
        var f = false;
        if (e.length >= g) {
            c(".J_tagAddBtn").hide();
            f = true
        } else {
            c(".J_tagAddBtn").removeAttr("style");
            f = false
        }
        return f
    };
    function a(e) {
        c(tagItem).focus().on("blur.faiTag",
        function(f) {
            setTimeout(function() {
                var h = c("#" + e).find(".J_faiTag");
                var g = c(h).find("input").val();
                if (!g || g.length == 0) {
                    b.FUNC.remove(h)
                } else {
                    b.FUNC.create( - 1, g)
                }
            },
            50)
        }).on("keydown.faiTag",
        function(g) {
            if (g.keyCode == 13) {
                var h = c("#" + e).find(".J_faiTag");
                var f = c(h).find("input").val();
                if (!f || f.length == 0) {
                    b.FUNC.remove(h)
                } else {
                    b.FUNC.create( - 1, f)
                }
            }
        })
    }
    function d() {
        c(".faiTag").die().live("mouseenter",
        function() {
            c(this).find(".faiTagClose").css("visibility", "visible")
        }).live("mouseleave",
        function() {
            c(this).find(".faiTagClose").css("visibility", "hidden")
        })
    }
})(jQuery, Site.faiTag);
Site.absAlignLine = {
    action: ["resize"],
    resize: {},
    commFunc: {}
}; (function(c, b) {
    var a = b.resize;
    a.showGap = 5;
    a.inTopLine = false;
    a.inRightLine = false;
    a.inBottomLine = false;
    a.inLeftLine = false;
    a.init = function(k, j, i, l) {
        var m = k.attr("id"),
        h = Fai.top.$(".form").not(k[0]),
        f = j[0].getBoundingClientRect();
        Fai.top.$("#absAlignTop, #absAlignRight, #absAlignBottom,#absAlignLeft").hide();
        if (a.begin) {
            a.elemParentData = k.parent().offset();
            a.compareData = d(h);
            a.keys = [];
            for (var g in a.compareData) {
                a.keys.push(g)
            }
        }
        e(f, a.compareData, j, k, l);
        a.begin = false
    };
    function e(v, m, g, C, k) {
        Fai.top.$("#absAlignTop, #absAlignRight, #absAlignBottom,#absAlignLeft").css("opacity", 1);
        var H = 0,
        t = 0,
        h = 0,
        B = 0,
        f = 0,
        q = 0,
        w = 0,
        n = 0,
        x = 0,
        j = 0,
        s = 0,
        E = 0,
        o = [v.left, v.right],
        F = [v.top, v.bottom],
        z = [v.left, v.right],
        p = [v.top, v.bottom];
        for (var A in m) {
            var y = m[A];
            H = v.top - y.top;
            t = v.right - y.right;
            h = v.bottom - y.bottom;
            B = v.left - y.left;
            if (c.inArray("top", k) != -1 && Math.abs(H) < a.showGap) {
                x = y.top;
                o.push(y.left, y.right);
                f = H;
                a.inTopLine = true
            }
            if (c.inArray("right", k) != -1 && Math.abs(t) < a.showGap) {
                j = y.right;
                F.push(y.top, y.bottom);
                q = t;
                a.inRightLine = true
            }
            if (c.inArray("bottom", k) != -1 && Math.abs(h) < a.showGap) {
                s = y.bottom;
                z.push(y.left, y.right);
                w = h;
                a.inBottomLine = true
            }
            if (c.inArray("left", k) != -1 && Math.abs(B) < a.showGap) {
                E = y.left;
                p.push(y.top, y.bottom);
                n = B;
                a.inLeftLine = true
            }
        }
        var l = false;
        if (C.hasClass("formStyle81") || C.hasClass("formStyle79")) {
            l = true
        }
        if (a.inTopLine) {
            b.commFunc.calLineSize("top", o);
            b.commFunc.setAbsAlignLine("Top", x);
            var r = parseInt(g.css("top").replace("px", "")) || 0;
            g.css("top", (r - f) + "px");
            a.inTopLine = false;
            a.showGap = 2
        }
        if (a.inRightLine) {
            b.commFunc.calLineSize("right", F);
            b.commFunc.setAbsAlignLine("Right", j);
            var D = l ? 0 : 3.5;
            g.css("width", (g.width() - q + D) + "px");
            a.inRightLine = false;
            a.showGap = 3
        }
        if (a.inBottomLine) {
            b.commFunc.calLineSize("bottom", z);
            b.commFunc.setAbsAlignLine("Bottom", s);
            var u = l ? 0 : 4;
            g.css("height", (g.height() - w + u) + "px");
            a.inBottomLine = false;
            a.showGap = 3
        }
        if (a.inLeftLine) {
            b.commFunc.calLineSize("left", p);
            b.commFunc.setAbsAlignLine("Left", E);
            var u = l ? 0 : -0.5;
            var G = parseInt(g.css("left").replace("px", "")) || 0;
            g.css("left", (G - n + u) + "px");
            a.inLeftLine = false;
            a.showGap = 2
        }
    }
    function d(h) {
        var f = {},
        g = Fai.top.$(window).height();
        h.each(function() {
            var i = c(this);
            _thisId = i.attr("id");
            if (_thisId) {
                f[_thisId] = i[0].getBoundingClientRect();
                if (f[_thisId].top >= g || f[_thisId].bottom <= 0) {
                    return true
                }
            }
        });
        return f
    }
    b.commFunc.calLineSize = function(h, i) {
        var f = Math.min.apply(null, i),
        g = Math.max.apply(null, i);
        switch (h) {
        case "top":
            Fai.top.$("#absAlignTop").css({
                left:
                (f - 15) + "px",
                width: (g - f + 30) + "px"
            });
            break;
        case "right":
            Fai.top.$("#absAlignRight").css({
                top:
                (f - 15) + "px",
                height: (g - f + 30) + "px"
            });
            break;
        case "bottom":
            Fai.top.$("#absAlignBottom").css({
                left:
                (f - 15) + "px",
                width: (g - f + 30) + "px"
            });
            break;
        case "left":
            Fai.top.$("#absAlignLeft").css({
                top:
                (f - 15) + "px",
                height: (g - f + 30) + "px"
            });
            break;
        default:
        }
    };
    b.commFunc.setAbsAlignLine = function(h, i) {
        var f = Fai.top.$("body");
        if (f.find(".absAlign" + h).length < 1) {
            var g = "<div id='absAlign" + h + "' class='absAlign" + h + "' ";
            switch (h) {
            case "Top":
            case "Bottom":
                g += "style='top:" + i + "px;' ";
                break;
            case "Left":
            case "Right":
                g += "style='right:" + i + "px;' ";
                break;
            default:
            }
            g += "></div>";
            f.append(g)
        } else {
            switch (h) {
            case "Top":
                f.find(".absAlign" + h).css({
                    top: i + "px",
                    display: "block"
                });
                break;
            case "Bottom":
                f.find(".absAlign" + h).css({
                    top: (i - 1) + "px",
                    display: "block"
                });
                break;
            case "Left":
                f.find(".absAlign" + h).css({
                    left: i + "px",
                    display: "block"
                });
                break;
            case "Right":
                f.find(".absAlign" + h).css({
                    left: (i - 1) + "px",
                    display: "block"
                });
                break;
            default:
            }
        }
    }
})(jQuery, Site.absAlignLine);
Site.logFontFamilyUse = function(a) {
    var b = 0;
    switch (a) {
    case "SimSun":
        b = 1;
        break;
    case "PMingLiU":
        b = 2;
        break;
    case "FangSong_GB2312":
        b = 3;
        break;
    case "微软雅黑":
        b = 4;
        break;
    case "隶书":
        b = 5;
        break;
    case "幼圆":
        b = 6;
        break;
    case "STKaiti":
        b = 7;
        break;
    case "方正舒体":
        b = 8;
        break;
    case "华文彩云":
        b = 9;
        break;
    case "华文行楷":
        b = 10;
        break;
    case "华文宋体":
        b = 11;
        break;
    case "楷体,楷体_GB2312, SimKai":
        b = 12;
        break;
    case "黑体, SimHei":
        b = 13;
        break;
    case "Arial":
        b = 14;
        break;
    case "Tahoma":
        b = 15;
        break;
    case "impact":
        b = 16;
        break;
    case "Arial Serif":
        b = 17;
        break;
    case "Georgia":
        b = 18;
        break;
    case "Garamond":
        b = 19;
        break;
    case "Times New Roman":
        b = 20;
        break;
    case "andale mono":
        b = 21;
        break;
    case "arial black,avant garde":
        b = 22;
        break;
    case "comic sans ms":
        b = 23;
        break;
    case "哥特体":
        b = 24;
        break;
    case "明朝体":
        b = 25;
        break;
    case "MS P明朝":
        b = 26;
        break;
    case "細明朝体":
        b = 27;
        break;
    case "ヒラギノ明朝 Pro W3":
        b = 28;
        break;
    case "明朝体MS Mincho":
        b = 29;
        break;
    case "Batang":
        b = 30;
        break;
    case "New Batang":
        b = 31;
        break;
    case "Gulim":
        b = 32;
        break;
    case "New Gulim":
        b = 33;
        break;
    default:
        b = 0
    }
    Site.logDog(100101, b)
}; (function() {
    var j = $("#footerResizeWarp");
    if (j.length < 1 || j.find(".u-footerResize-n").length > 0) {
        return
    }
    j.append("<div class='u-footerResize-n' title='可拖动调节间距'></div>");
    j.append("<div class='u-footerResize-s' title='可拖动调节间距'></div>");
    var a = Fai.isIE8() ? $(document) : $(window),
    h = $("#g_main"),
    g = j.find(".u-footerResize-n"),
    b = j.find(".u-footerResize-s"),
    d = j.find(".footerContent"),
    f,
    c = {},
    k = Site.getFooterStyleData(),
    m = 10;
    g.off("mousedown.ft").on("mousedown.ft", l);
    b.off("mousedown.ft").on("mousedown.ft", l);
    function l(n) {
        n = n || window.event;
        c.y = n.pageY;
        a.css("cursor", "n-resize!important");
        if ($(this).hasClass("u-footerResize-n")) {
            c.dir = "n";
            c.ptb = parseInt(d.css("paddingTop"))
        } else {
            if ($(this).hasClass("u-footerResize-s")) {
                c.dir = "s";
                c.ptb = parseInt(d.css("paddingBottom"))
            }
        }
        c.elem = $(this);
        $(this).addClass("u-footerResize-show");
        c.ieFirstChange = $("#saveButton").hasClass("buttonDisabled");
        f = $("#dockTip").show().css({
            left: "-1000px;",
            top: "-1000px"
        });
        a.off("mousemove.ft").on("mousemove.ft", e);
        a.off("mouseup.ft").on("mouseup.ft", i);
        n.preventDefault()
    }
    function e(n) {
        n = n || window.event;
        var v = Site.getFooterStyleData(),
        t = {
            y: n.pageY
        },
        r,
        p,
        o = "";
        if (c.dir == "n") {
            r = c.y - t.y;
            actMTB = c.ptb + r;
            actMTB = actMTB > 0 ? actMTB: 0;
            actMTB = actMTB > 999 ? 999 : actMTB;
            v.f.u = actMTB;
            o = "上边距:";
            p = "padding-top"
        } else {
            if (c.dir == "s") {
                r = t.y - c.y;
                r = r * m;
                actMTB = c.ptb + r;
                actMTB = actMTB > 0 ? actMTB: 0;
                actMTB = actMTB > 999 ? 999 : actMTB;
                v.f.d = actMTB;
                o = "下边距:";
                p = "padding-bottom"
            }
        }
        var s = Fai.top.$("#footerEdgeDistance1"),
        u = Fai.top.$("#upFooterPadding"),
        q = Fai.top.$("#downFooterPadddng");
        if (s.length > 0) {
            if (!s.is(":checked")) {
                s.trigger("click")
            }
            if (c.dir == "n") {
                u.val(actMTB)
            } else {
                if (c.dir == "s") {
                    q.val(actMTB)
                }
            }
        }
        Fai.top.Fai.setCtrlStyleCssList("stylefooter", "footer", [{
            cls: ".footerContent",
            key: p,
            value: actMTB + "px"
        }]);
        f.html(o + actMTB).css({
            left: n.pageX - 28,
            top: n.pageY - 40
        });
        h.scrollTop(h[0].scrollHeight);
        n.preventDefault()
    }
    function i(o) {
        o = o || window.event;
        var n = Site.getFooterStyleData();
        c.dir = "";
        a.css("cursor", "");
        a.off("mousemove.ft");
        a.off("mouseup.ft");
        f.hide();
        c.elem.removeClass("u-footerResize-show");
        Site.saveFooterStyleData(n);
        top._footerStyleChanged++;
        Fai.top._footerStyleData.f.t = 1;
        Site.styleChanged();
        if (Fai.isIE() && c.ieFirstChange) {
            h.scrollTop(h[0].scrollHeight)
        }
        c = {};
        o.preventDefault()
    }
})();
Site.openLocaleEn = function(c, b, d) {
    if (Site.checkSaveBar()) {
        return
    }
    if (!c) {
        if (!window.confirm("确定关闭英文版？")) {
            return
        }
    }
    if (b) {
        Fai.ing("开通失败：已经超过" + d + "天试用期。", false);
        return
    }
    var a = "cmd=openEn&opened=" + c;
    if (c) {
        a += "&_clicka=22"
    } else {
        a += "&_clicka=23"
    }
    Fai.ing("", false);
    $.ajax({
        type: "post",
        url: Site.genAjaxUrl("site_h.jsp"),
        data: a,
        error: function() {
            Fai.ing("系统繁忙，请稍候重试", false)
        },
        success: function(e) {
            if (c) {
                Fai.successHandle(e, "开通成功", "", document.location.href, 0, 1)
            } else {
                Fai.successHandle(e, "关闭成功", "", "/", 0, 1)
            }
        }
    })
};
Site.getCookieFlag = function(c) {
    if (c >= 128) {
        Fai.ing("参数错误", false);
        return
    }
    var a = parseInt(c / 32);
    if (a == 0) {
        a = ""
    }
    var b = Fai.Cookie.get("_siteFlag" + a);
    if (b == null) {
        b = 0
    } else {
        b = parseInt(b)
    }
    return ((b & (1 << c)) != 0) ? true: false
};
Site.setCookieFlag = function(e, b) {
    if (e >= 128) {
        Fai.ing("参数错误", false);
        return
    }
    var a = parseInt(e / 32);
    if (a == 0) {
        a = ""
    }
    var c = Fai.Cookie.get("_siteFlag" + a);
    if (c == null) {
        c = 0
    } else {
        c = parseInt(c)
    }
    if (b) {
        c |= (1 << e)
    } else {
        c &= ~ (1 << e)
    }
    var f = 30 * 12 * 5;
    var d = new Date();
    d.setTime(d.getTime() + f * 24 * 60 * 60 * 1000);
    Fai.Cookie.set("_siteFlag" + a, c, d)
};
Site.changeDesignMode = function(a) {
    if (Site.checkSaveBar()) {
        return
    }
    Fai.Cookie.set("_designMode", a);
    Fai.top.location.reload()
};
Site.getFormsPosTopForms = function(b) {
    if (b == "leftForms" || b == "rightForms" || b == "centerTopForms") {
        var a = Fai.top.$("#topForms");
        if (a.is(":visible")) {
            return a
        }
        return Site.getFormsPosTopForms(a.attr("id"))
    } else {
        if (b == "middleLeftForms" || b == "middleRightForms") {
            var a = Fai.top.$("#centerTopForms");
            if (a.is(":visible")) {
                return a
            }
            return Site.getFormsPosTopForms(a.attr("id"))
        } else {
            if (b == "centerBottomForms") {
                var a = Fai.top.$("#middleLeftForms");
                if (a.is(":visible")) {
                    return a
                }
                return Site.getFormsPosTopForms(a.attr("id"))
            } else {
                if (b == "bottomForms") {
                    var a = Fai.top.$("#centerBottomForms");
                    if (a.is(":visible")) {
                        return a
                    }
                    return Site.getFormsPosTopForms(a.attr("id"))
                }
            }
        }
    }
    return null
};
Site.getModulePosTopForms = function(a) {
    var b = a.parent().attr("id");
    return Site.getFormsPosTopForms(b)
};
Site.getModulePosTopSibling = function(a) {
    if (a.css("position") == "absolute") {
        return null
    }
    var b = a.prevAll(".form").first();
    if (b.length == 0) {
        return null
    }
    return b
};
Site.getModulePosTop = function(d) {
    var a = Fai.top.$("#" + d);
    var b = Site.getModulePosTopSibling(a);
    if (b != null) {
        return 1
    }
    var c = Site.getModulePosTopForms(a);
    if (c != null) {
        return 1
    }
    return - 1
};
Site.moveModulePosTop = function(g) {
    var c = Fai.top.$("#" + g);
    var e = g.replace("module", "");
    var d = Site.getModulePosTopSibling(c);
    if (d != null) {
        c.insertBefore(d)
    } else {
        var f = Site.getModulePosTopForms(c);
        if (f != null) {
            c.appendTo(f)
        } else {
            Fai.ing("不能往上移动模块", true);
            return
        }
    }
    var b = parseInt(c.attr("_infullmeasure")) || 0;
    var a = parseInt(c.attr("_inmulmcol")) || 0;
    if (b > 0) {
        Fai.top.Site.getModuleAttrData(b).changed = true
    }
    if (a > 0) {
        Fai.top.Site.getModuleAttrData(a).changed = true
    }
    Site.removeAllEditLayer();
    Site.refreshForms();
    Site.refreshAllAbsForms();
    Site.moduleSizeChange(g);
    Site.clearModuleOutSide(g);
    if (c.hasClass("formStyle5") || c.hasClass("formStyle77")) {
        Site.refreshModulePhotoSwitch(e)
    }
    Fai.top._moduleMoved++;
    Site.styleChanged();
    c.trigger("Fai_onModuleLayoutChange");
    Site.logDog(100045, 13)
};
Site.getFormsPosBottomForms = function(b) {
    if (b == "topForms") {
        var a = Fai.top.$("#centerTopForms");
        if (a.is(":visible")) {
            return a
        }
        return Site.getFormsPosBottomForms(a.attr("id"))
    } else {
        if (b == "leftForms" || b == "rightForms" || b == "centerBottomForms") {
            var a = Fai.top.$("#bottomForms");
            if (a.is(":visible")) {
                return a
            }
            return Site.getFormsPosBottomForms(a.attr("id"))
        } else {
            if (b == "centerTopForms") {
                var a = Fai.top.$("#middleLeftForms");
                if (a.is(":visible")) {
                    return a
                }
                return Site.getFormsPosBottomForms(a.attr("id"))
            } else {
                if (b == "middleLeftForms" || b == "middleRightForms") {
                    var a = Fai.top.$("#centerBottomForms");
                    if (a.is(":visible")) {
                        return a
                    }
                    return Site.getFormsPosBottomForms(a.attr("id"))
                } else {
                    if (b == "centerBottomForms") {
                        var a = Fai.top.$("#bottomForms");
                        if (a.is(":visible")) {
                            return a
                        }
                        return Site.getFormsPosBottomForms(a.attr("id"))
                    }
                }
            }
        }
    }
    return null
};
Site.getModulePosBottomForms = function(a) {
    var b = a.parent().attr("id");
    return Site.getFormsPosBottomForms(b)
};
Site.getModulePosBottomSibling = function(a) {
    if (a.css("position") == "absolute") {
        return null
    }
    var b = a.nextAll(".form").first();
    if (b.length == 0) {
        return null
    }
    return b
};
Site.getModulePosBottom = function(d) {
    var a = Fai.top.$("#" + d);
    var b = Site.getModulePosBottomSibling(a);
    if (b != null) {
        return 1
    }
    var c = Site.getModulePosBottomForms(a);
    if (c != null) {
        return 1
    }
    return - 1
};
Site.moveModulePosBottom = function(g) {
    var c = Fai.top.$("#" + g);
    var e = g.replace("module", "");
    var d = Site.getModulePosBottomSibling(c);
    if (d != null) {
        c.insertAfter(d)
    } else {
        var f = Site.getModulePosBottomForms(c);
        if (f != null) {
            c.prependTo(f)
        } else {
            Fai.ing("不能往下移动模块", true);
            return
        }
    }
    var b = parseInt(c.attr("_infullmeasure")) || 0;
    var a = parseInt(c.attr("_inmulmcol")) || 0;
    if (b > 0) {
        Fai.top.Site.getModuleAttrData(b).changed = true
    }
    if (a > 0) {
        Fai.top.Site.getModuleAttrData(a).changed = true
    }
    Site.removeAllEditLayer();
    Site.refreshForms();
    Site.refreshAllAbsForms();
    Site.moduleSizeChange(g);
    Site.clearModuleOutSide(g);
    if (c.hasClass("formStyle5") || c.hasClass("formStyle77")) {
        Site.refreshModulePhotoSwitch(e)
    }
    Fai.top._moduleMoved++;
    Site.styleChanged();
    c.trigger("Fai_onModuleLayoutChange");
    Site.logDog(100045, 14)
};
Site.getFormsPosLeftForms = function(b) {
    if (b == "centerTopForms" || b == "middleLeftForms" || b == "centerBottomForms") {
        var a = Fai.top.$("#leftForms");
        if (a.is(":visible")) {
            return a
        }
        return Site.getFormsPosLeftForms(a.attr("id"))
    } else {
        if (b == "middleRightForms") {
            var a = Fai.top.$("#middleLeftForms");
            if (a.is(":visible")) {
                return a
            }
            return Site.getFormsPosLeftForms(a.attr("id"))
        } else {
            if (b == "rightForms") {
                var a = Fai.top.$("#centerTopForms");
                if (a.is(":visible")) {
                    return a
                }
                return Site.getFormsPosLeftForms(a.attr("id"))
            }
        }
    }
    return null
};
Site.getModulePosLeftForms = function(a) {
    var b = a.parent().attr("id");
    return Site.getFormsPosLeftForms(b)
};
Site.getModulePosLeft = function(c) {
    var a = Fai.top.$("#" + c);
    var b = Site.getModulePosLeftForms(a);
    if (b != null) {
        return 1
    }
    return - 1
};
Site.moveModulePosLeft = function(d) {
    var a = Fai.top.$("#" + d);
    var b = d.replace("module", "");
    var c = Site.getModulePosLeftForms(a);
    if (c != null) {
        a.prependTo(c)
    } else {
        Fai.ing("不能往左移动模块", true);
        return
    }
    Site.removeAllEditLayer();
    Site.refreshForms();
    Site.refreshAllAbsForms();
    Site.moduleSizeChange(d);
    Site.clearModuleOutSide(d);
    if (a.hasClass("formStyle5") || a.hasClass("formStyle77")) {
        Site.refreshModulePhotoSwitch(b)
    }
    Fai.top._moduleMoved++;
    Site.styleChanged();
    a.trigger("Fai_onModuleLayoutChange");
    Site.logDog(100045, 15)
};
Site.getFormsPosRightForms = function(b) {
    if (b == "centerTopForms" || b == "middleRightForms" || b == "centerBottomForms") {
        var a = Fai.top.$("#rightForms");
        if (a.is(":visible")) {
            return a
        }
        return Site.getFormsPosRightForms(a.attr("id"))
    } else {
        if (b == "middleLeftForms") {
            var a = Fai.top.$("#middleRightForms");
            if (a.is(":visible")) {
                return a
            }
            return Site.getFormsPosRightForms(a.attr("id"))
        } else {
            if (b == "leftForms") {
                var a = Fai.top.$("#centerTopForms");
                if (a.is(":visible")) {
                    return a
                }
                return Site.getFormsPosRightForms(a.attr("id"))
            }
        }
    }
    return null
};
Site.getModulePosRightForms = function(a) {
    var b = a.parent().attr("id");
    return Site.getFormsPosRightForms(b)
};
Site.getModulePosRight = function(c) {
    var a = Fai.top.$("#" + c);
    var b = Site.getModulePosRightForms(a);
    if (b != null) {
        return 1
    }
    return - 1
};
Site.moveModulePosRight = function(d) {
    var a = Fai.top.$("#" + d);
    var b = d.replace("module", "");
    var c = Site.getModulePosRightForms(a);
    if (c != null) {
        a.prependTo(c)
    } else {
        Fai.ing("不能往右移动模块", true)
    }
    Site.removeAllEditLayer();
    Site.refreshForms();
    Site.refreshAllAbsForms();
    Site.moduleSizeChange(d);
    Site.clearModuleOutSide(d);
    if (a.hasClass("formStyle5") || a.hasClass("formStyle77")) {
        Site.refreshModulePhotoSwitch(b)
    }
    Fai.top._moduleMoved++;
    Site.styleChanged();
    a.trigger("Fai_onModuleLayoutChange");
    Site.logDog(100045, 16)
};
Site.clearModuleOutSide = function(c) {
    var a = parseInt(c.replace("module", ""));
    var b = Fai.top.Site.getModuleAttrPattern(a);
    b.outside.y = 0;
    b.changed = true;
    Site.removeModuleStyleCssList(a, [{
        cls: "",
        key: "padding"
    },
    {
        cls: "",
        key: "margin-right"
    },
    {
        cls: "",
        key: "margin-left"
    },
    {
        cls: "",
        key: "margin-top"
    },
    {
        cls: "",
        key: "margin-bottom"
    }])
};
Site.getFmModulePosTop = function(d) {
    var b = Fai.top.$("#" + d);
    if (!b.hasClass("formStyle80")) {
        return - 1
    }
    var c = b.parent(),
    a = c.children(".form");
    if (c.hasClass("fullmeasureBottomForms")) {
        if (a.index(b) == 0) {
            return 1
        } else {
            return - 1
        }
    } else {
        return - 1
    }
};
Site.getFmModulePosBottom = function(d) {
    var b = Fai.top.$("#" + d);
    if (!b.hasClass("formStyle80")) {
        return - 1
    }
    var c = b.parent(),
    a = c.children(".form");
    if (c.hasClass("fullmeasureTopForms")) {
        if (a.index(b) == (a.length - 1)) {
            return 1
        } else {
            return - 1
        }
    } else {
        return - 1
    }
};
Site.moveFmModulePosTop = function(c) {
    var a = Fai.top.$("#" + c);
    if (!a.hasClass("formStyle80")) {
        return
    }
    var b = a.parent();
    if (b.hasClass("fullmeasureBottomForms")) {
        if (Site.isLayoutHidden(24)) {
            Site.showLayout(24)
        }
        Fai.top.$("#" + Site.getLayoutForms(24)).append(a);
        Site.scrollToModuleDiv(a);
        Site.removeAllEditLayer();
        Site.refreshForms();
        Fai.top._moduleMoved++;
        Site.styleChanged();
        a.trigger("Fai_onModuleLayoutChange");
        Site.logDog(100045, 13)
    }
};
Site.moveFmModulePosBottom = function(c) {
    var a = Fai.top.$("#" + c);
    if (!a.hasClass("formStyle80")) {
        return
    }
    var b = a.parent();
    if (b.hasClass("fullmeasureTopForms")) {
        if (Site.isLayoutHidden(25)) {
            Site.showLayout(25)
        }
        Fai.top.$("#" + Site.getLayoutForms(25)).prepend(a);
        Site.scrollToModuleDiv(a);
        Site.removeAllEditLayer();
        Site.refreshForms();
        Fai.top._moduleMoved++;
        Site.styleChanged();
        a.trigger("Fai_onModuleLayoutChange");
        Site.logDog(100045, 14)
    }
};
Site.publishScheme = function(b, a) {
    if (window.confirm("确定发布方案" + b + "？")) {
        Fai.ing("正在发布……", false);
        $.ajax({
            type: "post",
            url: "/static/web/ajax/site_h.jsp",
            data: "cmd=publish&id=" + b,
            error: function() {
                Fai.ing("系统繁忙，请稍候重试", true)
            },
            success: function(c) {
                Fai.successHandle(c, "发布成功", "", a, 1, 1)
            }
        })
    }
};
Site.initPageAuth = function(c, b, a) {
    Site.initTopBar(c);
    Site.initSiteBulletin(c);
    Site.initSiteRenewNotice(b);
    Site.footerLogin(a)
};
Site.initPageDesign = function(g, e, d, c, a) {
    Site.sortable();
    Site.floatModuleDraggable($(".absForms .form"));
    Site.floatModuleDraggable($(".floatForms .form"));
    Site.designInitStyleTabs();
    Site.bindInLayoutResizableModule();
    var b = Fai.top.$("#middleLeftForms");
    var h = Fai.top.$("#middleRightForms");
    if (b.css("display") == "block" && h.css("display") == "block") {
        var i = $(".containerFormsCenterMiddle").width();
        $("#middleLeftForms").css("padding-right", Math.floor(i * 0.02))
    }
    Site.dockModuleResize($(".form"));
    var f = $(".formStyle1 img.richModuleSlaveImg");
    Site.richModuleSlaveImgResize(f);
    Site.richModulePicEdit(f);
    Site.bindGobalEvent("site_refreshModule",
    function(k, l) {
        var j = Fai.top.$("#module" + l).find("img.richModuleSlaveImg");
        Site.richModuleSlaveImgResize(j);
        Site.richModulePicEdit(j)
    });
    Site.bindGobalEvent("site_addNewModule",
    function(k, m) {
        var l = Fai.top.$("#module" + m);
        var j = l.find("img.richModuleSlaveImg");
        Site.richModuleSlaveImgResize(j);
        Site.richModulePicEdit(j);
        if (l.hasClass("formStyle80")) {
            Fai.top.$(".fullmeasureContent").each(function(n, o) {
                Site.inFullmeasureModuleSortable($(o).attr("id"))
            })
        }
    });
    if ((g && !Site.getCookieFlag(0) && e <= 0)) {
        Site.setCookieFlag(0, true);
        Site.guide_init(a);
        Site.logDog(100037, 1)
    }
    if (g) {
        if ($.cookie("usedRapidSiteNum") == null) {
            $.cookie("usedRapidSiteNum", 0, {
                expires: 7
            })
        } else {}
    }
    if (e > 0) {
        Site.showCloneDemo(e, d, c)
    }
};
Site.closeImagePage = function() {
    if (confirm("您确定要关闭欢迎页?")) {
        $.ajax({
            type: "post",
            url: "/static/web/ajax/site_h.jsp?cmd=set",
            data: "schemeFlag8=false",
            success: function(a) {
                Fai.successHandle(a, "成功关闭欢迎页。", "", "/index.jsp", 1, 1)
            }
        })
    }
};
Site.htmlChoiceImage = function(a) {
    var b = {
        title: "添加图片",
        maxSize: 5,
        type: ["jpg", "jpeg", "bmp", "png", "gif"],
        imgMode: 2,
        maxChoiceList: 10,
        netFileMode: true
    };
    Site._htmlTmpData = a;
    Site.fileUpload2("", b, Site.htmlUploadBack)
};
Site.htmlChoiceDefImage = function(a) {
    var b = {
        title: "添加图片",
        maxSize: 5,
        type: ["jpg", "jpeg", "bmp", "png", "gif"],
        imgMode: 2,
        maxChoiceList: 1,
        netFileMode: true
    };
    Site._htmlTmpData = a;
    Site.fileUpload2("", b, Site.htmlUploadBackDefImage)
};
Site.htmlChoiceHoverImage = function(a) {
    var b = a.options.hoverImageData.defImg;
    if (typeof b.id == "undefined" && typeof b.path == "undefined") {
        Fai.ing("请先设置默认图片, 再设置鼠标悬停图片.", true);
        return
    }
    var c = {
        title: "添加图片",
        maxSize: 5,
        type: ["jpg", "jpeg", "bmp", "png", "gif"],
        imgMode: 2,
        maxChoiceList: 1,
        netFileMode: true
    };
    Site._htmlTmpData = a;
    Site.fileUpload2("", c, Site.htmlUploadBackHoverImage)
};
Site.htmlChoiceMP4 = function(a) {
    var b = {
        title: "添加MP4",
        maxSize: parseInt(top.file_size_limit) || 5,
        type: ["mp4"],
        imgMode: 2,
        maxChoiceList: 1,
        netFileMode: true
    };
    Site._htmlTmpData = a;
    Site.fileUpload2("", b, Site.htmlUploadBackMp4)
};
Site.htmlChoiceFlash = function(a) {
    var b = {
        title: "添加Flash",
        maxSize: 5,
        type: ["swf"],
        imgMode: 2,
        maxChoiceList: 10,
        netFileMode: true
    };
    Site._htmlTmpData = a;
    Site.fileUpload2("", b, Site.htmlUploadBackFlash)
};
Site.htmlUploadBack = function(b) {
    var f = "";
    if (b) {
        var e = $.parseJSON(b);
        e = e.data;
        if (e.length) {
            for (var c = 0; c < e.length; c++) {
                var d = e[c].fileWidth;
                var a = e[c].fileHeight;
                f += '<img src="' + e[c].filePath + '"';
                if (d && a) {
                    f += ' width="' + d + '"';
                    f += ' height="' + a + '"'
                }
                f += "/>"
            }
        } else {
            f = ""
        }
    }
    if (Site._htmlTmpData) {
        Site._htmlTmpData.pasteChoiceImage(f)
    }
};
Site.htmlUploadBackDefImage = function(a) {
    var d = "";
    if (a) {
        var c = $.parseJSON(a);
        var b = Site._htmlTmpData.options.hoverImageData.defImg;
        c = c.data;
        if (c.length) {
            b.id = c[0].fileId;
            b.path = c[0].filePath;
            b.width = c[0].fileWidth;
            b.height = c[0].fileHeight;
            Site._htmlTmpData.options.addHoverThumb(true)
        }
    }
};
Site.htmlUploadBackHoverImage = function(a) {
    var e = "";
    var d = {};
    if (a) {
        d = $.parseJSON(a);
        d = d.data
    }
    if (Site._htmlTmpData && d.length > 0) {
        var f = Site._htmlTmpData.options.hoverImageData.hovImg;
        var b = d[0].fileId;
        var c = d[0].filePath;
        if (c && c != "") {
            f.id = b;
            f.path = d[0].filePath;
            Site._htmlTmpData.options.addHoverThumb(false)
        }
    }
};
Site.htmlUploadBackMp4 = function(a) {
    var c = "";
    if (a) {
        var b = $.parseJSON(a);
        b = b.data;
        if (b.length) {
            c = '<p style="TEXT-ALIGN:center;LINE-HEIGHT:0px"><br /></p><p style="text-align:center;line-height:0px;"><video style="WIDTH:400px;BACKGROUND:#000;HEIGHT:400px" controls="controls"><source src="' + b[0].filePath + '" type="video/mp4" /><embed width="400" height="400" type="application/x-shockwave-flash" src="' + Fai.top._resRoot + "/js/comm/jwplayer/jwplayer.swf?file=" + b[0].filePath + '" allowfullscreen="true" /></video><br /></p>'
        } else {
            c = ""
        }
    }
    if (Site._htmlTmpData) {
        Site._htmlTmpData.pasteChoiceMp4(c)
    }
};
Site.htmlUploadBackFlash = function(b) {
    var f = "";
    if (b) {
        var e = $.parseJSON(b);
        e = e.data;
        if (e.length) {
            for (var c = 0; c < e.length; c++) {
                var d = e[c].fileWidth;
                var a = e[c].fileHeight;
                f += '<embed type="application/x-shockwave-flash" classid="clsid:d27cdb6e-ae6d-11cf-96b8-4445535400000" quality="high" menu="false" play="true" loop="true"  src="' + e[c].filePath + '"';
                if (d && a) {
                    f += ' width="' + d + '"';
                    f += ' height="' + a + '"'
                }
                f += "/>"
            }
        } else {
            f = ""
        }
    }
    if (Site._htmlTmpData) {
        Site._htmlTmpData.pasteChoiceFlash(f)
    }
};
Site.guide_init = function(a) {
    if (Fai.top._isFaier) {
        return
    }
    if (a && a >= 2) {
        return
    }
    Fai.bg();
    Site.guide_append(0)
};
Site.guide_append = function(c) {
    var b = 0;
    if (c == 3) {
        $("body").append('<div id="guide_main" class="guide_main"></div><div id="guide_body" class="guide_body' + c + '"><div id="guide_btn" class="guide_btn"></div></div>');
        $("body").append('<div id="guide_img" class="guide_img' + c + '"></div>');
        $("#guide_body").append('<div id="guide_top" class="guide_top2"><div id="guide_step" class="guide_step"></div></div>')
    } else {
        $("body").append('<div id="guide_main" class="guide_main"><div id="guide_body" class="guide_body' + c + '"><div id="guide_btn" class="guide_btn"></div></div></div>');
        if (c < 3) {
            $("#guide_main").append('<div id="guide_img" class="guide_img' + c + '"></div>');
            $("#guide_body").append('<div id="guide_top" class="guide_top1"><div id="guide_step" class="guide_step"></div></div>')
        } else {
            $("#guide_body").append('<div id="guide_top" class="guide_top2"><div id="guide_step" class="guide_step"></div></div>')
        }
    }
    var a = $("#topBarArea").css("top");
    $("#guide_main").css("top", a);
    if (c < 4) {
        $("#guide_btn").append('<a id="guide_next" href="javascript:;" class="guide_next' + c + '" onclick="Site.guide_change(' + (c + 1) + ')"></a><a id="guide_exit" href="javascript:;" class="guide_exit" onclick="Site.logDog(100037, 0);Site.guide_rapid();"></a>')
    } else {
        $("#guide_btn").append("<a hidefocus='true' href='javascript:Site.logDog(100037, 3);Site.guide_rapid();' id=\"guide_start\" class=\"guide_start_single\"></a>")
    }
    for (b = 0; b < 5; b++) {
        $("#guide_step").append('<span id="guide_graw' + b + '" class="guide_graw" onclick="Site.guide_change(' + b + ')"></span>')
    }
    $("#guide_graw" + c).addClass("guide_graw_now");
    Site.guide_setSpeicalStyle(c)
};
Site.guide_setSpeicalStyle = function(f) {
    if (f == 3) {
        var c = $("#guide_img");
        var e = $("#guide_body");
        var b = $("#faiFloatPanelIconContainer").offset();
        var g = $("#faiFloatPanelIconContainer").width() + 10;
        var d = $(e).offset();
        var a = $(e).height() / 2 - 25;
        $(e).css({
            top: b.top - a + "px",
            left: b.left + g + "px"
        });
        $(c).css({
            top: b.top + "px",
            left: b.left + "px"
        })
    }
};
Site.guide_rapid = function() {
    Site.rapidSite.init();
    $("#guide_main").remove();
    $("#guide_img").remove();
    $("#guide_body").remove()
};
Site.guide_exit = function(a) {
    $("#guide_main").remove();
    $("#guide_img").remove();
    $("#guide_body").remove();
    Fai.removeBg();
    if (!a) {
        Site.logDog(100037, 0)
    } else {
        Site.logDog(100037, 4)
    }
};
Site.guide_change = function(a) {
    $("#guide_main").remove();
    $("#guide_img").remove();
    $("#guide_body").remove();
    Site.guide_append(a)
};
Site.footerLogin = function(a) {
    if (a < 2) {
        Site.showTip({
            tid: "#footerLogin a",
            content: "您下次可以从此处快捷登录&nbsp;&nbsp;<a hidefocus='true' href='javascript:;' onclick='Fai.closeTip(\"#footerLogin a\");Site.setCookieFlag(37, true);' style='color:red;'>我知道了</a>",
            appendToId: "#web",
            autoLocation: true,
            cusStyle: "z-index:9031;"
        },
        37);
        Site.bindGobalEvent("siteLayoutChange",
        function(c, b) {
            Fai.top.Fai.refreshTip("#footerLogin a")
        });
        Site.bindGobalEvent("site_addNewModule",
        function(c, b) {
            Fai.top.Fai.refreshTip("#footerLogin a")
        });
        Site.bindGobalEvent("site_addModule",
        function(c, b) {
            Fai.top.Fai.refreshTip("#footerLogin a")
        })
    }
};
Site.redirectUrl = function(a, e, c, d, f) {
    if (typeof a != "undefined") {
        if (Fai.top._changeStyleNum > 0) {
            Fai.top.$(".faiColorPicker").remove();
            if (e == "_self" || e == "cancelBtn") {
                var b = f ? "网站样式发生修改，您要放弃这些修改么": "您的网站设计已经更改，是否立即保存？";
                var g = {};
                g.fun = Site.saveDesignToCheckUpRedirectUrl;
                g.args = new Array();
                g.args.push(a);
                Site.popupStyleChangeBodyWindow(b, g, f, true);
                if (c && c.stopPropagation) {
                    c.stopPropagation();
                    c.preventDefault()
                } else {
                    window.event.cancelBubble = true;
                    window.event.returnValue = false
                }
                return false
            } else {
                window.open(a, e)
            }
        } else {
            if (d == 1) {
                window.open(a, e)
            }
        }
    }
};
Site.saveDesignToCheckUpRedirectUrl = function(a) {
    if (a != null) {
        document.location.href = a;
        if (a == "javascript:;") {
            Fai.top.location.reload()
        }
    }
};
Site.overlay = function(b) {
    var a = [];
    a.push("<div id='findModuleDiv' class='findModuleDiv' style='position:absolute; top:" + (b.moduleTop - 8) + "px; left:" + (b.moduleLeft - 3) + "px; border:2px solid #f40;border-top-width:7px; z-index:100;'>");
    a.push("<div style='border:1px solid #fff;'><div style='background:#000; opacity:0.4; filter:alpha(opacity=40);width:" + b.moduleWidth + "px; height:" + b.moduleHeight + "px; '></div>");
    a.push("<div style='position:absolute;left:50%;top:50%;margin-left:-25px;margin-top:-25px;width:51px;height:51px;background:transparent url(" + Fai.top._resRoot + "/image/tip.gif?v=201404211853) no-repeat 0 0;opacity:0.8; filter:alpha(opacity=80);'></div>");
    a.push("</div></div>");
    Fai.top.$("body").append(a.join(""))
};
Site.removeOverlay = function() {
    Fai.top.$("#findModuleDiv").remove()
};
Site.siteGuidePopupWindow = function() {
    var a = {
        width: 814,
        height: 560,
        frameSrcUrl: "manage/siteGuide.jsp",
        closeBtnClass: "sgCloseBtn",
        bannerDisplay: false,
        frameScrolling: "no",
        animate: true,
        animateTarget: "#choiceService",
        saveBeforePopup: false,
        animateOnClose: Site.isAutoContractStyleDesign
    };
    Site.popupWindow(a)
};
Site.isAutoContractStyleDesign = function() {
    if (Fai.top._guideStyleDesignShow == 1 && Fai.top._guideStyleDesignShow != undefined) {
        setTimeout(function() {
            Fai.top._guideStyleDesignShow = 0;
            Fai.top.$("#styleDesign").show();
            Site.showTopBar()
        },
        200)
    }
};
Site.siteGuideInit = function() {
    if (Fai.top._oem || !Fai.top._manageMode) {
        return
    }
    var d = "";
    var c = "";
    var b = -1;
    var a = [];
    if ($.cookie("isSiteGuideClick") == null) {
        $.cookie("isSiteGuideClick", 0, {
            expires: 365,
            path: "/"
        })
    }
    if ($.cookie("siteGuideProcessArr") == null) {
        $.cookie("siteGuideProcessArr", "10000", {
            expires: 365,
            path: "/"
        })
    }
    b = parseInt($.cookie("isSiteGuideClick"));
    a = $.cookie("siteGuideProcessArr").split("");
    if (_signupDays < 7 && !b) {
        e();
        $(window).resize(e);
        if ($("#guideQuick").length == 1) {
            $("#guideQuick").show()
        }
    } else {
        if ($.cookie("isSiteGuideClick") == null) {
            $.cookie("isSiteGuideClick", 1, {
                expires: 365,
                path: "/"
            })
        }
        if ($.cookie("siteGuideProcessArr") == null) {
            $.cookie("siteGuideProcessArr", "11111", {
                expires: 365,
                path: "/"
            })
        }
        if ($("#guideQuick").length == 1) {
            $("#guideQuick").hide()
        }
    }
    function e() {
        var f = $.cookie("faiFloatPanelIcon_left", {
            path: "/"
        });
        if (f != undefined) {
            return
        }
        if ($("#faiFloatPanelIconContainer").length != 1) {
            return
        }
        if ($("#guideQuick").length != 1) {
            return
        }
        var h = $("#faiFloatPanelIconContainer").offset().top - $("#guideQuick").height() - 10;
        var g = $("#faiFloatPanelIconContainer").offset().left + 2;
        $("#guideQuick").css("top", h).css("left", g);
        if (g == undefined) {
            g = $("#faiFloatPanelIconContainer").offset().right + 2;
            $("#guideQuick").css("left", 0).css("right", g)
        }
    }
};
Site.refreshGuideQuickIconStyle = function() {
    var c = Fai.top.$("#faiFloatPanelIconContainer");
    var d = Fai.top.$("#guideQuick");
    if (c.length < 1) {
        return
    }
    if (d.length < 1) {
        return
    }
    var b = parseInt($.cookie("isSiteGuideClick", {
        path: "/"
    }));
    if (Fai.top._signupDays < 7 && !b) {
        var a = Fai.top.$(".floatLeftTop").offset().top;
        var g = c.offset().top;
        var e = c.offset().left;
        var f = d.height() + 10;
        if (parseInt(g - a) > f) {
            d.css({
                top: parseInt(g - f) + "px"
            })
        } else {
            c.css({
                top: parseInt(a + f) + "px"
            });
            d.css({
                top: a + "px"
            })
        }
        d.css({
            left: (e + 2) + "px"
        })
    }
};
Site.LayoutMiddleLeftRightReset = function() {
    var b = Fai.top.$("#middleLeftForms");
    var a = Fai.top.$("#middleRightForms");
    var c = Fai.top.$(".containerFormsCenterMiddle");
    if (b.css("display") == "block" && a.css("display") == "block") {
        b.css("width", "49%");
        a.css("width", "49%");
        Fai.top._colOtherStyleData.layout4Width = 0;
        Fai.top._colOtherStyleData.layout5Width = 0;
        b.css("padding-right", Math.floor(c.width() * 0.02));
        Fai.top.Site.bindInLayoutResizableModule()
    }
};
Site.getImageInfo = function(c) {
    var a = new Image();
    var b = {};
    a.src = $(c).attr("src");
    if (a.width > 0 || a.height > 0) {
        b.w = a.width;
        b.h = a.height;
        b.s = b.w / b.h
    }
    a = null;
    return b
}; (function(d) {
    var f = d("#webTemplateFrame"),
    b = d("#webBannerFrame"),
    a = d("#pageLayoutFrame"),
    h = d("#webSettingFrame"),
    e = d("#baiduOptFrame");
    var c = d("#styleDesign").children(".tabsWrap").height();
    var g = ~~ (d.cookie("styleDesignHeight", {
        path: "/"
    })) - c;
    if (g > 100) {
        f.css("height", g);
        b.css("height", g);
        a.css("height", g);
        h.css("height", g);
        e.css("height", g)
    }
    d("#styleDesign").resizable({
        distance: 0,
        handles: "s",
        maxHeight: 460,
        minHeight: 240,
        start: function(i, j) {
            d(this).append("<div class='J_iframeCover' style='position:absolute;top:0;left:0;width:100%;height:100%;background:#fff;opacity:0;filter:alpha(opacity=0);'></div>");
            g = j.size.height - c;
            Site.triggerGobalEvent("styleDesignResize", g);
            Site.refreshStyleDesignFrameHeight(g)
        },
        resize: function(i, j) {
            g = j.size.height - c;
            Site.triggerGobalEvent("styleDesignResize", g);
            Site.refreshStyleDesignFrameHeight(g)
        },
        stop: function(j, k) {
            var i = d(this).find(".J_iframeCover").height() || 240;
            g = i - c;
            Site.triggerGobalEvent("styleDesignResize", g);
            Site.refreshStyleDesignFrameHeight(g);
            d(this).children(".J_iframeCover").remove();
            Site.resetGmainPos();
            Site.functionInterface({
                name: "refreshFaiFloatPanelIconStyle"
            });
            Site.refreshNavFixtop();
            d.cookie("styleDesignHeight", i, {
                expires: 365,
                path: "/"
            })
        }
    })
})(jQuery);
Site.refreshStyleDesignFrameHeight = function(h) {
    var e = Fai.top.$("#webTemplateFrame"),
    c = Fai.top.$("#webBannerFrame"),
    i = Fai.top.$("#pageLayoutFrame"),
    f = Fai.top.$("#webSettingFrame"),
    g = Fai.top.$("#baiduOptFrame"),
    j = Fai.top.$("#newRapidSiteMainFrame"),
    d = Fai.top.$("#newRapidSiteMain"),
    a = Fai.top.$("#newRapidSitePreview"),
    b = Fai.top.$("#styleDesign");
    b.css("height", (b.children(".tabsWrap").outerHeight() + h) + "px");
    e.css("height", h);
    c.css("height", h);
    i.css("height", h);
    f.css("height", h);
    g.css("height", h);
    j.css("height", h);
    if (d.length > 0) {
        d.css("height", h);
        a.css("top", (d.offset().top + d.outerHeight()) + "px")
    }
};
Site.cusModuleHoverFont = function(b, a) {
    Site.setModuleStyleCssList(b, [{
        cls: ".formMiddle.formMiddle" + b + " .g_hover a span",
        key: "color",
        value: a.c
    },
    {
        cls: ".formMiddle.formMiddle" + b + " .g_hover a span",
        key: "font-size",
        value: a.s + "px"
    },
    {
        cls: ".formMiddle.formMiddle" + b + " .g_hover a span",
        key: "font-family",
        value: a.f
    },
    {
        cls: ".formMiddle.formMiddle" + b + " .g_hover a span",
        key: "font-weight",
        value: (a.w == 1 ? "bold": "normal")
    },
    {
        cls: ".formMiddle.formMiddle" + b + " .g_hover a span",
        key: "text-decoration",
        value: (a.u == 1 ? "underline": "blink")
    },
    {
        cls: ".formMiddle.formMiddle" + b + " .g_hover a",
        key: "color",
        value: a.c
    },
    {
        cls: ".formMiddle.formMiddle" + b + " .g_hover a",
        key: "font-size",
        value: a.s + "px"
    },
    {
        cls: ".formMiddle.formMiddle" + b + " .g_hover a",
        key: "font-family",
        value: a.f
    },
    {
        cls: ".formMiddle.formMiddle" + b + " .g_hover a",
        key: "font-weight",
        value: (a.w == 1 ? "bold": "normal")
    },
    {
        cls: ".formMiddle.formMiddle" + b + " .g_hover a",
        key: "text-decoration",
        value: (a.u == 1 ? "underline": "blink")
    },
    {
        cls: ".formMiddle.formMiddle" + b + " .g_hover",
        key: "color",
        value: a.c
    },
    {
        cls: ".formMiddle.formMiddle" + b + " .g_hover",
        key: "font-size",
        value: a.s + "px"
    },
    {
        cls: ".formMiddle.formMiddle" + b + " .g_hover",
        key: "font-family",
        value: a.f
    },
    {
        cls: ".formMiddle.formMiddle" + b + " .g_hover",
        key: "font-weight",
        value: (a.w == 1 ? "bold": "normal")
    },
    {
        cls: ".formMiddle.formMiddle" + b + " .g_hover",
        key: "text-decoration",
        value: (a.u == 1 ? "underline": "blink")
    }])
};
Site.sysModuleHoverFont = function(a) {
    Site.removeModuleStyleCssList(a, [{
        cls: ".formMiddle.formMiddle" + a + " .g_hover a span",
        key: "color"
    },
    {
        cls: ".formMiddle.formMiddle" + a + " .g_hover a span",
        key: "font-size"
    },
    {
        cls: ".formMiddle.formMiddle" + a + " .g_hover a span",
        key: "font-family"
    },
    {
        cls: ".formMiddle.formMiddle" + a + " .g_hover a span",
        key: "font-weight"
    },
    {
        cls: ".formMiddle.formMiddle" + a + " .g_hover a span",
        key: "text-decoration"
    },
    {
        cls: ".formMiddle.formMiddle" + a + " .g_hover a",
        key: "color"
    },
    {
        cls: ".formMiddle.formMiddle" + a + " .g_hover a",
        key: "font-size"
    },
    {
        cls: ".formMiddle.formMiddle" + a + " .g_hover a",
        key: "font-family"
    },
    {
        cls: ".formMiddle.formMiddle" + a + " .g_hover a",
        key: "font-weight"
    },
    {
        cls: ".formMiddle.formMiddle" + a + " .g_hover a",
        key: "text-decoration"
    },
    {
        cls: ".formMiddle.formMiddle" + a + " .g_hover",
        key: "color"
    },
    {
        cls: ".formMiddle.formMiddle" + a + " .g_hover",
        key: "font-size"
    },
    {
        cls: ".formMiddle.formMiddle" + a + " .g_hover",
        key: "font-family"
    },
    {
        cls: ".formMiddle.formMiddle" + a + " .g_hover",
        key: "font-weight"
    },
    {
        cls: ".formMiddle.formMiddle" + a + " .g_hover",
        key: "text-decoration"
    }])
};
Site.cusModuleContentHoverBg = function(c, a, b) {
    Site.setModuleStyleCssList(c, [{
        cls: ".formMiddle.formMiddle" + c + " .g_hover",
        key: "background",
        value: a
    }]);
    if (b == 4) {
        Site.setModuleStyleCss(c, ".formMiddle.formMiddle" + c + " .g_hover", "background-size", "100% 100%")
    } else {
        if (b == 5) {
            Site.setModuleStyleCss(c, ".formMiddle.formMiddle" + c + " .g_hover", "background-size", "100%")
        }
    }
};
Site.hideModuleContentHoverBg = function(a) {
    Site.setModuleStyleCssList(a, [{
        cls: ".formMiddle.formMiddle" + a + " .g_hover",
        key: "background",
        value: "none"
    }])
};
Site.showModuleContentHoverBg = function(a) {
    Site.removeModuleStyleCssList(a, [{
        cls: ".formMiddle.formMiddle" + a + " .g_hover",
        key: "background"
    },
    {
        cls: ".formMiddle.formMiddle" + a + " .g_hover",
        key: "background-size"
    }])
};
Site.cusModuleSelectFont = function(b, a) {
    Site.setModuleStyleCssList(b, [{
        cls: ".formMiddle" + b + " .g_selected a span",
        key: "color",
        value: a.c
    },
    {
        cls: ".formMiddle" + b + " .g_selected a span",
        key: "font-size",
        value: a.s + "px"
    },
    {
        cls: ".formMiddle" + b + " .g_selected a span",
        key: "font-family",
        value: a.f
    },
    {
        cls: ".formMiddle" + b + " .g_selected a span",
        key: "font-weight",
        value: (a.w == 1 ? "bold": "normal")
    },
    {
        cls: ".formMiddle" + b + " .g_selected a span",
        key: "text-decoration",
        value: (a.u == 1 ? "underline": "blink")
    },
    {
        cls: ".formMiddle" + b + " .g_selected a",
        key: "color",
        value: a.c
    },
    {
        cls: ".formMiddle" + b + " .g_selected a",
        key: "font-size",
        value: a.s + "px"
    },
    {
        cls: ".formMiddle" + b + " .g_selected a",
        key: "font-family",
        value: a.f
    },
    {
        cls: ".formMiddle" + b + " .g_selected a",
        key: "font-weight",
        value: (a.w == 1 ? "bold": "normal")
    },
    {
        cls: ".formMiddle" + b + " .g_selected a",
        key: "text-decoration",
        value: (a.u == 1 ? "underline": "blink")
    },
    {
        cls: ".formMiddle" + b + " .g_selected",
        key: "color",
        value: a.c
    },
    {
        cls: ".formMiddle" + b + " .g_selected",
        key: "font-size",
        value: a.s + "px"
    },
    {
        cls: ".formMiddle" + b + " .g_selected",
        key: "font-family",
        value: a.f
    },
    {
        cls: ".formMiddle" + b + " .g_selected",
        key: "font-weight",
        value: (a.w == 1 ? "bold": "normal")
    },
    {
        cls: ".formMiddle" + b + " .g_selected",
        key: "text-decoration",
        value: (a.u == 1 ? "underline": "blink")
    }])
};
Site.sysModuleSelectFont = function(a) {
    Site.removeModuleStyleCssList(a, [{
        cls: ".formMiddle" + a + " .g_selected a span",
        key: "color"
    },
    {
        cls: ".formMiddle" + a + " .g_selected a span",
        key: "font-size"
    },
    {
        cls: ".formMiddle" + a + " .g_selected a span",
        key: "font-family"
    },
    {
        cls: ".formMiddle" + a + " .g_selected a span",
        key: "font-weight"
    },
    {
        cls: ".formMiddle" + a + " .g_selected a span",
        key: "text-decoration"
    },
    {
        cls: ".formMiddle" + a + " .g_selected a",
        key: "color"
    },
    {
        cls: ".formMiddle" + a + " .g_selected a",
        key: "font-size"
    },
    {
        cls: ".formMiddle" + a + " .g_selected a",
        key: "font-family"
    },
    {
        cls: ".formMiddle" + a + " .g_selected a",
        key: "font-weight"
    },
    {
        cls: ".formMiddle" + a + " .g_selected a",
        key: "text-decoration"
    },
    {
        cls: ".formMiddle" + a + " .g_selected",
        key: "color"
    },
    {
        cls: ".formMiddle" + a + " .g_selected",
        key: "font-size"
    },
    {
        cls: ".formMiddle" + a + " .g_selected",
        key: "font-family"
    },
    {
        cls: ".formMiddle" + a + " .g_selected",
        key: "font-weight"
    },
    {
        cls: ".formMiddle" + a + " .g_selected",
        key: "text-decoration"
    }])
};
Site.cusModuleContentSelectBg = function(c, a, b) {
    Site.setModuleStyleCssList(c, [{
        cls: ".formMiddle" + c + " .g_selected",
        key: "background",
        value: a
    }]);
    if (b == 4) {
        Site.setModuleStyleCss(c, ".formMiddle" + c + " .g_selected", "background-size", "100% 100%")
    } else {
        if (b == 5) {
            Site.setModuleStyleCss(c, ".formMiddle" + c + " .g_selected", "background-size", "100%")
        }
    }
};
Site.hideModuleContentSelectBg = function(a) {
    Site.setModuleStyleCssList(a, [{
        cls: ".formMiddle" + a + " .g_selected",
        key: "background",
        value: "none"
    }])
};
Site.showModuleContentSelectBg = function(a) {
    Site.removeModuleStyleCssList(a, [{
        cls: ".formMiddle" + a + " .g_selected",
        key: "background"
    },
    {
        cls: ".formMiddle" + a + " .g_selected",
        key: "background-size"
    }])
};
Site.showRepeatTip = function(a) {
    if (a == 4 || a == 5) {
        Fai.ing("在低版本浏览器时效果为'完全平铺'", true)
    }
}; (function(h, m, n, d) {
    var e = "mCustomScrollbar",
    a = "mCS",
    l = ".mCustomScrollbar",
    f = {
        setWidth: false,
        setHeight: false,
        setTop: 0,
        setLeft: 0,
        axis: "y",
        scrollbarPosition: "inside",
        scrollInertia: 950,
        autoDraggerLength: true,
        autoHideScrollbar: false,
        autoExpandScrollbar: false,
        alwaysShowScrollbar: 0,
        snapAmount: null,
        snapOffset: 0,
        mouseWheel: {
            enable: true,
            scrollAmount: "auto",
            axis: "y",
            preventDefault: false,
            deltaFactor: "auto",
            normalizeDelta: false,
            invert: false,
            disableOver: ["select", "option", "keygen", "datalist", "textarea"]
        },
        scrollButtons: {
            enable: false,
            scrollType: "stepless",
            scrollAmount: "auto"
        },
        keyboard: {
            enable: true,
            scrollType: "stepless",
            scrollAmount: "auto"
        },
        contentTouchScroll: 25,
        advanced: {
            autoExpandHorizontalScroll: false,
            autoScrollOnFocus: "input,textarea,select,button,datalist,keygen,a[tabindex],area,object,[contenteditable='true']",
            updateOnContentResize: true,
            updateOnImageLoad: true,
            updateOnSelectorChange: false
        },
        theme: "light",
        callbacks: {
            onScrollStart: false,
            onScroll: false,
            onTotalScroll: false,
            onTotalScrollBack: false,
            whileScrolling: false,
            onTotalScrollOffset: 0,
            onTotalScrollBackOffset: 0,
            alwaysTriggerOffsets: true
        },
        live: false,
        liveSelector: null
    },
    k = 0,
    p = {},
    c = function(q) {
        if (p[q]) {
            clearTimeout(p[q]);
            g._delete.call(null, p[q])
        }
    },
    j = (m.attachEvent && !m.addEventListener) ? 1 : 0,
    o = false,
    b = {
        init: function(r) {
            var r = h.extend(true, {},
            f, r),
            q = g._selector.call(this);
            if (r.live) {
                var t = r.liveSelector || this.selector || l,
                s = h(t);
                if (r.live === "off") {
                    c(t);
                    return
                }
                p[t] = setTimeout(function() {
                    s.mCustomScrollbar(r);
                    if (r.live === "once" && s.length) {
                        c(t)
                    }
                },
                500)
            } else {
                c(t)
            }
            r.setWidth = (r.set_width) ? r.set_width: r.setWidth;
            r.setHeight = (r.set_height) ? r.set_height: r.setHeight;
            r.axis = (r.horizontalScroll) ? "x": g._findAxis.call(null, r.axis);
            r.scrollInertia = r.scrollInertia < 17 ? 17 : r.scrollInertia;
            if (typeof r.mouseWheel !== "object" && r.mouseWheel == true) {
                r.mouseWheel = {
                    enable: true,
                    scrollAmount: "auto",
                    axis: "y",
                    preventDefault: false,
                    deltaFactor: "auto",
                    normalizeDelta: false,
                    invert: false
                }
            }
            r.mouseWheel.scrollAmount = !r.mouseWheelPixels ? r.mouseWheel.scrollAmount: r.mouseWheelPixels;
            r.mouseWheel.normalizeDelta = !r.advanced.normalizeMouseWheelDelta ? r.mouseWheel.normalizeDelta: r.advanced.normalizeMouseWheelDelta;
            r.scrollButtons.scrollType = g._findScrollButtonsType.call(null, r.scrollButtons.scrollType);
            g._theme.call(null, r);
            return h(q).each(function() {
                var v = h(this);
                if (!v.data(a)) {
                    v.data(a, {
                        idx: ++k,
                        opt: r,
                        scrollRatio: {
                            y: null,
                            x: null
                        },
                        overflowed: null,
                        bindEvents: false,
                        tweenRunning: false,
                        sequential: {},
                        langDir: v.css("direction"),
                        cbOffsets: null,
                        trigger: null
                    });
                    var x = v.data(a).opt,
                    w = v.data("mcs-axis"),
                    u = v.data("mcs-scrollbar-position"),
                    y = v.data("mcs-theme");
                    if (w) {
                        x.axis = w
                    }
                    if (u) {
                        x.scrollbarPosition = u
                    }
                    if (y) {
                        x.theme = y;
                        g._theme.call(null, x)
                    }
                    g._pluginMarkup.call(this);
                    b.update.call(null, v)
                }
            })
        },
        update: function(r) {
            var q = r || g._selector.call(this);
            return h(q).each(function() {
                var u = h(this);
                if (u.data(a)) {
                    var w = u.data(a),
                    v = w.opt,
                    s = h("#mCSB_" + w.idx + "_container"),
                    t = [h("#mCSB_" + w.idx + "_dragger_vertical"), h("#mCSB_" + w.idx + "_dragger_horizontal")];
                    if (!s.length) {
                        return
                    }
                    if (w.tweenRunning) {
                        g._stop.call(null, u)
                    }
                    if (u.hasClass("mCS_disabled")) {
                        u.removeClass("mCS_disabled")
                    }
                    if (u.hasClass("mCS_destroyed")) {
                        u.removeClass("mCS_destroyed")
                    }
                    g._maxHeight.call(this);
                    g._expandContentHorizontally.call(this);
                    if (v.axis !== "y" && !v.advanced.autoExpandHorizontalScroll) {
                        s.css("width", g._contentWidth(s.children()))
                    }
                    w.overflowed = g._overflowed.call(this);
                    g._scrollbarVisibility.call(this);
                    if (v.autoDraggerLength) {
                        g._setDraggerLength.call(this)
                    }
                    g._scrollRatio.call(this);
                    g._bindEvents.call(this);
                    var x = [Math.abs(s[0].offsetTop), Math.abs(s[0].offsetLeft)];
                    if (v.axis !== "x") {
                        if (!w.overflowed[0]) {
                            g._resetContentPosition.call(this);
                            if (v.axis === "y") {
                                g._unbindEvents.call(this)
                            } else {
                                if (v.axis === "yx" && w.overflowed[1]) {
                                    g._scrollTo.call(this, u, x[1].toString(), {
                                        dir: "x",
                                        dur: 0,
                                        overwrite: "none"
                                    })
                                }
                            }
                        } else {
                            if (t[0].height() > t[0].parent().height()) {
                                g._resetContentPosition.call(this)
                            } else {
                                g._scrollTo.call(this, u, x[0].toString(), {
                                    dir: "y",
                                    dur: 0,
                                    overwrite: "none"
                                })
                            }
                        }
                    }
                    if (v.axis !== "y") {
                        if (!w.overflowed[1]) {
                            g._resetContentPosition.call(this);
                            if (v.axis === "x") {
                                g._unbindEvents.call(this)
                            } else {
                                if (v.axis === "yx" && w.overflowed[0]) {
                                    g._scrollTo.call(this, u, x[0].toString(), {
                                        dir: "y",
                                        dur: 0,
                                        overwrite: "none"
                                    })
                                }
                            }
                        } else {
                            if (t[1].width() > t[1].parent().width()) {
                                g._resetContentPosition.call(this)
                            } else {
                                g._scrollTo.call(this, u, x[1].toString(), {
                                    dir: "x",
                                    dur: 0,
                                    overwrite: "none"
                                })
                            }
                        }
                    }
                    g._autoUpdate.call(this)
                }
            })
        },
        scrollTo: function(s, r) {
            if (typeof s == "undefined" || s == null) {
                return
            }
            var q = g._selector.call(this);
            return h(q).each(function() {
                var v = h(this);
                if (v.data(a)) {
                    var y = v.data(a),
                    x = y.opt,
                    w = {
                        trigger: "external",
                        scrollInertia: x.scrollInertia,
                        scrollEasing: "mcsEaseInOut",
                        moveDragger: false,
                        callbacks: true,
                        onStart: true,
                        onUpdate: true,
                        onComplete: true
                    },
                    t = h.extend(true, {},
                    w, r),
                    z = g._arr.call(this, s),
                    u = t.scrollInertia < 17 ? 17 : t.scrollInertia;
                    z[0] = g._to.call(this, z[0], "y");
                    z[1] = g._to.call(this, z[1], "x");
                    if (t.moveDragger) {
                        z[0] *= y.scrollRatio.y;
                        z[1] *= y.scrollRatio.x
                    }
                    t.dur = u;
                    setTimeout(function() {
                        if (z[0] !== null && typeof z[0] !== "undefined" && x.axis !== "x" && y.overflowed[0]) {
                            t.dir = "y";
                            t.overwrite = "all";
                            g._scrollTo.call(this, v, z[0].toString(), t)
                        }
                        if (z[1] !== null && typeof z[1] !== "undefined" && x.axis !== "y" && y.overflowed[1]) {
                            t.dir = "x";
                            t.overwrite = "none";
                            g._scrollTo.call(this, v, z[1].toString(), t)
                        }
                    },
                    60)
                }
            })
        },
        stop: function() {
            var q = g._selector.call(this);
            return h(q).each(function() {
                var r = h(this);
                if (r.data(a)) {
                    g._stop.call(null, r)
                }
            })
        },
        disable: function(s) {
            var q = g._selector.call(this);
            return h(q).each(function() {
                var r = h(this);
                if (r.data(a)) {
                    var u = r.data(a),
                    t = u.opt;
                    g._autoUpdate.call(this, "remove");
                    g._unbindEvents.call(this);
                    if (s) {
                        g._resetContentPosition.call(this)
                    }
                    g._scrollbarVisibility.call(this, true);
                    r.addClass("mCS_disabled")
                }
            })
        },
        destroy: function() {
            var q = g._selector.call(this);
            return h(q).each(function() {
                var t = h(this);
                if (t.data(a)) {
                    var v = t.data(a),
                    u = v.opt,
                    r = h("#mCSB_" + v.idx),
                    s = h("#mCSB_" + v.idx + "_container"),
                    w = h(".mCSB_" + v.idx + "_scrollbar");
                    if (u.live) {
                        c(q)
                    }
                    g._autoUpdate.call(this, "remove");
                    g._unbindEvents.call(this);
                    g._resetContentPosition.call(this);
                    t.removeData(a);
                    g._delete.call(null, this.mcs);
                    w.remove();
                    r.replaceWith(s.contents());
                    t.removeClass(e + " _" + a + "_" + v.idx + " mCS-autoHide mCS-dir-rtl mCS_no_scrollbar mCS_disabled").addClass("mCS_destroyed")
                }
            })
        }
    },
    g = {
        _selector: function() {
            return (typeof h(this) !== "object" || h(this).length < 1) ? l: this
        },
        _theme: function(t) {
            var s = ["rounded", "rounded-dark", "rounded-dots", "rounded-dots-dark"],
            r = ["rounded-dots", "rounded-dots-dark", "3d", "3d-dark", "3d-thick", "3d-thick-dark", "inset", "inset-dark", "inset-2", "inset-2-dark", "inset-3", "inset-3-dark"],
            q = ["minimal", "minimal-dark"],
            v = ["minimal", "minimal-dark"],
            u = ["minimal", "minimal-dark"];
            t.autoDraggerLength = h.inArray(t.theme, s) > -1 ? false: t.autoDraggerLength;
            t.autoExpandScrollbar = h.inArray(t.theme, r) > -1 ? false: t.autoExpandScrollbar;
            t.scrollButtons.enable = h.inArray(t.theme, q) > -1 ? false: t.scrollButtons.enable;
            t.autoHideScrollbar = h.inArray(t.theme, v) > -1 ? true: t.autoHideScrollbar;
            t.scrollbarPosition = h.inArray(t.theme, u) > -1 ? "outside": t.scrollbarPosition
        },
        _findAxis: function(q) {
            return (q === "yx" || q === "xy" || q === "auto") ? "yx": (q === "x" || q === "horizontal") ? "x": "y"
        },
        _findScrollButtonsType: function(q) {
            return (q === "stepped" || q === "pixels" || q === "step" || q === "click") ? "stepped": "stepless"
        },
        _pluginMarkup: function() {
            var z = h(this),
            y = z.data(a),
            s = y.opt,
            u = s.autoExpandScrollbar ? " mCSB_scrollTools_onDrag_expand": "",
            C = ["<div id='mCSB_" + y.idx + "_scrollbar_vertical' class='mCSB_scrollTools mCSB_" + y.idx + "_scrollbar mCS-" + s.theme + " mCSB_scrollTools_vertical" + u + "'><div class='mCSB_draggerContainer'><div id='mCSB_" + y.idx + "_dragger_vertical' class='mCSB_dragger' style='position:absolute;' oncontextmenu='return false;'><div class='mCSB_dragger_bar' /></div><div class='mCSB_draggerRail' /></div></div>", "<div id='mCSB_" + y.idx + "_scrollbar_horizontal' class='mCSB_scrollTools mCSB_" + y.idx + "_scrollbar mCS-" + s.theme + " mCSB_scrollTools_horizontal" + u + "'><div class='mCSB_draggerContainer'><div id='mCSB_" + y.idx + "_dragger_horizontal' class='mCSB_dragger' style='position:absolute;' oncontextmenu='return false;'><div class='mCSB_dragger_bar' /></div><div class='mCSB_draggerRail' /></div></div>"],
            v = s.axis === "yx" ? "mCSB_vertical_horizontal": s.axis === "x" ? "mCSB_horizontal": "mCSB_vertical",
            x = s.axis === "yx" ? C[0] + C[1] : s.axis === "x" ? C[1] : C[0],
            w = s.axis === "yx" ? "<div id='mCSB_" + y.idx + "_container_wrapper' class='mCSB_container_wrapper' />": "",
            t = s.autoHideScrollbar ? " mCS-autoHide": "",
            q = (s.axis !== "x" && y.langDir === "rtl") ? " mCS-dir-rtl": "";
            if (s.setWidth) {
                z.css("width", s.setWidth)
            }
            if (s.setHeight) {
                z.css("height", s.setHeight)
            }
            s.setLeft = (s.axis !== "y" && y.langDir === "rtl") ? "989999px": s.setLeft;
            z.addClass(e + " _" + a + "_" + y.idx + t + q).wrapInner("<div id='mCSB_" + y.idx + "' class='mCustomScrollBox mCS-" + s.theme + " " + v + "'><div id='mCSB_" + y.idx + "_container' class='mCSB_container' style='position:relative; top:" + s.setTop + "; left:" + s.setLeft + ";' dir=" + y.langDir + " /></div>");
            var r = h("#mCSB_" + y.idx),
            A = h("#mCSB_" + y.idx + "_container");
            if (s.axis !== "y" && !s.advanced.autoExpandHorizontalScroll) {
                A.css("width", g._contentWidth(A.children()))
            }
            if (s.scrollbarPosition === "outside") {
                if (z.css("position") === "static") {
                    z.css("position", "relative")
                }
                z.css("overflow", "visible");
                r.addClass("mCSB_outside").after(x)
            } else {
                r.addClass("mCSB_inside").append(x);
                A.wrap(w)
            }
            g._scrollButtons.call(this);
            var B = [h("#mCSB_" + y.idx + "_dragger_vertical"), h("#mCSB_" + y.idx + "_dragger_horizontal")];
            B[0].css("min-height", B[0].height());
            B[1].css("min-width", B[1].width())
        },
        _contentWidth: function(q) {
            return Math.max.apply(Math, q.map(function() {
                return h(this).outerWidth(true)
            }).get())
        },
        _expandContentHorizontally: function() {
            var r = h(this),
            t = r.data(a),
            s = t.opt,
            q = h("#mCSB_" + t.idx + "_container");
            if (s.advanced.autoExpandHorizontalScroll && s.axis !== "y") {
                q.css({
                    position: "absolute",
                    width: "auto"
                }).wrap("<div class='mCSB_h_wrapper' style='position:relative; left:0; width:999999px;' />").css({
                    width: (Math.ceil(q[0].getBoundingClientRect().right + 0.4) - Math.floor(q[0].getBoundingClientRect().left)),
                    position: "relative"
                }).unwrap()
            }
        },
        _scrollButtons: function() {
            var t = h(this),
            v = t.data(a),
            u = v.opt,
            r = h(".mCSB_" + v.idx + "_scrollbar:first"),
            s = ["<a href='#' class='mCSB_buttonUp' oncontextmenu='return false;' />", "<a href='#' class='mCSB_buttonDown' oncontextmenu='return false;' />", "<a href='#' class='mCSB_buttonLeft' oncontextmenu='return false;' />", "<a href='#' class='mCSB_buttonRight' oncontextmenu='return false;' />"],
            q = [(u.axis === "x" ? s[2] : s[0]), (u.axis === "x" ? s[3] : s[1]), s[2], s[3]];
            if (u.scrollButtons.enable) {
                r.prepend(q[0]).append(q[1]).next(".mCSB_scrollTools").prepend(q[2]).append(q[3])
            }
        },
        _maxHeight: function() {
            var u = h(this),
            x = u.data(a),
            w = x.opt,
            s = h("#mCSB_" + x.idx),
            r = u.css("max-height"),
            t = r.indexOf("%") !== -1,
            q = u.css("box-sizing");
            if (r !== "none") {
                var v = t ? u.parent().height() * parseInt(r) / 100 : parseInt(r);
                if (q === "border-box") {
                    v -= ((u.innerHeight() - u.height()) + (u.outerHeight() - u.innerHeight()))
                }
                s.css("max-height", Math.round(v))
            }
        },
        _setDraggerLength: function() {
            var v = h(this),
            t = v.data(a),
            q = h("#mCSB_" + t.idx),
            x = h("#mCSB_" + t.idx + "_container"),
            z = [h("#mCSB_" + t.idx + "_dragger_vertical"), h("#mCSB_" + t.idx + "_dragger_horizontal")],
            u = [q.height() / x.outerHeight(false), q.width() / x.outerWidth(false)],
            r = [parseInt(z[0].css("min-height")), Math.round(u[0] * z[0].parent().height()), parseInt(z[1].css("min-width")), Math.round(u[1] * z[1].parent().width())],
            s = j && (r[1] < r[0]) ? r[0] : r[1],
            y = j && (r[3] < r[2]) ? r[2] : r[3];
            z[0].css({
                height: s,
                "max-height": (z[0].parent().height() - 10)
            }).find(".mCSB_dragger_bar").css({
                "line-height": r[0] + "px"
            });
            z[1].css({
                width: y,
                "max-width": (z[1].parent().width() - 10)
            })
        },
        _scrollRatio: function() {
            var u = h(this),
            w = u.data(a),
            r = h("#mCSB_" + w.idx),
            s = h("#mCSB_" + w.idx + "_container"),
            t = [h("#mCSB_" + w.idx + "_dragger_vertical"), h("#mCSB_" + w.idx + "_dragger_horizontal")],
            v = [s.outerHeight(false) - r.height(), s.outerWidth(false) - r.width()],
            q = [v[0] / (t[0].parent().height() - t[0].height()), v[1] / (t[1].parent().width() - t[1].width())];
            w.scrollRatio = {
                y: q[0],
                x: q[1]
            }
        },
        _onDragClasses: function(s, u, r) {
            var t = r ? "mCSB_dragger_onDrag_expanded": "",
            q = ["mCSB_dragger_onDrag", "mCSB_scrollTools_onDrag"],
            v = s.closest(".mCSB_scrollTools");
            if (u === "active") {
                s.toggleClass(q[0] + " " + t);
                v.toggleClass(q[1]);
                s[0]._draggable = s[0]._draggable ? 0 : 1
            } else {
                if (!s[0]._draggable) {
                    if (u === "hide") {
                        s.removeClass(q[0]);
                        v.removeClass(q[1])
                    } else {
                        s.addClass(q[0]);
                        v.addClass(q[1])
                    }
                }
            }
        },
        _overflowed: function() {
            var u = h(this),
            v = u.data(a),
            r = h("#mCSB_" + v.idx),
            t = h("#mCSB_" + v.idx + "_container"),
            s = v.overflowed == null ? t.height() : t.outerHeight(false),
            q = v.overflowed == null ? t.width() : t.outerWidth(false);
            return [s > r.height(), q > r.width()]
        },
        _resetContentPosition: function() {
            var u = h(this),
            w = u.data(a),
            v = w.opt,
            r = h("#mCSB_" + w.idx),
            s = h("#mCSB_" + w.idx + "_container"),
            t = [h("#mCSB_" + w.idx + "_dragger_vertical"), h("#mCSB_" + w.idx + "_dragger_horizontal")];
            g._stop(u);
            if ((v.axis !== "x" && !w.overflowed[0]) || (v.axis === "y" && w.overflowed[0])) {
                t[0].add(s).css("top", 0)
            }
            if ((v.axis !== "y" && !w.overflowed[1]) || (v.axis === "x" && w.overflowed[1])) {
                var q = dx = 0;
                if (w.langDir === "rtl") {
                    q = r.width() - s.outerWidth(false);
                    dx = Math.abs(q / w.scrollRatio.x)
                }
                s.css("left", q);
                t[1].css("left", dx)
            }
        },
        _bindEvents: function() {
            var s = h(this),
            u = s.data(a),
            t = u.opt;
            if (!u.bindEvents) {
                g._draggable.call(this);
                if (t.contentTouchScroll) {
                    g._contentDraggable.call(this)
                }
                if (t.mouseWheel.enable) {
                    function r() {
                        q = setTimeout(function() {
                            if (!h.event.special.mousewheel) {
                                r()
                            } else {
                                clearTimeout(q);
                                g._mousewheel.call(s[0])
                            }
                        },
                        1000)
                    }
                    var q;
                    r()
                }
                g._draggerRail.call(this);
                g._wrapperScroll.call(this);
                if (t.advanced.autoScrollOnFocus) {
                    g._focus.call(this)
                }
                if (t.scrollButtons.enable) {
                    g._buttons.call(this)
                }
                if (t.keyboard.enable) {
                    g._keyboard.call(this)
                }
                u.bindEvents = true
            }
        },
        _unbindEvents: function() {
            var t = h(this),
            u = t.data(a),
            q = a + "_" + u.idx,
            v = ".mCSB_" + u.idx + "_scrollbar",
            s = h("#mCSB_" + u.idx + ",#mCSB_" + u.idx + "_container,#mCSB_" + u.idx + "_container_wrapper," + v + " .mCSB_draggerContainer,#mCSB_" + u.idx + "_dragger_vertical,#mCSB_" + u.idx + "_dragger_horizontal," + v + ">a"),
            r = h("#mCSB_" + u.idx + "_container");
            if (u.bindEvents) {
                h(n).unbind("." + q);
                s.each(function() {
                    h(this).unbind("." + q)
                });
                clearTimeout(t[0]._focusTimeout);
                g._delete.call(null, t[0]._focusTimeout);
                clearTimeout(u.sequential.step);
                g._delete.call(null, u.sequential.step);
                clearTimeout(r[0].onCompleteTimeout);
                g._delete.call(null, r[0].onCompleteTimeout);
                u.bindEvents = false
            }
        },
        _scrollbarVisibility: function(r) {
            var u = h(this),
            w = u.data(a),
            v = w.opt,
            q = h("#mCSB_" + w.idx + "_container_wrapper"),
            s = q.length ? q: h("#mCSB_" + w.idx + "_container"),
            x = [h("#mCSB_" + w.idx + "_scrollbar_vertical"), h("#mCSB_" + w.idx + "_scrollbar_horizontal")],
            t = [x[0].find(".mCSB_dragger"), x[1].find(".mCSB_dragger")];
            if (v.axis !== "x") {
                if (w.overflowed[0] && !r) {
                    x[0].add(t[0]).add(x[0].children("a")).css("display", "block");
                    s.removeClass("mCS_no_scrollbar_y mCS_y_hidden")
                } else {
                    if (v.alwaysShowScrollbar) {
                        if (v.alwaysShowScrollbar !== 2) {
                            t[0].add(x[0].children("a")).css("display", "none")
                        }
                        s.removeClass("mCS_y_hidden")
                    } else {
                        x[0].css("display", "none");
                        s.addClass("mCS_y_hidden")
                    }
                    s.addClass("mCS_no_scrollbar_y")
                }
            }
            if (v.axis !== "y") {
                if (w.overflowed[1] && !r) {
                    x[1].add(t[1]).add(x[1].children("a")).css("display", "block");
                    s.removeClass("mCS_no_scrollbar_x mCS_x_hidden")
                } else {
                    if (v.alwaysShowScrollbar) {
                        if (v.alwaysShowScrollbar !== 2) {
                            t[1].add(x[1].children("a")).css("display", "none")
                        }
                        s.removeClass("mCS_x_hidden")
                    } else {
                        x[1].css("display", "none");
                        s.addClass("mCS_x_hidden")
                    }
                    s.addClass("mCS_no_scrollbar_x")
                }
            }
            if (!w.overflowed[0] && !w.overflowed[1]) {
                u.addClass("mCS_no_scrollbar")
            } else {
                u.removeClass("mCS_no_scrollbar")
            }
        },
        _coordinates: function(r) {
            var q = r.type;
            switch (q) {
            case "pointerdown":
            case "MSPointerDown":
            case "pointermove":
            case "MSPointerMove":
            case "pointerup":
            case "MSPointerUp":
                return [r.originalEvent.pageY, r.originalEvent.pageX];
                break;
            case "touchstart":
            case "touchmove":
            case "touchend":
                var s = r.originalEvent.touches[0] || r.originalEvent.changedTouches[0];
                return [s.pageY, s.pageX];
                break;
            default:
                return [r.pageY, r.pageX]
            }
        },
        _draggable: function() {
            var v = h(this),
            t = v.data(a),
            q = t.opt,
            s = a + "_" + t.idx,
            u = ["mCSB_" + t.idx + "_dragger_vertical", "mCSB_" + t.idx + "_dragger_horizontal"],
            w = h("#mCSB_" + t.idx + "_container"),
            x = h("#" + u[0] + ",#" + u[1]),
            B,
            z,
            A;
            x.bind("mousedown." + s + " touchstart." + s + " pointerdown." + s + " MSPointerDown." + s,
            function(F) {
                F.stopImmediatePropagation();
                F.preventDefault();
                if (!g._mouseBtnLeft(F)) {
                    return
                }
                o = true;
                if (j) {
                    n.onselectstart = function() {
                        return false
                    }
                }
                y(false);
                g._stop(v);
                B = h(this);
                var G = B.offset(),
                H = g._coordinates(F)[0] - G.top,
                C = g._coordinates(F)[1] - G.left,
                E = B.height() + G.top,
                D = B.width() + G.left;
                if (H < E && H > 0 && C < D && C > 0) {
                    z = H;
                    A = C
                }
                g._onDragClasses(B, "active", q.autoExpandScrollbar)
            }).bind("touchmove." + s,
            function(D) {
                D.stopImmediatePropagation();
                D.preventDefault();
                var E = B.offset(),
                F = g._coordinates(D)[0] - E.top,
                C = g._coordinates(D)[1] - E.left;
                r(z, A, F, C)
            });
            h(n).bind("mousemove." + s + " pointermove." + s + " MSPointerMove." + s,
            function(D) {
                if (B) {
                    var E = B.offset(),
                    F = g._coordinates(D)[0] - E.top,
                    C = g._coordinates(D)[1] - E.left;
                    if (z === F) {
                        return
                    }
                    r(z, A, F, C)
                }
            }).add(x).bind("mouseup." + s + " touchend." + s + " pointerup." + s + " MSPointerUp." + s,
            function(C) {
                if (B) {
                    g._onDragClasses(B, "active", q.autoExpandScrollbar);
                    B = null
                }
                o = false;
                if (j) {
                    n.onselectstart = null
                }
                y(true)
            });
            function y(C) {
                var D = w.find("iframe");
                if (!D.length) {
                    return
                }
                var E = !C ? "none": "auto";
                D.css("pointer-events", E)
            }
            function r(E, F, H, C) {
                w[0].idleTimer = q.scrollInertia < 233 ? 250 : 0;
                if (B.attr("id") === u[1]) {
                    var D = "x",
                    G = ((B[0].offsetLeft - F) + C) * t.scrollRatio.x
                } else {
                    var D = "y",
                    G = ((B[0].offsetTop - E) + H) * t.scrollRatio.y
                }
                g._scrollTo(v, G.toString(), {
                    dir: D,
                    drag: true
                })
            }
        },
        _contentDraggable: function() {
            var z = h(this),
            L = z.data(a),
            J = L.opt,
            G = a + "_" + L.idx,
            w = h("#mCSB_" + L.idx),
            A = h("#mCSB_" + L.idx + "_container"),
            x = [h("#mCSB_" + L.idx + "_dragger_vertical"), h("#mCSB_" + L.idx + "_dragger_horizontal")],
            F,
            H,
            M,
            N,
            D = [],
            E = [],
            I,
            B,
            v,
            u,
            K,
            y,
            s = 0,
            r,
            t = J.axis === "yx" ? "none": "all";
            A.bind("touchstart." + G + " pointerdown." + G + " MSPointerDown." + G,
            function(O) {
                if (!g._pointerTouch(O) || o) {
                    return
                }
                var P = A.offset();
                F = g._coordinates(O)[0] - P.top;
                H = g._coordinates(O)[1] - P.left
            }).bind("touchmove." + G + " pointermove." + G + " MSPointerMove." + G,
            function(R) {
                if (!g._pointerTouch(R) || o) {
                    return
                }
                R.stopImmediatePropagation();
                B = g._getTime();
                var Q = w.offset(),
                T = g._coordinates(R)[0] - Q.top,
                V = g._coordinates(R)[1] - Q.left,
                S = "mcsLinearOut";
                D.push(T);
                E.push(V);
                if (L.overflowed[0]) {
                    var P = x[0].parent().height() - x[0].height(),
                    U = ((F - T) > 0 && (T - F) > -(P * L.scrollRatio.y))
                }
                if (L.overflowed[1]) {
                    var O = x[1].parent().width() - x[1].width(),
                    W = ((H - V) > 0 && (V - H) > -(O * L.scrollRatio.x))
                }
                if (U || W) {
                    R.preventDefault()
                }
                y = J.axis === "yx" ? [(F - T), (H - V)] : J.axis === "x" ? [null, (H - V)] : [(F - T), null];
                A[0].idleTimer = 250;
                if (L.overflowed[0]) {
                    C(y[0], s, S, "y", "all", true)
                }
                if (L.overflowed[1]) {
                    C(y[1], s, S, "x", t, true)
                }
            });
            w.bind("touchstart." + G + " pointerdown." + G + " MSPointerDown." + G,
            function(O) {
                if (!g._pointerTouch(O) || o) {
                    return
                }
                O.stopImmediatePropagation();
                g._stop(z);
                I = g._getTime();
                var P = w.offset();
                M = g._coordinates(O)[0] - P.top;
                N = g._coordinates(O)[1] - P.left;
                D = [];
                E = []
            }).bind("touchend." + G + " pointerup." + G + " MSPointerUp." + G,
            function(Q) {
                if (!g._pointerTouch(Q) || o) {
                    return
                }
                Q.stopImmediatePropagation();
                v = g._getTime();
                var O = w.offset(),
                U = g._coordinates(Q)[0] - O.top,
                W = g._coordinates(Q)[1] - O.left;
                if ((v - B) > 30) {
                    return
                }
                K = 1000 / (v - I);
                var R = "mcsEaseOut",
                S = K < 2.5,
                X = S ? [D[D.length - 2], E[E.length - 2]] : [0, 0];
                u = S ? [(U - X[0]), (W - X[1])] : [U - M, W - N];
                var P = [Math.abs(u[0]), Math.abs(u[1])];
                K = S ? [Math.abs(u[0] / 4), Math.abs(u[1] / 4)] : [K, K];
                var V = [Math.abs(A[0].offsetTop) - (u[0] * q((P[0] / K[0]), K[0])), Math.abs(A[0].offsetLeft) - (u[1] * q((P[1] / K[1]), K[1]))];
                y = J.axis === "yx" ? [V[0], V[1]] : J.axis === "x" ? [null, V[1]] : [V[0], null];
                r = [(P[0] * 4) + J.scrollInertia, (P[1] * 4) + J.scrollInertia];
                var T = parseInt(J.contentTouchScroll) || 0;
                y[0] = P[0] > T ? y[0] : 0;
                y[1] = P[1] > T ? y[1] : 0;
                if (L.overflowed[0]) {
                    C(y[0], r[0], R, "y", t, false)
                }
                if (L.overflowed[1]) {
                    C(y[1], r[1], R, "x", t, false)
                }
            });
            function q(Q, O) {
                var P = [O * 1.5, O * 2, O / 1.5, O / 2];
                if (Q > 90) {
                    return O > 4 ? P[0] : P[3]
                } else {
                    if (Q > 60) {
                        return O > 3 ? P[3] : P[2]
                    } else {
                        if (Q > 30) {
                            return O > 8 ? P[1] : O > 6 ? P[0] : O > 4 ? O: P[2]
                        } else {
                            return O > 8 ? O: P[3]
                        }
                    }
                }
            }
            function C(Q, S, T, P, O, R) {
                if (!Q) {
                    return
                }
                g._scrollTo(z, Q.toString(), {
                    dur: S,
                    scrollEasing: T,
                    dir: P,
                    overwrite: O,
                    drag: R
                })
            }
        },
        _mousewheel: function() {
            var t = h(this),
            v = t.data(a),
            u = v.opt,
            r = a + "_" + v.idx,
            q = h("#mCSB_" + v.idx),
            s = [h("#mCSB_" + v.idx + "_dragger_vertical"), h("#mCSB_" + v.idx + "_dragger_horizontal")];
            q.bind("mousewheel." + r,
            function(A, E) {
                g._stop(t);
                if (g._disableMousewheel(t, A.target)) {
                    return
                }
                var C = u.mouseWheel.deltaFactor !== "auto" ? parseInt(u.mouseWheel.deltaFactor) : (j && A.deltaFactor < 100) ? 100 : A.deltaFactor < 40 ? 40 : A.deltaFactor || 100;
                if (u.axis === "x" || u.mouseWheel.axis === "x") {
                    var x = "x",
                    D = [Math.round(C * v.scrollRatio.x), parseInt(u.mouseWheel.scrollAmount)],
                    z = u.mouseWheel.scrollAmount !== "auto" ? D[1] : D[0] >= q.width() ? q.width() * 0.9 : D[0],
                    F = Math.abs(h("#mCSB_" + v.idx + "_container")[0].offsetLeft),
                    B = s[1][0].offsetLeft,
                    y = s[1].parent().width() - s[1].width(),
                    w = A.deltaX || A.deltaY || E
                } else {
                    var x = "y",
                    D = [Math.round(C * v.scrollRatio.y), parseInt(u.mouseWheel.scrollAmount)],
                    z = u.mouseWheel.scrollAmount !== "auto" ? D[1] : D[0] >= q.height() ? q.height() * 0.9 : D[0],
                    F = Math.abs(h("#mCSB_" + v.idx + "_container")[0].offsetTop),
                    B = s[0][0].offsetTop,
                    y = s[0].parent().height() - s[0].height(),
                    w = A.deltaY || E
                }
                if ((x === "y" && !v.overflowed[0]) || (x === "x" && !v.overflowed[1])) {
                    return
                }
                if (u.mouseWheel.invert) {
                    w = -w
                }
                if (u.mouseWheel.normalizeDelta) {
                    w = w < 0 ? -1 : 1
                }
                if ((w > 0 && B !== 0) || (w < 0 && B !== y) || u.mouseWheel.preventDefault) {
                    A.stopImmediatePropagation();
                    A.preventDefault()
                }
                g._scrollTo(t, (F - (w * z)).toString(), {
                    dir: x
                })
            })
        },
        _disableMousewheel: function(s, u) {
            var q = u.nodeName.toLowerCase(),
            r = s.data(a).opt.mouseWheel.disableOver,
            t = ["select", "textarea"];
            return h.inArray(q, r) > -1 && !(h.inArray(q, t) > -1 && !h(u).is(":focus"))
        },
        _draggerRail: function() {
            var t = h(this),
            u = t.data(a),
            r = a + "_" + u.idx,
            s = h("#mCSB_" + u.idx + "_container"),
            v = s.parent(),
            q = h(".mCSB_" + u.idx + "_scrollbar .mCSB_draggerContainer");
            q.bind("touchstart." + r + " pointerdown." + r + " MSPointerDown." + r,
            function(w) {
                o = true
            }).bind("touchend." + r + " pointerup." + r + " MSPointerUp." + r,
            function(w) {
                o = false
            }).bind("click." + r,
            function(A) {
                if (h(A.target).hasClass("mCSB_draggerContainer") || h(A.target).hasClass("mCSB_draggerRail")) {
                    g._stop(t);
                    var x = h(this),
                    z = x.find(".mCSB_dragger");
                    if (x.parent(".mCSB_scrollTools_horizontal").length > 0) {
                        if (!u.overflowed[1]) {
                            return
                        }
                        var w = "x",
                        y = A.pageX > z.offset().left ? -1 : 1,
                        B = Math.abs(s[0].offsetLeft) - (y * (v.width() * 0.9))
                    } else {
                        if (!u.overflowed[0]) {
                            return
                        }
                        var w = "y",
                        y = A.pageY > z.offset().top ? -1 : 1,
                        B = Math.abs(s[0].offsetTop) - (y * (v.height() * 0.9))
                    }
                    g._scrollTo(t, B.toString(), {
                        dir: w,
                        scrollEasing: "mcsEaseInOut"
                    })
                }
            })
        },
        _focus: function() {
            var s = h(this),
            u = s.data(a),
            t = u.opt,
            q = a + "_" + u.idx,
            r = h("#mCSB_" + u.idx + "_container"),
            v = r.parent();
            r.bind("focusin." + q,
            function(y) {
                var x = h(n.activeElement),
                z = r.find(".mCustomScrollBox").length,
                w = 0;
                if (!x.is(t.advanced.autoScrollOnFocus)) {
                    return
                }
                g._stop(s);
                clearTimeout(s[0]._focusTimeout);
                s[0]._focusTimer = z ? (w + 17) * z: 0;
                s[0]._focusTimeout = setTimeout(function() {
                    var D = [x.offset().top - r.offset().top, x.offset().left - r.offset().left],
                    C = [r[0].offsetTop, r[0].offsetLeft],
                    A = [(C[0] + D[0] >= 0 && C[0] + D[0] < v.height() - x.outerHeight(false)), (C[1] + D[1] >= 0 && C[0] + D[1] < v.width() - x.outerWidth(false))],
                    B = (t.axis === "yx" && !A[0] && !A[1]) ? "none": "all";
                    if (t.axis !== "x" && !A[0]) {
                        g._scrollTo(s, D[0].toString(), {
                            dir: "y",
                            scrollEasing: "mcsEaseInOut",
                            overwrite: B,
                            dur: w
                        })
                    }
                    if (t.axis !== "y" && !A[1]) {
                        g._scrollTo(s, D[1].toString(), {
                            dir: "x",
                            scrollEasing: "mcsEaseInOut",
                            overwrite: B,
                            dur: w
                        })
                    }
                },
                s[0]._focusTimer)
            })
        },
        _wrapperScroll: function() {
            var r = h(this),
            s = r.data(a),
            q = a + "_" + s.idx,
            t = h("#mCSB_" + s.idx + "_container").parent();
            t.bind("scroll." + q,
            function(u) {
                t.scrollTop(0).scrollLeft(0)
            })
        },
        _buttons: function() {
            var v = h(this),
            x = v.data(a),
            w = x.opt,
            q = x.sequential,
            s = a + "_" + x.idx,
            u = h("#mCSB_" + x.idx + "_container"),
            t = ".mCSB_" + x.idx + "_scrollbar",
            r = h(t + ">a");
            r.bind("mousedown." + s + " touchstart." + s + " pointerdown." + s + " MSPointerDown." + s + " mouseup." + s + " touchend." + s + " pointerup." + s + " MSPointerUp." + s + " mouseout." + s + " pointerout." + s + " MSPointerOut." + s + " click." + s,
            function(A) {
                A.preventDefault();
                if (!g._mouseBtnLeft(A)) {
                    return
                }
                var z = h(this).attr("class");
                q.type = w.scrollButtons.scrollType;
                switch (A.type) {
                case "mousedown":
                case "touchstart":
                case "pointerdown":
                case "MSPointerDown":
                    if (q.type === "stepped") {
                        return
                    }
                    o = true;
                    x.tweenRunning = false;
                    y("on", z);
                    break;
                case "mouseup":
                case "touchend":
                case "pointerup":
                case "MSPointerUp":
                case "mouseout":
                case "pointerout":
                case "MSPointerOut":
                    if (q.type === "stepped") {
                        return
                    }
                    o = false;
                    if (q.dir) {
                        y("off", z)
                    }
                    break;
                case "click":
                    if (q.type !== "stepped" || x.tweenRunning) {
                        return
                    }
                    y("on", z);
                    break
                }
                function y(B, C) {
                    q.scrollAmount = w.snapAmount || w.scrollButtons.scrollAmount;
                    g._sequentialScroll.call(this, v, B, C)
                }
            })
        },
        _keyboard: function() {
            var v = h(this),
            u = v.data(a),
            r = u.opt,
            y = u.sequential,
            t = a + "_" + u.idx,
            s = h("#mCSB_" + u.idx),
            x = h("#mCSB_" + u.idx + "_container"),
            q = x.parent(),
            w = "input,textarea,select,datalist,keygen,[contenteditable='true']";
            s.attr("tabindex", "0").bind("blur." + t + " keydown." + t + " keyup." + t,
            function(E) {
                switch (E.type) {
                case "blur":
                    if (u.tweenRunning && y.dir) {
                        z("off", null)
                    }
                    break;
                case "keydown":
                case "keyup":
                    var B = E.keyCode ? E.keyCode: E.which,
                    C = "on";
                    if ((r.axis !== "x" && (B === 38 || B === 40)) || (r.axis !== "y" && (B === 37 || B === 39))) {
                        if (((B === 38 || B === 40) && !u.overflowed[0]) || ((B === 37 || B === 39) && !u.overflowed[1])) {
                            return
                        }
                        if (E.type === "keyup") {
                            C = "off"
                        }
                        if (!h(n.activeElement).is(w)) {
                            E.preventDefault();
                            E.stopImmediatePropagation();
                            z(C, B)
                        }
                    } else {
                        if (B === 33 || B === 34) {
                            if (u.overflowed[0] || u.overflowed[1]) {
                                E.preventDefault();
                                E.stopImmediatePropagation()
                            }
                            if (E.type === "keyup") {
                                g._stop(v);
                                var D = B === 34 ? -1 : 1;
                                if (r.axis === "x" || (r.axis === "yx" && u.overflowed[1] && !u.overflowed[0])) {
                                    var A = "x",
                                    F = Math.abs(x[0].offsetLeft) - (D * (q.width() * 0.9))
                                } else {
                                    var A = "y",
                                    F = Math.abs(x[0].offsetTop) - (D * (q.height() * 0.9))
                                }
                                g._scrollTo(v, F.toString(), {
                                    dir: A,
                                    scrollEasing: "mcsEaseInOut"
                                })
                            }
                        } else {
                            if (B === 35 || B === 36) {
                                if (!h(n.activeElement).is(w)) {
                                    if (u.overflowed[0] || u.overflowed[1]) {
                                        E.preventDefault();
                                        E.stopImmediatePropagation()
                                    }
                                    if (E.type === "keyup") {
                                        if (r.axis === "x" || (r.axis === "yx" && u.overflowed[1] && !u.overflowed[0])) {
                                            var A = "x",
                                            F = B === 35 ? Math.abs(q.width() - x.outerWidth(false)) : 0
                                        } else {
                                            var A = "y",
                                            F = B === 35 ? Math.abs(q.height() - x.outerHeight(false)) : 0
                                        }
                                        g._scrollTo(v, F.toString(), {
                                            dir: A,
                                            scrollEasing: "mcsEaseInOut"
                                        })
                                    }
                                }
                            }
                        }
                    }
                    break
                }
                function z(G, H) {
                    y.type = r.keyboard.scrollType;
                    y.scrollAmount = r.snapAmount || r.keyboard.scrollAmount;
                    if (y.type === "stepped" && u.tweenRunning) {
                        return
                    }
                    g._sequentialScroll.call(this, v, G, H)
                }
            })
        },
        _sequentialScroll: function(s, v, t) {
            var x = s.data(a),
            r = x.opt,
            z = x.sequential,
            y = h("#mCSB_" + x.idx + "_container"),
            q = z.type === "stepped" ? true: false;
            switch (v) {
            case "on":
                z.dir = [(t === "mCSB_buttonRight" || t === "mCSB_buttonLeft" || t === 39 || t === 37 ? "x": "y"), (t === "mCSB_buttonUp" || t === "mCSB_buttonLeft" || t === 38 || t === 37 ? -1 : 1)];
                g._stop(s);
                if (g._isNumeric(t) && z.type === "stepped") {
                    return
                }
                u(q);
                break;
            case "off":
                w();
                if (q || (x.tweenRunning && z.dir)) {
                    u(true)
                }
                break
            }
            function u(A) {
                var G = z.type !== "stepped",
                K = !A ? 1000 / 60 : G ? r.scrollInertia / 1.5 : r.scrollInertia,
                C = !A ? 2.5 : G ? 7.5 : 40,
                J = [Math.abs(y[0].offsetTop), Math.abs(y[0].offsetLeft)],
                F = [x.scrollRatio.y > 10 ? 10 : x.scrollRatio.y, x.scrollRatio.x > 10 ? 10 : x.scrollRatio.x],
                D = z.dir[0] === "x" ? J[1] + (z.dir[1] * (F[1] * C)) : J[0] + (z.dir[1] * (F[0] * C)),
                I = z.dir[0] === "x" ? J[1] + (z.dir[1] * parseInt(z.scrollAmount)) : J[0] + (z.dir[1] * parseInt(z.scrollAmount)),
                H = z.scrollAmount !== "auto" ? I: D,
                E = !A ? "mcsLinear": G ? "mcsLinearOut": "mcsEaseInOut",
                B = !A ? false: true;
                if (A && K < 17) {
                    H = z.dir[0] === "x" ? J[1] : J[0]
                }
                g._scrollTo(s, H.toString(), {
                    dir: z.dir[0],
                    scrollEasing: E,
                    dur: K,
                    onComplete: B
                });
                if (A) {
                    z.dir = false;
                    return
                }
                clearTimeout(z.step);
                z.step = setTimeout(function() {
                    u()
                },
                K)
            }
            function w() {
                clearTimeout(z.step);
                g._stop(s)
            }
        },
        _arr: function(s) {
            var r = h(this).data(a).opt,
            q = [];
            if (typeof s === "function") {
                s = s()
            }
            if (! (s instanceof Array)) {
                q[0] = s.y ? s.y: s.x || r.axis === "x" ? null: s;
                q[1] = s.x ? s.x: s.y || r.axis === "y" ? null: s
            } else {
                q = s.length > 1 ? [s[0], s[1]] : r.axis === "x" ? [null, s[0]] : [s[0], null]
            }
            if (typeof q[0] === "function") {
                q[0] = q[0]()
            }
            if (typeof q[1] === "function") {
                q[1] = q[1]()
            }
            return q
        },
        _to: function(v, w) {
            if (v == null || typeof v == "undefined") {
                return
            }
            var C = h(this),
            B = C.data(a),
            u = B.opt,
            D = h("#mCSB_" + B.idx + "_container"),
            r = D.parent(),
            F = typeof v;
            if (!w) {
                w = u.axis === "x" ? "x": "y"
            }
            var q = w === "x" ? D.outerWidth(false) : D.outerHeight(false),
            x = w === "x" ? D.offset().left: D.offset().top,
            E = w === "x" ? D[0].offsetLeft: D[0].offsetTop,
            z = w === "x" ? "left": "top";
            switch (F) {
            case "function":
                return v();
                break;
            case "object":
                if (v.nodeType) {
                    var A = w === "x" ? h(v).offset().left: h(v).offset().top
                } else {
                    if (v.jquery) {
                        if (!v.length) {
                            return
                        }
                        var A = w === "x" ? v.offset().left: v.offset().top
                    }
                }
                return A - x;
                break;
            case "string":
            case "number":
                if (g._isNumeric.call(null, v)) {
                    return Math.abs(v)
                } else {
                    if (v.indexOf("%") !== -1) {
                        return Math.abs(q * parseInt(v) / 100)
                    } else {
                        if (v.indexOf("-=") !== -1) {
                            return Math.abs(E - parseInt(v.split("-=")[1]))
                        } else {
                            if (v.indexOf("+=") !== -1) {
                                var s = (E + parseInt(v.split("+=")[1]));
                                return s >= 0 ? 0 : Math.abs(s)
                            } else {
                                if (v.indexOf("px") !== -1 && g._isNumeric.call(null, v.split("px")[0])) {
                                    return Math.abs(v.split("px")[0])
                                } else {
                                    if (v === "top" || v === "left") {
                                        return 0
                                    } else {
                                        if (v === "bottom") {
                                            return Math.abs(r.height() - D.outerHeight(false))
                                        } else {
                                            if (v === "right") {
                                                return Math.abs(r.width() - D.outerWidth(false))
                                            } else {
                                                if (v === "first" || v === "last") {
                                                    var y = D.find(":" + v),
                                                    A = w === "x" ? h(y).offset().left: h(y).offset().top;
                                                    return A - x
                                                } else {
                                                    if (h(v).length) {
                                                        var A = w === "x" ? h(v).offset().left: h(v).offset().top;
                                                        return A - x
                                                    } else {
                                                        D.css(z, v);
                                                        b.update.call(null, C[0]);
                                                        return
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                break
            }
        },
        _autoUpdate: function(r) {
            var u = h(this),
            G = u.data(a),
            A = G.opt,
            w = h("#mCSB_" + G.idx + "_container");
            if (r) {
                clearTimeout(w[0].autoUpdate);
                g._delete.call(null, w[0].autoUpdate);
                return
            }
            var t = w.parent(),
            q = [h("#mCSB_" + G.idx + "_scrollbar_vertical"), h("#mCSB_" + G.idx + "_scrollbar_horizontal")],
            E = function() {
                return [q[0].is(":visible") ? q[0].outerHeight(true) : 0, q[1].is(":visible") ? q[1].outerWidth(true) : 0]
            },
            F = z(),
            y,
            v = [w.outerHeight(false), w.outerWidth(false), t.height(), t.width(), E()[0], E()[1]],
            I,
            C = H(),
            x;
            D();
            function D() {
                clearTimeout(w[0].autoUpdate);
                w[0].autoUpdate = setTimeout(function() {
                    if (A.advanced.updateOnSelectorChange) {
                        y = z();
                        if (y !== F) {
                            s();
                            F = y;
                            return
                        }
                    }
                    if (A.advanced.updateOnContentResize) {
                        I = [w.outerHeight(false), w.outerWidth(false), t.height(), t.width(), E()[0], E()[1]];
                        if (I[0] !== v[0] || I[1] !== v[1] || I[2] !== v[2] || I[3] !== v[3] || I[4] !== v[4] || I[5] !== v[5]) {
                            s();
                            v = I
                        }
                    }
                    if (A.advanced.updateOnImageLoad) {
                        x = H();
                        if (x !== C) {
                            w.find("img").each(function() {
                                B(this.src)
                            });
                            C = x
                        }
                    }
                    if (A.advanced.updateOnSelectorChange || A.advanced.updateOnContentResize || A.advanced.updateOnImageLoad) {
                        D()
                    }
                },
                60)
            }
            function H() {
                var J = 0;
                if (A.advanced.updateOnImageLoad) {
                    J = w.find("img").length
                }
                return J
            }
            function B(M) {
                var J = new Image();
                function L(N, O) {
                    return function() {
                        return O.apply(N, arguments)
                    }
                }
                function K() {
                    this.onload = null;
                    s()
                }
                J.onload = L(J, K);
                J.src = M
            }
            function z() {
                if (A.advanced.updateOnSelectorChange === true) {
                    A.advanced.updateOnSelectorChange = "*"
                }
                var J = 0,
                K = w.find(A.advanced.updateOnSelectorChange);
                if (A.advanced.updateOnSelectorChange && K.length > 0) {
                    K.each(function() {
                        J += h(this).height() + h(this).width()
                    })
                }
                return J
            }
            function s() {
                clearTimeout(w[0].autoUpdate);
                b.update.call(null, u[0])
            }
        },
        _snapAmount: function(s, q, r) {
            return (Math.round(s / q) * q - r)
        },
        _stop: function(q) {
            var s = q.data(a),
            r = h("#mCSB_" + s.idx + "_container,#mCSB_" + s.idx + "_container_wrapper,#mCSB_" + s.idx + "_dragger_vertical,#mCSB_" + s.idx + "_dragger_horizontal");
            r.each(function() {
                g._stopTween.call(this)
            })
        },
        _scrollTo: function(r, t, v) {
            var J = r.data(a),
            F = J.opt,
            E = {
                trigger: "internal",
                dir: "y",
                scrollEasing: "mcsEaseOut",
                drag: false,
                dur: F.scrollInertia,
                overwrite: "all",
                callbacks: true,
                onStart: true,
                onUpdate: true,
                onComplete: true
            },
            v = h.extend(E, v),
            H = [v.dur, (v.drag ? 0 : v.dur)],
            w = h("#mCSB_" + J.idx),
            C = h("#mCSB_" + J.idx + "_container"),
            L = F.callbacks.onTotalScrollOffset ? g._arr.call(r, F.callbacks.onTotalScrollOffset) : [0, 0],
            q = F.callbacks.onTotalScrollBackOffset ? g._arr.call(r, F.callbacks.onTotalScrollBackOffset) : [0, 0];
            J.trigger = v.trigger;
            if (F.snapAmount) {
                t = g._snapAmount(t, F.snapAmount, F.snapOffset)
            }
            switch (v.dir) {
            case "x":
                var y = h("#mCSB_" + J.idx + "_dragger_horizontal"),
                A = "left",
                D = C[0].offsetLeft,
                I = [w.width() - C.outerWidth(false), y.parent().width() - y.width()],
                s = [t, (t / J.scrollRatio.x)],
                M = L[1],
                K = q[1],
                B = M > 0 ? M / J.scrollRatio.x: 0,
                x = K > 0 ? K / J.scrollRatio.x: 0;
                break;
            case "y":
                var y = h("#mCSB_" + J.idx + "_dragger_vertical"),
                A = "top",
                D = C[0].offsetTop,
                I = [w.height() - C.outerHeight(false), y.parent().height() - y.height()],
                s = [t, (t / J.scrollRatio.y)],
                M = L[0],
                K = q[0],
                B = M > 0 ? M / J.scrollRatio.y: 0,
                x = K > 0 ? K / J.scrollRatio.y: 0;
                break
            }
            if (s[1] < 0) {
                s = [0, 0]
            } else {
                if (s[1] >= I[1]) {
                    s = [I[0], I[1]]
                } else {
                    s[0] = -s[0]
                }
            }
            clearTimeout(C[0].onCompleteTimeout);
            if (!J.tweenRunning && ((D === 0 && s[0] >= 0) || (D === I[0] && s[0] <= I[0]))) {
                return
            }
            g._tweenTo.call(null, y[0], A, Math.round(s[1]), H[1], v.scrollEasing);
            g._tweenTo.call(null, C[0], A, Math.round(s[0]), H[0], v.scrollEasing, v.overwrite, {
                onStart: function() {
                    if (v.callbacks && v.onStart && !J.tweenRunning) {
                        if (u("onScrollStart")) {
                            G();
                            F.callbacks.onScrollStart.call(r[0])
                        }
                        J.tweenRunning = true;
                        g._onDragClasses(y);
                        J.cbOffsets = z()
                    }
                },
                onUpdate: function() {
                    if (v.callbacks && v.onUpdate) {
                        if (u("whileScrolling")) {
                            G();
                            F.callbacks.whileScrolling.call(r[0])
                        }
                    }
                },
                onComplete: function() {
                    if (v.callbacks && v.onComplete) {
                        if (F.axis === "yx") {
                            clearTimeout(C[0].onCompleteTimeout)
                        }
                        var N = C[0].idleTimer || 0;
                        C[0].onCompleteTimeout = setTimeout(function() {
                            if (u("onScroll")) {
                                G();
                                F.callbacks.onScroll.call(r[0])
                            }
                            if (u("onTotalScroll") && s[1] >= I[1] - B && J.cbOffsets[0]) {
                                G();
                                F.callbacks.onTotalScroll.call(r[0])
                            }
                            if (u("onTotalScrollBack") && s[1] <= x && J.cbOffsets[1]) {
                                G();
                                F.callbacks.onTotalScrollBack.call(r[0])
                            }
                            J.tweenRunning = false;
                            C[0].idleTimer = 0;
                            g._onDragClasses(y, "hide")
                        },
                        N)
                    }
                }
            });
            function u(N) {
                return J && F.callbacks[N] && typeof F.callbacks[N] === "function"
            }
            function z() {
                return [F.callbacks.alwaysTriggerOffsets || D >= I[0] + M, F.callbacks.alwaysTriggerOffsets || D <= -K]
            }
            function G() {
                var P = [C[0].offsetTop, C[0].offsetLeft],
                Q = [y[0].offsetTop, y[0].offsetLeft],
                N = [C.outerHeight(false), C.outerWidth(false)],
                O = [w.height(), w.width()];
                r[0].mcs = {
                    content: C,
                    top: P[0],
                    left: P[1],
                    draggerTop: Q[0],
                    draggerLeft: Q[1],
                    topPct: Math.round((100 * Math.abs(P[0])) / (Math.abs(N[0]) - O[0])),
                    leftPct: Math.round((100 * Math.abs(P[1])) / (Math.abs(N[1]) - O[1])),
                    direction: v.dir
                }
            }
        },
        _tweenTo: function(s, v, t, r, B, u, K) {
            var K = K || {},
            H = K.onStart ||
            function() {},
            C = K.onUpdate ||
            function() {},
            I = K.onComplete ||
            function() {},
            A = g._getTime(),
            y,
            w = 0,
            E = s.offsetTop,
            F = s.style;
            if (v === "left") {
                E = s.offsetLeft
            }
            var z = t - E;
            s._mcsstop = 0;
            if (u !== "none") {
                D()
            }
            q();
            function J() {
                if (s._mcsstop) {
                    return
                }
                if (!w) {
                    H.call()
                }
                w = g._getTime() - A;
                G();
                if (w >= s._mcstime) {
                    s._mcstime = (w > s._mcstime) ? w + y - (w - s._mcstime) : w + y - 1;
                    if (s._mcstime < w + 1) {
                        s._mcstime = w + 1
                    }
                }
                if (s._mcstime < r) {
                    s._mcsid = _request(J)
                } else {
                    I.call()
                }
            }
            function G() {
                if (r > 0) {
                    s._mcscurrVal = x(s._mcstime, E, z, r, B);
                    F[v] = Math.round(s._mcscurrVal) + "px"
                } else {
                    F[v] = t + "px"
                }
                C.call()
            }
            function q() {
                y = 1000 / 60;
                s._mcstime = w + y;
                _request = (!m.requestAnimationFrame) ?
                function(L) {
                    G();
                    return setTimeout(L, 0.01)
                }: m.requestAnimationFrame;
                s._mcsid = _request(J)
            }
            function D() {
                if (s._mcsid == null) {
                    return
                }
                if (!m.requestAnimationFrame) {
                    clearTimeout(s._mcsid)
                } else {
                    m.cancelAnimationFrame(s._mcsid)
                }
                s._mcsid = null
            }
            function x(N, M, R, Q, O) {
                switch (O) {
                case "linear":
                case "mcsLinear":
                    return R * N / Q + M;
                    break;
                case "mcsLinearOut":
                    N /= Q;
                    N--;
                    return R * Math.sqrt(1 - N * N) + M;
                    break;
                case "easeInOutSmooth":
                    N /= Q / 2;
                    if (N < 1) {
                        return R / 2 * N * N + M
                    }
                    N--;
                    return - R / 2 * (N * (N - 2) - 1) + M;
                    break;
                case "easeInOutStrong":
                    N /= Q / 2;
                    if (N < 1) {
                        return R / 2 * Math.pow(2, 10 * (N - 1)) + M
                    }
                    N--;
                    return R / 2 * ( - Math.pow(2, -10 * N) + 2) + M;
                    break;
                case "easeInOut":
                case "mcsEaseInOut":
                    N /= Q / 2;
                    if (N < 1) {
                        return R / 2 * N * N * N + M
                    }
                    N -= 2;
                    return R / 2 * (N * N * N + 2) + M;
                    break;
                case "easeOutSmooth":
                    N /= Q;
                    N--;
                    return - R * (N * N * N * N - 1) + M;
                    break;
                case "easeOutStrong":
                    return R * ( - Math.pow(2, -10 * N / Q) + 1) + M;
                    break;
                case "easeOut":
                case "mcsEaseOut":
                default:
                    var P = (N /= Q) * N,
                    L = P * N;
                    return M + R * (0.499999999999997 * L * P + -2.5 * P * P + 5.5 * L + -6.5 * P + 4 * N)
                }
            }
        },
        _getTime: function() {
            if (m.performance && m.performance.now) {
                return m.performance.now()
            } else {
                if (m.performance && m.performance.webkitNow) {
                    return m.performance.webkitNow()
                } else {
                    if (Date.now) {
                        return Date.now()
                    } else {
                        return new Date().getTime()
                    }
                }
            }
        },
        _stopTween: function() {
            var q = this;
            if (q._mcsid == null) {
                return
            }
            if (!m.requestAnimationFrame) {
                clearTimeout(q._mcsid)
            } else {
                m.cancelAnimationFrame(q._mcsid)
            }
            q._mcsid = null;
            q._mcsstop = 1
        },
        _delete: function(r) {
            try {
                delete r
            } catch(q) {
                r = null
            }
        },
        _mouseBtnLeft: function(q) {
            return ! (q.which && q.which !== 1)
        },
        _pointerTouch: function(r) {
            var q = r.originalEvent.pointerType;
            return ! (q && q !== "touch" && q !== 2)
        },
        _isNumeric: function(q) {
            return ! isNaN(parseFloat(q)) && isFinite(q)
        }
    };
    var i = ("https:" == n.location.protocol) ? "https:": "http:";
    h.fn[e] = function(q) {
        if (b[q]) {
            return b[q].apply(this, Array.prototype.slice.call(arguments, 1))
        } else {
            if (typeof q === "object" || !q) {
                return b.init.apply(this, arguments)
            } else {
                h.error("Method " + q + " does not exist")
            }
        }
    };
    h[e] = function(q) {
        if (b[q]) {
            return b[q].apply(this, Array.prototype.slice.call(arguments, 1))
        } else {
            if (typeof q === "object" || !q) {
                return b.init.apply(this, arguments)
            } else {
                h.error("Method " + q + " does not exist")
            }
        }
    };
    h[e].defaults = f;
    m[e] = true;
    h(m).load(function() {
        h(l)[e]()
    })
})(jQuery, window, document);
Site.addModuleContextMenu = function(options) {
    if (!Fai.top._contextMenu) {
        return
    }
    if (! ("contextMenu" in $)) {
        return
    }
    if (Object.prototype.toString.call(options).toLowerCase() != "[object object]") {
        throw new Error("Site.addModuleContextMenu 参数错误");
        return
    }
    var timer;
    if (Fai.top.$("#module" + options.id).hasClass("formStyle80")) {
        return
    }
    $.contextMenu({
        selector: "#module" + options.id,
        className: "fk-moduleContextMenu fk-moduleContextMenu" + options.id,
        classNames: {
            icon: "f-icon"
        },
        build: function($triggerElement, e) {
            var items = {},
            items1 = {},
            items2 = {},
            items3 = {},
            moduleId = options.id,
            module = Fai.top.$("#module" + moduleId),
            moduleStateList = options.moduleStateList || {},
            moduleDirectionList = options.moduleDirectionList || {},
            moduleOtherList = options.moduleOtherList || {},
            len = moduleStateList.length,
            moduleDirectionListLen = moduleDirectionList.length,
            moduleOtherListLen = moduleOtherList.length,
            hasItem = false,
            hasDirectionItem = false,
            hasEditItem = false,
            hasOtherItem = false,
            data,
            menuClass,
            menuName,
            menuStatusScript,
            menuEvalScript,
            i;
            for (i = 0; i < len; i++) {
                data = moduleStateList[i];
                menuClass = data.iconClass || "menu" + i;
                menuName = data.text;
                menuStatusScript = data.statusScript || 1;
                menuEvalScript = data.evalScript;
                if (eval(menuStatusScript) != -1) {
                    hasItem = true;
                    hasDirectionItem = true;
                    items1[menuClass] = {};
                    items1[menuClass]["name"] = menuName;
                    items1[menuClass]["usehtml"] = true;
                    items1[menuClass]["html"] = "<div class='f-tip'></div><div>" + menuName + "</div>";
                    items1[menuClass]["icon"] = menuClass;
                    items1[menuClass]["callback"] = buildItemitems(menuEvalScript)
                }
            }
            for (i = 0; i < moduleDirectionListLen; i++) {
                data = moduleDirectionList[i];
                menuClass = data.iconClass || "edit" + i;
                menuName = data.text;
                menuStatusScript = data.statusScript || 1;
                menuEvalScript = data.evalScript;
                if (eval(menuStatusScript) != -1) {
                    hasItem = true;
                    hasEditItem = true;
                    items2[menuClass] = {};
                    items2[menuClass]["name"] = menuName;
                    items2[menuClass]["usehtml"] = true;
                    items2[menuClass]["html"] = "<div class='f-tip'></div><div>" + menuName + "</div>";
                    items2[menuClass]["icon"] = menuClass;
                    items2[menuClass]["callback"] = buildItemitems(menuEvalScript)
                }
            }
            var sideStatus = module.attr("_side"),
            flutterSwitch = module.attr("_flutterSwitch");
            if (sideStatus == 2 && Fai.top._canDesign) {
                menuEvalScript = "Site.flutterStopSwitch('module" + moduleId + "')";
                if (flutterSwitch == "true") {
                    menuClass = "flutterStart";
                    menuName = "开始飘动"
                } else {
                    menuClass = "flutterStop";
                    menuName = "停止飘动"
                }
                hasItem = true;
                hasEditItem = true;
                items2[menuClass] = {};
                items2[menuClass]["name"] = menuName;
                items2[menuClass]["usehtml"] = true;
                items2[menuClass]["html"] = "<div class='f-tip'></div><div>" + menuName + "</div>";
                items2[menuClass]["icon"] = menuClass;
                items2[menuClass]["callback"] = buildItemitems(menuEvalScript);
                menuClass = "Location";
                menuName = "设为飘动起始位置";
                menuEvalScript = 'Site.flutterSetStartLocation("module' + moduleId + '")';
                items2[menuClass] = {};
                items2[menuClass]["name"] = menuName;
                items2[menuClass]["usehtml"] = true;
                items2[menuClass]["html"] = "<div class='f-tip'></div><div>" + menuName + "</div>";
                items2[menuClass]["icon"] = menuClass;
                items2[menuClass]["callback"] = buildItemitems(menuEvalScript)
            }
            for (i = 0; i < moduleOtherListLen; i++) {
                data = moduleOtherList[i];
                menuClass = data.iconClass || "other" + i;
                menuName = data.text;
                menuStatusScript = data.statusScript || 1;
                menuEvalScript = data.evalScript;
                if (eval(menuStatusScript) != -1) {
                    hasItem = true;
                    hasOtherItem = true;
                    items3[menuClass] = {};
                    items3[menuClass]["name"] = menuName;
                    items3[menuClass]["usehtml"] = true;
                    items3[menuClass]["html"] = "<div class='f-tip'></div><div>" + menuName + "</div>";
                    items3[menuClass]["icon"] = menuClass;
                    items3[menuClass]["callback"] = buildItemitems(menuEvalScript)
                }
            }
            items = items1;
            if (hasDirectionItem && hasEditItem) {
                items.sep1 = "-------"
            }
            items = $.extend(items, items2);
            if (hasEditItem && hasOtherItem) {
                items.sep2 = "-------"
            }
            items = $.extend(items, items3);
            function buildItemitems(evalScript) {
                return function(key, opt) {
                    eval(evalScript);
                    switch (key) {
                    case "mtop":
                    case "mbottom":
                    case "mleft":
                    case "mright":
                    case "lock":
                    case "dockModule":
                    case "absModule":
                    case "mzindex":
                    case "flutterStop":
                        Site.scrollToModuleDiv(Fai.top.$("#module" + options.id));
                        Site.triggerGobalEvent("showFindModuleDiv", options.id);
                        break;
                    default:
                    }
                }
            }
            if (!hasItem) {
                return false
            }
            return {
                items: items
            }
        },
        events: {
            show: function() {
                var module = Fai.top.$("#module" + options.id),
                moduleData = getModuleData(module),
                parentId = -1,
                parentModule,
                sideStatus;
                if (moduleData.inTabId > 0) {
                    parentId = moduleData.inTabId
                } else {
                    if (moduleData.inMulColId > 0) {
                        parentId = moduleData.inMulColId
                    } else {
                        if (moduleData.inFullmeasureId > 0) {
                            parentId = moduleData.inFullmeasureId
                        }
                    }
                }
                if (parentId > 0) {
                    parentModule = Fai.top.$("#module" + parentId);
                    Site.moduleEditTool.contextMenu(parentId, true)
                }
                Site.moduleEditTool.contextMenu(options.id, true);
                Site.removeAllEditLayer();
                Site.addMoveFrame("module" + options.id);
                if (module.attr("_side") == "2" && module.attr("_flutterswitch") != "true") {
                    module.attr("_edit", true);
                    Site.stopFlutterInterval(module)
                } else {
                    if (module.attr("_side") == "1") {
                        module.off("mouseenter.sideModule").off("mouseleave.sideModule")
                    } else {
                        if (parentModule && parentModule.length > 0) {
                            sideStatus = parentModule.attr("_side");
                            if (sideStatus == "1") {
                                parentModule.off("mouseenter.sideModule").off("mouseleave.sideModule")
                            } else {
                                if (sideStatus == "2" && parentModule.attr("_flutterswitch") != "true") {
                                    parentModule.attr("_edit", true);
                                    Site.stopFlutterInterval(parentModule)
                                }
                            }
                        }
                    }
                }
                timer = setTimeout(function() {
                    var module = Fai.top.$("#module" + options.id);
                    Site.addMoveFrame("module" + options.id);
                    if (module.data("bottomLine") == 1) {
                        Fai.top.$("#module" + options.id + "moveFrameBottom").css({
                            opacity: 1
                        })
                    }
                    if (module.data("topLine") == 1) {
                        Fai.top.$("#module" + options.id + "moveFrameTop").css({
                            opacity: 1
                        })
                    }
                    if (module.data("leftLine") == 1) {
                        Fai.top.$("#module" + options.id + "moveFrameLeft").css({
                            opacity: 1
                        })
                    }
                    if (module.data("rightLine") == 1) {
                        Fai.top.$("#module" + options.id + "moveFrameRight").css({
                            opacity: 1
                        })
                    }
                },
                200)
            },
            hide: function() {
                clearTimeout(timer);
                timer = null;
                Site.removeMoveFrame("module" + options.id);
                var module = Fai.top.$("#module" + options.id),
                moduleData = getModuleData(module),
                parentId = -1,
                parentModule;
                if (moduleData.inTabId > 0) {
                    parentId = moduleData.inTabId
                } else {
                    if (moduleData.inMulColId > 0) {
                        parentId = moduleData.inMulColId
                    } else {
                        if (moduleData.inFullmeasureId > 0) {
                            parentId = moduleData.inFullmeasureId
                        }
                    }
                }
                if (module.attr("_side") == 2 && module.attr("_flutterswitch") != "true") {
                    module.removeAttr("_edit");
                    Site.startFlutterInterval(module)
                } else {
                    if (module.attr("_side") == 1) {
                        Site.reSetSidePosition(module)
                    }
                }
                Site.moduleEditTool.contextMenu(options.id, false);
                if (parentId > 0) {
                    parentModule = Fai.top.$("#module" + parentId);
                    Site.moduleEditTool.contextMenu(parentId, false);
                    if (parentModule.attr("_side") == 2 && parentModule.attr("_flutterswitch") != "true") {
                        parentModule.removeAttr("_edit");
                        Site.startFlutterInterval(parentModule)
                    } else {
                        if (parentModule.attr("_side") == 1) {
                            Site.reSetSidePosition(parentModule)
                        }
                    }
                }
            }
        }
    });
    function getModuleData(module) {
        if (Object.prototype.toString.call(module).toLowerCase() != "[object object]") {
            throw new Error("contextMenu getModuleData 参数错误");
            return
        }
        var isFullmeasure = false,
        inFullmeasure = false,
        inFullmeasureId = 0,
        isTab = false,
        inTab = false,
        inTabId = 0,
        isMulCol = false,
        inMulCol = false,
        inMulColId = 0,
        isMultiModule = false,
        inMultiModule = false;
        if (module.hasClass("formStyle80")) {
            isFullmeasure = true
        } else {
            if (module.hasClass("formStyle35")) {
                isMulCol = true
            } else {
                if (module.hasClass("formStyle29")) {
                    isTab = true
                }
            }
        }
        inFullmeasureId = module.attr("_infullmeasure") || 0;
        if (inFullmeasureId > 0) {
            inFullmeasure = true
        }
        inTabId = module.attr("_intab") || 0;
        if (inTabId > 0) {
            inTab = true
        }
        inMulColId = module.attr("_inmulmcol") || 0;
        if (inMulColId > 0) {
            inMulCol = true
        }
        if (isTab || isMulCol) {
            isMultiModule = true
        }
        if (inTab || inMulCol) {
            inMultiModule = true
        }
        return {
            isFullmeasure: isFullmeasure,
            inFullmeasure: inFullmeasure,
            inFullmeasureId: inFullmeasureId,
            isTab: isTab,
            inTab: inTab,
            inTabId: inTabId,
            isMulCol: isMulCol,
            inMulCol: inMulCol,
            inMulColId: inMulColId,
            isMultiModule: isMultiModule,
            inMultiModule: inMultiModule
        }
    }
};
Site.moduleEditTool = {}; (function($, FUNC, undefined) {
    var _timer = [];
    ModuleStatus = function() {
        var list = {};
        return {
            lock: function(id) {
                list[id] = list[id] || {};
                list[id].lock = true
            },
            open: function(id) {
                list[id] = list[id] || {};
                delete list[id].lock
            },
            getStatus: function(id) {
                var status = false;
                if (list[id]) {
                    status = list[id].status
                }
                return status
            },
            getActivePart: function(id) {
                var part = -1;
                if (list[id]) {
                    if ("part" in list[id]) {
                        part = list[id].part
                    }
                }
                return part
            },
            isActive: function(id, part) {
                list[id] = list[id] || {};
                if ( !! list[id].lock) {
                    return
                }
                list[id].status = true;
                if (part == "tool") {
                    list[id].part = 1
                } else {
                    if (part == "dragBtn") {
                        list[id].part = 2
                    } else {
                        if (part == "resizeCancel") {
                            list[id].part = 3
                        } else {
                            if (part == "child") {
                                list[id].part = 4
                            } else {
                                list[id].part = 0
                            }
                        }
                    }
                }
            },
            getContextMenu: function(id) {
                list[id] = list[id] || {};
                return list[id].contextMenu || false
            },
            getMultiModule: function(id) {
                list[id] = list[id] || {};
                return list[id].multiModule || false
            },
            isLeave: function(id) {
                list[id] = list[id] || {};
                if ( !! list[id].lock) {
                    return
                }
                list[id].status = false;
                delete list[id].part
            },
            onContextMenu: function(id) {
                list[id] = list[id] || {};
                list[id].contextMenu = true
            },
            offContextMenu: function(id) {
                list[id] = list[id] || {};
                list[id].contextMenu = false
            },
            onMultiModule: function(id) {
                list[id] = list[id] || {};
                list[id].multiModule = true
            },
            offMultiModule: function(id) {
                list[id] = list[id] || {};
                list[id].multiModule = false
            },
            clearAll: function() {
                list = {}
            }
        }
    } ();
    FUNC.init = function(options) {
        if (Object.prototype.toString.call(options).toLowerCase() != "[object object]") {
            throw new Error("Site.moduleEditTool.init 参数错误");
            return
        }
        var module = Fai.top.$("#module" + options.id);
        if (module.length < 1) {
            return
        }
        module.off("mouseover.moduleEdit").off("mouseleave.moduleEdit").on("mouseover.moduleEdit",
        function(e) {
            clearTimer(options.id, "leaveParentModule");
            clearTimer(options.id, "leaveSideModule");
            clearTimer(options.id, "bindToolbarEvent_mouseleave");
            clearTimer(options.id, "initDrag");
            clearTimer(options.id, "bindToolbarEvent_mouseover");
            clearTimer(options.id, "initToolbar_mouseover");
            ModuleStatus.isActive(options.id);
            var moduleData = getModuleData($(this)),
            parentId = -1;
            if (moduleData.inTabId > 0) {
                parentId = moduleData.inTabId
            } else {
                if (moduleData.inMulColId > 0) {
                    parentId = moduleData.inMulColId
                } else {
                    if (moduleData.inFullmeasureId > 0) {
                        parentId = moduleData.inFullmeasureId
                    }
                }
            }
            if (parentId > 0) {
                clearTimer(parentId, "leaveParentModule");
                clearTimer(parentId, "leaveSideModule");
                ModuleStatus.open(parentId);
                ModuleStatus.isActive(parentId, "child");
                ModuleStatus.lock(parentId)
            }
            initToolbar_mouseover(options);
            initMoveFrame_mouseover(options);
            initDrag_mouseover(options);
            initResizeCancel_mouseover(options)
        }).on("mouseleave.moduleEdit",
        function(e) {
            if (ModuleStatus.getActivePart(options.id) == 5) {
                return
            }
            clearTimer(options.id, "leaveParentModule");
            clearTimer(options.id, "leaveSideModule");
            clearTimer(options.id, "bindToolbarEvent_mouseleave");
            ModuleStatus.isLeave(options.id);
            var moduleData = getModuleData($(this)),
            parentId = -1;
            if (moduleData.inTabId > 0) {
                parentId = moduleData.inTabId
            } else {
                if (moduleData.inMulColId > 0) {
                    parentId = moduleData.inMulColId
                } else {
                    if (moduleData.inFullmeasureId > 0) {
                        parentId = moduleData.inFullmeasureId
                    }
                }
            }
            if (parentId > 0) {
                clearTimer(parentId, "leaveParentModule");
                clearTimer(parentId, "leaveSideModule");
                ModuleStatus.open(parentId);
                ModuleStatus.isLeave(parentId)
            }
            initToolbar_mouseleave(options);
            initMoveFrame_mouseleave(options);
            initDrag_mouseleave(options);
            initResizeCancel_mouseleave(options);
            clearTimer(options.id, "moduleEditMouseleave");
            var timer = setTimeout(function() {
                if (!ModuleStatus.getStatus(options.id)) {
                    leaveModule(options)
                }
            },
            300);
            setTimer(options.id, "moduleEditMouseleave", timer)
        });
        initMultiModuleEvent(options);
        initResizeCancelTip_delegate(options);
        if (!Fai.top._canDesign) {
            Site.removeDesignEditLayer()
        }
        if (!Fai.top._canEditData) {
            Site.removeAllDataEditLayer()
        }
    };
    FUNC.remove = function(id) {
        leaveModule({
            id: id
        })
    };
    FUNC.contextMenu = function(id, flag) {
        var moduleData = getModuleData(Fai.top.$("#module" + id)),
        parentId = -1;
        if (moduleData.inTabId > 0) {
            parentId = moduleData.inTabId
        } else {
            if (moduleData.inMulColId > 0) {
                parentId = moduleData.inMulColId
            } else {
                if (moduleData.inFullmeasureId > 0) {
                    parentId = moduleData.inFullmeasureId
                }
            }
        }
        if (flag) {
            ModuleStatus.onContextMenu(id)
        } else {
            ModuleStatus.offContextMenu(id)
        }
        clearAllTimer(id);
        if (parentId > 0) {
            if (flag) {
                ModuleStatus.onContextMenu(parentId)
            } else {
                ModuleStatus.offContextMenu(parentId)
            }
            clearAllTimer(parentId)
        }
    };
    function initMultiModuleEvent(options) {
        var module = Fai.top.$("#module" + options.id);
        if (module.length < 1) {
            return
        }
        var moduleData = getModuleData(module);
        if (moduleData.isMulCol) {
            module.find(".formBanner" + options.id).off("mouseover.moduleEdit").off("mouseleave.moduleEdit").on("mouseover.moduleEdit",
            function() {
                ModuleStatus.onMultiModule(options.id)
            }).on("mouseleave.moduleEdit",
            function() {
                ModuleStatus.offMultiModule(options.id)
            })
        } else {
            if (moduleData.isTab) {
                module.find(".titleTable").off("mouseover.moduleEdit").off("mouseleave.moduleEdit").on("mouseover.moduleEdit",
                function() {
                    ModuleStatus.onMultiModule(options.id)
                }).on("mouseleave.moduleEdit",
                function() {
                    ModuleStatus.offMultiModule(options.id)
                })
            }
        }
    }
    function bindToolbarEvent(options) {
        var $moduleToolbar = Fai.top.$("#fk-moduleToolbar" + options.id);
        $moduleToolbar.off("mouseover.toolbar").off("mouseleave.toolbar").on("mouseover.toolbar",
        function() {
            var module = Fai.top.$("#module" + options.id),
            moduleData = getModuleData(module),
            parentId = -1,
            parentModule;
            if (moduleData.inTabId > 0) {
                parentId = moduleData.inTabId
            } else {
                if (moduleData.inMulColId > 0) {
                    parentId = moduleData.inMulColId
                } else {
                    if (moduleData.inFullmeasureId > 0) {
                        parentId = moduleData.inFullmeasureId
                    }
                }
            }
            clearTimer(options.id, "dragBtnMouseover");
            clearTimer(options.id, "resizeCancelBtnMouseleave");
            clearTimer(options.id, "leaveSideModule");
            clearTimer(options.id, "leaveParentModule");
            ModuleStatus.open(options.id);
            ModuleStatus.isActive(options.id, "tool");
            showToolbar(options.id);
            if (parentId > 0) {
                ModuleStatus.open(parentId);
                ModuleStatus.isActive(parentId, "child");
                ModuleStatus.lock(parentId);
                clearTimer(parentId, "leaveSideModule");
                clearTimer(parentId, "leaveParentModule")
            }
            if (module.attr("_side") == "2") {
                Site.stopFlutterInterval(module)
            }
            if (parentId > 0) {
                parentModule = Fai.top.$("#module" + parentId);
                if (parentModule.attr("_side") == "2") {
                    Site.stopFlutterInterval(parentModule)
                }
            }
            clearTimer(options.id, "bindToolbarEvent_mouseleave");
            clearTimer(options.id, "bindToolbarEvent_mouseover");
            var timer = setTimeout(function() {
                if (ModuleStatus.getStatus(options.id) && ModuleStatus.getActivePart(options.id) == 1) {
                    hideDragHandle(options.id);
                    hideResizeCancelBtn(options.id)
                }
            },
            300);
            setTimer(options.id, "bindToolbarEvent_mouseover", timer)
        }).on("mouseleave.toolbar",
        function() {
            var module = Fai.top.$("#module" + options.id),
            moduleData = getModuleData(module),
            parentId = -1;
            if (moduleData.inTabId > 0) {
                parentId = moduleData.inTabId
            } else {
                if (moduleData.inMulColId > 0) {
                    parentId = moduleData.inMulColId
                } else {
                    if (moduleData.inFullmeasureId > 0) {
                        parentId = moduleData.inFullmeasureId
                    }
                }
            }
            if (parentId > 0) {
                ModuleStatus.open(parentId);
                ModuleStatus.isLeave(parentId)
            }
            ModuleStatus.open(options.id);
            ModuleStatus.isLeave(options.id);
            clearTimer(options.id, "bindToolbarEvent_mouseover");
            clearTimer(options.id, "bindToolbarEvent_mouseleave");
            var timer = setTimeout(function() {
                if (!ModuleStatus.getStatus(options.id)) {
                    leaveModule(options)
                }
            },
            300);
            setTimer(options.id, "bindToolbarEvent_mouseleave", timer)
        })
    }
    function removeToolbar(id) {
        Fai.top.$("#fk-moduleToolbar" + id).remove()
    }
    function addToolbar(options) {
        if (Object.prototype.toString.call(options).toLowerCase() != "[object object]") {
            throw new Error("Site.moduleEditTool.addToolbar 参数错误");
            return
        }
        var id = options.id,
        toolList = options.toolList,
        len = toolList.length || 0,
        i = 0,
        html = [],
        data,
        status,
        evalScript,
        title,
        text,
        className,
        toolDisplay;
        if (toolList.length < 0) {
            return
        }
        var $moduleToolbar = Fai.top.$("#fk-moduleToolbar" + id);
        if ($moduleToolbar.length > 0) {
            setModuleToolbarPosition(id);
            return
        }
        var module = Fai.top.$("#module" + id),
        moduleData = getModuleData(module),
        extClass = "";
        if (moduleData.isMultiModule) {
            extClass = "fk-moduleToolbar-multiModule"
        } else {
            if (moduleData.isFullmeasure) {
                extClass = "fk-moduleToolbar-fullmeasure"
            }
        }
        var moudleAttr = Site.getModuleAttrPattern(id),
        needResetTB = false;
        if (moudleAttr.border.y === 1 && moudleAttr.bannerType === 1 && moudleAttr.contentBg.y === 1) {
            needResetTB = true
        }
        html.push("<div id='fk-moduleToolbar" + id + "' class='fk-moduleToolbar " + extClass + "'>");
        if (moduleData.isFullmeasure) {
            for (i = 0; i < len; i++) {
                data = toolList[i];
                status = true;
                if (data.statusScript) {
                    if (eval(data.statusScript) == -1) {
                        status = false
                    }
                }
                if (!status) {
                    continue
                }
                toolDisplay = data.toolDisplay;
                evalScript = data.evalScript;
                text = data.text || "";
                title = data.text || "";
                className = data.toolClass || "";
                if (toolDisplay == "toolIcon") {
                    text = "&nbsp;"
                }
                html.push("<div class='f-toolItem f-toolItem" + className + "'>");
                html.push("<a class='f-title' title='" + title + "' onclick=\"" + evalScript + ';Site.removeAllEditLayer();return false;">' + text + "</a>");
                html.push("</div>")
            }
        } else {
            for (i = 0; i < len; i++) {
                data = toolList[i];
                status = true;
                if (data.statusScript) {
                    if (eval(data.statusScript) == -1) {
                        status = false
                    }
                }
                if (!status) {
                    continue
                }
                evalScript = data.evalScript;
                title = data.text || "";
                className = data.iconClass || "";
                if (data.setTB && status) {
                    if (needResetTB) {
                        className = "resetTB";
                        title = "显示外框";
                        evalScript = "Site.oneKeySetModuleTB(" + id + ", false)"
                    } else {
                        className = "clearTB";
                        title = "隐藏外框";
                        evalScript = "Site.oneKeySetModuleTB(" + id + ", true)"
                    }
                }
                html.push("<div class='f-toolItem f-toolItem" + className + "'>");
                html.push("<a class='f-title' onclick=\"" + evalScript + ";Site.removeAllEditLayer();return false;\"><span class='f-icon'></span>" + title + "</a>");
                html.push("</div>")
            }
        }
        html.push("</div>");
        Fai.top.$("body").append(html.join(""));
        setModuleToolbarPosition(id);
        bindToolbarEvent(options)
    }
    function initToolbar_mouseover(options) {
        if (!Fai.isNull(Site._enableEditLayer) && !Site._enableEditLayer) {
            hideToolbar(options.id);
            return
        }
        clearTimer(options.id, "initToolbar_mouseover");
        var timer = setTimeout(function() {
            if (ModuleStatus.getStatus(options.id) && ModuleStatus.getActivePart(options.id) != 4) {
                if (getModuleData(Fai.top.$("#module" + options.id)).isMultiModule) {
                    if (ModuleStatus.getMultiModule(options.id)) {
                        addToolbar(options);
                        showToolbar(options.id)
                    } else {
                        addToolbar(options);
                        if (ModuleStatus.getActivePart(options.id) != 2 && ModuleStatus.getActivePart(options.id) != 1) {
                            hideToolbar(options.id)
                        }
                    }
                } else {
                    addToolbar(options);
                    showToolbar(options.id)
                }
            } else {
                hideToolbar(options.id)
            }
        },
        100);
        setTimer(options.id, "initToolbar_mouseover", timer)
    }
    function initToolbar_mouseleave(options) {
        clearTimer(options.id, "initToolbar_mouseleave");
        var timer = setTimeout(function() { ! ModuleStatus.getStatus(options.id) && hideToolbar(options.id)
        },
        100);
        setTimer(options.id, "initToolbar_mouseleave", timer)
    }
    function initMoveFrame_mouseover(options) {
        if (!Fai.isNull(Site._enableEditLayer) && !Site._enableEditLayer) {
            return
        }
        var module = Fai.top.$("#module" + options.id);
        if (ModuleStatus.getStatus(options.id) && ModuleStatus.getActivePart(options.id) != 4) {
            Site.removeMoveFrame("module" + options.id);
            Site.addMoveFrame("module" + options.id)
        }
        Site.refreshResizableHandles(module)
    }
    function initMoveFrame_mouseleave(options) {
        var module = Fai.top.$("#module" + options.id);
        if (module.data("bottomLine") == 1) {
            Fai.top.$("#module" + options.id + "moveFrameBottom").css({
                opacity: 1
            })
        }
        if (module.data("topLine") == 1) {
            Fai.top.$("#module" + options.id + "moveFrameTop").css({
                opacity: 1
            })
        }
        if (module.data("leftLine") == 1) {
            Fai.top.$("#module" + options.id + "moveFrameLeft").css({
                opacity: 1
            })
        }
        if (module.data("rightLine") == 1) {
            Fai.top.$("#module" + options.id + "moveFrameRight").css({
                opacity: 1
            })
        }
    }
    function initDrag_mouseover(options) {
        if (!Fai.top._canDesign) {
            return
        }
        addDragHandle(options.id);
        setDragBtnPosition(options.id)
    }
    function initDrag_mouseleave(options) {
        clearTimer(options.id, "initDrag");
        var timer = setTimeout(function() {
            if (!ModuleStatus.getStatus(options.id)) {
                hideDragHandle(options.id)
            }
        },
        100);
        setTimer(options.id, "initDrag", timer)
    }
    function initResizeCancel_mouseover(options) {
        if (!Fai.top._canDesign) {
            return
        }
        if (!Fai.isNull(Site._enableEditLayer) && !Site._enableEditLayer) {
            return
        }
        if (ModuleStatus.getStatus(options.id) && ModuleStatus.getActivePart(options.id) != 4) {
            showResizeCancelBtn(options.id)
        } else {
            hideResizeCancelBtn(options.id)
        }
    }
    function initResizeCancel_mouseleave(options) {
        clearTimer(options.id, "initResizeCancel_mouseleave");
        var timer = setTimeout(function() { ! ModuleStatus.getStatus(options.id) && hideResizeCancelBtn(options.id)
        },
        100);
        setTimer(options.id, "initResizeCancel_mouseleave", timer)
    }
    function initResizeCancelTip_delegate(options) {
        Fai.top.$("#module" + options.id).delegate(".J_resizableTip", "mouseover.resizeCancelBtn",
        function() {
            ModuleStatus.isActive(options.id, "resizeCancel");
            ModuleStatus.lock(options.id);
            clearTimer(options.id, "resizeCancelBtnMouseover");
            clearTimer(options.id, "resizeCancelBtnMouseleave");
            var timer = setTimeout(function() {
                if (ModuleStatus.getActivePart(options.id) == 3) {
                    hideDragHandle(options.id);
                    hideToolbar(options.id, 400)
                }
            },
            300);
            setTimer(options.id, "resizeCancelBtnMouseover", timer)
        }).delegate(".J_resizableTip", "mouseleave.resizeCancelBtn",
        function() {
            ModuleStatus.open(options.id);
            ModuleStatus.isLeave(options.id);
            clearTimer(options.id, "resizeCancelBtnMouseover");
            clearTimer(options.id, "resizeCancelBtnMouseleave");
            var timer = setTimeout(function() {
                if (ModuleStatus.getStatus(options.id) && ModuleStatus.getActivePart(options.id) != 4) {
                    showToolbar(options.id);
                    showDragHandle(options.id)
                }
            },
            100);
            setTimer(options.id, "resizeCancelBtnMouseleave", timer)
        })
    }
    function setModuleToolbarPosition(id) {
        var $moduleToolbar = Fai.top.$("#fk-moduleToolbar" + id);
        if ($moduleToolbar.length < 0) {
            return
        }
        var module = Fai.top.$("#module" + id),
        moduleData = getModuleData(module),
        moduleWidth = module.outerWidth(true),
        moduleHeight = module.outerHeight(true),
        offset = module.offset(),
        left = offset.left,
        top = offset.top,
        right = left + moduleWidth,
        bottom = top + moduleHeight,
        floatRightBottomOffset = Fai.top.$(".floatRightBottom").offset(),
        windowWidth = floatRightBottomOffset.left,
        windowHeight = floatRightBottomOffset.top,
        toolWidth = $moduleToolbar.outerWidth(true),
        toolHeight = $moduleToolbar.outerHeight(true),
        toolLeft = 0,
        toolTop = 0,
        toolBottom = 0,
        fixBottom = false,
        extClass = "",
        fixRight = false;
        if (moduleData.isFullmeasure) {
            toolLeft = right - toolWidth;
            toolTop = top - toolHeight;
            extClass = "fk-moduleToolbar-left"
        } else {
            if (right <= (windowWidth - toolWidth) && !moduleData.inMulCol && !moduleData.inTab) {
                toolLeft = right;
                toolTop = top;
                extClass = "fk-moduleToolbar-right";
                if (module.find(".formMiddleContent" + id).children(".pd_mall_G_J").length > 0 || module.find(".formMiddleContent" + id).children(".navA_C_J").length > 0) {
                    toolLeft = left - toolWidth;
                    toolTop = top;
                    extClass = "fk-moduleToolbar-left";
                    fixRight = true
                }
            } else {
                if (left >= toolWidth) {
                    toolLeft = left - toolWidth;
                    toolTop = top;
                    extClass = "fk-moduleToolbar-left";
                    fixRight = true
                } else {
                    toolLeft = left;
                    toolTop = top;
                    extClass = "fk-moduleToolbar-left";
                    fixRight = true
                }
            }
            if (windowHeight < (toolTop + toolHeight)) {
                fixBottom = true;
                toolBottom = 0
            }
        }
        $moduleToolbar.removeClass("fk-moduleToolbar-left fk-moduleToolbar-right").addClass(extClass);
        if (fixBottom) {
            $moduleToolbar.css({
                left: toolLeft + "px",
                bottom: toolBottom + "px"
            })
        } else {
            $moduleToolbar.css({
                left: toolLeft + "px",
                top: toolTop + "px"
            })
        }
        if (moduleData.isMultiModule) {
            if (moduleData.isTab) {
                fixRight ? module.find(".J_tabHandle").addClass("fk-multiDragBtn-left") : module.find(".J_tabHandle").removeClass("fk-multiDragBtn-left")
            } else {
                if (moduleData.isMulCol) {
                    fixRight ? module.find(".J_multiHandle").addClass("fk-multiDragBtn-left") : module.find(".J_multiHandle").removeClass("fk-multiDragBtn-left")
                }
            }
        }
    }
    function leaveModule(options) {
        var module = Fai.top.$("#module" + options.id),
        moduleData = getModuleData(module),
        parentId = -1,
        timer,
        timer2;
        if (moduleData.inTabId > 0) {
            parentId = moduleData.inTabId
        } else {
            if (moduleData.inMulColId > 0) {
                parentId = moduleData.inMulColId
            } else {
                if (moduleData.inFullmeasureId > 0) {
                    parentId = moduleData.inFullmeasureId
                }
            }
        }
        clearAllTimer(options.id);
        removeToolbar(options.id);
        hideDragHandle(options.id);
        hideResizeCancelBtn(options.id);
        if (!ModuleStatus.getContextMenu(options.id)) {
            Site.removeMoveFrame("module" + options.id)
        }
        if (module.attr("_side") == "2" && module.attr("_flutterSwitch") != "true") {
            Site.startFlutterInterval(module)
        } else {
            if (module.attr("_side") == "1") {
                clearTimer(options.id, "leaveSideModule");
                timer = setTimeout(function() {
                    if (!ModuleStatus.getStatus(options.id) && !ModuleStatus.getContextMenu(options.id) && Fai.top.$(".fk-moduleContextMenu" + options.id).length < 1) {
                        Site.reSetSidePosition(module)
                    }
                },
                300);
                setTimer(options.id, "leaveSideModule", timer)
            }
        }
        if (parentId > 0 && !ModuleStatus.getStatus(parentId)) {
            clearTimer(parentId, "leaveParentModule");
            timer2 = setTimeout(function() {
                var module = Fai.top.$("#module" + options.id),
                moduleData = getModuleData(module),
                parentId = -1;
                if (moduleData.inTabId > 0) {
                    parentId = moduleData.inTabId
                } else {
                    if (moduleData.inMulColId > 0) {
                        parentId = moduleData.inMulColId
                    } else {
                        if (moduleData.inFullmeasureId > 0) {
                            parentId = moduleData.inFullmeasureId
                        }
                    }
                }
                leaveModule({
                    id: parentId
                })
            },
            300);
            setTimer(parentId, "leaveParentModule", timer2)
        }
    }
    function getModuleData(module) {
        if (Object.prototype.toString.call(module).toLowerCase() != "[object object]") {
            throw new Error("Site.moduleEditTool getModuleData 参数错误");
            return
        }
        var isFullmeasure = false,
        inFullmeasure = false,
        inFullmeasureId = 0,
        isTab = false,
        inTab = false,
        inTabId = 0,
        isMulCol = false,
        inMulCol = false,
        inMulColId = 0,
        isMultiModule = false,
        inMultiModule = false;
        if (module.hasClass("formStyle80")) {
            isFullmeasure = true
        } else {
            if (module.hasClass("formStyle35")) {
                isMulCol = true
            } else {
                if (module.hasClass("formStyle29")) {
                    isTab = true
                }
            }
        }
        inFullmeasureId = module.attr("_infullmeasure") || 0;
        if (inFullmeasureId > 0) {
            inFullmeasure = true
        }
        inTabId = module.attr("_intab") || 0;
        if (inTabId > 0) {
            inTab = true
        }
        inMulColId = module.attr("_inmulmcol") || 0;
        if (inMulColId > 0) {
            inMulCol = true
        }
        if (isTab || isMulCol) {
            isMultiModule = true
        }
        if (inTab || inMulCol) {
            inMultiModule = true
        }
        return {
            isFullmeasure: isFullmeasure,
            inFullmeasure: inFullmeasure,
            inFullmeasureId: inFullmeasureId,
            isTab: isTab,
            inTab: inTab,
            inTabId: inTabId,
            isMulCol: isMulCol,
            inMulCol: inMulCol,
            inMulColId: inMulColId,
            isMultiModule: isMultiModule,
            inMultiModule: inMultiModule
        }
    }
    function addDragHandle(id) {
        var module = Fai.top.$("#module" + id);
        if (module.length < 1) {
            return
        }
        var moduleData = getModuleData(module),
        addNew = false;
        if (!moduleData.isMultiModule && !moduleData.isFullmeasure) {
            if (module.children(".draggableBtn").find(".J_handle").length < 1) {
                var html = [],
                dragBtnWidth = 30,
                left = module.width() / 2 - dragBtnWidth;
                html.push("<div class='draggableBtn' _mouseIn='0' style='left:" + left + "px;'>");
                html.push("<a href='javascript:;' onclick='return false;' class='J_handle dragHandle'></a>");
                html.push("</div>");
                module.append(html.join(""));
                module.off("Fai_onModuleSizeChange.dragBtn").off("Fai_onModuleLayoutChange.dragBtn").on("Fai_onModuleSizeChange.dragBtn",
                function() {
                    Site.fixDragBtnPos($(this))
                }).on("Fai_onModuleLayoutChange.dragBtn",
                function() {
                    Site.fixDragBtnPos($(this))
                });
                addNew = true
            }
        } else {
            var gtIE8 = true;
            if (Fai.isIE6() || Fai.isIE7() || Fai.isIE8()) {
                gtIE8 = false
            }
            if (moduleData.isMulCol && module.find(".J_multiHandle").length < 1) {
                if (gtIE8) {
                    module.append('<div class="J_multiHandle fk-multiDragBtn" title="按住鼠标，可随意拖动模块列布局。"></div>')
                } else {
                    module.append('<div class="J_multiHandle fk-multiDragBtn-low" title="按住鼠标，可随意拖动模块列布局。"></div>')
                }
                addNew = true
            } else {
                if (moduleData.isTab && module.find(".J_tabHandle").length < 1) {
                    if (gtIE8) {
                        module.append('<div class="J_tabHandle fk-multiDragBtn" title="按住鼠标，可随意拖动模块组布局。"></div>')
                    } else {
                        module.append('<div class="J_tabHandle fk-multiDragBtn-low" title="按住鼠标，可随意拖动模块组布局。"></div>')
                    }
                    module.find(".formTabButton").attr("title", "按住鼠标，可随意调整模块组内模块顺序");
                    module.find(".formTab").addClass("column");
                    addNew = true
                } else {
                    if (moduleData.isFullmeasure && module.find(".J_fullmeasureHandle").length < 1) {
                        module.append('<div class="J_fullmeasureHandle fk-fullmeasureDragBtn" title="按住鼠标，可随意拖动通栏模块布局。"></div>');
                        addNew = true
                    }
                }
            }
        }
        if (addNew) {
            Site.addDragBtnHandle(module);
            bindDragBtnEvent(id)
        } else {
            Site.fixDragBtnPos(module)
        }
        showDragHandle(id)
    }
    function hideDragHandle(id) {
        var module = Fai.top.$("#module" + id);
        if (module.length < 1) {
            return
        }
        var moduleData = getModuleData(module);
        if (moduleData.isTab) {
            module.find(".J_tabHandle").hide()
        } else {
            if (moduleData.isMulCol) {
                module.find(".J_multiHandle").hide()
            } else {
                if (moduleData.isFullmeasure) {
                    module.find(".J_fullmeasureHandle").hide()
                } else {
                    module.children(".draggableBtn").hide()
                }
            }
        }
    }
    function showDragHandle(id) {
        var module = Fai.top.$("#module" + id);
        if (module.length < 1) {
            return
        }
        var moduleData = getModuleData(module);
        if (moduleData.isTab) {
            module.find(".J_tabHandle").stop().show()
        } else {
            if (moduleData.isMulCol) {
                module.find(".J_multiHandle").stop().show()
            } else {
                if (moduleData.isFullmeasure) {
                    module.find(".J_fullmeasureHandle").stop().show()
                } else {
                    module.children(".draggableBtn").stop().show()
                }
            }
        }
    }
    function setDragBtnPosition(id) {}
    function hideToolbar(id, time) {
        if (typeof time == "number") {
            Fai.top.$("#fk-moduleToolbar" + id).stop().fadeOut(time)
        } else {
            Fai.top.$("#fk-moduleToolbar" + id).stop().hide()
        }
    }
    function showToolbar(id) {
        Fai.top.$("#fk-moduleToolbar" + id).stop().css("opacity", 1).show()
    }
    function bindDragBtnEvent(id) {
        var module = Fai.top.$("#module" + id);
        if (module.length < 1) {
            return
        }
        var moduleData = getModuleData(module),
        DragBtn;
        if (moduleData.isTab) {
            DragBtn = module.find(".J_tabHandle")
        } else {
            if (moduleData.isMulCol) {
                DragBtn = module.find(".J_multiHandle")
            } else {
                if (moduleData.isFullmeasure) {
                    DragBtn = module.find(".J_fullmeasureHandle")
                } else {
                    DragBtn = module.children(".draggableBtn")
                }
            }
        }
        DragBtn.off("mouseover.moduleEdit").off("mouseleave.moduleEdit").on("mouseover.moduleEdit",
        function(e) {
            ModuleStatus.isActive(id, "dragBtn");
            ModuleStatus.lock(id);
            clearTimer(id, "dragBtnMouseover");
            var timer = setTimeout(function() {
                var moduleData = getModuleData(Fai.top.$("#module" + id));
                if (moduleData.isMultiModule || moduleData.isFullmeasure) {
                    showToolbar(id);
                    showResizeCancelBtn(id)
                } else {
                    if (ModuleStatus.getActivePart(id) == 2) {
                        hideToolbar(id, 400);
                        hideResizeCancelBtn(id)
                    }
                }
                clearTimer(id, "dragBtnMouseover")
            },
            300);
            setTimer(id, "dragBtnMouseover", timer)
        }).on("mouseleave.moduleEdit",
        function(e) {
            ModuleStatus.open(id);
            ModuleStatus.isLeave(id);
            clearTimer(id, "dragBtnMouseover");
            var timer = setTimeout(function() {
                if (ModuleStatus.getStatus(id) && ModuleStatus.getActivePart(id) != 4) {
                    showToolbar(id);
                    showResizeCancelBtn(id)
                }
            },
            100);
            setTimer(id, "dragBtnMouseleave", timer)
        })
    }
    function showResizeCancelBtn(id) {
        var module = Fai.top.$("#module" + id);
        if (module.length < 1) {
            return
        }
        module.children(".J_resizableTip").show()
    }
    function hideResizeCancelBtn(id) {
        var module = Fai.top.$("#module" + id);
        if (module.length < 1) {
            return
        }
        module.children(".J_resizableTip").hide()
    }
    function setTimer(id, name, timer) {
        _timer[id] = _timer[id] || {};
        _timer[id][name] = timer
    }
    function clearTimer(id, name) {
        if (_timer[id] && _timer[id][name]) {
            clearTimeout(_timer[id][name]);
            delete _timer[id][name]
        }
    }
    function clearAllTimer(id) {
        var timer;
        if (_timer[id]) {
            for (timer in _timer[id]) {
                if (_timer[id].hasOwnProperty(timer)) {
                    clearTimeout(_timer[id][timer]);
                    delete _timer[id][timer]
                }
            }
            delete _timer[id]
        }
    }
})(jQuery, Site.moduleEditTool);