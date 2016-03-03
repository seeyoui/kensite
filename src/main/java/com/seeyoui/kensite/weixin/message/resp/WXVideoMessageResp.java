package com.seeyoui.kensite.weixin.message.resp;

public class WXVideoMessageResp extends WXBaseMessageResp {
	private WXVideoResp Video;

	public WXVideoResp getVideo() {
		return Video;
	}

	public void setVideo(WXVideoResp video) {
		Video = video;
	}
}
