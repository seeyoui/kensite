/*
 * Powered By cuichen
 * Since 2014 - 2015
 */
package com.seeyoui.kensite.framework.system.persistence;  

import com.seeyoui.kensite.common.base.domain.EasyUIDataGrid;
import com.seeyoui.kensite.framework.system.domain.SysModulePermission;
import java.util.*;

/**
 * @author cuichen
 * @version 1.0
 * @since 1.0
 */
public interface SysModulePermissionMapper {

	/**
	 * 根据ID查询单条数据
	 * @param id
	 * @return
	 */
	public SysModulePermission findSysModulePermissionById(String id);
	
	/**
	 * 查询数据集合
	 * @param sysModulePermission
	 * @return
	 */
	public List<SysModulePermission> findSysModulePermissionList(SysModulePermission sysModulePermission);
	
	/**
	 * 查询数据总数
	 * @param userinfo
	 * @return
	 */
	public EasyUIDataGrid findSysModulePermissionListTotal(SysModulePermission sysModulePermission);
	
	/**
	 * 数据新增
	 * @param sysModulePermission
	 */
	public void saveSysModulePermission(SysModulePermission sysModulePermission);
	
	/**
	 * 数据修改
	 * @param sysModulePermission
	 */
	public void updateSysModulePermission(SysModulePermission sysModulePermission);
	
	/**
	 * 数据删除
	 * @param listId
	 */
	public void deleteSysModulePermission(List<String> listId);
}