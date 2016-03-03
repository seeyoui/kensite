package com.seeyoui.kensite.weixin.message.resp;

public class WXImageMessageResp extends WXBaseMessageResp {
	private WXImageResp Image;

	public WXImageResp getImage() {
		return Image;
	}

	public void setImage(WXImageResp image) {
		Image = image;
	}
}
