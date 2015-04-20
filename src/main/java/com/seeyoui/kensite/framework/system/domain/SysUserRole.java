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
public class SysUserRole extends Pager {  
    private static final long serialVersionUID = 5454155825314635342L;  
      
    private String userid;  
    private String roleid;  
 
    public void setUserid(String userid) {  
        this.userid = userid;  
    }  
      
    public String getUserid() {  
        return this.userid;  
    }  
    public void setRoleid(String roleid) {  
        this.roleid = roleid;  
    }  
      
    public String getRoleid() {  
        return this.roleid;  
    }  
}