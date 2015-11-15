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
 * 构造演示界面
 * @author cuichen
 * @version 1.0
 * @since 1.0
 * @date 2015-11-15
 */
@JsonIgnoreProperties(ignoreUnknown = true)
public class Demo extends DataEntity<Demo> {
	private static final long serialVersionUID = 1L;
    
    @ExcelField(title="报修地点", type=1, align=2, sort=7, mod="T_DEMO|A")
    private String a;//报修地点
    @ExcelField(title="保修人", type=1, align=2, sort=8, mod="T_DEMO|B")
    private String b;//保修人
    @ExcelField(title="维修人员", type=1, align=2, sort=9, mod="T_DEMO|C")
    private String c;//维修人员
    @ExcelField(title="报修时间", type=1, align=2, sort=10, mod="T_DEMO|D")
    private String d;//报修时间
    @ExcelField(title="报修情况", type=1, align=2, sort=11, mod="T_DEMO|E")
    private String e;//报修情况
    @ExcelField(title="状态", type=1, align=2, sort=12, mod="T_DEMO|F")
    private String f;//状态
    @ExcelField(title="G", type=1, align=2, sort=13, mod="T_DEMO|G")
    private String g;//G
    @ExcelField(title="H", type=1, align=2, sort=14, mod="T_DEMO|H")
    private String h;//H
    @ExcelField(title="I", type=1, align=2, sort=15, mod="T_DEMO|I")
    private String i;//I
    @ExcelField(title="J", type=1, align=2, sort=16, mod="T_DEMO|J")
    private String j;//J
    @ExcelField(title="K", type=1, align=2, sort=17, mod="T_DEMO|K")
    private String k;//K

	public void setA(String a) {
		this.a = a;
	}
    
	public String getA() {
		return this.a;
	}
	public void setB(String b) {
		this.b = b;
	}
    
	public String getB() {
		return this.b;
	}
	public void setC(String c) {
		this.c = c;
	}
    
	public String getC() {
		return this.c;
	}
	public void setD(String d) {
		this.d = d;
	}
    
	public String getD() {
		return this.d;
	}
	public void setE(String e) {
		this.e = e;
	}
    
	public String getE() {
		return this.e;
	}
	public void setF(String f) {
		this.f = f;
	}
    
	public String getF() {
		return this.f;
	}
	public void setG(String g) {
		this.g = g;
	}
    
	public String getG() {
		return this.g;
	}
	public void setH(String h) {
		this.h = h;
	}
    
	public String getH() {
		return this.h;
	}
	public void setI(String i) {
		this.i = i;
	}
    
	public String getI() {
		return this.i;
	}
	public void setJ(String j) {
		this.j = j;
	}
    
	public String getJ() {
		return this.j;
	}
	public void setK(String k) {
		this.k = k;
	}
    
	public String getK() {
		return this.k;
	}
}