function getTheme() {
	return getCookie('current-theme');
}

function setTheme(theme) {
	var theme_name = theme ? (' skin-'+theme) : '';
	var body_classes = public_vars.$body.attr('class').replace(/skin-[a-z]+/i, '');
	public_vars.$body.attr('class', body_classes).addClass(theme_name);
	setCookie('current-theme', theme);
}

function initTheme() {
	var theme = getTheme();
	setTheme(theme);
}

function cleanTheme() {
	var body_classes = public_vars.$body.attr('class').replace(/(\sskin-[a-z]+)/gi, '').replace(/(\shorizontal-menu-skin-[a-z]+)/gi, '').replace(/(\suser-info-navbar-skin-[a-z]+)/gi, '');
	public_vars.$body.attr('class', body_classes);
	setCookie('current-theme', '');
	setCookie('current-horizontal-theme', '');
	setCookie('current-user-info-navbar-theme', '');
}

function formatDateTimeCol(val,row){
	if(val==null){
		return "";
	}
	var year = val.year+1900;
	var month = val.month+1;
	var date = val.date;
	var hours = val.hours;
	var minutes = val.minutes;
	var seconds = val.seconds;
	month = appendChar("l", month, 2, "0");
	date = appendChar("l", date, 2, "0");
	hours = appendChar("l", hours, 2, "0");
	minutes = appendChar("l", minutes, 2, "0");
	seconds = appendChar("l", seconds, 2, "0");
	return year+"-"+month+"-"+date+" "+hours+":"+minutes+":"+seconds;
}
function formatDateCol(val,row){
	if(val==null){
		return "";
	}
	var year = val.year+1900;
	var month = val.month+1;
	var date = val.date;
	return year+"-"+month+"-"+date;
}
function formatTimeCol(val,row){
	if(val==null){
		return "";
	}
	var hours = val.hours;
	var minutes = val.minutes;
	var seconds = val.seconds;
	return hours+":"+minutes+":"+seconds;
}

function appendChar(f, s, l, c) {
	s = ""+s;
	if(f = "l") {
		for(var i=s.length; i<l; i++) {
			s = c+s;
		}
	}
	if(f = "r") {
		for(var i=s.length; i<l; i++) {
			s = s+c;
		}
	}
	return s;
	
}