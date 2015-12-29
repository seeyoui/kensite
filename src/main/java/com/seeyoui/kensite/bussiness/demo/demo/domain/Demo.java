/*
 * Powered By cuichen
 * Since 2014 - 2015
 */
package com.seeyoui.kensite.bussiness.demo.demo.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.seeyoui.kensite.common.base.domain.DataEntity;
import com.seeyoui.kensite.common.util.excel.annotation.ExcelField;

/**
 * 演示
 * @author cuichen
 * @version 1.0
 * @since 1.0
 * @date 2015-12-28
 */
@JsonIgnoreProperties(ignoreUnknown = true)
public class Demo extends DataEntity<Demo> {
	private static final long serialVersionUID = 1L;

	@ExcelField(title="下拉树", type=1, align=2, sort=7, mod="BO_DEMO|TREE_ID")
	private String treeId;//下拉树

	public void setTreeId(String treeId) {
		this.treeId = treeId;
	}

	public String getTreeId() {
		return this.treeId;
	}
}