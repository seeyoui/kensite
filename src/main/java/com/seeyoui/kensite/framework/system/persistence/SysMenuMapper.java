/*
 * Powered By cuichen
 * Since 2014 - 2015
 */
package com.seeyoui.kensite.framework.system.persistence;  

import com.seeyoui.kensite.common.base.domain.EasyUIDataGrid;
import com.seeyoui.kensite.common.exception.CRUDException;
import com.seeyoui.kensite.framework.system.domain.SysMenu;
import java.util.*;

/**
 * @author cuichen
 * @version 1.0
 * @since 1.0
 */
public interface SysMenuMapper {

	/**
	 * 根据ID查询单条数据
	 * @param id
	 * @return
	 */
	public SysMenu findSysMenuById(String id);
	
	/**
	 * 查询数据集合
	 * @param sysMenu
	 * @return
	 */
	public List<SysMenu> findSysMenuList(SysMenu sysMenu);
	
	/**
	 * 查询数据TREE
	 * @param map
	 * @return
	 * @throws CRUDException
	 */
	public List<SysMenu> findSysMenuTree(Map<String, String > map);
	
	/**
	 * 查询数据总数
	 * @param userinfo
	 * @return
	 */
	public EasyUIDataGrid findSysMenuListTotal(SysMenu sysMenu);
	
	/**
	 * 数据新增
	 * @param sysMenu
	 */
	public void saveSysMenu(SysMenu sysMenu);
	
	/**
	 * 数据修改
	 * @param sysMenu
	 */
	public void updateSysMenu(SysMenu sysMenu);
	
	/**
	 * 数据删除
	 * @param listId
	 */
	public void deleteSysMenu(List<String> listId);
}