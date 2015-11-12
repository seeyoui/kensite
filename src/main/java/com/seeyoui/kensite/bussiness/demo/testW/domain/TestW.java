/*
 * Powered By cuichen
 * Since 2014 - 2015
 */
package com.seeyoui.kensite.bussiness.demo.testW.domain;  

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.seeyoui.kensite.common.base.domain.DataEntity;
import com.seeyoui.kensite.common.util.excel.annotation.ExcelField;

/**
 * 演示DEMO
 * @author cuichen
 * @version 1.0
 * @since 1.0
 * @date 2015-11-12
 */
@JsonIgnoreProperties(ignoreUnknown = true)
public class TestW extends DataEntity<TestW> {
	private static final long serialVersionUID = 1L;
    
    @ExcelField(title="姓名", type=1, align=2, sort=7)
    private String name;//姓名
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @ExcelField(title="出生日期", type=1, align=2, sort=8)
    private Date birthday;//出生日期
    @ExcelField(title="性别", type=1, align=2, sort=9, constants="F:女|M:男")
    private String sex;//性别
    @ExcelField(title="简历", type=1, align=2, sort=10)
    private String describe;//简历
    @ExcelField(title="是否屏蔽", type=1, align=2, sort=11, dict="yes_no")
    private String isdel;//是否屏蔽
    @ExcelField(title="管理者", type=1, align=2, sort=12, mod="T_TEST_W|MANAGER")//sql="SELECT * FROM SYS_USER|USER_NAME|NAME"
    private String manager;//管理者

	public void setName(String name) {
		this.name = name;
	}
    
	public String getName() {
		return this.name;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
    
	public Date getBirthday() {
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
	public void setManager(String manager) {
		this.manager = manager;
	}
    
	public String getManager() {
		return this.manager;
	}
}