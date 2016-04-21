/*
 * Powered By cuichen
 * Since 2014 - 2016
 */
package com.seeyoui.kensite.bussiness.demo.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.seeyoui.kensite.common.base.domain.DataEntity;
import com.seeyoui.kensite.common.util.excel.annotation.ExcelField;

/**
 * 演示
 * @author cuichen
 * @version 1.0
 * @since 1.0
 * @date 2016-04-21
 */
@JsonIgnoreProperties(ignoreUnknown = true)
public class Demo extends DataEntity<Demo> {
	private static final long serialVersionUID = 1L;

	@ExcelField(title="下拉树", type=1, align=2, sort=7, mod="BO_DEMO|TREE_ID")
	private String treeId;//下拉树
	@ExcelField(title="表达式", type=1, align=2, sort=8, mod="BO_DEMO|EXPRESSION")
	private String expression;//表达式
	@ExcelField(title="用户名", type=1, align=2, sort=9, mod="BO_DEMO|USER_NAME")
	private String userName;//用户名

	public void setTreeId(String treeId) {
		this.treeId = treeId;
	}

	public String getTreeId() {
		return this.treeId;
	}
	public void setExpression(String expression) {
		this.expression = expression;
	}

	public String getExpression() {
		return this.expression;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserName() {
		return this.userName;
	}
}