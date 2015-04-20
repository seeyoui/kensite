/*
 * Powered By cuichen
 * Since 2014 - 2015
 */
package com.seeyoui.kensite.framework.system.persistence;  

import com.seeyoui.kensite.common.base.domain.EasyUIDataGrid;
import com.seeyoui.kensite.framework.system.domain.SysRoleModule;
import java.util.*;

/**
 * @author cuichen
 * @version 1.0
 * @since 1.0
 */
public interface SysRoleModuleMapper {

	/**
	 * 根据ID查询单条数据
	 * @param id
	 * @return
	 */
	public SysRoleModule findSysRoleModuleById(String id);
	
	/**
	 * 查询数据集合
	 * @param sysRoleModule
	 * @return
	 */
	public List<SysRoleModule> findSysRoleModuleList(SysRoleModule sysRoleModule);
	
	/**
	 * 查询数据总数
	 * @param userinfo
	 * @return
	 */
	public EasyUIDataGrid findSysRoleModuleListTotal(SysRoleModule sysRoleModule);
	
	/**
	 * 数据新增
	 * @param sysRoleModule
	 */
	public void saveSysRoleModule(SysRoleModule sysRoleModule);
	
	/**
	 * 数据修改
	 * @param sysRoleModule
	 */
	public void updateSysRoleModule(SysRoleModule sysRoleModule);
	
	/**
	 * 数据删除
	 * @param listId
	 */
	public void deleteSysRoleModule(List<String> listId);
}