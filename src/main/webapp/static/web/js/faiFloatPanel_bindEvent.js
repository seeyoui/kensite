Site.bindEventToFloatPanel = function(d) {
    var ah = d;
    var Y = true;
    var ag;
    var w;
    var v = Fai.top._panelOptionData.allowedStyle || (top._templateType != Fai.top._panelOptionData.templateType_free);
    var ap = !Fai.top._panelOptionData.allowedStyle && (top._templateType == Fai.top._panelOptionData.templateType_free);
    var aG = 1;
    var aa = "#000";
    var aw = "#000";
    var al = "#000";
    var o = "#000";
    var R = "#000";
    var c = "#000";
    var r = "#000";
    var O = "#000";
    var af = "#000";
    var ax = "#000";
    var g = "#000";
    var ad = 0;
    Fai.top.faiFullmeasureEdit = false;
    $(window).resize(function() {
        Site.refreshPanelStyle()
    });
    var N;
    var X = false;
    ah.mouseleave(function() {
        N = setTimeout(function() {},
        100);
        Fai.top.$(".colorpanel").mouseenter(function() {
            clearTimeout(N)
        })
    }).mouseover(function() {
        clearTimeout(N);
        X = true
    });
    ah.find("select").mousedown(function() {
        clearTimeout(N);
        X = false
    }).focusin(function() {
        clearTimeout(N);
        X = false
    });
    ah.find(".faiButton").mousedown(function() {
        X = false
    });
    var f = ah.find("#addModuleContentContainer");
    var z = ah.find("#setSiteStyleContentContainer");
    var ao = ah.find("#addModuleContentContainerTopLine");
    var aE = ah.find("#setSiteStyleContentContainerTopLine");
    var y = ah.find("#setSiteStyleMenuList").children("li");
    y.eq(0).addClass("on");
    y.children(".menu").hover(function() {
        $(this).parent().addClass("hover")
    },
    function() {
        $(this).parent().removeClass("hover")
    }).click(function() {
        y.removeClass("on");
        $(this).parent().addClass("on");
        if (Fai.isIE6() || Fai.isIE7()) {
            z.scrollTop(0).scrollTop(ah.find("#" + $(this).attr("nav")).offset().top - aE.offset().top)
        } else {
            z.mCustomScrollbar("scrollTo", "#" + $(this).attr("nav") + "", {
                scrollInertia: 0
            })
        }
    });
    var U = ah.find("#addModuleMenuList").children("li");
    U.eq(0).addClass("on");
    U.children(".menu").hover(function() {
        $(this).parent().addClass("hover")
    },
    function() {
        $(this).parent().removeClass("hover")
    }).click(function() {
        U.removeClass("on");
        $(this).parent().addClass("on");
        if (Fai.isIE6() || Fai.isIE7()) {
            f.scrollTop(0).scrollTop(ah.find("#" + $(this).attr("nav")).offset().top - ao.offset().top)
        } else {
            f.mCustomScrollbar("scrollTo", "#" + $(this).attr("nav") + "", {
                scrollInertia: 0
            })
        }
    });
    var J = ah.find("#sectionModuleMenuList").children("li");
    J.eq(0).addClass("on");
    ah.find("#" + J.eq(0).children(".menu").attr("nav")).show().siblings().hide();
    J.children(".menu").hover(function() {
        $(this).parent().addClass("hover")
    },
    function() {
        $(this).parent().removeClass("hover")
    }).click(function() {
        J.removeClass("on");
        $(this).parent().addClass("on");
        ah.find("#" + $(this).attr("nav")).show().siblings().hide()
    });
    if (Fai.isIE6() || Fai.isIE7()) {
        f.scroll(function() {
            var aJ = ao.offset().top - 20;
            $.each(Fai.top.$("#addModuleContentContainer .splitLine"),
            function(aK, aL) {
                if (($(aL).offset().top - aJ) > 0) {
                    U.removeClass("on").eq(aK).addClass("on");
                    return false
                }
            })
        });
        z.scroll(function() {
            var aJ = aE.offset().top - 20;
            $.each(Fai.top.$("#setSiteStyleContentContainer .splitLine"),
            function(aK, aL) {
                if (($(aL).offset().top - aJ) > 0) {
                    y.removeClass("on").eq(aK).addClass("on");
                    return false
                }
            })
        })
    }
    var ay = f.find(".panelModuleIcon");
    ay.click(function() {
        X = false
    });
    Fai.top.panelFunc = {};
    Fai.top.panelFunc.changeSiteWidth = function(aK) {
        var aJ;
        aJ = Site.getWebBackgroundData();
        if (aK == 0) {
            $("#setBackgroundWidth-box").hide();
            aJ.sw = -1;
            Site.removeSiteWidth()
        } else {
            aJ.sw = ag;
            Site.setSiteWidth(ag + "px");
            $("#setBackgroundWidth-box").show();
            if (ad == 1) {
                ad = 2
            }
        }
        if (!Y) {
            Site.saveWebBackgroundData(aJ);
            x();
            Site.logDog(100080, 1)
        }
        Site.fixSiteWidth(Fai.top._manageMode);
        Site.showNavItemContainer();
        Site.adjustBannerWidth();
        Site.adjustPhotoCard();
        if (ad == 0) {
            ad = 1
        } else {
            if (ad == 1 && aK == 0) {
                ad = 3
            } else {
                if (ad == 2) {
                    ad = 3
                } else {
                    if (ad == 3) {
                        Site.LayoutMiddleLeftRightReset()
                    }
                }
            }
        }
    };
    Fai.top.panelFunc.changeWebBg = function(aK) {
        var aJ;
        aJ = Site.getWebBackgroundData();
        if (aK == 1) {
            Site.hideSiteBg();
            aJ.h = true;
            aJ.s = false;
            $("#cusPanel").hide()
        } else {
            if (aK == 2) {
                var aL = "";
                $("#cusPanel").show();
                aJ.h = false;
                aJ.s = false;
                if (aJ.o == "") {
                    aJ.o = "#fff"
                }
                if (aJ.r == -1) {
                    $("#bgEffect").hide();
                    aL = h(aJ);
                    Site.setSiteBg(aL, aJ.o)
                } else {
                    $("#bgEffect").show();
                    if (aJ.e == 0) {
                        $("#scrollEffect").click()
                    } else {
                        $("#fixedEffect").click()
                    }
                }
            } else {
                Site.removeSiteBg();
                aJ.h = false;
                aJ.s = true;
                $("#cusPanel").hide()
            }
        }
        Site.saveWebBackgroundData(aJ);
        if (!Y) {
            x();
            Site.logDog(100080, 2)
        }
    };
    Fai.top.panelFunc.changeWebBgEffect = function(aK) {
        var aJ;
        var aL = "";
        aJ = Site.getWebBackgroundData();
        aL = h(aJ);
        aJ.e = aK;
        Site.saveWebBackgroundData(aJ);
        if (aK == 0) {
            aL += " scroll"
        }
        Site.setSiteBg(aL, aJ.o, aK);
        x();
        if (!Y) {}
    };
    Fai.top.panelFunc.bgDisplayChange = function(aL) {
        var aJ;
        aJ = Site.getWebBackgroundData();
        var aM = "";
        var aK = $("#bgDisplay").val();
        aK = parseInt(aK);
        aJ.r = aK;
        if (aJ.r == -1) {
            $("#bgEffect").hide();
            aM = h(aJ);
            Site.setSiteBg(aM, aJ.o);
            x()
        } else {
            $("#bgEffect").show();
            if (aJ.e == 0) {
                $("#scrollEffect").click()
            } else {
                $("#fixedEffect").click()
            }
        }
        if (!aJ.p) {
            if (aL.value != -1) {
                Fai.ing("请先添加背景图片。", true);
                return
            }
        }
        Site.showRepeatTip(aK);
        aJ.s = false;
        Site.saveWebBackgroundData(aJ)
    };
    Fai.top.panelFunc.view = function(aJ) {
        var aK = "../view.jsp?fileID=" + aJ;
        window.open(aK)
    };
    Fai.top.panelFunc.changeBlockStatus = function(aJ, aK) {
        aJ ? $("#" + aK).show() : $("#" + aK).hide()
    };
    Fai.top.panelFunc.refreshHeaderTop = function() {
        if ($("#topStyleCustom").attr("checked")) {
            var aJ = $("#settingHeightInput").val();
            if (aJ == "") {
                Fai.ing("高度设置不能为空", true);
                return
            } else {
                if (aJ < 0 || aJ > 1000) {
                    Fai.ing("只能设置0~1000的高度", true);
                    return
                } else {
                    if (!Fai.isNumber(aJ)) {
                        Fai.ing("只能输入数字", true);
                        $("#settingHeightInput").val("");
                        return
                    }
                }
            }
            if (!isNaN(parseInt(aJ))) {
                Site.setHeaderTopHeight(aJ)
            }
        } else {
            Site.autoHeaderTopHeight()
        }
        if (!Y) {
            az();
            Site.logDog(100080, 3)
        }
    };
    Fai.top.panelFunc.changeHeadBgType = function(aJ) {
        if (aJ == 1) {
            $("#headBgCus").hide()
        } else {
            if (aJ == 2) {
                $("#headBgCus").show()
            } else {
                $("#headBgCus").hide()
            }
        }
        if (Y) {
            return
        }
        var aK;
        aK = Site.getHeaderStyleData();
        if (aJ == 1) {
            aK.y = 1;
            Site.hideHeaderBg();
            az()
        } else {
            if (aJ == 2) {
                aK.y = 2;
                ae();
                az()
            } else {
                aK.y = 0;
                Site.removeHeaderBg();
                az()
            }
        }
        if (!Y) {
            Site.logDog(100080, 4)
        }
    };
    Fai.top.panelFunc.headBgRepeatChange = function(aK) {
        var aJ;
        aJ = Site.getHeaderStyleData();
        var aL = parseInt($("#headBgRepeat").val());
        aJ.r = aL;
        if (!aJ.f) {
            if (aK.value != -1) {
                Fai.ing("请先添加背景图片。", true);
                return
            }
        }
        Site.showRepeatTip(aL);
        ae();
        az()
    };
    Fai.top.panelFunc.refreshBannerBgHeight = function() {
        var aK = Site.getWebBackgroundData();
        if ($("#topBannerCustom").attr("checked")) {
            var aJ = $("#settingBannerHeightInput").val();
            if (aJ == "") {
                Fai.ing("高度设置不能为空", true);
                return
            } else {
                if (aJ < 0 || aJ > 1000) {
                    Fai.ing("只能设置0~1000的高度", true);
                    return
                } else {
                    if (!Fai.isNumber(aJ)) {
                        Fai.ing("只能输入数字", true);
                        $("#settingBannerHeightInput").val("");
                        return
                    }
                }
            }
            if (!isNaN(parseInt(aJ))) {
                aK.wbh = parseInt(aJ);
                Site.setWebBannerHeight(aJ)
            }
        } else {
            aK.wbh = -1;
            var aL = Fai.top.$("#banner");
            aL.css({
                height: aL.attr("normalheight") + "px"
            });
            Site.autoWebBannerHeight()
        }
        Site.saveWebBackgroundData(aK);
        x("banner");
        if (!Y) {
            Site.logDog(100080, 5);
            Site.refreshBanner()
        }
    };
    Fai.top.panelFunc.changeBannerWidth = function(aK) {
        var aJ;
        aJ = Site.getWebBackgroundData();
        if (aK == 0) {
            $("#setBannerWidth-box").hide();
            aJ.wbw = -1;
            Site.autoWebBannerWidth()
        } else {
            aJ.wbw = w;
            Site.setWebBannerWidth(w);
            $("#setBannerWidth-box").show()
        }
        Site.adjustBannerWidth();
        if (!Y) {
            Site.saveWebBackgroundData(aJ);
            x("banner");
            Site.refreshBanner();
            Site.logDog(100080, 13)
        }
    };
    Fai.top.panelFunc.changeBannerBg = function(aL) {
        var aK;
        aK = Site.getBannerBackgroundData();
        if (aL == 1) {
            $("#cusBannerPanel").hide();
            aK.y = 1;
            Site.hideBannerBg()
        } else {
            if (aL == 2) {
                var aJ = "";
                $("#cusBannerPanel").show();
                aK.y = 2;
                aJ = m(aK);
                Site.setBannerBg(aJ)
            } else {
                $("#cusBannerPanel").hide();
                aK.y = 0;
                Site.removeBannerBg()
            }
        }
        Site.saveBannerBackgroundData(aK);
        if (!Y) {
            x("banner");
            Site.logDog(100080, 6)
        }
    };
    Fai.top.panelFunc.bannerBgRepeatChange = function(aM) {
        var aK;
        aK = Site.getBannerBackgroundData();
        var aJ = "";
        var aL = $("#bannerBgDisplay").val();
        aL = parseInt(aL);
        aK.r = aL;
        if (!aK.f) {
            if (aM.value != -1) {
                Fai.ing("请先添加背景图片。", true);
                return
            }
        }
        Site.showRepeatTip(aL);
        aK.y = 2;
        Site.saveBannerBackgroundData(aK);
        aJ = m(aK);
        Site.setBannerBg(aJ);
        x("banner")
    };
    Fai.top.panelFunc.changeContentBg = function(aL) {
        var aJ;
        aJ = Site.getContentBackgroundData();
        if (aL == 1) {
            $("#cusContentPanel").hide();
            aJ.y = 1;
            Site.hideContentBg()
        } else {
            if (aL == 2) {
                var aK = "";
                $("#cusContentPanel").show();
                aJ.y = 2;
                aK = E(aJ);
                Site.setContentBg(aK, "none")
            } else {
                $("#cusContentPanel").hide();
                aJ.y = 0;
                Site.removeContentBg()
            }
        }
        Site.saveContentBackgroundData(aJ);
        if (!Y) {
            x("content");
            Site.logDog(100080, 7)
        }
    };
    Fai.top.panelFunc.contentBgRepeatChange = function(aM) {
        var aJ;
        aJ = Site.getContentBackgroundData();
        var aK = "";
        var aL = $("#contentBgDisplay").val();
        aL = parseInt(aL);
        aJ.r = aL;
        if (!aJ.f) {
            if (aM.value != -1) {
                Fai.ing("请先添加背景图片。", true);
                return
            }
        }
        Site.showRepeatTip(aL);
        aJ.y = 2;
        Site.saveContentBackgroundData(aJ);
        aK = E(aJ);
        Site.setContentBg(aK, "none");
        x("content")
    };
    Fai.top.panelFunc.changeContentMiddleBg = function(aL) {
        var aJ;
        aJ = Site.getContentMiddleBackgroundData();
        if (aL == 1) {
            $("#cusContentMiddlePanel").hide();
            aJ.y = 1;
            Site.hideContentMiddleBg()
        } else {
            if (aL == 2) {
                var aK = "";
                $("#cusContentMiddlePanel").show();
                aJ.y = 2;
                aK = L(aJ);
                Site.setContentMiddleBg(aK)
            } else {
                $("#cusContentMiddlePanel").hide();
                aJ.y = 0;
                Site.removeContentMiddleBg()
            }
        }
        Site.saveContentMiddleBackgroundData(aJ);
        if (!Y) {
            x("content");
            Site.logDog(100080, 14)
        }
    };
    Fai.top.panelFunc.contentMiddleBgRepeatChange = function(aM) {
        var aJ;
        aJ = Site.getContentMiddleBackgroundData();
        var aK = "";
        var aL = $("#contentMiddleBgDisplay").val();
        aL = parseInt(aL);
        aJ.r = aL;
        if (!aJ.f) {
            if (aM.value != -1) {
                Fai.ing("请先添加背景图片。", true);
                return
            }
        }
        Site.showRepeatTip(aL);
        aJ.y = 2;
        Site.saveContentMiddleBackgroundData(aJ);
        aK = L(aJ);
        Site.setContentMiddleBg(aK);
        x("content")
    };
    Fai.top.panelFunc.changeContentLeftWidth = function(aK) {
        var aJ;
        aJ = Site.getWebBackgroundData();
        if (aK == 0) {
            $("#setContentLeftWidth-box").hide();
            aJ.clw = -1;
            Site.autoContentLeftWidth()
        } else {
            aJ.clw = cusNowContentLeftWidth;
            Site.setContentLeftWidth(cusNowContentLeftWidth);
            $("#setContentLeftWidth-box").show()
        }
        if (!Y) {
            Site.saveWebBackgroundData(aJ);
            x("content");
            Site.logDog(100080, 15)
        }
    };
    Fai.top.panelFunc.changeContentRightWidth = function(aK) {
        var aJ;
        aJ = Site.getWebBackgroundData();
        if (aK == 0) {
            $("#setContentRightWidth-box").hide();
            aJ.crw = -1;
            Site.autoContentRightWidth()
        } else {
            aJ.crw = cusNowContentRightWidth;
            Site.setContentRightWidth(cusNowContentRightWidth);
            $("#setContentRightWidth-box").show()
        }
        if (!Y) {
            Site.saveWebBackgroundData(aJ);
            x("content");
            Site.logDog(100080, 16)
        }
    };
    Fai.top.panelFunc.changeFooterAlign = function(aJ) {
        if (Y) {
            return
        }
        Fai.top._useTemplateBackground ? Fai.top._footerStyleData.fa = parseInt(aJ) : Fai.top._customFooterStyleData.fa = parseInt(aJ);
        Site.refreshFooterAlign(aJ);
        am();
        if (!Y) {
            Site.logDog(100080, 8)
        }
    };
    Fai.top.panelFunc.onPaddingChange = function() {
        var aJ;
        aJ = Site.getFooterStyleData();
        var aN = $("#leftFooterPadding").val();
        var aK = $("#rightFooterPadding").val();
        var aM = $("#upFooterPadding").val();
        var aO = $("#downFooterPadddng").val();
        if (aN == "" && aM == "" && aO == "" && aK == "") {
            return
        }
        aN = parseInt(aN);
        if (isNaN(aN)) {
            aN = aJ.f.l
        }
        if (aN < 0 || aN > 999) {
            Fai.ing("请输入0到999之间的数值", true);
            $("#leftFooterPadding").val(aJ.f.l);
            return
        }
        aK = parseInt(aK);
        if (isNaN(aK)) {
            aK = aJ.f.r
        }
        if (aK < 0 || aK > 999) {
            Fai.ing("请输入0到999之间的数值", true);
            $("#rightFooterPadding").val(aJ.f.r);
            return
        }
        aM = parseInt(aM);
        if (isNaN(aM)) {
            aM = aJ.f.u
        }
        if (aM < 0 || aM > 999) {
            Fai.ing("请输入0到999之间的数值", true);
            $("#upFooterPadding").val(aJ.f.u);
            return
        }
        aO = parseInt(aO);
        if (isNaN(aO)) {
            aO = aJ.f.d
        }
        if (aO < 0 || aO > 999) {
            Fai.ing("请输入0到999之间的数值", true);
            $("#downFooterPadddng").val(aJ.f.d);
            return
        }
        aJ.f.u = aM;
        aJ.f.l = aN;
        aJ.f.r = aK;
        aJ.f.d = aO;
        var aL = "";
        aL = "0 " + aK + "px 0 " + aN + "px";
        Fai.top.Fai.setCtrlStyleCssList("stylefooter", "footer", [{
            cls: ".footerContent",
            key: "padding-top",
            value: aM + "px"
        },
        {
            cls: ".footerContent",
            key: "padding-bottom",
            value: aO + "px"
        },
        {
            cls: ".footerNav",
            key: "padding",
            value: aL
        },
        {
            cls: ".footerInfo",
            key: "padding",
            value: aL
        },
        {
            cls: ".footerSupport",
            key: "padding",
            value: aL
        },
        {
            cls: ".visitorCounterWrap",
            key: "padding",
            value: aL
        }]);
        Site.saveFooterStyleData(aJ);
        am()
    };
    Fai.top.panelFunc.changefooterPaddingType = function(aM) {
        if (aM == 1) {
            $("#footerPaddingCus").show();
            Fai.top.panelFunc.onPaddingChange()
        } else {
            $("#footerPaddingCus").hide();
            $("#upFooterPadding").val(0);
            $("#downFooterPadddng").val(0);
            var aL = "0 0 0 0",
            aN = 0,
            aK = 0,
            aJ = Site.getFooterStyleData();
            Fai.top.Fai.setCtrlStyleCssList("stylefooter", "footer", [{
                cls: ".footerContent",
                key: "padding-top",
                value: aK + "px"
            },
            {
                cls: ".footerContent",
                key: "padding-bottom",
                value: aN + "px"
            },
            {
                cls: ".footerNav",
                key: "padding",
                value: aL
            },
            {
                cls: ".footerInfo",
                key: "padding",
                value: aL
            },
            {
                cls: ".footerSupport",
                key: "padding",
                value: aL
            },
            {
                cls: ".visitorCounterWrap",
                key: "padding",
                value: aL
            }]);
            aJ.f.u = 0;
            aJ.f.d = 0;
            Site.saveFooterStyleData(aJ);
            am()
        }
        if (Y) {
            return
        }
        if (!Y) {
            Site.logDog(100080, 9)
        }
        Fai.top._useTemplateBackground ? Fai.top._footerStyleData.f.t = parseInt(aM) : Fai.top._customFooterStyleData.f.t = parseInt(aM)
    };
    Fai.top.panelFunc.changeRegularTextType = function(aJ) {
        if (aJ == 1) {
            $("#footerRegularTextCus").show()
        } else {
            $("#footerRegularTextCus").hide()
        }
        if (Y) {
            return
        }
        Fai.top._useTemplateBackground ? Fai.top._footerStyleData.rt.y = parseInt(aJ) : Fai.top._customFooterStyleData.rt.y = parseInt(aJ);
        if (aJ == 1) {
            M()
        } else {
            Site.autoRegularText()
        }
        am();
        if (!Y) {
            Site.logDog(100080, 10)
        }
    };
    Fai.top.panelFunc.regularTextSizeChange = function(aJ) {
        M();
        am()
    };
    Fai.top.panelFunc.regularTextFamilyChange = function(aJ) {
        M();
        am();
        Site && Site.logFontFamilyUse && Site.logFontFamilyUse($("#regularTextFamily").val())
    };
    Fai.top.panelFunc.changeFooterNavTextType = function(aJ) {
        if (aJ == 1) {
            $("#footerNavTextCus").show()
        } else {
            $("#footerNavTextCus").hide()
        }
        if (Y) {
            return
        }
        Fai.top._useTemplateBackground ? Fai.top._footerStyleData.gt.y = parseInt(aJ) : Fai.top._customFooterStyleData.gt.y = parseInt(aJ);
        if (aJ == 1) {
            s()
        } else {
            Site.autoFooterNavGeneralText()
        }
        am();
        if (!Y) {
            Site.logDog(100080, 11)
        }
    };
    Fai.top.panelFunc.footerNavTextSizeChange = function(aJ) {
        s();
        am()
    };
    Fai.top.panelFunc.footerNavTextBoldCheck = function(aJ) {
        s();
        am()
    };
    Fai.top.panelFunc.footerDecorationCheck = function(aJ) {
        s();
        am()
    };
    Fai.top.panelFunc.footerNavTextFamilyChange = function(aJ) {
        s();
        am();
        Site && Site.logFontFamilyUse && Site.logFontFamilyUse($("#footerNavTextFamily").val())
    };
    Fai.top.panelFunc.changeFooterBgType = function(aK) {
        if (aK == 1) {
            $("#footerBgCus").hide()
        } else {
            if (aK == 2) {
                $("#footerBgCus").show()
            } else {
                $("#footerBgCus").hide()
            }
        }
        if (Y) {
            return
        }
        var aJ;
        aJ = Site.getFooterStyleData();
        if (aK == 1) {
            aJ.fb.y = 1;
            Site.hideFooterBg()
        } else {
            if (aK == 2) {
                aJ.fb.y = 2;
                G()
            } else {
                aJ.fb.y = 0;
                Site.autoFooterBg()
            }
        }
        Site.saveFooterStyleData(aJ);
        am();
        if (!Y) {
            Site.logDog(100080, 12)
        }
    };
    Fai.top.panelFunc.footerBgRepeatChange = function(aK) {
        var aJ;
        aJ = Site.getFooterStyleData();
        if (!aJ.fb.f) {
            if (aK.value != -1) {
                Fai.ing("请先添加背景图片。", true);
                return
            }
        }
        Site.showRepeatTip(aK.value);
        G();
        am()
    };
    Fai.top.panelFunc.resetDefault = function(aJ) {
        Fai.top.panelResetDefaultFlag = true;
        if (!aJ) {
            $("#useSysSiteWidth").trigger("click")
        }
        $("#useSysBackground").trigger("click");
        $("#topStyleCustom").attr("checked", false);
        $("#topStyleDefault").trigger("click");
        $("#settingHeightInputWrap").hide();
        if (!Y) {
            Fai.top.panelFunc.refreshHeaderTop()
        }
        $("#topBannerCustom").attr("checked", false);
        $("#topBannerDefault").trigger("click");
        $("#settingBannerHeightInputWrap").hide();
        $("#useSysBannerWidth").trigger("click");
        if (!Y) {
            Fai.top.panelFunc.refreshBannerBgHeight()
        }
        $("#tfooterHeightCustom").attr("checked", false);
        $("#footerHeightDefault").trigger("click");
        $("#footerHeightInputWrap").hide();
        if (!Y) {
            b()
        }
        $("#headBg0").trigger("click");
        $("#useSysBannerBg").trigger("click");
        $("#useSysContentBg").trigger("click");
        $("#useSysContentMiddleBg").trigger("click");
        $("#useSysContentLeftWidth").trigger("click");
        $("#useSysContentRightWidth").trigger("click");
        $("#footerAlignDefault").trigger("click");
        $("#footerEdgeDistance0").trigger("click");
        $("#regularText1").trigger("click");
        $("#footerNavText0").trigger("click");
        $("#footerBg0").trigger("click");
        aH();
        Fai.top.panelResetDefaultFlag = false;
        Fai.top.$("#g_main").scrollTop(0)
    };
    function aH() {
        $("#patternChoice-normal").trigger("click");
        $("#normalItemPic").trigger("click");
        $("#sysItemWidth").trigger("click");
        $("#sysItemHeight").trigger("click");
        $("#sysFirstItemword").trigger("click");
        $("#normalItemSpacing").trigger("click");
        $("#sysItemVerticalLine").trigger("click");
        $("#autoDirection").trigger("click");
        $("#firstItemNoHref").trigger("click");
        $("#sysSecondItemHeight").trigger("click");
        $("#cusSecondItemHeight").trigger("click");
        $("#sysSecondItemword").trigger("click")
    }
    ah.ready(function() {
        var aQ;
        var a6;
        aQ = Site.getWebBackgroundData();
        var aN = aQ.o;
        if (aQ.o == "") {
            aN = "#fff"
        }
        $("#colorPicker").faiColorPicker({
            onchange: n,
            defaultcolor: aN,
            advance: true
        });
        var aW = 800;
        var a2 = 1440;
        var aV = parseInt(top.$(top.document).find("#webContainer").width()) || 960;
        ag = aV;
        if (aQ.sw == -1) {
            $("#useSysSiteWidth").click()
        } else {
            $("#useCusSiteWidth").click();
            ag = (aQ.sw == -1) ? aV: aQ.sw;
            Fai.top.panelFunc.changeSiteWidth(1)
        }
        var a7 = {
            animate: true,
            max: a2,
            min: aW,
            orientation: "horizontal",
            step: 40,
            value: ag,
            start: bj,
            slide: aZ,
            stop: bq
        };
        $("#setBackgroundWidth").slider(a7);
        $("#setBackgroundWidthContainer").append("<span id='ui-slider-value' style='float:left;'>" + ag + "px</span>");
        function bj(bu, bv) {
            $("#setBackgroundWidth").addClass("w-resize");
            a6 = Site.getWebBackgroundData();
            a6.sw = bv.value;
            ag = bv.value;
            Site.setSiteWidth(bv.value + "px");
            x()
        }
        function aZ(bu, bv) {
            $(bv.handle).focus();
            $("#ui-slider-value").text(bv.value + "px");
            a6 = Site.getWebBackgroundData();
            a6.sw = bv.value;
            ag = bv.value;
            Site.setSiteWidth(bv.value + "px");
            Site.LayoutMiddleLeftRightReset();
            Site.adjustPhotoCard()
        }
        function bq(bu, bv) {
            $("#setBackgroundWidth").removeClass("w-resize");
            $("#ui-slider-value").text(bv.value + "px");
            a6 = Site.getWebBackgroundData();
            a6.sw = bv.value;
            ag = bv.value;
            Site.setSiteWidth(bv.value + "px");
            Site.fixSiteWidth(Fai.top._manageMode);
            Site.adjustBannerWidth();
            Site.refreshBanner();
            Site.adjustPhotoCard()
        }
        if (aQ.s) {
            $("#useSysBackground").click()
        } else {
            if (aQ.h) {
                $("#hideBackground").click()
            } else {
                $("#useCusBackground").click()
            }
        }
        $("#bgDisplay").val(aQ.r);
        if (aQ.id) {
            $("#uploadmsgBg").html("<a href='javascript:;' onclick='Fai.top.panelFunc.view(\"" + aQ.id + "\");return false;'>查看</a>");
            $("#cusPanel").find(".J_previewContent").removeClass("f-previewContent-none");
            $("#cusPanel").find(".J_preview").html("<img class='f-previewImg' src='" + aQ.p + "' onload='Fai.Img.optimize(this, {width:180, height:75, mode:Fai.Img.MODE_SCALE_DEFLATE_FILL});' alt='' />")
        }
        if (!v && Fai.top._oem) {
            $("#useSysBackground").click();
            $("#useCusBackground").attr("disabled", true);
            $("#hideBackground").attr("disabled", true)
        }
        var be = {
            title: "添加图片",
            maxSize: parseInt(aG),
            type: ["jpg", "jpeg", "gif", "png", "bmp"],
            from: "bg",
            entry: "webBg"
        };
        Site.fileUpload2("#fileUploadV2", be, Q);
        var bh;
        bh = Site.getHeaderStyleData();
        if (bh.f) {
            $("#uploadmsg").html("<a href='javascript:;' onclick='Fai.top.panelFunc.view(\"" + bh.f + "\");return false;'>查看</a>");
            $("#headBgCus").find(".J_previewContent").removeClass("f-previewContent-none");
            $("#headBgCus").find(".J_preview").html("<img class='f-previewImg' src='" + bh.p + "' onload='Fai.Img.optimize(this, {width:180, height:75, mode:Fai.Img.MODE_SCALE_DEFLATE_FILL});' alt='' />")
        }
        var bd = {
            title: "添加图片",
            maxSize: parseInt(aG),
            type: ["jpg", "jpeg", "gif", "png"],
            imgMode: Fai.top._panelOptionData.imgMode,
            from: "bg",
            entry: "headBg"
        };
        Site.fileUpload2("#headBgFileButton", bd, ar);
        W();
        an();
        if (ap) {
            $("#headBg0").click();
            Fai.top.panelFunc.changeHeadBgType(0);
            Site.removeHeaderBg();
            $(".freeDisable").attr("disabled", true)
        } else {
            $(".freeDisable").removeAttr("disabled")
        }
        l();
        aI();
        if (top._templateLayout == 0 || top._templateLayout == 1 || top._templateLayout == 7) {
            $("#panelItemContainer_banner").show();
            $("#bannerStyleLine").show();
            $("#menu_bannerStyleLine").show()
        } else {
            $("#panelItemContainer_banner").hide();
            $("#bannerStyleLine").hide();
            $("#menu_bannerStyleLine").hide()
        }
        var aS = aQ.bBg;
        if (aS.f) {
            $("#uploadmsgBannerBg").html("<a href='javascript:;' onclick='Fai.top.panelFunc.view(\"" + aS.f + "\");return false;'>查看</a>");
            $("#cusBannerPanel").find(".J_previewContent").removeClass("f-previewContent-none");
            $("#cusBannerPanel").find(".J_preview").html("<img class='f-previewImg' src='" + aS.p + "' onload='Fai.Img.optimize(this, {width:180, height:75, mode:Fai.Img.MODE_SCALE_DEFLATE_FILL});' alt='' />")
        }
        var bc = {
            title: "添加图片",
            maxSize: parseInt(aG),
            type: ["jpg", "jpeg", "gif", "png"],
            imgMode: Fai.top._panelOptionData.imgMode,
            from: "bg",
            entry: "bannerBg"
        };
        Site.fileUpload2("#bannerFileUploadV2", bc, aC);
        var bf = 740;
        var bg = 1440;
        var br = parseInt(top.$(top.document).find("#webBanner").width());
        if (br > 1440) {
            br = 1440
        }
        var ba = br || 740;
        w = ba;
        if (aQ.wbw == -1) {
            $("#useSysBannerWidth").click()
        } else {
            w = (aQ.wbw == -1) ? ba: aQ.wbw;
            $("#useCusBannerWidth").click()
        }
        var a4 = {
            animate: true,
            max: bg,
            min: bf,
            orientation: "horizontal",
            step: 20,
            value: w,
            start: bo,
            slide: bp,
            stop: aR
        };
        $("#setBannerWidth").slider(a4);
        $("#setBannerWidthContainer").append("<span id='banner-width-slider-value' style='float:left;'>" + w + "px</span>");
        function bo(bu, bv) {
            $("#setBannerWidth").addClass("w-resize");
            a6 = Site.getWebBackgroundData();
            a6.wbw = bv.value;
            w = bv.value;
            Site.setWebBannerWidth(bv.value);
            x("banner")
        }
        function bp(bu, bv) {
            $(bv.handle).focus();
            $("#banner-width-slider-value").text(bv.value + "px");
            a6 = Site.getWebBackgroundData();
            a6.wbw = bv.value;
            w = bv.value;
            Site.setWebBannerWidth(bv.value)
        }
        function aR(bu, bv) {
            $("#setBannerWidth").removeClass("w-resize");
            $("#banner-width-slider-value").text(bv.value + "px");
            a6 = Site.getWebBackgroundData();
            a6.wbw = bv.value;
            w = bv.value;
            Site.setWebBannerWidth(bv.value);
            Site.saveWebBackgroundData(a6);
            Site.adjustBannerWidth();
            Site.refreshBanner()
        }
        if (ap) {
            $("#useSysBannerBg").click();
            $("#hideBannerBg").attr("disabled", true);
            $("#useCusBannerBg").attr("disabled", true);
            $("#useCusBannerWidth").attr("disabled", true);
            $("#useSysBannerWidth").click()
        } else {
            $("#hideBannerBg").removeAttr("disabled");
            $("#useCusBannerBg").removeAttr("disabled");
            $("#useCusBannerWidth").removeAttr("disabled")
        }
        var aY = ah.find("#panelOptionBox-contentLeftWdith");
        var bt = ah.find("#panelOptionBox-contentRightWdith");
        p();
        T();
        if (ap) {
            $("#useSysContentBg").click();
            $("#hideContentBg").attr("disabled", true);
            $("#useCusContentBg").attr("disabled", true);
            $("#useSysContentMiddleBg").click();
            $("#hideContentMiddleBg").attr("disabled", true);
            $("#useCusContentMiddleBg").attr("disabled", true);
            $("#useSysContentLeftWidth").click();
            $("#useCusContentLeftWidth").attr("disabled", true);
            $("#useSysContentRightWidth").click();
            $("#useCusContentRightWidth").attr("disabled", true)
        } else {
            $("#hideContentBg").removeAttr("disabled");
            $("#useCusContentBg").removeAttr("disabled");
            $("#hideContentMiddleBg").removeAttr("disabled");
            $("#useCusContentMiddleBg").removeAttr("disabled");
            $("#useCusContentLeftWidth").removeAttr("disabled");
            $("#useCusContentRightWidth").removeAttr("disabled")
        }
        var a1 = aQ.cBg;
        if (a1.f) {
            $("#uploadmsgContentBg").html("<a href='javascript:;' onclick='Fai.top.panelFunc.view(\"" + a1.f + "\");return false;'>查看</a>");
            $("#cusContentPanel").find(".J_previewContent").removeClass("f-previewContent-none");
            $("#cusContentPanel").find(".J_preview").html("<img class='f-previewImg' src='" + a1.p + "' onload='Fai.Img.optimize(this, {width:180, height:75, mode:Fai.Img.MODE_SCALE_DEFLATE_FILL});' alt='' />")
        }
        var aJ = aQ.cmBg;
        if (aJ.f) {
            $("#uploadmsgContentMiddleBg").html("<a href='javascript:;' onclick='Fai.top.panelFunc.view(\"" + aJ.f + "\");return false;'>查看</a>");
            $("#cusContentMiddlePanel").find(".J_previewContent").removeClass("f-previewContent-none");
            $("#cusContentMiddlePanel").find(".J_preview").html("<img class='f-previewImg' src='" + aJ.p + "' onload='Fai.Img.optimize(this, {width:180, height:75, mode:Fai.Img.MODE_SCALE_DEFLATE_FILL});' alt='' />")
        }
        var bb = {
            title: "添加图片",
            maxSize: parseInt(aG),
            type: ["jpg", "jpeg", "gif", "png"],
            imgMode: Fai.top._panelOptionData.imgMode,
            from: "bg",
            entry: "contentBg"
        };
        Site.fileUpload2("#contentFileUploadV2", bb, aA);
        var a8 = {
            title: "添加图片",
            maxSize: parseInt(aG),
            type: ["jpg", "jpeg", "gif", "png"],
            imgMode: Fai.top._panelOptionData.imgMode,
            from: "bg",
            entry: "contentBg"
        };
        Site.fileUpload2("#contentMiddleFileUploadV2", a8, t);
        var aU = 200;
        var aX = 400;
        var aK = parseInt(top.$(top.document).find("#containerFormsLeft").width());
        if (aK > aX) {
            aK = aX
        }
        var a3 = aK || 200;
        cusNowContentLeftWidth = a3;
        if (aQ.clw == -1) {
            $("#useSysContentLeftWidth").click()
        } else {
            cusNowContentLeftWidth = (aQ.clw == -1) ? a3: aQ.clw;
            $("#useCusContentLeftWidth").click()
        }
        var aP = {
            animate: true,
            max: aX,
            min: aU,
            orientation: "horizontal",
            step: 10,
            value: cusNowContentLeftWidth,
            start: aM,
            slide: aT,
            stop: bk
        };
        $("#setContentLeftWidth").slider(aP);
        $("#setContentLeftWidthContainer").append("<span id='contentLeft-width-slider-value' style='float:left;'>" + cusNowContentLeftWidth + "px</span>");
        function aM(bu, bv) {
            $("#setContentLeftWidth").addClass("w-resize");
            a6 = Site.getWebBackgroundData();
            a6.clw = bv.value;
            cusNowContentLeftWidth = bv.value;
            Site.setContentLeftWidth(bv.value);
            x("content")
        }
        function aT(bu, bv) {
            $(bv.handle).focus();
            $("#contentLeft-width-slider-value").text(bv.value + "px");
            a6 = Site.getWebBackgroundData();
            a6.clw = bv.value;
            cusNowContentLeftWidth = bv.value;
            Site.setContentLeftWidth(bv.value)
        }
        function bk(bu, bv) {
            $("#setContentLeftWidth").removeClass("w-resize");
            $("#contentLeft-width-slider-value").text(bv.value + "px");
            a6 = Site.getWebBackgroundData();
            a6.clw = bv.value;
            cusNowContentLeftWidth = bv.value;
            Site.setContentLeftWidth(bv.value);
            Site.saveWebBackgroundData(a6)
        }
        var bi = 200;
        var bm = 400;
        var bs = parseInt(top.$(top.document).find("#containerFormsRight").width());
        if (bs > bm) {
            bs = bm
        }
        var bl = bs || 200;
        cusNowContentRightWidth = bl;
        if (aQ.crw == -1) {
            $("#useSysContentRightWidth").click()
        } else {
            cusNowContentRightWidth = (aQ.crw == -1) ? bl: aQ.crw;
            $("#useCusContentRightWidth").click()
        }
        var aO = {
            animate: true,
            max: bm,
            min: bi,
            orientation: "horizontal",
            step: 10,
            value: cusNowContentRightWidth,
            start: a5,
            slide: bn,
            stop: aL
        };
        $("#setContentRightWidth").slider(aO);
        $("#setContentRightWidthContainer").append("<span id='contentRight-width-slider-value' style='float:left;'>" + cusNowContentRightWidth + "px</span>");
        function a5(bu, bv) {
            $("#setContentRightWidth").addClass("w-resize");
            a6 = Site.getWebBackgroundData();
            a6.crw = bv.value;
            cusNowContentRightWidth = bv.value;
            Site.setContentRightWidth(bv.value);
            x("content")
        }
        function bn(bu, bv) {
            $(bv.handle).focus();
            $("#contentRight-width-slider-value").text(bv.value + "px");
            a6 = Site.getWebBackgroundData();
            a6.crw = bv.value;
            cusNowContentRightWidth = bv.value;
            Site.setContentRightWidth(bv.value)
        }
        function aL(bu, bv) {
            $("#setContentRightWidth").removeClass("w-resize");
            $("#contentRight-width-slider-value").text(bv.value + "px");
            a6 = Site.getWebBackgroundData();
            a6.crw = bv.value;
            cusNowContentRightWidth = bv.value;
            Site.setContentRightWidth(bv.value);
            Site.saveWebBackgroundData(a6)
        }
        Site.isLayoutHidden(1) ? aY.hide() : aY.show();
        Site.isLayoutHidden(3) ? bt.hide() : bt.show();
        if (ap) {
            $("#footerAlignLeft").attr("disabled", true);
            $("#footerAlignCenter").attr("disabled", true);
            $("#footerNavText1").attr("disabled", true);
            $("#footerAlignRight").attr("disabled", true);
            $("#footerBg1").attr("disabled", true);
            $("#freeDisable").attr("disabled", true);
            $("#footerBg2").attr("disabled", true);
            $("#footerEdgeDistance1").attr("disabled", true);
            var a0;
            a0 = Site.getFooterStyleData();
            a0.fa = 0;
            a0.gt.y = 0;
            a0.rt.y = 0;
            a0.fb.y = 0;
            a0.f.t = 0;
            a0.ht.c = null;
            Site.saveFooterStyleData(a0);
            Site.autoFooterBg()
        }
        $(".numeric").numeric();
        aB();
        var a9 = {
            title: "添加图片",
            maxSize: parseInt(aG),
            type: ["jpg", "jpeg", "gif", "png"],
            from: "bg",
            entry: "footerBg"
        };
        Site.fileUpload2("#footerBgFileButton", a9, aF);
        Site.faiFloatPanelModuleDraggable();
        Site.faiFloatPanelDraggable();
        Site.bindGobalEvent("siteLayoutChange",
        function(bv, bu) {
            Site.isLayoutHidden(1) ? aY.hide() : aY.show();
            Site.isLayoutHidden(3) ? bt.hide() : bt.show()
        });
        Site.bindGobalEvent("changeTemplateType",
        function(bv, bw) {
            Site.resetBackgroundStyleDefault(false);
            Fai.top.panelFunc.resetDefault(true);
            if (top._templateLayout == 0 || top._templateLayout == 1 || top._templateLayout == 7) {
                $("#panelItemContainer_banner").show();
                $("#bannerStyleLine").show();
                $("#menu_bannerStyleLine").show()
            } else {
                $("#panelItemContainer_banner").hide();
                $("#bannerStyleLine").hide();
                $("#menu_bannerStyleLine").hide()
            }
            var bx = !Fai.top._panelOptionData.allowedStyle && (top._templateType == Fai.top._panelOptionData.templateType_free);
            if (bx) {
                $("#useSysBackground").click();
                $("#useCusBackground").attr("disabled", true);
                $("#hideBackground").attr("disabled", true)
            } else {
                $("#useCusBackground").removeAttr("disabled");
                $("#hideBackground").removeAttr("disabled")
            }
            if (bx) {
                $("#headBg0").click();
                Fai.top.panelFunc.changeHeadBgType(0);
                Site.removeHeaderBg();
                $(".freeDisable").attr("disabled", true)
            } else {
                $(".freeDisable").removeAttr("disabled")
            }
            if (bx) {
                $("#useSysBannerBg").click();
                $("#topBannerDefault").click();
                $("#useSysBannerWidth").click();
                $("#hideBannerBg").attr("disabled", true);
                $("#useCusBannerBg").attr("disabled", true);
                $("#useCusBannerWidth").attr("disabled", true)
            } else {
                $("#hideBannerBg").removeAttr("disabled");
                $("#useCusBannerBg").removeAttr("disabled");
                $("#useCusBannerWidth").removeAttr("disabled")
            }
            if (bx) {
                $("#useSysContentBg").click();
                $("#hideContentBg").attr("disabled", true);
                $("#useCusContentBg").attr("disabled", true);
                $("#useSysContentMiddleBg").click();
                $("#hideContentMiddleBg").attr("disabled", true);
                $("#useCusContentMiddleBg").attr("disabled", true);
                $("#useSysContentLeftWidth").click();
                $("#useCusContentLeftWidth").attr("disabled", true);
                $("#useSysContentRightWidth").click();
                $("#useCusContentRightWidth").attr("disabled", true)
            } else {
                $("#hideContentBg").removeAttr("disabled");
                $("#useCusContentBg").removeAttr("disabled");
                $("#hideContentMiddleBg").removeAttr("disabled");
                $("#useCusContentMiddleBg").removeAttr("disabled");
                $("#useCusContentLeftWidth").removeAttr("disabled");
                $("#useCusContentRightWidth").removeAttr("disabled")
            }
            Site.isLayoutHidden(1) ? aY.hide() : aY.show();
            Site.isLayoutHidden(3) ? bt.hide() : bt.show();
            if (bx) {
                $("#footerAlignLeft").attr("disabled", true);
                $("#footerAlignCenter").attr("disabled", true);
                $("#footerNavText1").attr("disabled", true);
                $("#footerAlignRight").attr("disabled", true);
                $("#footerBg1").attr("disabled", true);
                $("#freeDisable").attr("disabled", true);
                $("#footerBg2").attr("disabled", true);
                $("#footerEdgeDistance1").attr("disabled", true);
                var bu;
                bu = Site.getFooterStyleData();
                bu.fa = 0;
                bu.gt.y = 0;
                bu.rt.y = 0;
                bu.fb.y = 0;
                bu.f.t = 0;
                bu.ht.c = null;
                Site.saveFooterStyleData(bu);
                Site.autoFooterBg()
            } else {
                $("#footerAlignLeft").removeAttr("disabled");
                $("#footerAlignCenter").removeAttr("disabled");
                $("#footerNavText1").removeAttr("disabled");
                $("#footerAlignRight").removeAttr("disabled");
                $("#footerBg1").removeAttr("disabled");
                $("#freeDisable").removeAttr("disabled");
                $("#footerBg2").removeAttr("disabled");
                $("#footerEdgeDistance1").removeAttr("disabled")
            }
        });
        if (! (Fai.isIE6() || Fai.isIE7())) {
            ah.find(".panelContentContainer").mCustomScrollbar({
                theme: "dark-3",
                scrollButtons: {
                    enable: true
                },
                advanced: {
                    updateOnContentResize: true
                },
                axis: "y",
                callbacks: {
                    whileScrolling: function() {
                        var bu = $(this).attr("id");
                        if (bu == "sectionModuleContentContainer") {
                            return
                        }
                        var bw = $("#" + bu + "TopLine").offset().top - 20;
                        var bv = $("#" + bu).siblings(".panelMenuContainer").find("li");
                        $.each(Fai.top.$("#" + bu + " .splitLine"),
                        function(bx, by) {
                            if (($(by).offset().top - bw) > 0) {
                                bv.removeClass("on").eq(bx).addClass("on");
                                return false
                            }
                        })
                    }
                }
            })
        }
        ah.delegate(".sectionModuleIcon", "mouseleave",
        function() {
            $(this).children(".nowModuleButtonDiv").hide()
        });
        ah.delegate(".sectionModuleIcon > .panelModuleIcon", "hover",
        function() {
            $(this).siblings(".nowModuleButtonDiv").show()
        });
        Site.bindGobalEvent("site_delModule",
        function(bu, bv) {
            Site.updateCurrentSectionModule();
            Site.sectionModuleSelectChange(false);
            Site.removeOverlay()
        });
        Site.bindGobalEvent("site_hideModule",
        function(bu, bv) {
            if (!Fai.top.panelModuleIconClick) {
                Site.updateCurrentSectionModule()
            }
            Site.sectionModuleSelectChange(false);
            Site.removeOverlay()
        });
        Site.bindGobalEvent("site_addNewModule",
        function(bu, bv) {
            Site.updateCurrentSectionModule();
            Site.sectionModuleSelectChange(false)
        });
        Site.bindGobalEvent("site_refreshModule",
        function(bu, bv) {
            Site.updateCurrentSectionModule();
            Site.sectionModuleSelectChange(false)
        });
        Site.bindGobalEvent("showFindModuleDiv",
        function(bu, bv) {
            var bx = Fai.top.$("#faiFloatPanel");
            if (bx.attr("status") == 1) {
                var bw = Fai.top.$("#module" + bv);
                if (bw.length < 1) {
                    return
                }
                var by = bx.offset().left;
                var bC = by + bx.outerWidth();
                var bA = bw.offset().left;
                var bz = bA + bw.outerWidth();
                var bB = false;
                if (bA <= by && bz >= by) {
                    bB = true
                } else {
                    if (bA <= bC && bz >= bC) {
                        bB = true
                    } else {
                        if (bA >= by && bz <= bC) {
                            bB = true
                        } else {
                            if (bA < by && bz > bC) {
                                bB = true
                            }
                        }
                    }
                }
                if (bB) {
                    if (!bx.is(":animated")) {
                        bx.stop().animate({
                            opacity: "0.1"
                        },
                        800)
                    }
                    setTimeout(function() {
                        if (!bx.is(":animated")) {
                            bx.stop().animate({
                                opacity: "1"
                            },
                            900)
                        }
                    },
                    1000)
                } else {
                    bx.css({
                        opacity: "1"
                    })
                }
            }
        });
        Y = false;
        Fai.top.faiFloatPanelReady = true
    }).click(function() {
        $(this).css({
            opacity: "1"
        })
    });
    function h(aJ) {
        var aK = "";
        if (aJ.o) {
            aK += aJ.o
        }
        if (aJ.p) {
            aK += P(aJ.r, "web", "siteBg")
        }
        if (aK == "") {
            aK = "none"
        }
        return aK
    }
    function n(aK) {
        var aJ;
        aJ = Site.getWebBackgroundData();
        if (aJ.s) {
            Site.hideSiteBg()
        }
        aJ.o = aK;
        aJ.s = false;
        Site.saveWebBackgroundData(aJ);
        if (!aJ.h) {
            var aL = "";
            aL = h(aJ);
            Site.setSiteBg(aL, aJ.o)
        }
        x()
    }
    function Q(aK) {
        if (aK) {
            var aM = $.parseJSON(aK);
            var aL = aM.data[0] || {};
            var aN = "";
            $("#useCusBackground").attr("checked", true);
            var aJ = Site.getWebBackgroundData();
            aJ.p = aL.filePath;
            aJ.id = aL.fileId;
            aJ.s = false;
            if (aL.isMatBg) {
                aJ.r = 3;
                $("#bgDisplay").val(3)
            }
            Site.saveWebBackgroundData(aJ);
            $("#uploadmsgBg").html("<a href='javascript:;' onclick='Fai.top.panelFunc.view(\"" + aL.fileId + "\");return false;'>查看</a>");
            $("#cusPanel").find(".J_previewContent").removeClass("f-previewContent-none");
            $("#cusPanel").find(".J_preview").html("<img class='f-previewImg' src='" + aJ.p + "' onload='Fai.Img.optimize(this, {width:180, height:75, mode:Fai.Img.MODE_SCALE_DEFLATE_FILL});' alt='' />");
            $("#bgDisplay").change()
        }
    }
    function ar(aJ) {
        if (aJ) {
            var aM = $.parseJSON(aJ);
            var aK = aM.data[0] || {};
            var aL = Site.getHeaderStyleData();
            aL.f = aK.fileId;
            aL.p = aK.filePath;
            if (aK.isMatBg) {
                aL.r = 3;
                $("#headBgRepeat").val(3)
            }
            ae();
            az();
            $("#uploadmsg").html("<a href='javascript:;' onclick='Fai.top.panelFunc.view(\"" + aK.fileId + "\");return false;'>查看</a>");
            $("#headBgCus").find(".J_previewContent").removeClass("f-previewContent-none");
            $("#headBgCus").find(".J_preview").html("<img class='f-previewImg' src='" + aL.p + "' onload='Fai.Img.optimize(this, {width:180, height:75, mode:Fai.Img.MODE_SCALE_DEFLATE_FILL});' alt='' />")
        }
    }
    function W() {
        var aJ;
        Fai.top._useTemplateBackground ? aJ = Fai.top._headerTopStyle: aJ = Fai.top._customHeaderTopStyle;
        $("#topStyleDefault").bind("click",
        function() {
            $("#settingHeightInputWrap").hide();
            if (!Y) {
                Fai.top.panelFunc.refreshHeaderTop()
            }
        });
        $("#topStyleCustom").bind("click",
        function() {
            $("#settingHeightInputWrap").show();
            if (!Y) {
                if ($("#settingHeightInput").val() != "") {
                    Fai.top.panelFunc.refreshHeaderTop()
                }
            }
        });
        if (aJ.hts == -1) {
            $("#topStyleDefault").click()
        } else {
            $("#topStyleCustom").click();
            $("#settingHeightInput").val(aJ.hts)
        }
    }
    function ae() {
        var aL;
        aL = Site.getHeaderStyleData();
        aL.c = R;
        var aK = aL.r;
        var aJ = "";
        aJ += R;
        var aN = aL.p;
        if (aN) {
            if (aK != -1) {
                var aM = "";
                if (aK == 0 || aK == 6 || aK == 7 || aK == 8 || aK == 9 || aK == 13 || aK == 14 || aK == 15 || aK == 16) {
                    aM = "no-repeat"
                }
                if (aK == 1 || aK == 11 || aK == 12) {
                    aM = "repeat-x"
                }
                if (aK == 2 || aK == 21 || aK == 22) {
                    aM = "repeat-y"
                }
                if (aK == 3) {
                    aM = "repeat"
                }
                if (aK == 4 || aK == 5) {
                    aM = "repeat"
                }
                var aO = "center";
                if (aK == 9 || aK == 12) {
                    aO = "bottom"
                }
                if (aK == 6 || aK == 21) {
                    aO = "left"
                }
                if (aK == 7 || aK == 22) {
                    aO = "right"
                }
                if (aK == 4 || aK == 5 || aK == 8 || aK == 11) {
                    aO = "top"
                }
                if (aK == 13) {
                    aO = "left top"
                }
                if (aK == 14) {
                    aO = "right top"
                }
                if (aK == 15) {
                    aO = "left bottom"
                }
                if (aK == 16) {
                    aO = "right bottom"
                }
                aJ += " url(" + aN + ") " + aM + " " + aO
            }
        }
        Site.setHeaderBg(aJ)
    }
    function az() {
        if (Y) {
            return
        }
        top._headerTopStyleChanged++;
        Site.styleChanged();
        Site.showSectionOfSitePage("head");
        Site.setRefreshInfo("siteStyleSetting", true)
    }
    function an() {
        var aJ;
        aJ = Site.getHeaderStyleData();
        if (aJ.y == 1) {
            $("#headBg1").click()
        } else {
            if (aJ.y == 2) {
                $("#headBg2").click()
            } else {
                $("#headBg0").click()
            }
        }
        if (Fai.isNull(aJ.r)) {
            aJ.r = 0
        }
        $("#headBgRepeat").val(aJ.r);
        if (Fai.isNull(aJ.c)) {
            aJ.c = "#000"
        }
        R = aJ.c;
        $("#headBgColorPicker").faiColorPicker({
            onchange: ak,
            defaultcolor: R
        })
    }
    function ak(aJ) {
        R = aJ;
        ae();
        az()
    }
    function l() {
        var aJ;
        aJ = Site.getBannerBackgroundData();
        if (aJ != null) {
            if (aJ.y == 1) {
                $("#hideBannerBg").click()
            } else {
                if (aJ.y == 2) {
                    $("#useCusBannerBg").click()
                } else {
                    $("#useSysBannerBg").click()
                }
            }
        }
        if (Fai.isNull(aJ.r)) {
            aJ.r = 0
        }
        $("#bannerBgDisplay").val(aJ.r);
        if (Fai.isNull(aJ.c)) {
            aJ.c = "#000"
        }
        $("#bannerColorPicker").faiColorPicker({
            onchange: av,
            defaultcolor: aJ.c
        })
    }
    function av(aJ) {
        var aL;
        aL = Site.getBannerBackgroundData();
        var aK = "";
        if (aL.y == 0) {
            Site.hideBannerBg()
        }
        aL.c = aJ;
        Site.saveBannerBackgroundData(aL);
        aK = m(aL);
        Site.setBannerBg(aK);
        x("banner")
    }
    function m(aK) {
        var aJ = "";
        if (aK.c) {
            aJ += aK.c
        }
        if (aK.p) {
            aJ += P(aK.r, "webBannerTable")
        }
        if (aJ == "") {
            aJ = "none"
        }
        return aJ
    }
    function aI() {
        var aJ = Site.getWebBackgroundData();
        $("#topBannerDefault").bind("click",
        function() {
            $("#settingBannerHeightInputWrap").hide();
            if (!Y) {
                Fai.top.panelFunc.refreshBannerBgHeight()
            }
        });
        $("#topBannerCustom").bind("click",
        function() {
            var aK = aJ.wbh == -1 ? parseInt(top.$("#webBanner").height()) : aJ.wbh;
            $("#settingBannerHeightInputWrap").show();
            $("#settingBannerHeightInput").val(aK);
            if (!Y) {
                if ($("#settingBannerHeightInput").val() != "") {
                    Fai.top.panelFunc.refreshBannerBgHeight()
                }
            }
        });
        if (aJ.wbh == -1) {
            $("#topBannerDefault").click()
        } else {
            $("#topBannerCustom").click();
            $("#settingBannerHeightInput").val(aJ.wbh)
        }
    }
    function aC(aJ) {
        if (aJ) {
            var aN = $.parseJSON(aJ);
            var aL = aN.data[0] || {};
            var aM = Site.getBannerBackgroundData();
            var aK = "";
            aM.f = aL.fileId;
            aM.p = aL.filePath;
            aM.id = aL.fileId;
            aM.y = 2;
            if (aL.isMatBg) {
                aM.r = 3;
                $("#bannerBgDisplay").val(3)
            }
            Site.saveBannerBackgroundData(aM);
            aK = m(aM);
            Site.setBannerBg(aK);
            $("#uploadmsgBannerBg").html("<a href='javascript:;' onclick='Fai.top.panelFunc.view(\"" + aL.fileId + "\");return false;'>查看</a>");
            $("#cusBannerPanel").find(".J_previewContent").removeClass("f-previewContent-none");
            $("#cusBannerPanel").find(".J_preview").html("<img class='f-previewImg' src='" + aM.p + "' onload='Fai.Img.optimize(this, {width:180, height:75, mode:Fai.Img.MODE_SCALE_DEFLATE_FILL});' alt='' />");
            x("banner")
        }
    }
    function m(aK) {
        var aJ = "";
        if (aK.c) {
            aJ += aK.c
        }
        if (aK.p) {
            aJ += P(aK.r, "webBannerTable")
        }
        if (aJ == "") {
            aJ = "none"
        }
        return aJ
    }
    function F() {
        if (Y) {
            return
        }
        Fai.top._bannerChanged++;
        Site.styleChanged();
        Site.showSectionOfSitePage("banner");
        Site.setRefreshInfo("siteStyleSetting", true)
    }
    function p() {
        var aJ;
        aJ = Site.getContentBackgroundData();
        if (aJ != null) {
            if (aJ.y == 1) {
                $("#hideContentBg").click()
            } else {
                if (aJ.y == 2) {
                    $("#useCusContentBg").click()
                } else {
                    $("#useSysContentBg").click()
                }
            }
        }
        if (Fai.isNull(aJ.r)) {
            aJ.r = 0
        }
        $("#contentBgDisplay").val(aJ.r);
        if (Fai.isNull(aJ.c)) {
            aJ.c = "#000"
        }
        $("#contentColorPicker").faiColorPicker({
            onchange: au,
            defaultcolor: aJ.c
        });
        $("#contentColorPicker").on("click.bg",
        function() {
            x("content")
        })
    }
    function au(aJ) {
        var aK;
        aK = Site.getContentBackgroundData();
        var aL = "";
        if (aK.y == 0) {
            Site.hideContentBg()
        }
        aK.c = aJ;
        Site.saveContentBackgroundData(aK);
        aL = E(aK);
        Site.setContentBg(aL, "none")
    }
    function E(aJ) {
        var aK = "";
        if (aJ.c) {
            aK += aJ.c
        }
        if (aJ.p) {
            aK += P(aJ.r, "webContainerTable")
        }
        if (aK == "") {
            aK = "none"
        }
        return aK
    }
    function aA(aJ) {
        if (aJ) {
            var aN = $.parseJSON(aJ);
            var aK = aN.data[0] || {};
            var aM = "";
            var aL = Site.getContentBackgroundData();
            aL.f = aK.fileId;
            aL.p = aK.filePath;
            aL.id = aK.fileId;
            aL.y = 2;
            if (aK.isMatBg) {
                aL.r = 3;
                $("#contentBgDisplay").val(3)
            }
            Site.saveContentBackgroundData(aL);
            aM = E(aL);
            Site.setContentBg(aM, "none");
            $("#uploadmsgContentBg").html("<a href='javascript:;' onclick='Fai.top.panelFunc.view(\"" + aK.fileId + "\");return false;'>查看</a>");
            $("#cusContentPanel").find(".J_previewContent").removeClass("f-previewContent-none");
            $("#cusContentPanel").find(".J_preview").html("<img class='f-previewImg' src='" + aL.p + "' onload='Fai.Img.optimize(this, {width:180, height:75, mode:Fai.Img.MODE_SCALE_DEFLATE_FILL});' alt='' />");
            x("content")
        }
    }
    function T() {
        var aJ;
        aJ = Site.getContentMiddleBackgroundData();
        if (aJ != null) {
            if (aJ.y == 1) {
                $("#hideContentMiddleBg").click()
            } else {
                if (aJ.y == 2) {
                    $("#useCusContentMiddleBg").click()
                } else {
                    $("#useSysContentMiddleBg").click()
                }
            }
        }
        if (Fai.isNull(aJ.r)) {
            aJ.r = 0
        }
        $("#contentMiddleBgDisplay").val(aJ.r);
        if (Fai.isNull(aJ.c)) {
            aJ.c = "#000"
        }
        $("#contentMiddleColorPicker").faiColorPicker({
            onchange: B,
            defaultcolor: aJ.c
        });
        $("#contentMiddleColorPicker").on("click.bg",
        function() {
            x("content")
        })
    }
    function B(aJ) {
        var aL;
        aL = Site.getContentMiddleBackgroundData();
        var aK = "";
        if (aL.y == 0) {
            Site.hideContentMiddleBg()
        }
        aL.c = aJ;
        Site.saveContentMiddleBackgroundData(aL);
        aK = L(aL);
        Site.setContentMiddleBg(aK)
    }
    function L(aK) {
        var aJ = "";
        if (aK.c) {
            aJ += aK.c
        }
        if (aK.p) {
            aJ += P(aK.r, "container")
        }
        if (aJ == "") {
            aJ = "none"
        }
        return aJ
    }
    function t(aJ) {
        if (aJ) {
            var aN = $.parseJSON(aJ);
            var aK = aN.data[0] || {};
            var aL = "";
            var aM = Site.getContentMiddleBackgroundData();
            aM.f = aK.fileId;
            aM.p = aK.filePath;
            aM.id = aK.fileId;
            aM.y = 2;
            if (aK.isMatBg) {
                aM.r = 3;
                $("#contentMiddleBgDisplay").val(3)
            }
            Site.saveContentMiddleBackgroundData(aM);
            aL = L(aM);
            Site.setContentMiddleBg(aL);
            $("#uploadmsgContentMiddleBg").html("<a href='javascript:;' onclick='Fai.top.panelFunc.view(\"" + aK.fileId + "\");return false;'>查看</a>");
            $("#cusContentMiddlePanel").find(".J_previewContent").removeClass("f-previewContent-none");
            $("#cusContentMiddlePanel").find(".J_preview").html("<img class='f-previewImg' src='" + aM.p + "' onload='Fai.Img.optimize(this, {width:180, height:75, mode:Fai.Img.MODE_SCALE_DEFLATE_FILL});' alt='' />");
            x("content")
        }
    }
    function am() {
        if (Y) {
            return
        }
        top._footerStyleChanged++;
        Site.styleChanged();
        Site.showSectionOfSitePage("foot");
        Site.setRefreshInfo("siteStyleSetting", true)
    }
    function D() {
        if (Y) {
            return
        }
        top._footerStyleChanged++;
        Site.styleChanged();
        Site.setRefreshInfo("siteStyleSetting", true)
    }
    function aB() {
        aj();
        ac();
        A();
        aD();
        V();
        C();
        I();
        K()
    }
    function aj() {
        $("#footerHeightDefault").bind("click",
        function() {
            $("#footerHeightInputWrap").hide();
            if (!Y) {
                b()
            }
        });
        $("#footerHeightCustom").bind("click",
        function() {
            var aJ = Site.getFooterStyleData().fh == -1 ? parseInt(top.$("#webFooterTable").height()) : Site.getFooterStyleData().fh;
            $("#footerHeightInputWrap").show();
            $("#footerHeightInput").val(aJ);
            if (!Y) {
                if ($("#footerHeightInput").val() != "") {
                    b()
                }
            }
        });
        if (Fai.top._footerStyleData.fh == -1) {
            $("#footerHeightDefault").click()
        } else {
            $("#footerHeightCustom").click();
            $("#footerHeightInput").val(Site.getFooterStyleData().fh)
        }
    }
    function ac() {
        var aJ;
        aJ = Site.getFooterStyleData();
        if (aJ.fa == 1) {
            $("#footerAlignLeft").click();
            if (typeof aJ.fp != "undefined") {
                $("#leftFooterPadding").val(aJ.fp)
            }
        } else {
            if (aJ.fa == 2) {
                $("#footerAlignCenter").click()
            } else {
                if (aJ.fa == 3) {
                    $("#footerAlignRight").click();
                    if (typeof aJ.fp != "undefined") {
                        $("#rightFooterPadding").val(aJ.fp)
                    }
                } else {
                    $("#footerAlignDefault").click()
                }
            }
        }
    }
    function A() {
        var aJ;
        aJ = Site.getFooterStyleData();
        if (aJ.gt.y == 1) {
            $("#footerNavText1").click()
        } else {
            $("#footerNavText0").click()
        }
        if (Fai.isNull(aJ.gt.s)) {
            aJ.gt.s = 12
        }
        $("#footerNavTextSize").val(aJ.gt.s);
        if (Fai.isNull(aJ.gt.f)) {
            aJ.gt.f = "宋体"
        }
        $("#footerNavTextFamily").val(aJ.gt.f);
        var aK = $("#footerNavTextFamily");
        if (aK.val() == null && aK.children("option").length > 0) {
            aK[0].selectedIndex = 0
        }
        if (Fai.isNull(aJ.gt.w)) {
            aJ.gt.w = 0
        }
        if (aJ.gt.w == 1) {
            $("#footerNavTextBold").attr("checked", true)
        }
        if (Fai.isNull(aJ.gt.d)) {
            aJ.gt.d = 0
        }
        if (aJ.gt.d == 1) {
            $("#footerDecorationCheck").attr("checked", true)
        }
        if (Fai.isNull(aJ.gt.c)) {
            aJ.gt.c = "#000"
        }
        aa = aJ.gt.c;
        Site.saveFooterStyleData(aJ);
        $("#footerNavTextColorPicker").faiColorPicker({
            onchange: H,
            defaultcolor: aa
        });
        $("#footerNavTextColorPicker").on("click.fc",
        function() {
            Site.showSectionOfSitePage("foot")
        })
    }
    function aD() {
        var aJ;
        aJ = Site.getFooterStyleData();
        if (Fai.isNull(aJ.ht.c)) {
            aJ.ht.c = "#000"
        }
        aw = aJ.ht.c;
        Site.saveFooterStyleData(aJ);
        $("#footerNavHoverTextColorPicker").faiColorPicker({
            onchange: S,
            defaultcolor: aw
        });
        $("#footerNavHoverTextColorPicker").on("click.fc",
        function() {
            Site.showSectionOfSitePage("foot")
        })
    }
    function V() {
        var aJ;
        aJ = Site.getFooterStyleData();
        if (aJ.fb.y == 1) {
            $("#footerBg1").click()
        } else {
            if (aJ.fb.y == 2) {
                $("#footerBg2").click()
            } else {
                $("#footerBg0").click()
            }
        }
        if (Fai.isNull(aJ.fb.r)) {
            aJ.fb.r = 0
        }
        $("#footerBgRepeat").val(aJ.fb.r);
        if (Fai.isNull(aJ.fb.c)) {
            aJ.fb.c = "#000"
        }
        al = aJ.fb.c;
        $("#footerBgColorPicker").faiColorPicker({
            onchange: at,
            defaultcolor: al
        });
        $("#footerBgColorPicker").on("click.fc",
        function() {
            Site.showSectionOfSitePage("foot")
        });
        if (aJ.fb.f) {
            $("#uploadmsgFooter").html("<a href='javascript:;' onclick='Fai.top.panelFunc.view(\"" + aJ.fb.f + "\");return false;'>查看</a>");
            $("#footerBgCus").find(".J_previewContent").removeClass("f-previewContent-none");
            $("#footerBgCus").find(".J_preview").html("<img class='f-previewImg' src='" + aJ.fb.p + "' onload='Fai.Img.optimize(this, {width:180, height:75, mode:Fai.Img.MODE_SCALE_DEFLATE_FILL});' alt='' />")
        }
        Site.saveFooterStyleData(aJ)
    }
    function C() {
        var aJ;
        aJ = Site.getFooterStyleData();
        if (aJ.f.t == 0) {
            $("#footerEdgeDistance0").click()
        } else {
            $("#footerEdgeDistance1").click()
        }
        var aM = aJ.f.l;
        var aK = aJ.f.r;
        var aL = aJ.f.u;
        var aN = aJ.f.d;
        if (isNaN(aM)) {
            aM = 0
        }
        if (isNaN(aK)) {
            aK = 0
        }
        if (isNaN(aL)) {
            aL = 0
        }
        if (isNaN(aN)) {
            aN = 0
        }
        $("#leftFooterPadding").val(aM);
        $("#rightFooterPadding").val(aK);
        $("#upFooterPadding").val(aL);
        $("#downFooterPadddng").val(aN)
    }
    function I() {
        var aJ;
        aJ = Site.getFooterStyleData();
        if (aJ.rt.y == 1) {
            $("#regularText2").click()
        } else {
            $("#regularText1").click()
        }
        if (Fai.isNull(aJ.rt.s)) {
            aJ.rt.s = 12
        }
        $("#regularTextSize").val(aJ.rt.s);
        if (Fai.isNull(aJ.rt.f)) {
            aJ.rt.f = "SimSun"
        }
        $("#regularTextFamily").val(aJ.rt.f);
        var aK = $("#regularTextFamily");
        if (aK.val() == null && aK.children("option").length > 0) {
            aK[0].selectedIndex = 0
        }
        if (Fai.isNull(aJ.rt.c)) {
            aJ.rt.c = "#000"
        }
        o = aJ.rt.c;
        Site.saveFooterStyleData(aJ);
        $("#regularTextColorPicker").faiColorPicker({
            onchange: j,
            defaultcolor: o
        });
        $("#regularTextColorPicker").on("click.fc",
        function() {
            Site.showSectionOfSitePage("foot")
        })
    }
    function K() {
        var aV = Site.getFooterStyleData();
        var aM = $("#patternChoiceBox").find(".patternChoice");
        if (aV.fis <= 0) {
            $("#patternChoice-normal").addClass("patternChoice-selected")
        } else {
            if (aV.fis == 1) {
                $("#patternChoice-level").addClass("patternChoice-selected")
            } else {
                if (aV.fis == 2) {
                    $("#patternChoice-vertical").addClass("patternChoice-selected")
                }
            }
        }
        aM.click(function() {
            aM.removeClass("patternChoice-selected");
            $(this).addClass("patternChoice-selected")
        });
        if (aV.fip == 0) {
            $("#normalItemPic").attr("checked", "checked")
        } else {
            if (aV.fip == 1) {
                $("#useItemPic").attr("checked", "checked")
            } else {
                if (aV.fip == 2) {
                    $("#noItemPic").attr("checked", "checked")
                }
            }
        }
        if (aV.fiw < 0) {
            $("#sysItemWidth").attr("checked", "checked");
            $("#setFooterWidth").hide()
        } else {
            $("#cusItemWidth").attr("checked", "checked");
            $("#setFooterWidth").show();
            $("#cusItemWidthNum").val(aV.fiw)
        }
        if (aV.fih < 0) {
            $("#sysItemHeight").attr("checked", "checked");
            $("#setFooterHeight").hide()
        } else {
            $("#cusItemHeight").attr("checked", "checked");
            $("#setFooterHeight").show();
            $("#cusItemHeightNum").val(aV.fih)
        }
        if (aV.fift.y == 0) {
            $("#sysFirstItemword").attr("checked", "checked");
            $("#cusFirstItemText").hide()
        } else {
            if (aV.fift.y == 1) {
                $("#cusFirstItemword").attr("checked", "checked");
                $("#cusFirstItemText").show()
            }
        }
        if (aV.fift.w == 1) {
            $("#firstItemTextBold").attr("checked", "checked")
        }
        if (aV.fift.d == 1) {
            $("#firstItemTextUnderline").attr("checked", "checked")
        }
        if (aV.fisp < 0) {
            $("#normalItemSpacing").attr("checked", "checked");
            $("#setItemSpaceWidth").hide()
        } else {
            $("#cusItemSpacing").attr("checked", "checked");
            $("#setItemSpaceWidth").show();
            $("#cusItemSpacingWidth").val(aV.fisp).show()
        }
        if (aV.fiv.y == 0) {
            $("#sysItemVerticalLine").attr("checked", "checked");
            $("#cusItemVerticalLineSetting").hide()
        } else {
            $("#cusItemVerticalLine").attr("checked", "checked");
            $("#cusItemVerticalLineSetting").show()
        }
        if (aV.fiv.w > -1) {
            $("#cusItemVerticalLineWidth").val(aV.fiv.w)
        }
        $("#firstItemTextColorPicker").faiColorPicker({
            onchange: k,
            defaultcolor: aV.fift.c,
        });
        $("#firstItemTextColorPicker").on("click.fc",
        function() {
            Site.showSectionOfSitePage("foot")
        });
        $("#firstItemSelectedTextColorPicker").faiColorPicker({
            onchange: u,
            defaultcolor: aV.fift.hc,
        });
        $("#firstItemSelectedTextColorPicker").on("click.fc",
        function() {
            Site.showSectionOfSitePage("foot")
        });
        $("#cusItemVerticalLineColorPicker").faiColorPicker({
            onchange: e,
            defaultcolor: aV.fiv.c,
        });
        $("#cusItemVerticalLineColorPicker").on("click.fc",
        function() {
            Site.showSectionOfSitePage("foot")
        });
        $("#secondItemTextColorPicker").faiColorPicker({
            onchange: a,
            defaultcolor: aV.fist.c,
        });
        $("#secondItemTextColorPicker").on("click.fc",
        function() {
            Site.showSectionOfSitePage("foot")
        });
        $("#secondItemSelectedTextColorPicker").faiColorPicker({
            onchange: q,
            defaultcolor: aV.fist.hc,
        });
        $("#secondItemSelectedTextColorPicker").on("click.fc",
        function() {
            Site.showSectionOfSitePage("foot")
        });
        if (Fai.top._footerItemHasSecondChild) {
            $(".J_footerSecondType").show();
            $(".J_footerSecondText").show()
        } else {
            $(".J_footerSecondType").hide();
            $(".J_footerSecondText").hide()
        }
        if (!aV.fifc) {
            $("#firstItemHref").attr("checked", "checked")
        } else {
            $("#firstItemNoHref").attr("checked", "checked")
        }
        $("#firstItemHref").click(function() {
            Site.refreshFooterFirstItemClickStatus(false);
            Site.showSectionOfSitePage("foot")
        });
        $("#firstItemNoHref").click(function() {
            Site.refreshFooterFirstItemClickStatus(true);
            Site.showSectionOfSitePage("foot")
        });
        if (aV.fiss == 0) {
            $("#autoDirection").attr("checked", "checked")
        } else {
            if (aV.fiss == 1) {
                $("#levelDirection").attr("checked", "checked")
            } else {
                if (aV.fiss == 2) {
                    $("#verticalDirection").attr("checked", "checked")
                }
            }
        }
        if (aV.fish < 0) {
            $("#sysSecondItemHeight").attr("checked", "checked");
            $("#cusSecondItemHeightNum").hide()
        } else {
            $("#cusSecondItemHeight").attr("checked", "checked");
            $("#cusSecondItemHeightNum").val(aV.fish).show()
        }
        if (aV.fist.y == 0) {
            $("#sysSecondItemword").attr("checked", "checked");
            $("#setFooterSecondText").hide()
        } else {
            if (aV.fist.y == 1) {
                $("#cusSecondItemword").attr("checked", "checked");
                $("#setFooterSecondText").show()
            }
        }
        if (aV.fist.w == 1) {
            $("#secondItemTextBold").attr("checked", "checked")
        }
        if (aV.fist.d == 1) {
            $("#secondItemTextUnderline").attr("checked", "checked")
        }
        setTimeout(function() {
            $("#firstItemTextSize").val(aV.fift.s);
            $("#firstItemTextfamily").val(aV.fift.f);
            $("#secondItemTextSize").val(aV.fist.s);
            $("#secondItemTextfamily").val(aV.fist.f)
        },
        0);
        if (Fai.top._footerItemHasSecondChild) {
            $("#footerSecondItemContainer").show()
        } else {
            $("#footerSecondItemContainer").hide()
        }
        var aN = Fai.top.$(".footerFirstItemword");
        aN.off("click.footer").on("click.footer",
        function() {
            aV.fift.y = parseInt($(this).index(aN));
            Site.saveFooterStyleData(aV);
            top._footerStyleChanged++;
            Site.styleChanged()
        });
        var aX = Fai.top.$("#sysFirstItemword"),
        aT = Fai.top.$("#cusFirstItemword");
        aX.off("click.footer").on("click.footer",
        function() {
            i(0);
            ai(false, "cusFirstItemText")
        });
        aT.off("click.footer").on("click.footer",
        function() {
            i(1);
            ai(true, "cusFirstItemText")
        });
        var aS = Fai.top.$("#sysItemVerticalLine"),
        aL = Fai.top.$("#cusItemVerticalLine");
        aS.off("click.footer").on("click.footer",
        function() {
            Z(0);
            ai(false, "cusItemVerticalLineSetting")
        });
        aL.off("click.footer").on("click.footer",
        function() {
            Z(1);
            ai(true, "cusItemVerticalLineSetting")
        });
        var aR = Fai.top.$("#sysItemWidth"),
        aK = Fai.top.$("#cusItemWidth");
        aR.off("click.footer").on("click.footer",
        function() {
            ai(false, "setFooterWidth")
        });
        aK.off("click.footer").on("click.footer",
        function() {
            ai(true, "setFooterWidth")
        });
        var aP = Fai.top.$("#sysItemHeight"),
        aQ = Fai.top.$("#cusItemHeight");
        aP.off("click.footer").on("click.footer",
        function() {
            ai(false, "setFooterHeight")
        });
        aQ.off("click.footer").on("click.footer",
        function() {
            ai(true, "setFooterHeight")
        });
        var aU = Fai.top.$("#normalItemSpacing"),
        aW = Fai.top.$("#cusItemSpacing");
        aU.off("click.footer").on("click.footer",
        function() {
            ai(false, "setItemSpaceWidth")
        });
        aW.off("click.footer").on("click.footer",
        function() {
            ai(true, "setItemSpaceWidth")
        });
        var aO = Fai.top.$("#sysSecondItemword"),
        aJ = Fai.top.$("#cusSecondItemword");
        aO.off("click.footer").on("click.footer",
        function() {
            ai(false, "setFooterSecondText");
            aq(0);
            ai(false, "cusSecondItemText")
        });
        aJ.off("click.footer").on("click.footer",
        function() {
            ai(true, "setFooterSecondText");
            aq(1);
            ai(true, "cusSecondItemText")
        })
    }
    function ai(aJ, aK) {
        aJ ? $("#" + aK).show() : $("#" + aK).hide()
    }
    function i(aK) {
        var aJ = Site.getFooterStyleData();
        aJ.fift.y = parseInt(aK);
        Site.saveFooterStyleData(aJ);
        top._footerStyleChanged++;
        Site.showSectionOfSitePage("foot");
        Site.styleChanged()
    }
    function aq(aK) {
        var aJ = Site.getFooterStyleData();
        aJ.fist.y = parseInt(aK);
        Site.saveFooterStyleData(aJ);
        top._footerStyleChanged++;
        Site.showSectionOfSitePage("foot");
        Site.styleChanged()
    }
    function Z(aK) {
        var aJ = Site.getFooterStyleData();
        aJ.fiv.y = parseInt(aK);
        Site.saveFooterStyleData(aJ);
        top._footerStyleChanged++;
        Site.showSectionOfSitePage("foot");
        Site.styleChanged()
    }
    function e(aJ) {
        Site.setFooterVerticalLineColor(aJ)
    }
    function k(aJ) {
        Site.setFooterFristItemFontColor(aJ)
    }
    function u(aJ) {
        Site.setFooterFristItemFontHoverColor(aJ)
    }
    function a(aJ) {
        Site.setFooterSecondItemFontColor(aJ)
    }
    function q(aJ) {
        Site.setFooterSecondItemFontHoverColor(aJ)
    }
    function H(aJ) {
        aa = aJ;
        s();
        D()
    }
    function S(aJ) {
        aw = aJ;
        ab();
        D()
    }
    function at(aJ) {
        al = aJ;
        G();
        D()
    }
    function j(aJ) {
        o = aJ;
        M();
        D()
    }
    function s() {
        var aJ;
        aJ = Site.getFooterStyleData();
        var aL = "normal";
        if ($("#footerNavTextBold").attr("checked")) {
            aJ.gt.w = 1;
            aL = "bolder"
        } else {
            aJ.gt.w = 0
        }
        aJ.gt.s = parseInt($("#footerNavTextSize").val());
        aJ.gt.f = $("#footerNavTextFamily").val();
        aJ.gt.c = aa;
        ab();
        var aK = "none";
        if ($("#footerDecorationCheck").attr("checked")) {
            aJ.gt.d = 1;
            aK = "underline"
        } else {
            aJ.gt.d = 0
        }
        Site.saveFooterStyleData(aJ);
        Site.setFooterNavGeneralText(aJ)
    }
    function ab() {
        var aJ = Site.getFooterStyleData();
        aJ.ht.c = aw;
        Site.saveFooterStyleData(aJ);
        Site.setFooterNavHoverText(aJ)
    }
    function G() {
        var aJ;
        aJ = Site.getFooterStyleData();
        aJ.fb.c = al;
        var aL = parseInt($("#footerBgRepeat").val());
        aJ.fb.r = aL;
        var aK = "";
        aK += al;
        var aN = aJ.fb.p;
        if (aN) {
            if (aL != -1) {
                var aM = "";
                if (aL == 0 || aL == 6 || aL == 7 || aL == 8 || aL == 9 || aL == 13 || aL == 14 || aL == 15 || aL == 16) {
                    aM = "no-repeat"
                }
                if (aL == 1 || aL == 11 || aL == 12) {
                    aM = "repeat-x"
                }
                if (aL == 2 || aL == 21 || aL == 22) {
                    aM = "repeat-y"
                }
                if (aL == 3) {
                    aM = "repeat"
                }
                if (aL == 4 || aL == 5) {
                    aM = "repeat"
                }
                var aO = "center";
                if (aL == 9 || aL == 12) {
                    aO = "bottom"
                }
                if (aL == 6 || aL == 21) {
                    aO = "left"
                }
                if (aL == 7 || aL == 22) {
                    aO = "right"
                }
                if (aL == 4 || aL == 5 || aL == 8 || aL == 11) {
                    aO = "top"
                }
                if (aL == 13) {
                    aO = "left top"
                }
                if (aL == 14) {
                    aO = "right top"
                }
                if (aL == 15) {
                    aO = "left bottom"
                }
                if (aL == 16) {
                    aO = "right bottom"
                }
                aK += " url(" + aN + ") " + aM + " " + aO
            }
        }
        Site.saveFooterStyleData(aJ);
        Site.setFooterBg(aK)
    }
    function M() {
        var aJ;
        aJ = Site.getFooterStyleData();
        aJ.rt.s = parseInt($("#regularTextSize").val());
        aJ.rt.f = $("#regularTextFamily").val();
        aJ.rt.c = o;
        Site.saveFooterStyleData(aJ);
        Site.setRegularText(aJ)
    }
    function aF(aK) {
        if (aK) {
            var aM = $.parseJSON(aK);
            var aL = aM.data[0] || {};
            var aJ = Site.getFooterStyleData();
            aJ.fb.f = aL.fileId;
            aJ.fb.p = aL.filePath;
            Site.saveFooterStyleData(aJ);
            if (aL.isMatBg) {
                aJ.r = 3;
                $("#footerBgRepeat").val(3)
            }
            G();
            am();
            $("#uploadmsgFooter").html("<a href='javascript:;' onclick='Fai.top.panelFunc.view(\"" + aL.fileId + "\");return false;'>查看</a>");
            $("#footerBgCus").find(".J_previewContent").removeClass("f-previewContent-none");
            $("#footerBgCus").find(".J_preview").html("<img class='f-previewImg' src='" + aJ.fb.p + "' onload='Fai.Img.optimize(this, {width:180, height:75, mode:Fai.Img.MODE_SCALE_DEFLATE_FILL});' alt='' />")
        }
    }
    function b() {
        var aK;
        if ($("#footerHeightCustom").attr("checked")) {
            var aJ = $("#footerHeightInput").val();
            if (aJ == "") {
                Fai.ing("高度设置不能为空", true);
                return
            } else {
                if (aJ < 0 || aJ > 1000) {
                    Fai.ing("只能设置0~1000的高度", true);
                    return
                }
            }
            if (!isNaN(parseInt(aJ))) {
                aK = Site.getFooterStyleData();
                aK.fh = parseInt(aJ);
                Site.setWebFooterHeight(aJ)
            }
        } else {
            aK = Site.getFooterStyleData();
            aK.fh = -1;
            Site.autoWebFooterHeight()
        }
        Site.saveFooterStyleData(aK);
        am()
    }
    function x(aJ) {
        if (!Y) {
            top._bgImgChanged++;
            Site.styleChanged();
            Site.showSectionOfSitePage(aJ);
            Site.setRefreshInfo("siteStyleSetting", true)
        }
    }
    function P(aL, aJ, aK) {
        var aM = "";
        var aO = "";
        var aN;
        aN = Site.getWebBackgroundData();
        if (aJ == "web") {
            aM = aN.p
        } else {
            if (aJ == "webBannerTable") {
                aM = aN.bBg.p
            } else {
                if (aJ == "webContainerTable") {
                    aM = aN.cBg.p
                } else {
                    if (aJ == "container") {
                        aM = aN.cmBg.p
                    } else {}
                }
            }
        }
        if (aL == -1) {} else {
            aO += " url(" + aM + ")";
            if (aL == 0) {
                aO += " no-repeat center center"
            } else {
                if (aL == 11) {
                    aO += " repeat-x top center"
                } else {
                    if (aL == 1) {
                        aO += " repeat-x center center "
                    } else {
                        if (aL == 12) {
                            aO += " repeat-x bottom center"
                        } else {
                            if (aL == 21) {
                                if (aK == "siteBg") {
                                    aO += " repeat-y top left"
                                } else {
                                    aO += " repeat-y center left"
                                }
                            } else {
                                if (aL == 2) {
                                    if (aK == "siteBg") {
                                        aO += " repeat-y top center"
                                    } else {
                                        aO += " repeat-y center center"
                                    }
                                } else {
                                    if (aL == 22) {
                                        if (aK == "siteBg") {
                                            aO += " repeat-y top right"
                                        } else {
                                            aO += " repeat-y center right"
                                        }
                                    } else {
                                        if (aL == 3) {
                                            if (aK == "siteBg") {
                                                aO += " repeat top"
                                            } else {
                                                aO += " repeat center"
                                            }
                                        } else {
                                            if (aL == 4 || aL == 5) {
                                                if (aK == "siteBg") {
                                                    aO += " repeat top"
                                                } else {
                                                    aO += " repeat top"
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
        return aO
    }
};
Site.bindEventToFloatPanel_addNewModule = function(g) {
    var i = Fai.top._colId;
    var a = Fai.top._extId;
    var d = Fai.top._panelOptionData.sysIndex;
    var f = Fai.top._panelOptionData.schemeCust;
    if (g == "product") {
        var b = top.Fai.popupWindow({
            closeFunc: Site.faiFloatPanel,
            title: "添加产品展示模块",
            frameSrcUrl: "manage/productModuleEdit.jsp?pos=centerTopForms&colId=" + i + "&extId=" + a + "&ram=" + Math.random(),
            width: 600,
            height: 500
        });
        Fai.top._popupOptions["popup" + b].closeArgs = 0;
        Fai.top.draggableDiv_out ? Site.logDog(100079, 48) : Site.logDog(100079, 12)
    } else {
        if (g == "article") {
            var b = top.Fai.popupWindow({
                closeFunc: Site.faiFloatPanel,
                title: "添加文章列表模块",
                frameSrcUrl: "manage/newsModuleEdit.jsp?pos=centerTopForms&colId=" + i + "&extId=" + a + "&ram=" + Math.random(),
                width: 600,
                height: 495
            });
            Fai.top._popupOptions["popup" + b].closeArgs = 0;
            Fai.top.draggableDiv_out ? Site.logDog(100079, 54) : Site.logDog(100079, 18)
        } else {
            if (g == "photo") {
                var b = top.Fai.popupWindow({
                    closeFunc: Site.faiFloatPanel,
                    title: "添加图册展示模块",
                    frameSrcUrl: "manage/photoModuleEdit.jsp?pos=centerTopForms&colId=" + i + "&extId=" + a + "&ram=" + Math.random(),
                    width: 600,
                    height: 555
                });
                Fai.top._popupOptions["popup" + b].closeArgs = 0;
                Fai.top.draggableDiv_out ? Site.logDog(100079, 55) : Site.logDog(100079, 19)
            } else {
                if (g == "file") {
                    var b = top.Fai.popupWindow({
                        closeFunc: Site.faiFloatPanel,
                        title: "添加文件下载模块",
                        frameSrcUrl: "manage/fileModuleEdit.jsp?pos=centerTopForms&colId=" + i + "&extId=" + a + "&ram=" + Math.random(),
                        width: 530,
                        height: 330
                    });
                    Fai.top._popupOptions["popup" + b].closeArgs = 0;
                    Fai.top.draggableDiv_out ? Site.logDog(100079, 59) : Site.logDog(100079, 23)
                } else {
                    if (g == "nav") {
                        var b = top.Fai.popupWindow({
                            closeFunc: Site.faiFloatPanel,
                            title: "添加栏目导航模块",
                            frameSrcUrl: "manage/navModuleEdit.jsp?pos=centerTopForms&colId=" + i + "&extId=" + a + "&ram=" + Math.random(),
                            width: 710,
                            height: 500
                        });
                        Fai.top._popupOptions["popup" + b].closeArgs = 0;
                        Fai.top.draggableDiv_out ? Site.logDog(100079, 42) : Site.logDog(100079, 6)
                    } else {
                        if (g == "rich") {
                            var b = top.Fai.popupWindow({
                                closeFunc: Site.faiFloatPanel,
                                title: "添加图文展示模块",
                                frameSrcUrl: "manage/richEdit.jsp?pos=centerTopForms&colId=" + i + "&extId=" + a + "&ram=" + Math.random(),
                                width: 825,
                                height: 500
                            });
                            Fai.top._popupOptions["popup" + b].closeArgs = 0;
                            Fai.top.draggableDiv_out ? Site.logDog(100079, 37) : Site.logDog(100079, 1)
                        } else {
                            if (g == "filter") {
                                var b = top.Fai.popupWindow({
                                    closeFunc: Site.faiFloatPanel,
                                    title: "添加产品筛选模块",
                                    frameSrcUrl: "manage/productFilterModuleEdit.jsp?pos=centerTopForms&colId=" + i + "&extId=" + a + "&ram=" + Math.random(),
                                    width: 620,
                                    height: 380
                                });
                                Fai.top._popupOptions["popup" + b].closeArgs = 0;
                                Fai.top.draggableDiv_out ? Site.logDog(100079, 52) : Site.logDog(100079, 16)
                            } else {
                                if (g == "flash") {
                                    var b = top.Fai.popupWindow({
                                        closeFunc: Site.faiFloatPanel,
                                        title: "添加Flash模块",
                                        frameSrcUrl: "manage/flashModuleEdit.jsp?pos=centerTopForms&colId=" + i + "&extId=" + a + "&ram=" + Math.random(),
                                        width: 400,
                                        height: 240
                                    });
                                    Fai.top._popupOptions["popup" + b].closeArgs = 0;
                                    Fai.top.draggableDiv_out ? Site.logDog(100079, 58) : Site.logDog(100079, 22)
                                } else {
                                    if (g == "map") {
                                        var b = top.Fai.popupWindow({
                                            closeFunc: Site.faiFloatPanel,
                                            title: "添加在线地图模块",
                                            frameSrcUrl: "manage/mapModuleEdit.jsp?pos=centerTopForms&colId=" + i + "&extId=" + a + "&ram=" + Math.random(),
                                            width: 640,
                                            height: 500
                                        });
                                        Fai.top._popupOptions["popup" + b].closeArgs = 0;
                                        Fai.top.draggableDiv_out ? Site.logDog(100079, 40) : Site.logDog(100079, 4)
                                    } else {
                                        if (g == "iframe") {
                                            var b = top.Fai.popupWindow({
                                                closeFunc: Site.faiFloatPanel,
                                                title: "添加嵌入页面模块",
                                                frameSrcUrl: "manage/iframeModuleEdit.jsp?colId=" + i + "&extId=" + a + "&ram=" + Math.random(),
                                                width: 490,
                                                height: 210
                                            });
                                            Fai.top._popupOptions["popup" + b].closeArgs = 0;
                                            Fai.top.draggableDiv_out ? Site.logDog(100079, 68) : Site.logDog(100079, 32)
                                        } else {
                                            if (g == "catalog") {
                                                var b = top.Fai.popupWindow({
                                                    closeFunc: Site.faiFloatPanel,
                                                    title: "添加产品目录模块",
                                                    frameSrcUrl: "manage/productCatalogModuleEdit.jsp?colId=" + i + "&extId=" + a + "&ram=" + Math.random(),
                                                    width: 560,
                                                    height: 375
                                                });
                                                Fai.top._popupOptions["popup" + b].closeArgs = 0;
                                                Fai.top.draggableDiv_out ? Site.logDog(100079, 51) : Site.logDog(100079, 15)
                                            } else {
                                                if (g == "qqonline") {
                                                    var b = top.Fai.popupWindow({
                                                        closeFunc: Site.faiFloatPanel,
                                                        title: "添加QQ在线模块",
                                                        frameSrcUrl: "manage/qqOnlineModuleEdit.jsp?colId=" + i + "&extId=" + a + "&ram=" + Math.random(),
                                                        width: 550,
                                                        height: 350
                                                    });
                                                    Fai.top._popupOptions["popup" + b].closeArgs = 0
                                                } else {
                                                    if (g == "vote") {
                                                        var b = top.Fai.popupWindow({
                                                            closeFunc: Site.faiFloatPanel,
                                                            title: "添加在线投票模块",
                                                            frameSrcUrl: "manage/voteModuleEdit.jsp?colId=" + i + "&extId=" + a + "&ram=" + Math.random(),
                                                            width: 570,
                                                            height: 468
                                                        });
                                                        Fai.top._popupOptions["popup" + b].closeArgs = 0;
                                                        Fai.top.draggableDiv_out ? Site.logDog(100079, 61) : Site.logDog(100079, 25)
                                                    } else {
                                                        if (g == "siteForm") {
                                                            var b = top.Fai.popupWindow({
                                                                closeFunc: Site.faiFloatPanel,
                                                                title: "添加在线表单模块",
                                                                frameSrcUrl: "manage/siteFormModuleEdit.jsp?colId=" + i + "&extId=" + a + "&ram=" + Math.random(),
                                                                width: 560,
                                                                height: 390
                                                            });
                                                            Fai.top._popupOptions["popup" + b].closeArgs = 0;
                                                            Fai.top.draggableDiv_out ? Site.logDog(100079, 62) : Site.logDog(100079, 26)
                                                        } else {
                                                            if (g == "newsgroup") {
                                                                var b = top.Fai.popupWindow({
                                                                    closeFunc: Site.faiFloatPanel,
                                                                    title: "添加文章分类模块",
                                                                    frameSrcUrl: "manage/newsGroupModuleEdit.jsp?colId=" + i + "&extId=" + a + "&ram=" + Math.random(),
                                                                    width: 500,
                                                                    height: 280
                                                                });
                                                                Fai.top._popupOptions["popup" + b].closeArgs = 0;
                                                                Fai.top.draggableDiv_out ? Site.logDog(100079, 72) : Site.logDog(100079, 36)
                                                            } else {
                                                                if (g == "productGroup") {
                                                                    var b = top.Fai.popupWindow({
                                                                        closeFunc: Site.faiFloatPanel,
                                                                        title: "添加产品分类模块",
                                                                        frameSrcUrl: "manage/productGroupModuleEdit.jsp?colId=" + i + "&extId=" + a + "&ram=" + Math.random(),
                                                                        width: 560,
                                                                        height: 390
                                                                    });
                                                                    Fai.top._popupOptions["popup" + b].closeArgs = 0;
                                                                    Fai.top.draggableDiv_out ? Site.logDog(100079, 49) : Site.logDog(100079, 13)
                                                                } else {
                                                                    if (g == "productMallGroup") {
                                                                        var b = top.Fai.popupWindow({
                                                                            closeFunc: Site.faiFloatPanel,
                                                                            title: "添加商城分类模块",
                                                                            frameSrcUrl: "manage/productGroupMallModuleEdit.jsp?colId=" + i + "&extId=" + a + "&ram=" + Math.random(),
                                                                            width: 350,
                                                                            height: 150
                                                                        });
                                                                        Fai.top._popupOptions["popup" + b].closeArgs = 0;
                                                                        Fai.top.draggableDiv_out ? Site.logDog(100079, 76) : Site.logDog(100079, 75)
                                                                    } else {
                                                                        if (g == "productLabel") {
                                                                            var b = top.Fai.popupWindow({
                                                                                closeFunc: Site.faiFloatPanel,
                                                                                title: "添加产品标签模块",
                                                                                frameSrcUrl: "manage/productLabelModuleEdit.jsp?colId=" + i + "&extId=" + a + "&ram=" + Math.random(),
                                                                                width: 500,
                                                                                height: 296
                                                                            });
                                                                            Fai.top._popupOptions["popup" + b].closeArgs = 0;
                                                                            Fai.top.draggableDiv_out ? Site.logDog(100079, 50) : Site.logDog(100079, 14)
                                                                        } else {
                                                                            if (g == "weather") {
                                                                                var b = top.Fai.popupWindow({
                                                                                    closeFunc: Site.faiFloatPanel,
                                                                                    title: "添加天气信息模块",
                                                                                    frameSrcUrl: "manage/weatherModuleEdit.jsp?colId=" + i + "&extId=" + a + "&ram=" + Math.random(),
                                                                                    width: 530,
                                                                                    height: 340
                                                                                });
                                                                                Fai.top._popupOptions["popup" + b].closeArgs = 0;
                                                                                Fai.top.draggableDiv_out ? Site.logDog(100079, 45) : Site.logDog(100079, 9)
                                                                            } else {
                                                                                if (g == "floatImg") {
                                                                                    Fai.ing("正在保存……", false);
                                                                                    $.ajax({
                                                                                        type: "post",
                                                                                        url: "ajax/module_h.jsp?cmd=add&style=79&colId=" + i + "&extId=" + a,
                                                                                        data: "name=" + Fai.encodeUrl("浮动图片"),
                                                                                        error: function() {
                                                                                            Fai.ing("服务繁忙，请稍候重试", false)
                                                                                        },
                                                                                        success: function(k) {
                                                                                            var j = $.parseJSON(k);
                                                                                            if (Fai.successHandle(k, "添加成功", "系统错误", "", 3, 1)) {
                                                                                                Site.addNewModule(j.id, j.div, null, null, {
                                                                                                    returnModuledata: j.moduleData
                                                                                                })
                                                                                            }
                                                                                        }
                                                                                    });
                                                                                    Fai.top.draggableDiv_out ? Site.logDog(100079, 80) : Site.logDog(100079, 79)
                                                                                } else {
                                                                                    if (g == "photoGroup") {
                                                                                        var b = top.Fai.popupWindow({
                                                                                            closeFunc: Site.faiFloatPanel,
                                                                                            title: "添加图册目录模块",
                                                                                            frameSrcUrl: "manage/photoGroupModuleEdit.jsp?colId=" + i + "&extId=" + a + "&ram=" + Math.random(),
                                                                                            width: 450,
                                                                                            height: 250
                                                                                        });
                                                                                        Fai.top._popupOptions["popup" + b].closeArgs = 0;
                                                                                        Fai.top.draggableDiv_out ? Site.logDog(100079, 56) : Site.logDog(100079, 20)
                                                                                    } else {
                                                                                        if (g == "tab") {
                                                                                            var b = top.Fai.popupWindow({
                                                                                                closeFunc: Site.faiFloatPanel,
                                                                                                title: "添加模块组模块",
                                                                                                frameSrcUrl: "manage/tabModuleEdit.jsp?colId=" + i + "&extId=" + a + "&ram=" + Math.random(),
                                                                                                width: 450,
                                                                                                height: 270
                                                                                            });
                                                                                            Fai.top._popupOptions["popup" + b].closeArgs = 0;
                                                                                            Fai.top.draggableDiv_out ? Site.logDog(100079, 46) : Site.logDog(100079, 10)
                                                                                        } else {
                                                                                            if (g == "mulModuleColTwo") {
                                                                                                var b = top.Fai.popupWindow({
                                                                                                    closeFunc: Site.faiFloatPanel,
                                                                                                    title: "添加模块列模块",
                                                                                                    frameSrcUrl: "manage/mulModuleColEdit.jsp?num=2&colId=" + i + "&extId=" + a + "&ram=" + Math.random(),
                                                                                                    width: 585,
                                                                                                    height: 300
                                                                                                });
                                                                                                Fai.top._popupOptions["popup" + b].closeArgs = 0;
                                                                                                Fai.top.draggableDiv_out ? Site.logDog(100079, 47) : Site.logDog(100079, 11)
                                                                                            } else {
                                                                                                if (g == "mulModuleColThree") {
                                                                                                    var b = top.Fai.popupWindow({
                                                                                                        closeFunc: Site.faiFloatPanel,
                                                                                                        title: "添加模块列模块",
                                                                                                        frameSrcUrl: "manage/mulModuleColEdit.jsp?num=3&colId=" + i + "&extId=" + a + "&ram=" + Math.random(),
                                                                                                        width: 585,
                                                                                                        height: 300
                                                                                                    });
                                                                                                    Fai.top._popupOptions["popup" + b].closeArgs = 0;
                                                                                                    Fai.top.draggableDiv_out ? Site.logDog(100079, 47) : Site.logDog(100079, 11)
                                                                                                } else {
                                                                                                    if (g == "mulModuleColFour") {
                                                                                                        var b = top.Fai.popupWindow({
                                                                                                            closeFunc: Site.faiFloatPanel,
                                                                                                            title: "添加模块列模块",
                                                                                                            frameSrcUrl: "manage/mulModuleColEdit.jsp?num=4&colId=" + i + "&extId=" + a + "&ram=" + Math.random(),
                                                                                                            width: 585,
                                                                                                            height: 300
                                                                                                        });
                                                                                                        Fai.top._popupOptions["popup" + b].closeArgs = 0;
                                                                                                        Fai.top.draggableDiv_out ? Site.logDog(100079, 47) : Site.logDog(100079, 11)
                                                                                                    } else {
                                                                                                        if (g == "mulModuleColFive") {
                                                                                                            var b = top.Fai.popupWindow({
                                                                                                                closeFunc: Site.faiFloatPanel,
                                                                                                                title: "添加模块列模块",
                                                                                                                frameSrcUrl: "manage/mulModuleColEdit.jsp?num=5&colId=" + i + "&extId=" + a + "&ram=" + Math.random(),
                                                                                                                width: 585,
                                                                                                                height: 300
                                                                                                            });
                                                                                                            Fai.top._popupOptions["popup" + b].closeArgs = 0;
                                                                                                            Fai.top.draggableDiv_out ? Site.logDog(100079, 47) : Site.logDog(100079, 11)
                                                                                                        } else {
                                                                                                            if (g == "link") {
                                                                                                                var b = top.Fai.popupWindow({
                                                                                                                    closeFunc: Site.faiFloatPanel,
                                                                                                                    title: "添加图文链接模块",
                                                                                                                    frameSrcUrl: "manage/linkModuleEdit.jsp?colId=" + i + "&extId=" + a + "&ram=" + Math.random(),
                                                                                                                    width: 650,
                                                                                                                    height: 360
                                                                                                                });
                                                                                                                Fai.top._popupOptions["popup" + b].closeArgs = 0;
                                                                                                                Fai.top.draggableDiv_out ? Site.logDog(100079, 38) : Site.logDog(100079, 2)
                                                                                                            } else {
                                                                                                                if (g == "table") {
                                                                                                                    var b = top.Fai.popupWindow({
                                                                                                                        closeFunc: Site.faiFloatPanel,
                                                                                                                        title: "添加简易表格模块",
                                                                                                                        frameSrcUrl: "manage/tableModuleEdit.jsp?colId=" + i + "&extId=" + a + "&ram=" + Math.random(),
                                                                                                                        width: 630,
                                                                                                                        height: 355
                                                                                                                    });
                                                                                                                    Fai.top._popupOptions["popup" + b].closeArgs = 0;
                                                                                                                    Fai.top.draggableDiv_out ? Site.logDog(100079, 60) : Site.logDog(100079, 24)
                                                                                                                } else {
                                                                                                                    if (g == "flv") {
                                                                                                                        var b = top.Fai.popupWindow({
                                                                                                                            closeFunc: Site.faiFloatPanel,
                                                                                                                            title: "添加在线视频模块",
                                                                                                                            frameSrcUrl: "manage/flvModuleEdit.jsp?colId=" + i + "&extId=" + a + "&ram=" + Math.random(),
                                                                                                                            width: 400,
                                                                                                                            height: 220
                                                                                                                        });
                                                                                                                        Fai.top._popupOptions["popup" + b].closeArgs = 0;
                                                                                                                        Fai.top.draggableDiv_out ? Site.logDog(100079, 57) : Site.logDog(100079, 21)
                                                                                                                    } else {
                                                                                                                        if (g == "code") {
                                                                                                                            var b = top.Fai.popupWindow({
                                                                                                                                closeFunc: Site.faiFloatPanel,
                                                                                                                                title: "添加插件代码模块",
                                                                                                                                frameSrcUrl: "manage/codeModuleEdit.jsp?colId=" + i + "&extId=" + a + "&ram=" + Math.random(),
                                                                                                                                width: 560,
                                                                                                                                height: 350
                                                                                                                            });
                                                                                                                            Fai.top._popupOptions["popup" + b].closeArgs = 0;
                                                                                                                            Fai.top.draggableDiv_out ? Site.logDog(100079, 69) : Site.logDog(100079, 33)
                                                                                                                        } else {
                                                                                                                            if (g == "weiboShow") {
                                                                                                                                var b = top.Fai.popupWindow({
                                                                                                                                    closeFunc: Site.faiFloatPanel,
                                                                                                                                    title: "添加新浪微博秀模块",
                                                                                                                                    frameSrcUrl: "manage/weiboShowModuleEdit.jsp?colId=" + i + "&extId=" + a + "&ram=" + Math.random(),
                                                                                                                                    width: 500,
                                                                                                                                    height: 350
                                                                                                                                });
                                                                                                                                Fai.top._popupOptions["popup" + b].closeArgs = 0;
                                                                                                                                Fai.top.draggableDiv_out ? Site.logDog(100079, 70) : Site.logDog(100079, 34)
                                                                                                                            } else {
                                                                                                                                if (g == "notice") {
                                                                                                                                    var b = top.Fai.popupWindow({
                                                                                                                                        closeFunc: Site.faiFloatPanel,
                                                                                                                                        title: "添加滚动公告模块",
                                                                                                                                        frameSrcUrl: "manage/noticeModuleEdit.jsp?colId=" + i + "&extId=" + a + "&ram=" + Math.random(),
                                                                                                                                        width: 705,
                                                                                                                                        height: 345
                                                                                                                                    });
                                                                                                                                    Fai.top._popupOptions["popup" + b].closeArgs = 0;
                                                                                                                                    Fai.top.draggableDiv_out ? Site.logDog(100079, 39) : Site.logDog(100079, 3)
                                                                                                                                } else {
                                                                                                                                    if (g == "serviceOnline") {
                                                                                                                                        var b = top.Fai.popupWindow({
                                                                                                                                            closeFunc: Site.faiFloatPanel,
                                                                                                                                            title: "添加在线客服模块",
                                                                                                                                            frameSrcUrl: "manage/serviceOnlineModuleEdit.jsp?colId=" + i + "&extId=" + a + "&ram=" + Math.random(),
                                                                                                                                            width: 655,
                                                                                                                                            height: 340
                                                                                                                                        });
                                                                                                                                        Fai.top._popupOptions["popup" + b].closeArgs = 0;
                                                                                                                                        Fai.top.draggableDiv_out ? Site.logDog(100079, 41) : Site.logDog(100079, 5)
                                                                                                                                    } else {
                                                                                                                                        if (g == "uicheck") {
                                                                                                                                            var b = top.Fai.popupWindow({
                                                                                                                                                closeFunc: Site.faiFloatPanel,
                                                                                                                                                title: "添加ui检查模块",
                                                                                                                                                frameSrcUrl: "manage/uicheckEdit.jsp?colId=" + i + "&extId=" + a + "&ram=" + Math.random(),
                                                                                                                                                width: 300,
                                                                                                                                                height: 100
                                                                                                                                            });
                                                                                                                                            Fai.top._popupOptions["popup" + b].closeArgs = 0;
                                                                                                                                            Fai.top.draggableDiv_out ? Site.logDog(100079, 71) : Site.logDog(100079, 35)
                                                                                                                                        } else {
                                                                                                                                            if (g == "memberLogin") {
                                                                                                                                                var b = top.Fai.popupWindow({
                                                                                                                                                    closeFunc: Site.faiFloatPanel,
                                                                                                                                                    title: "添加会员登录模块",
                                                                                                                                                    frameSrcUrl: "manage/memberModuleEdit.jsp?colId=" + i + "&extId=" + a + "&ram=" + Math.random(),
                                                                                                                                                    width: 515,
                                                                                                                                                    height: 280
                                                                                                                                                });
                                                                                                                                                Fai.top._popupOptions["popup" + b].closeArgs = 0;
                                                                                                                                                Fai.top.draggableDiv_out ? Site.logDog(100079, 43) : Site.logDog(100079, 7)
                                                                                                                                            } else {
                                                                                                                                                if (g == "siteSearch") {
                                                                                                                                                    var b = top.Fai.popupWindow({
                                                                                                                                                        closeFunc: Site.faiFloatPanel,
                                                                                                                                                        title: "添加全站搜索模块",
                                                                                                                                                        frameSrcUrl: "manage/siteSearchModuleEdit.jsp?colId=" + i + "&extId=" + a + "&ram=" + Math.random(),
                                                                                                                                                        width: 568,
                                                                                                                                                        height: 400
                                                                                                                                                    });
                                                                                                                                                    Fai.top._popupOptions["popup" + b].closeArgs = 0;
                                                                                                                                                    Fai.top.draggableDiv_out ? Site.logDog(100079, 44) : Site.logDog(100079, 8)
                                                                                                                                                } else {
                                                                                                                                                    if (g == "productSearch") {
                                                                                                                                                        var b = top.Fai.popupWindow({
                                                                                                                                                            closeFunc: Site.faiFloatPanel,
                                                                                                                                                            title: "添加产品搜索模块",
                                                                                                                                                            frameSrcUrl: "manage/productSearchModuleEdit.jsp?&colId=" + i + "&extId=" + a + "&ram=" + Math.random(),
                                                                                                                                                            width: 568,
                                                                                                                                                            height: 400
                                                                                                                                                        });
                                                                                                                                                        Fai.top._popupOptions["popup" + b].closeArgs = 0;
                                                                                                                                                        Fai.top.draggableDiv_out ? Site.logDog(100079, 53) : Site.logDog(100079, 17)
                                                                                                                                                    } else {
                                                                                                                                                        if (g == "siteQrCode") {
                                                                                                                                                            var b = top.Fai.popupWindow({
                                                                                                                                                                closeFunc: Site.faiFloatPanel,
                                                                                                                                                                title: "添加网站二维码模块",
                                                                                                                                                                frameSrcUrl: "manage/webSiteQRCodeModuleEdit.jsp?&colId=" + i + "&extId=" + a + "&ram=" + Math.random(),
                                                                                                                                                                width: 400,
                                                                                                                                                                height: 176
                                                                                                                                                            });
                                                                                                                                                            Fai.top._popupOptions["popup" + b].closeArgs = 0;
                                                                                                                                                            Fai.top.draggableDiv_out ? Site.logDog(100079, 66) : Site.logDog(100079, 30)
                                                                                                                                                        } else {
                                                                                                                                                            if (g == "date") {
                                                                                                                                                                var b = top.Fai.popupWindow({
                                                                                                                                                                    closeFunc: Site.faiFloatPanel,
                                                                                                                                                                    title: "添加当前时间模块",
                                                                                                                                                                    frameSrcUrl: "manage/dateModuleEdit.jsp?&colId=" + i + "&extId=" + a + "&ram=" + Math.random(),
                                                                                                                                                                    width: 550,
                                                                                                                                                                    height: 360
                                                                                                                                                                });
                                                                                                                                                                Fai.top._popupOptions["popup" + b].closeArgs = 0;
                                                                                                                                                                Fai.top.draggableDiv_out ? Site.logDog(100079, 64) : Site.logDog(100079, 28)
                                                                                                                                                            } else {
                                                                                                                                                                if (g == "location") {
                                                                                                                                                                    if (i == d) {
                                                                                                                                                                        Fai.ing("首页不能添加当前位置模块");
                                                                                                                                                                        return
                                                                                                                                                                    }
                                                                                                                                                                    var b = top.Fai.popupWindow({
                                                                                                                                                                        closeFunc: Site.faiFloatPanel,
                                                                                                                                                                        title: "添加当前位置模块",
                                                                                                                                                                        frameSrcUrl: "manage/locationModuleEdit.jsp?&colId=" + i + "&extId=" + a + "&ram=" + Math.random(),
                                                                                                                                                                        width: 340,
                                                                                                                                                                        height: 80
                                                                                                                                                                    });
                                                                                                                                                                    Fai.top._popupOptions["popup" + b].closeArgs = 0;
                                                                                                                                                                    Fai.top.draggableDiv_out ? Site.logDog(100079, 65) : Site.logDog(100079, 29)
                                                                                                                                                                } else {
                                                                                                                                                                    if (g == "indexFavorite") {
                                                                                                                                                                        var b = top.Fai.popupWindow({
                                                                                                                                                                            closeFunc: Site.faiFloatPanel,
                                                                                                                                                                            title: "添加收藏本站模块",
                                                                                                                                                                            frameSrcUrl: "manage/favoriteModuleEdit.jsp?&colId=" + i + "&extId=" + a + "&ram=" + Math.random(),
                                                                                                                                                                            width: 340,
                                                                                                                                                                            height: 80
                                                                                                                                                                        });
                                                                                                                                                                        Fai.top._popupOptions["popup" + b].closeArgs = 0;
                                                                                                                                                                        Fai.top.draggableDiv_out ? Site.logDog(100079, 67) : Site.logDog(100079, 31)
                                                                                                                                                                    } else {
                                                                                                                                                                        if (g == "shareTo") {
                                                                                                                                                                            var b = top.Fai.popupWindow({
                                                                                                                                                                                closeFunc: Site.faiFloatPanel,
                                                                                                                                                                                title: "添加分享网站模块",
                                                                                                                                                                                frameScrolling: "no",
                                                                                                                                                                                frameSrcUrl: "manage/shareToModuleEdit.jsp?&colId=" + i + "&extId=" + a + "&ram=" + Math.random(),
                                                                                                                                                                                width: 500,
                                                                                                                                                                                height: 450
                                                                                                                                                                            });
                                                                                                                                                                            Fai.top._popupOptions["popup" + b].closeArgs = 0;
                                                                                                                                                                            Fai.top.draggableDiv_out ? Site.logDog(100079, 63) : Site.logDog(100079, 27)
                                                                                                                                                                        } else {
                                                                                                                                                                            if (g == "cust" && f) {
                                                                                                                                                                                var c = Fai.top._panelOptionData.schemeCust_popupUrl;
                                                                                                                                                                                var h = Fai.top._panelOptionData.schemeCust_popupWidth;
                                                                                                                                                                                var e = Fai.top._panelOptionData.schemeCust_popupHeight;
                                                                                                                                                                                var b = top.Fai.popupWindow({
                                                                                                                                                                                    closeFunc: Site.faiFloatPanel,
                                                                                                                                                                                    title: "添加定制模块",
                                                                                                                                                                                    frameSrcUrl: "cust/" + c + "&ram=" + Math.random(),
                                                                                                                                                                                    width: '"' + h + '"',
                                                                                                                                                                                    height: '"' + e + '"'
                                                                                                                                                                                });
                                                                                                                                                                                Fai.top._popupOptions["popup" + b].closeArgs = 0
                                                                                                                                                                            } else {
                                                                                                                                                                                if (g == "msgSubmit") {
                                                                                                                                                                                    var b = top.Fai.popupWindow({
                                                                                                                                                                                        closeFunc: Site.faiFloatPanel,
                                                                                                                                                                                        title: "添加留言提交模块",
                                                                                                                                                                                        frameSrcUrl: "manage/msgSubmitModuleEdit.jsp?colId=" + i + "&extId=" + a + "&ram=" + Math.random(),
                                                                                                                                                                                        width: 350,
                                                                                                                                                                                        height: 120
                                                                                                                                                                                    });
                                                                                                                                                                                    Fai.top._popupOptions["popup" + b].closeArgs = 0;
                                                                                                                                                                                    Fai.top.draggableDiv_out ? Site.logDog(100079, 74) : Site.logDog(100079, 73)
                                                                                                                                                                                } else {
                                                                                                                                                                                    if (g == "fullmeasure") {
                                                                                                                                                                                        var b = top.Fai.popupWindow({
                                                                                                                                                                                            closeFunc: Site.faiFloatPanel,
                                                                                                                                                                                            title: "添加通栏模块",
                                                                                                                                                                                            frameSrcUrl: "manage/styleFullmeasure.jsp?colId=" + i + "&extId=" + a + "&ram=" + Math.random(),
                                                                                                                                                                                            width: 480,
                                                                                                                                                                                            height: 300
                                                                                                                                                                                        });
                                                                                                                                                                                        Fai.top._popupOptions["popup" + b].closeArgs = 0;
                                                                                                                                                                                        Fai.top.draggableDiv_out ? Site.logDog(100079, 78) : Site.logDog(100079, 77)
                                                                                                                                                                                    } else {
                                                                                                                                                                                        if (g == "floatBtn") {
                                                                                                                                                                                            var b = top.Fai.popupWindow({
                                                                                                                                                                                                closeFunc: Site.faiFloatPanel,
                                                                                                                                                                                                title: "添加浮动按钮模块",
                                                                                                                                                                                                frameSrcUrl: "manage/floatBtnEdit.jsp?colId=" + i + "&extId=" + a + "&ram=" + Math.random(),
                                                                                                                                                                                                width: 560,
                                                                                                                                                                                                height: 390
                                                                                                                                                                                            });
                                                                                                                                                                                            Fai.top.draggableDiv_out ? Site.logDog(100079, 82) : Site.logDog(100079, 81);
                                                                                                                                                                                            Fai.top._popupOptions["popup" + b].closeArgs = 0
                                                                                                                                                                                        } else {
                                                                                                                                                                                            if (g == "shoppingCart") {
                                                                                                                                                                                                if (!Fai.top._mallOpen) {
                                                                                                                                                                                                    Fai.ing("该模块开通商城功能后可用。 <a id='J_openMall' href='javascript:;'>立即开通</a>。");
                                                                                                                                                                                                    Fai.top.$("#J_openMall").off("click.sC").on("click.sC",
                                                                                                                                                                                                    function() {
                                                                                                                                                                                                        Site.showTopManageFrame("manageFrameMallEdit")
                                                                                                                                                                                                    });
                                                                                                                                                                                                    return
                                                                                                                                                                                                }
                                                                                                                                                                                                var b = top.Fai.popupWindow({
                                                                                                                                                                                                    closeFunc: Site.faiFloatPanel,
                                                                                                                                                                                                    title: "购物车模块",
                                                                                                                                                                                                    frameSrcUrl: "manage/shoppingCartModuleEdit.jsp?colId=" + i + "&extId=" + a + "&ram=" + Math.random(),
                                                                                                                                                                                                    width: 520,
                                                                                                                                                                                                    height: 380
                                                                                                                                                                                                });
                                                                                                                                                                                                Fai.top.draggableDiv_out ? Site.logDog(100079, 84) : Site.logDog(100079, 83);
                                                                                                                                                                                                Fai.top._popupOptions["popup" + b].closeArgs = 0
                                                                                                                                                                                            } else {
                                                                                                                                                                                                if (g == "photoCard") {
                                                                                                                                                                                                    var b = top.Fai.popupWindow({
                                                                                                                                                                                                        closeFunc: Site.faiFloatPanel,
                                                                                                                                                                                                        title: "添加魔方图册",
                                                                                                                                                                                                        frameSrcUrl: "manage/photoCardModuleEdit.jsp?colId=" + i + "&extId=" + a + "&ram=" + Math.random(),
                                                                                                                                                                                                        width: 666,
                                                                                                                                                                                                        height: 594
                                                                                                                                                                                                    });
                                                                                                                                                                                                    Fai.top.draggableDiv_out ? Site.logDog(100079, 86) : Site.logDog(100079, 85);
                                                                                                                                                                                                    Fai.top._popupOptions["popup" + b].closeArgs = 0
                                                                                                                                                                                                } else {
                                                                                                                                                                                                    if (g == "mallCoupon") {
                                                                                                                                                                                                        var b = top.Fai.popupWindow({
                                                                                                                                                                                                            closeFunc: Site.faiFloatPanel,
                                                                                                                                                                                                            title: "编辑优惠券",
                                                                                                                                                                                                            frameSrcUrl: "manage/couponModuleEdit.jsp?colId=" + i + "&extId=" + a + "&ram=" + Math.random(),
                                                                                                                                                                                                            width: 500,
                                                                                                                                                                                                            height: 280
                                                                                                                                                                                                        });
                                                                                                                                                                                                        Fai.top.draggableDiv_out ? Site.logDog(100079, 88) : Site.logDog(100079, 87);
                                                                                                                                                                                                        Fai.top._popupOptions["popup" + b].closeArgs = 0
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
                            }
                        }
                    }
                }
            }
        }
    }
    Site.setRefreshInfo("moduleEdit", true)
};
Site.faiFloatPanelDraggable = function() {
    Fai.top.$("#faiFloatPanel").draggable({
        axis: "x",
        scroll: false,
        cursor: "move",
        distance: 3,
        opacity: 0.8,
        cancel: ".panelContentContainer, #otherSectionSelecterContainer",
        start: function() {
            Fai.top.$("#faiFloatPanelOverLay").show();
            Fai.top.$("#colorpanel").remove();
            Fai.top.$(".faiColorPicker").remove()
        },
        stop: function() {
            var d = Fai.top.$(".floatRightTop").offset().left;
            var c = d / 2;
            var e = d - $(this).outerWidth() + 1;
            var b = 300;
            var a = Fai.top.$("#faiFloatPanelIconContainer");
            var h = 56;
            var g = h;
            var f = d - h - a.outerWidth();
            if (($(this).offset().left + ($(this).outerWidth() / 2)) < c) {
                $(this).attr("location", "left").removeClass("faiFloatPanel_right").addClass("faiFloatPanel_left").animate({
                    left: "0"
                },
                b);
                a.attr({
                    location: "left"
                }).css({
                    top: "40%",
                    left: g + "px"
                })
            } else {
                $(this).attr("location", "right").removeClass("faiFloatPanel_left").addClass("faiFloatPanel_right").animate({
                    left: e + "px"
                },
                b);
                a.attr({
                    location: "right"
                }).css({
                    top: "40%",
                    left: f + "px"
                })
            }
            a.show();
            a.removeClass("faiFloatPanelIconContainer_left faiFloatPanelIconContainer_right");
            $.cookie("faiFloatPanelIcon_left", a.offset().left, {
                expires: 365,
                path: "/"
            });
            $.cookie("faiFloatPanelIcon_top", a.offset().top, {
                expires: 365,
                path: "/"
            });
            a.hide();
            Fai.top.$("#faiFloatPanelOverLay").hide()
        }
    })
};
Site.faiFloatPanelModuleDraggable = function() {
    var c = Fai.top.$("#faiFloatPanel");
    var b = c.find("#addModuleContentContainer").find(".panelModuleIconContent");
    b.draggable("destroy");
    b.draggable({
        helper: function() {
            return "<div id='faiFloatPanelDragDiv' class='panelContentContainer' style='width:80px;height:80px;cursor:move;'><div class='" + $(this).attr("class") + " good' style='width:80px;height:80px;padding:0;margin:0;'></div></div>"
        },
        appendTo: "#g_main",
        cursor: "move",
        zIndex: 9999,
        opacity: 0.6,
        connectToSortable: ".column, .fullmeasureContent",
        start: function() {
            Fai.top.draggableDiv_out = false;
            Fai.top.draggableDiv_enable = true;
            if (Fai.top._appendLayout == 24 || Fai.top._appendLayout == 25) {
                Fai.top._appendLayout == 2
            }
            Fai.top._appendLayout = Site.getAppendLayoutNum();
            Fai.top.dragToAddModule = true;
            Fai.top.dragInSortable = false;
            Fai.top.inSortableList = []
        },
        drag: function(d, e) {
            if (!Fai.top.dragInSortable) {
                if (c.attr("location") == "left") {
                    if ((e.offset.left + 16) > (c.offset().left + c.width())) {
                        Site.hideFaiFloatPanel();
                        Fai.top.draggableDiv_out = true
                    }
                } else {
                    if ((e.offset.left + 80) < c.offset().left) {
                        Site.hideFaiFloatPanel();
                        Fai.top.draggableDiv_out = true
                    }
                }
            } else {
                Site.hideFaiFloatPanel();
                Fai.top.draggableDiv_out = true
            }
        },
        stop: function(d, e) {
            if (Fai.top.draggableDiv_out && Fai.top.draggableDiv_enable) {
                Fai.top.draggableDiv_pageX = d.pageX;
                Fai.top.draggableDiv_pageY = d.pageY;
                Fai.top.draggableDiv_scrollTop = Fai.top.$("#g_main").scrollTop() || 0;
                $(this).children().eq(0).trigger("click")
            }
            Fai.top.$("#g_main").find("li.panelModuleIconContent").remove();
            Fai.top.dragToAddModule = false;
            Fai.top.dragInSortable = false;
            if ($.inArray("fullmeasureContent", Fai.top.inSortableList) > -1) {
                $(".fullmeasureContent").each(function(f, g) {
                    if ($(g).data("_sortabletmpForm")) {
                        $(g).data("_sortabletmpForm").remove()
                    }
                });
                $(".mulMColList").sortable("option", "disabled", false);
                $(".mulMColList").addClass("column");
                $(".formTabCntId").sortable("option", "disabled", false);
                $(".form").removeClass("formUnsortable");
                $(".formTabButtonList").sortable("option", "disabled", false);
                $(".formTab").sortable("option", "disabled", false);
                Site.displayAddModule();
                Site.enableEditLayer();
                Fai.top.$("body").enableSelection();
                Fai.startInterval(null)
            }
            if ($.inArray("column", Fai.top.inSortableList) > -1) {
                Site.enableEditLayer();
                Fai.top.$("body").enableSelection();
                Fai.startInterval(null);
                Fai.top.$(".column .form, .floatForms .form, .absForms .form").each(function(f, g) {
                    if ($(g).hasClass("formStyle35")) {
                        $(g).find(".form .formTab").addClass("column")
                    }
                });
                Fai.top.$(".column .form").each(function(g, h) {
                    var f = $(h);
                    f.removeAttr("style")
                });
                Fai.top.$(".column").each(function(g, h) {
                    var f = $(h);
                    if (f.data("_sortabletmpForm")) {
                        f.data("_sortabletmpForm").remove()
                    }
                });
                $(".mulMColList").sortable("option", "disabled", false);
                $(".mulMColList").addClass("column");
                $(".mulMColList").sortable("option", "placeholder", "g_middlePlaceholder");
                $(".formTabCntId").sortable("option", "disabled", false);
                $(".form").removeClass("formUnsortable");
                $(".formTabButtonList").sortable("option", "disabled", false);
                $(".formTab").sortable("option", "disabled", false)
            }
        }
    });
    var a = b.filter(".panelModuleIcon_fullmeasure");
    a.draggable("destroy");
    a.draggable({
        helper: function() {
            return "<div id='faiFloatPanelDragDiv' class='panelContentContainer' style='width:80px;height:80px;cursor:move;z-index:99999;'><div class='" + $(this).attr("class") + " good' style='width:80px;height:80px;padding:0;margin:0;'></div></div>"
        },
        appendTo: "#g_main",
        cursor: "move",
        zIndex: 9999,
        opacity: 0.6,
        connectToSortable: ".fullmeasureContainer",
        start: function(d, e) {
            Fai.top.draggableDiv_out = false;
            Fai.top.draggableDiv_enable = true;
            Fai.top.dragToAddModule = true;
            Fai.top.dragInSortable = false;
            Fai.top.inSortableList = []
        },
        drag: function(d, e) {
            if (!Fai.top.dragInSortable) {
                if (c.attr("location") == "left") {
                    if ((e.offset.left + 16) > (c.offset().left + c.width())) {
                        Site.hideFaiFloatPanel();
                        Fai.top.draggableDiv_out = true
                    }
                } else {
                    if ((e.offset.left + 80) < c.offset().left) {
                        Site.hideFaiFloatPanel();
                        Fai.top.draggableDiv_out = true
                    }
                }
            } else {
                Site.hideFaiFloatPanel();
                Fai.top.draggableDiv_out = true
            }
        },
        stop: function(d, e) {
            if (Fai.top.draggableDiv_out && Fai.top.draggableDiv_enable) {
                $(this).children().eq(0).trigger("click")
            }
            Fai.top.$("#g_main").find("li.panelModuleIconContent").remove();
            Fai.top.dragToAddModule = false;
            Fai.top.dragInSortable = false;
            if ($.inArray("fullmeasureContainer", Fai.top.inSortableList) > -1) {
                Fai.top.$("#webContainer").removeClass("webContainer-disabled");
                Fai.top.$("#webContainerCover").remove();
                $(".fullmeasureContainer").each(function() {
                    var f = $(this);
                    if (f.data("_sortabletmpForm")) {
                        f.data("_sortabletmpForm").remove()
                    }
                });
                Site.displayAddModule();
                Site.enableEditLayer();
                Fai.top.$("body").enableSelection();
                Fai.startInterval(null)
            }
        }
    });
    c.find(".panelModuleIcon_floatImg").draggable("option", "connectToSortable", false);
    c.find(".panelModuleIcon_floatBtn").draggable("option", "connectToSortable", false);
    c.find(".panelModuleIcon_shoppingCart").draggable("option", "connectToSortable", false)
};
Site.faiFloatPanelPrompt = function() {
    $.cookie("faiFloatPanelPrompt", true, {
        expires: 365,
        path: "/"
    });
    Fai.top.$("#panelAddNewModulePrompt").remove()
};
Site.fixFaiFloatPanelData = function() {
    var b = Site.getWebBackgroundData();
    if ($("#topBannerCustom").attr("checked")) {
        var a = $("#settingBannerHeightInput").val();
        if (a == "") {
            if (b.wbh == -1) {
                Site.autoWebBannerHeight();
                $("#topBannerDefault").attr({
                    checked: "checked"
                });
                $("#topBannerCustom").attr({
                    checked: false
                });
                $("#settingBannerHeightInputWrap").hide();
                return
            } else {
                a = b.wbh;
                $("#settingBannerHeightInput").val(a)
            }
        } else {
            if (a < 0 || a > 1000) {
                if (b.wbh == -1) {
                    Site.autoWebBannerHeight();
                    $("#topBannerDefault").attr({
                        checked: "checked"
                    });
                    $("#topBannerCustom").attr({
                        checked: false
                    });
                    $("#settingBannerHeightInputWrap").hide();
                    return
                } else {
                    a = b.wbh;
                    $("#settingBannerHeightInput").val(a)
                }
            } else {
                if (!Fai.isNumber(a)) {
                    if (b.wbh == -1) {
                        Site.autoWebBannerHeight();
                        $("#topBannerDefault").attr({
                            checked: "checked"
                        });
                        $("#topBannerCustom").attr({
                            checked: false
                        });
                        $("#settingBannerHeightInputWrap").hide();
                        return
                    } else {
                        a = b.wbh;
                        $("#settingBannerHeightInput").val(a)
                    }
                }
            }
        }
        if (!isNaN(parseInt(a))) {
            b.wbh = parseInt(a);
            Site.setWebBannerHeight(a)
        }
    } else {
        b.wbh = -1;
        Site.autoWebBannerHeight()
    }
    Site.saveWebBackgroundData(b);
    var c;
    Fai.top._useTemplateBackground ? c = Fai.top._headerTopStyle: c = Fai.top._customHeaderTopStyle;
    if ($("#topStyleCustom").attr("checked")) {
        var a = $("#settingHeightInput").val();
        if (a == "") {
            if (c.hts == -1) {
                $("#topStyleDefault").attr({
                    checked: "checked"
                });
                $("#topStyleCustom").attr({
                    checked: false
                });
                $("#settingHeightInputWrap").hide();
                return
            } else {
                a = c.hts;
                $("#settingHeightInput").val(a)
            }
        } else {
            if (a < 0 || a > 1000) {
                if (c.hts == -1) {
                    $("#topStyleDefault").attr({
                        checked: "checked"
                    });
                    $("#topStyleCustom").attr({
                        checked: false
                    });
                    $("#settingHeightInputWrap").hide();
                    return
                } else {
                    a = c.hts;
                    $("#settingHeightInput").val(a)
                }
            } else {
                if (!Fai.isNumber(a)) {
                    if (c.hts == -1) {
                        $("#topStyleDefault").attr({
                            checked: "checked"
                        });
                        $("#topStyleCustom").attr({
                            checked: false
                        });
                        $("#settingHeightInputWrap").hide();
                        return
                    } else {
                        a = c.hts;
                        $("#settingHeightInput").val(a)
                    }
                }
            }
        }
        if (!isNaN(parseInt(a))) {
            Site.setHeaderTopHeight(a)
        }
    }
};
Site.getAppendLayoutNum = function() {
    var a = Fai.top._appendLayout;
    if (Site.isLayoutHidden(a)) {
        if (!Site.isLayoutHidden(2)) {
            a = 2
        } else {
            if (!Site.isLayoutHidden(1)) {
                a = 1
            } else {
                if (!Site.isLayoutHidden(3)) {
                    a = 3
                } else {
                    if (!Site.isLayoutHidden(4)) {
                        a = 4
                    } else {
                        if (!Site.isLayoutHidden(5)) {
                            a = 5
                        } else {
                            if (!Site.isLayoutHidden(6)) {
                                a = 6
                            } else {
                                if (!Site.isLayoutHidden(7)) {
                                    a = 7
                                } else {
                                    if (!Site.isLayoutHidden(8)) {
                                        a = 8
                                    } else {
                                        a = -1
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    return a
};
Site.showSectionOfSitePage = function(a) {
    if ( !! Fai.top.panelResetDefaultFlag) {
        return
    } else {
        Fai.top.panelResetDefaultFlag = false
    }
    if (typeof a == "undefined") {
        return
    }
    Fai.top.$("#g_main").scrollTop(0);
    if (a == "head") {
        Site.scrollToModuleDiv(Fai.top.$("#webHeader"))
    } else {
        if (a == "banner") {
            Site.scrollToModuleDiv(Fai.top.$("#webBanner"))
        } else {
            if (a == "content") {
                Site.scrollToModuleDiv(Fai.top.$("#webContainer"))
            } else {
                if (a == "foot") {
                    Site.scrollToModuleDiv(Fai.top.$("#webFooter"))
                }
            }
        }
    }
};
Site.hideModuleAnimate = function(c) {
    if (!c.show) {
        return
    }
    var b = $("<div>");
    Fai.top.$("body").append(b);
    b.css({
        border: "2px solid #ff4400",
        position: "absolute",
        zIndex: "9999",
        top: c.top,
        left: c.left,
        height: c.height + "px",
        width: c.width + "px"
    });
    var f = Fai.top.$("#faiFloatPanel");
    var e = f.find("#sectionModuleContentContainer");
    var d = f.find("#sectionModuleContentContainerTopLine");
    var a = 0;
    if (Fai.isIE6() || Fai.isIE7()) {
        e.scrollTop(0).scrollTop(f.find("#panelNowModule" + c.id).offset().top - d.offset().top);
        a = 400
    } else {
        e.mCustomScrollbar("scrollTo", "#panelNowModule" + c.id, {
            scrollInertia: 300
        });
        if (e.find(".mCSB_scrollTools_vertical").is(":visible")) {
            a = 400
        }
    }
    setTimeout(function() {
        var g = f.find("#panelNowModule" + c.id);
        if (g.length < 1) {
            g = f.find("#panelSectionModuleTab")
        }
        b.animate({
            top: g.offset().top + "px",
            left: g.offset().left + "px",
            width: g.outerWidth() + "px",
            height: g.outerHeight() + "px"
        },
        850,
        function() {
            b.remove()
        })
    },
    a)
};
Site.panelModuleCheck = function(e, d, m) {
    Site.removeOverlay();
    Fai.top.panelModuleIconClick = true;
    var l = $.parseJSON(Fai.top._panelOptionData.moduleStyleList);
    var j = Fai.top.$("#" + m + e).children(".panelModuleIcon");
    var f = Fai.top.$("#module" + e);
    var g = f.hasClass("formStyle29") ? true: false;
    var o = f.hasClass("formStyle35") ? true: false;
    var n = f.hasClass("formStyle80") ? true: false;
    var c = j.attr("title");
    if (!Fai.top._mallOpen && d == l.shoppingCart) {
        Fai.ing("该模块开通商城功能后可用。 <a id='J_openMall' href='javascript:;'>立即开通</a>。");
        Fai.top.$("#J_openMall").off("click.sC").on("click.sC",
        function() {
            Site.showTopManageFrame("manageFrameMallEdit")
        });
        return
    }
    if (d == 76) {
        if (Fai.top.$("script[src='" + Fai.top.productGroupScriptLink + "']").length == 0) {
            var h = document.createElement("script");
            h.type = "text/javascript";
            h.src = Fai.top.productGroupScriptLink;
            Fai.top.$("head")[0].appendChild(h)
        }
    }
    if (j.siblings(".panelCheckTip").is(":hidden")) {
        m == "panelNowModule" ? Site.logDog(100082, 11) : Site.logDog(100082, 21);
        c = c.replace("使用", "隐藏");
        j.attr("title", c);
        if (d == l.sysIndexFavorite || d == l.sysDate || d == l.sysShareTo || d == l.sysSiteSearch || d == l.floatImg || d == l.floatBtn || d == l.shoppingCartstyle || d == l.photoCard) {
            Fai.top.Site.addModule(e, Fai.top._colId, Fai.top._extId, {
                callback: k
            })
        } else {
            if (d == l.sysProductSearch || d == l.sysMember || d == l.newsGroup || d == l.productGroup || d == l.productFilter || d == l.productCatalog || d == l.navList || d == l.serviceOnline || e == l.sysWebsiteQrcode) {
                var i = Fai.top._appendLayout;
                if (Fai.top._appendLayout == 2) {
                    Fai.top._appendLayout = 1
                }
                Fai.top.Site.addModule(e, Fai.top._colId, Fai.top._extId, {
                    callback: a
                });
                Fai.top._appendLayout = i
            } else {
                if (d == l.fullmeasure) {
                    var i = Fai.top._appendLayout;
                    Fai.top._appendLayout = 24;
                    Fai.top.Site.addModule(e, Fai.top._colId, Fai.top._extId, {
                        callback: a
                    });
                    Fai.top._appendLayout = i
                } else {
                    Fai.top.Site.addModule(e, Fai.top._colId, Fai.top._extId, {
                        callback: a
                    })
                }
            }
        }
        var b = j.siblings(".nowModuleButtonDiv");
        b.find(".findButton").show();
        b.find(".setButton").show();
        b.find(".delButton").show();
        j.siblings(".panelCheckTip").show()
    } else {
        m == "panelNowModule" ? Site.logDog(100082, 12) : Site.logDog(100082, 22);
        c = c.replace("隐藏", "使用");
        j.attr("title", c);
        if (e == l.sysIndexFavorite || e == l.sysDate) {
            top.Fai.closeTip("#module" + e)
        }
        top.Site.hideModule(e, true,
        function() {
            if (g || o || n) {
                Site.updateCurrentSectionModule()
            }
        });
        var b = j.siblings(".nowModuleButtonDiv");
        b.find(".findButton").hide();
        b.find(".setButton").hide();
        j.siblings(".panelCheckTip").hide()
    }
    function a(q) {
        if ($(q).hasClass("formStyle29")) {
            Site.updateCurrentSectionModule();
            Fai.top.Site.bindInTabSwitch()
        } else {
            if ($(q).hasClass("formStyle35")) {
                Site.updateCurrentSectionModule()
            } else {
                if ($(q).hasClass("formStyle80")) {
                    Site.updateCurrentSectionModule()
                }
            }
        }
        var p = $(q).attr("id").replace("module", "");
        Site.showThisModule(p)
    }
    function k(B, p) {
        var A = B.attr("id"),
        u = A.replace(/module/, "");
        if (p) {
            Site.showThisModule(u);
            return
        }
        top.Site.absModule(A);
        top.Site.absTopModule(A);
        Site.getModuleAttrPattern(A.replace("module", "")).changed = true;
        var z = B.attr("class").split(" ");
        var s = 0;
        $.each(z,
        function(I, J) {
            if (J.length < 10) {
                return true
            }
            if (J.slice(0, 9) != "formStyle") {
                return true
            }
            if (s <= 0) {
                s = parseInt(J.slice(9));
                return false
            }
        });
        if (s == l.sysShareTo) {
            var w = 170,
            x = B.children("table.formMiddle");
            var H = x.find("td.formMiddleLeft");
            if (H.length > 0 && H.is(":visible")) {
                w += H.outerWidth(true)
            }
            var F = x.find("td.formMiddleRight");
            if (F.length > 0 && F.is(":visible")) {
                w += F.outerWidth(true)
            }
            var G = x.find("td.formMiddleCenter").children("div.formMiddleContent");
            var r = G.outerWidth(true) - G.width();
            w += r;
            w += x.outerWidth(true) - x.width();
            var y = "100px";
            var v = 0;
            var q = false;
            $.each(Fai.top.$(".formStyle" + l.sysShareTo),
            function(K, I) {
                if ($(I).attr("id") === A) {
                    return true
                }
                var J = $(I).css("top");
                if (J === y) {
                    q = true
                }
                if (v < J.replace(/px/, "")) {
                    v = parseInt(J.replace(/px/, ""))
                }
            });
            if (q) {
                v += 50;
                y = v + "px"
            }
            B.css({
                width: w + "px",
                left: "auto",
                right: "100px",
                top: y,
                height: "auto"
            });
            top.Site.lock(A);
            top.$("#" + A).css({
                top: y
            });
            B.attr("_side", 0);
            top.Site.sideModule(A)
        } else {
            if (s == l.sysDate) {
                var y = "10px";
                var v = 0;
                var q = false;
                $.each(Fai.top.$(".formStyle" + l.sysDate),
                function(K, I) {
                    if ($(I).attr("id") === A) {
                        return true
                    }
                    var J = $(I).css("top");
                    if (J === y) {
                        q = true
                    }
                    if (v < J.replace(/px/, "")) {
                        v = parseInt(J.replace(/px/, ""))
                    }
                });
                if (q) {
                    v += 20;
                    y = v + "px"
                }
                B.css({
                    width: "140px",
                    left: "120px",
                    right: "auto",
                    top: y
                });
                var C = Site.getModuleAttrPattern(u).contentBg;
                C.y = 1;
                top.Site.hideModuleContentBg(u);
                var D = Site.getModuleAttrPattern(u);
                D.bannerType = 1;
                D.border.y = 1;
                D.inner.t = 0;
                D.inner.b = 0;
                D.inner.l = 0;
                D.inner.r = 0;
                D.inner.y = 1;
                top.Site.setModuleHeight(u, 20);
                top.Site.setModuleStyleCssList(u, [{
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
                top.Site.setModuleStyleCss(u, ".formBanner" + u, "display", "none");
                top.Site.hideModuleBorder(u)
            } else {
                if (s == l.sysSiteSearch) {
                    var y = "40px";
                    var v = 0;
                    var q = false;
                    $.each(Fai.top.$(".formStyle" + l.sysSiteSearch),
                    function(K, I) {
                        if ($(I).attr("id") === A) {
                            return true
                        }
                        var J = $(I).css("top");
                        if (J === y) {
                            q = true
                        }
                        if (v < J.replace(/px/, "")) {
                            v = parseInt(J.replace(/px/, ""))
                        }
                    });
                    if (q) {
                        v += 20;
                        y = v + "px"
                    }
                    B.css({
                        width: "250px",
                        left: "auto",
                        right: "0px",
                        top: y,
                        height: "auto"
                    });
                    var C = Site.getModuleAttrPattern(u).contentBg;
                    C.y = 1;
                    top.Site.hideModuleContentBg(u);
                    var D = Site.getModuleAttrPattern(u);
                    D.bannerType = 1;
                    D.border.y = 1;
                    D.inner.t = 0;
                    D.inner.b = 0;
                    D.inner.l = 0;
                    D.inner.r = 0;
                    D.inner.y = 0;
                    top.Site.setModuleStyleCssList(u, [{
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
                    top.Site.setModuleStyleCss(u, ".formBanner" + u, "display", "none");
                    top.Site.hideModuleBorder(u)
                } else {
                    if (s == l.sysIndexFavorite) {
                        var y = "10px";
                        var v = 0;
                        var q = false;
                        $.each(Fai.top.$(".formStyle" + l.sysIndexFavorite),
                        function(K, I) {
                            if ($(I).attr("id") === A) {
                                return true
                            }
                            var J = $(I).css("top");
                            if (J === y) {
                                q = true
                            }
                            if (v < J.replace(/px/, "")) {
                                v = parseInt(J.replace(/px/, ""))
                            }
                        });
                        if (q) {
                            v += 20;
                            y = v + "px"
                        }
                        B.css({
                            width: "140px",
                            left: "auto",
                            right: "120px",
                            top: y,
                            height: "auto"
                        });
                        var C = Site.getModuleAttrPattern(u).contentBg;
                        C.y = 1;
                        top.Site.hideModuleContentBg(u);
                        var D = Site.getModuleAttrPattern(u);
                        D.bannerType = 1;
                        D.border.y = 1;
                        D.inner.t = 0;
                        D.inner.b = 0;
                        D.inner.l = 0;
                        D.inner.r = 0;
                        D.inner.y = 0;
                        top.Site.setModuleStyleCssList(u, [{
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
                        top.Site.setModuleStyleCss(u, ".formBanner" + u, "display", "none");
                        top.Site.hideModuleBorder(u)
                    } else {
                        if (s == l.floatImg) {
                            B.find(".float_in_img").width(B.width())
                        } else {
                            if (s == l.floatBtn) {
                                if (top.$("head").find("link[href='" + _floatBtnCssLink + "']").length == 0) {
                                    top.$("<link class='floatBtnCss' type='text/css' href='" + _floatBtnCssLink + "' rel='stylesheet'>").appendTo(top.$("head"));
                                    var t = $(".floatBtnCss");
                                    t.load(function() {
                                        var I = B.find(".floatBtn");
                                        B.css({
                                            width: I.outerWidth() + "px",
                                            height: I.outerHeight() + "px"
                                        });
                                        Site.setFlBtnResizeHandleSize(B)
                                    })
                                } else {
                                    var E = B.find(".floatBtn");
                                    B.css({
                                        width: E.outerWidth() + "px",
                                        height: E.outerHeight() + "px"
                                    });
                                    Site.setFlBtnResizeHandleSize(B)
                                }
                            } else {
                                if (s == l.shoppingCart) {
                                    if (top.$("head").find("link[href='" + _shoppingCartCssLink + "']").length == 0) {
                                        top.$("<link type='text/css' href='" + _shoppingCartCssLink + "' rel='stylesheet'>").appendTo(top.$("head"))
                                    }
                                    B.css({
                                        width: "auto",
                                        height: "auto"
                                    })
                                } else {
                                    if (s == l.photoCard) {
                                        if (top.$("head").find("link[href='" + _photoCardCssLink + "']").length == 0) {
                                            top.$("<link type='text/css' href='" + _photoCardCssLink + "' rel='stylesheet'>").appendTo(top.$("head"))
                                        }
                                        Site.initPhotoCard(B.attr("id").replace("module", ""))
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        top.Site.refreshAbsFloatForm(B);
        top.Site.scrollToDiv(B);
        Site.showThisModule(e)
    }
    Fai.top.panelModuleIconClick = false;
    Site.setRefreshInfo("moduleEdit", true)
};