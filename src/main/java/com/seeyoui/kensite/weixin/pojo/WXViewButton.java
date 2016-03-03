package com.seeyoui.kensite.weixin.pojo;

/**
 * 普通按钮（子按钮）
 * 
 * @author cuichen
 * @date 2016-02-29
 */
public class WXViewButton extends WXButton {
	private String type;
	private String url;

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
}