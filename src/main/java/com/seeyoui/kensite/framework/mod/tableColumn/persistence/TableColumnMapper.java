/*
 * Powered By cuichen
 * Since 2014 - 2015
 */
package com.seeyoui.kensite.framework.mod.tableColumn.persistence;  

import com.seeyoui.kensite.common.base.domain.EasyUIDataGrid;
import com.seeyoui.kensite.framework.mod.tableColumn.domain.TableColumn;
import java.util.*;

/**
 * 业务表字段
 * @author cuichen
 * @version 1.0
 * @since 1.0
 * @date 2015-10-24
 */
public interface TableColumnMapper {

	/**
	 * 根据ID查询单条数据
	 * @param id
	 * @return
	 */
	public TableColumn findTableColumnById(String id);
	
	/**
	 * 查询单条数据
	 * @param tableColumn
	 * @return
	 */
	public TableColumn findTableColumn(TableColumn tableColumn);
	
	/**
	 * 查询数据集合
	 * @param tableColumn
	 * @return
	 */
	public List<TableColumn> findTableColumnList(TableColumn tableColumn);
	
	/**
	 * 查询所有数据集合
	 * @param tableColumn
	 * @return
	 */
	public List<TableColumn> findAllTableColumnList(TableColumn tableColumn);
	
	/**
	 * 查询数据总数
	 * @param tableColumn
	 * @return
	 */
	public EasyUIDataGrid findTableColumnListTotal(TableColumn tableColumn);
	
	/**
	 * 查询数据总数
	 * @param tableColumn
	 * @return
	 */
	public int findTableColumnTotal(TableColumn tableColumn);
	
	/**
	 * 数据新增
	 * @param tableColumn
	 */
	public void saveTableColumn(TableColumn tableColumn);
	
	/**
	 * 数据修改
	 * @param tableColumn
	 */
	public void updateTableColumn(TableColumn tableColumn);
	
	/**
	 * 表名重命名
	 * @param tableColumn
	 */
	public void renameTableName(TableColumn tableColumn);
	
	/**
	 * 数据删除
	 * @param listId
	 */
	public void deleteTableColumn(List<String> listId);
}