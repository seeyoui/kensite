/*
 * Powered By cuichen
 * Since 2014 - 2015
 */
package com.seeyoui.kensite.framework.plugin.db.userTabColumns.domain;  

import com.seeyoui.kensite.common.base.domain.DataEntity;

/**
 * UserTabColumns
 * @author cuichen
 * @version 1.0
 * @since 1.0
 * @date 2015-10-20
 */
public class UserTabColumns extends DataEntity<UserTabColumns> {
	private static final long serialVersionUID = 1L;
    
	private String tableName;//tableName
	private String columnName;//columnName
	private String dataType;//dataType
	private String dataLength;//dataLength
	private String dataPrecision;//dataPrecision
	private String dataScale;//dataScale
	private String nullable;//nullable
	private String columnId;//columnId
	private String numDistinct;//不重复记录数
	private String density;//密度
	private String numNulls;//numNulls
	private String numBuckets;//numBuckets
	private String avgColLen;//avgColLen
	private String charLength;//charLength
	private String charUsed;//charUsed
	private String comments;//comments

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
    
	public String getTableName() {
		return this.tableName;
	}
	public void setColumnName(String columnName) {
		this.columnName = columnName;
	}
    
	public String getColumnName() {
		return this.columnName;
	}
	public void setDataType(String dataType) {
		this.dataType = dataType;
	}
    
	public String getDataType() {
		return this.dataType;
	}
	public void setDataLength(String dataLength) {
		this.dataLength = dataLength;
	}
    
	public String getDataLength() {
		return this.dataLength;
	}
	public void setDataPrecision(String dataPrecision) {
		this.dataPrecision = dataPrecision;
	}
    
	public String getDataPrecision() {
		return this.dataPrecision;
	}
	public void setDataScale(String dataScale) {
		this.dataScale = dataScale;
	}
    
	public String getDataScale() {
		return this.dataScale;
	}
	public void setNullable(String nullable) {
		this.nullable = nullable;
	}
    
	public String getNullable() {
		return this.nullable;
	}
	public void setColumnId(String columnId) {
		this.columnId = columnId;
	}
    
	public String getColumnId() {
		return this.columnId;
	}
	public void setNumDistinct(String numDistinct) {
		this.numDistinct = numDistinct;
	}
    
	public String getNumDistinct() {
		return this.numDistinct;
	}
	public void setDensity(String density) {
		this.density = density;
	}
    
	public String getDensity() {
		return this.density;
	}
	public void setNumNulls(String numNulls) {
		this.numNulls = numNulls;
	}
    
	public String getNumNulls() {
		return this.numNulls;
	}
	public void setNumBuckets(String numBuckets) {
		this.numBuckets = numBuckets;
	}
    
	public String getNumBuckets() {
		return this.numBuckets;
	}
	public void setAvgColLen(String avgColLen) {
		this.avgColLen = avgColLen;
	}
    
	public String getAvgColLen() {
		return this.avgColLen;
	}
	public void setCharLength(String charLength) {
		this.charLength = charLength;
	}
    
	public String getCharLength() {
		return this.charLength;
	}
	public void setCharUsed(String charUsed) {
		this.charUsed = charUsed;
	}
    
	public String getCharUsed() {
		return this.charUsed;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}
}