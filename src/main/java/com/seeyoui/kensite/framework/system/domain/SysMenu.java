/*
 * Powered By cuichen
 * Since 2014 - 2015
 */
package com.seeyoui.kensite.framework.system.domain;  

import com.seeyoui.kensite.common.base.domain.Pager;

/**
 * @author cuichen
 * @version 1.0
 * @since 1.0
 */
public class SysMenu extends Pager {  
    private static final long serialVersionUID = 5454155825314635342L;  
      
    private String id;  
    private String parentid;  
    private String name;  
    private String url;  
    private Long sequence;  
    private String icon;  
    private String target;  
 
    public void setId(String id) {  
        this.id = id;  
    }  
      
    public String getId() {  
        return this.id;  
    }  
    public void setParentid(String parentid) {  
        this.parentid = parentid;  
    }  
      
    public String getParentid() {  
        return this.parentid;  
    }  
    public void setName(String name) {  
        this.name = name;  
    }  
      
    public String getName() {  
        return this.name;  
    }  
    public void setUrl(String url) {  
        this.url = url;  
    }  
      
    public String getUrl() {  
        return this.url;  
    }  
    public void setSequence(Long sequence) {  
        this.sequence = sequence;  
    }  
      
    public Long getSequence() {  
        return this.sequence;  
    }  
    public void setIcon(String icon) {  
        this.icon = icon;  
    }  
      
    public String getIcon() {  
        return this.icon;  
    }  
    public void setTarget(String target) {  
        this.target = target;  
    }  
      
    public String getTarget() {  
        return this.target;  
    }  
}