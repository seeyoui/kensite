/*
 * Powered By cuichen
 * Since 2014 - 2015
 */
package com.seeyoui.kensite.framework.system.domain;  

import org.hibernate.validator.constraints.Range;

import com.seeyoui.kensite.common.base.domain.Pager;

/**
 * @author cuichen
 * @version 1.0
 * @since 1.0
 */
public class SysDepartment extends Pager {  
    private static final long serialVersionUID = 5454155825314635342L;  
      
    private String id;  
    private String parentid;  
//    @Range(min = 1, max = 100, message="长度不对")
    @Range(min = 1, max = 100)
    private Long sequence;  
    private String name;  
    private String code;  
 
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
    public void setSequence(Long sequence) {  
        this.sequence = sequence;  
    }  
      
    public Long getSequence() {  
        return this.sequence;  
    }  
    public void setName(String name) {  
        this.name = name;  
    }  
      
    public String getName() {  
        return this.name;  
    }  
    public void setCode(String code) {  
        this.code = code;  
    }  
      
    public String getCode() {  
        return this.code;  
    }  
}