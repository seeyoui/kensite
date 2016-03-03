package com.seeyoui.kensite.weixin.message.event;

public class WXMenuEvent extends WXBaseEvent {
	private String EventKey;

	public String getEventKey() {
		return EventKey;
	}

	public void setEventKey(String eventKey) {
		EventKey = eventKey;
	}
}
