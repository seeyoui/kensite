/*
 * Powered By cuichen
 * Since 2014 - 2015
 */package com.seeyoui.kensite.framework.mod.table.service;  
 
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seeyoui.kensite.common.base.domain.EasyUIDataGrid;
import com.seeyoui.kensite.common.base.service.BaseService;
import com.seeyoui.kensite.common.exception.CRUDException;
import com.seeyoui.kensite.framework.mod.db.persistence.DBMapper;
import com.seeyoui.kensite.framework.mod.table.domain.Table;
import com.seeyoui.kensite.framework.mod.table.persistence.TableMapper;
import com.seeyoui.kensite.framework.mod.tableColumn.domain.TableColumn;
import com.seeyoui.kensite.framework.mod.tableColumn.persistence.TableColumnMapper;

/**
 * @author cuichen
 * @version 1.0
 * @since 1.0
 * @date 2015-09-22
 */
@Service
public class TableService extends BaseService {
	
	@Autowired
	private TableMapper tableMapper;
	@Autowired
	private TableColumnMapper tableColumnMapper;
	@Autowired
	private DBMapper dbMapper;

	/**
	 * 根据ID查询单条数据
	 * @param id
	 * @return
	 * @throws CRUDException
	 */
	public Table findTableById(String id) throws CRUDException{
		return tableMapper.findTableById(id);
	}
	
	/**
	 * 查询数据集合
	 * @param table
	 * @return
	 * @throws CRUDException
	 */
	public List<Table> findTableList(Table table) throws CRUDException {
		return tableMapper.findTableList(table);
	}
	
	/**
	 * 查询所有数据集合
	 * @param table
	 * @return
	 * @throws CRUDException
	 */
	public List<Table> findAllTableList(Table table) throws CRUDException {
		return tableMapper.findAllTableList(table);
	}
	
	/**
	 * 查询数据总数
	 * @param table
	 * @return
	 * @throws CRUDException
	 */
	public EasyUIDataGrid findTableListTotal(Table table) throws CRUDException {
		return tableMapper.findTableListTotal(table);
	}
	
	/**
	 * 查询数据总数
	 * @param table
	 * @return
	 * @throws CRUDException
	 */
	public int findTableTotal(Table table) throws CRUDException {
		return tableMapper.findTableTotal(table);
	}
	
	/**
	 * 数据新增
	 * @param table
	 * @throws CRUDException
	 */
	public void saveTable(Table table) throws CRUDException{
		table.preInsert();
		tableMapper.saveTable(table);
		dbMapper.createTable(table);
		dbMapper.commentTable(table);
		TableColumn column = new TableColumn();
		column.setTableName(table.getName());
		column.setName("ID");
		column.setComments("主键");
		dbMapper.commentColumn(column);
		dbMapper.addPrimaryKey(column);

		column.setName("CREATE_DATE");
		column.setComments("创建日期");
		dbMapper.commentColumn(column);

		column.setName("CREATE_USER");
		column.setComments("创建用户");
		dbMapper.commentColumn(column);

		column.setName("UPDATE_DATE");
		column.setComments("修改日期");
		dbMapper.commentColumn(column);

		column.setName("UPDATE_USER");
		column.setComments("修改用户");
		dbMapper.commentColumn(column);

		column.setName("REMARKS");
		column.setComments("备注信息");
		dbMapper.commentColumn(column);

		column.setName("DEL_FLAG");
		column.setComments("删除标记");
		dbMapper.commentColumn(column);
	}
	
	/**
	 * 数据修改
	 * @param table
	 * @throws CRUDException
	 */
	public void updateTable(Table table) throws CRUDException{
		Table tableOld = tableMapper.findTableById(table.getId());
		table.preUpdate();
		tableMapper.updateTable(table);
		if(table.getName()!=null && !table.getName().equals(tableOld.getName())) {
			table.setOldName(tableOld.getName());
			dbMapper.renameTable(table);
			tableMapper.updateTableFk(table);
			TableColumn tableColumn = new TableColumn();
			tableColumn.setOldTableName(tableOld.getName());
			tableColumn.setTableName(table.getName());
			tableColumnMapper.renameTableName(tableColumn);
		}
		if(table.getComments()!=null && !table.getComments().equals(tableOld.getComments())) {
			dbMapper.commentTable(table);
		}
	}
	
	/**
	 * 数据删除
	 * @param listId
	 * @throws CRUDException
	 */
	public void deleteTable(List<String> listId) throws CRUDException {
		for(String id : listId) {
			Table table = tableMapper.findTableById(id);
			dbMapper.dropTable(table);
		}
		tableMapper.deleteTable(listId);
	}
	
}