/*
 * Powered By cuichen
 * Since 2014 - 2015
 */
package com.seeyoui.kensite.framework.system.persistence;  

import com.seeyoui.kensite.common.base.domain.EasyUIDataGrid;
import com.seeyoui.kensite.framework.system.domain.SysUser;
import java.util.*;

/**
 * @author cuichen
 * @version 1.0
 * @since 1.0
 */
public interface SysUserMapper {

	/**
	 * 根据ID查询单条数据
	 * @param id
	 * @return
	 */
	public SysUser findSysUserById(String id);
	
	/**
	 * 根据登录名查询单条数据
	 * @param username
	 * @return
	 */
	public SysUser findSysUserByUserName(String username);
	
	/**
	 * 查询数据集合
	 * @param sysUser
	 * @return
	 */
	public List<SysUser> findSysUserList(SysUser sysUser);
	
	/**
	 * 查询数据总数
	 * @param userinfo
	 * @return
	 */
	public EasyUIDataGrid findSysUserListTotal(SysUser sysUser);
	
	/**
	 * 数据新增
	 * @param sysUser
	 */
	public void saveSysUser(SysUser sysUser);
	
	/**
	 * 数据修改
	 * @param sysUser
	 */
	public void updateSysUser(SysUser sysUser);
	
	/**
	 * 数据删除
	 * @param listId
	 */
	public void deleteSysUser(List<String> listId);
}