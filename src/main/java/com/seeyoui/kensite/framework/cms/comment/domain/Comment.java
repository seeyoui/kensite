/*
 * Powered By cuichen
 * Since 2014 - 2015
 */
package com.seeyoui.kensite.framework.cms.comment.domain;  

import com.seeyoui.kensite.common.base.domain.DataEntity;

/**
 * 评论
 * @author cuichen
 * @version 1.0
 * @since 1.0
 * @date 2015-10-12
 */
public class Comment extends DataEntity<Comment> {
	private static final long serialVersionUID = 5454155825314635342L;
    
	private String categoryId;//栏目编号categoryId
	private String contentId;//内容编号contentId
	private String title;//内容标题title
	private String content;//评论内容content
	private String name;//评论姓名name
	private String ip;//评论IPip
	private String auditUserId;//审核人auditUserId
	private java.util.Date auditDate;//审核时间auditDate

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}
    
	public String getCategoryId() {
		return this.categoryId;
	}
	public void setContentId(String contentId) {
		this.contentId = contentId;
	}
    
	public String getContentId() {
		return this.contentId;
	}
	public void setTitle(String title) {
		this.title = title;
	}
    
	public String getTitle() {
		return this.title;
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
	public void setIp(String ip) {
		this.ip = ip;
	}
    
	public String getIp() {
		return this.ip;
	}
	public void setAuditUserId(String auditUserId) {
		this.auditUserId = auditUserId;
	}
    
	public String getAuditUserId() {
		return this.auditUserId;
	}
	public void setAuditDate(java.util.Date auditDate) {
		this.auditDate = auditDate;
	}
    
	public java.util.Date getAuditDate() {
		return this.auditDate;
	}
}