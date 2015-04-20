/*
 * Powered By cuichen
 * Since 2014 - 2015
 */
package com.seeyoui.kensite.framework.system.persistence;  

import com.seeyoui.kensite.common.base.domain.EasyUIDataGrid;
import com.seeyoui.kensite.framework.system.domain.SysRoleMenu;
import java.util.*;

/**
 * @author cuichen
 * @version 1.0
 * @since 1.0
 */
public interface SysRoleMenuMapper {

	/**
	 * 根据ID查询单条数据
	 * @param id
	 * @return
	 */
	public SysRoleMenu findSysRoleMenuById(String id);
	
	/**
	 * 查询数据集合
	 * @param sysRoleMenu
	 * @return
	 */
	public List<SysRoleMenu> findSysRoleMenuList(SysRoleMenu sysRoleMenu);
	
	/**
	 * 查询数据总数
	 * @param userinfo
	 * @return
	 */
	public EasyUIDataGrid findSysRoleMenuListTotal(SysRoleMenu sysRoleMenu);
	
	/**
	 * 数据新增
	 * @param sysRoleMenu
	 */
	public void saveSysRoleMenu(SysRoleMenu sysRoleMenu);
	
	/**
	 * 数据修改
	 * @param sysRoleMenu
	 */
	public void updateSysRoleMenu(SysRoleMenu sysRoleMenu);
	
	/**
	 * 数据删除
	 * @param listId
	 */
	public void deleteSysRoleMenu(List<String> listId);
}