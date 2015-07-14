/*
 * Powered By cuichen
 * Since 2014 - 2015
 */
package com.seeyoui.kensite.framework.plugin.info.domain;  

import com.seeyoui.kensite.common.base.domain.Pager;

/**
 * @author cuichen
 * @version 1.0
 * @since 1.0
 */
public class Information extends Pager {
    private static final long serialVersionUID = 5454155825314635342L;
      
    private String id;
    private String content;
    private String type;
    private String sender;
    private String receiver;
    private Long timeout;
    private Long status;
 
    public void setId(String id) {
        this.id = id;
    }
    
    public String getId() {
        return this.id;
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
    public void setTimeout(Long timeout) {
        this.timeout = timeout;
    }
    
    public Long getTimeout() {
        return this.timeout;
    }
    public void setStatus(Long status) {
        this.status = status;
    }
    
    public Long getStatus() {
        return this.status;
    }
}