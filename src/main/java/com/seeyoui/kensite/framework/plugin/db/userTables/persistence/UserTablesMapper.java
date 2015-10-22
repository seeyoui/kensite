/*
 * Powered By cuichen
 * Since 2014 - 2015
 */
package com.seeyoui.kensite.framework.plugin.db.userTables.persistence;  

import com.seeyoui.kensite.common.base.domain.EasyUIDataGrid;
import com.seeyoui.kensite.framework.plugin.db.userTables.domain.UserTables;
import java.util.*;

/**
 * UserTables
 * @author cuichen
 * @version 1.0
 * @since 1.0
 * @date 2015-10-20
 */
public interface UserTablesMapper {

	/**
	 * 根据ID查询单条数据
	 * @param tableName
	 * @return
	 */
	public UserTables findUserTablesById(String tableName);
	
	/**
	 * 查询数据集合
	 * @param userTables
	 * @return
	 */
	public List<UserTables> findUserTablesList(UserTables userTables);
	
	/**
	 * 查询所有数据集合
	 * @param userTables
	 * @return
	 */
	public List<UserTables> findAllUserTablesList(UserTables userTables);
	
	/**
	 * 查询数据总数
	 * @param userTables
	 * @return
	 */
	public EasyUIDataGrid findUserTablesListTotal(UserTables userTables);
	
	/**
	 * 查询数据总数
	 * @param userTables
	 * @return
	 */
	public int findUserTablesTotal(UserTables userTables);
	
}