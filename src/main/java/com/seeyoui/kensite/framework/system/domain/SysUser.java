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
public class SysUser extends Pager {  
    private static final long serialVersionUID = 5454155825314635342L;  
      
    private String id;  
    private String username;  
    private String password;  
    private String name;  
    private String email;  
    private String phone;  
    private String departmentid;  
    private String state;  
 
    public void setId(String id) {  
        this.id = id;  
    }  
      
    public String getId() {  
        return this.id;  
    }  
    public void setUsername(String username) {  
        this.username = username;  
    }  
      
    public String getUsername() {  
        return this.username;  
    }  
    public void setPassword(String password) {  
        this.password = password;  
    }  
      
    public String getPassword() {  
        return this.password;  
    }  
    public void setName(String name) {  
        this.name = name;  
    }  
      
    public String getName() {  
        return this.name;  
    }  
    public void setDepartmentid(String departmentid) {  
        this.departmentid = departmentid;  
    }  
      
    public String getDepartmentid() {  
        return this.departmentid;  
    }  
    public void setState(String state) {  
        this.state = state;  
    }  
      
    public String getState() {  
        return this.state;  
    }

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}  
}