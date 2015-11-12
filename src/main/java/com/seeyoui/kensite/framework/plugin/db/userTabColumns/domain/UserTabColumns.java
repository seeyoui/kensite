/*
 * Powered By cuichen
 * Since 2014 - 2015
 */
package com.seeyoui.kensite.framework.plugin.db.userTabColumns.domain;  

import com.seeyoui.kensite.common.base.domain.DataEntity;
import com.seeyoui.kensite.common.util.StringUtils;
import com.seeyoui.kensite.common.util.excel.annotation.ExcelField;

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
	@ExcelField(title="列名", type=1, align=2, sort=1)
	private String columnName;//columnName
	@ExcelField(title="类型", type=1, align=2, sort=10)
	private String viewDataType;//用于显示类型，例：CHAR(32)
	private String dataType;//dataType
	private String dataLength;//dataLength
	private String dataPrecision;//dataPrecision
	private String dataScale;//dataScale
	@ExcelField(title="是否可为空", type=1, align=2, sort=20, dict="yes_no")
	private String nullable;//nullable
	private String columnId;//columnId
	private String numDistinct;//不重复记录数
	private String density;//密度
	private String numNulls;//numNulls
	private String numBuckets;//numBuckets
	private String avgColLen;//avgColLen
	private String charLength;//charLength
	private String charUsed;//charUsed
	@ExcelField(title="注释", type=1, align=2, sort=30)
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
	public String getViewDataType() {
		String dataType = this.dataType;
		if("CHAR".equals(dataType) || "VARCHAR2".equals(dataType) || "NVARCHAR2".equals(dataType)) {
			dataType += "("+this.charLength+")";
    	} else if("DATE".equals(dataType)) {
    		dataType += "";
    	} else if("NUMBER".equals(dataType)) {
    		if(StringUtils.isNotBlank(this.dataPrecision) && !"0".equals(this.dataScale)) {
    			dataType += "("+this.dataPrecision+","+this.dataScale+")";
    		} else if(StringUtils.isNotBlank(this.dataPrecision)) {
    			dataType += "("+this.dataPrecision+")";
    		}
    	}
		return dataType;
	}

	public void setViewDataType(String viewDataType) {
		this.viewDataType = viewDataType;
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