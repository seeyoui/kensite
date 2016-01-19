/*!
 * FaiUI.js
 * Fai UI for faisco
 * URL:http://www.faisco.com
 * @Time 2012-07-24
 * 
 */
(function(h) {
    h.widget("ui.faiTable", {
        options: {
            before: function() {},
            toolBar: [],
            tableColumn: {
                showCheckbox: false,
                columns: [],
                hiddenKeyList: []
            },
            bottom: {
                show: false,
                showTotal: false,
                showAllTotal: false,
                showExtTotal: false,
                showPage: false
            },
            ajax: {
                type: "post",
                url: "",
                data: ""
            },
            primaryKey: "_index",
            dataList: [],
            noDataMsg: "没有数据",
            tableRowsClass: {},
            sortData: {
                sortable: false,
                showSortBtn: false,
                showColumnKey: "_sort",
                unSortList: [],
                sortBack: function() {}
            },
            page: {
                startPage: 1,
                showCount: 0,
                pageClass: {
                    isDefaultPage: false,
                    pageStyle: "",
                    pagePrevClass: "",
                    pageNextClass: ""
                }
            },
            itemHover: false,
            tmp: {
                result: [],
                maxPage: 0,
                newAddDataList: [],
                rmDataList: [],
                editDataList: [],
                maxPrimaryKey: 0,
                searchMatcher: []
            },
            after: function() {},
            expand: false,
            expandCookie: "",
            expandMinWidth: 5,
            sortCallback: null
        },
        _create: function() {
            var O = this;
            var J = O.options;
            var N = O.element;
            if (J.before) {
                J.before()
            }
            var L = [];
            L.push('<div class="faiTableWrap">');
            if (J.toolBar.length > 0) {
                L.push('<div class="top">');
                h.each(J.toolBar,
                function(P, Q) {
                    if (Q.show) {
                        var R = "";
                        if (typeof Q.extClass != "undefined") {
                            R += Q.extClass
                        }
                        var S = "";
                        if (typeof Q.content != "undefined") {
                            S += Q.content
                        }
                        L.push('<div class="toolBar ' + R + '">' + S + "</div>")
                    }
                });
                L.push("</div>")
            }
            L.push('<div class="center">');
            L.push('<table class="faiTable" cellpadding="0" cellspacing="0">');
            L.push("<thead>");
            L.push("<tr>");
            if (J.tableColumn.showCheckbox) {
                L.push('<th class="checkBoxWidth textCenter sep"><input class="checkbox all" type="checkbox"></th>')
            }
            var M = false;
            var K = "";
            var H = "";
            var I = J.expand;
            if (J.tableColumn.columns.length > 0) {
                h.each(J.tableColumn.columns,
                function(W, S) {
                    var V = S.onsort;
                    var P = S.sortAs;
                    var U = S.expand;
                    if (typeof U == "undefined") {
                        U = I
                    }
                    var Y = S.sortCallback;
                    var Z = "";
                    if (typeof S.key != "undefined") {
                        Z = ' data-key="' + S.key + '"'
                    }
                    var X = "";
                    var Q = "";
                    var aa = J.tableColumn.columns.length;
                    if (aa != (W + 1)) {
                        Q = " sep"
                    }
                    var T = "";
                    if (V) {
                        T = " sort pointer"
                    }
                    if (!M && P == "asc") {
                        M = true;
                        K = "asc";
                        H = S.key;
                        if (V) {
                            T += " asc"
                        }
                    }
                    if (!M && P == "desc") {
                        M = true;
                        K = "desc";
                        H = S.key;
                        if (V) {
                            T += " desc"
                        }
                    }
                    var R = S.colClass;
                    if (J.sortData.showSortBtn && S.key == J.sortData.showColumnKey) {
                        T = "";
                        if (typeof R != "undefined") {
                            R = "sortWidth " + R
                        } else {
                            R = "sortWidth"
                        }
                    }
                    if (typeof R != "undefined") {
                        X = ' class="' + R + Q + T
                    } else {
                        X = ' class="defaultWidth' + Q + T
                    }
                    if (U) {
                        X += ' expand "';
                        L.push("<th" + Z + X + '><div class="expandRightLine-box"><div class="expandRightLine"></div></div><div class="padding title">' + S.name + "</div></th>")
                    } else {
                        X += ' "';
                        L.push("<th" + Z + X + '><div class="padding">' + S.name + "</div></th>")
                    }
                })
            } else {
                L.push("<th>&nbsp;</th>")
            }
            L.push("</tr>");
            L.push("</thead>");
            L.push("<tbody>");
            L.push("</tbody>");
            L.push("<tfoot></tfoot>");
            L.push("</table>");
            L.push("</div>");
            if (J.bottom.show) {
                L.push('<div class="bottom">');
                L.push('<div class="total">');
                if (J.bottom.showTotal) {
                    L.push('<span class="pageTotal"></span>')
                }
                if (J.bottom.showAllTotal) {
                    L.push('<span class="allTotal"></span>')
                }
                if (J.bottom.showExtTotal) {
                    L.push('<span class="extTotal"></span>')
                }
                L.push("</div>");
                if (J.bottom.showPage) {
                    L.push('<div class="page">');
                    L.push("</div>")
                }
                L.push("</div>")
            }
            L.push("</div>");
            N.append(L.join(""));
            if (typeof J.ajax.url != "undefined" && J.ajax.url != "") {
                J.dataList = [];
                g(N, J, M, K, H)
            } else {
                if (M && K && H) {
                    J.dataList.sort(function(Q, P) {
                        return Fai.compareObjNew(Q, P, K, H)
                    })
                }
                w(N, J)
            }
            c(N, J);
            a(N, J);
            if (J.after) {
                J.after()
            }
        },
        sortDataList: function(M) {
            var L = this.options;
            var O = this.element;
            var K = L.dataList;
            var H = O.find("div.center>table>tbody>tr");
            var N = O.find("div.center>table>tbody");
            h.each(M,
            function(P, Q) {
                h.each(K,
                function(S, T) {
                    if (Q === T.id) {
                        var R = T._index;
                        h.each(H,
                        function(U, W) {
                            var V = parseInt(h(W).attr("_index"));
                            if (R === V) {
                                N.append(W);
                                return false
                            }
                        });
                        return false
                    }
                })
            });
            H = O.find("div.center>table>tbody>tr");
            for (var J = H.length - 1; J >= 0; J--) {
                var I = h(H[J]).find("div.checkedBtn");
                if (I.length > 0) {
                    N.prepend(H[J])
                }
            }
            x(O);
            G(O);
            r(O, L)
        },
        returnDataList: function(K) {
            var I = this.options;
            var H = I.dataList;
            var J = D(H, I);
            if (K) {
                return H
            }
            return J
        },
        returnRmDataList: function() {
            var I = this.options;
            var H = I.tmp.rmDataList;
            var J = D(H, I);
            return J
        },
        returnChoiceDataList: function(M) {
            var L = this;
            var K = L.element;
            var J = L.options;
            var I = K.find("div.center>table>tbody>tr>td.checkBoxWidth input[type='checkbox']:checked").parents("tr");
            var H = [];
            I.each(function(O, P) {
                var N = h(this).attr(J.primaryKey);
                H.push(L.getPrimaryKeyData(N, M))
            });
            return H
        },
        rmChoices: function() {
            var L = this;
            var M = L.element;
            var J = L.options;
            var P = J.dataList;
            var K = J.tmp.rmDataList;
            var I = J.tmp.newAddDataList;
            var O = J.tmp.result;
            var H = J.tmp.editDataList;
            var N = M.find("div.center>table>tbody>tr>td.checkBoxWidth input[type='checkbox']:checked").parents("tr");
            if (N.length == 0) {
                return true
            }
            N.each(function(Q, S) {
                var R = h(this).attr(J.primaryKey);
                h.each(P,
                function(T, U) {
                    if (U[J.primaryKey] == R) {
                        K.push(U);
                        P.splice(T, 1);
                        return false
                    }
                });
                h.each(I,
                function(T, U) {
                    if (U[J.primaryKey] == R) {
                        I.splice(T, 1);
                        return false
                    }
                });
                h.each(O,
                function(T, U) {
                    if (U[J.primaryKey] == R) {
                        O.splice(T, 1);
                        return false
                    }
                });
                h.each(H,
                function(T, U) {
                    if (U[J.primaryKey] == R) {
                        H.splice(T, 1);
                        return false
                    }
                })
            });
            w(M, J);
            return true
        },
        rmChoicesList: function(H) {
            var I = this;
            h.each(H,
            function(J, K) {
                I.rmPrimaryKeyData(K)
            });
            return true
        },
        addData: function(M, I) {
            var L = this.element;
            var K = this.options;
            var J = K.dataList;
            var H = K.tmp.newAddDataList;
            K.tmp.maxPrimaryKey++;
            M[K.primaryKey] = K.tmp.maxPrimaryKey;
            if (!I) {
                J.push(M)
            } else {
                J.splice(0, 0, M)
            }
            H.push(M);
            w(L, K);
            return true
        },
        returnNewAddDataList: function() {
            var I = this.options;
            var H = I.tmp.newAddDataList;
            var J = D(H, I);
            return J
        },
        hiddenColumns: function(I) {
            var H = this.options;
            var J = this.element;
            H.tableColumn.hiddenKeyList = I;
            q(J, H)
        },
        searchString: function(H) {
            var L = this;
            var J = L.options;
            var K = L.element;
            var I = J.page.startPage;
            if (I > 1) {
                J.page.startPage = 1
            }
            h.each(J.tmp.searchMatcher,
            function(M, O) {
                var N = O.uid;
                if (N == H.uid) {
                    J.tmp.searchMatcher.splice(M, 1);
                    return false
                }
            });
            J.tmp.searchMatcher.push(H);
            w(K, J)
        },
        rmSearchObj: function(I) {
            var K = this;
            var J = K.element;
            var H = K.options;
            h.each(H.tmp.searchMatcher,
            function(L, N) {
                var M = N.uid;
                if (M == I) {
                    H.tmp.searchMatcher.splice(L, 1);
                    return false
                }
            });
            w(J, H)
        },
        getPrimaryKeyId: function(I) {
            var J = this.options;
            var H = h(I).parents("tr").attr(J.primaryKey);
            return parseInt(H)
        },
        getPrimaryKeyData: function(H, M) {
            var K = this.options;
            var I = K.dataList;
            var L = false;
            var J = {};
            h.each(I,
            function(N, O) {
                if (O[K.primaryKey] == H) {
                    L = true;
                    J = O;
                    return false
                }
            });
            if (L) {
                if (M) {
                    return J
                } else {
                    return D(J, K)
                }
            }
        },
        rmPrimaryKeyData: function(I) {
            var O = this.element;
            var M = this.options;
            var L = M.dataList;
            var J = M.tmp.rmDataList;
            var H = M.tmp.newAddDataList;
            var N = M.tmp.result;
            var K = M.tmp.editDataList;
            h.each(L,
            function(P, Q) {
                if (Q[M.primaryKey] == I) {
                    J.push(Q);
                    L.splice(P, 1);
                    return false
                }
            });
            h.each(H,
            function(P, Q) {
                if (Q[M.primaryKey] == I) {
                    H.splice(P, 1);
                    return false
                }
            });
            h.each(N,
            function(P, Q) {
                if (Q[M.primaryKey] == I) {
                    N.splice(P, 1);
                    return false
                }
            });
            h.each(K,
            function(P, Q) {
                if (Q[M.primaryKey] == I) {
                    K.splice(P, 1);
                    return false
                }
            });
            w(O, M);
            return true
        },
        editData: function(P, K) {
            var M = this.element;
            var J = this.options;
            var N = J.dataList;
            var H = J.tmp.editDataList;
            var I = J.tmp.newAddDataList;
            var L = false;
            var O = "";
            h.each(N,
            function(Q, S) {
                if (S[J.primaryKey] == P) {
                    h.extend(true, S, K);
                    L = true;
                    var R = false;
                    h.each(I,
                    function(T, U) {
                        if (U[J.primaryKey] == P) {
                            R = true;
                            return false
                        }
                    });
                    if (!R) {
                        h.each(H,
                        function(T, U) {
                            if (U[J.primaryKey] == P) {
                                H.splice(T, 1);
                                return false
                            }
                        });
                        H.push(S)
                    }
                    return false
                }
            });
            if (L) {
                h(J.tableColumn.columns).each(function() {
                    if (h(this)[0].ext) {
                        O = h(this)[0].key
                    }
                });
                if (O != "" && (typeof O == "string") && J.dataList.length > P) {
                    J.dataList[P][O] = K[O]
                }
                w(M, J);
                return true
            } else {
                return false
            }
        },
        editReplaceData: function(H, I) {
            var N = this.element;
            var K = this.options;
            var J = K.dataList;
            var M = false;
            var L = "";
            h(K.tableColumn.columns).each(function() {
                if (h(this)[0].ext) {
                    M = true;
                    L = h(this)[0].key
                }
            });
            if (M) {
                if (L != "" && (typeof L == "string")) {
                    K.dataList[0][L] = I[L]
                }
                w(N, K);
                return true
            } else {
                return false
            }
        },
        returnEditDataList: function() {
            var I = this.options;
            var H = I.tmp.editDataList;
            var J = D(H, I);
            return J
        },
        addClassToRow: function(H) {},
        unSortListAdd: function(H) {
            var K = this;
            var I = K.options;
            var J = I.sortData.unSortList;
            if (h.inArray(H, J) == -1) {
                I.sortData.unSortList.push(H)
            }
        },
        unSortListRm: function(H) {
            var K = this;
            var I = K.options;
            var J = I.sortData.unSortList;
            h.each(J,
            function(L, M) {
                if (M == H) {
                    I.sortData.unSortList.splice(L, 1);
                    return false
                }
            })
        },
        editThisRowColumn: function(M, S, H, N) {
            var O = this;
            var K = O.options;
            var J = O.getPrimaryKeyId(M);
            var Q = h(M).parents("tr");
            var P = -1;
            h.each(K.tableColumn.columns,
            function(T, U) {
                if (U.key == S) {
                    P = T;
                    return true
                }
            });
            if (K.tableColumn.showCheckbox) {
                P++
            }
            var L = Q.find("td").eq(P).find("div.tdWrap");
            var R = h.trim(L.text());
            var I = h('<input type="text" class="txtInput" maxlength="' + H + '"/>');
            I.val(R);
            I.bind("blur",
            function() {
                var T = h.trim(h(this).val());
                var W = {
                    primaryKeyId: J,
                    primaryKey: K.primaryKey,
                    key: S,
                    "old-data": R,
                    "new-data": T
                };
                if (typeof N != "undefined") {
                    N(W)
                }
                var V = W["new-data"];
                L.html(Fai.encodeHtml(V));
                if (V != R) {
                    var U = {};
                    U[S] = V;
                    O.editData(J, U)
                }
                return false
            });
            I.bind("keypress",
            function(T) {
                if (T.keyCode == 13) {
                    h(this).blur()
                }
            });
            L.html(I);
            setTimeout(function() {
                I.focus()
            },
            1)
        },
        editFileName: function(N, V, H, O) {
            var P = this;
            var L = P.options;
            var K = P.getPrimaryKeyId(N);
            var S = h(N).parents("tr");
            var R = -1;
            h.each(L.tableColumn.columns,
            function(W, X) {
                if (X.key == V) {
                    R = W;
                    return true
                }
            });
            if (L.tableColumn.showCheckbox) {
                R++
            }
            var M = S.find("td").eq(R).find("div.tdWrap");
            var U = h.trim(M.text());
            var T = U.lastIndexOf(".");
            var Q = U.substring(T);
            var J = U.substring(0, T);
            var I = h('<input type="text" class="txtInput" maxlength="' + H + '"/>');
            I.val(J);
            I.bind("blur",
            function() {
                var W = h.trim(h(this).val());
                var Y = {
                    primaryKeyId: K,
                    primaryKey: L.primaryKey,
                    key: V,
                    "src-data": U,
                    "type-data": Q,
                    "name-data": J,
                    "new-data": W
                };
                if (typeof O != "undefined") {
                    O(Y)
                } else {
                    var X = Y["new-data"];
                    M.html(Fai.encodeHtml(X))
                }
                return false
            });
            I.bind("keypress",
            function(W) {
                if (W.keyCode == 13) {
                    h(this).blur()
                }
            });
            M.html(I);
            setTimeout(function() {
                I.focus()
            },
            1)
        },
        returnResultDataList: function(L) {
            var K = this;
            var H = K.options;
            var I = H.tmp.result;
            var J = D(I, H);
            if (L) {
                return I
            }
            return J
        },
        refreshHiddenList: function(H) {
            var K = this;
            var J = K.element;
            var I = K.options;
            if (h.isArray(H)) {
                I.tableColumn.hiddenKeyList = H
            }
            q(J, I);
            return true
        },
        refreshshowCountList: function(I) {
            var K = this;
            var H = K.options;
            var J = K.element;
            if (I) {
                H.page.showCount = I
            }
            w(J, H)
        }
    });
    function w(M, J) {
        var I = [];
        if (typeof J.dataList === "undefined" || J.dataList === null) {
            J.dataList = []
        }
        h.each(J.dataList,
        function(N, O) {
            if (typeof O[J.primaryKey] === "undefined") {
                J.dataList[N][J.primaryKey] = J.tmp.maxPrimaryKey;
                J.tmp.maxPrimaryKey++
            }
        });
        y(M, J);
        var L = J.dataList;
        if (J.tmp.searchMatcher.length > 0) {
            L = J.tmp.result
        }
        var K = n(J, L);
        if (K.length > 0) {
            h.each(K,
            function(N, P) {
                var O = "";
                if (J.tableRowsClass[P[J.primaryKey]]) {
                    O = ' class="' + J.tableRowsClass[P[J.primaryKey]] + '"'
                }
                var Q = J.primaryKey + '="' + P[J.primaryKey] + '"';
                I.push("<tr " + Q + O + ">");
                if (J.tableColumn.showCheckbox) {
                    I.push('<td class="checkBoxWidth textCenter"><input type="checkbox" value=""></td>')
                }
                h.each(J.tableColumn.columns,
                function(V, U) {
                    var X = U.key;
                    var S = P[X];
                    var Z = U.rowClass;
                    var T = "";
                    if (typeof U.extData != "undefined" && h.isFunction(U.extData)) {
                        T = U.extData(S, P)
                    } else {
                        if (typeof U.encode == "undefined" || U.encode) {
                            T = Fai.encodeHtml(S)
                        } else {
                            T = S
                        }
                    }
                    if (U.custom) {
                        T = U.customData
                    }
                    if (J.sortData.showSortBtn && X == J.sortData.showColumnKey) {
                        T = '<div class="sortPanel"><a class="up pointer"></a><a class="down pointer"></a></div>';
                        if (typeof Z != "undefined") {
                            Z = "sortWidth " + Z
                        } else {
                            Z = "sortWidth"
                        }
                    }
                    var W = "";
                    var Y = "padding ellipsis tdWrap";
                    if (typeof Z != "undefined") {
                        W = Z + " ellipsis"
                    } else {
                        W = "defaultWidth ellipsis"
                    }
                    var R = "";
                    if (U.onTitle) {
                        R = ' title="' + Fai.encodeHtml(S) + '"';
                        if (U.textArea) {
                            R = ' title="' + Fai.encodeHtmlAttr(S) + '"'
                        }
                    }
                    if (U.textArea) {
                        Y += " textAreaWrap "
                    }
                    I.push('<td class="' + W + '"' + R + '><div class="' + Y + '">' + T + "</div></td>")
                });
                I.push("</tr>")
            })
        } else {
            var H = C(M);
            I.push('<tr class="queryIngTr">');
            I.push('<td class="padding" colspan="' + H + '">' + J.noDataMsg + "</td>");
            I.push("</tr>")
        }
        M.find("div.center>table>tbody").html(I.join(""));
        if (Fai.isIE6() || Fai.isIE7()) {
            E(M);
            h(window).resize(function() {
                E(M)
            })
        }
        if (J.itemHover) {
            v(M)
        }
        z(M, J);
        if (J.sortData.showSortBtn || J.sortData.sortable) {
            f(M, J)
        }
        if (J.sortData.showSortBtn) {
            x(M);
            d(M, J)
        }
        if (J.sortData.sortable) {
            o(M, J)
        }
        G(M);
        if (J.bottom.show && J.bottom.showTotal) {
            s(M)
        }
        if (J.bottom.show && J.bottom.showAllTotal) {
            B(M, J.tmp.result)
        }
        if (J.bottom.show && J.bottom.showExtTotal) {
            m(M, J)
        }
        if (J.bottom.show && J.bottom.showPage) {
            t(M, J)
        }
        b(M);
        F(M);
        q(M, J)
    }
    function E(L) {
        L.find("tr.fixIE6forFaiTable").remove();
        var J = L.width();
        var K = L.find("table.faiTable").width();
        if ((K - J) > 0) {
            var H = C(L);
            var I = [];
            I.push('<tr class="fixIE6forFaiTable">');
            I.push('<td colspan="' + H + '"></td>');
            I.push("</tr>");
            L.find("table.faiTable").append(I.join(""))
        }
    }
    function g(M, K, N, L, J) {
        var I = [];
        var H = M.find("div.center>table>thead>tr>th").length;
        I.push('<tr class="queryIngTr">');
        I.push('<td class="padding" colspan="' + H + '"><div class="ajaxLoading1 queryIng">数据加载中...</div></td>');
        I.push("</tr>");
        M.find("div.center>table>tbody").html(I.join(""));
        h.ajax({
            type: K.ajax.type,
            data: K.ajax.data,
            url: K.ajax.url,
            error: function() {
                M.find("div.center>table>tbody td").html('<td colspan="' + H + '"><div class="ajaxLoading1 queryIng">数据加载失败...</div></td>')
            },
            success: function(P) {
                var O = h.parseJSON(h.trim(P));
                K.dataList = O;
                if (N && L && J) {
                    K.dataList.sort(function(R, Q) {
                        return Fai.compareObjNew(R, Q, L, J)
                    })
                }
                w(M, K)
            }
        })
    }
    function v(H) {
        H.find("div.center>table>tbody>tr").hover(function() {
            h(this).addClass("hover")
        },
        function() {
            h(this).removeClass("hover")
        })
    }
    function z(O, L) {
        var Q = 0;
        var T = 0;
        var H = false;
        var I = L.expandMinWidth;
        var K;
        var M;
        var P = O.find("div.center>table>thead");
        var S = O.find("div.center>table>thead th");
        var N = O.find("div.center>table>thead").find("th.expand");
        var J = N.find(".expandRightLine");
        var R = P.find("th.pointer");
        J.hover(function() {
            h(this).addClass("expanding")
        },
        function() {
            h(this).removeClass("expanding")
        });
        J.mousedown(function(U) {
            Q = U.pageX;
            K = h(this).parents("th.expand");
            M = h(this);
            T = K.width();
            H = true;
            P.addClass("changeCursor");
            R.removeClass("pointer");
            K.addClass("expanding");
            S.mousemove(function(X) {
                var W = 0;
                var V = 0;
                if (H) {
                    P.onselectstart = function() {
                        return false
                    };
                    W = parseInt(X.pageX - Q);
                    V = parseInt(T + W);
                    K.css({
                        width: (V < I) ? I + "px": V + "px"
                    })
                }
            })
        }).mousemove(function(W) {
            var V = 0;
            var U = 0;
            if (H) {
                P.onselectstart = function() {
                    return false
                };
                V = parseInt(W.pageX - Q);
                U = parseInt(T + V);
                K.css({
                    width: (U < I) ? I + "px": U + "px"
                })
            }
        });
        h(document).mouseup(function(U) {
            if (H) {
                H = false;
                P.removeClass("changeCursor");
                R.addClass("pointer");
                if (L.expandCookie != "") {
                    h.cookie(L.expandCookie + K.attr("data-key"), K.width(), {
                        expires: 365,
                        path: "/"
                    })
                }
            }
        })
    }
    function a(J, I) {
        var H = J.find("div.center>table>thead>tr>th");
        H.each(function(K) {
            if (h(this).attr("data-key") != undefined) {
                var L = parseInt(h.cookie(I.expandCookie + h(this).attr("data-key"), {
                    path: "/"
                })) || 0;
                if (L != 0) {
                    h(this).css({
                        width: L + "px"
                    })
                }
            }
        })
    }
    function f(I, H) {
        I.find("div.center>table>tbody>tr").each(function() {
            var J = parseInt(h(this).attr(H.primaryKey));
            if (h.inArray(J, H.sortData.unSortList) != -1) {
                h(this).removeClass("move").addClass("unSort").find(".sortPanel").remove()
            }
        })
    }
    function o(I, H) {
        I.find("div.center>table>tbody>tr").each(function() {
            if (!h(this).hasClass("queryIngTr unSort")) {
                h(this).addClass("move")
            }
        });
        I.sortable("destroy");
        I.sortable({
            start: function() {
                var J = C(I);
                h(".sortablePlaceholder").append('<td colspan="' + J + '"><div class="sortableHighlight"></div></td>')
            },
            axis: "y",
            placeholder: "sortablePlaceholder",
            items: "div.center>table>tbody>tr",
            distance: 3,
            cancel: ".queryIngTr, input, .unSort",
            stop: function() {
                G(I);
                x(I);
                if (H.sortData.sortBack) {
                    H.sortData.sortBack()
                }
                r(I, H)
            }
        });
        I.disableSelection()
    }
    function G(H) {
        H.find("div.center>table>tbody>tr").removeClass("even odd").each(function(I, J) {
            if (I % 2 == 0) {
                h(this).addClass("odd")
            } else {
                h(this).addClass("even")
            }
        })
    }
    function x(I) {
        var H = I.find("div.center>table>tbody>tr>td .sortPanel a.up");
        var J = I.find("div.center>table>tbody>tr>td .sortPanel a.down");
        H.removeClass("disabled").first().addClass("disabled");
        J.removeClass("disabled").last().addClass("disabled")
    }
    function r(P, L) {
        var R = L.dataList;
        var J = L.page.showCount;
        var K = L.page.startPage;
        var U = R.length;
        var T = J * (K - 1);
        var H = (J * K) - 1;
        var I = P.find("div.center>table>tbody>tr");
        var Q = [];
        var S = [];
        if (J == 0) {
            H = U - 1;
            T = 0
        }
        if (H > U) {
            H = U - 1
        }
        for (var O = T; O <= H; O++) {
            Q.push(R[O])
        }
        h.each(I,
        function(W, X) {
            var V = h(X).attr(L.primaryKey);
            h.each(Q,
            function(Y, Z) {
                if (V == Z[L.primaryKey]) {
                    S.push(Z);
                    return false
                }
            })
        });
        var M = 0;
        for (var N = T; N <= H; N++) {
            R[N] = S[M];
            M++
        }
        L.dataList = R
    }
    function d(J, I) {
        var H = J.find("div.center>table>tbody>tr>td .sortPanel a");
        H.bind("click",
        function() {
            var K = h(this).parents("tr");
            if (h(this).hasClass("up")) {
                K.insertBefore(K.prev())
            } else {
                if (h(this).hasClass("down")) {
                    K.insertAfter(K.next())
                }
            }
            x(J);
            if (I.sortData.sortBack) {
                I.sortData.sortBack()
            }
            r(J, I);
            G(J)
        });
        x(J)
    }
    function B(J, I) {
        var H = I.length;
        J.find("div.bottom>.total>.allTotal").html("总共" + H + "个")
    }
    function m(J, I) {
        var H = "";
        if (typeof I.bottom["showExtData"] != "undefined" && h.isFunction(I.bottom["showExtData"])) {
            H = I.bottom["showExtData"](I.tmp.result)
        }
        J.find("div.bottom>.total>.extTotal").html(H)
    }
    function s(I) {
        var H = 0;
        h.each(I.find("div.center>table>tbody>tr"),
        function() {
            if (!h(this).hasClass("queryIngTr")) {
                H++
            }
        });
        I.find("div.bottom>.total>.pageTotal").html("本页共" + H + "个 ")
    }
    function b(J) {
        var I = J.find("div.center>table>thead>tr>th.checkBoxWidth input.checkbox.all");
        var H = J.find("div.center>table>tbody>tr>td.checkBoxWidth input");
        I.bind("click",
        function() {
            var L = h(this).prop("checked");
            H.prop("checked", L);
            var K = J.find("div.center>table>tbody>tr>td.checkBoxWidth input[type='checkbox']").parents("tr");
            if (L) {
                K.addClass("checked")
            } else {
                K.removeClass("checked")
            }
        });
        H.bind("click",
        function() {
            var K = J.find("div.center>table>tbody>tr>td.checkBoxWidth input:checked");
            if (K.length == H.length) {
                I.prop("checked", true)
            } else {
                I.prop("checked", false)
            }
            if (h(this).prop("checked")) {
                h(this).parents("tr").addClass("checked")
            } else {
                h(this).parents("tr").removeClass("checked")
            }
        })
    }
    function F(I) {
        var H = I.find("div.center>table>thead>tr>th.checkBoxWidth input.checkbox.all");
        H.prop("checked", false)
    }
    function c(I, H) {
        I.find("div.center>table>thead>tr>th.sort").bind("click",
        function() {
            if (h(this).hasClass("expanding")) {
                h(this).removeClass("expanding")
            } else {
                var K = h(this).attr("data-key");
                var J = "";
                if (h(this).hasClass("desc")) {
                    h(this).addClass("asc").removeClass("desc").siblings().removeClass("asc desc");
                    J = "asc"
                } else {
                    h(this).addClass("desc").removeClass("asc").siblings().removeClass("asc desc");
                    J = "desc"
                }
                H.dataList.sort(function(M, L) {
                    return Fai.compareObjNew(M, L, J, K)
                });
                w(I, H);
                if ( !! H.sortCallback) {
                    H.sortCallback()
                }
            }
        })
    }
    function C(I) {
        var H = I.find("div.center>table>thead>tr>th").length;
        return H
    }
    function n(J, P) {
        var L = J.page.startPage;
        var I = J.page.showCount;
        var K = J.tmp.maxPage;
        var O = [];
        if (I == 0) {
            return P
        }
        var N = P.length;
        if (P && P.length > 0) {
            var N = P.length;
            K = N % I == 0 ? (N / I) : Math.floor(N / I) + 1;
            L = L < 1 ? 1 : L;
            L = L > K ? K: L;
            J.page.startPage = L;
            var M = ((L - 1) * I < 0) ? 0 : ((L - 1) * I);
            var H = (L + I) < 0 ? 0 : (L + I);
            H = H > N ? N: (M + I);
            for (i = M; i < H; i++) {
                if (typeof P[i] != "undefined") {
                    O.push(P[i])
                }
            }
        } else {
            K = 1
        }
        J.tmp.maxPage = K;
        return O
    }
    function t(L, K) {
        var J = [];
        var M;
        var I;
        M = (K.page.startPage - 2 <= 0) ? 1 : (K.page.startPage - 2);
        I = ((K.page.startPage + 2) >= K.tmp.maxPage) ? K.tmp.maxPage: (K.page.startPage + 2);
        if (K.page.pageClass.isDefaultPage === true) {
            if (K.page.pageClass.pageStyle == "new") {
                J.push('<a href="javascript:;" hidefocus="true" class="prevPage disabledBtn ' + K.page.pageClass.pagePrevClass + '"><div class="pagePrevClassImg"></div></a>');
                if (Math.abs(K.page.startPage - 1) > 5 && 1 != M) {
                    J.push("<div class='pageNo_model'><a class='grayContent'>1</a></div>")
                }
                if (M > 2) {
                    J.push("<div class='pageEllipsis_new'></div>")
                }
                for (var H = M; H <= I; H++) {
                    if (H == K.page.startPage) {
                        J.push("<div class='pageNo_model'><span style='margin-left:4px;' class='blueTitle'>" + K.page.startPage + "</span></div>")
                    } else {
                        J.push("<div class='pageNo_model'><a class='grayContent'>", H, "</a></div>")
                    }
                }
                if (I < K.tmp.maxPage - 1) {
                    J.push("<div class='pageEllipsis_new'></div>")
                }
                if (Math.abs(K.page.startPage - K.tmp.maxPage) > 5 && K.tmp.maxPage != I) {
                    J.push("<div class='pageNo_model'><a class='grayContent'>" + K.tmp.maxPage + "</a></div>")
                }
                J.push('<a href="javascript:;" hidefocus="true" class="nextPage disabledBtn ' + K.page.pageClass.pageNextClass + '"><div class="pageNextClassImg"></div></a>');
                J.push('<span style="margin-left: 10px;position: relative;top:1px;" class="currentPage">共&nbsp;' + K.tmp.maxPage + "&nbsp;页</span>");
                J.push('<div class="pageSearch pageSearch_N"><span class="grayTitle">到第&nbsp;<input oninput="this.value=this.value.replace(/[^0-9]+/g,\'\')" type="text" maxlength="3" onkeypress="javascript:return Fai.isNumberKey(event);">&nbsp;页<span></div>');
                J.push('<div class="pageSearchClick pageSearchClick_N"><a class="bottomSearch" href="javascript:;">确定</a></div>')
            } else {
                J.push('<a href="javascript:;" hidefocus="true" class="prevPage disabledBtn ' + K.page.pageClass.pagePrevClass + '"><div class="pagePrevClassImg"></div></a>');
                J.push('<span class="currentPage">' + K.page.startPage + "/" + K.tmp.maxPage + "</span>");
                J.push('<a href="javascript:;" hidefocus="true" class="nextPage disabledBtn ' + K.page.pageClass.pageNextClass + '"><div class="pageNextClassImg"></div></a>');
                J.push('<div class="pageSearch"><input type="text" maxlength="3" onkeypress="javascript:return Fai.isNumberKey(event);"></div>');
                J.push('<div class="pageSearchClick">跳转</div>')
            }
        } else {
            J.push('<a href="javascript:;" hidefocus="true" class="prevPage disabledBtn">上一页</a>');
            J.push('<span class="currentPage">' + K.page.startPage + "/" + K.tmp.maxPage + "页</span>");
            J.push('<a href="javascript:;" hidefocus="true" class="nextPage disabledBtn">下一页</a>')
        }
        L.find("div.bottom>.page").html(J.join(""));
        p(L, K)
    }
    function p(L, K) {
        var P = L.find("div.bottom>div.page");
        var I = P.find("a.prevPage");
        var Q = P.find("a.nextPage");
        var H = P.find(".pageSearchClick");
        var O = K.page.startPage;
        var J = K.page.showCount;
        var M = K.tmp.maxPage;
        if (K.page.pageClass.pageStyle == "new") {
            var N = P.find(".pageNo_model");
            N.each(function() {
                var R = h(this).find(".grayContent").text();
                h(this).find(".grayContent").addClass("pointer");
                h(this).find(".grayContent").bind("click",
                function() {
                    K.page.startPage = parseInt(R);
                    w(L, K)
                })
            })
        }
        if (O > 1) {
            I.removeClass("disabledBtn")
        }
        if (O < M) {
            Q.removeClass("disabledBtn")
        }
        if (K.page.pageClass.pageStyle == "new") {
            if (I.hasClass("disabledBtn")) {
                I.removeClass("prevShow_model");
                I.addClass("prevHide_model")
            }
            if (Q.hasClass("disabledBtn")) {
                Q.removeClass("nextShow_model");
                Q.addClass("nextHide_model")
            }
        }
        if (!I.hasClass("disabledBtn")) {
            I.addClass("pointer");
            I.bind("click",
            function() {
                e(L, K)
            })
        }
        if (!Q.hasClass("disabledBtn")) {
            Q.addClass("pointer");
            Q.bind("click",
            function() {
                A(L, K)
            })
        }
        if (M > 1) {
            H.removeClass("disabledBtn")
        }
        if (!H.hasClass("disabledBtn")) {
            H.addClass("pointer");
            H.bind("click",
            function() {
                u(L, K)
            })
        }
    }
    function e(M, L) {
        var K = L.page.startPage;
        var J = L.page.showCount;
        var H = L.dataList.length;
        var I = H % J == 0 ? (H / J) : Math.floor(H / J) + 1;
        if (K - 1 > 0) {
            K--
        }
        L.page.startPage = K;
        w(M, L)
    }
    function A(M, L) {
        var K = L.page.startPage;
        var J = L.page.showCount;
        var H = L.dataList.length;
        var I = H % J == 0 ? (H / J) : Math.floor(H / J) + 1;
        if (K + 1 <= I) {
            K++
        }
        L.page.startPage = K;
        w(M, L)
    }
    function u(O, M) {
        var N = O.find("div.bottom>div.page");
        var J = N.find(".pageSearch input").val();
        if (J != "") {
            J = parseInt(J)
        }
        var L = M.page.startPage;
        var K = M.page.showCount;
        var H = M.dataList.length;
        var I = H % K == 0 ? (H / K) : Math.floor(H / K) + 1;
        if (J <= I && J > 0) {
            M.page.startPage = J
        } else {
            if (J === "") {
                Fai.ing("您没有输入数值。", true)
            } else {
                M.page.startPage = I
            }
        }
        w(O, M)
    }
    function D(K, H) {
        if (h.isArray(K)) {
            var J = h.extend(true, [], K);
            h.each(J,
            function(L, M) {
                delete(M[H.primaryKey])
            });
            return J
        }
        if (typeof K === "object") {
            var I = h.extend(true, {},
            K);
            delete(I[H.primaryKey]);
            return I
        }
    }
    function q(L, I) {
        var J = L.find("div.center>table>thead>tr>th");
        var H = L.find("div.center>table>tbody>tr");
        var K = I.tableColumn.hiddenKeyList;
        h.each(J,
        function(M) {
            var N = h(this).attr("data-key");
            h(this).removeClass("disabled");
            if (h.inArray(N, K) != -1) {
                h(this).addClass("disabled")
            }
            h.each(H,
            function(O) {
                h(this).find("td").eq(M).removeClass("disabled");
                if (h.inArray(N, K) != -1) {
                    h(this).find("td").eq(M).addClass("disabled")
                }
            })
        })
    }
    function y(J, I) {
        var H = [];
        h.each(I.dataList,
        function(K, M) {
            var L = 0;
            h.each(I.tmp.searchMatcher,
            function(P, Q) {
                var T = Q.searchKeyList;
                var O = Q.searchString;
                var N = Q.useToLowerCase;
                if (typeof N === "undefined") {
                    N = true
                }
                var S = Q.cmd;
                if (typeof S == "undefined") {
                    S = "like"
                }
                var R = false;
                h.each(T,
                function(U, V) {
                    var W = M[V];
                    if (N && typeof O === "string" && typeof W === "string") {
                        W = W.toString().toLowerCase();
                        O = O.toString().toLowerCase()
                    } else {
                        if (typeof W === "string") {
                            W = W.toString()
                        } else {
                            if (typeof W === "undefined") {
                                W = ""
                            }
                        }
                    }
                    if (S == "eq") {
                        if (W === O) {
                            R = true;
                            return false
                        }
                    } else {
                        if (S == "gt") {
                            if (W > O) {
                                R = true;
                                return false
                            }
                        } else {
                            if (S == "lt") {
                                if (W < O) {
                                    R = true;
                                    return false
                                }
                            } else {
                                if (S == "ge") {
                                    if (M[V].toString() >= O) {
                                        R = true;
                                        return false
                                    }
                                } else {
                                    if (S == "le") {
                                        if (W <= O) {
                                            R = true;
                                            return false
                                        }
                                    } else {
                                        if (S == "and") {
                                            if (Fai.checkBit(W, O)) {
                                                R = true;
                                                return false
                                            }
                                        } else {
                                            if (S == "inArray") {
                                                if (h.inArray(O, W) >= 0) {
                                                    R = true;
                                                    return false
                                                }
                                            } else {
                                                if (S == "callBack") {
                                                    if (Q.callBack(M)) {
                                                        R = true;
                                                        return false
                                                    }
                                                } else {
                                                    if (typeof W != "string") {
                                                        W = W.toString()
                                                    }
                                                    if (W.indexOf(O) >= 0) {
                                                        R = true;
                                                        return false
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
                if (R) {
                    L++
                }
            });
            if (L == I.tmp.searchMatcher.length) {
                H.push(M)
            }
        });
        I.tmp.result = H
    }
})(jQuery); (function(g) {
    var b = new Array("00", "33", "66", "99", "CC", "FF");
    var c = new Array("FF0000", "00FF00", "0000FF", "FFFF00", "00FFFF", "FF00FF");
    function a(o) {
        var n;
        if (o) {
            Fai.top.$("body").append('<div id="colorpanel" class="colorpanel"></div>');
            n = Fai.top.$("#colorpanel")
        } else {
            g("body").append('<div id="colorpanel" class="colorpanel"></div>');
            n = g("#colorpanel")
        }
        var m = "";
        for (i = 0; i < 2; i++) {
            for (j = 0; j < 6; j++) {
                m = m + "<tr height=12>";
                if (i == 0) {
                    m = m + '<td width=11 style="background-color:#' + b[j] + b[j] + b[j] + ';">'
                } else {
                    m = m + '<td width=11 style="background-color:#' + c[j] + ';">'
                }
                for (k = 0; k < 3; k++) {
                    for (l = 0; l < 6; l++) {
                        m = m + '<td width=11 style="background-color:#' + b[k + i * 3] + b[l] + b[j] + ';">'
                    }
                }
            }
        }
        var p = "";
        var q = "";
        if (typeof Fai != "undefined" && typeof Fai.top._resRoot != "undefined") {
            q = Fai.top._resRoot
        }
        if (g.browser.msie && /6.0/.test(navigator.userAgent)) {
            p = '<iframe frameborder="0" tabindex="-1" src="javascript:false" class="colorFrameBorder"/>'
        }
        m = p + '<div class="color_outsideBorder"><table width=229px border="0" cellspacing="0" cellpadding="0" style="background-color:#e8f3fe;" class="colorTableBody"><tr height=27><td colspan=21><table cellpadding="0" cellspacing="1" border="0" class="colorBorderCollapse"><tr><td width="3"><td><div class="DisColorBorder"><div id="DisColor" class="DisColor"></div><div></td><td width="3"><td id="is_Transparent"><input type="text" id="HexColor" size="7" class="HexColor" value="#000000"><a hidefocus="true" class="color_transparent" href="javascript:;" onclick="return false;" id="_cTransparent" title="透明色"></a><a hidefocus="true" class="color_sure" href="javascript:;" onclick="return false;" id="_cconfirm" title="确定"></a><a hidefocus="true" class="color_close" href="javascript:;" onclick="return false;" id="_cclose" title="关闭"></a></td></tr></table></td></table><div class="color_insideBorder"><div class="color_white"><table id="CT" border="1" cellspacing="0" cellpadding="0" class="colorBorderCollapse color_borderTableColor" bordercolor="000000">' + m + "</table></div></div></div>";
        n.html(m);
        n.mouseout(function(r) {
            n.attr("mouseIn", 0)
        });
        n.mouseover(function(r) {
            n.attr("mouseIn", 1)
        });
        n.focusout(function() {
            if (n.attr("mouseIn") == 1) {
                n.find("#HexColor").focus();
                return
            }
            n.remove()
        })
    }
    function h() {
        g("#colorpanel").remove()
    }
    function f(p, u, o, q, n, s, r) {
        var m = g("#" + p);
        var t = "";
        if (typeof Fai != "undefined" && typeof Fai.top._resRoot != "undefined") {
            t = Fai.top._resRoot
        }
        if (typeof n != "undefined" && n != null && n != "") {
            m.css("background", n)
        }
        m.attr("title", "点击选择颜色");
        g("#" + p).click(function() {
            var A = g(this).offset().top;
            var D = g(this).height();
            var v = g(this).offset().left;
            a(r);
            var C, I, B, z, H, w, G;
            if (r) {
                C = Fai.top.$("#DisColor");
                I = Fai.top.$("#HexColor");
                B = Fai.top.$("#colorpanel");
                z = Fai.top.$("#CT tr td");
                H = Fai.top.$("#_cTransparent");
                w = Fai.top.$("#_cconfirm");
                G = Fai.top.$("#_cclose")
            } else {
                C = g("#DisColor");
                I = g("#HexColor");
                B = g("#colorpanel");
                z = g("#CT tr td");
                H = g("#_cTransparent");
                w = g("#_cconfirm");
                G = g("#_cclose")
            }
            var E = m.css("background-color");
            C.css("background-color", E);
            if (E == "rgba(0, 0, 0, 0)" || E == "transparent") {
                I.val("")
            } else {
                E = d(E);
                I.val(E)
            }
            var y = A + D + o,
            F = v + q - 4;
            if (r) {
                var x = Fai.top.$(".formDialog");
                if (x.length > 0) {
                    y += (x.offset().top + 9);
                    F += (x.offset().left + 26)
                }
            }
            B.css({
                top: y,
                left: F
            });
            if (A + D + o < 0) {
                B.css({
                    top: "4px"
                })
            }
            B.show();
            z.unbind("click").mouseover(function() {
                var J = g(this).css("background-color");
                J = d(J);
                C.css("background-color", J);
                I.val(J)
            }).click(function() {
                if (u) {
                    var J = g(this).css("background-color");
                    u(d(J))
                }
                J = d(J);
                m.css("background", J);
                m.css("border", "1px solid #aab3bb");
                B.remove()
            });
            if (typeof s != "undefined" && s == true) {
                H.show();
                H.mouseover(function() {
                    C.css("background-color", "");
                    I.val(null)
                }).click(function() {
                    if (u) {
                        u("transparent");
                        m.css("background", "transparent")
                    }
                    B.remove()
                })
            } else {
                H.hide()
            }
            w.click(function() {
                if (u) {
                    var K = I.val();
                    var J = false;
                    if (K.indexOf("#") == 0 && (K.length == 4 || K.length == 7)) {
                        J = true
                    }
                    if (K != "") {
                        K = d(K)
                    }
                    if (typeof s != "undefined" && s == true && K == "") {
                        K = "transparent";
                        J = true
                    }
                    if (J) {
                        u(K);
                        m.css("background", K);
                        m.css("border", "1px solid #aab3bb")
                    }
                    B.remove()
                }
            });
            G.click(function() {
                B.remove()
            });
            B.find("#HexColor").focus();
            B.attr("mouseIn", 0);
            I.keydown(function(J) {
                if (g.browser.msie) {
                    if ((event.keyCode == 13)) {
                        w.click();
                        return false
                    }
                    return true
                } else {
                    if ((J.which == 13)) {
                        w.click();
                        return false
                    }
                    return true
                }
            });
            I.bind("cut paste",
            function() {
                setTimeout(function() {
                    var K = I.val();
                    var J = false;
                    if (K.indexOf("#") == 0 && (K.length == 4 || K.length == 7)) {
                        J = true
                    }
                    if (typeof s != "undefined" && s == true && K == "") {
                        K = "transparent";
                        J = true
                    }
                    if (J) {
                        C.css("background-color", K)
                    }
                },
                10)
            });
            I.keyup(function() {
                var K = g(this).val();
                var J = false;
                if (K.indexOf("#") == 0 && (K.length == 4 || K.length == 7)) {
                    J = true
                }
                if (typeof s != "undefined" && s == true && K == "") {
                    K = "transparent";
                    J = true
                }
                if (J) {
                    C.css("background-color", K)
                }
            })
        })
    }
    function d(o) {
        if (o.charAt(0) == "#") {
            return o
        }
        var q = Number(o);
        var p = o.split(/\D+/);
        var m = Number(p[1]) * 65536 + Number(p[2]) * 256 + Number(p[3]);
        return "#" + e(m, 6)
    }
    function e(m, o) {
        var n = m.toString(16);
        while (n.length < o) {
            n = "0" + n
        }
        return n
    }
    jQuery.extend({
        showcolor: function(r, s, p, n, q, m, o) {
            f(r, s, p, n, q, m, o)
        }
    })
})(jQuery); (function(d) {
    d.fn.faiColorPicker = function(s) {
        var r = {
            base: this,
            target: this,
            baseattr: "background-color",
            targetattr: "background-color",
            defaultcolor: null,
            col1: ["#ffffff", "#dbdbdb", "#9b9b9b", "#4d4d4d", "#161616", "#000000"],
            col2: ["#cbdeff", "#69a1ff", "#0f67ff", "#0042b3", "#01296e", "#001e4d"],
            col3: ["#c0b6ff", "#6b55ff", "#1f00fc", "#1200a0", "#0a015e", "#08004b"],
            col4: ["#d7b5ff", "#9f56ff", "#7000fc", "#4800a0", "#2b005c", "#210049"],
            col5: ["#f0bfdd", "#e16cb3", "#dd158f", "#9c0061", "#570035", "#410028"],
            col6: ["#ffcfc1", "#ff835f", "#ff3e07", "#ac0000", "#661500", "#501100"],
            col7: ["#ffe9c4", "#ffc265", "#ff9d0b", "#b06900", "#683f00", "#4f2f00"],
            col8: ["#fff6d5", "#fee370", "#ffd119", "#bb9600", "#765d00", "#594601"],
            col9: ["#e2efc3", "#c0e073", "#a4db1d", "#719f00", "#405a00", "#314500"],
            colnormal: ["#c00000", "#ff0000", "#ffc000", "#ffff00", "#94d152", "#00af50", "#01b0f1", "#0172c2", "#012060"],
            historyCookie: Fai.top.$.cookie,
            advance: true,
            showInTop: false,
            onreset: d.noop,
            onchange: d.noop,
            onmousein: d.noop,
            id: this.selector,
            top: 0,
            left: 0
        };
        s = d.extend({},
        r, s);
        if (s.defaultcolor && s.baseattr) {
            s.base.css(s.baseattr, s.defaultcolor)
        }
        if (s.showInTop) {
            s.$$ = Fai.top.$
        } else {
            s.$$ = d
        }
        s.base.bind("click", {
            options: s,
            $$: s.$$
        },
        n)
    };
    function n(s) {
        s.stopPropagation();
        var B = s.data.$$;
        var E = s.data.options;
        B(".faiColorPicker").remove();
        var C = E.historyCookie("colorpicker_history") ? decodeURIComponent(E.historyCookie("colorpicker_history")).split(",") : [];
        var u = "faiColorPicker" + Math.floor(Math.random() * 1000);
        var A = '<div class="faiColorPicker" id="' + u + '"><input type="text" id="faiColorPicker-hidden" /><div class="faiColorPicker-clearcolor"><div class="original-title">当前颜色:</div><div class="original-color" style="background-color:transparent;"></div><div class="original-clear" title="透明色"></div></div>';
        A += '<div class="faiColorPicker-colorcol">';
        for (var r = 1,
        y; r < 10; r++) {
            y = E["col" + r];
            A += '<div class="col"><div class="col-color first"><div 	style="background-color:' + y[0] + '"></div></div><div class="col-color second"><div style="background-color:' + y[1] + '"></div></div><div class="col-color"><div 		style="background-color:' + y[2] + '"></div></div><div class="col-color"><div 		style="background-color:' + y[3] + '"></div></div><div class="col-color"><div 		style="background-color:' + y[4] + '"></div></div><div class="col-color last"><div 	style="background-color:' + y[5] + '"></div></div></div>'
        }
        A += "</div>";
        A += '<div class="faiColorPicker-colornormal"><div class="colornormal-title">标准颜色:</div><div class="colornormal-color">';
        var v = E.colnormal;
        for (var w = 0; w < 9; w++) {
            A += '<div class="col"><div class="col-color normal"><div style="background-color:' + v[w] + '"></div></div></div>'
        }
        A += "</div></div>";
        A += '<div class="faiColorPicker-colorhistory"><div class="colorhistory-title">最近使用:</div><div class="colorhistory-color">';
        for (var w = 0,
        x = C.length; w < x; w++) {
            A += '<div class="col"><div class="col-color history"><div style="background-color:' + C[w] + ';"></div></div></div>'
        }
        A += "</div></div>";
        if (E.advance) {
            A += '<div class="faiColorPicker-coloradvance"><a class="coloradvance-btn" href="javascript:;">更多颜色</a></div>'
        }
        A += "</div>";
        B("body").append(A);
        B(".faiColorPicker-colorcol>.col").last().addClass("col-last");
        B(".faiColorPicker-colornormal>.colornormal-color>.col").last().addClass("col-last");
        B(".faiColorPicker-colorhistory>.colorhistory-color>.col").last().addClass("col-last");
        var z, t;
        if (E.showInTop) {
            if (B(".formDialog").offset()) {
                var D = B(".formDialog:last").offset();
                t = E.left + D.left + E.base.offset().left + E.base.width() / 2;
                z = E.top + D.top + E.base.offset().top + E.base.height() / 2 + 27
            } else {
                t = E.left + E.base.offset().left + E.base.width() / 2;
                z = E.top + E.base.offset().top + E.base.height() / 2
            }
        } else {
            t = E.left + E.base.offset().left + E.base.width() / 2;
            z = E.top + E.base.offset().top + E.base.height() / 2;
            if (d(window).height() - z < 272) {
                z = z - 272
            }
            if (d(window).width() - t < 206) {
                t = t - 206
            }
        }
        B(".faiColorPicker").css({
            left: t,
            top: z,
            "z-index": 9999
        }).show();
        B(".faiColorPicker").click(function(F) {
            F.stopPropagation()
        });
        B(".faiColorPicker").find("#faiColorPicker-hidden").focus();
        p(E)
    }
    function p(t) {
        var s = t.$$;
        s(".original-color").css("background-color", t.target.css(t.targetattr));
        s(".col-color").unbind("click", o).bind("click", {
            $$: s,
            elm: t.target,
            targetattr: t.targetattr,
            onchange: t.onchange
        },
        o);
        s(".col-color").unbind("mouseenter", m).bind("mouseenter", {
            $$: s,
            elm: t.target,
            targetattr: t.targetattr,
            onmousein: t.onmousein,
            onchange: t.onchange
        },
        m);
        s(".faiColorPicker").unbind("mouseleave", c).bind("mouseleave", {
            $$: s,
            elm: t.target,
            targetattr: t.targetattr,
            onchange: t.onchange
        },
        c);
        s(".original-clear").unbind("click", b).bind("click", {
            $$: s,
            elm: t.target,
            targetattr: t.targetattr,
            onchange: t.onchange,
            onreset: t.onreset
        },
        b);
        s(".original-clear").unbind("mouseenter", f).bind("mouseenter", {
            $$: s,
            elm: t.target,
            targetattr: t.targetattr,
            onchange: t.onchange,
            onreset: t.onreset
        },
        f);
        s(".coloradvance-btn").unbind("click", g).bind("click", {
            $$: s,
            elm: t.target,
            targetattr: t.targetattr,
            base: t.base,
            baseattr: t.baseattr,
            onchange: t.onchange
        },
        g);
        s("body").unbind("click", h).bind("click", {
            $$: s,
            elm: t.target,
            targetattr: t.targetattr,
            onchange: t.onchange,
        },
        h);
        if (t.showInTop) {
            d("body").unbind("click", h).bind("click", {
                $$: s,
                elm: t.target,
                targetattr: t.targetattr,
                onchange: t.onchange
            },
            h);
            var r = s(".faiColorPicker");
            r.mouseout(function() {
                r.attr("mouseIn", 0)
            }).mouseover(function() {
                r.attr("mouseIn", 1)
            }).focusout(function() {
                if (r.attr("mouseIn") == 1) {
                    r.find("#faiColorPicker-hidden").focus();
                    return
                }
                r.remove()
            })
        }
    }
    function o(t) {
        t.stopPropagation();
        var s = t.data.$$;
        var r = s(this).find("div").css("background-color");
        r = e(r);
        q(r);
        t.data.elm.css(t.data.targetattr, r);
        s(".original-color").css("background-color", r);
        s(".faiColorPicker").remove();
        t.data.onchange.apply(t.data.elm, [r, a(r)])
    }
    function b(s) {
        s.stopPropagation();
        var r = s.data.$$;
        s.data.elm.css(s.data.targetattr, "transparent");
        r(".original-color").css("background-color", "transparent");
        s.data.onchange.apply(s.data.elm, ["transparent", "transparent"]);
        s.data.onreset.apply(s.data.elm, [this])
    }
    function f(s) {
        s.stopPropagation();
        var r = s.data.$$;
        r(".original-color").css("background-color", "transparent");
        s.data.onchange.apply(s.data.elm, ["transparent", "transparent"]);
        s.data.onreset.apply(s.data.elm, [this])
    }
    function m(t) {
        var s = t.data.$$;
        var r = d(this).find("div").css("background-color");
        r = e(r);
        s(".original-color").css("background-color", r);
        t.data.onmousein.apply(t.data.elm, [r, a(r)]);
        t.data.onchange.apply(t.data.elm, [r, a(r)])
    }
    function c(s) {
        var r = s.data.elm.css(s.data.targetattr);
        if (r) {
            s.data.onchange.apply(s.data.elm, [r, a(r)])
        }
    }
    function h(t) {
        var s = t.data.$$;
        if (s(".faiColorPicker").length > 0) {
            var r = t.data.elm.css(t.data.targetattr);
            if (r) {
                t.data.onchange.apply(t.data.elm, [r, a(r)])
            }
        }
        s(".faiColorPicker").remove()
    }
    function g(u) {
        u.stopPropagation();
        var s = u.data.$$;
        var r = u.data.elm.css(u.data.targetattr);
        if (r) {
            u.data.onchange.apply(u.data.elm, [r, a(r)])
        }
        s(".faiColorPicker").remove();
        var t = Fai.popupWindow({
            title: "高级颜色选项",
            width: 470,
            height: 260,
            divId: "AdvanceFaiColorPicker",
            divContent: '<div class="AdvanceColorPicker"><script type="text/javascript">$(".AdvanceColorPicker").ColorPicker({flat: true , color:"' + e(u.data.elm.css(u.data.targetattr)) + '"});<\/script></div>'
        });
        s("#popupWindow" + t).find(".colorpicker_cancel").unbind("click").bind("click",
        function() {
            Fai.closePopupWindow(t)
        });
        s("#popupWindow" + t).find(".colorpicker_submit").unbind("click").bind("click", {
            base: u.data.base,
            baseattr: u.data.baseattr,
            onchange: u.data.onchange
        },
        function(w) {
            var v = "#" + (s(".colorpicker_hex>input").val());
            w.data.base.css(w.data.baseattr, v);
            w.data.onchange(v, a(v));
            q(v);
            Fai.closePopupWindow(t)
        });
        return false
    }
    function e(r) {
        if (/#/g.test(r)) {
            return r
        }
        r = (r.replace(/[rgba\(\)]/g, "")).split(",");
        var u = ["#"];
        for (var s = 0,
        t; s < 3; s++) {
            t = parseInt(r[s]).toString(16);
            if (t.length === 1) {
                t = "0" + t
            }
            u.push(t)
        }
        return u.join("")
    }
    function a(s) {
        if (/rgb/gi.test(s)) {
            return s
        }
        s = parseInt(s.substring(1), 16);
        var r = ["rgb(", s >> 16, ",", (s & 65280) >> 8, ",", (s & 255), ")"];
        return r.join("")
    }
    function q(s) {
        var v = Fai.top.$.cookie("colorpicker_history");
        var t = v ? decodeURIComponent(v).split(",") : [],
        u = t.join(),
        r = new RegExp(s, "gi");
        if (r.test(u)) {
            return
        }
        if (t.length > 8) {
            t.pop();
            t.unshift(s);
            Fai.top.$.cookie("colorpicker_history", encodeURIComponent(t))
        } else {
            t.unshift(s);
            Fai.top.$.cookie("colorpicker_history", encodeURIComponent(t))
        }
    }
})(jQuery); (function(b) {
    var a = function() {
        var ac = {},
        c, X = 65,
        B, Z = ['<div class="colorpicker">', '<div class="colorpicker_color">', "<div>", "<div></div>", "</div>", "</div>", '<div class="colorpicker_hue">', "<div></div>", "</div>", '<div class="colorpicker_new_color_title">新增</div>', '<div class="colorpicker_current_color_title">当前</div>', '<div class="colorpicker_new_color"></div>', '<div class="colorpicker_current_color"></div>', '<div class="colorpicker_hex">', '<span> #</span><input type="text" maxlength="6" size="6" />', "</div>", '<div class="colorpicker_rgb_r colorpicker_field">', '<i class="colorpicker_field_title">红(R):</i> ', '<input type="text" maxlength="3" size="3" class="numeric" />', '<span><i class="colorpicker_rgbnum_add"></i><i class="colorpicker_rgbnum_reduce"></i></span>', "</div>", '<div class="colorpicker_rgb_g colorpicker_field">', '<i class="colorpicker_field_title">绿(G):</i>', '<input type="text" maxlength="3" size="3" class="numeric" />', '<span><i class="colorpicker_rgbnum_add"></i><i class="colorpicker_rgbnum_reduce"></i></span>', "</div>", '<div class="colorpicker_rgb_b colorpicker_field">', '<i class="colorpicker_field_title">蓝(B):</i>', '<input type="text" maxlength="3" size="3" class="numeric" />', '<span><i class="colorpicker_rgbnum_add"></i><i class="colorpicker_rgbnum_reduce"></i></span>', "</div>", '<div class="colorpicker_hsb_h colorpicker_field">', '<i class="colorpicker_field_title">色相(H):</i>', '<input type="text" maxlength="3" size="3" class="numeric"/>', '<span><i class="colorpicker_hsbnum_add"></i><i class="colorpicker_hsbnum_reduce"></i></span>', "</div>", '<div class="colorpicker_hsb_s colorpicker_field">', '<i class="colorpicker_field_title">饱和度(S):</i>', '<input type="text" maxlength="3" size="3" class="numeric"/>', '<span><i class="colorpicker_hsbnum_add"></i><i class="colorpicker_hsbnum_reduce"></i></span>', "</div>", '<div class="colorpicker_hsb_b colorpicker_field">', '<i class="colorpicker_field_title">亮度(B):</i>', '<input type="text" maxlength="3" size="3" class="numeric"/>', '<span><i class="colorpicker_hsbnum_add"></i><i class="colorpicker_hsbnum_reduce"></i></span>', "</div>", '<div class="colorpicker_submit abutton faiButton saveButton">确定</div>', '<div class="colorpicker_cancel abutton faiButton cancelButton ">取消</div>', "</div>"].join(""),
        K = {
            eventName: "click",
            onShow: b.noop,
            onBeforeShow: b.noop,
            onHide: b.noop,
            color: "ff0000",
            livePreview: true,
            flat: false
        },
        S = function(ad, af) {
            var ae = p(ad);
            b(af).data("colorpicker").fields.eq(1).val(ae.r).end().eq(2).val(ae.g).end().eq(3).val(ae.b).end()
        },
        C = function(ad, ae) {
            b(ae).data("colorpicker").fields.eq(4).val((ad.h).toFixed(0)).end().eq(5).val((ad.s).toFixed(0)).end().eq(6).val((ad.b).toFixed(0)).end()
        },
        h = function(ad, ae) {
            b(ae).data("colorpicker").fields.eq(0).val(ab(ad)).end()
        },
        s = function(ad, ae) {
            b(ae).data("colorpicker").selector.css("backgroundColor", "#" + ab({
                h: ad.h,
                s: 100,
                b: 100
            }));
            b(ae).data("colorpicker").selectorIndic.css({
                left: parseInt(150 * ad.s / 100, 10),
                top: parseInt(150 * (100 - ad.b) / 100, 10)
            })
        },
        P = function(ad, ae) {
            b(ae).data("colorpicker").hue.css("top", parseInt(150 - 150 * ad.h / 360, 10))
        },
        m = function(ad, ae) {
            b(ae).data("colorpicker").currentColor.css("backgroundColor", "#" + ab(ad))
        },
        N = function(ad, ae) {
            b(ae).data("colorpicker").newColor.css("backgroundColor", "#" + ab(ad))
        },
        v = function(ad) {
            var af = ad.charCode || ad.keyCode || -1;
            if ((af > X && af <= 90) || af == 32) {
                return false
            }
            var ae = b(this).parent().parent();
            if (ae.data("colorpicker").livePreview === true) {
                e.apply(this)
            }
        },
        e = function(ae) {
            var af = b(this).parent().parent(),
            ad;
            if (this.parentNode.className.indexOf("_hex") > 0) {
                af.data("colorpicker").color = ad = t(H(this.value))
            } else {
                if (this.parentNode.className.indexOf("_hsb") > 0) {
                    af.data("colorpicker").color = ad = g({
                        h: af.data("colorpicker").fields.eq(4).val(),
                        s: af.data("colorpicker").fields.eq(5).val(),
                        b: af.data("colorpicker").fields.eq(6).val()
                    })
                } else {
                    af.data("colorpicker").color = ad = n(U({
                        r: af.data("colorpicker").fields.eq(1).val(),
                        g: af.data("colorpicker").fields.eq(2).val(),
                        b: af.data("colorpicker").fields.eq(3).val()
                    }))
                }
            }
            if (ae) {
                S(ad, af.get(0));
                h(ad, af.get(0));
                C(ad, af.get(0))
            }
            s(ad, af.get(0));
            P(ad, af.get(0));
            N(ad, af.get(0))
        },
        w = function(ae) {
            var af = b(this).parent().parent();
            var ad = ad = af.data("colorpicker").color;
            af.data("colorpicker").fields.parent().removeClass("colorpicker_focus");
            S(ad, af.get(0));
            C(ad, af.get(0));
            h(ad, af.get(0));
            P(ad, af.get(0));
            s(ad, af.get(0));
            N(ad, af.get(0))
        },
        T = function() {
            X = this.parentNode.className.indexOf("_hex") > 0 ? 70 : 65;
            b(this).parent().parent().data("colorpicker").fields.parent().removeClass("colorpicker_focus");
            b(this).parent().addClass("colorpicker_focus")
        },
        R = function(ad) {
            ad.stopPropagation();
            var af = b(this).parent().find("input").focus();
            var ae = {
                el: b(this).parent().addClass("colorpicker_slider"),
                max: this.parentNode.className.indexOf("_hsb_h") > 0 ? 360 : (this.parentNode.className.indexOf("_hsb") > 0 ? 100 : 255),
                y: ad.pageY,
                field: af,
                val: parseInt(af.val(), 10),
                preview: b(this).parent().parent().data("colorpicker").livePreview
            };
            b(document).bind("mouseup", ae, A);
            b(document).bind("mousemove", ae, V)
        },
        V = function(ad) {
            ad.data.field.val(Math.max(0, Math.min(ad.data.max, parseInt(ad.data.val + ad.pageY - ad.data.y, 10))));
            if (ad.data.preview) {
                e.apply(ad.data.field.get(0), [true])
            }
            return false
        },
        A = function(ad) {
            e.apply(ad.data.field.get(0), [true]);
            ad.data.el.removeClass("colorpicker_slider").find("input").focus();
            b(document).unbind("mouseup", A);
            b(document).unbind("mousemove", V);
            return false
        },
        u = function(ad) {
            ad.stopPropagation();
            var ae = b(this).parent().parent().find("input").focus();
            ae.val(parseInt(ae.val()) + 3);
            e.apply(b(this).parent().get(0), [true])
        },
        f = function(ad) {
            ad.stopPropagation();
            var ae = b(this).parent().parent().find("input").focus();
            ae.val(parseInt(ae.val()) - 3);
            e.apply(b(this).parent().get(0), [true])
        },
        Y = function(ad) {
            ad.stopPropagation();
            var ae = b(this).parent().parent().find("input").focus();
            ae.val(parseInt(ae.val()) + 1);
            e.apply(b(this).parent().get(0), [true])
        },
        G = function(ad) {
            ad.stopPropagation();
            var ae = b(this).parent().parent().find("input").focus();
            ae.val(parseInt(ae.val()) - 1);
            e.apply(b(this).parent().get(0), [true])
        },
        E = function(ad) {
            ad.stopPropagation();
            var ae = {
                cal: b(this).parent(),
                y: b(this).offset().top
            };
            ae.preview = ae.cal.data("colorpicker").livePreview;
            e.apply((ae.cal.data("colorpicker").fields.eq(4).val(parseInt(360 * (150 - Math.max(0, Math.min(150, (ad.pageY - ae.y)))) / 150, 10)).get(0)), [true]);
            b(document).bind("mouseup", ae, z);
            b(document).bind("mousemove", ae, q)
        },
        q = function(ad) {
            e.apply(ad.data.cal.data("colorpicker").fields.eq(4).val(parseInt(360 * (150 - Math.max(0, Math.min(150, (ad.pageY - ad.data.y)))) / 150, 10)).get(0), [ad.data.preview]);
            return false
        },
        z = function(ad) {
            S(ad.data.cal.data("colorpicker").color, ad.data.cal.get(0));
            h(ad.data.cal.data("colorpicker").color, ad.data.cal.get(0));
            b(document).unbind("mouseup", z);
            b(document).unbind("mousemove", q);
            return false
        },
        F = function(ad) {
            ad.stopPropagation();
            var ae = {
                cal: b(this).parent(),
                pos: b(this).offset()
            };
            ae.preview = ae.cal.data("colorpicker").livePreview;
            e.apply(ae.cal.data("colorpicker").fields.eq(6).val(parseInt(100 * (150 - Math.max(0, Math.min(150, (ad.pageY - ae.pos.top)))) / 150, 10)).end().eq(5).val(parseInt(100 * (Math.max(0, Math.min(150, (ad.pageX - ae.pos.left)))) / 150, 10)).get(0), [true]);
            b(document).bind("mouseup", ae, J);
            b(document).bind("mousemove", ae, y)
        },
        y = function(ad) {
            e.apply(ad.data.cal.data("colorpicker").fields.eq(6).val(parseInt(100 * (150 - Math.max(0, Math.min(150, (ad.pageY - ad.data.pos.top)))) / 150, 10)).end().eq(5).val(parseInt(100 * (Math.max(0, Math.min(150, (ad.pageX - ad.data.pos.left)))) / 150, 10)).get(0), [ad.data.preview]);
            return false
        },
        J = function(ad) {
            S(ad.data.cal.data("colorpicker").color, ad.data.cal.get(0));
            h(ad.data.cal.data("colorpicker").color, ad.data.cal.get(0));
            b(document).unbind("mouseup", J);
            b(document).unbind("mousemove", y);
            return false
        },
        D = function(ad) {
            b(this).addClass("saveButton-hover")
        },
        aa = function(ad) {
            b(this).removeClass("saveButton-hover")
        },
        x = function(ae) {
            var af = b(this).parent();
            var ad = af.data("colorpicker").color;
            af.data("colorpicker").origColor = ad;
            m(ad, af.get(0))
        },
        r = function(ad) {
            b(this).addClass("cancelButton-hover")
        },
        o = function(ad) {
            b(this).removeClass("cancelButton-hover")
        },
        M = function(ad) {
            var ah = b("#" + b(this).data("colorpickerId"));
            ah.data("colorpicker").onBeforeShow.apply(this, [ah.get(0)]);
            var ai = b(this).offset();
            var ag = I();
            var af = ai.top + this.offsetHeight;
            var ae = ai.left;
            if (af + 176 > ag.t + ag.h) {
                af -= this.offsetHeight + 176
            }
            if (ae + 356 > ag.l + ag.w) {
                ae -= 356
            }
            ah.css({
                left: ae + "px",
                top: af + "px"
            });
            if (ah.data("colorpicker").onShow.apply(this, [ah.get(0)]) != false) {
                ah.show()
            }
            b(document).bind("mousedown", {
                cal: ah
            },
            W);
            return false
        },
        W = function(ad) {
            if (!Q(ad.data.cal.get(0), ad.target, ad.data.cal.get(0))) {
                if (ad.data.cal.data("colorpicker").onHide.apply(this, [ad.data.cal.get(0)]) != false) {
                    ad.data.cal.hide()
                }
                b(document).unbind("mousedown", W)
            }
        },
        Q = function(af, ae, ad) {
            if (af == ae) {
                return true
            }
            if (af.contains) {
                return af.contains(ae)
            }
            if (af.compareDocumentPosition) {
                return !! (af.compareDocumentPosition(ae) & 16)
            }
            var ag = ae.parentNode;
            while (ag && ag != ad) {
                if (ag == af) {
                    return true
                }
                ag = ag.parentNode
            }
            return false
        },
        I = function() {
            var ad = document.compatMode == "CSS1Compat";
            return {
                l: window.pageXOffset || (ad ? document.documentElement.scrollLeft: document.body.scrollLeft),
                t: window.pageYOffset || (ad ? document.documentElement.scrollTop: document.body.scrollTop),
                w: window.innerWidth || (ad ? document.documentElement.clientWidth: document.body.clientWidth),
                h: window.innerHeight || (ad ? document.documentElement.clientHeight: document.body.clientHeight)
            }
        },
        g = function(ad) {
            return {
                h: Math.min(360, Math.max(0, ad.h)),
                s: Math.min(100, Math.max(0, ad.s)),
                b: Math.min(100, Math.max(0, ad.b))
            }
        },
        U = function(ad) {
            return {
                r: Math.min(255, Math.max(0, ad.r)),
                g: Math.min(255, Math.max(0, ad.g)),
                b: Math.min(255, Math.max(0, ad.b))
            }
        },
        H = function(af) {
            var ad = 6 - af.length;
            if (ad > 0) {
                var ag = [];
                for (var ae = ad; ae--;) {
                    ag.push("0")
                }
                ag.push(af);
                af = ag.join("")
            }
            return af
        },
        d = function(ad) {
            var ad = parseInt(((ad.indexOf("#") > -1) ? ad.substring(1) : ad), 16);
            return {
                r: ad >> 16,
                g: (ad & 65280) >> 8,
                b: (ad & 255)
            }
        },
        t = function(ad) {
            return n(d(ad))
        },
        n = function(af) {
            var ae = {
                h: 0,
                s: 0,
                b: 0
            };
            var ag = Math.min(af.r, af.g, af.b);
            var ad = Math.max(af.r, af.g, af.b);
            var ah = ad - ag;
            ae.b = ad;
            ae.s = ad != 0 ? 255 * ah / ad: 0;
            if (ae.s != 0) {
                if (af.r == ad) {
                    ae.h = (af.g - af.b) / ah
                } else {
                    if (af.g == ad) {
                        ae.h = 2 + (af.b - af.r) / ah
                    } else {
                        ae.h = 4 + (af.r - af.g) / ah
                    }
                }
            } else {
                ae.h = -1
            }
            ae.h *= 60;
            if (ae.h < 0) {
                ae.h += 360
            }
            ae.s *= 100 / 255;
            ae.b *= 100 / 255;
            return {
                h: parseFloat(ae.h, 2),
                s: ae.s,
                b: ae.b
            }
        },
        p = function(ae) {
            var af = {};
            var aj = Math.round(ae.h);
            var ai = Math.round(ae.s * 255 / 100);
            var ad = Math.round(ae.b * 255 / 100);
            if (ai == 0) {
                af.r = af.g = af.b = ad
            } else {
                var ak = ad;
                var ah = (255 - ai) * ad / 255;
                var ag = (ak - ah) * (aj % 60) / 60;
                if (aj == 360) {
                    aj = 0
                }
                if (aj < 60) {
                    af.r = ak;
                    af.b = ah;
                    af.g = ah + ag
                } else {
                    if (aj < 120) {
                        af.g = ak;
                        af.b = ah;
                        af.r = ak - ag
                    } else {
                        if (aj < 180) {
                            af.g = ak;
                            af.r = ah;
                            af.b = ah + ag
                        } else {
                            if (aj < 240) {
                                af.b = ak;
                                af.r = ah;
                                af.g = ak - ag
                            } else {
                                if (aj < 300) {
                                    af.b = ak;
                                    af.g = ah;
                                    af.r = ah + ag
                                } else {
                                    if (aj < 360) {
                                        af.r = ak;
                                        af.g = ah;
                                        af.b = ak - ag
                                    } else {
                                        af.r = 0;
                                        af.g = 0;
                                        af.b = 0
                                    }
                                }
                            }
                        }
                    }
                }
            }
            return {
                r: Math.round(af.r),
                g: Math.round(af.g),
                b: Math.round(af.b)
            }
        },
        L = function(ad) {
            var ae = [ad.r.toString(16), ad.g.toString(16), ad.b.toString(16)];
            b.each(ae,
            function(af, ag) {
                if (ag.length == 1) {
                    ae[af] = "0" + ag
                }
            });
            return ae.join("")
        },
        ab = function(ad) {
            return L(p(ad))
        },
        O = function() {
            var ae = b(this).parent();
            var ad = ae.data("colorpicker").origColor;
            ae.data("colorpicker").color = ad;
            S(ad, ae.get(0));
            h(ad, ae.get(0));
            C(ad, ae.get(0));
            s(ad, ae.get(0));
            P(ad, ae.get(0));
            N(ad, ae.get(0))
        };
        return {
            init: function(ad) {
                ad = b.extend({},
                K, ad || {});
                if (typeof ad.color == "string") {
                    ad.color = t(ad.color)
                } else {
                    if (ad.color.r != undefined && ad.color.g != undefined && ad.color.b != undefined) {
                        ad.color = n(ad.color)
                    } else {
                        if (ad.color.h != undefined && ad.color.s != undefined && ad.color.b != undefined) {
                            ad.color = g(ad.color)
                        } else {
                            return this
                        }
                    }
                }
                return this.each(function() {
                    if (!b(this).data("colorpickerId")) {
                        var ae = b.extend({},
                        ad);
                        ae.origColor = ad.color;
                        var ag = "colorpicker_" + parseInt(Math.random() * 1000);
                        b(this).data("colorpickerId", ag);
                        var af = b(Z).attr("id", ag);
                        if (ae.flat) {
                            af.appendTo(this).show()
                        } else {
                            af.appendTo(document.body)
                        }
                        ae.fields = af.find("input").bind("keyup", v).bind("change", e).bind("blur", w).bind("focus", T);
                        ae = b.extend({},
                        ae, {
                            el: this,
                            selector: af.find("div.colorpicker_color").bind("mousedown", F),
                            selectorIndic: af.find("div.colorpicker_color").find("div div"),
                            hue: af.find("div.colorpicker_hue div"),
                            newColor: af.find("div.colorpicker_new_color"),
                            currentColor: af.find("div.colorpicker_current_color")
                        });
                        af.find("div.colorpicker_hue").bind("mousedown", E);
                        af.find("i.colorpicker_hsbnum_add").bind("click", Y);
                        af.find("i.colorpicker_hsbnum_reduce").bind("click", G);
                        af.find("i.colorpicker_rgbnum_add").bind("click", u);
                        af.find("i.colorpicker_rgbnum_reduce").bind("click", f);
                        af.find(">div.colorpicker_current_color").bind("click", O);
                        af.data("colorpicker", ae);
                        af.find(".numeric").numeric({
                            negative: false
                        });
                        af.find("div.colorpicker_submit").bind("mouseenter", D).bind("mouseleave", aa).bind("click", x);
                        af.find("div.colorpicker_cancel").bind("mouseenter", r).bind("mouseleave", o);
                        S(ae.color, af.get(0));
                        C(ae.color, af.get(0));
                        h(ae.color, af.get(0));
                        P(ae.color, af.get(0));
                        s(ae.color, af.get(0));
                        m(ae.color, af.get(0));
                        N(ae.color, af.get(0));
                        if (ae.flat) {
                            af.css({
                                position: "relative",
                                display: "block"
                            })
                        } else {
                            b(this).bind(ae.eventName, M)
                        }
                    }
                })
            },
            showPicker: function() {
                return this.each(function() {
                    if (b(this).data("colorpickerId")) {
                        M.apply(this)
                    }
                })
            },
            hidePicker: function() {
                return this.each(function() {
                    if (b(this).data("colorpickerId")) {
                        b("#" + b(this).data("colorpickerId")).hide()
                    }
                })
            },
            setColor: function(ad) {
                if (typeof ad == "string") {
                    ad = t(ad)
                } else {
                    if (ad.r != undefined && ad.g != undefined && ad.b != undefined) {
                        ad = n(ad)
                    } else {
                        if (ad.h != undefined && ad.s != undefined && ad.b != undefined) {
                            ad = g(ad)
                        } else {
                            return this
                        }
                    }
                }
                return this.each(function() {
                    if (b(this).data("colorpickerId")) {
                        var ae = b("#" + b(this).data("colorpickerId"));
                        ae.data("colorpicker").color = ad;
                        ae.data("colorpicker").origColor = ad;
                        S(ad, ae.get(0));
                        C(ad, ae.get(0));
                        h(ad, ae.get(0));
                        P(ad, ae.get(0));
                        s(ad, ae.get(0));
                        m(ad, ae.get(0));
                        N(ad, ae.get(0))
                    }
                })
            }
        }
    } ();
    b.fn.extend({
        ColorPicker: a.init,
        ColorPickerHide: a.hidePicker,
        ColorPickerShow: a.showPicker,
        ColorPickerSetColor: a.setColor
    })
})(jQuery); (function(a) {
    a.fn.initSlider = function(b) {
        if (!this) {
            return
        }
        var d = {
            initStartIndex: 100,
            initStart: 0,
            endStart: 100,
            unit: "%",
            refreshFn: null,
            saveValueFn: null,
            styleChangeFn: null
        };
        a.extend(d, b);
        var h = '<div class="slider_outside"><div class="slider_stay"><div class="slider_move" style="position:absolute;"></div></div><div class="slider_value">100%</div></div>';
        if (a(this).find(".slider_outside").length === 0) {
            a(this).append(h)
        } else {
            if (f(d.refreshFn)) {
                d.refreshFn(d.initStartIndex)
            }
        }
        var e = parseInt(a(".slider_stay").width()) - parseInt(a(".slider_move").width()),
        g = false,
        c = e / (d.endStart - d.initStart);
        a(".slider_value").text(d.initStartIndex + d.unit);
        if (d.initStartIndex === d.initStart) {
            a(".slider_move").css("left", 0 + "px")
        } else {
            if (d.initStartIndex === d.endStart) {
                a(".slider_move").css("left", e + "px")
            } else {
                a(".slider_move").css("left", (d.initStartIndex - d.initStart) * c + "px")
            }
        }
        a(".slider_move").draggable({
            handler: ".slider_move",
            axis: "x",
            containment: "parent",
            stop: function() {},
            drag: function() {
                var n = parseInt(this.style.left);
                var m = Math.ceil(n / c) + d.initStart;
                if (m < d.initStart) {
                    m = d.initStart
                }
                if (m > d.endStart) {
                    m = d.endStart
                }
                a(".slider_value").text(m + d.unit);
                if (f(d.refreshFn)) {
                    d.refreshFn(m)
                }
                if (!g && f(d.styleChangeFn)) {
                    d.styleChangeFn();
                    g = true
                }
                if (f(d.saveValueFn)) {
                    d.saveValueFn(m)
                }
            }
        });
        function f(m) {
            return Object.prototype.toString.call(m) === "[object Function]"
        }
    }
})(jQuery); (function(a) {
    var c = [{
        first: "SimSun",
        second: "宋体"
    },
    {
        first: "PMingLiU",
        second: "新细明体"
    },
    {
        first: "FangSong_GB2312",
        second: "仿宋_GB2312"
    },
    {
        first: "微软雅黑",
        second: "微软雅黑"
    },
    {
        first: "隶书",
        second: "隶书"
    },
    {
        first: "幼圆",
        second: "幼圆"
    },
    {
        first: "STKaiti",
        second: "华文楷体"
    },
    {
        first: "方正舒体",
        second: "方正舒体"
    },
    {
        first: "华文彩云",
        second: "华文彩云"
    },
    {
        first: "华文行楷",
        second: "华文行楷"
    },
    {
        first: "华文宋体",
        second: "华文宋体"
    },
    {
        first: "Arial",
        second: "Arial"
    },
    {
        first: "Tahoma",
        second: "Tahoma"
    },
    {
        first: "impact",
        second: "impact"
    },
    {
        first: "Arial Serif",
        second: "Arial Serif"
    },
    {
        first: "Georgia",
        second: "Georgia"
    },
    {
        first: "Garamond",
        second: "Garamond"
    },
    {
        first: "Times New Roman",
        second: "Times New Roman"
    }];
    a.fn.fontFamilySelect = function(h) {
        var m = {
            type: 0,
            defaultValue: "SimSun",
            defaultValueIndex: 0,
            refreshFn: null,
            styleChangeFn: null,
            fontfamily: null
        };
        a.extend(m, h);
        m.fontfamily = m.fontfamily || c;
        var o = 0;
        var n = ['<div id="f_family_select', m.type, '" class="f_family_select">', '<div class="f_family_body"></div>', '<div class="f_family_button"></div>', "</div>"];
        n = n.join("");
        var g;
        if (a("#f_family_select" + m.type).length === 0) {
            a(this).append(n);
            n = a("#f_family_select" + m.type);
            g = ['<div id="f_family_menu', m.type, '" class="f_family_menu" style="display:none;">', '<div id="f_family_content" class="f_family_content">'];
            var f = "";
            a.each(m.fontfamily,
            function(q, p) {
                if (p.first === m.defaultValue) {
                    m.defaultValueIndex = q;
                    f = " f_selected"
                }
                g.push("<div class='f_family_option" + f + "' style='font-family:" + p.first + "' _value='" + p.first + "' title='" + p.second + "'>" + p.second + "</div>");
                f = ""
            });
            g.push("</div></div>");
            g = g.join("");
            if (a("body").find("#f_family_menu" + m.type).length === 0) {
                a("body").append(g)
            }
        } else {
            n = a("#f_family_select" + m.type);
            if (b(m.refreshFn)) {
                m.refreshFn(m.defaultValue)
            }
            n.find(".f_family_button").removeClass("f_b_selected");
            a("#f_family_menu" + m.type).hide();
            a("#f_family_menu" + m.type).find(".f_selected").removeClass("f_selected")
        }
        g = a("#f_family_menu" + m.type);
        f_family_button = n.find(".f_family_button");
        n.find(".f_family_body").html(m.fontfamily[m.defaultValueIndex].second);
        n.find(".f_family_body").attr("title", m.fontfamily[m.defaultValueIndex].second);
        f_family_button.mousemove(function() {
            a(this).addClass("f_b_hover")
        }).mouseleave(function() {
            a(this).removeClass("f_b_hover")
        });
        n.unbind("click").bind("click",
        function() {
            if (!g.attr("_isPos")) {
                var q = n.offset();
                g.offset({
                    top: q.top + 21,
                    left: q.left
                });
                g.attr("_isPos", 1)
            }
            var p = a(this).find(".f_family_button");
            if (p.hasClass("f_b_selected")) {
                g.hide();
                p.removeClass("f_b_selected")
            } else {
                g.show();
                p.addClass("f_b_selected")
            }
        });
        a(document).bind("click",
        function(q) {
            var p = a(q.target);
            if (p.closest(".f_family_body, .f_family_button").length == 0) {
                g.hide();
                n.find(".f_family_button").removeClass("f_b_selected")
            }
            q.stopPropagation()
        });
        var e = a(".ui-tabs").find(".ui-state-default a");
        if (e.length > 0) {
            e.on("click",
            function() {
                g.hide();
                n.find(".f_family_button").removeClass("f_b_selected");
                return
            })
        }
        var d = g.find(".f_family_content").children();
        a(d).mousemove(function() {
            a(this).addClass("f_hover")
        }).mouseleave(function() {
            a(this).removeClass("f_hover")
        }).click(function() {
            n.find(".f_family_body").html(a(this).html());
            n.find(".f_family_body").attr("title", a(this).html());
            g.find(".f_selected").removeClass("f_selected");
            a(this).addClass("f_selected");
            if (b(m.refreshFn)) {
                m.refreshFn(a(this).attr("_value"))
            }
            if (b(m.styleChangeFn)) {
                m.styleChangeFn()
            }
        })
    };
    a.fn.fontSzieSlider = function(g) {
        var n = {
            type: 0,
            initStartIndex: 12,
            initStart: 12,
            endStart: 60,
            space: 1,
            refreshFn: null,
            styleChangeFn: null
        };
        a.extend(n, g);
        var d = ['<div id="f_size_select' + n.type + '" class="f_size_select">', '<div class="f_size_body"></div>', '<div class="f_size_button"></div>', "</div>"];
        d = d.join("");
        if (a(this).find("#f_size_select" + n.type).length === 0) {
            a(this).append(d)
        } else {
            if (b(n.refreshFn)) {
                n.refreshFn(n.initStartIndex)
            }
            a("#f_size_menu" + n.type).hide();
            a("#f_size_select" + n.type).find(".f_size_button").removeClass("f_b_selected")
        }
        d = a("#f_size_select" + n.type);
        var e = ['<div id="f_size_menu', n.type, '" class="f_size_menu" style="display:none;" >', '<div class="f_slider_stay">', '<div class="f_slider_strip"></div>', '<div class="f_slider_move"></div>', "</div>", "</div>"];
        e = e.join("");
        if (a("body").find("#f_size_menu" + n.type).length === 0) {
            a("body").append(e)
        }
        e = a("#f_size_menu" + n.type);
        d.find(".f_size_body").html(n.initStartIndex + "px");
        d.find(".f_size_button").mousemove(function() {
            a(this).addClass("f_b_hover")
        }).mouseleave(function() {
            a(this).removeClass("f_b_hover")
        });
        d.unbind("click").bind("click",
        function() {
            if (!e.attr("_isPos")) {
                var q = d.offset();
                e.offset({
                    top: q.top + 21,
                    left: q.left
                });
                e.attr("_isPos", 1)
            }
            var p = d.find(".f_size_button");
            if (p.hasClass("f_b_selected")) {
                e.hide();
                p.removeClass("f_b_selected")
            } else {
                e.show();
                p.addClass("f_b_selected")
            }
        });
        a(document).bind("click",
        function(q) {
            var p = a(q.target);
            if (p.closest(".f_size_body, .f_size_button, #f_size_menu" + n.type).length == 0) {
                e.hide();
                d.find(".f_size_button").removeClass("f_b_selected")
            }
            q.stopPropagation()
        });
        var f = a(".ui-tabs").find(".ui-state-default a");
        if (f.length > 0) {
            f.on("click",
            function() {
                e.hide();
                d.find(".f_size_button").removeClass("f_b_selected");
                return
            })
        }
        var o = parseInt(e.find(".f_slider_stay").height()) - parseInt(e.find(".f_slider_move").height()),
        m = o / (n.endStart - n.initStart);
        var h = e.find(".f_slider_move");
        h.text(n.initStartIndex + "px");
        if (n.initStartIndex === n.initStart) {
            h.css("top", 0 + "px")
        } else {
            if (n.initStartIndex === n.endStart) {
                h.css("top", o + "px")
            } else {
                h.css("top", (n.initStartIndex - n.initStart) * m + "px")
            }
        }
        e.find(".f_slider_strip").click(function(r) {
            var p = (h.height() / 2);
            var q = Math.ceil((r.offsetY - p) / m) + n.initStart;
            var s = a(this).height();
            if (r.offsetY > s - p) {
                h.css("top", (s - p) + "px")
            } else {
                if (r.offsetY < p) {
                    h.css("top", "auto")
                } else {
                    h.css("top", (r.offsetY - p) + "px")
                }
            }
            if (q < n.initStart) {
                q = n.initStart
            }
            if (q > n.endStart) {
                q = n.endStart
            }
            if (q % n.space) {
                q += 1
            }
            h.text(q + "px");
            d.find(".f_size_body").html(q + "px");
            if (b(n.refreshFn)) {
                n.refreshFn(q)
            }
            if (b(n.styleChangeFn)) {
                n.styleChangeFn()
            }
        });
        h.draggable({
            handler: ".f_slider_move",
            axis: "y",
            containment: "parent",
            drag: function() {
                var p = parseInt(this.style.top);
                var q = Math.ceil(p / m) + n.initStart;
                if (q < n.initStart) {
                    q = n.initStart
                }
                if (q > n.endStart) {
                    q = n.endStart
                }
                if (q % n.space) {
                    return
                }
                a(this).text(q + "px");
                d.find(".f_size_body").html(q + "px");
                if (b(n.refreshFn)) {
                    n.refreshFn(q)
                }
                if (b(n.styleChangeFn)) {
                    n.styleChangeFn()
                }
            }
        })
    };
    a.fn.fontStyleEditor = function(f) {
        var h = {
            id: 0,
            toolbars: [{
                name: "fontfamily",
                defaultValue: "",
                refreshFn: null
            },
            {
                name: "fontsize",
                defaultValue: 12,
                refreshFn: null
            },
            {
                name: "bold",
                defaultValue: 0,
                refreshFn: null
            },
            {
                name: "italic",
                defaultValue: 0,
                refreshFn: null
            },
            {
                name: "underline",
                defaultValue: 0,
                refreshFn: null
            },
            {
                name: "fontcolor",
                defaultValue: "",
                refreshFn: null,
                removeCssFn: null
            }],
            styleChangeFn: null,
            fontfamily: null
        };
        a.extend(h, f);
        var e = '<div id="f_editor' + h.id + '" class="f_editor"></div>';
        if (a("#f_editor" + h.id).length === 0) {
            a(this).append(e)
        }
        e = a("#f_editor" + h.id);
        var d = function(o) {
            var p = {
                defaultValue: 0,
                refreshFn: null,
                styleChangeFn: null
            };
            a.extend(p, o);
            var q = "<div id='f_b_bold" + h.id + "' class='f_button f_b_bold " + (p.defaultValue ? "f_bold_select": "") + "'></div>";
            if (a("#f_b_bold" + h.id).length === 0) {
                e.append(q)
            } else {
                if (b(p.refreshFn)) {
                    p.refreshFn(p.defaultValue)
                }
                a("#f_b_bold" + h.id).removeClass("f_bold_select")
            }
            a("#f_b_bold" + h.id).mousemove(function() {
                a(this).addClass("f_bold_hover")
            }).mouseleave(function() {
                a(this).removeClass("f_bold_hover")
            }).unbind("click").bind("click",
            function() {
                if (a(this).hasClass("f_bold_select")) {
                    a(this).removeClass("f_bold_select");
                    p.defaultValue = 0
                } else {
                    a(this).addClass("f_bold_select");
                    p.defaultValue = 1
                }
                if (b(p.refreshFn)) {
                    p.refreshFn(p.defaultValue)
                }
                if (b(p.styleChangeFn)) {
                    p.styleChangeFn()
                }
            })
        };
        var n = function(p) {
            var q = {
                defaultValue: 0,
                refreshFn: null,
                styleChangeFn: null
            };
            a.extend(q, p);
            var o = "<div id='f_b_italic" + h.id + "' class='f_button f_b_italic " + (q.defaultValue ? "f_italic_select": "") + "'></div>";
            if (a("#f_b_italic" + h.id).length === 0) {
                e.append(o)
            } else {
                if (b(q.refreshFn)) {
                    q.refreshFn(q.defaultValue)
                }
                a("#f_b_italic" + h.id).removeClass("f_italic_select")
            }
            a("#f_b_italic" + h.id).mousemove(function() {
                a(this).addClass("f_italic_hover")
            }).mouseleave(function() {
                a(this).removeClass("f_italic_hover")
            }).unbind("click").bind("click",
            function() {
                if (a(this).hasClass("f_italic_select")) {
                    a(this).removeClass("f_italic_select");
                    q.defaultValue = 0
                } else {
                    a(this).addClass("f_italic_select");
                    q.defaultValue = 1
                }
                if (b(q.refreshFn)) {
                    q.refreshFn(q.defaultValue)
                }
                if (b(q.styleChangeFn)) {
                    q.styleChangeFn()
                }
            })
        };
        var m = function(q) {
            var o = {
                defaultValue: 0,
                refreshFn: null,
                styleChangeFn: null
            };
            a.extend(o, q);
            var p = "<div id='f_b_underline" + h.id + "' class='f_button f_b_underline " + (o.defaultValue ? "f_unline_select": "") + "'></div>";
            if (a("#f_b_underline" + h.id).length === 0) {
                e.append(p)
            } else {
                if (b(o.refreshFn)) {
                    o.refreshFn(o.defaultValue)
                }
                a("#f_b_underline" + h.id).removeClass("f_unline_select")
            }
            a("#f_b_underline" + h.id).mousemove(function() {
                a(this).addClass("f_unline_hover")
            }).mouseleave(function() {
                a(this).removeClass("f_unline_hover")
            }).unbind("click").bind("click",
            function() {
                if (a(this).hasClass("f_unline_select")) {
                    a(this).removeClass("f_unline_select");
                    o.defaultValue = 0
                } else {
                    a(this).addClass("f_unline_select");
                    o.defaultValue = 1
                }
                if (b(o.refreshFn)) {
                    o.refreshFn(o.defaultValue)
                }
                if (b(o.styleChangeFn)) {
                    o.styleChangeFn()
                }
            })
        };
        var g = function(q) {
            var o = {
                defaultValue: "",
                refreshFn: null,
                removeCssFn: null
            };
            a.extend(o, q);
            var p = ["<div id='f_color", h.id, "' class='f_button f_b_color'>", "<div id='f_b_color", h.id, "' class='f_color_edit'", o.defaultValue ? ' style="border:1px solid #aab3bb;"': "", "></div>", "</div>"];
            p = p.join("");
            if (a("#f_color" + h.id).length === 0) {
                e.append(p);
                a("#f_b_color" + h.id).faiColorPicker({
                    defaultcolor: o.defaultValue,
                    onchange: o.refreshFn,
                    showInTop: true
                })
            }
            if (b(o.removeCssFn)) {
                o.removeCssFn();
                if (b(o.refreshFn)) {
                    o.refreshFn(o.defaultValue)
                }
                a("#f_b_color" + h.id).removeAttr("style")
            }
            if (!o.defaultValue) {
                a("#f_color" + h.id).bind("mousemove",
                function() {
                    if (a(this).children().attr("style")) {
                        a(this).unbind("mousemove");
                        return
                    }
                    a(this).addClass("f_color_hover")
                }).bind("mouseleave",
                function() {
                    if (a(this).children().attr("style")) {
                        a(this).unbind("mouseleave");
                        return
                    }
                    a(this).removeClass("f_color_hover")
                })
            }
        };
        a.each(h.toolbars,
        function(o, p) {
            switch (p.name) {
            case "fontfamily":
                e.fontFamilySelect({
                    type:
                    h.id,
                    defaultValue: p.defaultValue,
                    defaultValueIndex: 3,
                    refreshFn: p.refreshFn,
                    styleChangeFn: h.styleChangeFn,
                    fontfamily: h.fontfamily
                });
                break;
            case "fontsize":
                e.fontSzieSlider({
                    type:
                    h.id,
                    initStartIndex: p.defaultValue,
                    space: 2,
                    refreshFn: p.refreshFn,
                    styleChangeFn: h.styleChangeFn
                });
                break;
            case "bold":
                d({
                    defaultValue:
                    p.defaultValue,
                    refreshFn: p.refreshFn,
                    styleChangeFn: h.styleChangeFn
                });
                break;
            case "italic":
                n({
                    defaultValue:
                    p.defaultValue,
                    refreshFn: p.refreshFn,
                    styleChangeFn: h.styleChangeFn
                });
                break;
            case "underline":
                m({
                    defaultValue:
                    p.defaultValue,
                    refreshFn: p.refreshFn,
                    styleChangeFn: h.styleChangeFn
                });
                break;
            case "fontcolor":
                g({
                    defaultValue:
                    p.defaultValue,
                    refreshFn: p.refreshFn,
                    removeCssFn: p.removeCssFn
                });
                break
            }
        })
    };
    function b(d) {
        return Object.prototype.toString.call(d) === "[object Function]"
    }
})(jQuery); (function(a, b) {
    a.widget("ui.combobox", {
        _create: function() {
            var f = this;
            var d = this.element;
            var h = d.width();
            var e = a("<input>").appendTo(d).autocomplete({
                source: f.options.source,
                delay: 0,
                minLength: 0,
                open: function(s, t) {
                    if (f.options.maxlength) {
                        a(this).autocomplete("widget").width(f.options.maxlength)
                    } else {
                        var r = a(this).autocomplete("widget").width();
                        var p = a(this).outerWidth() - 6;
                        if (e.width() != (h - Fai.getCssInt(e, "border-left-width"))) {
                            p = a(this).outerWidth();
                            if (!f.options.readonly) {
                                p = a(this).outerWidth() - 6
                            }
                        }
                        a(this).autocomplete("widget").width(p)
                    }
                    if (f.options.maxHeight) {
                        a(this).autocomplete("widget").css("max-height", f.options.maxHeight)
                    }
                    var q = a(this).autocomplete("widget").find("li");
                    if (q.length == 1 && a(this).attr("readonly") == false) {
                        var o = a(this).val();
                        var u = false;
                        a(q).each(function(v, w) {
                            var x = a.trim(a(w).text());
                            if (o == x) {
                                u = true
                            }
                        });
                        if (u) {
                            a(this).autocomplete("close")
                        }
                    }
                },
                select: function(o, p) {
                    a(f).data("key", p.item.key);
                    if (f.options.select) {
                        f.options.select(p.item)
                    }
                    if (f.options.change) {
                        f.options.change(p.item.label)
                    }
                    if (f.options.finish) {
                        setTimeout(function() {
                            f.options.finish(p.item)
                        },
                        0)
                    }
                }
            });
            e.change(function() {
                if (f.options.change) {
                    f.options.change(a(this).val())
                }
            });
            e.keyup(function(o) {
                if (f.options.change) {
                    f.options.change(a(this).val())
                }
                if (f.options.keyup) {
                    f.options.keyup(a(this).val())
                }
            });
            if (f.options.readonly) {
                e.click(function(o) {
                    if (e.autocomplete("widget").is(":visible")) {
                        e.autocomplete("close");
                        return false
                    }
                    e.autocomplete("search", "");
                    return false
                })
            }
            if (f.options.id) {
                e.attr("id", f.options.id)
            }
            if (f.options.readonly) {
                e.attr("readonly", "readonly")
            }
            e.width(h - Fai.getCssInt(e, "border-left-width"));
            d.width(h + Fai.getCssInt(e, "border-left-width") + Fai.getCssInt(e, "border-right-width"));
            if (f.options.name) {
                e.attr("name", f.options.name)
            } else {
                e.attr("name", f.options.id)
            }
            if (typeof f.options.initVal != "undefined") {
                e.val(f.options.initVal)
            }
            if (typeof f.options.initKey != "undefined") {
                a(f).data("key", f.options.initKey)
            } else {
                a(f).data("key", "")
            }
            var g = a("<div>&nbsp;</div>").attr("tabIndex", -1).css("outline", "none").insertAfter(e).addClass("autoCompleteButton").hover(function() {
                a(this).addClass("autoCompleteButtonHover")
            },
            function() {
                a(this).removeClass("autoCompleteButtonHover");
                a(this).removeClass("autoCompleteButtonDown")
            }).mouseup(function() {}).mousedown(function() {
                a(this).removeClass("autoCompleteButtonHover");
                a(this).addClass("autoCompleteButtonDown")
            }).click(function() {
                if (e.autocomplete("widget").is(":visible")) {
                    e.autocomplete("close");
                    return false
                }
                e.autocomplete("search", "");
                e.focus();
                return false
            });
            var c = e.outerHeight();
            d.css("position", "relative");
            d.css("height", c);
            var n = h - g.width() - (f.options.readonly ? 0 : 1);
            var m = e.position().top + (c - g.height()) / 2;
            g.css("position", "absolute");
            g.css("left", n + "px");
            g.css("top", m + "px");
            if (!f.options.readonly) {
                e.width(h - Fai.getCssInt(e, "border-left-width") - 20);
                e.css("padding-right", 20 + "px");
                g.css("background-color", "#ffffff").css("*width", 17 + "px")
            }
            if (f.options.readonly) {
                g.show()
            } else {
                g.hide();
                e.focus(function() {
                    g.show()
                })
            }
        },
        addSource: function(e) {
            var c = this.element.find("input");
            var f = c.autocomplete("option", "source");
            var d = false;
            a.each(f,
            function(g, h) {
                if (h.key == e.key) {
                    d = true;
                    f.splice(g, 1, e)
                }
            });
            if (!d) {
                f.push(e)
            }
            c.autocomplete("option", "source", f)
        },
        setSource: function(d) {
            var c = this.element.find("input");
            c.autocomplete("option", "source", d)
        },
        getSource: function() {
            var c = this.element.find("input");
            return c.autocomplete("option", "source")
        },
        setInitVal: function(d, e) {
            var c = this.element.find("input");
            c.val(d);
            a(this).data("key", e)
        },
        setInitKey: function(f) {
            var d = this.element.find("input");
            var e = d.autocomplete("option", "source");
            var c = "";
            a.each(e,
            function(g, h) {
                if (h.key == f) {
                    c = h.label
                }
            });
            d.val(c);
            a(this).data("key", f)
        },
        getVal: function() {
            var c = this.element.find("input");
            return c.val()
        },
        getKey: function() {
            return a(this).data("key")
        },
        setKey: function(c) {
            a(this).data("key", c)
        }
    })
} (jQuery)); (function(e) {
    var a = [],
    d = /^url\(["']?([^"'\)]*)["']?\);?$/i,
    c = /\.png$/i,
    b = e.browser.msie && e.browser.version == 6;
    function f() {
        e.each(a,
        function() {
            this.refresh(true)
        })
    }
    e.Poshytip = function(h, g) {
        this.$elm = e(h);
        this.opts = e.extend({},
        e.fn.poshytip.defaults, g);
        this.$tip = e(['<div id="', this.opts.id, '" class="', this.opts.className, '" ', this.opts.cusStyle != "" ? "style='" + this.opts.cusStyle + "'": "", ">", '<div class="tip-inner tip-bg-image"></div>', '<div class="tip-arrow tip-arrow-top tip-arrow-right tip-arrow-bottom tip-arrow-left"></div>', "</div>"].join(""));
        this.$arrow = this.$tip.find("div.tip-arrow");
        this.$inner = this.$tip.find("div.tip-inner");
        this.disabled = false;
        this.init()
    };
    e.Poshytip.prototype = {
        init: function() {
            a.push(this);
            this.$elm.data("title.poshytip", this.$elm.attr("title"));
            this.$elm.data("poshytip", this);
            switch (this.opts.showOn) {
            case "hover":
                this.$elm.bind({
                    "mouseenter.poshytip":
                    e.proxy(this.mouseenter, this),
                    "mouseleave.poshytip": e.proxy(this.mouseleave, this)
                });
                if (this.opts.alignTo == "cursor") {
                    this.$elm.bind("mousemove.poshytip", e.proxy(this.mousemove, this))
                }
                if (this.opts.allowTipHover) {
                    this.$tip.hover(e.proxy(this.clearTimeouts, this), e.proxy(this.hide, this))
                }
                break;
            case "focus":
                this.$elm.bind({
                    "focus.poshytip":
                    e.proxy(this.show, this),
                    "blur.poshytip": e.proxy(this.hide, this)
                });
                break
            }
            if (this.opts.autoLocation) {
                var h = this;
                var g = h.$elm.offset().top;
                var m = h.$elm.offset().left;
                this.interval = setInterval(function() {
                    var n = h.$elm.offset().top;
                    var o = h.$elm.offset().left;
                    if (g != n || m != o) {
                        h.update();
                        h.display();
                        g = n;
                        m = o
                    }
                },
                300)
            }
        },
        mouseenter: function(g) {
            if (this.disabled) {
                return true
            }
            this.clearTimeouts();
            this.$elm.attr("title", "");
            this.showTimeout = setTimeout(e.proxy(this.show, this), this.opts.showTimeout)
        },
        mouseleave: function() {
            if (this.disabled) {
                return true
            }
            this.clearTimeouts();
            this.$elm.attr("title", this.$elm.data("title.poshytip"));
            this.hideTimeout = setTimeout(e.proxy(this.hide, this), this.opts.hideTimeout)
        },
        mousemove: function(g) {
            if (this.disabled) {
                return true
            }
            this.eventX = g.pageX;
            this.eventY = g.pageY;
            if (this.opts.followCursor && this.$tip.data("active")) {
                this.calcPos();
                this.$tip.css({
                    left: this.pos.l,
                    top: this.pos.t
                });
                if (this.pos.arrow) {
                    this.$arrow[0].className = "tip-arrow tip-arrow-" + this.pos.arrow
                }
            }
        },
        show: function() {
            if (this.disabled || this.$tip.data("active")) {
                return
            }
            this.reset();
            this.update();
            this.display()
        },
        hide: function() {
            if (this.disabled || !this.$tip.data("active")) {
                return
            }
            this.display(true)
        },
        reset: function() {
            this.$tip.queue([]).detach().css("visibility", "hidden").data("active", false);
            this.$inner.find("*").poshytip("hide");
            if (this.opts.fade) {
                this.$tip.css("opacity", this.opacity)
            }
            this.$arrow[0].className = "tip-arrow tip-arrow-top tip-arrow-right tip-arrow-bottom tip-arrow-left"
        },
        update: function(m) {
            if (this.disabled) {
                return
            }
            var h = m !== undefined;
            if (h) {
                if (!this.$tip.data("active")) {
                    return
                }
            } else {
                m = this.opts.content
            }
            this.$inner.contents().detach();
            var g = this;
            this.$inner.append(typeof m == "function" ? m.call(this.$elm[0],
            function(n) {
                g.update(n)
            }) : m == "[title]" ? this.$elm.data("title.poshytip") : m);
            this.refresh(h)
        },
        refresh: function(h) {
            if (this.disabled) {
                return
            }
            if (h) {
                if (!this.$tip.data("active")) {
                    return
                }
                var q = {
                    left: this.$tip.css("left"),
                    top: this.$tip.css("top")
                }
            }
            this.$tip.css({
                left: 0,
                top: 0
            }).appendTo(this.opts.appendToId ? e(this.opts.appendToId) : document.body);
            if (this.opacity === undefined) {
                this.opacity = this.$tip.css("opacity")
            }
            var r = this.$tip.css("background-image").match(d),
            s = this.$arrow.css("background-image").match(d);
            if (r) {
                var m = c.test(r[1]);
                if (b && m) {
                    this.$tip.css("background-image", "none");
                    this.$inner.css({
                        margin: 0,
                        border: 0,
                        padding: 0
                    });
                    r = m = false
                } else {
                    this.$tip.prepend('<table border="0" cellpadding="0" cellspacing="0"><tr><td class="tip-top tip-bg-image" colspan="2"><span></span></td><td class="tip-right tip-bg-image" rowspan="2"><span></span></td></tr><tr><td class="tip-left tip-bg-image" rowspan="2"><span></span></td><td></td></tr><tr><td class="tip-bottom tip-bg-image" colspan="2"><span></span></td></tr></table>').css({
                        border: 0,
                        padding: 0,
                        "background-image": "none",
                        "background-color": "transparent"
                    }).find(".tip-bg-image").css("background-image", 'url("' + r[1] + '")').end().find("td").eq(3).append(this.$inner)
                }
                if (m && !e.support.opacity) {
                    this.opts.fade = false
                }
            }
            if (s && !e.support.opacity) {
                if (b && c.test(s[1])) {
                    s = false;
                    this.$arrow.css("background-image", "none")
                }
                this.opts.fade = false
            }
            var u = this.$tip.find("table");
            if (b) {
                this.$tip[0].style.width = "";
                u.width("auto").find("td").eq(3).width("auto");
                var t = this.$tip.width(),
                n = parseInt(this.$tip.css("min-width")),
                g = parseInt(this.$tip.css("max-width"));
                if (!isNaN(n) && t < n) {
                    t = n
                } else {
                    if (!isNaN(g) && t > g) {
                        t = g
                    }
                }
                this.$tip.add(u).width(t).eq(0).find("td").eq(3).width("100%")
            } else {
                if (u[0]) {
                    u.width("auto").find("td").eq(3).width("auto").end().end().width(this.$tip.width()).find("td").eq(3).width("100%")
                }
            }
            this.tipOuterW = this.$tip.outerWidth();
            this.tipOuterH = this.$tip.outerHeight();
            this.calcPos();
            if (s && this.pos.arrow) {
                this.$arrow[0].className = "tip-arrow tip-arrow-" + this.pos.arrow;
                this.$arrow.css("visibility", "inherit")
            }
            if (h) {
                this.$tip.css({
                    left: this.pos.l,
                    top: this.pos.t
                })
            } else {
                this.$tip.css({
                    left: this.pos.l,
                    top: this.pos.t
                })
            }
            if (this.pos.arrow == "top") {
                var o = Math.round((this.$arrow.offset().left + this.$arrow.width()) - (this.$arrow.width() / 2));
                var p = Math.round((this.$elm.offset().left + this.$elm.width()) - (this.$elm.width() / 2));
                if (o != p) {
                    this.$arrow.offset({
                        top: this.$tip.offset().top - (this.$arrow.height() - 1),
                        left: p
                    })
                }
            } else {
                if (this.pos.arrow == "bottom") {
                    var o = Math.round((this.$arrow.offset().left + this.$arrow.width()) - (this.$arrow.width() / 2));
                    var p = Math.round((this.$elm.offset().left + this.$elm.width()) - (this.$elm.width() / 2));
                    if (o != p) {
                        this.$arrow.offset({
                            top: this.$tip.offset().top + this.$tip.height() + this.$arrow.height() + 5 + 1,
                            left: p
                        })
                    }
                }
            }
        },
        display: function(o) {
            var m = this.$tip.data("active");
            if (m && !o || !m && o) {
                return
            }
            this.$tip.stop();
            if ((this.opts.slide && this.pos.arrow || this.opts.fade) && (o && this.opts.hideAniDuration || !o && this.opts.showAniDuration)) {
                var p = {},
                q = {};
                if (this.opts.slide && this.pos.arrow) {
                    var g, n;
                    if (this.pos.arrow == "bottom" || this.pos.arrow == "top") {
                        g = "top";
                        n = "bottom";
                        if (this.pos.arrow == "top") {
                            var s = Math.round((this.$arrow.offset().left + this.$arrow.width()) - (this.$arrow.width() / 2));
                            var r = Math.round((this.$elm.offset().left + this.$elm.width()) - (this.$elm.width() / 2));
                            if (s != r) {
                                this.$arrow.offset({
                                    top: this.$tip.offset().top - (this.$arrow.height() - 1),
                                    left: r
                                })
                            }
                        } else {
                            if (this.pos.arrow == "bottom") {
                                var s = Math.round((this.$arrow.offset().left + this.$arrow.width()) - (this.$arrow.width() / 2));
                                var r = Math.round((this.$elm.offset().left + this.$elm.width()) - (this.$elm.width() / 2));
                                if (s != r) {
                                    this.$arrow.offset({
                                        top: this.$tip.offset().top + this.$tip.height() + this.$arrow.height() + 5 + 1,
                                        left: r
                                    })
                                }
                            }
                        }
                    } else {
                        g = "left";
                        n = "right"
                    }
                    var h = parseInt(this.$tip.css(g));
                    p[g] = h + (o ? 0 : this.opts.slideOffset * (this.pos.arrow == n ? -1 : 1));
                    q[g] = h + (o ? this.opts.slideOffset * (this.pos.arrow == n ? 1 : -1) : 0)
                }
                if (this.opts.fade) {
                    p.opacity = o ? this.$tip.css("opacity") : 0;
                    q.opacity = o ? 0 : this.opacity
                }
                this.$tip.css(p).animate(q, this.opts[o ? "hideAniDuration": "showAniDuration"])
            }
            o ? this.$tip.queue(e.proxy(this.reset, this)) : this.$tip.css("visibility", "inherit");
            this.$tip.data("active", !m)
        },
        disable: function() {
            this.reset();
            this.disabled = true
        },
        enable: function() {
            this.disabled = false
        },
        destroy: function() {
            this.reset();
            this.$tip.remove();
            this.$elm.unbind("poshytip").removeData("title.poshytip").removeData("poshytip");
            a.splice(e.inArray(this, a), 1);
            if (this.opts.autoLocation) {
                clearInterval(this.interval)
            }
        },
        clearTimeouts: function() {
            if (this.showTimeout) {
                clearTimeout(this.showTimeout);
                this.showTimeout = 0
            }
            if (this.hideTimeout) {
                clearTimeout(this.hideTimeout);
                this.hideTimeout = 0
            }
        },
        calcPos: function() {
            var r = {
                l: 0,
                t: 0,
                arrow: ""
            },
            h = e(window),
            o = {
                l: h.scrollLeft(),
                t: h.scrollTop(),
                w: h.width(),
                h: h.height()
            },
            t,
            n,
            q,
            m,
            u,
            g;
            if (this.opts.alignTo == "cursor") {
                t = n = q = this.eventX;
                m = u = g = this.eventY
            } else {
                var s = this.$elm.offset(),
                p = {
                    l: s.left,
                    t: this.opts.appendToId ? s.top - e(this.opts.appendToId).offset().top: s.top,
                    w: this.$elm.outerWidth(),
                    h: this.$elm.outerHeight()
                };
                t = p.l + (this.opts.alignX != "inner-right" ? 0 : p.w);
                n = t + Math.floor(p.w / 2);
                q = t + (this.opts.alignX != "inner-left" ? p.w: 0);
                m = p.t + (this.opts.alignY != "inner-bottom" ? 0 : p.h);
                u = m + Math.floor(p.h / 2);
                g = m + (this.opts.alignY != "inner-top" ? p.h: 0)
            }
            switch (this.opts.alignX) {
            case "right":
            case "inner-left":
                r.l = q + this.opts.offsetX;
                if (r.l + this.tipOuterW > o.l + o.w) {
                    r.l = o.l + o.w - this.tipOuterW
                }
                if (this.opts.alignX == "right" || this.opts.alignY == "center") {
                    r.arrow = "left"
                }
                break;
            case "center":
                r.l = n - Math.floor(this.tipOuterW / 2);
                if (r.l + this.tipOuterW > o.l + o.w) {
                    r.l = o.l + o.w - this.tipOuterW
                } else {
                    if (r.l < o.l) {
                        r.l = o.l
                    }
                }
                break;
            default:
                r.l = t - this.tipOuterW - this.opts.offsetX;
                if (r.l < o.l) {
                    r.l = o.l
                }
                if (this.opts.alignX == "left" || this.opts.alignY == "center") {
                    r.arrow = "right"
                }
            }
            switch (this.opts.alignY) {
            case "bottom":
            case "inner-top":
                r.t = g + this.opts.offsetY;
                if (!r.arrow || this.opts.alignTo == "cursor") {
                    r.arrow = "top"
                }
                if (r.t + this.tipOuterH > o.t + o.h) {
                    r.t = m - this.tipOuterH - this.opts.offsetY;
                    if (r.arrow == "top") {
                        r.arrow = "bottom"
                    }
                }
                break;
            case "center":
                r.t = u - Math.floor(this.tipOuterH / 2);
                if (r.t + this.tipOuterH > o.t + o.h) {
                    r.t = o.t + o.h - this.tipOuterH
                } else {
                    if (r.t < o.t) {
                        r.t = o.t
                    }
                }
                break;
            default:
                r.t = m - this.tipOuterH - this.opts.offsetY;
                if (!r.arrow || this.opts.alignTo == "cursor") {
                    r.arrow = "bottom"
                }
                if (r.t < o.t) {
                    r.t = g + this.opts.offsetY;
                    if (r.arrow == "bottom") {
                        r.arrow = "top"
                    }
                }
            }
            this.pos = r
        }
    };
    e.fn.poshytip = function(g) {
        if (typeof g == "string") {
            return this.each(function() {
                var m = e(this).data("poshytip");
                if (m && m[g]) {
                    m[g]()
                }
            })
        }
        var h = e.extend({},
        e.fn.poshytip.defaults, g);
        if (!e("#poshytip-css-" + h.className)[0]) {
            e(['<style id="poshytip-css-', h.className, '" type="text/css">', "div.", h.className, "{visibility:hidden;position:absolute;top:0;left:0;}", "div.", h.className, " table, div.", h.className, " td{margin:0;font-family:inherit;font-size:inherit;font-weight:inherit;font-style:inherit;font-variant:inherit;}", "div.", h.className, " td.tip-bg-image span{display:block;font:1px/1px sans-serif;height:", h.bgImageFrameSize, "px;width:", h.bgImageFrameSize, "px;overflow:hidden;}", "div.", h.className, " td.tip-right{background-position:100% 0;}", "div.", h.className, " td.tip-bottom{background-position:100% 100%;}", "div.", h.className, " td.tip-left{background-position:0 100%;}", "div.", h.className, " div.tip-inner{background-position:-", h.bgImageFrameSize, "px -", h.bgImageFrameSize, "px;}", "div.", h.className, " div.tip-arrow{visibility:hidden;position:absolute;overflow:hidden;font:1px/1px sans-serif;}", "</style>"].join("")).appendTo("head")
        }
        return this.each(function() {
            new e.Poshytip(this, h)
        })
    };
    e.fn.poshytip.defaults = {
        content: "[title]",
        className: "tip-yellow",
        cusStyle: "",
        bgImageFrameSize: 10,
        showTimeout: 500,
        hideTimeout: 100,
        showOn: "hover",
        alignTo: "cursor",
        alignX: "right",
        alignY: "top",
        offsetX: -22,
        offsetY: 18,
        allowTipHover: true,
        followCursor: false,
        fade: true,
        slide: true,
        slideOffset: 8,
        showAniDuration: 300,
        hideAniDuration: 300
    }
})(jQuery); (function($) {
    $.ui.timepicker = $.ui.timepicker || {};
    if ($.ui.timepicker.version) {
        return
    }
    $.extend($.ui, {
        timepicker: {
            version: "1.0.5"
        }
    });
    function Timepicker() {
        this.regional = [];
        this.regional[""] = {
            currentText: "Now",
            closeText: "Done",
            ampm: false,
            amNames: ["AM", "A"],
            pmNames: ["PM", "P"],
            timeFormat: "hh:mm tt",
            timeSuffix: "",
            timeOnlyTitle: "Choose Time",
            timeText: "Time",
            hourText: "Hour",
            minuteText: "Minute",
            secondText: "Second",
            millisecText: "Millisecond",
            timezoneText: "Time Zone",
            isRTL: false
        };
        this._defaults = {
            showButtonPanel: true,
            timeOnly: false,
            showHour: true,
            showMinute: true,
            showSecond: false,
            showMillisec: false,
            showTimezone: false,
            showTime: true,
            stepHour: 1,
            stepMinute: 1,
            stepSecond: 1,
            stepMillisec: 1,
            hour: 0,
            minute: 0,
            second: 0,
            millisec: 0,
            timezone: null,
            useLocalTimezone: false,
            defaultTimezone: "+0000",
            hourMin: 0,
            minuteMin: 0,
            secondMin: 0,
            millisecMin: 0,
            hourMax: 23,
            minuteMax: 59,
            secondMax: 59,
            millisecMax: 999,
            minDateTime: null,
            maxDateTime: null,
            onSelect: null,
            hourGrid: 0,
            minuteGrid: 0,
            secondGrid: 0,
            millisecGrid: 0,
            alwaysSetTime: true,
            separator: " ",
            altFieldTimeOnly: true,
            altSeparator: null,
            altTimeSuffix: null,
            showTimepicker: true,
            timezoneIso8601: false,
            timezoneList: null,
            addSliderAccess: false,
            sliderAccessArgs: null,
            controlType: "slider",
            defaultValue: null
        };
        $.extend(this._defaults, this.regional[""])
    }
    $.extend(Timepicker.prototype, {
        $input: null,
        $altInput: null,
        $timeObj: null,
        inst: null,
        hour_slider: null,
        minute_slider: null,
        second_slider: null,
        millisec_slider: null,
        timezone_select: null,
        hour: 0,
        minute: 0,
        second: 0,
        millisec: 0,
        timezone: null,
        defaultTimezone: "+0000",
        hourMinOriginal: null,
        minuteMinOriginal: null,
        secondMinOriginal: null,
        millisecMinOriginal: null,
        hourMaxOriginal: null,
        minuteMaxOriginal: null,
        secondMaxOriginal: null,
        millisecMaxOriginal: null,
        ampm: "",
        formattedDate: "",
        formattedTime: "",
        formattedDateTime: "",
        timezoneList: null,
        units: ["hour", "minute", "second", "millisec"],
        control: null,
        setDefaults: function(settings) {
            extendRemove(this._defaults, settings || {});
            return this
        },
        _newInst: function($input, o) {
            var tp_inst = new Timepicker(),
            inlineSettings = {},
            fns = {},
            overrides,
            i;
            for (var attrName in this._defaults) {
                if (this._defaults.hasOwnProperty(attrName)) {
                    var attrValue = $input.attr("time:" + attrName);
                    if (attrValue) {
                        try {
                            inlineSettings[attrName] = eval(attrValue)
                        } catch(err) {
                            inlineSettings[attrName] = attrValue
                        }
                    }
                }
            }
            overrides = {
                beforeShow: function(input, dp_inst) {
                    if ($.isFunction(tp_inst._defaults.evnts.beforeShow)) {
                        return tp_inst._defaults.evnts.beforeShow.call($input[0], input, dp_inst, tp_inst)
                    }
                },
                onChangeMonthYear: function(year, month, dp_inst) {
                    tp_inst._updateDateTime(dp_inst);
                    if ($.isFunction(tp_inst._defaults.evnts.onChangeMonthYear)) {
                        tp_inst._defaults.evnts.onChangeMonthYear.call($input[0], year, month, dp_inst, tp_inst)
                    }
                },
                onClose: function(dateText, dp_inst) {
                    if (tp_inst.timeDefined === true && $input.val() !== "") {
                        tp_inst._updateDateTime(dp_inst)
                    }
                    if ($.isFunction(tp_inst._defaults.evnts.onClose)) {
                        tp_inst._defaults.evnts.onClose.call($input[0], dateText, dp_inst, tp_inst)
                    }
                }
            };
            for (i in overrides) {
                if (overrides.hasOwnProperty(i)) {
                    fns[i] = o[i] || null
                }
            }
            tp_inst._defaults = $.extend({},
            this._defaults, inlineSettings, o, overrides, {
                evnts: fns,
                timepicker: tp_inst
            });
            tp_inst.amNames = $.map(tp_inst._defaults.amNames,
            function(val) {
                return val.toUpperCase()
            });
            tp_inst.pmNames = $.map(tp_inst._defaults.pmNames,
            function(val) {
                return val.toUpperCase()
            });
            if (typeof(tp_inst._defaults.controlType) === "string") {
                if (tp_inst._defaults.controlType == "slider" && $.fn.slider === undefined) {
                    tp_inst._defaults.controlType = "select"
                }
                tp_inst.control = tp_inst._controls[tp_inst._defaults.controlType]
            } else {
                tp_inst.control = tp_inst._defaults.controlType
            }
            if (tp_inst._defaults.timezoneList === null) {
                var timezoneList = ["-1200", "-1100", "-1000", "-0930", "-0900", "-0800", "-0700", "-0600", "-0500", "-0430", "-0400", "-0330", "-0300", "-0200", "-0100", "+0000", "+0100", "+0200", "+0300", "+0330", "+0400", "+0430", "+0500", "+0530", "+0545", "+0600", "+0630", "+0700", "+0800", "+0845", "+0900", "+0930", "+1000", "+1030", "+1100", "+1130", "+1200", "+1245", "+1300", "+1400"];
                if (tp_inst._defaults.timezoneIso8601) {
                    timezoneList = $.map(timezoneList,
                    function(val) {
                        return val == "+0000" ? "Z": (val.substring(0, 3) + ":" + val.substring(3))
                    })
                }
                tp_inst._defaults.timezoneList = timezoneList
            }
            tp_inst.timezone = tp_inst._defaults.timezone;
            tp_inst.hour = tp_inst._defaults.hour;
            tp_inst.minute = tp_inst._defaults.minute;
            tp_inst.second = tp_inst._defaults.second;
            tp_inst.millisec = tp_inst._defaults.millisec;
            tp_inst.ampm = "";
            tp_inst.$input = $input;
            if (o.altField) {
                tp_inst.$altInput = $(o.altField).css({
                    cursor: "pointer"
                }).focus(function() {
                    $input.trigger("focus")
                })
            }
            if (tp_inst._defaults.minDate === 0 || tp_inst._defaults.minDateTime === 0) {
                tp_inst._defaults.minDate = new Date()
            }
            if (tp_inst._defaults.maxDate === 0 || tp_inst._defaults.maxDateTime === 0) {
                tp_inst._defaults.maxDate = new Date()
            }
            if (tp_inst._defaults.minDate !== undefined && tp_inst._defaults.minDate instanceof Date) {
                tp_inst._defaults.minDateTime = new Date(tp_inst._defaults.minDate.getTime())
            }
            if (tp_inst._defaults.minDateTime !== undefined && tp_inst._defaults.minDateTime instanceof Date) {
                tp_inst._defaults.minDate = new Date(tp_inst._defaults.minDateTime.getTime())
            }
            if (tp_inst._defaults.maxDate !== undefined && tp_inst._defaults.maxDate instanceof Date) {
                tp_inst._defaults.maxDateTime = new Date(tp_inst._defaults.maxDate.getTime())
            }
            if (tp_inst._defaults.maxDateTime !== undefined && tp_inst._defaults.maxDateTime instanceof Date) {
                tp_inst._defaults.maxDate = new Date(tp_inst._defaults.maxDateTime.getTime())
            }
            tp_inst.$input.bind("focus",
            function() {
                tp_inst._onFocus()
            });
            return tp_inst
        },
        _addTimePicker: function(dp_inst) {
            var currDT = (this.$altInput && this._defaults.altFieldTimeOnly) ? this.$input.val() + " " + this.$altInput.val() : this.$input.val();
            this.timeDefined = this._parseTime(currDT);
            this._limitMinMaxDateTime(dp_inst, false);
            this._injectTimePicker()
        },
        _parseTime: function(timeString, withDate) {
            if (!this.inst) {
                this.inst = $.datepicker._getInst(this.$input[0])
            }
            if (withDate || !this._defaults.timeOnly) {
                var dp_dateFormat = $.datepicker._get(this.inst, "dateFormat");
                try {
                    var parseRes = parseDateTimeInternal(dp_dateFormat, this._defaults.timeFormat, timeString, $.datepicker._getFormatConfig(this.inst), this._defaults);
                    if (!parseRes.timeObj) {
                        return false
                    }
                    $.extend(this, parseRes.timeObj)
                } catch(err) {
                    return false
                }
                return true
            } else {
                var timeObj = $.datepicker.parseTime(this._defaults.timeFormat, timeString, this._defaults);
                if (!timeObj) {
                    return false
                }
                $.extend(this, timeObj);
                return true
            }
        },
        _injectTimePicker: function() {
            var $dp = this.inst.dpDiv,
            o = this.inst.settings,
            tp_inst = this,
            litem = "",
            uitem = "",
            max = {},
            gridSize = {},
            size = null;
            if ($dp.find("div.ui-timepicker-div").length === 0 && o.showTimepicker) {
                var noDisplay = ' style="display:none;"',
                html = '<div class="ui-timepicker-div' + (o.isRTL ? " ui-timepicker-rtl": "") + '"><dl><dt class="ui_tpicker_time_label"' + ((o.showTime) ? "": noDisplay) + ">" + o.timeText + '</dt><dd class="ui_tpicker_time"' + ((o.showTime) ? "": noDisplay) + "></dd>";
                for (var i = 0,
                l = this.units.length; i < l; i++) {
                    litem = this.units[i];
                    uitem = litem.substr(0, 1).toUpperCase() + litem.substr(1);
                    max[litem] = parseInt((o[litem + "Max"] - ((o[litem + "Max"] - o[litem + "Min"]) % o["step" + uitem])), 10);
                    gridSize[litem] = 0;
                    html += '<dt class="ui_tpicker_' + litem + '_label"' + ((o["show" + uitem]) ? "": noDisplay) + ">" + o[litem + "Text"] + '</dt><dd class="ui_tpicker_' + litem + '"><div class="ui_tpicker_' + litem + '_slider"' + ((o["show" + uitem]) ? "": noDisplay) + "></div>";
                    if (o["show" + uitem] && o[litem + "Grid"] > 0) {
                        html += '<div style="padding-left: 1px"><table class="ui-tpicker-grid-label"><tr>';
                        if (litem == "hour") {
                            for (var h = o[litem + "Min"]; h <= max[litem]; h += parseInt(o[litem + "Grid"], 10)) {
                                gridSize[litem]++;
                                var tmph = (o.ampm && h > 12) ? h - 12 : h;
                                if (tmph < 10) {
                                    tmph = "0" + tmph
                                }
                                if (o.ampm) {
                                    if (h === 0) {
                                        tmph = 12 + "a"
                                    } else {
                                        if (h < 12) {
                                            tmph += "a"
                                        } else {
                                            tmph += "p"
                                        }
                                    }
                                }
                                html += '<td data-for="' + litem + '">' + tmph + "</td>"
                            }
                        } else {
                            for (var m = o[litem + "Min"]; m <= max[litem]; m += parseInt(o[litem + "Grid"], 10)) {
                                gridSize[litem]++;
                                html += '<td data-for="' + litem + '">' + ((m < 10) ? "0": "") + m + "</td>"
                            }
                        }
                        html += "</tr></table></div>"
                    }
                    html += "</dd>"
                }
                html += '<dt class="ui_tpicker_timezone_label"' + ((o.showTimezone) ? "": noDisplay) + ">" + o.timezoneText + "</dt>";
                html += '<dd class="ui_tpicker_timezone" ' + ((o.showTimezone) ? "": noDisplay) + "></dd>";
                html += "</dl></div>";
                var $tp = $(html);
                if (o.timeOnly === true) {
                    $tp.prepend('<div class="ui-widget-header ui-helper-clearfix ui-corner-all"><div class="ui-datepicker-title">' + o.timeOnlyTitle + "</div></div>");
                    $dp.find(".ui-datepicker-header, .ui-datepicker-calendar").hide()
                }
                for (var i = 0,
                l = tp_inst.units.length; i < l; i++) {
                    litem = tp_inst.units[i];
                    uitem = litem.substr(0, 1).toUpperCase() + litem.substr(1);
                    tp_inst[litem + "_slider"] = tp_inst.control.create(tp_inst, $tp.find(".ui_tpicker_" + litem + "_slider"), litem, tp_inst[litem], o[litem + "Min"], max[litem], o["step" + uitem]);
                    if (o["show" + uitem] && o[litem + "Grid"] > 0) {
                        size = 100 * gridSize[litem] * o[litem + "Grid"] / (max[litem] - o[litem + "Min"]);
                        $tp.find(".ui_tpicker_" + litem + " table").css({
                            width: size + "%",
                            marginLeft: o.isRTL ? "0": ((size / ( - 2 * gridSize[litem])) + "%"),
                            marginRight: o.isRTL ? ((size / ( - 2 * gridSize[litem])) + "%") : "0",
                            borderCollapse: "collapse"
                        }).find("td").click(function(e) {
                            var $t = $(this),
                            h = $t.html(),
                            f = $t.data("for");
                            if (f == "hour" && o.ampm) {
                                var ap = h.substring(2).toLowerCase(),
                                aph = parseInt(h.substring(0, 2), 10);
                                if (ap == "a") {
                                    if (aph == 12) {
                                        h = 0
                                    } else {
                                        h = aph
                                    }
                                } else {
                                    if (aph == 12) {
                                        h = 12
                                    } else {
                                        h = aph + 12
                                    }
                                }
                            }
                            tp_inst.control.value(tp_inst, tp_inst[f + "_slider"], parseInt(h, 10));
                            tp_inst._onTimeChange();
                            tp_inst._onSelectHandler()
                        }).css({
                            cursor: "pointer",
                            width: (100 / gridSize[litem]) + "%",
                            textAlign: "center",
                            overflow: "hidden"
                        })
                    }
                }
                this.timezone_select = $tp.find(".ui_tpicker_timezone").append("<select></select>").find("select");
                $.fn.append.apply(this.timezone_select, $.map(o.timezoneList,
                function(val, idx) {
                    return $("<option />").val(typeof val == "object" ? val.value: val).text(typeof val == "object" ? val.label: val)
                }));
                if (typeof(this.timezone) != "undefined" && this.timezone !== null && this.timezone !== "") {
                    var local_date = new Date(this.inst.selectedYear, this.inst.selectedMonth, this.inst.selectedDay, 12);
                    var local_timezone = $.timepicker.timeZoneOffsetString(local_date);
                    if (local_timezone == this.timezone) {
                        selectLocalTimeZone(tp_inst)
                    } else {
                        this.timezone_select.val(this.timezone)
                    }
                } else {
                    if (typeof(this.hour) != "undefined" && this.hour !== null && this.hour !== "") {
                        this.timezone_select.val(o.defaultTimezone)
                    } else {
                        selectLocalTimeZone(tp_inst)
                    }
                }
                this.timezone_select.change(function() {
                    tp_inst._defaults.useLocalTimezone = false;
                    tp_inst._onTimeChange()
                });
                var $buttonPanel = $dp.find(".ui-datepicker-buttonpane");
                if ($buttonPanel.length) {
                    $buttonPanel.before($tp)
                } else {
                    $dp.append($tp)
                }
                this.$timeObj = $tp.find(".ui_tpicker_time");
                if (this.inst !== null) {
                    var timeDefined = this.timeDefined;
                    this._onTimeChange();
                    this.timeDefined = timeDefined
                }
                if (this._defaults.addSliderAccess) {
                    var sliderAccessArgs = this._defaults.sliderAccessArgs,
                    rtl = this._defaults.isRTL;
                    sliderAccessArgs.isRTL = rtl;
                    setTimeout(function() {
                        if ($tp.find(".ui-slider-access").length === 0) {
                            $tp.find(".ui-slider:visible").sliderAccess(sliderAccessArgs);
                            var sliderAccessWidth = $tp.find(".ui-slider-access:eq(0)").outerWidth(true);
                            if (sliderAccessWidth) {
                                $tp.find("table:visible").each(function() {
                                    var $g = $(this),
                                    oldWidth = $g.outerWidth(),
                                    oldMarginLeft = $g.css(rtl ? "marginRight": "marginLeft").toString().replace("%", ""),
                                    newWidth = oldWidth - sliderAccessWidth,
                                    newMarginLeft = ((oldMarginLeft * newWidth) / oldWidth) + "%",
                                    css = {
                                        width: newWidth,
                                        marginRight: 0,
                                        marginLeft: 0
                                    };
                                    css[rtl ? "marginRight": "marginLeft"] = newMarginLeft;
                                    $g.css(css)
                                })
                            }
                        }
                    },
                    10)
                }
            }
        },
        _limitMinMaxDateTime: function(dp_inst, adjustSliders) {
            var o = this._defaults,
            dp_date = new Date(dp_inst.selectedYear, dp_inst.selectedMonth, dp_inst.selectedDay);
            if (!this._defaults.showTimepicker) {
                return
            }
            if ($.datepicker._get(dp_inst, "minDateTime") !== null && $.datepicker._get(dp_inst, "minDateTime") !== undefined && dp_date) {
                var minDateTime = $.datepicker._get(dp_inst, "minDateTime"),
                minDateTimeDate = new Date(minDateTime.getFullYear(), minDateTime.getMonth(), minDateTime.getDate(), 0, 0, 0, 0);
                if (this.hourMinOriginal === null || this.minuteMinOriginal === null || this.secondMinOriginal === null || this.millisecMinOriginal === null) {
                    this.hourMinOriginal = o.hourMin;
                    this.minuteMinOriginal = o.minuteMin;
                    this.secondMinOriginal = o.secondMin;
                    this.millisecMinOriginal = o.millisecMin
                }
                if (dp_inst.settings.timeOnly || minDateTimeDate.getTime() == dp_date.getTime()) {
                    this._defaults.hourMin = minDateTime.getHours();
                    if (this.hour <= this._defaults.hourMin) {
                        this.hour = this._defaults.hourMin;
                        this._defaults.minuteMin = minDateTime.getMinutes();
                        if (this.minute <= this._defaults.minuteMin) {
                            this.minute = this._defaults.minuteMin;
                            this._defaults.secondMin = minDateTime.getSeconds();
                            if (this.second <= this._defaults.secondMin) {
                                this.second = this._defaults.secondMin;
                                this._defaults.millisecMin = minDateTime.getMilliseconds()
                            } else {
                                if (this.millisec < this._defaults.millisecMin) {
                                    this.millisec = this._defaults.millisecMin
                                }
                                this._defaults.millisecMin = this.millisecMinOriginal
                            }
                        } else {
                            this._defaults.secondMin = this.secondMinOriginal;
                            this._defaults.millisecMin = this.millisecMinOriginal
                        }
                    } else {
                        this._defaults.minuteMin = this.minuteMinOriginal;
                        this._defaults.secondMin = this.secondMinOriginal;
                        this._defaults.millisecMin = this.millisecMinOriginal
                    }
                } else {
                    this._defaults.hourMin = this.hourMinOriginal;
                    this._defaults.minuteMin = this.minuteMinOriginal;
                    this._defaults.secondMin = this.secondMinOriginal;
                    this._defaults.millisecMin = this.millisecMinOriginal
                }
            }
            if ($.datepicker._get(dp_inst, "maxDateTime") !== null && $.datepicker._get(dp_inst, "maxDateTime") !== undefined && dp_date) {
                var maxDateTime = $.datepicker._get(dp_inst, "maxDateTime"),
                maxDateTimeDate = new Date(maxDateTime.getFullYear(), maxDateTime.getMonth(), maxDateTime.getDate(), 0, 0, 0, 0);
                if (this.hourMaxOriginal === null || this.minuteMaxOriginal === null || this.secondMaxOriginal === null) {
                    this.hourMaxOriginal = o.hourMax;
                    this.minuteMaxOriginal = o.minuteMax;
                    this.secondMaxOriginal = o.secondMax;
                    this.millisecMaxOriginal = o.millisecMax
                }
                if (dp_inst.settings.timeOnly || maxDateTimeDate.getTime() == dp_date.getTime()) {
                    this._defaults.hourMax = maxDateTime.getHours();
                    if (this.hour >= this._defaults.hourMax) {
                        this.hour = this._defaults.hourMax;
                        this._defaults.minuteMax = maxDateTime.getMinutes();
                        if (this.minute >= this._defaults.minuteMax) {
                            this.minute = this._defaults.minuteMax;
                            this._defaults.secondMax = maxDateTime.getSeconds()
                        } else {
                            if (this.second >= this._defaults.secondMax) {
                                this.second = this._defaults.secondMax;
                                this._defaults.millisecMax = maxDateTime.getMilliseconds()
                            } else {
                                if (this.millisec > this._defaults.millisecMax) {
                                    this.millisec = this._defaults.millisecMax
                                }
                                this._defaults.millisecMax = this.millisecMaxOriginal
                            }
                        }
                    } else {
                        this._defaults.minuteMax = this.minuteMaxOriginal;
                        this._defaults.secondMax = this.secondMaxOriginal;
                        this._defaults.millisecMax = this.millisecMaxOriginal
                    }
                } else {
                    this._defaults.hourMax = this.hourMaxOriginal;
                    this._defaults.minuteMax = this.minuteMaxOriginal;
                    this._defaults.secondMax = this.secondMaxOriginal;
                    this._defaults.millisecMax = this.millisecMaxOriginal
                }
            }
            if (adjustSliders !== undefined && adjustSliders === true) {
                var hourMax = parseInt((this._defaults.hourMax - ((this._defaults.hourMax - this._defaults.hourMin) % this._defaults.stepHour)), 10),
                minMax = parseInt((this._defaults.minuteMax - ((this._defaults.minuteMax - this._defaults.minuteMin) % this._defaults.stepMinute)), 10),
                secMax = parseInt((this._defaults.secondMax - ((this._defaults.secondMax - this._defaults.secondMin) % this._defaults.stepSecond)), 10),
                millisecMax = parseInt((this._defaults.millisecMax - ((this._defaults.millisecMax - this._defaults.millisecMin) % this._defaults.stepMillisec)), 10);
                if (this.hour_slider) {
                    this.control.options(this, this.hour_slider, {
                        min: this._defaults.hourMin,
                        max: hourMax
                    });
                    this.control.value(this, this.hour_slider, this.hour)
                }
                if (this.minute_slider) {
                    this.control.options(this, this.minute_slider, {
                        min: this._defaults.minuteMin,
                        max: minMax
                    });
                    this.control.value(this, this.minute_slider, this.minute)
                }
                if (this.second_slider) {
                    this.control.options(this, this.second_slider, {
                        min: this._defaults.secondMin,
                        max: secMax
                    });
                    this.control.value(this, this.second_slider, this.second)
                }
                if (this.millisec_slider) {
                    this.control.options(this, this.millisec_slider, {
                        min: this._defaults.millisecMin,
                        max: millisecMax
                    });
                    this.control.value(this, this.millisec_slider, this.millisec)
                }
            }
        },
        _onTimeChange: function() {
            var hour = (this.hour_slider) ? this.control.value(this, this.hour_slider) : false,
            minute = (this.minute_slider) ? this.control.value(this, this.minute_slider) : false,
            second = (this.second_slider) ? this.control.value(this, this.second_slider) : false,
            millisec = (this.millisec_slider) ? this.control.value(this, this.millisec_slider) : false,
            timezone = (this.timezone_select) ? this.timezone_select.val() : false,
            o = this._defaults;
            if (typeof(hour) == "object") {
                hour = false
            }
            if (typeof(minute) == "object") {
                minute = false
            }
            if (typeof(second) == "object") {
                second = false
            }
            if (typeof(millisec) == "object") {
                millisec = false
            }
            if (typeof(timezone) == "object") {
                timezone = false
            }
            if (hour !== false) {
                hour = parseInt(hour, 10)
            }
            if (minute !== false) {
                minute = parseInt(minute, 10)
            }
            if (second !== false) {
                second = parseInt(second, 10)
            }
            if (millisec !== false) {
                millisec = parseInt(millisec, 10)
            }
            var ampm = o[hour < 12 ? "amNames": "pmNames"][0];
            var hasChanged = (hour != this.hour || minute != this.minute || second != this.second || millisec != this.millisec || (this.ampm.length > 0 && (hour < 12) != ($.inArray(this.ampm.toUpperCase(), this.amNames) !== -1)) || ((this.timezone === null && timezone != this.defaultTimezone) || (this.timezone !== null && timezone != this.timezone)));
            if (hasChanged) {
                if (hour !== false) {
                    this.hour = hour
                }
                if (minute !== false) {
                    this.minute = minute
                }
                if (second !== false) {
                    this.second = second
                }
                if (millisec !== false) {
                    this.millisec = millisec
                }
                if (timezone !== false) {
                    this.timezone = timezone
                }
                if (!this.inst) {
                    this.inst = $.datepicker._getInst(this.$input[0])
                }
                this._limitMinMaxDateTime(this.inst, true)
            }
            if (o.ampm) {
                this.ampm = ampm
            }
            this.formattedTime = $.datepicker.formatTime(this._defaults.timeFormat, this, this._defaults);
            if (this.$timeObj) {
                this.$timeObj.text(this.formattedTime + o.timeSuffix)
            }
            this.timeDefined = true;
            if (hasChanged) {
                this._updateDateTime()
            }
        },
        _onSelectHandler: function() {
            var onSelect = this._defaults.onSelect || this.inst.settings.onSelect;
            var inputEl = this.$input ? this.$input[0] : null;
            if (onSelect && inputEl) {
                onSelect.apply(inputEl, [this.formattedDateTime, this])
            }
        },
        _updateDateTime: function(dp_inst) {
            dp_inst = this.inst || dp_inst;
            var dt = $.datepicker._daylightSavingAdjust(new Date(dp_inst.selectedYear, dp_inst.selectedMonth, dp_inst.selectedDay)),
            dateFmt = $.datepicker._get(dp_inst, "dateFormat"),
            formatCfg = $.datepicker._getFormatConfig(dp_inst),
            timeAvailable = dt !== null && this.timeDefined;
            this.formattedDate = $.datepicker.formatDate(dateFmt, (dt === null ? new Date() : dt), formatCfg);
            var formattedDateTime = this.formattedDate;
            if (this._defaults.timeOnly === true) {
                formattedDateTime = this.formattedTime
            } else {
                if (this._defaults.timeOnly !== true && (this._defaults.alwaysSetTime || timeAvailable)) {
                    formattedDateTime += this._defaults.separator + this.formattedTime + this._defaults.timeSuffix
                }
            }
            this.formattedDateTime = formattedDateTime;
            if (!this._defaults.showTimepicker) {
                this.$input.val(this.formattedDate)
            } else {
                if (this.$altInput && this._defaults.altFieldTimeOnly === true) {
                    this.$altInput.val(this.formattedTime);
                    this.$input.val(this.formattedDate)
                } else {
                    if (this.$altInput) {
                        this.$input.val(formattedDateTime);
                        var altFormattedDateTime = "",
                        altSeparator = this._defaults.altSeparator ? this._defaults.altSeparator: this._defaults.separator,
                        altTimeSuffix = this._defaults.altTimeSuffix ? this._defaults.altTimeSuffix: this._defaults.timeSuffix;
                        if (this._defaults.altFormat) {
                            altFormattedDateTime = $.datepicker.formatDate(this._defaults.altFormat, (dt === null ? new Date() : dt), formatCfg)
                        } else {
                            altFormattedDateTime = this.formattedDate
                        }
                        if (altFormattedDateTime) {
                            altFormattedDateTime += altSeparator
                        }
                        if (this._defaults.altTimeFormat) {
                            altFormattedDateTime += $.datepicker.formatTime(this._defaults.altTimeFormat, this, this._defaults) + altTimeSuffix
                        } else {
                            altFormattedDateTime += this.formattedTime + altTimeSuffix
                        }
                        this.$altInput.val(altFormattedDateTime)
                    } else {
                        this.$input.val(formattedDateTime)
                    }
                }
            }
            this.$input.trigger("change")
        },
        _onFocus: function() {
            if (!this.$input.val() && this._defaults.defaultValue) {
                this.$input.val(this._defaults.defaultValue);
                var inst = $.datepicker._getInst(this.$input.get(0)),
                tp_inst = $.datepicker._get(inst, "timepicker");
                if (tp_inst) {
                    if (tp_inst._defaults.timeOnly && (inst.input.val() != inst.lastVal)) {
                        try {
                            $.datepicker._updateDatepicker(inst)
                        } catch(err) {
                            $.datepicker.log(err)
                        }
                    }
                }
            }
        },
        _controls: {
            slider: {
                create: function(tp_inst, obj, unit, val, min, max, step) {
                    var rtl = tp_inst._defaults.isRTL;
                    return obj.prop("slide", null).slider({
                        orientation: "horizontal",
                        value: rtl ? val * -1 : val,
                        min: rtl ? max * -1 : min,
                        max: rtl ? min * -1 : max,
                        step: step,
                        slide: function(event, ui) {
                            tp_inst.control.value(tp_inst, $(this), rtl ? ui.value * -1 : ui.value);
                            tp_inst._onTimeChange()
                        },
                        stop: function(event, ui) {
                            tp_inst._onSelectHandler()
                        }
                    })
                },
                options: function(tp_inst, obj, opts, val) {
                    if (tp_inst._defaults.isRTL) {
                        if (typeof(opts) == "string") {
                            if (opts == "min" || opts == "max") {
                                if (val !== undefined) {
                                    return obj.slider(opts, val * -1)
                                }
                                return Math.abs(obj.slider(opts))
                            }
                            return obj.slider(opts)
                        }
                        var min = opts.min,
                        max = opts.max;
                        opts.min = opts.max = null;
                        if (min !== undefined) {
                            opts.max = min * -1
                        }
                        if (max !== undefined) {
                            opts.min = max * -1
                        }
                        return obj.slider(opts)
                    }
                    if (typeof(opts) == "string" && val !== undefined) {
                        return obj.slider(opts, val)
                    }
                    return obj.slider(opts)
                },
                value: function(tp_inst, obj, val) {
                    if (tp_inst._defaults.isRTL) {
                        if (val !== undefined) {
                            return obj.slider("value", val * -1)
                        }
                        return Math.abs(obj.slider("value"))
                    }
                    if (val !== undefined) {
                        return obj.slider("value", val)
                    }
                    return obj.slider("value")
                }
            },
            select: {
                create: function(tp_inst, obj, unit, val, min, max, step) {
                    var sel = '<select class="ui-timepicker-select" data-unit="' + unit + '" data-min="' + min + '" data-max="' + max + '" data-step="' + step + '">',
                    ul = tp_inst._defaults.timeFormat.indexOf("t") !== -1 ? "toLowerCase": "toUpperCase",
                    m = 0;
                    for (var i = min; i <= max; i += step) {
                        sel += '<option value="' + i + '"' + (i == val ? " selected": "") + ">";
                        if (unit == "hour" && tp_inst._defaults.ampm) {
                            m = i % 12;
                            if (i === 0 || i === 12) {
                                sel += "12"
                            } else {
                                if (m < 10) {
                                    sel += "0" + m.toString()
                                } else {
                                    sel += m
                                }
                            }
                            sel += " " + ((i < 12) ? tp_inst._defaults.amNames[0] : tp_inst._defaults.pmNames[0])[ul]()
                        } else {
                            if (unit == "millisec" || i >= 10) {
                                sel += i
                            } else {
                                sel += "0" + i.toString()
                            }
                        }
                        sel += "</option>"
                    }
                    sel += "</select>";
                    obj.children("select").remove();
                    $(sel).appendTo(obj).change(function(e) {
                        tp_inst._onTimeChange();
                        tp_inst._onSelectHandler()
                    });
                    return obj
                },
                options: function(tp_inst, obj, opts, val) {
                    var o = {},
                    $t = obj.children("select");
                    if (typeof(opts) == "string") {
                        if (val === undefined) {
                            return $t.data(opts)
                        }
                        o[opts] = val
                    } else {
                        o = opts
                    }
                    return tp_inst.control.create(tp_inst, obj, $t.data("unit"), $t.val(), o.min || $t.data("min"), o.max || $t.data("max"), o.step || $t.data("step"))
                },
                value: function(tp_inst, obj, val) {
                    var $t = obj.children("select");
                    if (val !== undefined) {
                        return $t.val(val)
                    }
                    return $t.val()
                }
            }
        }
    });
    $.fn.extend({
        timepicker: function(o) {
            o = o || {};
            var tmp_args = Array.prototype.slice.call(arguments);
            if (typeof o == "object") {
                tmp_args[0] = $.extend(o, {
                    timeOnly: true
                })
            }
            return $(this).each(function() {
                $.fn.datetimepicker.apply($(this), tmp_args)
            })
        },
        datetimepicker: function(o) {
            o = o || {};
            var tmp_args = arguments;
            if (typeof(o) == "string") {
                if (o == "getDate") {
                    return $.fn.datepicker.apply($(this[0]), tmp_args)
                } else {
                    return this.each(function() {
                        var $t = $(this);
                        $t.datepicker.apply($t, tmp_args)
                    })
                }
            } else {
                return this.each(function() {
                    var $t = $(this);
                    $t.datepicker($.timepicker._newInst($t, o)._defaults)
                })
            }
        }
    });
    $.datepicker.parseDateTime = function(dateFormat, timeFormat, dateTimeString, dateSettings, timeSettings) {
        var parseRes = parseDateTimeInternal(dateFormat, timeFormat, dateTimeString, dateSettings, timeSettings);
        if (parseRes.timeObj) {
            var t = parseRes.timeObj;
            parseRes.date.setHours(t.hour, t.minute, t.second, t.millisec)
        }
        return parseRes.date
    };
    $.datepicker.parseTime = function(timeFormat, timeString, options) {
        var getPatternAmpm = function(amNames, pmNames) {
            var markers = [];
            if (amNames) {
                $.merge(markers, amNames)
            }
            if (pmNames) {
                $.merge(markers, pmNames)
            }
            markers = $.map(markers,
            function(val) {
                return val.replace(/[.*+?|()\[\]{}\\]/g, "\\$&")
            });
            return "(" + markers.join("|") + ")?"
        };
        var getFormatPositions = function(timeFormat) {
            var finds = timeFormat.toLowerCase().match(/(h{1,2}|m{1,2}|s{1,2}|l{1}|t{1,2}|z|'.*?')/g),
            orders = {
                h: -1,
                m: -1,
                s: -1,
                l: -1,
                t: -1,
                z: -1
            };
            if (finds) {
                for (var i = 0; i < finds.length; i++) {
                    if (orders[finds[i].toString().charAt(0)] == -1) {
                        orders[finds[i].toString().charAt(0)] = i + 1
                    }
                }
            }
            return orders
        };
        var o = extendRemove(extendRemove({},
        $.timepicker._defaults), options || {});
        var regstr = "^" + timeFormat.toString().replace(/(hh?|mm?|ss?|[tT]{1,2}|[lz]|'.*?')/g,
        function(match) {
            switch (match.charAt(0).toLowerCase()) {
            case "h":
                return "(\\d?\\d)";
            case "m":
                return "(\\d?\\d)";
            case "s":
                return "(\\d?\\d)";
            case "l":
                return "(\\d?\\d?\\d)";
            case "z":
                return "(z|[-+]\\d\\d:?\\d\\d|\\S+)?";
            case "t":
                return getPatternAmpm(o.amNames, o.pmNames);
            default:
                return "(" + match.replace(/\'/g, "").replace(/(\.|\$|\^|\\|\/|\(|\)|\[|\]|\?|\+|\*)/g,
                function(m) {
                    return "\\" + m
                }) + ")?"
            }
        }).replace(/\s/g, "\\s?") + o.timeSuffix + "$",
        order = getFormatPositions(timeFormat),
        ampm = "",
        treg;
        treg = timeString.match(new RegExp(regstr, "i"));
        var resTime = {
            hour: 0,
            minute: 0,
            second: 0,
            millisec: 0
        };
        if (treg) {
            if (order.t !== -1) {
                if (treg[order.t] === undefined || treg[order.t].length === 0) {
                    ampm = "";
                    resTime.ampm = ""
                } else {
                    ampm = $.inArray(treg[order.t].toUpperCase(), o.amNames) !== -1 ? "AM": "PM";
                    resTime.ampm = o[ampm == "AM" ? "amNames": "pmNames"][0]
                }
            }
            if (order.h !== -1) {
                if (ampm == "AM" && treg[order.h] == "12") {
                    resTime.hour = 0
                } else {
                    if (ampm == "PM" && treg[order.h] != "12") {
                        resTime.hour = parseInt(treg[order.h], 10) + 12
                    } else {
                        resTime.hour = Number(treg[order.h])
                    }
                }
            }
            if (order.m !== -1) {
                resTime.minute = Number(treg[order.m])
            }
            if (order.s !== -1) {
                resTime.second = Number(treg[order.s])
            }
            if (order.l !== -1) {
                resTime.millisec = Number(treg[order.l])
            }
            if (order.z !== -1 && treg[order.z] !== undefined) {
                var tz = treg[order.z].toUpperCase();
                switch (tz.length) {
                case 1:
                    tz = o.timezoneIso8601 ? "Z": "+0000";
                    break;
                case 5:
                    if (o.timezoneIso8601) {
                        tz = tz.substring(1) == "0000" ? "Z": tz.substring(0, 3) + ":" + tz.substring(3)
                    }
                    break;
                case 6:
                    if (!o.timezoneIso8601) {
                        tz = tz == "Z" || tz.substring(1) == "00:00" ? "+0000": tz.replace(/:/, "")
                    } else {
                        if (tz.substring(1) == "00:00") {
                            tz = "Z"
                        }
                    }
                    break
                }
                resTime.timezone = tz
            }
            return resTime
        }
        return false
    };
    $.datepicker.formatTime = function(format, time, options) {
        options = options || {};
        options = $.extend({},
        $.timepicker._defaults, options);
        time = $.extend({
            hour: 0,
            minute: 0,
            second: 0,
            millisec: 0,
            timezone: "+0000"
        },
        time);
        var tmptime = format;
        var ampmName = options.amNames[0];
        var hour = parseInt(time.hour, 10);
        if (options.ampm) {
            if (hour > 11) {
                ampmName = options.pmNames[0];
                if (hour > 12) {
                    hour = hour % 12
                }
            }
            if (hour === 0) {
                hour = 12
            }
        }
        tmptime = tmptime.replace(/(?:hh?|mm?|ss?|[tT]{1,2}|[lz]|'.*?')/g,
        function(match) {
            switch (match.toLowerCase()) {
            case "hh":
                return ("0" + hour).slice( - 2);
            case "h":
                return hour;
            case "mm":
                return ("0" + time.minute).slice( - 2);
            case "m":
                return time.minute;
            case "ss":
                return ("0" + time.second).slice( - 2);
            case "s":
                return time.second;
            case "l":
                return ("00" + time.millisec).slice( - 3);
            case "z":
                return time.timezone === null ? options.defaultTimezone: time.timezone;
            case "t":
            case "tt":
                if (options.ampm) {
                    if (match.length == 1) {
                        ampmName = ampmName.charAt(0)
                    }
                    return match.charAt(0) === "T" ? ampmName.toUpperCase() : ampmName.toLowerCase()
                }
                return "";
            default:
                return match.replace(/\'/g, "") || "'"
            }
        });
        tmptime = $.trim(tmptime);
        return tmptime
    };
    $.datepicker._base_selectDate = $.datepicker._selectDate;
    $.datepicker._selectDate = function(id, dateStr) {
        var inst = this._getInst($(id)[0]),
        tp_inst = this._get(inst, "timepicker");
        if (tp_inst) {
            tp_inst._limitMinMaxDateTime(inst, true);
            inst.inline = inst.stay_open = true;
            this._base_selectDate(id, dateStr);
            inst.inline = inst.stay_open = false;
            this._notifyChange(inst);
            this._updateDatepicker(inst)
        } else {
            this._base_selectDate(id, dateStr)
        }
    };
    $.datepicker._base_updateDatepicker = $.datepicker._updateDatepicker;
    $.datepicker._updateDatepicker = function(inst) {
        var input = inst.input[0];
        if ($.datepicker._curInst && $.datepicker._curInst != inst && $.datepicker._datepickerShowing && $.datepicker._lastInput != input) {
            return
        }
        if (typeof(inst.stay_open) !== "boolean" || inst.stay_open === false) {
            this._base_updateDatepicker(inst);
            var tp_inst = this._get(inst, "timepicker");
            if (tp_inst) {
                tp_inst._addTimePicker(inst);
                if (tp_inst._defaults.useLocalTimezone) {
                    var date = new Date(inst.selectedYear, inst.selectedMonth, inst.selectedDay, 12);
                    selectLocalTimeZone(tp_inst, date);
                    tp_inst._onTimeChange()
                }
            }
        }
    };
    $.datepicker._base_doKeyPress = $.datepicker._doKeyPress;
    $.datepicker._doKeyPress = function(event) {
        var inst = $.datepicker._getInst(event.target),
        tp_inst = $.datepicker._get(inst, "timepicker");
        if (tp_inst) {
            if ($.datepicker._get(inst, "constrainInput")) {
                var ampm = tp_inst._defaults.ampm,
                dateChars = $.datepicker._possibleChars($.datepicker._get(inst, "dateFormat")),
                datetimeChars = tp_inst._defaults.timeFormat.toString().replace(/[hms]/g, "").replace(/TT/g, ampm ? "APM": "").replace(/Tt/g, ampm ? "AaPpMm": "").replace(/tT/g, ampm ? "AaPpMm": "").replace(/T/g, ampm ? "AP": "").replace(/tt/g, ampm ? "apm": "").replace(/t/g, ampm ? "ap": "") + " " + tp_inst._defaults.separator + tp_inst._defaults.timeSuffix + (tp_inst._defaults.showTimezone ? tp_inst._defaults.timezoneList.join("") : "") + (tp_inst._defaults.amNames.join("")) + (tp_inst._defaults.pmNames.join("")) + dateChars,
                chr = String.fromCharCode(event.charCode === undefined ? event.keyCode: event.charCode);
                return event.ctrlKey || (chr < " " || !dateChars || datetimeChars.indexOf(chr) > -1)
            }
        }
        return $.datepicker._base_doKeyPress(event)
    };
    $.datepicker._base_updateAlternate = $.datepicker._updateAlternate;
    $.datepicker._updateAlternate = function(inst) {
        var tp_inst = this._get(inst, "timepicker");
        if (tp_inst) {
            var altField = tp_inst._defaults.altField;
            if (altField) {
                var altFormat = tp_inst._defaults.altFormat || tp_inst._defaults.dateFormat,
                date = this._getDate(inst),
                formatCfg = $.datepicker._getFormatConfig(inst),
                altFormattedDateTime = "",
                altSeparator = tp_inst._defaults.altSeparator ? tp_inst._defaults.altSeparator: tp_inst._defaults.separator,
                altTimeSuffix = tp_inst._defaults.altTimeSuffix ? tp_inst._defaults.altTimeSuffix: tp_inst._defaults.timeSuffix,
                altTimeFormat = tp_inst._defaults.altTimeFormat !== undefined ? tp_inst._defaults.altTimeFormat: tp_inst._defaults.timeFormat;
                altFormattedDateTime += $.datepicker.formatTime(altTimeFormat, tp_inst, tp_inst._defaults) + altTimeSuffix;
                if (!tp_inst._defaults.timeOnly && !tp_inst._defaults.altFieldTimeOnly) {
                    if (tp_inst._defaults.altFormat) {
                        altFormattedDateTime = $.datepicker.formatDate(tp_inst._defaults.altFormat, (date === null ? new Date() : date), formatCfg) + altSeparator + altFormattedDateTime
                    } else {
                        altFormattedDateTime = tp_inst.formattedDate + altSeparator + altFormattedDateTime
                    }
                }
                $(altField).val(altFormattedDateTime)
            }
        } else {
            $.datepicker._base_updateAlternate(inst)
        }
    };
    $.datepicker._base_doKeyUp = $.datepicker._doKeyUp;
    $.datepicker._doKeyUp = function(event) {
        var inst = $.datepicker._getInst(event.target),
        tp_inst = $.datepicker._get(inst, "timepicker");
        if (tp_inst) {
            if (tp_inst._defaults.timeOnly && (inst.input.val() != inst.lastVal)) {
                try {
                    $.datepicker._updateDatepicker(inst)
                } catch(err) {
                    $.datepicker.log(err)
                }
            }
        }
        return $.datepicker._base_doKeyUp(event)
    };
    $.datepicker._disableTimepickerDatepicker = function(target) {
        var inst = this._getInst(target);
        if (!inst) {
            return
        }
        var tp_inst = this._get(inst, "timepicker");
        $(target).datepicker("getDate");
        if (tp_inst) {
            tp_inst._defaults.showTimepicker = false;
            tp_inst._updateDateTime(inst)
        }
    };
    $.datepicker._enableTimepickerDatepicker = function(target) {
        var inst = this._getInst(target);
        if (!inst) {
            return
        }
        var tp_inst = this._get(inst, "timepicker");
        $(target).datepicker("getDate");
        if (tp_inst) {
            tp_inst._defaults.showTimepicker = true;
            tp_inst._addTimePicker(inst);
            tp_inst._updateDateTime(inst)
        }
    };
    $.datepicker._setTimeDatepicker = function(target, date, withDate) {
        var inst = this._getInst(target);
        if (!inst) {
            return
        }
        var tp_inst = this._get(inst, "timepicker");
        if (tp_inst) {
            this._setDateFromField(inst);
            var tp_date;
            if (date) {
                if (typeof date == "string") {
                    tp_inst._parseTime(date, withDate);
                    tp_date = new Date();
                    tp_date.setHours(tp_inst.hour, tp_inst.minute, tp_inst.second, tp_inst.millisec)
                } else {
                    tp_date = new Date(date.getTime())
                }
                if (tp_date.toString() == "Invalid Date") {
                    tp_date = undefined
                }
                this._setTime(inst, tp_date)
            }
        }
    };
    $.datepicker._base_setDateDatepicker = $.datepicker._setDateDatepicker;
    $.datepicker._setDateDatepicker = function(target, date) {
        var inst = this._getInst(target);
        if (!inst) {
            return
        }
        var tp_date = (date instanceof Date) ? new Date(date.getTime()) : date;
        this._updateDatepicker(inst);
        this._base_setDateDatepicker.apply(this, arguments);
        this._setTimeDatepicker(target, tp_date, true)
    };
    $.datepicker._base_getDateDatepicker = $.datepicker._getDateDatepicker;
    $.datepicker._getDateDatepicker = function(target, noDefault) {
        var inst = this._getInst(target);
        if (!inst) {
            return
        }
        var tp_inst = this._get(inst, "timepicker");
        if (tp_inst) {
            if (inst.lastVal === undefined) {
                this._setDateFromField(inst, noDefault)
            }
            var date = this._getDate(inst);
            if (date && tp_inst._parseTime($(target).val(), tp_inst.timeOnly)) {
                date.setHours(tp_inst.hour, tp_inst.minute, tp_inst.second, tp_inst.millisec)
            }
            return date
        }
        return this._base_getDateDatepicker(target, noDefault)
    };
    $.datepicker._base_parseDate = $.datepicker.parseDate;
    $.datepicker.parseDate = function(format, value, settings) {
        var date;
        try {
            date = this._base_parseDate(format, value, settings)
        } catch(err) {
            date = this._base_parseDate(format, value.substring(0, value.length - (err.length - err.indexOf(":") - 2)), settings)
        }
        return date
    };
    $.datepicker._base_formatDate = $.datepicker._formatDate;
    $.datepicker._formatDate = function(inst, day, month, year) {
        var tp_inst = this._get(inst, "timepicker");
        if (tp_inst) {
            tp_inst._updateDateTime(inst);
            return tp_inst.$input.val()
        }
        return this._base_formatDate(inst)
    };
    $.datepicker._base_optionDatepicker = $.datepicker._optionDatepicker;
    $.datepicker._optionDatepicker = function(target, name, value) {
        var inst = this._getInst(target),
        name_clone;
        if (!inst) {
            return null
        }
        var tp_inst = this._get(inst, "timepicker");
        if (tp_inst) {
            var min = null,
            max = null,
            onselect = null,
            overrides = tp_inst._defaults.evnts,
            fns = {},
            prop;
            if (typeof name == "string") {
                if (name === "minDate" || name === "minDateTime") {
                    min = value
                } else {
                    if (name === "maxDate" || name === "maxDateTime") {
                        max = value
                    } else {
                        if (name === "onSelect") {
                            onselect = value
                        } else {
                            if (overrides.hasOwnProperty(name)) {
                                if (typeof(value) === "undefined") {
                                    return overrides[name]
                                }
                                fns[name] = value;
                                name_clone = {}
                            }
                        }
                    }
                }
            } else {
                if (typeof name == "object") {
                    if (name.minDate) {
                        min = name.minDate
                    } else {
                        if (name.minDateTime) {
                            min = name.minDateTime
                        } else {
                            if (name.maxDate) {
                                max = name.maxDate
                            } else {
                                if (name.maxDateTime) {
                                    max = name.maxDateTime
                                }
                            }
                        }
                    }
                    for (prop in overrides) {
                        if (overrides.hasOwnProperty(prop) && name[prop]) {
                            fns[prop] = name[prop]
                        }
                    }
                }
            }
            for (prop in fns) {
                if (fns.hasOwnProperty(prop)) {
                    overrides[prop] = fns[prop];
                    if (!name_clone) {
                        name_clone = $.extend({},
                        name)
                    }
                    delete name_clone[prop]
                }
            }
            if (name_clone && isEmptyObject(name_clone)) {
                return
            }
            if (min) {
                if (min === 0) {
                    min = new Date()
                } else {
                    min = new Date(min)
                }
                tp_inst._defaults.minDate = min;
                tp_inst._defaults.minDateTime = min
            } else {
                if (max) {
                    if (max === 0) {
                        max = new Date()
                    } else {
                        max = new Date(max)
                    }
                    tp_inst._defaults.maxDate = max;
                    tp_inst._defaults.maxDateTime = max
                } else {
                    if (onselect) {
                        tp_inst._defaults.onSelect = onselect
                    }
                }
            }
        }
        if (value === undefined) {
            return this._base_optionDatepicker.call($.datepicker, target, name)
        }
        return this._base_optionDatepicker.call($.datepicker, target, name_clone || name, value)
    };
    function isEmptyObject(obj) {
        var prop;
        for (prop in obj) {
            if (obj.hasOwnProperty(obj)) {
                return false
            }
        }
        return true
    }
    function extendRemove(target, props) {
        $.extend(target, props);
        for (var name in props) {
            if (props[name] === null || props[name] === undefined) {
                target[name] = props[name]
            }
        }
        return target
    }
    var splitDateTime = function(dateFormat, dateTimeString, dateSettings, timeSettings) {
        try {
            var separator = timeSettings && timeSettings.separator ? timeSettings.separator: $.timepicker._defaults.separator,
            format = timeSettings && timeSettings.timeFormat ? timeSettings.timeFormat: $.timepicker._defaults.timeFormat,
            ampm = timeSettings && timeSettings.ampm ? timeSettings.ampm: $.timepicker._defaults.ampm,
            timeParts = format.split(separator),
            timePartsLen = timeParts.length,
            allParts = dateTimeString.split(separator),
            allPartsLen = allParts.length;
            if (!ampm) {
                timeParts = $.trim(format.replace(/t/gi, "")).split(separator);
                timePartsLen = timeParts.length
            }
            if (allPartsLen > 1) {
                return [allParts.splice(0, allPartsLen - timePartsLen).join(separator), allParts.splice(0, timePartsLen).join(separator)]
            }
        } catch(err) {
            if (err.indexOf(":") >= 0) {
                var dateStringLength = dateTimeString.length - (err.length - err.indexOf(":") - 2),
                timeString = dateTimeString.substring(dateStringLength);
                return [$.trim(dateTimeString.substring(0, dateStringLength)), $.trim(dateTimeString.substring(dateStringLength))]
            } else {
                throw err
            }
        }
        return [dateTimeString, ""]
    };
    var parseDateTimeInternal = function(dateFormat, timeFormat, dateTimeString, dateSettings, timeSettings) {
        var date;
        var splitRes = splitDateTime(dateFormat, dateTimeString, dateSettings, timeSettings);
        date = $.datepicker._base_parseDate(dateFormat, splitRes[0], dateSettings);
        if (splitRes[1] !== "") {
            var timeString = splitRes[1],
            parsedTime = $.datepicker.parseTime(timeFormat, timeString, timeSettings);
            if (parsedTime === null) {
                throw "Wrong time format"
            }
            return {
                date: date,
                timeObj: parsedTime
            }
        } else {
            return {
                date: date
            }
        }
    };
    var selectLocalTimeZone = function(tp_inst, date) {
        if (tp_inst && tp_inst.timezone_select) {
            tp_inst._defaults.useLocalTimezone = true;
            var now = typeof date !== "undefined" ? date: new Date();
            var tzoffset = $.timepicker.timeZoneOffsetString(now);
            if (tp_inst._defaults.timezoneIso8601) {
                tzoffset = tzoffset.substring(0, 3) + ":" + tzoffset.substring(3)
            }
            tp_inst.timezone_select.val(tzoffset)
        }
    };
    $.timepicker = new Timepicker();
    $.timepicker.timeZoneOffsetString = function(date) {
        var off = date.getTimezoneOffset() * -1,
        minutes = off % 60,
        hours = (off - minutes) / 60;
        return (off >= 0 ? "+": "-") + ("0" + (hours * 101).toString()).substr( - 2) + ("0" + (minutes * 101).toString()).substr( - 2)
    };
    $.timepicker.timeRange = function(startTime, endTime, options) {
        return $.timepicker.handleRange("timepicker", startTime, endTime, options)
    };
    $.timepicker.dateTimeRange = function(startTime, endTime, options) {
        $.timepicker.dateRange(startTime, endTime, options, "datetimepicker")
    };
    $.timepicker.dateRange = function(startTime, endTime, options, method) {
        method = method || "datepicker";
        $.timepicker.handleRange(method, startTime, endTime, options)
    };
    $.timepicker.handleRange = function(method, startTime, endTime, options) {
        $.fn[method].call(startTime, $.extend({
            onClose: function(dateText, inst) {
                checkDates(this, endTime, dateText)
            },
            onSelect: function(selectedDateTime) {
                selected(this, endTime, "minDate")
            }
        },
        options, options.start));
        $.fn[method].call(endTime, $.extend({
            onClose: function(dateText, inst) {
                checkDates(this, startTime, dateText)
            },
            onSelect: function(selectedDateTime) {
                selected(this, startTime, "maxDate")
            }
        },
        options, options.end));
        if (method != "timepicker" && options.reformat) {
            $([startTime, endTime]).each(function() {
                var format = $(this)[method].call($(this), "option", "dateFormat"),
                date = new Date($(this).val());
                if ($(this).val() && date) {
                    $(this).val($.datepicker.formatDate(format, date))
                }
            })
        }
        checkDates(startTime, endTime, startTime.val());
        function checkDates(changed, other, dateText) {
            if (other.val() && (new Date(startTime.val()) > new Date(endTime.val()))) {
                other.val(dateText)
            }
        }
        selected(startTime, endTime, "minDate");
        selected(endTime, startTime, "maxDate");
        function selected(changed, other, option) {
            if (!$(changed).val()) {
                return
            }
            var date = $(changed)[method].call($(changed), "getDate");
            if (date.getTime) {
                $(other)[method].call($(other), "option", option, date)
            }
        }
        return $([startTime.get(0), endTime.get(0)])
    };
    $.timepicker.version = "1.0.5"
})(jQuery); (function(b, c) {
    var a = 5;
    b.widget("ui.slider", b.ui.mouse, {
        widgetEventPrefix: "slide",
        options: {
            animate: false,
            distance: 0,
            max: 100,
            min: 0,
            orientation: "horizontal",
            range: false,
            step: 1,
            value: 0,
            values: null
        },
        _create: function() {
            var e = this,
            n = this.options,
            m = this.element.find(".ui-slider-handle").addClass("ui-state-default ui-corner-all"),
            h = "<a class='ui-slider-handle ui-state-default ui-corner-all' href='#'></a>",
            d = (n.values && n.values.length) || 1,
            g = [];
            this._keySliding = false;
            this._mouseSliding = false;
            this._animateOff = true;
            this._handleIndex = null;
            this._detectOrientation();
            this._mouseInit();
            this.element.addClass("ui-slider ui-slider-" + this.orientation + " ui-widget ui-widget-content ui-corner-all" + (n.disabled ? " ui-slider-disabled ui-disabled": ""));
            this.range = b([]);
            if (n.range) {
                if (n.range === true) {
                    if (!n.values) {
                        n.values = [this._valueMin(), this._valueMin()]
                    }
                    if (n.values.length && n.values.length !== 2) {
                        n.values = [n.values[0], n.values[0]]
                    }
                }
                this.range = b("<div></div>").appendTo(this.element).addClass("ui-slider-range ui-widget-header" + ((n.range === "min" || n.range === "max") ? " ui-slider-range-" + n.range: ""))
            }
            for (var f = m.length; f < d; f += 1) {
                g.push(h)
            }
            this.handles = m.add(b(g.join("")).appendTo(e.element));
            this.handle = this.handles.eq(0);
            this.handles.add(this.range).filter("a").click(function(o) {
                o.preventDefault()
            }).hover(function() {
                if (!n.disabled) {
                    b(this).addClass("ui-state-hover")
                }
            },
            function() {
                b(this).removeClass("ui-state-hover")
            }).focus(function() {
                if (!n.disabled) {
                    b(".ui-slider .ui-state-focus").removeClass("ui-state-focus");
                    b(this).addClass("ui-state-focus")
                } else {
                    b(this).blur()
                }
            }).blur(function() {
                b(this).removeClass("ui-state-focus")
            });
            this.handles.each(function(o) {
                b(this).data("index.ui-slider-handle", o)
            });
            this.handles.keydown(function(s) {
                var p = b(this).data("index.ui-slider-handle"),
                t,
                q,
                o,
                r;
                if (e.options.disabled) {
                    return
                }
                switch (s.keyCode) {
                case b.ui.keyCode.HOME:
                case b.ui.keyCode.END:
                case b.ui.keyCode.PAGE_UP:
                case b.ui.keyCode.PAGE_DOWN:
                case b.ui.keyCode.UP:
                case b.ui.keyCode.RIGHT:
                case b.ui.keyCode.DOWN:
                case b.ui.keyCode.LEFT:
                    s.preventDefault();
                    if (!e._keySliding) {
                        e._keySliding = true;
                        b(this).addClass("ui-state-active");
                        t = e._start(s, p);
                        if (t === false) {
                            return
                        }
                    }
                    break
                }
                r = e.options.step;
                if (e.options.values && e.options.values.length) {
                    q = o = e.values(p)
                } else {
                    q = o = e.value()
                }
                switch (s.keyCode) {
                case b.ui.keyCode.HOME:
                    o = e._valueMin();
                    break;
                case b.ui.keyCode.END:
                    o = e._valueMax();
                    break;
                case b.ui.keyCode.PAGE_UP:
                    o = e._trimAlignValue(q + ((e._valueMax() - e._valueMin()) / a));
                    break;
                case b.ui.keyCode.PAGE_DOWN:
                    o = e._trimAlignValue(q - ((e._valueMax() - e._valueMin()) / a));
                    break;
                case b.ui.keyCode.UP:
                case b.ui.keyCode.RIGHT:
                    if (q === e._valueMax()) {
                        return
                    }
                    o = e._trimAlignValue(q + r);
                    break;
                case b.ui.keyCode.DOWN:
                case b.ui.keyCode.LEFT:
                    if (q === e._valueMin()) {
                        return
                    }
                    o = e._trimAlignValue(q - r);
                    break
                }
                e._slide(s, p, o)
            }).keyup(function(p) {
                var o = b(this).data("index.ui-slider-handle");
                if (e._keySliding) {
                    e._keySliding = false;
                    e._stop(p, o);
                    e._change(p, o);
                    b(this).removeClass("ui-state-active")
                }
            });
            this._refreshValue();
            this._animateOff = false
        },
        destroy: function() {
            this.handles.remove();
            this.range.remove();
            this.element.removeClass("ui-slider ui-slider-horizontal ui-slider-vertical ui-slider-disabled ui-widget ui-widget-content ui-corner-all").removeData("slider").unbind(".slider");
            this._mouseDestroy();
            return this
        },
        _mouseCapture: function(f) {
            var g = this.options,
            n, q, e, h, s, p, r, m, d;
            if (g.disabled) {
                return false
            }
            this.elementSize = {
                width: this.element.outerWidth(),
                height: this.element.outerHeight()
            };
            this.elementOffset = this.element.offset();
            n = {
                x: f.pageX,
                y: f.pageY
            };
            q = this._normValueFromMouse(n);
            e = this._valueMax() - this._valueMin() + 1;
            s = this;
            this.handles.each(function(o) {
                var t = Math.abs(q - s.values(o));
                if (e > t) {
                    e = t;
                    h = b(this);
                    p = o
                }
            });
            if (g.range === true && this.values(1) === g.min) {
                p += 1;
                h = b(this.handles[p])
            }
            r = this._start(f, p);
            if (r === false) {
                return false
            }
            this._mouseSliding = true;
            s._handleIndex = p;
            h.addClass("ui-state-active").focus();
            m = h.offset();
            d = !b(f.target).parents().andSelf().is(".ui-slider-handle");
            this._clickOffset = d ? {
                left: 0,
                top: 0
            }: {
                left: f.pageX - m.left - (h.width() / 2),
                top: f.pageY - m.top - (h.height() / 2) - (parseInt(h.css("borderTopWidth"), 10) || 0) - (parseInt(h.css("borderBottomWidth"), 10) || 0) + (parseInt(h.css("marginTop"), 10) || 0)
            };
            if (!this.handles.hasClass("ui-state-hover")) {
                this._slide(f, p, q)
            }
            this._animateOff = true;
            return true
        },
        _mouseStart: function(d) {
            return true
        },
        _mouseDrag: function(f) {
            var d = {
                x: f.pageX,
                y: f.pageY
            },
            e = this._normValueFromMouse(d);
            this._slide(f, this._handleIndex, e);
            return false
        },
        _mouseStop: function(d) {
            this.handles.removeClass("ui-state-active");
            this._mouseSliding = false;
            this._stop(d, this._handleIndex);
            this._change(d, this._handleIndex);
            this._handleIndex = null;
            this._clickOffset = null;
            this._animateOff = false;
            return false
        },
        _detectOrientation: function() {
            this.orientation = (this.options.orientation === "vertical") ? "vertical": "horizontal"
        },
        _normValueFromMouse: function(e) {
            var d, h, g, f, m;
            if (this.orientation === "horizontal") {
                d = this.elementSize.width;
                h = e.x - this.elementOffset.left - (this._clickOffset ? this._clickOffset.left: 0)
            } else {
                d = this.elementSize.height;
                h = e.y - this.elementOffset.top - (this._clickOffset ? this._clickOffset.top: 0)
            }
            g = (h / d);
            if (g > 1) {
                g = 1
            }
            if (g < 0) {
                g = 0
            }
            if (this.orientation === "vertical") {
                g = 1 - g
            }
            f = this._valueMax() - this._valueMin();
            m = this._valueMin() + g * f;
            return this._trimAlignValue(m)
        },
        _start: function(f, e) {
            var d = {
                handle: this.handles[e],
                value: this.value()
            };
            if (this.options.values && this.options.values.length) {
                d.value = this.values(e);
                d.values = this.values()
            }
            return this._trigger("start", f, d)
        },
        _slide: function(h, g, f) {
            var d, e, m;
            if (this.options.values && this.options.values.length) {
                d = this.values(g ? 0 : 1);
                if ((this.options.values.length === 2 && this.options.range === true) && ((g === 0 && f > d) || (g === 1 && f < d))) {
                    f = d
                }
                if (f !== this.values(g)) {
                    e = this.values();
                    e[g] = f;
                    m = this._trigger("slide", h, {
                        handle: this.handles[g],
                        value: f,
                        values: e
                    });
                    d = this.values(g ? 0 : 1);
                    if (m !== false) {
                        this.values(g, f, true)
                    }
                }
            } else {
                if (f !== this.value()) {
                    m = this._trigger("slide", h, {
                        handle: this.handles[g],
                        value: f
                    });
                    if (m !== false) {
                        this.value(f)
                    }
                }
            }
        },
        _stop: function(f, e) {
            var d = {
                handle: this.handles[e],
                value: this.value()
            };
            if (this.options.values && this.options.values.length) {
                d.value = this.values(e);
                d.values = this.values()
            }
            this._trigger("stop", f, d)
        },
        _change: function(f, e) {
            if (!this._keySliding && !this._mouseSliding) {
                var d = {
                    handle: this.handles[e],
                    value: this.value()
                };
                if (this.options.values && this.options.values.length) {
                    d.value = this.values(e);
                    d.values = this.values()
                }
                this._trigger("change", f, d)
            }
        },
        value: function(d) {
            if (arguments.length) {
                this.options.value = this._trimAlignValue(d);
                this._refreshValue();
                this._change(null, 0);
                return
            }
            return this._value()
        },
        values: function(e, h) {
            var g, d, f;
            if (arguments.length > 1) {
                this.options.values[e] = this._trimAlignValue(h);
                this._refreshValue();
                this._change(null, e);
                return
            }
            if (arguments.length) {
                if (b.isArray(arguments[0])) {
                    g = this.options.values;
                    d = arguments[0];
                    for (f = 0; f < g.length; f += 1) {
                        g[f] = this._trimAlignValue(d[f]);
                        this._change(null, f)
                    }
                    this._refreshValue()
                } else {
                    if (this.options.values && this.options.values.length) {
                        return this._values(e)
                    } else {
                        return this.value()
                    }
                }
            } else {
                return this._values()
            }
        },
        _setOption: function(e, f) {
            var d, g = 0;
            if (b.isArray(this.options.values)) {
                g = this.options.values.length
            }
            b.Widget.prototype._setOption.apply(this, arguments);
            switch (e) {
            case "disabled":
                if (f) {
                    this.handles.filter(".ui-state-focus").blur();
                    this.handles.removeClass("ui-state-hover");
                    this.handles.propAttr("disabled", true);
                    this.element.addClass("ui-disabled")
                } else {
                    this.handles.propAttr("disabled", false);
                    this.element.removeClass("ui-disabled")
                }
                break;
            case "orientation":
                this._detectOrientation();
                this.element.removeClass("ui-slider-horizontal ui-slider-vertical").addClass("ui-slider-" + this.orientation);
                this._refreshValue();
                break;
            case "value":
                this._animateOff = true;
                this._refreshValue();
                this._change(null, 0);
                this._animateOff = false;
                break;
            case "values":
                this._animateOff = true;
                this._refreshValue();
                for (d = 0; d < g; d += 1) {
                    this._change(null, d)
                }
                this._animateOff = false;
                break
            }
        },
        _value: function() {
            var d = this.options.value;
            d = this._trimAlignValue(d);
            return d
        },
        _values: function(d) {
            var g, f, e;
            if (arguments.length) {
                g = this.options.values[d];
                g = this._trimAlignValue(g);
                return g
            } else {
                f = this.options.values.slice();
                for (e = 0; e < f.length; e += 1) {
                    f[e] = this._trimAlignValue(f[e])
                }
                return f
            }
        },
        _trimAlignValue: function(g) {
            if (g <= this._valueMin()) {
                return this._valueMin()
            }
            if (g >= this._valueMax()) {
                return this._valueMax()
            }
            var d = (this.options.step > 0) ? this.options.step: 1,
            f = (g - this._valueMin()) % d,
            e = g - f;
            if (Math.abs(f) * 2 >= d) {
                e += (f > 0) ? d: ( - d)
            }
            return parseFloat(e.toFixed(5))
        },
        _valueMin: function() {
            return this.options.min
        },
        _valueMax: function() {
            return this.options.max
        },
        _refreshValue: function() {
            var g = this.options.range,
            f = this.options,
            r = this,
            e = (!this._animateOff) ? f.animate: false,
            h,
            d = {},
            m,
            p,
            n,
            q;
            if (this.options.values && this.options.values.length) {
                this.handles.each(function(s, o) {
                    h = (r.values(s) - r._valueMin()) / (r._valueMax() - r._valueMin()) * 100;
                    d[r.orientation === "horizontal" ? "left": "bottom"] = h + "%";
                    b(this).stop(1, 1)[e ? "animate": "css"](d, f.animate);
                    if (r.options.range === true) {
                        if (r.orientation === "horizontal") {
                            if (s === 0) {
                                r.range.stop(1, 1)[e ? "animate": "css"]({
                                    left: h + "%"
                                },
                                f.animate)
                            }
                            if (s === 1) {
                                r.range[e ? "animate": "css"]({
                                    width: (h - m) + "%"
                                },
                                {
                                    queue: false,
                                    duration: f.animate
                                })
                            }
                        } else {
                            if (s === 0) {
                                r.range.stop(1, 1)[e ? "animate": "css"]({
                                    bottom: (h) + "%"
                                },
                                f.animate)
                            }
                            if (s === 1) {
                                r.range[e ? "animate": "css"]({
                                    height: (h - m) + "%"
                                },
                                {
                                    queue: false,
                                    duration: f.animate
                                })
                            }
                        }
                    }
                    m = h
                })
            } else {
                p = this.value();
                n = this._valueMin();
                q = this._valueMax();
                h = (q !== n) ? (p - n) / (q - n) * 100 : 0;
                d[r.orientation === "horizontal" ? "left": "bottom"] = h + "%";
                this.handle.stop(1, 1)[e ? "animate": "css"](d, f.animate);
                if (g === "min" && this.orientation === "horizontal") {
                    this.range.stop(1, 1)[e ? "animate": "css"]({
                        width: h + "%"
                    },
                    f.animate)
                }
                if (g === "max" && this.orientation === "horizontal") {
                    this.range[e ? "animate": "css"]({
                        width: (100 - h) + "%"
                    },
                    {
                        queue: false,
                        duration: f.animate
                    })
                }
                if (g === "min" && this.orientation === "vertical") {
                    this.range.stop(1, 1)[e ? "animate": "css"]({
                        height: h + "%"
                    },
                    f.animate)
                }
                if (g === "max" && this.orientation === "vertical") {
                    this.range[e ? "animate": "css"]({
                        height: (100 - h) + "%"
                    },
                    {
                        queue: false,
                        duration: f.animate
                    })
                }
            }
        }
    });
    b.extend(b.ui.slider, {
        version: "@VERSION"
    })
} (jQuery));