package com.seeyoui.kensite.weixin.pojo;

/**
 * 复杂按钮（父按钮）
 * 
 * @author cuichen
 * @date 2016-02-29
 */
public class WXComplexButton extends WXButton {
	private WXButton[] sub_button;

	public WXButton[] getSub_button() {
		return sub_button;
	}

	public void setSub_button(WXButton[] sub_button) {
		this.sub_button = sub_button;
	}
}