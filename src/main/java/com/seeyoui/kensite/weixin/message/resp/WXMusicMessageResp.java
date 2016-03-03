package com.seeyoui.kensite.weixin.message.resp;

public class WXMusicMessageResp extends WXBaseMessageResp {
	private WXMusicResp Music;

	public WXMusicResp getMusic() {
		return Music;
	}

	public void setMusic(WXMusicResp music) {
		Music = music;
	}
}
