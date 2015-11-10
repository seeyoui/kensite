/*
 * Powered By cuichen
 * Since 2014 - 2015
 */
package com.seeyoui.kensite.bussiness.demo.testW.domain;  

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.seeyoui.kensite.common.base.domain.DataEntity;
import com.seeyoui.kensite.common.util.excel.annotation.ExcelField;

/**
 * 测试1
 * @author cuichen
 * @version 1.0
 * @since 1.0
 * @date 2015-11-10
 */
@JsonIgnoreProperties(ignoreUnknown = true)
public class TestW extends DataEntity<TestW> {
	private static final long serialVersionUID = 1L;
    
    @ExcelField(title="姓名", type=1, align=2, sort=7)
    private String name;//姓名
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @ExcelField(title="出生日期", type=1, align=2, sort=8)
    private java.util.Date birthday;//出生日期
    @ExcelField(title="性别", type=1, align=2, sort=9)
    private String sex;//性别
    @ExcelField(title="简历", type=1, align=2, sort=10)
    private String describe;//简历
    @ExcelField(title="是否屏蔽", type=1, align=2, sort=11)
    private String isdel;//是否屏蔽

	public void setName(String name) {
		this.name = name;
	}
    
	public String getName() {
		return this.name;
	}
	public void setBirthday(java.util.Date birthday) {
		this.birthday = birthday;
	}
    
	public java.util.Date getBirthday() {
		return this.birthday;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
    
	public String getSex() {
		return this.sex;
	}
	public void setDescribe(String describe) {
		this.describe = describe;
	}
    
	public String getDescribe() {
		return this.describe;
	}
	public void setIsdel(String isdel) {
		this.isdel = isdel;
	}
    
	public String getIsdel() {
		return this.isdel;
	}
}