Site.rapidSite = {}; (function(b, a, c) {
    a.dom = {};
    a.dom.body = Fai.top.$("body");
    a.status = {
        ready: false,
        visible: false,
        catchContentScroll: true,
        mallSwitch: true,
        isSelectYouLike: true
    };
    a.data = {
        templatesTitle: "<span>极速建站，闪电一般的速度！</span>",
        viewNum: 0,
        usedArray: [],
        isBUser: false,
        initKind: -1,
        initKind2: -2,
        showRandom: false
    };
    a.utils = {};
    a.checkBUser = function() {
        if (Fai.top.$("#rapidSitePanel").length > 0) {
            return
        }
        if (Fai.top._aid % 2 == 1) {
            a.data.isBUser = true
        }
    }
})(jQuery, Site.rapidSite); (function(b, a, c) {
    a.utils.random = function(f, d) {
        var e = d - f + 1;
        return Math.floor(Math.random() * e + f)
    };
    a.utils.getMousewheel = function(e) {
        var d = e || window.event,
        f = {
            up: false,
            num: 0
        };
        if (d.wheelDelta) {
            f.num = d.wheelDelta
        } else {
            if (d.detail) {
                f.num = -d.detail
            }
        }
        if (f.num > 0) {
            f.up = true
        } else {
            f.up = false
        }
        return f
    }
})(jQuery, Site.rapidSite); (function(f, d, e) {
    var a = true;
    d.data.recommendList = [];
    function b() {
        var l = d.data,
        j = Fai.top._rapidSitePanelData,
        o = {},
        u = [],
        t = [],
        q = 36,
        v = 9 - 1,
        m,
        s,
        r,
        p,
        n;
        if (j.debug) {
            s = [ - 1, 1100564, 1011, 112, 1011, 112, 112, 1011, 112];
            r = [1010, 1001, 1003, 1004, 1005, 1004, 1005, 1005, 1004];
            p = [1005, 1100643, 1100564, 112, 1100564, 112, 112, 1100564, 112];
            l.recommendList.push(s);
            l.recommendList.push(r);
            l.recommendList.push(p)
        } else {
            if (!d.data.isBUser) {
                m = j.likeTemplates.a || []
            } else {
                m = j.likeTemplates.b || []
            }
            for (var k = 0; k < m.length; k++) {
                l.recommendList.push(m[k])
            }
        }
        if (d.data.showRandom) {
            h(l.recommendList, o);
            u = i(Fai.top._rapidSitePanelData.tempLists, q, o);
            for (var k = 0; k < u.length; k++) {
                t.push(u[k]);
                if (t.length > v) {
                    l.recommendList.push(t);
                    t = []
                }
            }
            if (t.length > 0) {
                l.recommendList.push(t);
                t = []
            }
        }
    }
    function h(o, n) {
        var m = [];
        for (var l = 0; l < o.length; l++) {
            m = o[l];
            for (var k = 0; k < m.length; k++) {
                n[m[k]] = true
            }
        }
    }
    d.initRecommendTemplates = function() {
        b();
        var l = Fai.top._rapidSitePanelData.tempLists,
        o = Fai.top._rapidSitePanelData.emptyLists,
        t = l.length,
        v = o.length,
        r = d.data,
        u = [],
        w = [],
        s,
        q,
        p,
        n;
        r.recommendTemplates = [];
        r.youLikeDisplayNum = 0;
        r.youLikeScrollTop = 0;
        for (s = 0; s < r.recommendList.length; s++) {
            w = [];
            u = r.recommendList[s];
            for (q = 0; q < u.length; q++) {
                for (p = 0; p < t; p++) {
                    if (u[q] < 0) {
                        for (n = 0; n < v; n++) {
                            if (o[n].aid == u[q]) {
                                w.push(o[n]);
                                break
                            }
                        }
                        break
                    } else {
                        if (l[p].aid == u[q]) {
                            w.push(l[p]);
                            break
                        }
                    }
                }
            }
            r.recommendTemplates.push(w)
        }
    };
    d.initContentScrollEvent = function() {
        var l = d.dom,
        j = d.status,
        k = d.data;
        if (document.addEventListener) {
            l.panelContent[0].addEventListener("DOMMouseScroll", c, false)
        }
        l.panelContent[0].onmousewheel = c
    };
    function c(j) {
        var k;
        if (d.status.catchContentScroll) {
            k = d.utils.getMousewheel(j);
            if (k.up) {} else {
                g()
            }
        }
    }
    function g() {
        var j = d.dom,
        k = j.panelContent.scrollTop();
        if (a) {
            a = false;
            setTimeout(function() {
                if (k == j.panelContent.scrollTop()) {
                    d.showMoreTemplates()
                }
                a = true
            },
            300)
        }
    }
    function i(o, p, r) {
        var k = [],
        j = r || {},
        q = o.length - 1,
        m = 0,
        s,
        l;
        if (p > q) {
            p = q + 1
        }
        for (var n = 0; n < p; n++) {
            s = d.utils.random(0, q);
            m = 0;
            l = o[s].aid;
            while ( !! j[l]) {
                if (m > q) {
                    break
                }
                m += 1;
                s = d.utils.random(0, q);
                l = o[s].aid
            }
            if (!j[l]) {
                k.push(l);
                j[l] = true
            }
        }
        return k
    }
})(jQuery, Site.rapidSite); (function(h, b, f) {
    b.init = function(t) {
        b.checkBUser();
        var v = "",
        w = "style='display:none;'",
        o = 0,
        p = "猜你喜欢",
        q = "",
        x = "",
        r = b.dom;
        q = "fk-rapidSitePanel-tradeMenu-B";
        if (!b.data.showRandom) {
            x = "style='display:none;'"
        }
        if (Fai.top.$("#popupBgundefined").length != 0) {
            Fai.removeBg()
        }
        if (t != 1) {
            Site.logDog(100063, 0);
            if (typeof Fai.top.hasClickRapidSite == "undefined") {
                Fai.top.hasClickRapidSite = true
            }
        }
        b.rapidSiteViewInit();
        if (Fai.top.$("#rapidSitePanel").length > 0) {
            r.panel.show().animate({
                top: "0"
            },
            function() {
                r.newRapidSitePreview && r.newRapidSitePreview.show();
                r.quickViewTemplate && r.quickViewTemplate.show()
            });
            b.status.visible = true;
            b.initDomStyle();
            return
        }
        b.initRecommendTemplates();
        var s = [];
        s.push("<div id='rapidSitePanel' class='fk-rapidSitePanel' >");
        s.push("	<div class='fk-rapidSitePanel-banner'>");
        s.push("		<div class='i-bannerContentContainer'>");
        s.push("			<div class='J_bannerContent i-bannerContent'>");
        s.push("				<div class='i-banner_left'>");
        s.push("					<span class='J_bannerTip i-bannerTip'>" + p + "</span>");
        s.push("					<div class='i-bannerTipUnderline'></div>");
        s.push("				</div>");
        s.push("				<div class='i-banner_right'>");
        s.push("					<a href='javascript:;' hidefocus='true' title='关闭' class='i-closeRapidSitePanel' onclick='Site.rapidSite.close();return false;'></a>");
        s.push("				</div>");
        s.push("			</div>");
        s.push("		</div>");
        s.push("	</div>");
        s.push("	<div class='fk-rapidSitePanel-title'>");
        l(s);
        s.push("	</div>");
        s.push("	<div class='fk-rapidSitePanel-content'>");
        s.push("		<div class='J_rapidSiteContentContainer i-rapidSiteContentContainer'>");
        s.push("			<div class='J_rapidSiteContent i-rapidSiteContent'>");
        c(s);
        s.push("			</div>");
        s.push("			<a href='javascript:;' class='J_rapidSiteMoreTip i-rapidSiteMoreTip' hidefocus='true' " + v + " onclick='Site.rapidSite.showMoreTemplates();return false;' " + x + ">");
        s.push("				<span>下拉有更多精美样板</span>");
        if (Fai.isIE()) {
            s.push("				<div class='i-ie-moreTip'></div>")
        } else {
            s.push("				<div class='i-left i-animate i-animate_left'></div>");
            s.push("				<div class='i-right i-animate i-animate_right'></div>")
        }
        s.push("			</a>");
        s.push("		</div>");
        s.push("	</div>");
        s.push("	<div class='fk-rapidSitePanel-menu' style='display:none;'>");
        g(s);
        s.push("	</div>");
        s.push("	<div class='fk-rapidSitePanel-tradeMenu " + q + "' status='" + o + "' " + w + ">");
        e(s);
        s.push("	</div>");
        s.push("	<div class='fk-rapidSitePanel-mallMenu' status='0' style='display:none;'>");
        a(s);
        s.push("	</div>");
        s.push("	<div class='fk-rapidSitePanel-scrollTop' title='返回顶部' style='display:none;'></div>");
        if (!h.cookie("rapidSite_viewTip", {
            path: "/"
        })) {
            s.push("	<div class='fk-rapidSitePanel-cover'  style='display:none;'>");
            s.push("		<div class='i-viewBg'></div>");
            s.push("		<div class='J_viewTip i-viewTip'>");
            s.push("			<a href='javascript:;' hidefocus='true' onclick='Site.rapidSite.hideViewTip();return false;' class='i-understand'></a>");
            s.push("		</div>");
            s.push("	</div>")
        }
        s.push("</div>");
        Fai.top.$("body").append(s.join(""));
        b.status.ready = true;
        b.status.visible = true;
        Fai.top.rapidSiteStyleChangeNum = 0;
        r.panel = Fai.top.$("#rapidSitePanel");
        r.menu = r.panel.find(".fk-rapidSitePanel-menu");
        r.tradeMenu = r.panel.find(".fk-rapidSitePanel-tradeMenu");
        r.mallMenu = r.panel.find(".fk-rapidSitePanel-mallMenu");
        r.panelContent = r.panel.find(".fk-rapidSitePanel-content");
        r.rapidSiteContentTitle = r.panel.find(".fk-rapidSitePanel-title");
        r.scrollTopBtn = r.panel.find(".fk-rapidSitePanel-scrollTop");
        r.templatesTitle = r.rapidSiteContentTitle.find(".J_templatesTitle");
        r.bannerContent = r.panel.find(".J_bannerContent");
        r.rapidSiteContentContainer = r.panelContent.find(".J_rapidSiteContentContainer");
        r.rapidSiteContent = r.panel.find(".J_rapidSiteContent");
        r.templatesContent = r.panel.find(".J_templatesContent");
        r.youlikeTemplatesContent = r.panel.find(".J_youlikeTemplatesContent");
        r.bannerTip = r.panel.find(".J_bannerTip");
        r.renewTemplates = r.rapidSiteContentTitle.find(".J_renewTemplates");
        r.rapidSiteMoreTip = r.panel.find(".J_rapidSiteMoreTip");
        r.templatesTitle_left = r.panel.find(".J_templatesTitle_left");
        r.menuChildren = r.menu.find(".J_menuItemContainer");
        r.cover = r.panel.find(".fk-rapidSitePanel-cover");
        r.viewTip = r.cover.find(".J_viewTip");
        m();
        r.panel.ready(function() {
            b.initDomStyle();
            b.initEvent()
        });
        b.checkInitByMarkKind();
        b.dom.panel.animate({
            top: "0"
        });
        var u = h.cookie("recentRapidTemplate");
        if (u != null) {
            b.data.usedArray = u.split(",") || []
        }
    };
    function g(o) {
        var p = "",
        q = "";
        if (b.status.isSelectYouLike) {
            p = "i-menuItemContainer-selected"
        } else {}
        o.push("<ul class='i-menuList'>");
        o.push("	<li class='J_menuItemContainer i-menuItemContainer i-menuItemContainer_company " + q + "'>");
        o.push("		<a href='javascript:;' hidefocus='true' class='J_menuItem_company J_menuItem i-menuItem i-menuItem_company' onclick='Site.rapidSite.companyDisplay();return false;'><span class='i-icon'></span><span class='i-icon2'></span>行业分类</a>");
        o.push("	</li>");
        o.push("	<li class='J_menuItemContainer i-menuItemContainer i-menuItemContainer_onlineMarket'>");
        o.push("		<a href='javascript:;' hidefocus='true' class='J_menuItem_onlineMarket J_menuItem i-menuItem i-menuItem_onlineMarket' onclick='Site.rapidSite.onlineMarket();return false;'><span class='i-icon'></span><span class='i-icon2'></span>在线商城</a>");
        o.push("	</li>");
        o.push("	<li class='J_menuItemContainer i-menuItemContainer " + p + "'>");
        o.push("		<a href='javascript:;' hidefocus='true' class='J_menuItem i-menuItem i-menuItem_youLike' onclick='Site.rapidSite.youLike();Site.rapidSite.showRandomTemplates();return false;'><span class='i-icon'></span><span class='i-icon2'></span>猜你喜欢</a>");
        o.push("	</li>");
        o.push("	<li class='J_menuItemContainer i-menuItemContainer'>");
        o.push("		<a href='javascript:;' hidefocus='true' class='J_menuItem i-menuItem i-menuItem_recentUsed' onclick='Site.rapidSite.recentUsed();Site.rapidSite.showRecentUsedTemplates();return false;'><span class='i-icon'></span><span class='i-icon2'></span>最近使用</a>");
        o.push("	</li>");
        o.push("</ul>")
    }
    function l(o) {
        var p = "";
        o.push("<div class='J_templatesTitle i-templatesTitle'>");
        o.push("	<div class='J_templatesTitle_left i-templatesTitle_left'>");
        o.push("		<span>极速建站，闪电一般的速度！</span>");
        o.push("	</div>");
        o.push("	<div class='i-templatesTitle_right'>");
        o.push("		<a href='javascript:;' hidefocus='true' class='J_renewTemplates i-renewTemplates' " + p + " onclick='Site.rapidSite.showRandomTemplates(1);Site.logDog(100063, 9);return false;'><span class='i-icon'></span>换一组</a>");
        o.push("	</div>");
        o.push("</div>")
    }
    function c(q) {
        var p = 0,
        r = b.data.initKind2 == -2 ? Fai.top._rapidSitePanelData.emptyLists: Fai.top._rapidSitePanelData.tempLists,
        o = r.length;
        q.push("<div class='J_templatesContent i-templatesContent' style='display:none;'>");
        q.push("</div>");
        q.push("<div class='J_youlikeTemplatesContent i-templatesContent'>");
        j(q);
        q.push("</div>")
    }
    function j(r, v) {
        var u = b.data,
        p = u.youLikeDisplayNum,
        s = u.recommendTemplates,
        o = s.length,
        t = [],
        q;
        t = s[p];
        for (q = 0; q < t.length; q++) {
            n(r, t, q)
        }
        if (!v) {
            p += 1
        } else {
            p -= 1
        }
        if (p > (o - 1)) {
            p = 0
        } else {
            if (p < 0) {
                p = o - 1
            }
        }
        u.youLikeDisplayNum = p;
        if (b.status.ready && p == 1) {
            b.showViewTip()
        }
    }
    function n(y, v, z) {
        var p = v[z].photo || "",
        o = v[z].mobiPhoto2 || "",
        q = v[z].id || 0,
        r = v[z].aid || 0,
        A = Fai.encodeHtml(v[z].link) || "",
        t = v[z].kind || 0,
        s = v[z].kind2 || 0,
        B = (Fai.isIE8() || Fai.isIE9()) ? (Fai.top._resRoot + "/image/loading/loading_2.gif") : (Fai.top._resRoot + "/image/loading/loading.png"),
        x = {},
        w = Fai.top._isFaier || false,
        u = "";
        x.id = q;
        x.aid = r;
        x.link = A;
        x.kind = t;
        x.kind2 = s;
        x.timer = 400;
        if (w) {
            u = 'title="aid:' + r + '"'
        }
        y.push("		<div class='i-template' " + u + ">");
        y.push("			<div title='' class='i-templateImg'>");
        y.push("				<img src='" + B + "' data-original='" + p + "' width='322px' alt='' class='f-loading mp-loading-iconAction' />");
        y.push("			</div>");
        y.push("			<div class='i-phoneTemplate'>");
        y.push("				<div class='i-phoneTemplateImg'>");
        y.push("					<img src='" + B + "' data-original='" + o + "' width='82px' alt='' class='f-loading mp-loading-iconAction' />");
        y.push("				</div>");
        y.push("			</div>");
        y.push("			<div class='i-templateLayer'>");
        y.push("				<div class='i-templateBtnContainer'>");
        y.push("					<a href='javascript:;' hidefocus='true' class='i-templateBtn i-lookTemplateBtn' onclick='Site.rapidSite.checkupTemplate(" + h.toJSON(x) + ");Site.rapidSite.initQuickViewTemplateContent(" + t + ", " + s + ");Site.rapidSite.fixLogDogForYouLike(" + h.toJSON(x) + ");Site.rapidSite.showQuickViewTemplateContent();return false;'><span class='i-icon'></span><span class='i-iconLeft'></span><span class='i-iconRight'></span><span class='i-iconCenter'></span><span class='i-text'>查看</span></a>");
        y.push("					<a href='javascript:;' hidefocus='true' class='i-templateBtn i-copyTemplateBtn' onclick='Site.rapidSite.copyTemplate(" + h.toJSON(x) + ");Site.rapidSite.fixLogDogForYouLike(" + h.toJSON(x) + ");return false;'><span class='i-icon'></span><span class='i-iconLeft'></span><span class='i-iconRight'></span><span class='i-iconCenter'></span><span class='i-text'>复制</span></a>");
        y.push("				</div>");
        y.push("			</div>");
        y.push("			<div class='i-templateCover'></div>");
        y.push("		</div>")
    }
    function e(v) {
        var u = 0,
        s = 0,
        t = Fai.top._rapidSitePanelData.tradeList,
        w = t.length,
        x = false,
        r = false,
        o, q, p;
        v.push("<div class='i-tradeMenuContent'>");
        for (u = 0; u < w; u++) {
            if (t[u].id == 0) {
                continue
            }
            o = t[u].list || [];
            q = o.length;
            if (s % 2 == 0) {
                x = true
            } else {
                x = false
            }
            if (x) {
                v.push("	<div class='i-tradeBlock'>");
                r = true
            }
            v.push("		<div class='J_tradeArea i-tradeArea'>");
            v.push("			<p class='i-tradeTitle' onclick='Site.rapidSite.showTrade1(" + t[u].id + "," + (o[0].id || 0) + ");return false;'>" + t[u].name + "</p>");
            v.push("			<div class='i-tradeContent'>");
            if (q > 0) {
                for (p = 0; p < q; p++) {
                    v.push("				<a href='javascript:;' hidefocus='true'  onclick='Site.rapidSite.showTrade2(" + t[u].id + "," + o[p].id + ");return false;' class='i-trade' >" + o[p].name + "</a>")
                }
            }
            v.push("			</div>");
            v.push("		</div>");
            if (!x) {
                v.push("	</div>");
                r = false
            }
            s += 1
        }
        if (r) {
            v.push(" </div>")
        }
        v.push("</div>")
    }
    function a(s) {
        var p = Fai.top._rapidSitePanelData.mallKindInfo.list,
        o = p.length,
        t = 0,
        q = "";
        if (o > 0) {
            s.push("<ul class='f-menuContent'>");
            for (var r = 0; r < o; r++) {
                t = p[r].id;
                q = p[r].name;
                if (t == 0) {
                    continue
                }
                s.push("<li class='f-itemContainer'>");
                s.push("	<a href='javascript:;' onclick='Site.rapidSite.showMallTrade(" + t + ");return false;' hidefocus='true' class='f-item'>" + q + "</a>");
                s.push("</li>")
            }
            s.push("</ul>")
        }
    }
    b.logClickCopy = function() {
        h.ajax({
            type: "get",
            cache: false,
            url: "/static/web/ajax/log_h.jsp?cmd=lograpsiteclick&msg=rapidSitePanel click copy"
        })
    };
    b.logClickView = function() {
        h.ajax({
            type: "get",
            cache: false,
            url: "/static/web/ajax/log_h.jsp?cmd=lograpsiteclick&msg=rapidSitePanel click view"
        })
    };
    b.showTrade1 = function(p, o) {
        b.status.catchContentScroll = false;
        b.status.isSelectYouLike = false;
        Site.logDog(100063, 2);
        b.showTrade2(p, o)
    };
    b.showTrade2 = function(q, p) {
        var o = Fai.top._rapidSitePanelData.tempLists,
        w = o.length,
        v = [],
        r = b.dom,
        u = b.data,
        s = b.status;
        s.catchContentScroll = false;
        s.mallSwitch = false;
        s.isSelectYouLike = false;
        b.logDog({
            kind: q,
            kind2: p
        });
        b.markSelectKind({
            kind: q,
            kind2: p
        });
        if (!h.cookie("rapidSite_viewTip", {
            path: "/"
        })) {
            h.cookie("rapidSite_viewTip", 1, {
                expires: 365,
                path: "/"
            })
        }
        if (p == -2) {
            o = Fai.top._rapidSitePanelData.emptyLists;
            w = o.length
        }
        for (var t = 0; t < w; t++) {
            if (o[t].kind2 == p) {
                n(v, o, t)
            }
        }
        if (v.length < 1) {
            v.push("<div class='J_nothingTip f-nothingTip' style='margin-top:" + (u.nothingTipMarginTop || 0) + "px;'>没有此行业样板</div>")
        }
        if (r.youlikeTemplatesContent.is(":visible")) {
            u.youLikeScrollTop = r.panelContent.scrollTop();
            r.youlikeTemplatesContent.hide()
        }
        r.templatesContent.empty().show().scrollTop(0);
        r.templatesContent.append(v.join(""));
        r.tradeMenu.hide();
        r.mallMenu.hide();
        r.renewTemplates.hide();
        r.rapidSiteMoreTip.hide();
        r.menuChildren.removeClass("i-menuItemContainer-selected");
        r.menuChildren.filter(".i-menuItemContainer_company").addClass("i-menuItemContainer-selected");
        m();
        b.bannerTipChange("行业分类");
        v = [];
        k(q, p, v);
        r.templatesTitle_left.empty().append(v.join(""));
        r.panel.trigger("domChange")
    };
    b.showMallTrade = function(q) {
        var v = Fai.top._rapidSitePanelData.tempLists,
        o = v.length,
        s = [],
        u = b.dom,
        t = b.data,
        p = b.status;
        p.catchContentScroll = false;
        p.mallSwitch = true;
        p.isSelectYouLike = false;
        b.logDog({
            kind: Fai.top._rapidSitePanelData.mallKindInfo.id,
            kind2: q
        });
        b.markSelectKind({
            isMall: true,
            kind2: q
        });
        if (!h.cookie("rapidSite_viewTip", {
            path: "/"
        })) {
            h.cookie("rapidSite_viewTip", 1, {
                expires: 365,
                path: "/"
            })
        }
        for (var r = 0; r < o; r++) {
            if (v[r].kind2 == q) {
                n(s, v, r)
            }
        }
        if (s.length < 1) {
            s.push("<div class='J_nothingTip f-nothingTip' style='margin-top:" + (b.data.nothingTipMarginTop || 0) + "px;'>没有此行业样板</div>")
        }
        if (u.youlikeTemplatesContent.is(":visible")) {
            t.youLikeScrollTop = u.panelContent.scrollTop();
            u.youlikeTemplatesContent.hide()
        }
        u.templatesContent.empty().show().scrollTop(0);
        u.templatesContent.append(s.join(""));
        u.tradeMenu.hide();
        u.mallMenu.hide();
        u.renewTemplates.hide();
        u.rapidSiteMoreTip.hide();
        u.menuChildren.removeClass("i-menuItemContainer-selected");
        u.menuChildren.filter(".i-menuItemContainer_onlineMarket").addClass("i-menuItemContainer-selected");
        m();
        b.bannerTipChange("在线商城");
        s = [];
        d(q, s);
        u.templatesTitle_left.empty().append(s.join(""));
        u.panel.trigger("domChange")
    };
    function k(s, r, v) {
        var q = Fai.top._rapidSitePanelData.tradeList,
        w, u, t, p, o;
        for (u = 0, len = q.length; u < len; u++) {
            if (s == q[u].id) {
                w = q[u].list;
                for (t = 0, len2 = w.length; t < len2; t++) {
                    p = w[t].id;
                    o = w[t].name;
                    v.push("			<div class='f-tradeContainer'>");
                    if (p == r) {
                        v.push("				<a href='javascript:;' hidefocus='true' class='f-trade f-trade-selected' _id='" + p + "' onclick='Site.rapidSite.showTrade2(" + s + "," + p + ");return false;'>" + o + "</a>")
                    } else {
                        v.push("				<a href='javascript:;' hidefocus='true' class='f-trade' _id='" + p + "' onclick='Site.rapidSite.showTrade2(" + s + "," + p + ");return false;'>" + o + "</a>")
                    }
                    v.push("			</div>")
                }
                break
            }
        }
    }
    function d(p, s) {
        var r = Fai.top._rapidSitePanelData.mallKindInfo.list,
        q, t, o;
        for (q = 0, len = r.length; q < len; q++) {
            t = r[q].id;
            o = r[q].name;
            if (t == 0) {
                continue
            }
            s.push("			<div class='f-tradeContainer'>");
            if (t == p) {
                s.push("				<a href='javascript:;' hidefocus='true' class='f-trade f-trade-selected'  onclick='Site.rapidSite.showMallTrade(" + t + ");return false;'>" + o + "</a>")
            } else {
                s.push("				<a href='javascript:;' hidefocus='true' class='f-trade' onclick='Site.rapidSite.showMallTrade(" + t + ");return false;'>" + o + "</a>")
            }
            s.push("			</div>")
        }
    }
    b.showRandomTemplates = function(p) {
        var o = [],
        s = b.dom,
        q = b.data,
        r = false;
        b.status.mallSwitch = true;
        s.templatesContent.hide();
        s.renewTemplates.show();
        if (!p) {
            if (!s.youlikeTemplatesContent.is(":visible")) {
                s.youlikeTemplatesContent.show();
                s.panelContent.scrollTop(q.youLikeScrollTop || 0)
            }
        } else {
            j(o, r);
            if (o.length < 1) {
                o.push("<div class='J_nothingTip f-nothingTip' style='margin-top:" + (q.nothingTipMarginTop || 0) + "px;'>没有此行业样板</div>")
            }
            s.youlikeTemplatesContent.empty().show().scrollTop(0);
            s.youlikeTemplatesContent.append(o.join(""));
            m()
        }
        b.refreshMoreTip();
        s.panel.trigger("domChange")
    };
    b.showMoreTemplates = function() {
        var p = [],
        q = b.dom,
        o = b.data.youLikeDisplayNum;
        b.status.mallSwitch = true;
        if (o > 0 && o < b.data.recommendList.length) {
            j(p);
            b.showViewTip()
        } else {
            return
        }
        q.renewTemplates.show();
        b.refreshMoreTip();
        q.youlikeTemplatesContent.append(p.join(""));
        m();
        q.panel.trigger("domChange")
    };
    b.showRecentUsedTemplates = function() {
        var o = [],
        p = b.data,
        q = b.dom;
        b.status.mallSwitch = true;
        Site.logDog(100063, 4);
        i(o);
        if (o.length < 1) {
            o.push("<div class='J_nothingTip f-nothingTip' style='margin-top:" + (b.data.nothingTipMarginTop || 0) + "px;'>您暂时还没有使用样板，请先复制试用喔</div>")
        }
        q.renewTemplates.hide();
        q.rapidSiteMoreTip.hide();
        if (q.youlikeTemplatesContent.is(":visible")) {
            p.youLikeScrollTop = q.panelContent.scrollTop();
            q.youlikeTemplatesContent.hide()
        }
        q.templatesContent.empty().show().scrollTop(0);
        q.templatesContent.append(o.join(""));
        m();
        q.panel.trigger("domChange")
    };
    b.showViewTip = function() {
        if ( !! h.cookie("rapidSite_viewTip", {
            path: "/"
        })) {
            return
        }
        setTimeout(function() {
            var q = b.dom,
            p = q.menu.offset().left,
            o = q.menu.offset().top;
            q.viewTip.css({
                left: p + "px",
                top: o + "px"
            });
            q.menu.find(".J_menuItem_company").trigger("mouseover");
            q.cover.show();
            h.cookie("rapidSite_viewTip", 1, {
                expires: 365,
                path: "/"
            })
        },
        0)
    };
    b.hideViewTip = function() {
        b.dom.cover.hide()
    };
    function i(v) {
        var o = Fai.top._rapidSitePanelData.tempLists,
        q = Fai.top._rapidSitePanelData.emptyLists,
        w = o.length,
        y = q.length,
        u = b.data,
        x = u.usedArray,
        z = [],
        t,
        s,
        r,
        p;
        for (s = 0; s < x.length; s++) {
            if (x[s] < 0) {
                for (p = 0; p < y; p++) {
                    if (q[p].aid == x[s]) {
                        z.push(q[p]);
                        break
                    }
                }
            } else {
                for (r = 0; r < w; r++) {
                    if (o[r].aid == x[s]) {
                        z.push(o[r]);
                        break
                    }
                }
            }
        }
        for (t = 0; t < z.length; t++) {
            n(v, z, t)
        }
    }
    function m() {
        var o = b.dom;
        o.panel.find("img").lazyload({
            lazyRemoveclass: "f-loading mp-loading-iconAction",
            container: o.panelContent
        })
    }
})(jQuery, Site.rapidSite); (function(g, e, f) {
    var c = true;
    e.initQuickViewTemplateContent = function(t, r) {
        var s = [],
        v = e.dom,
        u = r != -2 ? Fai.top._rapidSitePanelData.tempLists: Fai.top._rapidSitePanelData.emptyLists;
        if (Fai.top.$("#quickViewTemplate").length < 1) {
            s = [];
            s.push("<div id='quickViewTemplate' class='fk-quickViewTemplate'>");
            s.push("	<div class='fk-quickViewTemplateBar'>");
            s.push("		<div class='J_tradeTip f-tradeTip'>");
            l(t, r, s);
            s.push("		</div>");
            s.push("		<div class='f-btnContent'>");
            s.push("			<div class='f-btnContainer'>");
            s.push("				<a href='javascript:;' hidefocus='true' class='J_moreTemplateBtn f-btn f-moreTemplate' onclick='Site.rapidSite.init(1);return false;'>返回</a>");
            s.push("			</div>");
            s.push("			<div class='f-btnContainer'>");
            s.push("				<a href='javascript:;' hidefocus='true' class='J_copyTemplateBtn f-btn f-copyTemplate' onclick='Site.rapidSite.copyNewTemplate();return false;'>复制样板</a>");
            s.push("			</div>");
            s.push("		</div>");
            s.push("	</div>");
            s.push("	<div class='fk-quickViewTemplateContent' _status='0' _flag='0' _height='215'>");
            s.push("		<a href='javascript:;' hidefocus='true' class='f-closeRapidSite' title='收起' onclick='Site.rapidSite.hideQuickViewTemplateContent();return false;'></a>");
            s.push("		<div class='J_templateListContainer f-templateListContainer'>");
            s.push("			<a href='javascript:;' hidefocus='true' class='J_leftBtn f-leftBtn' style='display:none;'><span class='f-leftBtn-icon'></span></a>");
            s.push("			<a href='javascript:;' hidefocus='true' class='J_rightBtn f-rightBtn' style='display:none;'><span class='f-rightBtn-icon'></span></a>");
            s.push("			<div class='J_templateListViewContent f-templateListViewContent'>");
            s.push("				<div class='J_templateList f-templateList'>");
            h(u, t, r, s);
            s.push("				</div>");
            s.push("			</div>");
            s.push("		</div>");
            s.push("	</div>");
            s.push("</div>");
            v.panel.length > 0 ? v.panel.before(s.join("")) : e.dom.body.append(s.join(""));
            v.quickViewTemplate = Fai.top.$("#quickViewTemplate");
            v.quickViewTemplateBar = v.quickViewTemplate.find(".fk-quickViewTemplateBar");
            v.quickViewTemplateContent = v.quickViewTemplate.find(".fk-quickViewTemplateContent");
            v.templateListViewContent = v.quickViewTemplate.find(".J_templateListViewContent");
            v.templateListContainer = v.quickViewTemplate.find(".J_templateListContainer");
            v.templateList = v.quickViewTemplate.find(".J_templateList");
            v.tradeTip = v.quickViewTemplate.find(".J_tradeTip");
            v.leftBtn = v.quickViewTemplateContent.find(".J_leftBtn");
            v.rightBtn = v.quickViewTemplateContent.find(".J_rightBtn");
            v.copyTemplateBtn = v.quickViewTemplateBar.find(".J_copyTemplateBtn");
            v.moreTemplateBtn = v.quickViewTemplateBar.find(".J_moreTemplateBtn");
            n();
            q();
            j()
        } else {
            k(t, r);
            e.updateViewTemplateList(t, r)
        }
        v.quickViewTemplate.show()
    };
    function k(t, r) {
        var s = [],
        u = e.dom;
        l(t, r, s);
        u.tradeTip.empty().append(s.join(""))
    }
    e.updateViewTemplateList = function(t, r) {
        var s = [],
        v = e.dom,
        u = r != -2 ? Fai.top._rapidSitePanelData.tempLists: Fai.top._rapidSitePanelData.emptyLists;
        if (a(t)) {
            e.markSelectKind({
                isMall: true,
                kind2: r
            })
        } else {
            e.markSelectKind({
                kind: t,
                kind2: r
            })
        }
        h(u, t, r, s);
        v.templateList.empty().append(s.join(""));
        n();
        j()
    };
    e.hideQuickViewTemplateContent = function() {
        var r = e.dom;
        r.newRapidSitePreview.addClass("ma-newRapidSitePreview3");
        r.quickViewTemplateContent.addClass("fk-quickViewTemplateContent-hide")
    };
    e.showQuickViewTemplateContent = function() {
        var r = e.dom;
        r.newRapidSitePreview.removeClass("ma-newRapidSitePreview3");
        r.quickViewTemplateContent.removeClass("fk-quickViewTemplateContent-hide")
    };
    function l(v, u, z) {
        var t = Fai.top._rapidSitePanelData.tradeList,
        B = Fai.top._rapidSitePanelData.mallKindInfo.list,
        y = {},
        A, x, w, s, C, r;
        if (e.status.mallSwitch && a(v)) {
            for (x = 0, len = B.length; x < len; x++) {
                C = B[x].id;
                r = B[x].name;
                if (C == 0) {
                    continue
                }
                y = {};
                y.kind = v;
                y.kind2 = C;
                z.push("			<div class='f-tradeContainer'>");
                if (C == u) {
                    z.push("				<a href='javascript:;' hidefocus='true' class='f-trade f-trade-selected' onclick='Site.rapidSite.updateViewTemplateList(" + v + "," + C + ");Site.rapidSite.logDog(" + g.toJSON(y) + ");return false;'>" + r + "</a>")
                } else {
                    z.push("				<a href='javascript:;' hidefocus='true' class='f-trade' onclick='Site.rapidSite.updateViewTemplateList(" + v + "," + C + ");Site.rapidSite.logDog(" + g.toJSON(y) + ");return false;'>" + r + "</a>")
                }
                z.push("			</div>")
            }
        } else {
            for (x = 0, len = t.length; x < len; x++) {
                if (v == t[x].id) {
                    A = t[x].list;
                    for (w = 0, len2 = A.length; w < len2; w++) {
                        s = A[w].id;
                        r = A[w].name;
                        y = {};
                        y.kind = v;
                        y.kind2 = s;
                        z.push("			<div class='f-tradeContainer'>");
                        if (u == s) {
                            z.push("				<a href='javascript:;' hidefocus='true' class='f-trade f-trade-selected f-trade" + s + "' onclick='Site.rapidSite.updateViewTemplateList(" + v + "," + s + ");Site.rapidSite.logDog(" + g.toJSON(y) + ");return false;'>" + r + "</a>")
                        } else {
                            z.push("				<a href='javascript:;' hidefocus='true' class='f-trade f-trade" + s + "' onclick='Site.rapidSite.updateViewTemplateList(" + v + "," + s + ");Site.rapidSite.logDog(" + g.toJSON(y) + ");return false;'>" + r + "</a>")
                        }
                        z.push("			</div>")
                    }
                    break
                }
            }
        }
    }
    function a(r) {
        return r == Fai.top._rapidSitePanelData.mallKindInfo.id ? true: false
    }
    function h(u, s, r, w) {
        e.data.viewNum = 0;
        var A = [],
        x = [],
        z = [];
        if (r != -2) {
            for (var v = 0,
            y = u.length; v < y; v++) {
                if (u[v].kind2 == r) {
                    e.data.viewNum += 1;
                    if (b(x, u, v)) {
                        z = x
                    } else {
                        A = [].concat(A, x)
                    }
                    x = []
                }
            }
        } else {
            for (var v = 0,
            y = u.length; v < y; v++) {
                e.data.viewNum += 1;
                if (b(x, u, v)) {
                    z = x
                } else {
                    A = [].concat(A, x)
                }
                x = []
            }
        }
        A = [].concat(z, A);
        for (var v = 0,
        t = A.length; v < t; v++) {
            w.push(A[v])
        }
    }
    function b(s, u, r) {
        var t = u[r];
        photo = t.photo || "",
        mobiPhoto2 = t.mobiPhoto2 || "",
        id = t.id || 0,
        aid = t.aid || 0,
        link = Fai.encodeHtml(t.link) || "",
        kind = t.kind || -3,
        kind2 = t.kind2 || -3,
        option = {},
        extClass = "",
        selectedFlag = false,
        loadingPhoto = (Fai.isIE8() || Fai.isIE9()) ? (Fai.top._resRoot + "/image/loading/loading_2.gif") : (Fai.top._resRoot + "/image/loading/loading.png");
        option.id = id;
        option.aid = aid;
        option.link = link;
        option.kind = kind;
        option.kind2 = kind2;
        option.timer = 0;
        if (e.data.checkId && e.data.checkId == id) {
            extClass = "f-template-selected";
            selectedFlag = true
        }
        s.push("		<div class='f-template " + extClass + "'>");
        s.push("			<div class='f-disableCover'></div>");
        s.push("			<a href='javascript:;' hidefocus='true' class='f-templateInner' onclick='Site.rapidSite.checkupTemplate(" + g.toJSON(option) + ");'>");
        s.push("				<div class='f-pcTemplate'>");
        s.push("					<div title='' class='f-templateImg'>");
        s.push("						<img src='" + loadingPhoto + "' data-original='" + photo + "' width='202px' alt='' class='f-loading mp-loading-iconAction' />");
        s.push("					</div>");
        s.push("				</div>");
        s.push("				<div class='f-phoneTemplate'>");
        s.push("					<div class='f-phoneTemplateImg'>");
        s.push("						<img src='" + loadingPhoto + "' data-original='" + mobiPhoto2 + "' width='52px' alt='' class='f-loading mp-loading-iconAction' />");
        s.push("					</div>");
        s.push("				</div>");
        s.push("				<div class='f-templateCheckedTip'></div>");
        s.push("			</a>");
        s.push("		</div>");
        return selectedFlag
    }
    function q() {
        var s = e.dom,
        r = e.data;
        s.rightBtn.click(function() {
            i()
        });
        s.leftBtn.click(function() {
            m()
        });
        s.tradeTip.delegate(".f-trade", "click",
        function() {
            s.tradeTip.find(".f-trade").removeClass("f-trade-selected");
            g(this).addClass("f-trade-selected")
        });
        s.tradeTip.hover(function() {
            e.showQuickViewTemplateContent()
        });
        s.templateList.delegate(".f-templateInner", "click",
        function() {
            s.templateList.find(".f-template").removeClass("f-template-selected");
            g(this).parent().addClass("f-template-selected")
        });
        s.copyTemplateBtn.hover(function() {
            s.quickViewTemplateContent.attr("_status", "3")
        },
        function() {
            s.quickViewTemplateContent.attr("_status", "0")
        });
        s.moreTemplateBtn.hover(function() {
            s.quickViewTemplateContent.attr("_status", "3")
        },
        function() {
            s.quickViewTemplateContent.attr("_status", "0")
        });
        if (document.addEventListener) {
            s.quickViewTemplateContent[0].addEventListener("DOMMouseScroll", d, false)
        }
        s.quickViewTemplateContent[0].onmousewheel = d
    }
    function d(r) {
        var s = e.utils.getMousewheel(r);
        if (s.up) {
            m()
        } else {
            i()
        }
    }
    function i() {
        var u = e.dom,
        t = e.data,
        r = 0,
        s = t.viewIndex;
        s += t.viewStep;
        if (s > (t.viewNum - 1)) {
            return
        }
        if (c) {
            c = false;
            t.viewIndex = s;
            r = -t.viewIndex * t.iWidth;
            u.templateList.animate({
                left: r + "px"
            },
            400,
            function() {
                c = true
            });
            p()
        }
    }
    function m() {
        var u = e.dom,
        t = e.data,
        r = 0,
        s = t.viewIndex;
        s -= t.viewStep;
        if (s < 0) {
            return
        }
        if (c) {
            c = false;
            t.viewIndex = s;
            r = -t.viewIndex * t.iWidth;
            u.templateList.animate({
                left: r + "px"
            },
            400,
            function() {
                c = true
            });
            p()
        }
    }
    function j() {
        var v = e.dom,
        x = e.data,
        s = v.templateList.children().first().outerWidth(),
        u = v.templateListViewContent.width(),
        y = s * x.viewNum,
        z = u,
        t = v.templateList.children().filter(".f-template-selected").index() || 0;
        x.iWidth = s;
        x.cWidth = u;
        if (y > u) {
            z = y
        }
        o();
        x.viewIndex = 0;
        var w = parseInt(t / x.viewStep),
        r = 0;
        x.viewIndex = w * x.viewStep;
        r = -x.viewIndex * s;
        v.templateList.css({
            left: r + "px",
            width: z + "px"
        });
        p()
    }
    function p() {
        var r = e.data,
        s = e.dom;
        if ((r.viewIndex + r.viewStep) < r.viewNum) {
            s.rightBtn.show()
        } else {
            s.rightBtn.hide()
        }
        if ((r.viewIndex - r.viewStep) >= 0) {
            s.leftBtn.show()
        } else {
            s.leftBtn.hide()
        }
    }
    function o() {
        var r = e.data;
        r.viewStep = parseInt(r.cWidth / r.iWidth)
    }
    function n() {
        var r = e.dom;
        r.templateList.find("img").lazyload({
            lazyRemoveclass: "f-loading mp-loading-iconAction",
            event: "sporty"
        });
        setTimeout(function() {
            e.dom.templateList.find("img").trigger("sporty")
        },
        50)
    }
})(jQuery, Site.rapidSite); (function(c, a, e) {
    a.initEvent = function() {
        var h = a.dom,
        i = false,
        g = h.menu.find(".J_menuItem_company"),
        f = h.menu.find(".J_menuItem_onlineMarket");
        a.data.templatesContentViewHeight = h.panelContent.height() - 270;
        a.data.nothingTipMarginTop = (a.dom.panel.height() - 200) / 2 || 0;
        g.off("mouseover.menu");
        g.on("mouseover.menu",
        function() {
            if (h.tradeMenu.attr("status") != 1) {
                h.mallMenu.hide();
                h.tradeMenu.attr("status", 1);
                h.tradeMenu.show();
                h.menu.addClass("fk-rapidSitePanel-menu-borderTopRight")
            }
        });
        g.off("mouseleave.menu");
        g.on("mouseleave.menu",
        function() {
            h.tradeMenu.attr("status", 0);
            a.data.tradeMenu_timer && clearTimeout(a.data.tradeMenu_timer);
            a.data.tradeMenu_timer = setTimeout(function() {
                if (h.tradeMenu.attr("status") == 0) {
                    h.tradeMenu.hide();
                    h.menu.removeClass("fk-rapidSitePanel-menu-borderTopRight")
                }
            },
            120)
        });
        h.tradeMenu.off("mouseenter.tradeMenu");
        h.tradeMenu.on("mouseenter.tradeMenu",
        function() {
            h.tradeMenu.attr("status", 1);
            a.data.tradeMenu_timer && clearTimeout(a.data.tradeMenu_timer);
            h.menu.addClass("fk-rapidSitePanel-menu-borderTopRight fk-rapidSitePanel-menu-companyHover")
        });
        h.tradeMenu.off("mouseleave.tradeMenu");
        h.tradeMenu.on("mouseleave.tradeMenu",
        function() {
            h.tradeMenu.attr("status", 0);
            h.menu.removeClass("fk-rapidSitePanel-menu-companyHover");
            a.data.tradeMenu_timer && clearTimeout(a.data.tradeMenu_timer);
            a.data.tradeMenu_timer = setTimeout(function() {
                if (h.tradeMenu.attr("status") == 0) {
                    h.tradeMenu.hide();
                    h.menu.removeClass("fk-rapidSitePanel-menu-borderTopRight")
                }
            },
            120)
        });
        f.off("mouseover.menu");
        f.on("mouseover.menu",
        function() {
            if (h.mallMenu.attr("status") != 1) {
                h.tradeMenu.hide();
                h.mallMenu.attr("status", 1);
                h.mallMenu.show()
            }
        });
        f.off("mouseleave.menu");
        f.on("mouseleave.menu",
        function() {
            h.mallMenu.attr("status", 0);
            a.data.mallMenu_timer && clearTimeout(a.data.mallMenu_timer);
            a.data.mallMenu_timer = setTimeout(function() {
                if (h.mallMenu.attr("status") == 0) {
                    h.mallMenu.hide()
                }
            },
            120)
        });
        h.mallMenu.off("mouseenter.mallMenu");
        h.mallMenu.on("mouseenter.mallMenu",
        function() {
            h.mallMenu.attr("status", 1);
            a.data.mallMenu_timer && clearTimeout(a.data.mallMenu_timer);
            h.menu.addClass("fk-rapidSitePanel-menu-onlineMarketHover")
        });
        h.mallMenu.off("mouseleave.mallMenu");
        h.mallMenu.on("mouseleave.mallMenu",
        function() {
            h.mallMenu.attr("status", 0);
            h.menu.removeClass("fk-rapidSitePanel-menu-onlineMarketHover");
            a.data.mallMenu_timer && clearTimeout(a.data.mallMenu_timer);
            a.data.mallMenu_timer = setTimeout(function() {
                if (h.mallMenu.attr("status") == 0) {
                    h.mallMenu.hide()
                }
            },
            120)
        });
        h.tradeMenu.find(".J_tradeArea").hover(function() {
            c(this).addClass("i-tradeMenu-selected")
        },
        function() {
            c(this).removeClass("i-tradeMenu-selected")
        });
        h.menuChildren.click(function() {
            if (!c(this).hasClass("i-menuItemContainer_company") && !c(this).hasClass("i-menuItemContainer_onlineMarket")) {
                h.menuChildren.removeClass("i-menuItemContainer-selected");
                c(this).addClass("i-menuItemContainer-selected")
            }
        });
        h.menuChildren.hover(function() {
            h.menu.addClass("fk-rapidSitePanel-menu-hover")
        },
        function() {
            h.menu.removeClass("fk-rapidSitePanel-menu-hover")
        });
        h.templatesTitle_left.delegate(".f-trade", "click",
        function() {
            h.templatesTitle_left.find(".f-trade").removeClass("f-trade-selected");
            c(this).addClass("f-trade-selected")
        });
        Fai.top.$(window).off("resize.rapidSite_menu");
        Fai.top.$(window).on("resize.rapidSite_menu",
        function() {
            if (!i && a.status.visible) {
                i = true;
                setTimeout(function() {
                    d();
                    i = false
                },
                300)
            }
        });
        h.panel.off("domChange");
        h.panel.on("domChange",
        function() {
            d()
        });
        Fai.top.$(window).off("resize.rapidSite");
        Fai.top.$(window).on("resize.rapidSite",
        function() {
            var j = a.dom.panel.height(),
            l = a.dom,
            k = a.data;
            k.templatesContentViewHeight = l.panelContent.height() - 270;
            k.nothingTipMarginTop = (j - 200) / 2 || 0;
            l.panelContent.css({
                height: (j - 135) + "px"
            });
            l.panelContent.find(".J_nothingTip").css({
                marginTop: k.nothingTipMarginTop + "px"
            })
        });
        h.panelContent.scroll(function() {
            b()
        });
        h.scrollTopBtn.click(function() {
            h.panelContent.scrollTop(0)
        });
        if (a.data.showRandom) {
            a.initContentScrollEvent()
        }
    };
    a.initDomStyle = function() {
        var f = a.dom;
        d();
        f.menu.show();
        f.panelContent.css({
            height: (f.panel.height() - 135) + "px"
        })
    };
    function d() {
        var j = a.dom,
        g = j.rapidSiteContentContainer.offset().left,
        k = j.templatesContent.is(":visible") ? j.templatesContent: j.youlikeTemplatesContent,
        n = k.offset().left,
        f = k.width(),
        h = f > 1200 ? 80 : 60,
        i = g,
        m = i + 175,
        l = f - h;
        j.menu.css({
            left: i + "px"
        });
        j.tradeMenu.css({
            left: m + "px"
        });
        j.mallMenu.css({
            left: m + "px"
        });
        j.bannerContent.css({
            marginLeft: n + "px",
            width: l + "px"
        });
        j.templatesTitle.css({
            marginLeft: n + "px",
            width: l + "px"
        })
    }
    function b() {
        var g = a.dom,
        h = -(g.templatesContent.offset().top),
        f = g.scrollTopBtn.is(":visible") ? false: true;
        if (h > a.data.templatesContentViewHeight) {
            if (f) {
                g.scrollTopBtn.show()
            }
        } else {
            if (!f) {
                g.scrollTopBtn.hide()
            }
        }
    }
    a.refreshMoreTip = function() {
        if (!a.data.showRandom) {
            return
        }
        var h = a.dom,
        g = a.data,
        f = g.youLikeDisplayNum;
        if (f > 0 && f < a.data.recommendList.length) {
            h.rapidSiteMoreTip.show()
        } else {
            h.rapidSiteMoreTip.hide()
        }
    }
})(jQuery, Site.rapidSite); (function(b, a, c) {
    a.bannerTipChange = function(d) {
        a.dom.bannerTip.text(d)
    };
    a.companyDisplay = function() {};
    a.onlineMarket = function() {};
    a.youLike = function() {
        a.status.catchContentScroll = true;
        a.status.isSelectYouLike = true;
        a.bannerTipChange("猜你喜欢");
        a.dom.templatesTitle_left.empty().append(a.data.templatesTitle);
        b.cookie("rapidSite_selectKind", null, {
            expires: 7,
            path: "/"
        })
    };
    a.others = function() {
        a.status.catchContentScroll = false;
        a.status.isSelectYouLike = false;
        a.bannerTipChange("其他")
    };
    a.recentUsed = function() {
        a.status.catchContentScroll = false;
        a.status.isSelectYouLike = false;
        a.bannerTipChange("最近使用");
        a.dom.templatesTitle_left.empty().append(a.data.templatesTitle)
    }
})(jQuery, Site.rapidSite); (function(b, a, c) {
    a.close = function() {
        var f = a.dom,
        d = a.status,
        e = a.data;
        Site.logDog(100063, 6);
        Site.webTemplateTabClick2();
        a.hidePanel();
        f.newRapidSitePreview && f.newRapidSitePreview.hide();
        f.quickViewTemplate && f.quickViewTemplate.hide()
    };
    a.hidePanel = function() {
        var d = a.status,
        e = a.dom;
        if (d.ready) {
            e.panel.animate({
                top: "-100%"
            },
            400,
            function() {
                b(this).hide()
            });
            d.visible = false
        }
    }
})(jQuery, Site.rapidSite); (function(f, b, g) {
    b.checkupTemplate = function(k) {
        var n = b.dom,
        j = k.id || 0,
        l = k.aid || 0,
        i = k.link || "",
        h = k.kind || 0,
        m = k.kind2 || 0,
        o = k.timer || 0;
        c();
        b.hidePanel();
        b.data.checkId = j;
        Fai.top.rapidSiteStyleChangeNum += 1;
        a(l);
        f.cookie("_raipidSiteSelectTrade", m, {
            path: "/"
        });
        Site.logDog(100063, 1);
        if (m != -2) {
            Site.logDog(100063, 10000000 + parseInt(l))
        } else {
            Site.logDog(100063, 7)
        }
        if (n.newRapidSiteBigImg.length != 0) {
            n.newRapidSiteBigImg.hide();
            n.newRapidSiteBlackBg.hide()
        }
        Fai.top.rapidSiteCloneId = l;
        n.newRapidSitePreview.show();
        n.newRapidSitePreviewFrame.show();
        setTimeout(function() {
            e(i)
        },
        o)
    };
    function e(j) {
        if (Fai.top.$("#popupBgundefined").length != 0) {
            Fai.removeBg()
        }
        Fai.top.$(".J_forWaiting").remove();
        var k = b.data,
        l = b.dom,
        i = Fai.isIE() ? true: false,
        h = i ? "fk-forWaiting-ie": "fk-forWaiting-normal";
        if (!k.loadingHtml) {
            k.loadingHtml = [];
            k.loadingHtml.push("<div class='J_forWaiting fk-forWaiting " + h + "'>");
            if (i) {
                k.loadingHtml.push("	<div class='f-spinner'>");
                k.loadingHtml.push("		<div class='f-loadingTip'>网站初始化中...</div>");
                k.loadingHtml.push("	</div>")
            } else {
                k.loadingHtml.push("	<div class='f-spinner'>");
                k.loadingHtml.push("		<div class='f-spinnerContainer f-container1'>");
                k.loadingHtml.push("			<div class='f-circle1'></div>");
                k.loadingHtml.push("			<div class='f-circle2'></div>");
                k.loadingHtml.push("			<div class='f-circle3'></div>");
                k.loadingHtml.push("			<div class='f-circle4'></div>");
                k.loadingHtml.push("		</div>");
                k.loadingHtml.push("		<div class='f-spinnerContainer f-container2'>");
                k.loadingHtml.push("			<div class='f-circle1'></div>");
                k.loadingHtml.push("			<div class='f-circle2'></div>");
                k.loadingHtml.push("			<div class='f-circle3'></div>");
                k.loadingHtml.push("			<div class='f-circle4'></div>");
                k.loadingHtml.push("		</div>");
                k.loadingHtml.push("		<div class='f-spinnerContainer f-container1'>");
                k.loadingHtml.push("			<div class='f-circle1'></div>");
                k.loadingHtml.push("			<div class='f-circle2'></div>");
                k.loadingHtml.push("			<div class='f-circle3'></div>");
                k.loadingHtml.push("			<div class='f-circle4'></div>");
                k.loadingHtml.push("		</div>");
                k.loadingHtml.push("		<div class='f-loadingTip'>网站初始化中...</div>");
                k.loadingHtml.push("	</div>")
            }
            k.loadingHtml.push("</div>")
        }
        l.newRapidSitePreview.append(k.loadingHtml.join(""));
        l.newRapidSitePreviewFrame.attr("src", j + "?ram=" + Math.random());
        Site.bindGobalEvent("siteReadyLoad",
        function(n, m) {
            Fai.top.$(".J_forWaiting").remove()
        });
        l.newRapidSitePreviewFrame.load(function() {
            Fai.top.$(".J_forWaiting").remove()
        })
    }
    function a(k) {
        if (!k) {
            return
        }
        var h = k;
        var i = b.data;
        f.each(i.usedArray,
        function(l, m) {
            if (h == m) {
                i.usedArray.splice(l, 1)
            }
        });
        i.usedArray.push(h);
        if (i.usedArray.length > 20) {
            i.usedArray.splice(0, i.usedArray.length - 20)
        }
        var j = i.usedArray.join(",");
        f.cookie("recentRapidTemplate", j, {
            expires: 30
        })
    }
    b.rapidSiteViewInit = function() {
        if (Fai.top.$("#newRapidSitePreview").length < 1) {
            var h = [],
            i = b.dom;
            h.push('<div id="newRapidSitePreview" class="ma-newRapidSitePreview2">');
            h.push('<iframe id="newRapidSitePreviewFrame" src="about:blank" frameborder="0" width="100%" height="100%" scrolling="auto" style="display:none; background:#fff;"></iframe>');
            h.push('<div id="newRapidSiteBigImg" class="ma-newRapidSiteBigImg"><a hidefocus="true" href="javascript:;" id="newRapidSiteBigImgClose" class="ma-newRapidSiteBigImgClose" onclick="Site.rapidSite.newRapidSiteBigImgRemove();return false;"></a></div>');
            h.push('<div id="newRapidSiteBlackBg" class="ma-newRapidSiteBlackBg"></div>');
            h.push("</div>");
            Fai.top.$("body").append(h.join(""));
            i.newRapidSitePreview = Fai.top.$("#newRapidSitePreview");
            i.newRapidSitePreviewFrame = Fai.top.$("#newRapidSitePreviewFrame");
            i.newRapidSiteBigImg = Fai.top.$("#newRapidSiteBigImg");
            i.newRapidSiteBlackBg = Fai.top.$("#newRapidSiteBlackBg");
            i.newRapidSitePreview.addClass("ma-newRapidSitePreview2")
        }
    };
    b.copyTemplate = function(h) {
        var i = h.aid,
        j = h.kind2;
        c();
        Fai.top.rapidSiteCloneId = i;
        Fai.top.rapidSiteStyleChangeNum += 1;
        Site.logDog(100063, 1);
        if (j != -2) {
            Site.logDog(100063, 10000000 + parseInt(i))
        } else {
            Site.logDog(100063, 7)
        }
        b.copyNewTemplate()
    };
    b.copyNewTemplate = function() {
        if (Fai.top.rapidSiteStyleChangeNum == 0) {
            return
        }
        var i = Fai.top.rapidSiteCloneId;
        var h = Fai.top._signupDays;
        if (typeof i == "undefined" || i == 0) {
            Fai.ing("请选择您所需要的初始化样板网站！", true);
            return
        }
        if (!Fai.top._adm) {
            alert("您不是超级管理员，无法复制网站，请联系您的超级管理员。");
            return
        }
        Site.logDog(100063, 5);
        a(i);
        if (h <= 1 && !Site.getCookieFlag(38)) {
            Site.setCookieFlag(38, true);
            Site.rapidSite.templateCloneing(null, i);
            f.cookie("_bannerLibWeight", null, {
                expires: 1,
                path: "/"
            })
        } else {
            if ((h > 1 && h <= 7) || (h <= 1 && Site.getCookieFlag(38))) {
                var k = new Array();
                k.push("<div style='color:#000;text-align:center;'>");
                k.push("使用“极速建站”后，您的网站内容将全部更换为样板网站内容");
                k.push("</div>");
                var j = Fai.popupBodyWindow({
                    title: "极速建站",
                    content: k.join(""),
                    width: 430,
                    height: 40,
                    window_extClass: "fk-rapidSitePopupWindow"
                });
                Fai.addPopupBodyWindowBtn(j, {
                    id: "save",
                    text: "确  定",
                    extClass: "saveButton",
                    click: function() {
                        Fai.top._changeStyleNum = 0;
                        if (h >= 7 && !confirm("确定复制网站？确定后您的网站数据将被全部删除，不可恢复！")) {
                            return
                        }
                        f.cookie("_bannerLibWeight", null, {
                            expires: 1,
                            path: "/"
                        });
                        f("#popupWindow" + j).remove();
                        f("#popupBg" + j).remove();
                        Fai.enablePopupBodyWindowBtn(j, "save", false);
                        Site.rapidSite.templateCloneing(j, i)
                    }
                });
                Fai.addPopupBodyWindowBtn(j, {
                    id: "cancel",
                    text: "取  消",
                    extClass: "cancelButton",
                    click: function() {
                        f("#popupWindow" + j).remove();
                        f("#popupBg" + j).remove();
                        Fai.top.$("#popupBgTitle" + j).remove()
                    }
                })
            } else {
                var k = new Array();
                k.push("<div style='line-height:30px'>");
                k.push("使用“极速建站”后，<span class='cloneAll'>您的网站内容（含手机版）将全部更换为样板网站内容</span>");
                k.push("<span class='cloneTemplate' style='display:none;'>您的网站将更换为网站模版，内容不会改变</span>。");
                k.push("<div class='cloneAll'>或者您可以首先&nbsp;<a hidefocus='true' style='color:blue;' target='_blank' href='./index.jsp?openmf=manageSiteBackupRestore'>备份网站</a>&nbsp;以便于恢复。</div>");
                k.push("<div class='cloneAll' style='color:#ff3c00;'>(注意：确定后您的网站数据将被全部删除，不可恢复！)</div>");
                k.push("</div>");
                var j = Fai.popupBodyWindow({
                    title: "极速建站",
                    content: k.join(""),
                    width: 490,
                    height: 90,
                    window_extClass: "fk-rapidSitePopupWindow"
                });
                Fai.addPopupBodyWindowBtn(j, {
                    id: "save",
                    text: "确  定",
                    extClass: "saveButton",
                    click: function() {
                        Fai.top._changeStyleNum = 0;
                        if (h >= 7 && !confirm("确定复制网站？确定后您的网站数据将被全部删除，不可恢复！")) {
                            return
                        }
                        f.cookie("_bannerLibWeight", null, {
                            expires: 1,
                            path: "/"
                        });
                        f("#popupWindow" + j).remove();
                        f("#popupBg" + j).remove();
                        Fai.enablePopupBodyWindowBtn(j, "save", false);
                        Site.rapidSite.templateCloneing(j, i)
                    }
                });
                Fai.addPopupBodyWindowBtn(j, {
                    id: "cancel",
                    text: "取  消",
                    extClass: "cancelButton",
                    click: function() {
                        f("#popupWindow" + j).remove();
                        f("#popupBg" + j).remove();
                        Fai.top.$("#popupBgTitle" + j).remove()
                    }
                })
            }
        }
    };
    b.templateCloneing = function(k, i) {
        Fai.top._changeStyleNum = 0;
        if (k != null) {
            f("#popupWindow" + k).remove();
            f("#popupBg" + k).remove();
            Fai.enablePopupBodyWindowBtn(k, "save", false)
        }
        var h = [],
        l = Fai.isIE() ? true: false,
        j = l ? "fk-forWaiting-ie": "fk-forWaiting-normal";
        h.push("<div id='rapidLoadingDiv' class='fk-forWaiting " + j + "'>");
        if (l) {
            h.push("	<div class='f-spinner'>");
            h.push("		<div class='J_loadingTip f-loadingTip'>网站复制中...</div>");
            h.push("	</div>")
        } else {
            h.push("	<div class='f-spinner'>");
            h.push("		<div class='f-spinnerContainer f-container1'>");
            h.push("			<div class='f-circle1'></div>");
            h.push("			<div class='f-circle2'></div>");
            h.push("			<div class='f-circle3'></div>");
            h.push("			<div class='f-circle4'></div>");
            h.push("		</div>");
            h.push("		<div class='f-spinnerContainer f-container2'>");
            h.push("			<div class='f-circle1'></div>");
            h.push("			<div class='f-circle2'></div>");
            h.push("			<div class='f-circle3'></div>");
            h.push("			<div class='f-circle4'></div>");
            h.push("		</div>");
            h.push("		<div class='f-spinnerContainer f-container1'>");
            h.push("			<div class='f-circle1'></div>");
            h.push("			<div class='f-circle2'></div>");
            h.push("			<div class='f-circle3'></div>");
            h.push("			<div class='f-circle4'></div>");
            h.push("		</div>");
            h.push("		<div class='J_loadingTip f-loadingTip'>网站复制中...</div>");
            h.push("	</div>")
        }
        h.push("</div>");
        Fai.top.$("body").append(h.join(""));
        f.ajax({
            type: "post",
            url: Site.genAjaxUrl("site_h.jsp"),
            data: "cmd=cloneDemo&demoAid=" + i,
            error: function() {
                Fai.top.$("#popupBgTitle" + k).remove();
                Fai.enablePopupBodyWindowBtn(k, "save", true)
            },
            success: function(m) {
                if (i > 0) {
                    Site.setWebTemplateSettingTabFlag()
                } else {
                    Site.removeWebTemplateSettingTabFlag()
                }
                Site.setCookieFlag(38, true);
                Fai.enablePopupBodyWindowBtn(k, "save", true);
                m = f.parseJSON(m);
                if (m.success) {
                    if (f.cookie("_raipidSiteSelectTrade") != null) {
                        f.cookie("_bannerSelectTrade", f.cookie("_raipidSiteSelectTrade"), {
                            path: "/manage"
                        })
                    }
                    Fai.top.location.href = "/index.jsp"
                } else {
                    Fai.ing(m.msg, true);
                    f("#rapidLoadingDiv").remove();
                    var p = '<div class="rapidErrorInitSitePanel"><div class="loadErrorTrans"></div><div class="loadErrorPanel"><p class="textNotice">初始化页面有误，您可重新尝试或选择其他样板！</p><p class="btnContent"><a class="againLoad" href="javascript:;" onclick="Site.rapidSite.copyNewTemplate();return false;">重 试</a><a class="tryOther" href="javascript:;" onclick="Site.rapidSite.rapidErrorChooseElse();Site.rapidSite.init();return false;">选择其他</a></p></div></div>';
                    f("body").append(p);
                    if (p) {
                        var n = (document.documentElement.clientHeight - f(".rapidErrorInitSitePanel .loadErrorPanel").outerHeight(true)) / 2;
                        var o = (document.documentElement.clientWidth - f(".rapidErrorInitSitePanel .loadErrorPanel").outerWidth(true)) / 2;
                        if (n < 0) {
                            n = 0
                        }
                        if (o < 0) {
                            o = 0
                        }
                        f(".rapidErrorInitSitePanel .loadErrorPanel").css("top", n).css("left", o)
                    }
                }
            }
        });
        setTimeout(function() {
            if (Fai.top.$("#rapidLoadingDiv").length) {
                f("#rapidLoadingDiv .J_loadingTip").text("请耐心等候...")
            }
        },
        3000);
        setTimeout(function() {
            if (Fai.top.$("#rapidLoadingDiv").length) {
                f("#rapidLoadingDiv .J_loadingTip").text("网络可能有误，您可键盘输入F5刷新页面")
            }
        },
        10000)
    };
    b.rapidErrorChooseElse = function() {
        if (Fai.top.$(".rapidErrorInitSitePanel").length) {
            Fai.top.$(".rapidErrorInitSitePanel").remove()
        }
    };
    b.newRapidSiteBigImgRemove = function() {
        Fai.top.$("#newRapidSiteBigImg").hide()
    };
    b.fixLogDogForYouLike = function(h) {
        if (!b.status.isSelectYouLike) {
            return
        }
        b.logDog(h)
    };
    b.logDog = function(i) {
        var j = parseInt(i.kind2),
        h = parseInt(i.kind);
        if (d(h)) {
            Site.logDog(100063, 3);
            Site.logDog(100063, 10);
            Site.logDog(100063, (j + 1000));
            Site.logProf(50, j)
        } else {
            Site.logDog(100063, 3);
            if (j == -2) {
                Site.logDog(100063, 8)
            } else {
                if (j >= 0) {
                    Site.logDog(100063, (j + 1000));
                    Site.logProf(50, j)
                }
            }
        }
    };
    b.markSelectKind = function(j) {
        var l = j.isMall || false,
        k = "",
        i, h;
        if (l) {
            h = j.kind2;
            k = "m" + h
        } else {
            i = j.kind;
            h = j.kind2;
            k = i + "_" + h
        }
        f.cookie("rapidSite_selectKind", k, {
            expires: 7,
            path: "/"
        })
    };
    b.checkInitByMarkKind = function() {
        var k = f.cookie("rapidSite_selectKind", {
            expires: 7,
            path: "/"
        }),
        j,
        i,
        h;
        if (f.trim(k).length > 0) {
            if (k.indexOf("m") > -1) {
                h = parseInt(k.split("m")[1]) || 0;
                if (h > 0) {
                    b.showMallTrade(h)
                }
            } else {
                j = k.split("_");
                if (j.length == 2) {
                    i = parseInt(j[0]);
                    h = parseInt(j[1]);
                    if ((i == -1 && h == -2) || (i >= 0 && h >= 0)) {
                        b.showTrade2(i, h)
                    }
                }
            }
        }
    };
    function c() {
        if (Fai.top.$("#styleDesignArrow").hasClass("g_styleDesignArrowUp")) {
            Site.changeStyleDesignPanes()
        }
    }
    function d(h) {
        return h == Fai.top._rapidSitePanelData.mallKindInfo.id ? true: false
    }
})(jQuery, Site.rapidSite);