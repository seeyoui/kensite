function getSkin() {
	return getCookie('current-skin');
}

function setSkin(skin) {
	var skin_name = skin ? (' skin-'+skin) : '';
	var body_classes = public_vars.$body.attr('class').replace(/skin-[a-z]+/i, '');
	public_vars.$body.attr('class', body_classes).addClass(skin_name);
	setCookie('current-skin', skin);
}

function initSkin() {
	var skin = getSkin();
	setSkin(skin);
}

function cleanSkin() {
	var body_classes = public_vars.$body.attr('class').replace(/(\sskin-[a-z]+)/gi, '').replace(/(\shorizontal-menu-skin-[a-z]+)/gi, '').replace(/(\suser-info-navbar-skin-[a-z]+)/gi, '');
	public_vars.$body.attr('class', body_classes);
	setCookie('current-skin', '');
	setCookie('current-horizontal-skin', '');
	setCookie('current-user-info-navbar-skin', '');
}