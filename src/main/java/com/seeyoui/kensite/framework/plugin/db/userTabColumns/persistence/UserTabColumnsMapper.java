/*
 * Powered By cuichen
 * Since 2014 - 2015
 */
package com.seeyoui.kensite.framework.plugin.db.userTabColumns.persistence;  

import com.seeyoui.kensite.common.base.domain.EasyUIDataGrid;
import com.seeyoui.kensite.framework.plugin.db.userTabColumns.domain.UserTabColumns;
import java.util.*;

/**
 * UserTabColumns
 * @author cuichen
 * @version 1.0
 * @since 1.0
 * @date 2015-10-20
 */
public interface UserTabColumnsMapper {

	/**
	 * 根据ID查询单条数据
	 * @param columnName
	 * @return
	 */
	public UserTabColumns findOne(String columnName);
	
	/**
	 * 查询数据集合
	 * @param userTabColumns
	 * @return
	 */
	public List<UserTabColumns> findList(UserTabColumns userTabColumns);
	
	/**
	 * 查询所有数据集合
	 * @param userTabColumns
	 * @return
	 */
	public List<UserTabColumns> findAll(UserTabColumns userTabColumns);
	
	/**
	 * 查询数据总数
	 * @param userTabColumns
	 * @return
	 */
	public int findTotal(UserTabColumns userTabColumns);
	
}