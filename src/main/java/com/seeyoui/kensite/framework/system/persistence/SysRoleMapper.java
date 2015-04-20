/*
 * Powered By cuichen
 * Since 2014 - 2015
 */
package com.seeyoui.kensite.framework.system.persistence;  

import com.seeyoui.kensite.common.base.domain.EasyUIDataGrid;
import com.seeyoui.kensite.common.exception.CRUDException;
import com.seeyoui.kensite.framework.system.domain.SysMenu;
import com.seeyoui.kensite.framework.system.domain.SysRole;
import java.util.*;

/**
 * @author cuichen
 * @version 1.0
 * @since 1.0
 */
public interface SysRoleMapper {

	/**
	 * 根据ID查询单条数据
	 * @param id
	 * @return
	 */
	public SysRole findSysRoleById(String id);
	
	/**
	 * 查询数据集合
	 * @param sysRole
	 * @return
	 */
	public List<SysRole> findSysRoleList(SysRole sysRole);
	
	/**
	 * 查询用户权限集合
	 * @param map
	 * @return
	 * @throws CRUDException
	 */
	public List<SysRole> findSysUserRoleList(Map<String, String > map);
	
	/**
	 * 查询数据总数
	 * @param userinfo
	 * @return
	 */
	public EasyUIDataGrid findSysRoleListTotal(SysRole sysRole);
	
	/**
	 * 数据新增
	 * @param sysRole
	 */
	public void saveSysRole(SysRole sysRole);
	
	/**
	 * 数据修改
	 * @param sysRole
	 */
	public void updateSysRole(SysRole sysRole);
	
	/**
	 * 数据删除
	 * @param listId
	 */
	public void deleteSysRole(List<String> listId);
}