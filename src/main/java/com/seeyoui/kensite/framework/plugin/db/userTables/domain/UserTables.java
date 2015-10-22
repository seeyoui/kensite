/*
 * Powered By cuichen
 * Since 2014 - 2015
 */
package com.seeyoui.kensite.framework.plugin.db.userTables.domain;  

import com.seeyoui.kensite.common.base.domain.DataEntity;

/**
 * UserTables
 * @author cuichen
 * @version 1.0
 * @since 1.0
 * @date 2015-10-20
 */
public class UserTables extends DataEntity<UserTables> {
	private static final long serialVersionUID = 1L;
    
	private String tableName;//tableName
	private String tablespaceName;//tablespaceName
	private String numRows;//numRows
	private String tableType;//tableType
	private String comments;//comments
	
	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
    
	public String getTableName() {
		return this.tableName;
	}
	public void setTablespaceName(String tablespaceName) {
		this.tablespaceName = tablespaceName;
	}
    
	public String getTablespaceName() {
		return this.tablespaceName;
	}
	public void setNumRows(String numRows) {
		this.numRows = numRows;
	}
    
	public String getNumRows() {
		return this.numRows;
	}

	public String getTableType() {
		return tableType;
	}

	public void setTableType(String tableType) {
		this.tableType = tableType;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}
}