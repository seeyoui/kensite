Site.photoSlide={Func:{},Options:{},Plugins:{},Tool:{},PhotoSlide:{}};(function(d,g){var a="closeBtn",e,j,h,f=false;var b={init:function(l,k){e=g.Options["module"+l];j=e.pluginsOptions;h=j[a];f=true},create:function(){if(!!!f||!!!h.on){return}d("#"+e.photoSlideId).find(".J_top").append("<div id='"+e.photoSlideId+"_close' class='close'></div>");c()}};function c(){d("#"+e.photoSlideId+"_close").bind("click.photoSlide",function(){g.Func.close(e.moduleId)})}g.Plugins[a]=b})(jQuery,Site.photoSlide);(function(d,g){var b="prevBtn",e,k,j,a,f=false;var h={init:function(m,l){e=g.Options["module"+m];k=e.pluginsOptions;j=k[b];a=e.photoSlideId+"_prev";f=true},create:function(){if(!!!f||!!!j.on){return}d("#"+e.photoSlideId).find(".J_photoList").before("<div id='"+a+"' class='photoSlidebutton prev'></div>");var m=g.Tool.calcCenterLine("V",e.moduleId,d("#"+a));var l=g.Options.pubOption._panelPaddingLeft;d("#"+a).css({top:m+"px",left:l+"px"});c()},show:function(){d("#"+e.photoSlideId).find("#"+a).show()},hide:function(){d("#"+e.photoSlideId).find("#"+a).hide()}};function c(){d("#"+e.photoSlideId+"_prev").off(".photoSlide");d("#"+e.photoSlideId+"_prev").on("click.photoSlide",function(){var l=d("#"+e.photoSlideId).find(".J_photoList .select");var m=d(l).prev();var n=d(m).attr("id");e.photoSlide.changePhoto(n,e.moduleId)}).on("mouseenter.photoSlide",function(){d(this).addClass("prev_hover")}).on("mouseleave.photoSlide",function(){d(this).removeClass("prev_hover")})}g.Plugins[b]=h})(jQuery,Site.photoSlide);(function(d,h){var b="nextBtn",f,k,j,a,g=false;var e={init:function(m,l){f=h.Options["module"+m];k=f.pluginsOptions;j=k[b];a=f.photoSlideId+"_next";g=true},create:function(){if(!!!g||!!!j.on){return}d("#"+f.photoSlideId).find(".J_photoList").after("<div id='"+a+"' class='photoSlidebutton next'></div>");var m=h.Tool.calcCenterLine("V",f.moduleId,d("#"+a));var l=h.Options.pubOption._panelPaddingLeft;d("#"+a).css({top:m+"px",right:l+"px"});c()},show:function(){d("#"+f.photoSlideId).find("#"+a).show()},hide:function(){d("#"+f.photoSlideId).find("#"+a).hide()}};function c(){d("#"+f.photoSlideId+"_next").off(".photoSlide");d("#"+f.photoSlideId+"_next").on("click.photoSlide",function(){var m=d("#"+f.photoSlideId).find(".J_photoList .select");var n=d(m).next();var l=d(n).attr("id");f.photoSlide.changePhoto(l,f.moduleId)}).on("mouseenter.photoSlide",function(){d(this).addClass("next_hover")}).on("mouseleave.photoSlide",function(){d(this).removeClass("next_hover")})}h.Plugins[b]=e})(jQuery,Site.photoSlide);(function(e,h){var c="descPanel",b,a,f,g=false;var d={init:function(k,j){b=h.Options["module"+k];a=b.pluginsOptions;f=a[c];g=true},create:function(){if(!!!g||!!!f.on){return}var j=[];j.push("<div class='photoInfo'>");j.push("<span class='photoName'>");j.push("</span><span class='nowPage'>");j.push("</span><span class='pageTotal'></span>");j.push("</div>");j.push("<p class='photoDesc'></p>");e("#"+b.photoSlideId).find(".J_bottom").append(j.join(""))},edit:function(m,k,j,n,l){e("#"+b.photoSlideId).find(".photoInfo .photoName").text(k);e("#"+b.photoSlideId).find(".photoDesc").text(j);e("#"+b.photoSlideId).find(".photoInfo .nowPage").text(n);e("#"+b.photoSlideId).find(".photoInfo .pageTotal").text("/"+l)},setPanelStyle:function(k,j){e("#"+b.photoSlideId).find(k).css(j)}};h.Plugins[c]=d})(jQuery,Site.photoSlide);(function(j,l){var m={BSINMax:2,BSIN:0,positionStart:195,positionBase:95,photoWidthStart:250,photoHeightStart:300,photoSizeBase:100,animateEasing:500},q,d,f,k=false;var a={init:function(s){var r="module"+s;q=l.Options[r];f=q.photoSlideId;m.BSIN=g(r);k=true},create:function(s,r){d=r;c(s);b(s);e(s)},changePhoto:function(w,s){d=w;var v=j("#"+f).find(".photoImg").is(":animated");var x=j("#"+f).find(".J_photoList .select");var z=j("#"+d);if(z.length==0||j(z).hasClass("select")){return}if(v){return}j(x).removeClass("select");j(z).addClass("select");h(z,s);var y=m.photoWidthStart;var C=m.photoHeightStart;var u=m.photoSizeBase;var r=m.BSIN;var t=j("#"+f).find("#"+q.photoSlideId+"_close").height();var B=j("#"+f).find(".photoSlidebutton").width();var A=j("#"+f).find(".J_photoList .photoImg");j.each(A,function(I,E){var D=j(E).hasClass("select");var G=p(E,r);var W=m.positionStart;var F=m.positionBase;var T=parseInt(j(E).attr("data-width"));var O=parseInt(j(E).attr("data-height"));var J=Math.abs(G-r);var Q=10;if(D){Q=20;var K=n(T,O,s,Q);T=K.photoWidth;O=K.photoHeight}if(G>0){T=y-(u*(G-1));O=C-(u*(G-1))}var R=l.Tool.calcCenterLine("V",s,O);var U=l.Tool.calcCenterLine("H",s,T);if(D){var X=parseInt(j(E).attr("data-index"));var L=q.photoDataList[X];l.Plugins.descPanel.edit(s,L.name,L.basic,X+1,q.photoDataList.length);j(E).find(".shade").remove()}else{var N=j("#"+f).find(".J_photoList .select");var Y=parseInt(j(N).attr("data-width"));var V=parseInt(j(N).attr("data-height"));var K=n(Y,V,s,20);Y=K.photoWidth;var M=l.Tool.calcCenterLine("H",s,Y);var S=j(E).nextAll(".select").length>0?true:false;if(S){U=M;for(var P=G;P;P--){U-=W;W-=F}}else{U=M+Y;for(var P=G;P;P--){U+=W;W-=F}U-=T}if(j(E).find(".shade").length==0){j(E).find("img").before("<div class='shade'></div>")}}var H="default";if(G==1){H="pointer"}j(E).css({zIndex:J,cursor:H});j(E).stop().animate({width:T+Q+"px",height:O+Q+"px",top:R+"px",left:U+"px"},500,"swing",function(){j(this).fadeIn(200,"linear")});j(E).find("img").stop().animate({width:T+"px",height:O+"px",opacity:1},500,"swing",function(){j(this).fadeIn(200,"linear")})})},imageFadeIn:function(s){var t="photoSlide_"+s;var r=j("#"+t).find(".J_photoList .select");j(r).fadeIn(100,"linear",function(){var v=j(r).prev();var u=j(r).next();j(v).fadeIn(100,"linear",function(){v=j(this).prev();j(v).fadeIn(100,"linear")});j(u).fadeIn(100,"linear",function(){u=j(this).next();j(u).fadeIn(100,"linear")})})}};function c(v){var A=q.photoDataList;var r=m.BSIN;var y=[];var u=0;var w=0;var B=0;var s=[];for(var x=0;x<(A.length);x++){var z=A[x];if(z.id===d){B=x;u=x-r;w=x+r;if(u<0){u+=A.length}if(w>=A.length){w-=A.length}break}}if(u==w&&A.length>1){var t=Math.abs(B-r);o(v,t,y,A,s);o(v,B,y,A,s);o(v,t,y,A,s)}else{for(var x=u;x!=w;x++){if(x==A.length){x=-1}else{o(v,x,y,A,s)}}o(v,w,y,A,s)}j("#"+f).find(".J_photoList").append(y.join(""));l.Tool.checkImgLoad(s,v,null)}function b(v){var r=m.photoWidthStart;var x=m.photoHeightStart;var s=m.photoSizeBase;var y=m.BSIN;var u=j("#"+f).find(".J_photoList .photoImg");var w=j("#"+f).find("#"+q.photoSlideId+"_close").height();var t=j("#"+f).find(".photoSlidebutton").width();j.each(u,function(F,B){var A=j(B).hasClass("select");var U=m.positionStart;var C=m.positionBase;var S=parseInt(j(B).attr("data-width"));var M=parseInt(j(B).attr("data-height"));var D=p(B,y);var H=Math.abs(D-y);var P=10;var z=false;var K=false;if(D>0){S=r-(s*(D-1));M=x-(s*(D-1))}if(A){P=20;var J=n(S,M,v,P);S=J.photoWidth;M=J.photoHeight}var Q=l.Tool.calcCenterLine("V",v,M);var T=l.Tool.calcCenterLine("H",v,S);if(!A){var I=j("#"+f).find(".J_photoList .select");var N=parseInt(j(I).attr("data-width"));var L=parseInt(j(I).attr("data-height"));var J=n(N,L,v,20);N=J.photoWidth;var G=l.Tool.calcCenterLine("H",v,N);var R=j(B).nextAll(".select").length>0?true:false;if(R){T=G;for(var O=D;O;O--){T-=U;U-=C}}else{T=G+N;for(var O=D;O;O--){T+=U;U-=C}T-=S-P}}var E="default";if(D==1){E="pointer"}j(B).css({width:S+P+"px",height:M+P+"px",top:Q+"px",left:T+"px","z-index":H,cursor:E});j(B).find("img").css({width:S+"px",height:M+"px"})})}function e(r){j("#"+f).find(".photoImg").off(".photoSlide");j("#"+f).find(".photoImg").on("click.photoSlide",function(){var s=j(this).attr("id");var t=p(j(this),m.BSIN);if(t>1){return}a.changePhoto(s,r)})}function o(t,s,x,r,w){var v=r[s];var u=d==v.id;if(u){x.push("<div id='photo"+v.id+"' class='photoImg select' data-width="+v.picWidth+" data-height="+v.picHeight+" data-index="+s+">");x.push("<img src="+v.picPath+" alt="+Fai.encodeHtml(v.name)+" />");x.push("</div>");l.Plugins.descPanel.edit(t,v.name,v.basic,s+1,r.length)}else{x.push("<div id='photo"+v.id+"' class='photoImg' data-width="+v.picWidth+" data-height="+v.picHeight+" data-index="+s+">");x.push("<div class='shade'></div>");x.push("<img src="+v.picPath+" alt="+Fai.encodeHtml(v.name)+" />");x.push("</div>")}w.push(v.picPath)}function h(D,r){var t=j(D).prevAll();var y=j(D).nextAll();var u=0;var w=[];var x=t.length;var E=j(t).last();if(x==0){E=j(D)}var A=[];var C=parseInt(j(E).attr("data-index"));if(x<m.BSIN){u=m.BSIN-x;for(var v=u;v>0;v--){if(C==0){C=q.photoDataList.length}var s=C-v;var B=q.photoDataList[s];if(typeof B=="undefined"){continue}A.push("<div id='photo"+B.id+"' class='photoImg' data-width="+B.picWidth+" data-height="+B.picHeight+" data-index="+s+">");A.push("<div class='shade'></div>");A.push("<img src="+B.picPath+" alt="+Fai.encodeHtml(B.name)+" />");A.push("</div>");w.push(B.picPath)}j(E).before(A.join(""))}else{if(x>m.BSIN){u=x-m.BSIN;for(var v=0;v<u;v++){j(E).remove();t=j(D).prevAll();E=j(t).last()}}}var z=y.length;var E=j(y).last();if(z==0){E=j(D)}var A=[];var C=parseInt(j(E).attr("data-index"));if(z<m.BSIN){u=m.BSIN-z;for(var v=1;v<=u;v++){if(C==q.photoDataList.length-1){C=-1}var s=C+v;var B=q.photoDataList[s];if(typeof B=="undefined"){continue}A.push("<div id='photo"+B.id+"' class='photoImg' data-width="+B.picWidth+" data-height="+B.picHeight+" data-index="+s+">");A.push("<div class='shade'></div>");A.push("<img src="+B.picPath+" alt="+Fai.encodeHtml(B.name)+" />");A.push("</div>");w.push(B.picPath)}j(E).after(A.join(""))}else{if(z>m.BSIN){u=z-m.BSIN;for(var v=0;v<u;v++){j(E).remove();y=j(D).nextAll();E=j(y).last()}}}e(r);l.Tool.checkImgLoad(w,r,null)}function g(u){var r=(window.innerWidth||document.documentElement.clientWidth||document.body.clientWidth)-140-120;var s=0;var t=5;while(s<m.BSINMax&&((r-t)>760)){t+=m.positionBase;s++}if(s==0||l.Options[u].photoDataList.length<5){s=1}return s}function p(t,x){var v=j(t).hasClass("select");if(v){return 0}var u=j(t).prevAll(".select").length>0;var w=0;if(u){var r=j(t).prevAll("");j.each(r,function(z,y){w++;if(j(y).hasClass("select")){return false}})}else{var s=j(t).nextAll("");j.each(s,function(z,y){w++;if(j(y).hasClass("select")){return false}})}return w}function n(y,x,s,u){var t=l.Options.pubOption;var z=t._panelWidth-(t._panelPaddingLeft*2)-120;var B=t._panelHeight-(t._panelPaddingTop*2);var r=m.positionStart;var w={photoWidth:y,photoHeight:x};for(var v=0;v<=m.BSIN;v++){z=(z-r*2)-10;B-=10;r-=m.positionBase}if(y>x){var A=x/y;if(y>z){w.photoWidth=z;w.photoHeight=A*w.photoWidth}}else{if(y<x){var A=y/x;if(x>B){w.photoHeight=B;w.photoWidth=A*w.photoHeight}}else{if(y==x){if(y>z){w.photoWidth=z;w.photoHeight=z}}}}w.photoWidth-=u;w.photoHeight-=u;return w}l.PhotoSlide.annular=a})(jQuery,Site.photoSlide);(function(g,l){var n,k,d,e=1,r=(Fai.isIE()?259:260),b=112,h;var j={init:function(t){d=l.Options["module"+t];n=d.photoSlideId},create:function(u,t){k=t;f(u);o(u);p(u);l.Plugins.descPanel.setPanelStyle(".photoInfo",{"margin-top":"54px"})},changePhoto:function(u,x){var w=g("#"+n).find(".photoImg").is(":animated");var y=g("#"+n).find("#"+u).hasClass("select");if(w||y||!!!u){return}g("#"+n).find(".J_photoList .select").removeClass("select");g("#"+n).find("#"+u).addClass("select");var v=parseInt(g("#"+n).find(".J_photoList .select").attr("data-index"));var t=d.photoDataList[v];l.Plugins.descPanel.edit(x,t.name,t.basic,v+1,d.photoDataList.length);var A=g("#"+n).find(".J_photoList .photoImg");var z=m(x,n);g.each(A,function(F,B){var E=g(B).hasClass("select");var J=g(B).next().hasClass("select");var I=g(B).width();var G=g(B).find("img").width();var C=g(B).find("img").height();var D=(J||E)?8:5;if(E){I=parseInt(g(B).attr("data-width"));G=I;C=parseInt(g(B).attr("data-height"));s(B)}else{if(C!=b){var H=c(B);I=H.width;G=H.width;C=H.height}}g(B).stop().animate({width:I+"px",left:z+"px"});g(B).find("img").stop().animate({width:G+"px",height:C+"px"});g(B).find(".photoRef").stop().animate({width:G+"px",height:C+"px",bottom:r-C+"px"});z+=(I+D)})},imageFadeIn:function(){}};function f(v){var u=[];var t=d.photoDataList;h=[];g.each(t,function(x,z){var w="";if(z.id==k){l.Plugins.descPanel.edit(v,z.name,z.basic,x+1,t.length);w="select"}var y={};y=q(z.picWidth,z.picHeight);u.push("<div id='photo"+z.id+"' class='photoImg "+w+"' data-width='"+y.width+"' data-height='"+y.height+"' data-index="+x+">");u.push("<img class='photoImgTag' src="+z.picPath+" alt="+Fai.encodeHtml(z.name)+" />");u.push("</div>");h.push(z.picPath)});g("#"+n).find(".J_photoList").append(u.join(""));s(g("#"+n).find(".J_photoList .select"))}function o(t){var x=g("#"+n).find(".J_photoList .photoImg");var w=g("#"+n+"_close").height();var z=l.Options.pubOption._panelHeight;var A,B,y,v;g.each(x,function(C,F){var E=g(F).hasClass("select");var D=c(F);A=y=D.width;B=z;v=D.height;if(E){A=y=parseInt(g(F).attr("data-width"));v=parseInt(g(F).attr("data-height"))}g(F).css({width:A,height:B});g(F).find(".photoImgTag").css({width:y,height:v+"px"})});var u=m(t,n);g.each(x,function(E,H){var G=g(H).hasClass("select");var D=g(H).next().hasClass("select");var C=g(H).width();var F=(D||G)?8:5;g(H).css({width:C,left:u+"px"});u+=(C+F)});l.Tool.checkImgLoad(h,t,a)}function p(t){g("#"+n).find(".J_photoList .photoImg .photoImgTag").off(".photoSlide");g("#"+n).find(".J_photoList .photoImg .photoImgTag").on("click.photoSlide",function(){var u=g(this).parent(".photoImg").attr("id");j.changePhoto(u,t)})}function c(u){var w={width:0,height:0},x=parseInt(g(u).attr("data-width")),t=parseInt(g(u).attr("data-height")),v=x/t;w.width=v*b;w.height=b;return w}function m(v,u){var E=g("#"+u).find(".J_photoList .select");var z=parseInt(g(E).attr("data-width"));var y=l.Tool.calcCenterLine("H",v,z);var C=g(E).prevAll();for(var B=0;B<C.length;B++){var t=C[B];var F=g(t).width();var x=g(t).find(".photoImgTag").height();var G=g(t).next().hasClass("select");var A=g(t).hasClass("select");var w=G?8:5;if(!A&&(x!=b)){var D=c(t);F=D.width}y-=(F+w)}return y}function a(){var B=g("#"+n).find(".J_photoList .photoImg .photoImgTag");for(i=0;i<B.length;i++){var E=B[i];var t=g(E).parent();var z=parseInt(g(t).attr("data-width"));var F=parseInt(g(t).attr("data-height"));var C=g(E).width();var x=g(E).height();var y=C;var A=Math.floor(x*e);if(Fai.isIE6()||Fai.isIE7()||Fai.isIE8()||Fai.isIE9()){var w=document.createElement("img");w.src=E.src;w.className="photoRef";w.style.width=z+"px";w.style.display="block";w.style.height=F+"px";w.style.filter="flipv progid:DXImageTransform.Microsoft.Alpha(opacity=80, style=1, finishOpacity=0, startx=0, starty=0, finishx=0, finishy="+F+")";g(t).append(w)}else{var v=document.createElement("canvas");if(v.getContext){var u=v.getContext("2d");v.className="photoRef";v.width=z;v.height=F;g(t).append(v);u.save();u.translate(0,F-1);u.scale(1,-1);u.drawImage(E,0,0,z,F);u.restore();u.globalCompositeOperation="destination-out";var D=u.createLinearGradient(0,0,0,F);D.addColorStop(0,"rgba(255, 255, 255, 0)");D.addColorStop(1,"rgba(255, 255, 255, 1)");u.fillStyle=D;u.rect(0,0,z,F);u.fill()}}g(t).find(".photoRef").css({position:"absolute",bottom:r-A+"px",width:y+"px",height:A+"px"})}}function q(z,t){var w=l.Options.pubOption._panelWidth-470;var u=l.Options.pubOption._panelHeight-311;var v=600;var x=0;var y={width:z,height:t};if(z>t&&z>w){x=t/z;y.width=w;y.height=x*w}else{if(t>z&&t>u){x=z/t;y.width=x*u;y.height=u}else{if(t>v||z>v){y.width=v;y.height=v}}}return y}function s(u){var t=g(u).prev().length==0;var v=g(u).next().length==0;if(t){l.Plugins.nextBtn.show();l.Plugins.prevBtn.hide();return}if(v){l.Plugins.prevBtn.show();l.Plugins.nextBtn.hide();return}l.Plugins.prevBtn.show();l.Plugins.nextBtn.show()}l.PhotoSlide.horizontal=j})(jQuery,Site.photoSlide);(function(a,b){b.Func.init=function(f,d,h){var j="module"+f;var m="photoSlide_"+f;var e;c();b["photoSlideInit"+f]=true;function c(){var q={moduleId:f,photoSlideId:m,photoSlideType:-1,photoDataList:{},photoSlide:{},pluginsOptions:{closeBtn:{on:true,arg:{}},prevBtn:{on:true,arg:{}},nextBtn:{on:true,arg:{}},descPanel:{on:true,arg:{}}},loadImgCount:0};if(h){var p={};a.ajax({type:"get",url:"ajax/getPhotoData_h.jsp?groupId="+h+"&cmd=getPhotoData",success:function(r){var r=jQuery.parseJSON(r);if(r&&r.success){if(r.info!=null){p=r.info}}b.Options[j]=a.extend({},q,p);n()}})}else{b.Options[j]=a.extend({},q,Fai.top["photoSlideTmp"+f]);n()}}function n(){switch(b.Options[j].photoSlideType){case 0:b.Options[j].photoSlide=b.PhotoSlide.annular;b.Options[j].photoSlide.init(f);break;case 1:b.Options[j].photoSlide=b.PhotoSlide.horizontal;b.Options[j].photoSlide.init(f);break}var p={windowWidth:window.innerWidth||document.documentElement.clientWidth||document.body.clientWidth,windowHeight:window.innerHeight||document.documentElement.clientHeight||document.body.clientHeight,_panelWidth:window.innerWidth||document.documentElement.clientWidth||document.body.clientWidth,_panelHeight:window.innerHeight||document.documentElement.clientHeight||document.body.clientHeight,_panelPaddingTop:70,_panelPaddingLeft:55,_bottomMaxWidth:1400};if(p.windowHeight<=800){p._panelPaddingTop=55}b.Options.pubOption=p;if(!!!d){d=b.Options[j].photoDataList[0].id}g();l();k();o();var q=b.Options["module"+f];a("#"+q.photoSlideId).stop(true,true).fadeIn(500,function(){a("#photoSlideShade").remove();a("#"+q.photoSlideId).find(".J_middle").show();a("#"+q.photoSlideId).find(".J_bottom").show();b.Options["module"+f].photoSlide.imageFadeIn(f)})}function g(){var p=b.Options[j].pluginsOptions;a.each(p,function(r,q){if(!q.on){return false}b.Plugins[r].init(f,q.arg)})}function l(){var p=[];p.push("<div id="+m+" class='photoSlidePanel'>");p.push("<div class='J_top top'></div>");p.push("<div class='J_middle middle'>");p.push("<div class='J_photoList photoList_"+b.Options[j].photoSlideType+"'></div>");p.push("</div>");p.push("<div class='J_bottom bottom'></div>");p.push("</div>");a("body").append(p.join(""));a.each(b.Plugins,function(q,r){r.create()});b.Options[j].photoSlide.create(f,d)}function k(){var u=b.Options.pubOption;var q=b.Options[j].photoSlideType;var w=a("#"+m+"_close").height();var s={width:u._panelWidth+"px",height:u._panelHeight+"px"};var v={top:u._panelPaddingTop+"px ",right:u._panelPaddingLeft+15+"px"};var r={width:u._panelWidth,height:u._panelHeight};var t={width:u._panelWidth,height:u._panelHeight};var p={width:(u._panelWidth-(u._panelPaddingLeft*2)),bottom:"0px"};if(p.width>u._bottomMaxWidth){p.width=u._bottomMaxWidth}if(q==1){p.width=u._panelWidth;p.left=0;p.height="260px"}p.left=b.Tool.calcCenterLine("H",f,p.width);a("#"+m).css(s);a("#"+m).find(".J_top").css(v);a("#"+m).find(".J_middle").css(r);a("#"+m).find(".J_photoList").css(t);a("#"+m).find(".J_bottom").css(p)}function o(){a(window).off(".photoSlide");a(window).on("resize.photoSlide",function(){if(a("#photoSlideShade").length==0){a("body").append("<div id='photoSlideShade' style='width: 100%; height: 100%; position: absolute; top: 0px; left: 0px;background-color: #000;z-index: 10000;'></div>")}if(a("#"+m).is(":animated")){clearTimeout(e)}e=setTimeout(function(){var q=a("#"+m).find(".select").attr("id");if(typeof q!="undefined"){var p=parseInt(q.replace("photo",""));b.Func.reOpen(f,p)}},60)})}};b.Func.open=function(e,c,d){a(window).scrollLeft(0);b.Func.init(e,c,d)};b.Func.reOpen=function(e,c){var d=b.Options["module"+e];a("#"+d.photoSlideId).find(".J_middle").remove();a("#"+d.photoSlideId).find(".J_bottom").remove();a("#"+d.photoSlideId).remove();a(window).off(".photoSlide");b["photoSlideInit"+e]=false;b.Func.open(e,c)};b.Func.close=function(d){var c=b.Options["module"+d];a(window).off(".photoSlide");if(!Fai.top._manageMode){a("body").removeClass("closeBodyScoll");a("#g_main").removeClass("g_mainManage closeBodyScoll")}a("#"+c.photoSlideId).find(".J_middle").remove();a("#"+c.photoSlideId).find(".J_bottom").remove();a("#"+c.photoSlideId).stop(true,true).fadeOut(500,function(){a(this).remove()})};b.Tool.calcCenterLine=function(f,h,d){var k="photoSlide_"+h;var g=b.Options.pubOption;var c=0;var e=0;var j;if(f=="V"){c=g._panelHeight;if(typeof d==="object"){d=a(d).height()}}else{if(f=="H"){c=g._panelWidth;if(typeof d==="object"){d=a(d).width()}}}return(c/2)-(d/2)};b.Tool.checkImgLoad=function(c,f,h){var e="photoSlide_"+f;var j=b.Options.pubOption;var g=false;for(var l=0;l<c.length;l++){var d=new Image();d.src=c[l];if(!d.complete){g=true}}if(g){var k=b.Options["module"+f].loadImgCount;var m=b.Tool.calcCenterLine("V",f,103);a("#"+e).append("<div class='loading' style='width: "+j._panelWidth+"px; height: "+j._panelHeight+"px; '><div class='loadImg' style='margin-top: "+m+"px;'></div></div>");for(var l=0;l<c.length;l++){var d=new Image();if(Fai.isIE()){d.onload=function(){k++;if(k==c.length){a("#"+e).find(".loading").remove();if(h){h()}}};d.src=c[l]}else{d.src=c[l];a(d).load(function(){k++;if(k==c.length){a("#"+e).find(".loading").remove();if(h){h()}}})}}}else{if(h){h()}}}})(jQuery,Site.photoSlide);