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