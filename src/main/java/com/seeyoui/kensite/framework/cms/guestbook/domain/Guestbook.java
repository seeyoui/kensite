/*
 * Powered By cuichen
 * Since 2014 - 2015
 */
package com.seeyoui.kensite.framework.cms.guestbook.domain;  

import com.seeyoui.kensite.common.base.domain.DataEntity;

/**
 * 留言板
 * @author cuichen
 * @version 1.0
 * @since 1.0
 * @date 2015-10-12
 */
public class Guestbook extends DataEntity<Guestbook> {
	private static final long serialVersionUID = 1L;
    
	private String type;//留言分类
	private String content;//留言内容
	private String name;//姓名
	private String email;//邮箱
	private String phone;//电话
	private String workunit;//单位
	private String ip;//IP
	private String reUserId;//回复人
	private java.util.Date reDate;//回复时间
	private String reContent;//回复内容

	public void setType(String type) {
		this.type = type;
	}
    
	public String getType() {
		return this.type;
	}
	public void setContent(String content) {
		this.content = content;
	}
    
	public String getContent() {
		return this.content;
	}
	public void setName(String name) {
		this.name = name;
	}
    
	public String getName() {
		return this.name;
	}
	public void setEmail(String email) {
		this.email = email;
	}
    
	public String getEmail() {
		return this.email;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
    
	public String getPhone() {
		return this.phone;
	}
	public void setWorkunit(String workunit) {
		this.workunit = workunit;
	}
    
	public String getWorkunit() {
		return this.workunit;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
    
	public String getIp() {
		return this.ip;
	}
	public void setReUserId(String reUserId) {
		this.reUserId = reUserId;
	}
    
	public String getReUserId() {
		return this.reUserId;
	}
	public void setReDate(java.util.Date reDate) {
		this.reDate = reDate;
	}
    
	public java.util.Date getReDate() {
		return this.reDate;
	}
	public void setReContent(String reContent) {
		this.reContent = reContent;
	}
    
	public String getReContent() {
		return this.reContent;
	}
}