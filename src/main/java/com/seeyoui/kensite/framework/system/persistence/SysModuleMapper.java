/*
 * Powered By cuichen
 * Since 2014 - 2015
 */
package com.seeyoui.kensite.framework.system.persistence;  

import com.seeyoui.kensite.common.base.domain.EasyUIDataGrid;
import com.seeyoui.kensite.framework.system.domain.SysModule;
import java.util.*;

/**
 * @author cuichen
 * @version 1.0
 * @since 1.0
 */
public interface SysModuleMapper {

	/**
	 * 根据ID查询单条数据
	 * @param id
	 * @return
	 */
	public SysModule findSysModuleById(String id);
	
	/**
	 * 查询数据集合
	 * @param sysModule
	 * @return
	 */
	public List<SysModule> findSysModuleList(SysModule sysModule);
	
	/**
	 * 查询数据总数
	 * @param userinfo
	 * @return
	 */
	public EasyUIDataGrid findSysModuleListTotal(SysModule sysModule);
	
	/**
	 * 数据新增
	 * @param sysModule
	 */
	public void saveSysModule(SysModule sysModule);
	
	/**
	 * 数据修改
	 * @param sysModule
	 */
	public void updateSysModule(SysModule sysModule);
	
	/**
	 * 数据删除
	 * @param listId
	 */
	public void deleteSysModule(List<String> listId);
}