/*
 * Powered By cuichen
 * Since 2014 - 2015
 */
package com.seeyoui.kensite.framework.system.persistence;  

import com.seeyoui.kensite.common.base.domain.EasyUIDataGrid;
import com.seeyoui.kensite.framework.system.domain.SysUserRole;
import java.util.*;

/**
 * @author cuichen
 * @version 1.0
 * @since 1.0
 */
public interface SysUserRoleMapper {

	/**
	 * 根据ID查询单条数据
	 * @param id
	 * @return
	 */
	public SysUserRole findSysUserRoleById(String id);
	
	/**
	 * 查询数据集合
	 * @param sysUserRole
	 * @return
	 */
	public List<SysUserRole> findSysUserRoleList(SysUserRole sysUserRole);
	
	/**
	 * 查询数据总数
	 * @param userinfo
	 * @return
	 */
	public EasyUIDataGrid findSysUserRoleListTotal(SysUserRole sysUserRole);
	
	/**
	 * 数据新增
	 * @param sysUserRole
	 */
	public void saveSysUserRole(SysUserRole sysUserRole);
	
	/**
	 * 数据修改
	 * @param sysUserRole
	 */
	public void updateSysUserRole(SysUserRole sysUserRole);
	
	/**
	 * 数据删除
	 * @param listId
	 */
	public void deleteSysUserRole(List<String> listId);
}