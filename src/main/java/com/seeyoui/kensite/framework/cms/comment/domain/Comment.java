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
	private static final long serialVersionUID = 1L;
    
	private String categoryId;//栏目编号
	private String contentId;//内容编号
	private String score;//评论等级
	private String content;//评论内容
	private String name;//评论姓名
	private String ip;//评论IP
	private String auditUserId;//审核人
	private java.util.Date auditDate;//审核时间

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
	public void setScore(String score) {
		this.score = score;
	}
    
	public String getScore() {
		return this.score;
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