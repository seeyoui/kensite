Site.ImageEffect = !!Site.ImageEffect ? Site.ImageEffect: {}; (function(a, c, b) {
    c.DATA = {};
    c.DATA.imageEffectHtml = "<div class='imageEffects imageEffectsAnimate'></div>";
    c.DATA.KEY = {
        OPT_MODULE_ID: "moduleId",
        OPT_IMG_EFF_OPTION: "imgEffOption",
        OPT_TG_OPTION: "tagetOption",
        OPT_CALLBACK: "callback",
        OPT_CALLBACK_ARGS: "callbackArgs",
        FULL_MASK_BG_STYLE: "fmbgs",
        FULL_MASK_NAME_STYLE: "fmns",
        FULL_MASK_NAME_ALIG: "fmna",
        FULL_MASK_DISC_STYLE: "fmds",
        FULL_MASK_DISC_ALIG: "fmda",
        FULL_MASK_CUS_BG: "fullMaskCusBg",
        FULL_MASK_CUS_NAME: "fullMaskCusName",
        FULL_MASK_CUS_DISC: "fullMaskCusDisc",
        FULL_MASK_OPEN_DISC: "fullMaskOpenDisc",
        ALIG: {
            CENTER: 1,
            LEFT: 2,
            RIGHT: 3
        }
    };
    c.FUNC = {
        BASIC: {},
        BUS: {},
        TOOL: {}
    };
    c.ITF = {
        cardTd: Site.bindImageEffectCusEvent_photo,
        "photo-container": Site.bindImageEffectCusEvent_photo,
        photoForm: Site.bindImageEffectCusEvent_photo,
        photoMarqueeForm: Site.bindImageEffectCusEvent_photo,
        photoSmallPic_table: Site.bindImageEffectCusEvent_photo,
        productTileForm: Site.bindImageEffectCusEvent_product,
        productMarqueeForm: Site.bindImageEffectCusEvent_product,
        "product-container": Site.bindImageEffectCusEvent_product,
        productDoublePicListForm: Site.bindImageEffectCusEvent_product,
        containerLeft: Site.bindImageEffectCusEvent_product,
        productHotTextListHot: Site.bindImageEffectCusEvent_product,
        productPicListForm: Site.bindImageEffectCusEvent_product
    }
})(jQuery, Site.ImageEffect); (function(a, c, b) {
    c.FUNC.TOOL.resetImgEff = function(d, f, l, o) {
        var g = d.targetParent;
        var h = a(f).find("img");
        var m = a(h).position().top;
        var e = a(h).position().left;
        var k = a(h).width();
        var j = a(h).height();
        var n = a(h).css("margin-left");
        var i = a(l).css("border-left-width");
        n = c.FUNC.TOOL.parsePixelToInt(n);
        i = c.FUNC.TOOL.parsePixelToInt(i);
        if (g == "photoSmallPic_table") {
            a(l).css("left", e + n).css("top", m);
            a(l).css("width", k - (i * 2) + "px");
            a(l).css("height", j - (i * 2) + "px")
        }
        if (g == "photo-container" || g == "product-container") {
            if (o != 5) {
                a(l).css("left", e + n).css("top", m)
            } else {
                a(l).css("left", e + n)
            }
        }
    };
    c.FUNC.TOOL.parsePixelToInt = function(d) {
        var e;
        if (typeof d == "undefined" || d == "auto") {
            e = 0
        } else {
            e = parseInt(d.replace("px"))
        }
        return e
    };
    c.FUNC.TOOL.colorRgb = function(e) {
        var g = /^#([0-9a-fA-f]{3}|[0-9a-fA-f]{6})$/;
        var e = e.toLowerCase();
        var d = "#";
        var h = [];
        if (e && g.test(e)) {
            if (e.length === 4) {
                for (var f = 1; f < 4; f += 1) {
                    d += e.slice(f, f + 1).concat(e.slice(f, f + 1))
                }
                e = d
            }
            for (var f = 1; f < 7; f += 2) {
                h.push(parseInt("0x" + e.slice(f, f + 2)))
            }
            return h.join(",")
        } else {
            return e
        }
    }
})(jQuery, Site.ImageEffect); (function(d, f, e) {
    f.FUNC.BUS.bindImgEffCusEvent = function(h, g) {
        if (typeof f.ITF[g.targetParent] == "function") {
            f.ITF[g.targetParent](h, g)
        }
    };
    f.FUNC.BUS.ImgEffAnimate = function(l, g, j, k) {
        var i = {
            hover: {},
            leave: {}
        };
        var h = d(g).attr("fk_fixed");
        if ( !! !h) {
            if (d(k).hasClass("cardDiv")) {
                c(g, j, k)
            } else {
                b(g, j)
            }
        }
        a(i, g, j);
        if (!Fai.isIE()) {
            if (l == "mouseenter") {
                d(g).css(i.hover)
            } else {
                if (l == "mouseleave") {
                    d(g).css(i.leave)
                }
            }
        } else {
            if (l == "mouseenter") {
                d(g).stop().animate(i.hover, 250)
            } else {
                if (l == "mouseleave") {
                    d(g).stop().animate(i.leave, 250)
                }
            }
        }
    };
    function a(p, q, i) {
        var n = i.effType;
        var o = 1;
        var k;
        if (d(q).parent().hasClass("cardDiv")) {
            k = d(q).parent()
        }
        if (Fai.isIE6() || Fai.isIE7() || Fai.isIE8()) {
            if (i.backgroundType) {
                o = i.fullmaskBackgroundOpacity
            } else {
                o = 80
            }
            if (i[f.DATA.KEY.FULL_MASK_CUS_BG]) {
                var h = i[f.DATA.KEY.FULL_MASK_BG_STYLE];
                if (typeof h == "string" && h.length > 0) {
                    var g = d.parseJSON(h);
                    o = typeof g.o == "number" ? g.o: 80
                }
            }
            o /= 100
        }
        switch (n) {
        case 2:
            p.hover.opacity = 1;
            p.leave.opacity = 0;
            break;
        case 3:
            p.hover.opacity = 1;
            p.leave.opacity = 0;
            break;
        case 4:
            p.hover.opacity = o;
            p.leave.opacity = 0;
            break;
        case 5:
            d(q).css("opacity", 1);
            p.hover.bottom = 0;
            p.leave.bottom = "-" + d(q).height() + "px";
            var j;
            if (k && k.length > 0) {
                j = parseFloat(k.css("margin-top").replace("px", "")) || 0;
                p.hover.bottom = -j;
                p.leave.bottom = ( - j - d(q).height()) + "px"
            }
            break;
        case 6:
            var m = parseInt(d(q).attr("_initWidth"));
            var l = parseInt(d(q).attr("_initHeight"));
            p.hover.width = m + 50;
            p.hover["margin-left"] = "-25px";
            p.hover.height = l + 50;
            p.hover["margin-top"] = "-25px";
            p.leave.width = m;
            p.leave["margin-left"] = "0px";
            p.leave.height = l;
            p.leave["margin-top"] = "0px";
            break;
        case 7:
            p.hover["margin-left"] = "-10px";
            p.leave["margin-left"] = "0px";
            break
        }
    }
    function b(s, l) {
        var q = l.effType;
        if (q == 4) {
            var t = d(s).find(".props .propList");
            var g = d(t).height();
            var n = d(s).height();
            var p = ((n - g) / 2);
            d(t).css("padding-top", p + "px")
        }
        if (q == 5) {
            var t = d(s).find(".props .propList");
            var k = d(s).find(".props .propBuy");
            var i = d(t).height();
            var m = parseInt(d(t).css("padding-top"));
            var o = parseInt(d(t).css("margin-bottom"));
            var r = d(s).parent().find("img").position().left;
            i += m + o;
            if (d(k).length > 0) {
                var j = parseInt(d(k).css("margin-top"));
                var h = d(k).height() + j + 8;
                i += h
            }
            d(s).css({
                height: i + "px",
                bottom: "-" + i + "px",
                left: r + "px"
            })
        }
        d(s).attr("fk_fixed", 1)
    }
    function c(j, r, z) {
        var s = r.effType;
        var A, p, v;
        if (s == 4) {
            var h = d(z).parent();
            d(j).css({
                width: h.width() + "px",
                height: h.height() + "px"
            });
            var n = d(j).find(".props .propList");
            var q = d(n).height();
            var t = d(j).height();
            var y = ((t - q) / 2);
            d(n).css("padding-top", y + "px")
        } else {
            if (s == 5) {
                var j = d(z).find(".imageEffects");
                A = d(z).parent();
                p = d(A).width();
                v = d(A).height();
                var m = d(A).css("margin-left"),
                l = parseFloat(d(z).css("margin-left").replace("px", ""));
                var m = f.FUNC.TOOL.parsePixelToInt(m);
                d(j).removeClass("imageEffectsAnimate").addClass("imageEffectsAnimate_Half");
                d(j).css("width", p);
                var g = d(n).height(),
                n = d(j).find(".props .propList"),
                u = d(j).find(".props .propBuy"),
                g = d(n).height(),
                w = parseInt(d(n).css("padding-top")),
                o = parseInt(d(n).css("margin-bottom")),
                i = d(j).parent().find("img").position().left;
                g += w + o;
                if (d(u).length > 0) {
                    var k = parseInt(d(u).css("margin-top"));
                    var x = d(u).height() + k + 8;
                    g += x
                }
                d(j).css("height", g + "px");
                d(j).css({
                    "padding-left": ( - l) + "px"
                })
            } else {
                if (s == 6) {
                    A = d(z).find("img");
                    p = A.width();
                    v = A.height();
                    if (p == 0 || v == 0) {
                        return
                    }
                    d(A).attr("_initWidth", p).attr("_initHeight", v)
                } else {
                    if (s == 7) {
                        A = d(z).find("img");
                        p = A.width();
                        if (p == 0) {
                            return
                        }
                        A.css("width", p + 10 + "px")
                    }
                }
            }
        }
        d(j).attr("fk_fixed", 1)
    }
})(jQuery, Site.ImageEffect); (function(f, h, g) {
    h.FUNC.BASIC.Init = function(j) {
        var m = {};
        m[h.DATA.KEY.OPT_MODULE_ID] = 0;
        m[h.DATA.KEY.OPT_IMG_EFF_OPTION] = {};
        m[h.DATA.KEY.OPT_TG_OPTION] = {};
        m[h.DATA.KEY.OPT_CALLBACK] = g;
        m[h.DATA.KEY.OPT_CALLBACK_ARGS] = g;
        if ( !! !e(j, m)) {
            return
        }
        var l = f("#module" + m[h.DATA.KEY.OPT_MODULE_ID]);
        var k = m[h.DATA.KEY.OPT_IMG_EFF_OPTION].effType;
        if (k == 1 || Fai.isNull(l)) {
            return
        }
        var n = f(l).find(".imageEffects");
        var i = f(l).find("." + m[h.DATA.KEY.OPT_TG_OPTION].target);
        if (f(n).length > 0) {
            f(n).remove()
        }
        f.each(i,
        function(o, p) {
            if (k > 1 && k < 6) {
                h.FUNC.BASIC.CreateGE(p, m);
                h.FUNC.BUS.bindImgEffCusEvent(p, m[h.DATA.KEY.OPT_TG_OPTION]);
                if (k == 4 || k == 5) {
                    if (!Fai.isNull(m[h.DATA.KEY.OPT_CALLBACK])) {
                        m[h.DATA.KEY.OPT_CALLBACK](p, m[h.DATA.KEY.OPT_IMG_EFF_OPTION], m[h.DATA.KEY.OPT_TG_OPTION], m[h.DATA.KEY.OPT_CALLBACK_ARGS])
                    }
                }
            } else {
                if (k <= 7) {
                    h.FUNC.BASIC.CreateSP(p, m)
                }
            }
        });
        if (k == 8) {
            Site.hoverChangeImage()
        } else {
            f(i).bind("mouseenter mouseleave",
            function(p) {
                var o = f(this).find(".imageEffects");
                if (k < 6) {
                    h.FUNC.TOOL.resetImgEff(m[h.DATA.KEY.OPT_TG_OPTION], this, o, k)
                } else {
                    if (k <= 8) {
                        o = f(this).find("img")
                    }
                }
                if (p.type == "mouseenter") {
                    if (k > 1 && k <= 7) {
                        h.FUNC.BUS.ImgEffAnimate("mouseenter", o, m[h.DATA.KEY.OPT_IMG_EFF_OPTION], this)
                    }
                } else {
                    if (k > 1 && k <= 7) {
                        h.FUNC.BUS.ImgEffAnimate("mouseleave", o, m[h.DATA.KEY.OPT_IMG_EFF_OPTION], this)
                    }
                }
            })
        }
    };
    h.FUNC.BASIC.CreateGE = function(j, i) {
        c(j, i);
        b(j, i)
    };
    h.FUNC.BASIC.CreateSP = function(j, i) {
        a(j, i);
        d(j, i)
    };
    function e(i, j) {
        if (i.length == 0) {
            return false
        }
        if (i[h.DATA.KEY.OPT_MODULE_ID] == 0) {
            return false
        }
        f.extend(j, i);
        return true
    }
    function c(j, i) {
        var k = !Fai.isNull(f(j).find("a")) && f(j).find("a").length != 0;
        if (k) {
            f(j).find("a").after(h.DATA.imageEffectHtml)
        } else {
            f(j).find("img").after(h.DATA.imageEffectHtml)
        }
    }
    function b(D, C) {
        f(D).css("position", "relative").css("overflow", "hidden");
        if (Fai.isIE6() && C[h.DATA.KEY.OPT_TG_OPTION].targetParent == "photoSmallPic_table") {
            f(D).removeAttr("style")
        }
        var v = C[h.DATA.KEY.OPT_IMG_EFF_OPTION].effType;
        var l = f(D).find(".imageEffects"),
        y = (v == 2) ? "imageEffects_Border": (v == 3) ? "imageEffects_Magnifier": (v == 4) ? "imageEffects_FullMaks": (v == 5) ? "imageEffects_HalfMaks": "";
        var x = {
            bw: (C[h.DATA.KEY.OPT_IMG_EFF_OPTION].borderType) ? C[h.DATA.KEY.OPT_IMG_EFF_OPTION].borderWidth: 1,
            bs: (C[h.DATA.KEY.OPT_IMG_EFF_OPTION].borderType) ? C[h.DATA.KEY.OPT_IMG_EFF_OPTION].borderStyle: 1,
            bc: (C[h.DATA.KEY.OPT_IMG_EFF_OPTION].borderType) ? C[h.DATA.KEY.OPT_IMG_EFF_OPTION].borderColor: "#000"
        },
        B = (x.bs == 1) ? "solid": (x.bs == 2) ? "dotted": (x.bs == 3) ? "dashed": "",
        w = C[h.DATA.KEY.OPT_IMG_EFF_OPTION][h.DATA.KEY.FULL_MASK_BG_STYLE],
        j = {
            fbc: C[h.DATA.KEY.OPT_IMG_EFF_OPTION].fullmaskBackgroundColor,
            fbo: C[h.DATA.KEY.OPT_IMG_EFF_OPTION].fullmaskBackgroundOpacity
        },
        o = {
            color: "#555555",
            opacity: 80
        };
        var F, t, A, q, r, k, E, n;
        if (C.moduleType == "photoCard") {
            F = f(D).parent();
            t = f(F).width();
            A = f(F).height();
            q = f(F).css("margin-left");
            imgMarginTop = f(F).css("margin-top");
            r = f(F).position().top;
            k = f(F).position().left;
            E = parseFloat(f(D).css("margin-top").replace("px", ""));
            n = parseFloat(f(D).css("margin-left").replace("px", ""))
        } else {
            F = f(D).find("img");
            t = f(F).width();
            A = f(F).height();
            q = f(F).css("margin-left");
            r = f(F).position().top;
            k = f(F).position().left
        }
        var p = Fai.isIE6() || Fai.isIE7() || Fai.isIE8();
        var m = C[h.DATA.KEY.OPT_IMG_EFF_OPTION].backgroundType;
        if (typeof j == "object" && m) {
            o.color = j.fbc.length != 0 ? j.fbc: o.color;
            o.opacity = typeof j.fbo == "number" ? j.fbo: o.opacity
        }
        var s = C[h.DATA.KEY.OPT_IMG_EFF_OPTION][h.DATA.KEY.FULL_MASK_CUS_BG];
        if (typeof w == "string" && w.length != 0 && s) {
            w = f.parseJSON(w);
            o.color = w.c.length != 0 ? w.c: o.color;
            o.opacity = typeof w.o == "number" ? w.o: o.opacity
        }
        q = h.FUNC.TOOL.parsePixelToInt(q);
        switch (v) {
        case 1:
            f(l).css("top", r);
            break;
        case 2:
            t -= x.bw * 2;
            A -= x.bw * 2;
            f(l).css("border", x.bw + "px " + B + " " + x.bc);
            f(l).css("top", r);
            break;
        case 3:
            f(l).css("top", r);
            break;
        case 4:
            var z = o.color;
            if (!p) {
                var i = h.FUNC.TOOL.colorRgb(o.color);
                var u = i.split(",");
                z = "rgba(" + u[0] + ", " + u[1] + ", " + u[2] + ", " + o.opacity / 100 + ")"
            }
            f(l).css("background", z);
            f(l).css("top", r);
            break;
        case 5:
            f(l).removeClass("imageEffectsAnimate").addClass("imageEffectsAnimate_Half");
            f(l).css("bottom", "-" + A + "px");
            break;
        case 6:
            f(l).css("top", r);
            break;
        case 7:
            f(l).css("top", r);
            break
        }
        f(l).css("width", t).css("height", A + "px");
        if (C.moduleType == "photoCard") {
            if (v != 5) {
                f(l).css({
                    top: ( - E) + "px"
                });
                f(l).css({
                    left: ( - n) + "px"
                })
            } else {
                f(l).css({
                    "padding-left": ( - n) + "px"
                })
            }
        } else {
            f(l).css("left", k + q)
        }
        f(l).addClass(y)
    }
    function a(m, l) {
        var k = f(m).find("img");
        if (l[h.DATA.KEY.OPT_IMG_EFF_OPTION].effType == 6) {
            var j = f(k).width();
            var i = f(k).height();
            if (j == 0 || i == 0) {
                return
            }
            f(k).attr("_initWidth", j).attr("_initHeight", i)
        }
        if (l[h.DATA.KEY.OPT_IMG_EFF_OPTION].effType == 7) {
            var j = f(k).width();
            if (j == 0) {
                return
            }
            f(k).css("width", j + 10 + "px")
        }
    }
    function d(j, i) {
        var k = (i[h.DATA.KEY.OPT_IMG_EFF_OPTION].effType == 6) ? "imageEffectsAnimate_Magnify": "imageEffectsAnimate_MoveLeft";
        f(j).css({
            overflow: "hidden"
        });
        f(j).find("img").addClass(k).css("margin", "0px")
    }
})(jQuery, Site.ImageEffect);