package com.seeyoui.kensite.weixin.message.resp;

public class WXVoiceMessageResp extends WXBaseMessageResp {
	private WXVoiceResp Voice;

	public WXVoiceResp getVoice() {
		return Voice;
	}

	public void setVoice(WXVoiceResp voice) {
		Voice = voice;
	}
}
