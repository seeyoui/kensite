package com.seeyoui.kensite.weixin.message.event;

public class WXQRCodeEvent extends WXBaseEvent {
	private String EventKey;
	private String Ticket;

	public String getEventKey() {
		return EventKey;
	}

	public void setEventKey(String eventKey) {
		EventKey = eventKey;
	}

	public String getTicket() {
		return Ticket;
	}

	public void setTicket(String ticket) {
		Ticket = ticket;
	}
}
