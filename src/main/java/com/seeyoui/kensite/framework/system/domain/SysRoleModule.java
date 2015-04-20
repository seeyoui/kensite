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
public class SysRoleModule extends Pager {  
    private static final long serialVersionUID = 5454155825314635342L;  
      
    private String roleid;  
    private String moduleid;  
 
    public void setRoleid(String roleid) {  
        this.roleid = roleid;  
    }  
      
    public String getRoleid() {  
        return this.roleid;  
    }  
    public void setModuleid(String moduleid) {  
        this.moduleid = moduleid;  
    }  
      
    public String getModuleid() {  
        return this.moduleid;  
    }  
}