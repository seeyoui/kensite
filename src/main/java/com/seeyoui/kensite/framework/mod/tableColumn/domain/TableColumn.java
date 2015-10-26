/*
 * Powered By cuichen
 * Since 2014 - 2015
 */
package com.seeyoui.kensite.framework.mod.tableColumn.domain;  

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.seeyoui.kensite.common.base.domain.DataEntity;

/**
 * 业务表字段
 * @author cuichen
 * @version 1.0
 * @since 1.0
 * @date 2015-10-24
 */
@JsonIgnoreProperties(ignoreUnknown = true)
public class TableColumn extends DataEntity<TableColumn> {
	private static final long serialVersionUID = 1L;
    
	private String tableName;//业务表
	private String name;//列名
	private String comments;//注释
	private String jdbcType;//数据库类型及长度
	private String isPk;//是否主键
	private String isNull;//是否可为空
	private String isInsert;//是否为插入字段
	private String isEdit;//是否编辑字段
	private String isList;//是否列表字段
	private String isQuery;//是否查询字段
	private String queryType;//查询方式（等于、不等于、大于、小于、范围、左LIKE、右LIKE、左右LIKE）
	private String category;//字段生成方案
	private String sortType;//排序（升序）
	private String defaultValue;//默认值
	private String validType;//校验类型
	private String settings;//扩展设置
	private String modifyStr;//修改字符串
	private String oldName;//修改之前的名字
	private String oldTableName;//修改之前的表名字

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
    
	public String getTableName() {
		return this.tableName;
	}
	public void setName(String name) {
		this.name = name;
	}
    
	public String getName() {
		return this.name;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
    
	public String getComments() {
		return this.comments;
	}
	public void setJdbcType(String jdbcType) {
		this.jdbcType = jdbcType;
	}
    
	public String getJdbcType() {
		return this.jdbcType;
	}
	public void setIsPk(String isPk) {
		this.isPk = isPk;
	}
    
	public String getIsPk() {
		return this.isPk;
	}
	public void setIsNull(String isNull) {
		this.isNull = isNull;
	}
    
	public String getIsNull() {
		return this.isNull;
	}
	public void setIsInsert(String isInsert) {
		this.isInsert = isInsert;
	}
    
	public String getIsInsert() {
		return this.isInsert;
	}
	public void setIsEdit(String isEdit) {
		this.isEdit = isEdit;
	}
    
	public String getIsEdit() {
		return this.isEdit;
	}
	public void setIsList(String isList) {
		this.isList = isList;
	}
    
	public String getIsList() {
		return this.isList;
	}
	public void setIsQuery(String isQuery) {
		this.isQuery = isQuery;
	}
    
	public String getIsQuery() {
		return this.isQuery;
	}
	public void setQueryType(String queryType) {
		this.queryType = queryType;
	}
    
	public String getQueryType() {
		return this.queryType;
	}
	public void setCategory(String category) {
		this.category = category;
	}
    
	public String getCategory() {
		return this.category;
	}
	public void setSortType(String sortType) {
		this.sortType = sortType;
	}
    
	public String getSortType() {
		return this.sortType;
	}
	public void setDefaultValue(String defaultValue) {
		this.defaultValue = defaultValue;
	}
    
	public String getDefaultValue() {
		return this.defaultValue;
	}
	public void setValidType(String validType) {
		this.validType = validType;
	}
    
	public String getValidType() {
		return this.validType;
	}
	public void setSettings(String settings) {
		this.settings = settings;
	}
    
	public String getSettings() {
		return this.settings;
	}

	public String getModifyStr() {
		return modifyStr;
	}

	public void setModifyStr(String modifyStr) {
		this.modifyStr = modifyStr;
	}

	public String getOldName() {
		return oldName;
	}

	public void setOldName(String oldName) {
		this.oldName = oldName;
	}

	public String getOldTableName() {
		return oldTableName;
	}

	public void setOldTableName(String oldTableName) {
		this.oldTableName = oldTableName;
	}

}