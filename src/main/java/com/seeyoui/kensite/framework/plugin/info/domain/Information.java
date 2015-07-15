/*
 * Powered By cuichen
 * Since 2014 - 2015
 */
package com.seeyoui.kensite.framework.plugin.info.domain;  

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.seeyoui.kensite.common.base.domain.Pager;

/**
 * @author cuichen
 * @version 1.0
 * @since 1.0
 */
public class Information extends Pager {
    private static final long serialVersionUID = 5454155825314635342L;
      
    private String id;
    private Date sendtime;
    private String content;
    private String type;
    private String sender;
    private String receiver;
    private long timeout;
    private long status;
 
    public void setId(String id) {
        this.id = id;
    }
    
    public String getId() {
        return this.id;
    }
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    public Date getSendtime() {
		return sendtime;
	}

	public void setSendtime(Date sendtime) {
		this.sendtime = sendtime;
	}

	public void setContent(String content) {
        this.content = content;
    }
    
    public String getContent() {
        return this.content;
    }
    public void setType(String type) {
        this.type = type;
    }
    
    public String getType() {
        return this.type;
    }
    public void setSender(String sender) {
        this.sender = sender;
    }
    
    public String getSender() {
        return this.sender;
    }
    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }
    
    public String getReceiver() {
        return this.receiver;
    }
    public void setTimeout(long timeout) {
        this.timeout = timeout;
    }
    
    public long getTimeout() {
        return this.timeout;
    }
    public void setStatus(long status) {
        this.status = status;
    }
    
    public long getStatus() {
        return this.status;
    }
}