Site.initFaiFloatPanelIcon = function() {
    var b = [];
    b.push("<div id='faiFloatPanelIconContainer' class='faiFloatPanelIconContainer' location='left' status='1'>");
    b.push("<div class='faiFloatPanelIconBox faiFloatPanelIconBox-first'><a href='javascript:;' id='faiFloatPanel_addNewModule' class='faiFloatPanel_addNewModule' onclick='Site.faiFloatPanel(0);return false;' hidefocus='true'></a></div>");
    b.push("<div class='faiFloatPanelIconBox'><a href='javascript:;' id='faiFloatPanel_setSiteStyle' class='faiFloatPanel_setSiteStyle' onclick='Site.faiFloatPanel(2);return false;' hidefocus='true'></a></div>");
    b.push("</div>");
    Fai.top.$("body").append(b.join(""));
    var a = Fai.top.$("#faiFloatPanelIconContainer");
    var d = "<a href='javascript:;'  id='faiFloatPanel_addNewModule' class='faiFloatPanel_addNewModule' onclick='Site.faiFloatPanel(0);return false;' hidefocus='true'></a>";
    var c = "<a href='javascript:;'  id='faiFloatPanel_setSiteStyle' class='faiFloatPanel_setSiteStyle' onclick='Site.faiFloatPanel(2);return false;' hidefocus='true'></a>";
    Site.refreshFaiFloatPanelIconStyle();
    a.ready(function() {
        var f = 10;
        var e;
        a.draggable({
            containment: "parent",
            cursor: "move",
            scroll: false,
            start: function() {
                a.find("#faiFloatPanel_addNewModule").prop("onclick", null).addClass("draggableIcon");
                a.find("#faiFloatPanel_setSiteStyle").prop("onclick", null).addClass("draggableIcon");
                var g = Fai.top.$("#faiFloatPanel");
                if (typeof g != "undefined" && g.length > 0) {
                    g.attr("status", -1)
                }
            },
            drag: function() {
                var g = Fai.top.$(".floatRightTop").offset().left;
                var h = $(this).offset().left + 52 + f;
                if ($(this).offset().left < f) {
                    $(this).removeClass("faiFloatPanelIconContainer_right").addClass("faiFloatPanelIconContainer_left")
                } else {
                    if (h > g) {
                        $(this).removeClass("faiFloatPanelIconContainer_left").addClass("faiFloatPanelIconContainer_right")
                    } else {
                        if ($(this).hasClass("faiFloatPanelIconContainer_left")) {
                            $(this).removeClass("faiFloatPanelIconContainer_left")
                        } else {
                            if ($(this).hasClass("faiFloatPanelIconContainer_right")) {
                                $(this).removeClass("faiFloatPanelIconContainer_right")
                            }
                        }
                    }
                }
                var i = Fai.top.$("#faiFloatPanel");
                if (typeof i != "undefined" && i.length > 0) {
                    i.attr("status", -1)
                }
            },
            stop: function(g, k) {
                var l = Fai.top.$(".floatRightTop").offset().left;
                var p = l / 2;
                var n = Fai.top.$(".floatRightTop").offset().top;
                var i = $(this).offset().left;
                var o = i + 52 + f;
                var h = Fai.top.$("#faiFloatPanel");
                if (i < f) {
                    $(this).removeClass("faiFloatPanelIconContainer_right").addClass("faiFloatPanelIconContainer_left");
                    $(this).animate({
                        left: 0
                    },
                    300)
                } else {
                    if (o > l) {
                        $(this).removeClass("faiFloatPanelIconContainer_left").addClass("faiFloatPanelIconContainer_right");
                        $(this).animate({
                            left: (l - 23) + "px"
                        },
                        500)
                    } else {
                        if ($(this).hasClass("faiFloatPanelIconContainer_left")) {
                            $(this).removeClass("faiFloatPanelIconContainer_left")
                        } else {
                            if ($(this).hasClass("faiFloatPanelIconContainer_right")) {
                                $(this).removeClass("faiFloatPanelIconContainer_right")
                            }
                        }
                    }
                }
                a.find("#faiFloatPanel_addNewModule").replaceWith(d);
                a.find("#faiFloatPanel_setSiteStyle").replaceWith(c);
                if ($(this).offset().top < n) {
                    $(this).css({
                        top: n + "px"
                    })
                }
                var m = "left";
                var j = "";
                if (i < p) {
                    $(this).attr("location", "left")
                } else {
                    $(this).attr("location", "right");
                    m = "right";
                    j = "faiFloatPanel_right"
                }
                if (typeof h != "undefined" && h.length > 0) {
                    h.attr({
                        location: m,
                        status: 0
                    }).removeClass("faiFloatPanel_right").addClass(j);
                    var q = 1 - h.outerWidth();
                    if (h.attr("location") == "right") {
                        q = l - 1
                    }
                    h.css({
                        left: q + "px"
                    })
                }
                $.cookie("faiFloatPanelIcon_left", $(this).offset().left, {
                    expires: 365,
                    path: "/"
                });
                $.cookie("faiFloatPanelIcon_top", $(this).offset().top, {
                    expires: 365,
                    path: "/"
                })
            }
        });
        Site.bindGobalEvent("site_hideModule_before",
        function(h, g) {
            if ( !! Fai.top.panelModuleIconClick) {
                return
            }
            if (!g.show) {
                return
            }
            var j = 300;
            var l = Fai.top.$("#faiFloatPanel");
            if (l.length < 1 || l.attr("status") != 1) {
                j = 420;
                Site.faiFloatPanel(1)
            }
            var i = Fai.top.$("#menu_currentSectionModuleContainer");
            if (!i.hasClass("on")) {
                i.children(".menu").trigger("click")
            }
            var k = setInterval(function() {
                if ( !! Fai.top.faiFloatPanelReady) {
                    setTimeout(function() {
                        Site.hideModuleAnimate(g)
                    },
                    j);
                    clearInterval(k)
                }
            },
            50)
        })
    });
    Fai.top.faiFloatPanelIconReady = true
};
Site.hideFaiFloatPanelIcon = function() {
    Fai.top.$("#faiFloatPanelIconContainer").attr({
        status: "0"
    }).hide()
};
Site.showFaiFloatPanelIcon = function() {
    var a = Fai.top.$("#faiFloatPanelIconContainer");
    a.attr({
        status: "1"
    }).show();
    Site.refreshFaiFloatPanelIconStyle()
};
Site.refreshFaiFloatPanelIconStyle = function(q) {
    var h = Fai.top.$("#faiFloatPanelIconContainer");
    if (h.length < 1) {
        return
    }
    if (h.attr("status") != 1) {
        return
    }
    var d = $.cookie("faiFloatPanelIcon_left", {
        path: "/"
    });
    var g = $.cookie("faiFloatPanelIcon_top", {
        path: "/"
    });
    var r = false;
    if (typeof d == "string" && typeof g == "string") {
        h.removeClass("faiFloatPanelIconContainer_left faiFloatPanelIconContainer_right");
        h.css({
            left: d + "px",
            top: g + "px"
        });
        var a = 10;
        var o = Fai.top.$(".floatRightTop").offset().left;
        var s = o / 2;
        var e = parseInt(d);
        var m = e + 52 + a;
        var p = e;
        if (e < a) {
            h.addClass("faiFloatPanelIconContainer_left");
            p = 0
        } else {
            if (m > o) {
                h.addClass("faiFloatPanelIconContainer_right");
                p = o - 23
            }
        }
        if (q) {
            h.css({
                left: p + "px"
            })
        } else {
            h.animate({
                left: p + "px"
            },
            500)
        }
        if (e < s) {
            h.attr("location", "left")
        } else {
            h.attr("location", "right")
        }
    } else {
        r = true;
        var i = Fai.top.$("#webContainer");
        var f = Fai.top.$("#guideQuick");
        if (i.length > 0) {
            var l = $(Fai.top).height();
            var b = i.offset().top;
            var j = i.offset().left;
            var n = h.width() + 40;
            var c = 0;
            if (j > n) {
                h.css({
                    left: parseInt(j - n) + "px"
                })
            }
            if (l > b && l > parseInt(b + h.height()) && b > c) {}
        }
    }
    var k = Fai.top.$(".floatRightTop").offset().top;
    if (h.offset().top < k) {
        h.css({
            top: k + "px"
        })
    } else {
        if (typeof g != "undefined" && (parseInt(g) < k)) {
            g = k + ""
        }
        if (typeof d == "string" && typeof g == "string") {
            h.css({
                left: p + "px",
                top: g + "px"
            })
        }
    }
    if (r) {
        Site.refreshGuideQuickIconStyle()
    }
};
Site.faiFloatPanel = function(c, g, n) {
    Fai.top.draggableDiv_out = false;
    Fai.top.draggableDiv_enable = true;
    var f = c;
    if (typeof f == "undefined") {
        f = 0
    }
    var b = Fai.top.$("#faiFloatPanel");
    var l = Fai.top.$("#faiFloatPanelIconContainer");
    var a = Fai.top.$(".floatLeftTop").offset().top;
    var j = Fai.top.$(".floatLeftBottom").offset().top;
    var e = j - a;
    var k = l.attr("location");
    if (b.length < 1) {
        var d = [];
        d.push("<div id='faiFloatPanel' class='faiFloatPanel' status='0' selectTab='0' location='" + k + "' style='display:none;'>");
        d.push("	<div class='faiFloatPanelNavContainer'>");
        d.push("		<ul id='faiFloatPanelNav' class='faiFloatPanelNav'>");
        d.push("			<li><a href='javascript:;' class='addModule' onclick='Site.showPanelContent(0);return false;' title='添加模块' hidefocus='true'>&nbsp;</a></li>");
        d.push("			<li><a href='javascript:;' class='sectionModule' id='panelSectionModuleTab' onclick='Site.showPanelContent(1);return false;' title='栏目模块' hidefocus='true'>&nbsp;</a></li>");
        d.push("			<li><a href='javascript:;' class='setSiteStyle' onclick='Site.showPanelContent(2);return false;' title='网站样式' hidefocus='true'>&nbsp;</a></li>");
        d.push("		</ul>");
        d.push("		<div class='faiFloatPanel_closeBtnContainer'><a href='javascript:;' title='关闭' id='faiFloatPanel_closeBtn' class='faiFloatPanel_closeBtn' onclick='Site.fixFaiFloatPanelData();Site.hideFaiFloatPanel();return false;' hidefocus='true'></a></div>");
        d.push("	</div>");
        d.push("	<div class='faiFloatPanelContentContainer'>");
        d.push("		<ul id='faiFloatPanelContent' class='faiFloatPanelContent'>");
        d.push("		</ul>");
        d.push("	</div>");
        d.push("	<div id='faiFloatPanelOverLay' class='faiFloatPanelOverLay' style='display:none;'></div>");
        d.push("</div>");
        Fai.top.$("body").append(d.join(""));
        Site.initPanelContent(e);
        Site.updateCurrentSectionModule();
        Site.sectionModuleSelectChange(false);
        top.$(top.document).ready(function() {
            b = Fai.top.$("#faiFloatPanel");
            Site.bindEventToFloatPanel(b)
        })
    } else {
        if (b.attr("status") == 1) {
            Site.showPanelContent(f, n);
            return
        }
    }
    if (Fai.top.$("#panes").is(":visible")) {
        Site.stylePanesHide()
    }
    b.attr("location", k).css({
        opacity: "1"
    });
    var i = Fai.top.$(".floatRightTop").offset().left;
    var m = 1 - b.outerWidth();
    var h = "";
    if (b.attr("location") == "right") {
        h = "faiFloatPanel_right";
        m = i - 1
    }
    b.css({
        left: m + "px"
    }).removeClass("faiFloatPanel_right").addClass(h);
    Site.refreshPanelStyle();
    Site.showFaiFloatPanel(g);
    Site.showPanelContent(f, n);
    Site.hideFaiFloatPanelIcon()
};
Site.hideFaiFloatPanel = function(a) {
    var d = Fai.top.$("#faiFloatPanel");
    if (d.length > 0 && (d.attr("status") == 1)) {
        var c = 1 - d.outerWidth();
        var b = Fai.top.$(".floatRightTop").offset().left;
        if (d.attr("location") == "right") {
            c = b - 1
        }
        Fai.top._appendArea = "";
        if (a) {
            d.attr("status", "0").css({
                left: c + "px"
            }).hide()
        } else {
            d.attr("status", "0").animate({
                left: c + "px"
            },
            300);
            setTimeout(function() {
                d.hide()
            },
            300)
        }
        Site.showFaiFloatPanelIcon()
    }
};
Site.showFaiFloatPanel = function(a) {
    var e = Fai.top.$("#faiFloatPanel");
    var b = 300;
    if (a) {
        b = 1
    }
    if (typeof e == "undefined" || (e.length < 1)) {
        return
    }
    e.show();
    if (e.attr("status") > -1) {
        var c = Fai.top.$(".floatRightTop").offset().left;
        var d = c - e.outerWidth() + 1;
        if (e.attr("location") == "left") {
            e.stop(true).attr({
                status: "1"
            }).animate({
                left: "0px"
            },
            b)
        } else {
            e.stop(true).attr({
                status: "1"
            }).animate({
                left: d + "px"
            },
            b)
        }
        if (Fai.isIE6()) {
            Fai.top.$("body").css({
                width: "99%"
            }).css({
                width: "auto"
            })
        }
    }
};
Site.showPanelContent = function(c, h) {
    Fai.top.$("#faiFloatPanel").attr({
        selectTab: c
    }).show();
    var b = Fai.top.$("#faiFloatPanelNav").children("li");
    var d = Fai.top.$("#faiFloatPanelContent").children("li");
    if (typeof c == "undefined") {
        c = 0
    }
    var i = parseInt(c);
    if (i == 0) {
        Site.logDog(100078, 0);
        Site.logDog(100079, 0);
        var f = $.cookie("faiFloatPanelPrompt", {
            path: "/"
        });
        if ( !! !f) {
            var g = 125;
            var a = Fai.top.$("#faiFloatPanelIconContainer").attr("location");
            if (a == "left") {
                g = Fai.top.$(".floatLeftTop").offset().top + 101
            } else {
                g = Fai.top.$(".floatRightTop").offset().top + 103
            }
            tmp = [];
            tmp.push("<div class='popupBg' id='panelAddNewModulePrompt'>");
            tmp.push("		<div class='panelAddNewModulePrompt-div panelAddNewModulePrompt-" + a + "' style='top:" + g + "px;'>");
            tmp.push("			<a href='javascript:;' onclick='Site.faiFloatPanelPrompt();return false;' class='panelAddNewModule-understandPrompt panelAddNewModule-understandPrompt-" + a + "'>&nbsp;</a>");
            tmp.push("		</div>");
            tmp.push("</div>");
            Fai.top.$("body").append(tmp.join(""))
        }
    } else {
        if (i == 1) {
            Site.logDog(100078, 2);
            Site.logDog(100082, 0)
        } else {
            if (i == 2) {
                Site.logDog(100078, 1);
                Site.logDog(100080, 0)
            }
        }
    }
    if (typeof h != "undefined" && h > -1) {
        d.eq(c).find(".panelMenuList li").removeClass("on").eq(h).addClass("on")
    }
    b.removeClass("on").eq(parseInt(c)).addClass("on");
    d.hide().eq(parseInt(c)).show();
    var e = d.eq(c).find(".panelMenuList li.on .menu");
    if (Fai.isIE6() || Fai.isIE7()) {
        e[0].click()
    } else {
        setTimeout(function() {
            $(".panelContentContainer").mCustomScrollbar("scrollTo", "#" + e.attr("nav") + "", {
                scrollInertia: 0
            })
        },
        100)
    }
    Site.refreshFillDiv()
};
Site.refreshPanelStyle = function() {
    var c = Fai.top.$("#faiFloatPanel");
    if (typeof c == "undefined" || c.length < 1) {
        return
    }
    var a = Fai.top.$(".floatLeftTop").offset().top;
    var f = Fai.top.$(".floatLeftBottom").offset().top;
    var e = f - a;
    var g = Fai.top.$(".floatRightTop").offset().left;
    if (c.attr("status") != 0) {
        var j = g - c.outerWidth() + 1;
        if (c.attr("location") == "right") {
            c.css({
                left: j + "px"
            })
        }
    }
    c.css({
        top: a + "px",
        height: e + 6 + "px"
    });
    var i = e - 38 - 38 - 10;
    var d = i - 24;
    var b = i;
    var h = i - 24;
    if (Fai.top.$("#panelOemPrompt").length > 0) {
        d -= 30
    }
    if (Fai.top.$("#otherSectionSelecterContainer").is(":visible")) {
        h -= 45
    }
    Fai.top.$("#addModuleContentContainer").css({
        height: b + "px"
    });
    Fai.top.$("#setSiteStyleContentContainer").css({
        height: d + "px"
    });
    Fai.top.$("#sectionModuleContentContainer").css({
        height: h + "px"
    });
    Site.refreshFillDiv()
};
Site.refreshFillDiv = function() {
    var f = Fai.top.$("#addModuleContentContainer");
    var b = f.find(".splitLine");
    var m = f.find(".panelContentFillDiv");
    var p = f.offset().top;
    var a = f.outerHeight();
    var c = m.offset().top;
    var n = 0;
    var j = (c - p) % a;
    n = a - f.find(".panelItemContainer").last().outerHeight();
    m.css({
        height: n + "px"
    });
    var e = Fai.top.$("#setSiteStyleContentContainer");
    var i = e.find(".splitLine");
    var o = e.find(".panelContentFillDiv");
    var h = e.offset().top;
    var l = e.outerHeight();
    var g = o.offset().top;
    var k = 0;
    var d = (g - h) % l;
    k = l - e.find(".panelItemContainer").last().outerHeight();
    o.css({
        height: k + "px"
    })
};
Site.initPanelContent = function(c) {
    var e = [];
    e = Site.getPanelModuleList();
    var g = [];
    g = Site.getPanelStyleList();
    var d = [];
    d = Site.getPanelSectionModuleList();
    var f = Site.initBlockOfPanelContent("addModuleMenuList", e, "addModuleContentContainer");
    var b = Site.initBlockOfPanelContent("setSiteStyleMenuList", g, "setSiteStyleContentContainer");
    var a = Site.initBlockOfPanelContent("sectionModuleMenuList", d, "sectionModuleContentContainer");
    Fai.top.$("#faiFloatPanelContent").append(f);
    Fai.top.$("#faiFloatPanelContent").append(a);
    Fai.top.$("#faiFloatPanelContent").append(b);
    Site.addSetSiteStyleContent("setSiteStyleContentContainer", g, c);
    Site.addModuleContent("addModuleContentContainer", e, c);
    Site.addSectionModuleContent("sectionModuleContentContainer", d)
};
Site.initBlockOfPanelContent = function(b, f, g) {
    var e = [];
    e.push("<li style='display:none;'>");
    e.push("	<div class='panelMenuContainer'>");
    e.push("		<ul class='panelMenuList' id='" + b + "'>");
    for (var d = 0; d < f.length; d++) {
        var a = f[d].anchor;
        var c = "";
        if (f[d].script) {
            c = f[d].script
        }
        e.push("			<li id='menu_" + a + "'><a href='javascript:;' class='menu' nav='" + a + "' id='" + (b + d) + "' onclick='" + c + "return false;' hidefocus='true'>" + f[d].name + "<span class='panelCorner'></span></a><span class='panelTriangle'></span></li>")
    }
    e.push("		</ul>");
    e.push("	</div>");
    e.push("	<div id='" + g + "TopLine'></div>");
    e.push("	<div class='panelContentContainer " + g + "' id='" + g + "' style='position:relative;'>");
    e.push("	</div>");
    e.push("</li>");
    return e.join("")
};
Site.addSetSiteStyleContent = function(a, p, m) {
    var f = [];
    for (var g = 0; g < p.length; g++) {
        var e = p[g];
        var q = e.name;
        var l = e.list;
        var n = e.anchor;
        var k = e.id;
        f.push("<div class='splitLine' id='" + n + "'></div>");
        f.push("<div class='panelItemContainer' id='" + k + "'>");
        f.push("	<fieldset class='panelItemBox'>");
        if (Fai.top._oem) {
            f.push("		<legend class='panelSiteGroupOMid' title='" + q + "样式为“网站中级版”功能'>" + q + "</legend>")
        } else {
            f.push("		<legend>" + q + "</legend>")
        }
        f.push("		<div class='panelItemContent'>");
        f.push("				<ul>");
        for (var c = 0; c < l.length; c++) {
            var o = l[c].title;
            var h = l[c].extclass || "";
            var d = l[c].content;
            var b = "";
            if (l[c].id) {
                b = "panelOptionBox-" + l[c].id
            }
            if (b != "") {
                f.push("					<li class='panelOptionBox " + h + "' id='" + b + "'>")
            } else {
                f.push("					<li class='panelOptionBox " + h + "'>")
            }
            f.push("						<p class='panelOptionTitle'>" + o + "</p>");
            f.push("						<div class='panelOptionContent'>");
            f.push("							\n" + d.join(""));
            f.push("						</div>");
            f.push("					</li>")
        }
        f.push("				</ul>");
        f.push("		</div>");
        f.push("	</fieldset>");
        f.push("</div>")
    }
    f.push("<div class='panelContentFillDiv'></div>");
    Fai.top.$("#" + a).append(f.join(""));
    f = [];
    f.push("<div class='panelFootBtnBox'><a href='javascript:;' onclick='Fai.top.panelFunc.resetDefault();return false;' class='panelBtn panelBtn_setSiteStyle'>恢复默认</a></div>");
    Fai.top.$("#" + a).after(f.join(""));
    if (Fai.top._oem && !Fai.top._panelOptionData.allowedStyle) {
        f = [];
        f.push("<div class='panelPromptBox' id='panelOemPrompt'><p class='panelPrompt'>网站样式为<span class='panelSiteGroupOMid2' >&nbsp;</span>中级版功能，选择中级版以上主题可试用</p></div>");
        Fai.top.$("#" + a).prev("#" + a + "TopLine").before(f.join(""))
    }
};
Site.addModuleContent = function(a, k, l) {
    var e = [];
    for (var f = 0; f < k.length; f++) {
        var d = k[f];
        var o = d.name;
        var h = d.list;
        var m = d.anchor;
        e.push("<div class='splitLine' id='" + m + "'></div>");
        e.push("<div class='panelItemContainer'>");
        e.push("	<fieldset class='panelItemBox'>");
        e.push("		<legend>" + o + "</legend>");
        e.push("		<div class='panelItemContent'>");
        e.push("				<ul class='panelModuleIconContainer'>");
        for (var c = 0; c < h.length; c++) {
            var g = h[c].title;
            var n = h[c].className;
            var b = h[c].param;
            e.push("					<li class='panelModuleIconContent panelModuleIcon_" + n + "'  _intab='0' _inmulmcol='0'>");
            e.push("						<a href='javascript:;' class='panelModuleIcon' onclick='Site.bindEventToFloatPanel_addNewModule(\"" + b + "\");return false;'></a>");
            e.push("						<a href='javascript:;' class='panelModuleTitle' onclick='Site.bindEventToFloatPanel_addNewModule(\"" + b + "\");return false;' title='" + g + "'>" + g + "</a>");
            e.push("					</li>")
        }
        e.push("				</ul>");
        e.push("		</div>");
        e.push("	</fieldset>");
        e.push("</div>")
    }
    e.push("<div class='panelContentFillDiv'></div>");
    Fai.top.$("#" + a).append(e.join(""))
};
Site.addSectionModuleContent = function(e, d) {
    var c = [];
    var a = Fai.top._panelOptionData.selectOptionList;
    for (var b = 0; b < d.length; b++) {
        c.push("<div id='" + d[b].id + "' class='" + d[b].id + "' style='display:none;'></div>")
    }
    c.push("<div class='panelContentFillDiv'></div>");
    Fai.top.$("#" + e).append(c.join(""));
    c = [];
    c.push("<div class='panelFootBtnBox'><a href='javascript:;' onclick='Site.popupWindow({title:\"管理模块\", frameSrcUrl:\"manage/moduleManage.jsp?ram=\"+Math.random(), width:\"650\", height:\"515\"});Site.removeAllEditLayer();return false;'  class='panelBtn panelBtn_manageModule'>管理模块</a></div>");
    Fai.top.$("#" + e).after(c.join(""));
    c = [];
    c.push("<div id='otherSectionSelecterContainer' class='otherSectionSelecterContainer' style='display:none;'>");
    c.push("		<label>选择栏目：</label>");
    c.push("		<select onchange='Site.sectionModuleSelectChange(true, true);' id='panelOtherSectionSelecter' class='panelOtherSectionSelecter'>");
    for (var b = 0; b < a.length; b++) {
        c.push(a[b])
    }
    c.push("		</select>");
    c.push("		<div id='otherSectionSelecterPrompt' class='otherSectionSelecterPrompt'><div class='otherSectionSelecterPrompt-tip'></div><p>此为当前栏目，请选择其他栏目<p></div>");
    c.push("</div>");
    Fai.top.$("#" + e).prev("#" + e + "TopLine").before(c.join(""))
};
Site.getPanelModuleList = function() {
    var b = [];
    var a = [];
    a.push({
        title: "图文展示",
        className: "rich",
        param: "rich"
    });
    a.push({
        title: "浮动图片",
        className: "floatImg",
        param: "floatImg"
    });
    a.push({
        title: "图册展示",
        className: "photo",
        param: "photo"
    });
    a.push({
        title: "文章列表",
        className: "article",
        param: "article"
    });
    a.push({
        title: "滚动公告",
        className: "notice",
        param: "notice"
    });
    a.push({
        title: "天气信息",
        className: "weather",
        param: "weather"
    });
    b.push({
        name: "基础",
        list: a,
        anchor: "basicLine"
    });
    a = [];
    a.push({
        title: "模块组",
        className: "tab",
        param: "tab"
    });
    a.push({
        title: "二列排版",
        className: "mulModuleCol-two panelModuleIcon_mulModuleCol",
        param: "mulModuleColTwo"
    });
    a.push({
        title: "三列排版",
        className: "mulModuleCol-three panelModuleIcon_mulModuleCol",
        param: "mulModuleColThree"
    });
    a.push({
        title: "四列排版",
        className: "mulModuleCol-four panelModuleIcon_mulModuleCol",
        param: "mulModuleColFour"
    });
    a.push({
        title: "五列排版",
        className: "mulModuleCol-five panelModuleIcon_mulModuleCol",
        param: "mulModuleColFive"
    });
    a.push({
        title: "通栏排版",
        className: "fullmeasure",
        param: "fullmeasure"
    });
    b.push({
        name: "排版",
        list: a,
        anchor: "layoutLine"
    });
    a = [];
    a.push({
        title: "产品展示",
        className: "product",
        param: "product"
    });
    a.push({
        title: "产品分类",
        className: "productGroup",
        param: "productGroup"
    });
    a.push({
        title: "产品标签",
        className: "productLabel",
        param: "productLabel"
    });
    a.push({
        title: "产品目录",
        className: "catalog",
        param: "catalog"
    });
    a.push({
        title: "产品筛选",
        className: "filter",
        param: "filter"
    });
    a.push({
        title: "产品搜索",
        className: "productSearch",
        param: "productSearch"
    });
    b.push({
        name: "产品",
        list: a,
        anchor: "productLine"
    });
    a = [];
    a.push({
        title: "在线客服",
        className: "serviceOnline",
        param: "serviceOnline"
    });
    a.push({
        title: "会员登录",
        className: "memberLogin",
        param: "memberLogin"
    });
    a.push({
        title: "网站二维码",
        className: "siteQrCode",
        param: "siteQrCode"
    });
    a.push({
        title: "全站搜索",
        className: "siteSearch",
        param: "siteSearch"
    });
    a.push({
        title: "分享网站",
        className: "shareTo",
        param: "shareTo"
    });
    a.push({
        title: "留言提交",
        className: "msgSubmit",
        param: "msgSubmit"
    });
    a.push({
        title: "购物车",
        className: "shoppingCart",
        param: "shoppingCart"
    });
    a.push({
        title: "在线投票",
        className: "vote",
        param: "vote"
    });
    a.push({
        title: "在线表单",
        className: "siteForm",
        param: "siteForm"
    });
    b.push({
        name: "互动",
        list: a,
        anchor: "interactive"
    });
    a = [];
    a.push({
        title: "魔方图册",
        className: "photoCard",
        param: "photoCard"
    });
    a.push({
        title: "图文链接",
        className: "link",
        param: "link"
    });
    a.push({
        title: "文章分类",
        className: "newsgroup",
        param: "newsgroup"
    });
    a.push({
        title: "图册目录",
        className: "photoGroup",
        param: "photoGroup"
    });
    a.push({
        title: "栏目导航",
        className: "nav",
        param: "nav"
    });
    a.push({
        title: "浮动按钮",
        className: "floatBtn",
        param: "floatBtn"
    });
    a.push({
        title: "文件下载",
        className: "file",
        param: "file"
    });
    a.push({
        title: "在线视频",
        className: "media",
        param: "flv"
    });
    a.push({
        title: "Flash",
        className: "flash",
        param: "flash"
    });
    a.push({
        title: "在线地图",
        className: "map",
        param: "map"
    });
    a.push({
        title: "新浪微博秀",
        className: "weiboShow",
        param: "weiboShow"
    });
    a.push({
        title: "当前时间",
        className: "date",
        param: "date"
    });
    a.push({
        title: "当前位置",
        className: "location",
        param: "location"
    });
    a.push({
        title: "简易表格",
        className: "table",
        param: "table"
    });
    a.push({
        title: "收藏本站",
        className: "indexFavorite",
        param: "indexFavorite"
    });
    a.push({
        title: "嵌入页面",
        className: "iframe",
        param: "iframe"
    });
    a.push({
        title: "插件代码",
        className: "code",
        param: "code"
    });
    if (Fai.top._panelOptionData.webDebug) {
        a.push({
            title: "UI检查(dev)",
            className: "cust",
            param: "uicheck"
        })
    }
    if (Fai.top._panelOptionData.schemeCust) {
        a.push({
            title: "定制",
            className: "cust",
            param: "cust"
        })
    }
    b.push({
        name: "高级",
        list: a,
        anchor: "advancedLine"
    });
    return b
};
Site.getPanelStyleList = function() {
    var b = [];
    var a = [];
    a = Site.getBackgroundStyleOptionList();
    b.push({
        name: "背景",
        list: a,
        anchor: "bgStyleLine",
        id: "panelItemContainer_bg"
    });
    a = Site.getTopStyleOptionList();
    b.push({
        name: "顶部",
        list: a,
        anchor: "topStyleLine",
        id: "panelItemContainer_top"
    });
    a = Site.getBannerStyleOptionList();
    b.push({
        name: "横幅区",
        list: a,
        anchor: "bannerStyleLine",
        id: "panelItemContainer_banner"
    });
    a = Site.getContentStyleOptionList();
    b.push({
        name: "内容区",
        list: a,
        anchor: "contentStyleLine",
        id: "panelItemContainer_content"
    });
    a = Site.getFootStyleOptionList();
    b.push({
        name: "底部",
        list: a,
        anchor: "footStyleLine",
        id: "panelItemContainer_foot"
    });
    return b
};
Site.getBackgroundStyleOptionList = function() {
    var b = [];
    var a = [];
    a.push("<div class='contentFirst'>");
    a.push("	<input id='useSysSiteWidth' type='radio' name='SiteWidth' value='0' onclick='Fai.top.panelFunc.changeSiteWidth(0);' /><label for='useSysSiteWidth' class='labelForInput'>默认</label>");
    a.push("	<input id='useCusSiteWidth' type='radio' name='SiteWidth' value='1' onclick='Fai.top.panelFunc.changeSiteWidth(1);' /><label for='useCusSiteWidth' class='labelForInput'>自定义</label>");
    a.push("</div>");
    a.push("<div class='contentSecond'>");
    a.push("	<div id='setBackgroundWidth-box' class='optionRow' >");
    a.push("		<div class='labelForLeftTitle'>大小：</div>");
    a.push("		<div class='optionRowOfInput setOperate '>");
    a.push("			<div id='setBackgroundWidth' class='setSliderBar'></div>");
    a.push("			<div id='setBackgroundWidthContainer' class='setSliderLetter'></div>");
    a.push("		</div>");
    a.push("	</div>");
    a.push("</div>");
    b.push({
        title: "宽度",
        content: a
    });
    a = [];
    a.push("<div class='contentFirst'>");
    a.push("	<input id='useSysBackground' type='radio' name='webBg' value='0' onClick='Fai.top.panelFunc.changeWebBg(0);'/><label for='useSysBackground' class='labelForInput'>默认</label>");
    a.push("	<input id='hideBackground' type='radio' name='webBg' value='1' onClick='Fai.top.panelFunc.changeWebBg(1);'/><label for='hideBackground' class='labelForInput'>隐藏</label>");
    a.push("	<input id='useCusBackground' type='radio' name='webBg' value='2' onClick='Fai.top.panelFunc.changeWebBg(2);'/><label for='useCusBackground' class='labelForInput'>自定义</label>");
    a.push("</div>");
    a.push("<div id='cusPanel'class='contentSecond'>");
    a.push("	<div class='optionRow'>");
    a.push("		<label class='labelForLeftTitle'>颜色：</label>");
    a.push("		<div id='colorPicker' class='colorPicker'></div>");
    a.push("	</div>");
    a.push("	<div class='optionRow'>");
    a.push("		<label class='imgLabel labelForLeftTitle'>图片：</label>");
    a.push("		<div><input type='button' id='fileUploadV2' class='left faiButton' value='添加图片'/></div>");
    a.push("		<div id='uploadmsgBg' class='uploadmsg'></div>");
    a.push("	</div>");
    a.push("<div class='J_previewContent optionRow f-previewContent-none'>");
    a.push("<div class='f-previewWrap'>");
    a.push("<div class='f-preview J_preview'>");
    a.push("</div>");
    a.push("</div>");
    a.push("</div>");
    a.push("	<div class='optionRow'>");
    a.push("		<label class='labelForLeftTitle'>显示方式：</label>");
    a.push("		<select id='bgDisplay' class='left optionRowOfSelect' onChange='Fai.top.panelFunc.bgDisplayChange(this);'>");
    a.push("			<option value='-1'>不使用背景图片</option>");
    a.push("			<option value='0'>不平铺（居中）</option>");
    a.push("			<option value='3'>完全平铺</option>");
    a.push("			<option value='4'>拉伸平铺</option>");
    a.push("			<option value='5'>缩放平铺（等比例）</option>");
    a.push("			<option value='21'>纵向平铺（左边对齐）</option>");
    a.push("			<option value='2'>纵向平铺（中间对齐）</option>");
    a.push("			<option value='22'>纵向平铺（右边对齐）</option>");
    a.push("			<option value='11'>横向平铺（顶部对齐）</option>");
    a.push("			<option value='1'>横向平铺（中部对齐）</option>");
    a.push("			<option value='12'>横向平铺（底部对齐）</option>");
    a.push("			<option value='6'>不平铺（左对齐）</option>");
    a.push("			<option value='7'>不平铺（右对齐）</option>");
    a.push("			<option value='8'>不平铺（上对齐）</option>");
    a.push("			<option value='9'>不平铺（下对齐）</option>");
    a.push("			<option value='13'>不平铺（左上对齐）</option>");
    a.push("			<option value='14'>不平铺（右上对齐）</option>");
    a.push("			<option value='15'>不平铺（左下对齐）</option>");
    a.push("			<option value='16'>不平铺（右下对齐）</option>");
    a.push("		</select>");
    a.push("	</div>");
    a.push("	<div id='bgEffect' class='optionRow'>");
    a.push("		<label class='labelForLeftTitle2'>效果：</label>");
    a.push("		<div class='optionRowOfInput2'>");
    a.push("			<input id='scrollEffect' type='radio' name='effect'  value='0' onclick='Fai.top.panelFunc.changeWebBgEffect(0);' /><label for='scrollEffect' class='labelForInput'>默认</label>");
    a.push("			<input id='fixedEffect' type='radio' name='effect'  value='1' onclick='Fai.top.panelFunc.changeWebBgEffect(1);' /><label for='fixedEffect' class='labelForInput'>锁定背景图片</label>");
    a.push("		</div>");
    a.push("	</div>");
    a.push("</div>");
    b.push({
        title: "背景",
        content: a
    });
    return b
};
Site.getTopStyleOptionList = function() {
    var b = [];
    var a = [];
    a.push("<div class='contentFirst optionRow'>");
    a.push("	<div class='left optionRowOfInput'>");
    a.push("		<input id='topStyleDefault' type='radio' name='topStyleHeight' /><label for='topStyleDefault' class='labelForInput'>默认</label>");
    a.push("		<input id='topStyleCustom' type='radio' name='topStyleHeight' /><label for='topStyleCustom' class='labelForInput'>自定义</label>");
    a.push("	</div>");
    a.push("	<div id='settingHeightInputWrap' class='settingHeightInputWrap'>");
    a.push("		<input id='settingHeightInput' class='settingHeightInput' type='text' onKeyUp='Fai.top.panelFunc.refreshHeaderTop()' onChange='Fai.top.panelFunc.refreshHeaderTop()' onkeypress='javascript:return Fai.isNumberKey(event);' maxlength='3' />");
    a.push("		<span>像素</span>");
    a.push("	</div>");
    a.push("</div>");
    b.push({
        title: "高度",
        content: a
    });
    a = [];
    a.push("<div class='contentFirst'>");
    a.push("	<input id='headBg0' type='radio' name='headBg' onClick='Fai.top.panelFunc.changeHeadBgType(0);'/><label for='headBg0' class='labelForInput'>默认</label>");
    a.push("	<input class='freeDisable' id='headBg1' type='radio' name='headBg' onClick='Fai.top.panelFunc.changeHeadBgType(1);'/><label for='headBg1' class='labelForInput'>隐藏</label>");
    a.push("	<input class='freeDisable' id='headBg2' type='radio' name='headBg' onClick='Fai.top.panelFunc.changeHeadBgType(2);'/><label for='headBg2' class='labelForInput'>自定义</label>");
    a.push("</div>");
    a.push("<div class='contentSecond' id='headBgCus'>");
    a.push("	<div class='optionRow'>");
    a.push("		<label class='labelForLeftTitle'>颜色：</label>");
    a.push("		<div id='headBgColorPicker' class='colorPicker'></div>");
    a.push("	</div>");
    a.push("	<div class='optionRow'>");
    a.push("		<label class='imgLabel labelForLeftTitle'>图片：</label>");
    a.push("		<div><input type='button' id='headBgFileButton' class='left faiButton' value='添加图片' /></div>");
    a.push("		<div id='uploadmsg' class='uploadmsg'></div>");
    a.push("	</div>");
    a.push("<div class='J_previewContent optionRow f-previewContent-none'>");
    a.push("<div class='f-previewWrap'>");
    a.push("<div class='f-preview J_preview'>");
    a.push("</div>");
    a.push("</div>");
    a.push("</div>");
    a.push("	<div class='optionRow'>");
    a.push("		<label class='labelForLeftTitle'>显示方式：</label>");
    a.push("		<select id='headBgRepeat' class='left optionRowOfSelect' onChange='Fai.top.panelFunc.headBgRepeatChange(this);'>");
    a.push("			<option value='-1'>不使用背景图片</option>");
    a.push("			<option value='0'>不平铺（居中）</option>");
    a.push("			<option value='3'>完全平铺</option>");
    a.push("			<option value='4'>拉伸平铺</option>");
    a.push("			<option value='5'>缩放平铺（等比例）</option>");
    a.push("			<option value='21'>纵向平铺（左边对齐）</option>");
    a.push("			<option value='2'>纵向平铺（中间对齐）</option>");
    a.push("			<option value='22'>纵向平铺（右边对齐）</option>");
    a.push("			<option value='11'>横向平铺（顶部对齐）</option>");
    a.push("			<option value='1'>横向平铺（中部对齐）</option>");
    a.push("			<option value='12'>横向平铺（底部对齐）</option>");
    a.push("			<option value='6'>不平铺（左对齐）</option>");
    a.push("			<option value='7'>不平铺（右对齐）</option>");
    a.push("			<option value='8'>不平铺（上对齐）</option>");
    a.push("			<option value='9'>不平铺（下对齐）</option>");
    a.push("			<option value='13'>不平铺（左上对齐）</option>");
    a.push("			<option value='14'>不平铺（右上对齐）</option>");
    a.push("			<option value='15'>不平铺（左下对齐）</option>");
    a.push("			<option value='16'>不平铺（右下对齐）</option>");
    a.push("		</select>");
    a.push("	</div>");
    a.push("</div>");
    b.push({
        title: "背景",
        content: a
    });
    return b
};
Site.getBannerStyleOptionList = function() {
    var b = [];
    var a = [];
    a.push("<div class='contentFirst optionRow'>");
    a.push("	<div class='left optionRowOfInput'>");
    a.push("		<input id='topBannerDefault' type='radio' name='topBannerHeight' /><label for='topBannerDefault' class='labelForInput'>默认</label>");
    a.push("		<input id='topBannerCustom' type='radio' name='topBannerHeight' /><label for='topBannerCustom' class='labelForInput'>自定义</label>");
    a.push("	</div>");
    a.push("	<div id='settingBannerHeightInputWrap' class='settingHeightInputWrap'>");
    a.push("		 <input id='settingBannerHeightInput' class='settingHeightInput' type='text' onKeyUp='Fai.top.panelFunc.refreshBannerBgHeight()' onChange='Fai.top.panelFunc.refreshBannerBgHeight()' onkeypress='javascript:return Fai.isNumberKey(event);' maxlength='3' />");
    a.push("		<span>像素</span>");
    a.push("	</div>");
    a.push("</div>");
    b.push({
        title: "高度",
        content: a
    });
    a = [];
    a.push("<div class='contentFirst'>");
    a.push("	<input id='useSysBannerWidth' type='radio' name='bannerWidth' value='0' onclick='Fai.top.panelFunc.changeBannerWidth(0);' /><label for='useSysBannerWidth' class='labelForInput'>默认</label>");
    a.push("	<input id='useCusBannerWidth' type='radio' name='bannerWidth' value='1' onclick='Fai.top.panelFunc.changeBannerWidth(1);' /><label for='useCusBannerWidth' class='labelForInput'>自定义</label>");
    a.push("</div>");
    a.push("<div class='contentSecond'>");
    a.push("	<div id='setBannerWidth-box' class='optionRow' >");
    a.push("		<div class='labelForLeftTitle'>大小：</div>");
    a.push("		<div class='optionRowOfInput setOperate '>");
    a.push("			<div id='setBannerWidth' class='setSliderBar'></div>");
    a.push("			<div id='setBannerWidthContainer' class='setSliderLetter'></div>");
    a.push("		</div>");
    a.push("	</div>");
    a.push("</div>");
    b.push({
        title: "宽度",
        content: a
    });
    a = [];
    a.push("<div class='contentFirst'>");
    a.push("	<input id='useSysBannerBg' type='radio' name='bannerBg' value='0' onClick='Fai.top.panelFunc.changeBannerBg(0);'/><label for='useSysBannerBg' class='labelForInput'>默认</label>");
    a.push("	<input id='hideBannerBg' type='radio' name='bannerBg' value='1' onClick='Fai.top.panelFunc.changeBannerBg(1);'/><label for='hideBannerBg' class='labelForInput'>隐藏</label>");
    a.push("	<input id='useCusBannerBg' type='radio' name='bannerBg' value='2' onClick='Fai.top.panelFunc.changeBannerBg(2);'/><label for='useCusBannerBg' class='labelForInput'>自定义</label>");
    a.push("</div>");
    a.push("<div id='cusBannerPanel' class='contentSecond'>");
    a.push("	<div class='optionRow'>");
    a.push("		<label class='labelForLeftTitle'>颜色：</label>");
    a.push("		<div id='bannerColorPicker' class='colorPicker'></div>");
    a.push("	</div>");
    a.push("	<div class='optionRow'>");
    a.push("		<label class='imgLabel labelForLeftTitle'>图片：</label>");
    a.push("		<div><input type='button' id='bannerFileUploadV2' class='left faiButton' value='添加图片'/></div>");
    a.push("		<div id='uploadmsgBannerBg' class='uploadmsg'></div>");
    a.push("	</div>");
    a.push("<div class='J_previewContent optionRow f-previewContent-none'>");
    a.push("<div class='f-previewWrap'>");
    a.push("<div class='f-preview J_preview'>");
    a.push("</div>");
    a.push("</div>");
    a.push("</div>");
    a.push("	<div class='optionRow'>");
    a.push("		<label class='labelForLeftTitle'>显示方式：</label>");
    a.push("		<select id='bannerBgDisplay' class='left optionRowOfSelect' onChange='Fai.top.panelFunc.bannerBgRepeatChange(this);'>");
    a.push("			<option value='-1'>不使用背景图片</option>");
    a.push("			<option value='0'>不平铺（居中）</option>");
    a.push("			<option value='3'>完全平铺</option>");
    a.push("			<option value='4'>拉伸平铺</option>");
    a.push("			<option value='5'>缩放平铺（等比例）</option>");
    a.push("			<option value='21'>纵向平铺（左边对齐）</option>");
    a.push("			<option value='2'>纵向平铺（中间对齐）</option>");
    a.push("			<option value='22'>纵向平铺（右边对齐）</option>");
    a.push("			<option value='11'>横向平铺（顶部对齐）</option>");
    a.push("			<option value='1'>横向平铺（中部对齐）</option>");
    a.push("			<option value='12'>横向平铺（底部对齐）</option>");
    a.push("			<option value='6'>不平铺（左对齐）</option>");
    a.push("			<option value='7'>不平铺（右对齐）</option>");
    a.push("			<option value='8'>不平铺（上对齐）</option>");
    a.push("			<option value='9'>不平铺（下对齐）</option>");
    a.push("			<option value='13'>不平铺（左上对齐）</option>");
    a.push("			<option value='14'>不平铺（右上对齐）</option>");
    a.push("			<option value='15'>不平铺（左下对齐）</option>");
    a.push("			<option value='16'>不平铺（右下对齐）</option>");
    a.push("		</select>");
    a.push("	</div>");
    a.push("</div>");
    b.push({
        title: "背景",
        content: a
    });
    return b
};
Site.getContentStyleOptionList = function() {
    var b = [];
    var a = [];
    a.push("<div class='contentFirst'>");
    a.push("	<input id='useSysContentBg' type='radio' name='contentBg' value='0' onClick='Fai.top.panelFunc.changeContentBg(0)'/><label for='useSysContentBg' class='labelForInput'>默认</label>");
    a.push("	<input id='hideContentBg' type='radio' name='contentBg' value='1' onClick='Fai.top.panelFunc.changeContentBg(1)'/><label for='hideContentBg' class='labelForInput'>隐藏</label>");
    a.push("	<input id='useCusContentBg' type='radio' name='contentBg' value='2' onClick='Fai.top.panelFunc.changeContentBg(2)'/><label for='useCusContentBg' class='labelForInput'>自定义</label>");
    a.push("</div>");
    a.push("<div  id='cusContentPanel' class='contentSecond'>");
    a.push("	<div class='optionRow'>");
    a.push("		<label class='labelForLeftTitle'>颜色：</label>");
    a.push("		<div id='contentColorPicker' class='colorPicker'></div>");
    a.push("	</div>");
    a.push("	<div class='optionRow'>");
    a.push("		<label class='imgLabel labelForLeftTitle'>图片：</label>");
    a.push("		<div><input type='button' id='contentFileUploadV2' class='left faiButton' value='添加图片'/></div>");
    a.push("		<div id='uploadmsgContentBg' class='uploadmsg'></div>");
    a.push("	</div>");
    a.push("<div class='J_previewContent optionRow f-previewContent-none'>");
    a.push("<div class='f-previewWrap'>");
    a.push("<div class='f-preview J_preview'>");
    a.push("</div>");
    a.push("</div>");
    a.push("</div>");
    a.push("	<div class='optionRow'>");
    a.push("		<label class='labelForLeftTitle'>显示方式：</label>");
    a.push("		<select id='contentBgDisplay' class='left optionRowOfSelect' onChange='Fai.top.panelFunc.contentBgRepeatChange(this);'>");
    a.push("			<option value='-1'>不使用背景图片</option>");
    a.push("			<option value='0'>不平铺（居中）</option>");
    a.push("			<option value='3'>完全平铺</option>");
    a.push("			<option value='4'>拉伸平铺</option>");
    a.push("			<option value='5'>缩放平铺（等比例）</option>");
    a.push("			<option value='21'>纵向平铺（左边对齐）</option>");
    a.push("			<option value='2'>纵向平铺（中间对齐）</option>");
    a.push("			<option value='22'>纵向平铺（右边对齐）</option>");
    a.push("			<option value='11'>横向平铺（顶部对齐）</option>");
    a.push("			<option value='1'>横向平铺（中部对齐）</option>");
    a.push("			<option value='12'>横向平铺（底部对齐）</option>");
    a.push("			<option value='6'>不平铺（左对齐）</option>");
    a.push("			<option value='7'>不平铺（右对齐）</option>");
    a.push("			<option value='8'>不平铺（上对齐）</option>");
    a.push("			<option value='9'>不平铺（下对齐）</option>");
    a.push("			<option value='13'>不平铺（左上对齐）</option>");
    a.push("			<option value='14'>不平铺（右上对齐）</option>");
    a.push("			<option value='15'>不平铺（左下对齐）</option>");
    a.push("			<option value='16'>不平铺（右下对齐）</option>");
    a.push("		</select>");
    a.push("	</div>");
    a.push("</div>");
    b.push({
        title: "背景",
        content: a
    });
    a = [];
    a.push("<div class='contentFirst'>");
    a.push("	<input id='useSysContentMiddleBg' type='radio' name='contentMiddleBg' value='0' onClick='Fai.top.panelFunc.changeContentMiddleBg(0)'/><label for='useSysContentMiddleBg' class='labelForInput'>默认</label>");
    a.push("	<input id='hideContentMiddleBg' type='radio' name='contentMiddleBg' value='1' onClick='Fai.top.panelFunc.changeContentMiddleBg(1)'/><label for='hideContentMiddleBg' class='labelForInput'>隐藏</label>");
    a.push("	<input id='useCusContentMiddleBg' type='radio' name='contentMiddleBg' value='2' onClick='Fai.top.panelFunc.changeContentMiddleBg(2)'/><label for='useCusContentMiddleBg' class='labelForInput'>自定义</label>");
    a.push("</div>");
    a.push("<div  id='cusContentMiddlePanel' class='contentSecond'>");
    a.push("	<div class='optionRow'>");
    a.push("		<label class='labelForLeftTitle'>颜色：</label>");
    a.push("		<div id='contentMiddleColorPicker' class='colorPicker'></div>");
    a.push("	</div>");
    a.push("	<div class='optionRow'>");
    a.push("		<label class='imgLabel labelForLeftTitle'>图片：</label>");
    a.push("		<div><input type='button' id='contentMiddleFileUploadV2' class='left faiButton' value='添加图片'/></div>");
    a.push("		<div id='uploadmsgContentMiddleBg' class='uploadmsg'></div>");
    a.push("	</div>");
    a.push("<div class='J_previewContent optionRow f-previewContent-none'>");
    a.push("<div class='f-previewWrap'>");
    a.push("<div class='f-preview J_preview'>");
    a.push("</div>");
    a.push("</div>");
    a.push("</div>");
    a.push("	<div class='optionRow'>");
    a.push("		<label class='labelForLeftTitle'>显示方式：</label>");
    a.push("		<select id='contentMiddleBgDisplay' class='left optionRowOfSelect' onChange='Fai.top.panelFunc.contentMiddleBgRepeatChange(this);'>");
    a.push("			<option value='-1'>不使用背景图片</option>");
    a.push("			<option value='0'>不平铺（居中）</option>");
    a.push("			<option value='3'>完全平铺</option>");
    a.push("			<option value='4'>拉伸平铺</option>");
    a.push("			<option value='5'>缩放平铺（等比例）</option>");
    a.push("			<option value='21'>纵向平铺（左边对齐）</option>");
    a.push("			<option value='2'>纵向平铺（中间对齐）</option>");
    a.push("			<option value='22'>纵向平铺（右边对齐）</option>");
    a.push("			<option value='11'>横向平铺（顶部对齐）</option>");
    a.push("			<option value='1'>横向平铺（中部对齐）</option>");
    a.push("			<option value='12'>横向平铺（底部对齐）</option>");
    a.push("			<option value='6'>不平铺（左对齐）</option>");
    a.push("			<option value='7'>不平铺（右对齐）</option>");
    a.push("			<option value='8'>不平铺（上对齐）</option>");
    a.push("			<option value='9'>不平铺（下对齐）</option>");
    a.push("			<option value='13'>不平铺（左上对齐）</option>");
    a.push("			<option value='14'>不平铺（右上对齐）</option>");
    a.push("			<option value='15'>不平铺（左下对齐）</option>");
    a.push("			<option value='16'>不平铺（右下对齐）</option>");
    a.push("		</select>");
    a.push("	</div>");
    a.push("</div>");
    b.push({
        title: "中间背景",
        content: a
    });
    a = [];
    a.push("<div class='contentFirst'>");
    a.push("	<input id='useSysContentLeftWidth' type='radio' name='contentLeftWidth' value='0' onclick='Fai.top.panelFunc.changeContentLeftWidth(0);' /><label for='useSysContentLeftWidth' class='labelForInput'>默认</label>");
    a.push("	<input id='useCusContentLeftWidth' type='radio' name='contentLeftWidth' value='1' onclick='Fai.top.panelFunc.changeContentLeftWidth(1);' /><label for='useCusContentLeftWidth' class='labelForInput'>自定义</label>");
    a.push("</div>");
    a.push("<div class='contentSecond'>");
    a.push("	<div id='setContentLeftWidth-box' class='optionRow' >");
    a.push("		<div class='labelForLeftTitle'>大小：</div>");
    a.push("		<div class='optionRowOfInput setOperate '>");
    a.push("			<div id='setContentLeftWidth' class='setSliderBar'></div>");
    a.push("			<div id='setContentLeftWidthContainer' class='setSliderLetter'></div>");
    a.push("		</div>");
    a.push("	</div>");
    a.push("</div>");
    b.push({
        title: "左侧栏宽度",
        content: a,
        id: "contentLeftWdith"
    });
    a = [];
    a.push("<div class='contentFirst'>");
    a.push("	<input id='useSysContentRightWidth' type='radio' name='contentRightWidth' value='0' onclick='Fai.top.panelFunc.changeContentRightWidth(0);' /><label for='useSysContentRightWidth' class='labelForInput'>默认</label>");
    a.push("	<input id='useCusContentRightWidth' type='radio' name='contentRightWidth' value='1' onclick='Fai.top.panelFunc.changeContentRightWidth(1);' /><label for='useCusContentRightWidth' class='labelForInput'>自定义</label>");
    a.push("</div>");
    a.push("<div class='contentSecond'>");
    a.push("	<div id='setContentRightWidth-box' class='optionRow' >");
    a.push("		<div class='labelForLeftTitle'>大小：</div>");
    a.push("		<div class='optionRowOfInput setOperate '>");
    a.push("			<div id='setContentRightWidth' class='setSliderBar'></div>");
    a.push("			<div id='setContentRightWidthContainer' class='setSliderLetter'></div>");
    a.push("		</div>");
    a.push("	</div>");
    a.push("</div>");
    b.push({
        title: "右侧栏宽度",
        content: a,
        id: "contentRightWdith"
    });
    return b
};
Site.getFootStyleOptionList = function() {
    var d = [];
    var b = [];
    b.push("<div class='contentFirst'>");
    b.push("	<input id='footerAlignDefault' type='radio' name='footerAlign' onClick='Fai.top.panelFunc.changeFooterAlign (0)'/><label for='footerAlignDefault' class='labelForInput'>默认</label>");
    b.push("	<input id='footerAlignLeft' type='radio' name='footerAlign' onClick='Fai.top.panelFunc.changeFooterAlign (1)'/><label for='footerAlignLeft' class='labelForInput'>靠左</label>");
    b.push("	<input id='footerAlignCenter' type='radio' name='footerAlign' onClick='Fai.top.panelFunc.changeFooterAlign (2)'/><label for='footerAlignCenter' class='labelForInput'>居中</label>");
    b.push("	<input id='footerAlignRight' type='radio' name='footerAlign' onClick='Fai.top.panelFunc.changeFooterAlign (3)'/><label for='footerAlignRight' class='labelForInput'>靠右</label>");
    b.push("</div>");
    b.push("<div class='contentSecond'>");
    b.push("</div>");
    d.push({
        title: "对齐",
        content: b
    });
    b = [];
    b.push("<div class='contentFirst'>");
    b.push("	<input id='footerEdgeDistance0' type='radio' name='footerEdgeDistance' onClick='Fai.top.panelFunc.changefooterPaddingType(0)'/><label for='footerEdgeDistance0' class='labelForInput'>默认</label>");
    b.push("	<input id='footerEdgeDistance1' type='radio' name='footerEdgeDistance' onClick='Fai.top.panelFunc.changefooterPaddingType(1)'/><label for='footerEdgeDistance1' class='labelForInput'>自定义</label>");
    b.push("</div>");
    b.push("<div class='contentSecond footOptionRow' id='footerPaddingCus'>");
    b.push("<label>上：</label><input id='upFooterPadding' type='text' class='input posInput numeric' onKeyUp='Fai.top.panelFunc.onPaddingChange()' onChange='Fai.top.panelFunc.onPaddingChange()'/>");
    b.push("<label>左：</label><input id='leftFooterPadding' type='text' class='input posInput numeric' onKeyUp='Fai.top.panelFunc.onPaddingChange()' onChange='Fai.top.panelFunc.onPaddingChange()'/>");
    b.push("<label>下：</label><input id='downFooterPadddng' type='text' class='input posInput numeric' onKeyUp='Fai.top.panelFunc.onPaddingChange()' onChange='Fai.top.panelFunc.onPaddingChange()'/>");
    b.push("<label>右：</label><input id='rightFooterPadding' type='text' class='input posInput numeric' onKeyUp='Fai.top.panelFunc.onPaddingChange()' onChange='Fai.top.panelFunc.onPaddingChange()'/>");
    b.push("</div>");
    d.push({
        title: "边距",
        content: b
    });
    b = [];
    b.push("<div class='contentFirst'>");
    b.push("	<input id='regularText1' type='radio' name='regularText' onClick='Fai.top.panelFunc.changeRegularTextType(0)'/><label for='regularText1' class='labelForInput'>默认</label>");
    b.push("	<input id='regularText2' type='radio' name='regularText' onClick='Fai.top.panelFunc.changeRegularTextType(1)'/><label for='regularText2' class='labelForInput'>自定义</label>");
    b.push("</div>");
    b.push("<div class='contentSecond' id='footerRegularTextCus'>");
    b.push("	<div class='optionRow'>");
    b.push("		<label class='labelForLeftTitle'>大小：</label>");
    b.push("		<select id='regularTextSize' class='left optionRowOfSelect' onChange='Fai.top.panelFunc.regularTextSizeChange(this);'>");
    for (var c = 12; c < 21; c++) {
        b.push("			<option value='" + c + "'>" + c + "</option>")
    }
    b.push("		</select>");
    b.push("	</div>");
    b.push("	<div class='optionRow'>");
    b.push("		<label class='labelForLeftTitle'>样式：</label>");
    b.push("		<select id='regularTextFamily' class='left optionRowOfSelect' onChange='Fai.top.panelFunc.regularTextFamilyChange(this);'>");
    for (var c = 0; c < Fai.top._panelOptionData.fontFamilyList.length; c++) {
        var a = Fai.top._panelOptionData.fontFamilyList[c];
        b.push("			<option value='" + a.first + "'>" + a.second + "</option>")
    }
    b.push("		</select>");
    b.push("	</div>");
    b.push("	<div class='optionRow'>");
    b.push("		<label class='labelForLeftTitle'>颜色：</label>");
    b.push("		<div id='regularTextColorPicker' class='colorPicker'></div>");
    b.push("	</div>");
    b.push("</div>");
    d.push({
        title: "普通文字",
        content: b
    });
    b = [];
    b.push("<div class='contentFirst'>");
    b.push("	<input id='footerNavText0' type='radio' name='footerNavText' onClick='Fai.top.panelFunc.changeFooterNavTextType(0)'/><label for='footerNavText0' class='labelForInput'>默认</label>");
    b.push("	<input id='footerNavText1' type='radio' name='footerNavText' onClick='Fai.top.panelFunc.changeFooterNavTextType(1)'/><label for='footerNavText1' class='labelForInput'>自定义</label>");
    b.push("</div>");
    b.push("<div class='contentSecond' id='footerNavTextCus'>");
    b.push("	<div class='optionRow'>");
    b.push("		<label class='labelForLeftTitle'>大小：</label>");
    b.push("		<select id='footerNavTextSize' class='left optionRowOfSelect' onChange='Fai.top.panelFunc.footerNavTextSizeChange(this);'>");
    for (var c = 12; c < 21; c++) {
        b.push("			<option value='" + c + "'>" + c + "</option>")
    }
    b.push("		</select>");
    b.push("	</div>");
    b.push("	<div class='optionRow footerNavTextCus'>");
    b.push("		<label>加粗：</label>");
    b.push("		<input id='footerNavTextBold' type='checkbox' onClick='Fai.top.panelFunc.footerNavTextBoldCheck(this);'/>");
    b.push("		<label>下划线：</label>");
    b.push("		<input id='footerDecorationCheck' type='checkbox' onClick='Fai.top.panelFunc.footerDecorationCheck(this);'/>");
    b.push("	</div>");
    b.push("	<div class='optionRow'>");
    b.push("		<label class='labelForLeftTitle'>样式：</label>");
    b.push("		<select id='footerNavTextFamily' class='left optionRowOfSelect' onChange='Fai.top.panelFunc.footerNavTextFamilyChange(this);'>");
    for (var c = 0; c < Fai.top._panelOptionData.fontFamilyList.length; c++) {
        var a = Fai.top._panelOptionData.fontFamilyList[c];
        b.push("			<option value='" + a.first + "'>" + a.second + "</option>")
    }
    b.push("		</select>");
    b.push("	</div>");
    b.push("	<div class='optionRow'>");
    b.push("		<label class='labelForLeftTitle'>颜色：</label>");
    b.push("		<div id='footerNavTextColorPicker' class='colorPicker'></div>");
    b.push("	</div>");
    b.push("	<div class='optionRow'>");
    b.push("		<label class='labelForLeftTitle'>选中：</label>");
    b.push("		<div id='footerNavHoverTextColorPicker' class='colorPicker'></div>");
    b.push("	</div>");
    b.push("</div>");
    d.push({
        title: "链接文字",
        content: b
    });
    b = [];
    b.push("<div class='contentFirst'>");
    b.push("	<input id='footerBg0' type='radio' name='footerBg' onclick='Fai.top.panelFunc.changeFooterBgType(0)'/><label for='footerBg0' class='labelForInput'>默认</label>");
    b.push("	<input id='footerBg1' type='radio' name='footerBg' onclick='Fai.top.panelFunc.changeFooterBgType(1)'/><label for='footerBg1' class='labelForInput'>隐藏</label>");
    b.push("	<input class='freeDisable' id='footerBg2' type='radio' name='footerBg' onclick='Fai.top.panelFunc.changeFooterBgType(2)'/><label for='footerBg2' class='labelForInput'>自定义</label>");
    b.push("</div>");
    b.push("<div class='contentSecond' id='footerBgCus'>");
    b.push("	<div class='optionRow'>");
    b.push("		<label class='labelForLeftTitle'>颜色：</label>");
    b.push("		<div id='footerBgColorPicker' class='colorPicker'></div>");
    b.push("	</div>");
    b.push("	<div class='optionRow'>");
    b.push("		<label class='imgLabel labelForLeftTitle'>图片：</label>");
    b.push("		<div><input type='button' id='footerBgFileButton' class='left faiButton' value='添加图片'/></div>");
    b.push("		<div id='uploadmsgFooter' class='uploadmsg'></div>");
    b.push("	</div>");
    b.push("<div class='J_previewContent optionRow f-previewContent-none'>");
    b.push("<div class='f-previewWrap'>");
    b.push("<div class='f-preview J_preview'>");
    b.push("</div>");
    b.push("</div>");
    b.push("</div>");
    b.push("	<div class='optionRow'>");
    b.push("		<label class='labelForLeftTitle'>图片平铺：</label>");
    b.push("		<select id='footerBgRepeat' class='left optionRowOfSelect' onChange='Fai.top.panelFunc.footerBgRepeatChange(this);'>");
    b.push("			<option value='-1'>不使用背景图片</option>");
    b.push("			<option value='0'>不平铺（居中）</option>");
    b.push("			<option value='3'>完全平铺</option>");
    b.push("			<option value='4'>拉伸平铺</option>");
    b.push("			<option value='5'>缩放平铺（等比例）</option>");
    b.push("			<option value='21'>纵向平铺（左边对齐）</option>");
    b.push("			<option value='2'>纵向平铺（中间对齐）</option>");
    b.push("			<option value='22'>纵向平铺（右边对齐）</option>");
    b.push("			<option value='11'>横向平铺（顶部对齐）</option>");
    b.push("			<option value='1'>横向平铺（中部对齐）</option>");
    b.push("			<option value='12'>横向平铺（底部对齐）</option>");
    b.push("			<option value='6'>不平铺（左对齐）</option>");
    b.push("			<option value='7'>不平铺（右对齐）</option>");
    b.push("			<option value='8'>不平铺（上对齐）</option>");
    b.push("			<option value='9'>不平铺（下对齐）</option>");
    b.push("			<option value='13'>不平铺（左上对齐）</option>");
    b.push("			<option value='14'>不平铺（右上对齐）</option>");
    b.push("			<option value='15'>不平铺（左下对齐）</option>");
    b.push("			<option value='16'>不平铺（右下对齐）</option>");
    b.push("		</select>");
    b.push("	</div>");
    b.push("</div>");
    d.push({
        title: "背景",
        content: b
    });
    b = [];
    b.push("<div class='contentFirst'>");
    b.push("<ul id='patternChoiceBox' class='patternChoiceBox'>");
    b.push("<li>");
    b.push("<a href='javascript:;' id='patternChoice-normal' class='patternChoice' onclick='Site.normalFooterItemStyle(0);Site.logDog(100088, 0);return false;'><div class='pattern-normal'></div></a>");
    b.push("</li>");
    b.push("<li>");
    b.push("<a href='javascript:;' id='patternChoice-level' class='patternChoice' onclick='Site.levelFooterItemStyle(1);Site.logDog(100088, 1);return false;'><div class='pattern-level'></div></a>");
    b.push("</li>");
    b.push("<li>");
    b.push("<a href='javascript:;' id='patternChoice-vertical' class='patternChoice' onclick='Site.verticalFooterItemStyle(2);Site.logDog(100088, 2);return false;'><div class='pattern-vertical'></div></a>");
    b.push("</li>");
    b.push("</ul>");
    b.push("</div>");
    d.push({
        title: "栏目样式",
        content: b
    });
    b = [];
    b.push("<div class='contentFirst'>");
    b.push("<input id='normalItemPic' type='radio' name='itemPic' onclick='Site.autoFooterItemPic(0);'/><label for='normalItemPic' class='labelForInput'>默认 </label>");
    b.push("<input id='useItemPic' type='radio' name='itemPic' onclick='Site.showFooterItemPic(1);' /><label for='useItemPic' class='labelForInput'>开启 </label>");
    b.push("<input id='noItemPic' type='radio' name='itemPic' onclick='Site.hideFooterItemPic(2);' /><label for='noItemPic' class='labelForInput'>关闭</label> ");
    b.push("</div>");
    d.push({
        title: "栏目图标",
        content: b
    });
    b = [];
    b.push("<div class='contentFirst optionRow'>");
    b.push("<div class='left optionRowOfInput'>");
    b.push("<input id='sysItemWidth' type='radio' onclick='Site.autoFooterItemSectionWidth();' name='itemWidth' /><label for='sysItemWidth' class='labelForInput'>默认 </label>");
    b.push("<input id='cusItemWidth' type='radio' name='itemWidth' onclick='Site.setFooterItemSectionWidth();' /><label for='cusItemWidth' class='labelForInput'>自定义</label>");
    b.push("</div>");
    b.push("<div id='setFooterWidth' class='faiPanelInputWarp'>");
    b.push("<input id='cusItemWidthNum' type='text' value='' maxlength='3' onkeypress='javascript:return Fai.isNumberKey(event);' onkeyup='Site.setFooterItemSectionWidth();' onchange='Site.setFooterItemSectionWidth();' class='input-num' />");
    b.push("<span> 像素</span>");
    b.push("</div>");
    b.push("</div>");
    d.push({
        title: "栏目宽度",
        content: b
    });
    b = [];
    b.push("<div class='contentFirst'>");
    b.push("<div class='left optionRowOfInput'>");
    b.push("<input id='sysItemHeight' type='radio' name='itemHeight'  onclick='Site.autoFooterItemSectionHeight();' /><label for='sysItemHeight' class='labelForInput'>默认 </label>");
    b.push("<input id='cusItemHeight' type='radio' name='itemHeight' onclick='Site.setFooterItemSectionHeight();' /><label for='cusItemHeight' class='labelForInput'>自定义</label>");
    b.push("</div>");
    b.push("<div id='setFooterHeight' class='faiPanelInputWarp'>");
    b.push("<input id='cusItemHeightNum' type='text' value='' maxlength='3' onkeypress='javascript:return Fai.isNumberKey(event);' onkeyup='Site.setFooterItemSectionHeight();' onchange='Site.setFooterItemSectionHeight();' class='input-num' />");
    b.push("<span> 像素</span>");
    b.push("</div>");
    b.push("</div>");
    d.push({
        title: "栏目高度",
        content: b
    });
    b = [];
    b.push("<div class='contentFirst'>");
    b.push("<input id='sysFirstItemword' type='radio' name='firstItemword' value='' onclick='Site.autoFooterFirstItemFontStyle();' /><label for='sysFirstItemword' class='labelForInput'>默认 </label>");
    b.push("<input id='cusFirstItemword' type='radio' name='firstItemword' value='' onclick='Site.cusFooterFirstItemFontStyle();' /><label for='cusFirstItemword' class='labelForInput'>自定义</label>");
    b.push("</div>");
    b.push("<div class='contentSecond' id='cusFirstItemText'>");
    b.push("<div class='optionRow'>");
    b.push("<label class='labelForLeftTitle'>大小：</label>");
    b.push("<select id='firstItemTextSize' class='left optionRowOfSelect' onchange='Site.setFooterFristItemFontSize(this);'>");
    for (var c = 12; c < 21; c++) {
        b.push("			<option value='" + c + "'>" + c + "</option>")
    }
    b.push("</select>");
    b.push("<label for='firstItemTextBold' class='labelforInput2'>加粗：</label>");
    b.push("<input id='firstItemTextBold' type='checkbox' onclick='Site.setFooterFristItemFontWeight(this);' />");
    b.push("<label for='firstItemTextUnderline' class='labelforInput2'>下划线：</label>");
    b.push("<input id='firstItemTextUnderline' type='checkbox' onclick='Site.setFooterFristItemUnderline(this);' />");
    b.push("</div>");
    b.push("<div class='optionRow'>");
    b.push("<label class='labelForLeftTitle'>样式：</label>");
    b.push("<select id='firstItemTextfamily' class='left optionRowOfSelect' onchange='Site.setFooterFristItemFontFamily(this);'>");
    for (var c = 0; c < Fai.top._panelOptionData.fontFamilyList.length; c++) {
        var a = Fai.top._panelOptionData.fontFamilyList[c];
        b.push("			<option value='" + a.first + "'>" + a.second + "</option>")
    }
    b.push("</select>");
    b.push("</div>");
    b.push("<div class='optionRow'>");
    b.push("<label class='labelForLeftTitle'>颜色：</label>");
    b.push("<div id='firstItemTextColorPicker' class='colorPicker'></div>");
    b.push("</div>");
    b.push("<div class='optionRow'>");
    b.push("<label class='labelForLeftTitle'>选中：</label>");
    b.push("<div id='firstItemSelectedTextColorPicker' class='colorPicker'></div>");
    b.push("</div>");
    b.push("</div>");
    d.push({
        title: "栏目文字",
        content: b
    });
    b = [];
    b.push("<div class='contentFirst'>");
    b.push("<input id='firstItemNoHref' type='radio' name='firstItemHref' /><label for='firstItemNoHref' class='labelForInput'>默认 </label>");
    b.push("<input id='firstItemHref' type='radio' name='firstItemHref' /><label for='firstItemHref' class='labelForInput'>有下级菜单时不可点击</label>");
    b.push("</div>");
    d.push({
        title: "栏目点击",
        content: b
    });
    b = [];
    b.push("<div class='contentFirst'>");
    b.push("<div class='left optionRowOfInput'>");
    b.push("<input id='normalItemSpacing' type='radio' name='itemSpacing' onclick='Site.autoFooterItemSpacing();' /><label for='normalItemSpacing' class='labelForInput'>默认 </label>");
    b.push("<input id='cusItemSpacing' type='radio' name='itemSpacing' onclick='Site.setFooterItemSpacing();' /><label for='cusItemSpacing' class='labelForInput'>自定义</label>");
    b.push("</div>");
    b.push("<div id='setItemSpaceWidth' class='settingHeightInputWrap'>");
    b.push("<input id='cusItemSpacingWidth' type='text' value='' maxlength='3' onkeypress='javascript:return Fai.isNumberKey(event);' onkeyup='Site.setFooterItemSpacing();' onchange='Site.setFooterItemSpacing();' class='input-num' />");
    b.push("<span> 像素</span>");
    b.push("</div>");
    b.push("</div>");
    d.push({
        title: "项间隔宽",
        content: b
    });
    b = [];
    b.push("<div class='contentFirst'>");
    b.push("<input id='sysItemVerticalLine' type='radio' name='verticalLine' value='' checked='checked' onclick='Site.autoFooterVerticalLineStyle();' /><label for='sysItemVerticalLine' class='labelForInput'>默认 </label>");
    b.push("<input id='cusItemVerticalLine' type='radio' name='verticalLine' value='' checked='checked' onclick='Site.cusFooterVerticalLineStyle();' /><label for='cusItemVerticalLine' class='labelForInput'>自定义</label>");
    b.push("</div>");
    b.push("<div class='contentSecond' id='cusItemVerticalLineSetting'>");
    b.push("<div class='optionRow'>");
    b.push("<label class='labelForLeftTitle'>宽度：</label>");
    b.push("<input id='cusItemVerticalLineWidth' type='text' value='' maxlength='3' onkeypress='javascript:return Fai.isNumberKey(event);' onkeyup='Site.setFooterVerticalLineWidth();' onchange='Site.setFooterVerticalLineWidth();' class='input-num' />");
    b.push("<span> 像素</span>");
    b.push("</div>");
    b.push("<div class='optionRow'>");
    b.push("<label class='labelForLeftTitle'>颜色：</label>");
    b.push("<div id='cusItemVerticalLineColorPicker' class='colorPicker'></div>");
    b.push("</div>");
    b.push("</div>");
    d.push({
        title: "项间隔线",
        content: b
    });
    b = [];
    b.push("<div class='contentFirst'>");
    b.push("<input id='autoDirection' type='radio' name='direction'  onclick='Site.useAutoStyleForFooterSecondItem();' /><label for='autoDirection' class='labelForInput'>默认</label>");
    b.push("<input id='verticalDirection' type='radio' name='direction'  onclick='Site.useVerticalStyleForFooterSecondItem();' /><label for='verticalDirection' class='labelForInput'>纵向</label>");
    b.push("<input id='levelDirection' type='radio' name='direction' onclick='Site.useLevelStyleForFooterSecondItem();' /><label for='levelDirection' class='labelForInput'>横向</label>");
    b.push("</div>");
    d.push({
        title: "二级菜单展示方式",
        content: b,
        extclass: "J_footerSecondType"
    });
    b = [];
    b.push("<div class='contentFirst'>");
    b.push("<input id='sysSecondItemword' type='radio' name='secondItemword' onclick='Site.autoFooterSecondItemFontStyle();' /><label for='sysSecondItemword' class='labelForInput'>默认</label>");
    b.push("<input id='cusSecondItemword' type='radio' name='secondItemword' onclick='Site.cusFooterSecondItemFontStyle();' /><label for='cusSecondItemword' class='labelForInput'>自定义</label>");
    b.push("</div>");
    b.push("<div class='contentSecond' id='setFooterSecondText'>");
    b.push("<div class='optionRow'>");
    b.push("<label class='labelForLeftTitle'>大小：</label>");
    b.push("<select id='secondItemTextSize' class='left optionRowOfSelect' onchange='Site.setFooterSecondItemFontSize(this);'>");
    for (var c = 12; c < 21; c++) {
        b.push("<option value='" + c + "'>" + c + "</option>")
    }
    b.push("</select>");
    b.push("<label for='secondItemTextBold' class='labelforInput2'>加粗：</label>");
    b.push("<input id='secondItemTextBold' type='checkbox' onclick='Site.setFooterSecondItemFontWeight(this);' />");
    b.push("<label for='secondItemTextUnderline' class='labelforInput2'>下划线：</label>");
    b.push("<input id='secondItemTextUnderline' type='checkbox' onclick='Site.setFooterSecondItemUnderline(this);' />");
    b.push("</div>");
    b.push("<div class='optionRow'>");
    b.push("<label class='labelForLeftTitle'>样式：</label>");
    b.push("<select id='secondItemTextfamily' class='optionOfSelect' onchange='Site.setFooterSecondItemFontFamily(this);'>");
    for (var c = 0; c < Fai.top._panelOptionData.fontFamilyList.length; c++) {
        var a = Fai.top._panelOptionData.fontFamilyList[c];
        b.push("			<option value='" + a.first + "'>" + a.second + "</option>")
    }
    b.push("</select>");
    b.push("</div>");
    b.push("<div class='optionRow'>");
    b.push("<label class='labelForLeftTitle'>颜色：</label>");
    b.push("<div id='secondItemTextColorPicker' class='colorPicker'></div>");
    b.push("</div>");
    b.push("<div class='optionRow'>");
    b.push("<label class='labelForLeftTitle'>选中：</label>");
    b.push("<div id='secondItemSelectedTextColorPicker' class='colorPicker'></div>");
    b.push("</div>");
    b.push("</div>");
    d.push({
        title: "二级菜单文字",
        content: b,
        extclass: "J_footerSecondText footerSecondText"
    });
    return d
};
Site.getPanelSectionModuleList = function() {
    var a = [];
    a.push({
        name: "当前栏目",
        anchor: "currentSectionModuleContainer",
        id: "currentSectionModuleContainer",
        script: "Site.logDog(100082, 10);Site.refreshOtherSectionSelecter(0);Site.refreshPanelStyle();"
    });
    a.push({
        name: "其他栏目",
        anchor: "otherSectionModuleContainer",
        id: "otherSectionModuleContainer",
        script: "Site.logDog(100082, 20);Site.refreshOtherSectionSelecter(1);Site.refreshPanelStyle();"
    });
    return a
};
Site.updateCurrentSectionModule = function() {
    var b = Fai.top.$("#faiFloatPanel");
    if (b.length < 1) {
        return
    }
    var a = b.find("#currentSectionModuleContainer");
    $.ajax({
        type: "post",
        url: Site.genAjaxUrl("faiFloatPanel_h.jsp"),
        data: "cmd=currentSection&colId=" + Fai.top._colId + "&extId=" + Fai.top._extId,
        error: function() {
            Fai.ing("系统繁忙，请稍候重试", false)
        },
        success: function(u) {
            var v = $.parseJSON(u);
            Fai.top._panelOptionData.moduleDataList = v;
            var c = $.parseJSON(Fai.top._panelOptionData.moduleStyleList);
            var g = $.parseJSON(Fai.top._panelOptionData.moduleTypeList);
            var z = $.parseJSON(Fai.top._panelOptionData.siteColList);
            var H = [];
            var w = [];
            var o = v;
            for (var P = 0; P < v.length; P++) {
                var C = v[P].id;
                if (C == -9) {
                    continue
                }
                var A = v[P].name;
                var l = v[P].defaultName;
                var J = v[P].style;
                var E = v[P].valid;
                var t = [];
                if (v[P].inList) {
                    t = v[P].inList
                }
                var r = false;
                if (v[P].notdel) {
                    r = true
                }
                var B = false;
                if (Fai.top._colId == Fai.top._panelOptionData.sysIndex && J == c.sysLocation) {
                    B = true
                }
                var D = 0;
                if (v[P].colNum) {
                    D = v[P].colNum
                }
                var Q = Site.getModuleIconClass(J, D);
                if (top.$("#module" + C).attr("_intab") > 0 && !!!o[P].hasAdd) {
                    w.push({
                        id: C,
                        title: A,
                        defaultName: l,
                        className: Q,
                        param: Q,
                        style: J,
                        inList: t,
                        notdel: r,
                        disabled: B,
                        valid: E
                    });
                    o[P].hasAdd = 1;
                    continue
                }
                var q = false;
                for (var N = 0; N < Fai.top._hiddenModuleList.length; N++) {
                    var T = Fai.top._hiddenModuleList[N];
                    if (C == T.id) {
                        q = true
                    }
                }
                if (top.$("#module" + C).length > 0 && !q && !!!o[P].hasAdd) {
                    w.push({
                        id: C,
                        title: A,
                        defaultName: l,
                        className: Q,
                        param: Q,
                        style: J,
                        inList: t,
                        notdel: r,
                        disabled: B,
                        valid: E
                    });
                    o[P].hasAdd = 1
                }
            }
            for (var P = 0; P < v.length; P++) {
                var C = v[P].id;
                if (C == -9) {
                    continue
                }
                var A = v[P].name;
                var l = v[P].defaultName;
                var J = v[P].style;
                var E = v[P].valid;
                var t = [];
                if (v[P].inList) {
                    t = v[P].inList
                }
                var r = false;
                if (v[P].notdel) {
                    r = true
                }
                var B = false;
                if (Fai.top._colId == Fai.top._panelOptionData.sysIndex && J == c.sysLocation) {
                    B = true
                }
                var D = 0;
                if (v[P].colNum) {
                    D = v[P].colNum
                }
                var Q = Site.getModuleIconClass(J, D);
                if (!v[P].special) {
                    continue
                }
                if ( !! !o[P].hasAdd) {
                    w.push({
                        id: C,
                        title: A,
                        defaultName: l,
                        className: Q,
                        param: Q,
                        style: J,
                        inList: t,
                        notdel: r,
                        disabled: B,
                        valid: E
                    });
                    o[P].hasAdd = 1
                }
            }
            for (var P = 0; P < v.length; ++P) {
                var C = v[P].id;
                if (C == -9) {
                    continue
                }
                var A = v[P].name;
                var l = v[P].defaultName;
                var J = v[P].style;
                var E = v[P].valid;
                var t = [];
                if (v[P].inList) {
                    t = v[P].inList
                }
                var r = false;
                if (v[P].notdel) {
                    r = true
                }
                var B = false;
                if (Fai.top._colId == Fai.top._panelOptionData.sysIndex && J == c.sysLocation) {
                    B = true
                }
                var D = 0;
                if (v[P].colNum) {
                    D = v[P].colNum
                }
                var Q = Site.getModuleIconClass(J, D);
                if (!v[P].global || $.inArray(C, Fai.top._delModuleIdList) != -1) {
                    continue
                }
                if ( !! !o[P].hasAdd) {
                    w.push({
                        id: C,
                        title: A,
                        defaultName: l,
                        className: Q,
                        param: Q,
                        style: J,
                        inList: t,
                        notdel: r,
                        disabled: B,
                        valid: E
                    });
                    o[P].hasAdd = 1
                }
            }
            for (var P = 0; P < v.length; ++P) {
                var C = v[P].id;
                if (C == -9) {
                    continue
                }
                var A = v[P].name;
                var l = v[P].defaultName;
                var J = v[P].style;
                var E = v[P].valid;
                var t = [];
                if (v[P].inList) {
                    t = v[P].inList
                }
                var r = false;
                if (v[P].notdel) {
                    r = true
                }
                var B = false;
                if (Fai.top._colId == Fai.top._panelOptionData.sysIndex && J == c.sysLocation) {
                    B = true
                }
                var D = 0;
                if (v[P].colNum) {
                    D = v[P].colNum
                }
                var Q = Site.getModuleIconClass(J, D);
                for (var M = 0; M < Fai.top._hiddenModuleList.length; ++M) {
                    if (C == Fai.top._hiddenModuleList[M].id) {
                        if ( !! !o[P].hasAdd) {
                            w.push({
                                id: C,
                                title: A,
                                defaultName: l,
                                className: Q,
                                param: Q,
                                style: J,
                                inList: t,
                                notdel: r,
                                disabled: B,
                                valid: E
                            });
                            o[P].hasAdd = 1
                        }
                        break
                    }
                }
            }
            for (var P = 0; P < v.length; P++) {
                var C = v[P].id;
                if (C != -9) {
                    continue
                }
                var S = v[P].mustModuleList;
                for (var N = 0; N < S.length; N++) {
                    var f = Site.getModuleData(S[N]);
                    if (f != null) {
                        C = f.id;
                        var A = f.name;
                        var l = f.defaultName;
                        var J = f.style;
                        var E = f.valid;
                        var t = [];
                        if (f.inList) {
                            t = f.inList
                        }
                        var r = false;
                        if (f.notdel) {
                            r = true
                        }
                        var B = false;
                        if (Fai.top._colId == Fai.top._panelOptionData.sysIndex && J == c.sysLocation) {
                            B = true
                        }
                        var D = 0;
                        if (v[P].colNum) {
                            D = v[P].colNum
                        }
                        var Q = Site.getModuleIconClass(J, D);
                        for (var M = 0; M < v.length; M++) {
                            if (v[M].id == C) {
                                if ( !! v[M].hasAdd) {
                                    break
                                } else {
                                    w.push({
                                        id: C,
                                        title: A,
                                        defaultName: l,
                                        className: Q,
                                        param: Q,
                                        style: J,
                                        inList: t,
                                        notdel: r,
                                        disabled: B,
                                        valid: E
                                    });
                                    v[M].hasAdd = 1
                                }
                            }
                        }
                    }
                }
            }
            H.push("		<div class='panelSectionModuleContent'>");
            H.push("				<ul class='panelModuleIconContainer'>");
            for (var P = 0; P < w.length; P++) {
                var n = w[P].title;
                var s = w[P].defaultName;
                var K = w[P].className;
                var m = w[P].param;
                var C = w[P].id;
                var J = w[P].style;
                var t = w[P].inList;
                var r = w[P].notdel;
                var B = w[P].disabled;
                var E = w[P].valid;
                var y = "none";
                var I = "none";
                var d = false;
                var x = Fai.top.$("#module" + C);
                var G = x.attr("_intab");
                var h = "";
                var R = "";
                var O = "Site.panelModuleCheck(" + C + "," + J + ',"panelNowModule");';
                var U = true;
                var L = "none";
                var p = true;
                if (r) {
                    U = false
                }
                if (G > 0) {
                    var F = Fai.top.$("#module" + G);
                    if (F.length > 0 && F.is(":visible")) {
                        y = "block";
                        I = "block";
                        d = true
                    }
                } else {
                    if (x.length > 0 && x.is(":visible")) {
                        y = "block";
                        I = "block";
                        d = true
                    }
                }
                if (!B) {
                    if (d) {
                        y = "block";
                        I = "block";
                        if (s != "" && s != n) {
                            R = '点击隐藏"' + n + '"\n此模块为系统模块"' + s + '"'
                        } else {
                            R = '点击隐藏"' + n + '"'
                        }
                    } else {
                        if (s != "" && s != n) {
                            R = '点击使用"' + n + '"\n此模块为系统模块"' + s + '"'
                        } else {
                            R = '点击使用"' + n + '"'
                        }
                    }
                } else {
                    y = "none";
                    I = "none";
                    var e = "当前页";
                    if (Fai.top._colId == Fai.top._panelOptionData.sysIndex) {
                        e = "首页"
                    }
                    h = "cursor:default;";
                    R = e + '不能使用"' + n + '"模块';
                    O = "Fai.ing('" + R + "');"
                }
                if (!E && d) {
                    if (g.sysMsgBoard == C && Fai.top._colId != z.sysMsgBoard) {} else {
                        L = "block";
                        y = "none";
                        I = "block";
                        h = "cursor:default;";
                        p = false;
                        O = "";
                        if (s != "" && s != n) {
                            R = '不能隐藏"' + n + '"\n此模块为系统模块"' + s + '"'
                        } else {
                            R = '不能隐藏"' + n + '"'
                        }
                    }
                }
                H.push("					<li id='panelNowModule" + C + "' class='panelModuleIconContent panelModuleIcon_" + K + " sectionModuleIcon' >");
                H.push("						<a href='javascript:;' class='panelModuleIcon' onclick='" + Fai.encodeHtml(O) + ";return false;' title='" + R + "' _cus='" + U + "' style='" + h + "'></a>");
                H.push("						<a href='javascript:;' class='panelModuleTitle' onclick='" + Fai.encodeHtml(O) + ";return false;' title='" + R + "'>" + n + "</a>");
                H.push("						<a id='nowModuleCheck" + C + "' class='panelCheckTip' href='javascript:;' onclick='" + Fai.encodeHtml(O) + ";return false;' style='display:" + y + ";' title='" + R + "'></a>");
                H.push("						<a id='nowModuleDisabled" + C + "' class='panelDisabledTip' href='javascript:;' onclick='return false;' style='display:" + L + ";' title='" + R + "'></a>");
                H.push("						<div class='nowModuleButtonDiv' style='display:none;'>");
                H.push("							<a href='javascript:;' onclick='Site.showThisModule(" + C + ");return false;' class='findButton' title='显示模块所在的位置' style='display:" + I + ";'></a>");
                if (J == 80) {
                    H.push("							<a href='javascript:;' onclick='Site.popupWindow({title:\"编辑通栏模块\", frameSrcUrl:\"manage/styleFullmeasure.jsp?id=" + C + "&colId=" + Fai.top._colId + "&extId=" + Fai.top._extId + "&ram=" + Math.random() + "\", width:\"480\", height:\"300\", saveBeforePopup:false});Site.removeAllEditLayer();return false;return false;' class='setButton' title='设置模块样式' style='display:" + I + ";'></a>")
                } else {
                    if (J == 82) {
                        H.push("							<a href='javascript:;' onclick='Site.popupWindow({title:\"编辑购物车模块\", frameSrcUrl:\"manage/shoppingCartModuleEdit.jsp?id=" + C + "&colId=" + Fai.top._colId + "&extId=" + Fai.top._extId + "&ram=" + Math.random() + "\", width:\"520\", height:\"380\", saveBeforePopup:false});Site.removeAllEditLayer();return false;return false;' class='setButton' title='设置模块样式' style='display:" + I + ";'></a>")
                    } else {
                        H.push("							<a href='javascript:;' onclick='Site.faiSettingPanel.init({\"id\":" + C + ', "styleId":' + J + ", \"entrance\":1});return false;' class='setButton' title='设置模块样式' style='display:" + I + ";'></a>")
                    }
                }
                if (!r && p) {
                    H.push("							<a href='javascript:;' onclick='Site.delModule(" + C + ', "' + Fai.encodeHtmlJs(n) + '", ' + J + ", [" + t + "]);return false;' class='delButton' title='删除模块'></a>")
                }
                H.push("						</div>");
                H.push("					</li>")
            }
            H.push("				</ul>");
            H.push("		</div>");
            b.find("#currentSectionModuleContainer").empty().append(H.join(""))
        }
    })
};
Site.updateOtherSectionModule = function(l) {
    var e = Fai.top.$("#faiFloatPanel");
    if (e.length < 1) {
        return
    }
    if (typeof l != "undefined" && l.length > 0) {
        var g = [];
        var p = $.parseJSON(Fai.top._panelOptionData.moduleStyleList);
        g.push("		<div class='panelSectionModuleContent'>");
        g.push("				<ul class='panelModuleIconContainer'>");
        for (var h = 0; h < l.length; h++) {
            var j = Fai.encodeHtml(l[h].title);
            var q = l[h].className;
            var f = l[h].param;
            var c = l[h].id;
            var b = l[h].style;
            var a = l[h].valid;
            var n = "none";
            var d = "点击使用模块";
            var o = "Site.panelModuleCheck(" + c + "," + b + ',"panelOtherModule")';
            var k = "";
            if (Fai.top.$("#module" + c).length > 0 && Fai.top.$("#module" + c).is(":visible")) {
                n = "block";
                d = "点击隐藏模块"
            }
            if (Fai.top._colId == Fai.top._panelOptionData.sysIndex && b == p.sysLocation) {
                n = "none";
                var m = "当前页";
                if (Fai.top._colId == Fai.top._panelOptionData.sysIndex) {
                    m = "首页"
                }
                k = "cursor:default;";
                d = m + '不能使用"' + j + '"模块';
                o = "Fai.ing('" + d + "');"
            }
            g.push("					<li id='panelOtherModule" + c + "' class='panelModuleIconContent panelModuleIcon_" + q + " sectionModuleIcon' >");
            g.push("						<a href='javascript:;' class='panelModuleIcon' onclick='" + Fai.encodeHtml(o) + ";return false;' title='" + d + "' style='" + k + "'></a>");
            g.push("						<a href='javascript:;' class='panelModuleTitle' onclick='" + Fai.encodeHtml(o) + ";return false;' title='" + d + "' style='" + k + "'>" + j + "</a>");
            g.push("						<a id='other_nowModuleCheck" + c + "' class='panelCheckTip' href='javascript:;' onclick='" + Fai.encodeHtml(o) + ";return false;' style='display:" + n + ";'></a>");
            g.push("					</li>")
        }
        g.push("				</ul>");
        g.push("		</div>");
        e.find("#otherSectionModuleContainer").empty().append(g.join(""))
    } else {
        Fai.top.$("#otherSectionModuleContainer").empty()
    }
};
Site.refreshOtherSectionSelecter = function(b) {
    var a = Fai.top.$("#faiFloatPanel").find("#otherSectionSelecterContainer");
    if (b == 1) {
        a.show()
    } else {
        a.hide()
    }
};
Site.getModuleIconClass = function(e, b) {
    var d = "sys";
    var a = Fai.top._panelOptionData.moduleIconClassList;
    for (var c = 0; c < a.length; c++) {
        if (a[c].style == e) {
            d = a[c].className
        }
    }
    switch (b) {
    case 2:
        d += "-two panelModuleIcon_mulModuleCol";
        break;
    case 3:
        d += "-three panelModuleIcon_mulModuleCol";
        break;
    case 4:
        d += "-four panelModuleIcon_mulModuleCol";
        break;
    case 5:
        d += "-five panelModuleIcon_mulModuleCol";
        break;
    default:
    }
    return d
};
Site.getChoiceSectionModule = function(e, o) {
    var k = [];
    if (e != -9) {
        if (e > 0) {
            $.ajax({
                type: "post",
                url: Site.genAjaxUrl("faiFloatPanel_h.jsp"),
                data: "cmd=appointSection&colId=" + e + "&extId=" + Fai.top._extId,
                error: function() {
                    Fai.ing("系统繁忙，请稍候重试", false)
                },
                success: function(x) {
                    var u = $.parseJSON(x);
                    for (var t = 0; t < u.length; t++) {
                        var w = u[t].name;
                        var s = u[t].id;
                        var q = u[t].style;
                        var i = u[t].valid;
                        var r = 0;
                        if (u[t].colNum) {
                            r = u[t].colNum
                        }
                        var v = Site.getModuleIconClass(q, r);
                        if ( !! i) {
                            k.push({
                                id: s,
                                title: w,
                                className: v,
                                param: v,
                                style: q,
                                valid: i
                            })
                        }
                    }
                    Site.updateOtherSectionModule(k)
                }
            })
        } else {
            Site.updateOtherSectionModule(k)
        }
    } else {
        if (typeof o == "undefined") {
            $.ajax({
                type: "post",
                url: Site.genAjaxUrl("faiFloatPanel_h.jsp"),
                data: "cmd=otherSection&colId=" + Fai.top._colId + "&extId=" + Fai.top._extId,
                error: function() {
                    Fai.ing("系统繁忙，请稍候重试", false)
                },
                success: function(B) {
                    Fai.top._panelOptionData.combinsList = $.parseJSON(B);
                    var A = Fai.top._panelOptionData.combinsList;
                    for (var w = 0; w < A.length; w++) {
                        var u = A[w];
                        if (u.id == e) {
                            var x = u.moduleList;
                            for (var v = 0; v < x.length; v++) {
                                var z = x[v].name;
                                var t = x[v].id;
                                var s = x[v].style;
                                var q = x[v].valid;
                                var r = 0;
                                if (x[v].colNum) {
                                    r = x[v].colNum
                                }
                                var y = Site.getModuleIconClass(s, r);
                                if ( !! q) {
                                    k.push({
                                        id: t,
                                        title: z,
                                        className: y,
                                        param: y,
                                        style: s,
                                        valid: q
                                    })
                                }
                            }
                            break
                        }
                    }
                    Site.updateOtherSectionModule(k)
                }
            })
        } else {
            var p = Fai.top._panelOptionData.combinsList;
            if (typeof p == "undefined") {
                $.ajax({
                    type: "post",
                    url: Site.genAjaxUrl("faiFloatPanel_h.jsp"),
                    data: "cmd=otherSection&colId=" + Fai.top._colId + "&extId=" + Fai.top._extId,
                    error: function() {
                        Fai.ing("系统繁忙，请稍候重试", false)
                    },
                    success: function(A) {
                        Fai.top._panelOptionData.combinsList = $.parseJSON(A);
                        p = Fai.top._panelOptionData.combinsList;
                        for (var w = 0; w < p.length; w++) {
                            var u = p[w];
                            if (u.id == e) {
                                var x = u.moduleList;
                                for (var v = 0; v < x.length; v++) {
                                    var z = x[v].name;
                                    var t = x[v].id;
                                    var s = x[v].style;
                                    var q = x[v].valid;
                                    var r = 0;
                                    if (x[v].colNum) {
                                        r = x[v].colNum
                                    }
                                    var y = Site.getModuleIconClass(s, r);
                                    if ( !! q) {
                                        k.push({
                                            id: t,
                                            title: z,
                                            className: y,
                                            param: y,
                                            style: s,
                                            valid: q
                                        })
                                    }
                                }
                                break
                            }
                        }
                        Site.updateOtherSectionModule(k)
                    }
                })
            } else {
                for (var h = 0; h < p.length; h++) {
                    var f = p[h];
                    if (f.id == e) {
                        var l = f.moduleList;
                        for (var g = 0; g < l.length; g++) {
                            var n = l[g].name;
                            var d = l[g].id;
                            var c = l[g].style;
                            var a = l[g].valid;
                            var b = 0;
                            if (l[g].colNum) {
                                b = l[g].colNum
                            }
                            var m = Site.getModuleIconClass(c, b);
                            if ( !! a) {
                                k.push({
                                    id: d,
                                    title: n,
                                    className: m,
                                    param: m,
                                    style: c,
                                    valid: a
                                })
                            }
                        }
                        break
                    }
                }
                Site.updateOtherSectionModule(k)
            }
        }
    }
};
Site.sectionModuleSelectChange = function(d, b) {
    if ( !! d) {
        Site.logDog(100082, 23)
    }
    var a = Fai.top.$("#panelOtherSectionSelecter");
    var c = a.val();
    if (c == Fai.top._colId) {
        Fai.top.$("#otherSectionModuleContainer").empty();
        Fai.top.$("#otherSectionSelecterPrompt").show()
    } else {
        Fai.top.$("#otherSectionSelecterPrompt").hide();
        Site.getChoiceSectionModule(c, b)
    }
};
Site.getModuleData = function(d) {
    var b = null;
    var c = Fai.top._panelOptionData.moduleDataList;
    for (var a = 0; a < c.length; a++) {
        if (c[a].id == d) {
            b = c[a];
            break
        }
    }
    return b
};
Site.showThisModule = function(b) {
    var d = Fai.top.$("#module" + b);
    var k = 0;
    Site.removeOverlay();
    if (d) {
        Fai.top.$("#g_main").scrollTop(0);
        var g = d.attr("_side");
        var a = b;
        var e = d.attr("_intab");
        var h = d.attr("_inmulmcol");
        if (e > 0) {
            var f = Fai.top.$("#module" + e);
            if (f.is(":visible") && d.is(":hidden")) {
                Fai.top.$("#formTabButton" + b).click()
            }
            g = f.attr("_side");
            a = e
        } else {
            if (h > 0) {
                g = Fai.top.$("#module" + h).attr("_side");
                a = h
            }
        }
        var j = Fai.top.$("#module" + a);
        if (g == 1) {
            d.trigger("mouseenter");
            Site.removeAllEditLayer();
            k = 300
        }
        if (k != 0) {
            if (typeof Fai.top.snapExpandModuleId != "undefined" && Fai.top.snapExpandModuleId != null && Fai.top.snapExpandModuleId != a) {
                Site.reSetSidePosition(Fai.top.$("#module" + Fai.top.snapExpandModuleId));
                Site.removeMoveFrame("module" + Fai.top.snapExpandModuleId);
                Fai.top.snapExpandModuleId = a
            } else {
                Fai.top.snapExpandModuleId = a
            }
        } else {
            if (typeof Fai.top.snapExpandModuleId != "undefined" && Fai.top.snapExpandModuleId != null) {
                Site.reSetSidePosition(Fai.top.$("#module" + Fai.top.snapExpandModuleId));
                Site.removeMoveFrame("module" + Fai.top.snapExpandModuleId);
                Fai.top.snapExpandModuleId = null
            }
        }
        var i = j.attr("_flutterSwitch");
        var c = j.attr("_side");
        if (c == 2) {
            Site.stopFlutterInterval(j);
            j.attr("_flutterSwitch", true);
            k = 300
        }
        setTimeout(function() {
            Site.scrollToModuleDiv(d);
            Site.triggerGobalEvent("showFindModuleDiv", b);
            Site.displayAddModule()
        },
        k)
    }
};