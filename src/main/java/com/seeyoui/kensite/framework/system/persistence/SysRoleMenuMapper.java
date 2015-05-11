/*
 * Powered By cuichen
 * Since 2014 - 2015
 */
package com.seeyoui.kensite.framework.system.persistence;  

import com.seeyoui.kensite.common.base.domain.EasyUIDataGrid;
import com.seeyoui.kensite.common.exception.CRUDException;
import com.seeyoui.kensite.framework.system.domain.SysMenu;
import com.seeyoui.kensite.framework.system.domain.SysRole;
import com.seeyoui.kensite.framework.system.domain.SysRoleMenu;

import java.util.*;

/**
 * @author cuichen
 * @version 1.0
 * @since 1.0
 */
public interface SysRoleMenuMapper {

	/**
	 * 查询数据TREE
	 * @param map
	 * @return
	 * @throws CRUDException
	 */
	public List<SysMenu> getTreeJson(SysRoleMenu sysRoleMenu);
	
	/**
	 * 数据新增
	 * @param sysRoleMenu
	 */
	public void saveSysRoleMenu(SysRoleMenu sysRoleMenu);
	
	/**
	 * 数据删除
	 * @param listId
	 */
	public void deleteSysRoleMenu(String roleid);
}