/*!
 * testBrowser
 * Create time @2015-09-22
 */
(function(){var b=document.getElementById("guideLowBrowser");var a=c(navigator.userAgent);var d={};if(a.browser){d[a.browser]=true;d.version=a.version}if(d.msie&&d.version=="7.0"){b.src="http://"+_portalHost+"/guideLowBrowser.jsp";b.style.display="block"}function c(f){f=f.toLowerCase();var e=/(chrome)[ \/]([\w.]+)/.exec(f)||/(webkit)[ \/]([\w.]+)/.exec(f)||/(opera)(?:.*version|)[ \/]([\w.]+)/.exec(f)||/(msie) ([\w.]+)/.exec(f)||f.indexOf("compatible")<0&&/(mozilla)(?:.*? rv:([\w.]+)|)/.exec(f)||[];return{browser:e[1]||"",version:e[2]||"0"}}})();