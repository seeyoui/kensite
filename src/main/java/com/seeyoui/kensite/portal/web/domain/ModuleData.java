package com.seeyoui.kensite.portal.web.domain;

public class ModuleData {
	private int id;
	private String name;
	private boolean valid;//有效
	private boolean global;//整体
	private boolean special;//特殊
	private boolean cus;
	private int style;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public boolean isValid() {
		return valid;
	}
	public void setValid(boolean valid) {
		this.valid = valid;
	}
	public boolean isGlobal() {
		return global;
	}
	public void setGlobal(boolean global) {
		this.global = global;
	}
	public boolean isSpecial() {
		return special;
	}
	public void setSpecial(boolean special) {
		this.special = special;
	}
	public boolean isCus() {
		return cus;
	}
	public void setCus(boolean cus) {
		this.cus = cus;
	}
	public int getStyle() {
		return style;
	}
	public void setStyle(int style) {
		this.style = style;
	}
	
}
