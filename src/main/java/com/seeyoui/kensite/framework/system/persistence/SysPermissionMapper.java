/*
 * Powered By cuichen
 * Since 2014 - 2015
 */
package com.seeyoui.kensite.framework.system.persistence;  

import java.util.List;

import com.seeyoui.kensite.common.base.domain.EasyUIDataGrid;
import com.seeyoui.kensite.framework.system.domain.SysPermission;
import com.seeyoui.kensite.framework.system.domain.SysUser;

/**
 * @author cuichen
 * @version 1.0
 * @since 1.0
 */
public interface SysPermissionMapper {

	/**
	 * 根据ID查询单条数据
	 * @param id
	 * @return
	 */
	public SysPermission findSysPermissionById(String id);
	
	/**
	 * 查询数据集合
	 * @param sysPermission
	 * @return
	 */
	public List<SysPermission> findSysPermissionList(SysPermission sysPermission);
	
	/**
	 * 查询用户权限集合
	 * @param sysPermission
	 * @return
	 */
	public List<SysPermission> findSysUserPermissionList(SysUser sysUser);
	
	/**
	 * 查询数据总数
	 * @param userinfo
	 * @return
	 */
	public EasyUIDataGrid findSysPermissionListTotal(SysPermission sysPermission);
	
	/**
	 * 数据新增
	 * @param sysPermission
	 */
	public void saveSysPermission(SysPermission sysPermission);
	
	/**
	 * 数据修改
	 * @param sysPermission
	 */
	public void updateSysPermission(SysPermission sysPermission);
	
	/**
	 * 数据删除
	 * @param listId
	 */
	public void deleteSysPermission(List<String> listId);
}