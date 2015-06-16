package com.seeyoui.kensite.common.base.domain;

public class Pager {
	private int page;
	private int rows;
	private int row;
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	public int getRow() {
		return (this.page-1)*this.rows;
	}
	
}
