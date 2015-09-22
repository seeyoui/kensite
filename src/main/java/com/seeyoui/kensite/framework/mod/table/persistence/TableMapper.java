/*
 * Powered By cuichen
 * Since 2014 - 2015
 */
package com.seeyoui.kensite.framework.mod.table.persistence;  

import com.seeyoui.kensite.common.base.domain.EasyUIDataGrid;
import com.seeyoui.kensite.framework.mod.table.domain.Table;
import java.util.*;

/**
 * @author cuichen
 * @version 1.0
 * @since 1.0
 * @date 2015-09-22
 */
public interface TableMapper {

	/**
	 * 根据ID查询单条数据
	 * @param id
	 * @return
	 */
	public Table findTableById(String id);
	
	/**
	 * 查询数据集合
	 * @param table
	 * @return
	 */
	public List<Table> findTableList(Table table);
	
	/**
	 * 查询所有数据集合
	 * @param table
	 * @return
	 */
	public List<Table> findAllTableList(Table table);
	
	/**
	 * 查询数据总数
	 * @param table
	 * @return
	 */
	public EasyUIDataGrid findTableListTotal(Table table);
	
	/**
	 * 查询数据总数
	 * @param table
	 * @return
	 */
	public int findTableTotal(Table table);
	
	/**
	 * 数据新增
	 * @param table
	 */
	public void saveTable(Table table);
	
	/**
	 * 数据修改
	 * @param table
	 */
	public void updateTable(Table table);
	
	/**
	 * 数据删除
	 * @param listId
	 */
	public void deleteTable(List<String> listId);
}