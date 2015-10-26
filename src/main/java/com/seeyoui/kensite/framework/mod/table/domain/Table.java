/*
 * Powered By cuichen
 * Since 2014 - 2015
 */
package com.seeyoui.kensite.framework.mod.table.domain;  

import com.seeyoui.kensite.common.base.domain.DataEntity;

/**
 * @author cuichen
 * @version 1.0
 * @since 1.0
 * @date 2015-09-22
 */
public class Table extends DataEntity<Table> {
	private static final long serialVersionUID = 5454155825314635342L;
    
	private String name;//名称
	private String oldName;//修改之前的名字
	private String comments;//描述
	private String parentTable;//关联父表
	private String parentTableFk;//关联父表外键

	public void setName(String name) {
		this.name = name;
	}
    
	public String getName() {
		return this.name;
	}

	public String getOldName() {
		return oldName;
	}

	public void setOldName(String oldName) {
		this.oldName = oldName;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}
    
	public String getComments() {
		return this.comments;
	}
	public void setParentTable(String parentTable) {
		this.parentTable = parentTable;
	}
    
	public String getParentTable() {
		return this.parentTable;
	}
	public void setParentTableFk(String parentTableFk) {
		this.parentTableFk = parentTableFk;
	}
    
	public String getParentTableFk() {
		return this.parentTableFk;
	}
}