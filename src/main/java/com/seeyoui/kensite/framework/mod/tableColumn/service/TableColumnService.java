/*
 * Powered By cuichen
 * Since 2014 - 2015
 */package com.seeyoui.kensite.framework.mod.tableColumn.service;  
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seeyoui.kensite.common.base.service.BaseService;

import java.util.*;

import com.seeyoui.kensite.common.base.domain.EasyUIDataGrid;
import com.seeyoui.kensite.common.base.service.BaseService;
import com.seeyoui.kensite.common.exception.CRUDException;
import com.seeyoui.kensite.common.util.*;
import com.seeyoui.kensite.common.constants.StringConstant;
import com.seeyoui.kensite.framework.mod.db.persistence.DBMapper;
import com.seeyoui.kensite.framework.mod.table.domain.Table;
import com.seeyoui.kensite.framework.mod.tableColumn.domain.TableColumn;
import com.seeyoui.kensite.framework.mod.tableColumn.persistence.TableColumnMapper;
import com.seeyoui.kensite.framework.act.idgenerator.GeneratorUUID;

/**
 * 业务表字段
 * @author cuichen
 * @version 1.0
 * @since 1.0
 * @date 2015-10-24
 */
@Service
public class TableColumnService extends BaseService {
	
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
	public TableColumn findTableColumnById(String id) throws CRUDException{
		return tableColumnMapper.findTableColumnById(id);
	}
	
	/**
	 * 查询数据集合
	 * @param tableColumn
	 * @return
	 * @throws CRUDException
	 */
	public List<TableColumn> findTableColumnList(TableColumn tableColumn) throws CRUDException {
		return tableColumnMapper.findTableColumnList(tableColumn);
	}
	
	/**
	 * 查询所有数据集合
	 * @param tableColumn
	 * @return
	 * @throws CRUDException
	 */
	public List<TableColumn> findAllTableColumnList(TableColumn tableColumn) throws CRUDException {
		return tableColumnMapper.findAllTableColumnList(tableColumn);
	}
	
	/**
	 * 查询数据总数
	 * @param tableColumn
	 * @return
	 * @throws CRUDException
	 */
	public EasyUIDataGrid findTableColumnListTotal(TableColumn tableColumn) throws CRUDException {
		return tableColumnMapper.findTableColumnListTotal(tableColumn);
	}
	
	/**
	 * 查询数据总数
	 * @param tableColumn
	 * @return
	 * @throws CRUDException
	 */
	public int findTableColumnTotal(TableColumn tableColumn) throws CRUDException {
		return tableColumnMapper.findTableColumnTotal(tableColumn);
	}
	
	/**
	 * 数据新增
	 * @param tableColumn
	 * @throws CRUDException
	 */
	public void saveTableColumn(TableColumn tableColumn) throws CRUDException{
		tableColumn.preInsert();
		tableColumnMapper.saveTableColumn(tableColumn);
		dbMapper.addColumn(tableColumn);
		dbMapper.commentColumn(tableColumn);
	}
	
	/**
	 * 数据修改
	 * @param tableColumn
	 * @throws CRUDException
	 */
	public void updateTableColumn(TableColumn tableColumn) throws CRUDException{
		TableColumn tableColumnOld = tableColumnMapper.findTableColumnById(tableColumn.getId());
		tableColumn.preUpdate();
		tableColumnMapper.updateTableColumn(tableColumn);
		if(tableColumn.getName()!=null && !tableColumn.getName().equals(tableColumnOld.getName())) {
			tableColumn.setOldName(tableColumnOld.getName());
			dbMapper.renameColumn(tableColumn);
		}
		if(tableColumn.getComments()!=null && !tableColumn.getComments().equals(tableColumnOld.getComments())) {
			dbMapper.commentColumn(tableColumn);
		}
		String modifyStr = "";
		if(tableColumn.getJdbcType()!=null && !tableColumn.getJdbcType().equals(tableColumnOld.getJdbcType())) {
			modifyStr += tableColumn.getJdbcType();
		}
		if(tableColumn.getDefaultValue()!=null && !tableColumn.getDefaultValue().equals(tableColumnOld.getDefaultValue())) {
			modifyStr += "default '"+tableColumn.getDefaultValue()+"'";
		}
		if(tableColumn.getIsNull()!=null && !tableColumn.getIsNull().equals(tableColumnOld.getIsNull())) {
			if("Y".equals(tableColumn.getIsNull())) {
				modifyStr += " null";
			}
			if("N".equals(tableColumn.getIsNull())) {
				modifyStr += " not null";
			}
		}
		if(!"".equals(modifyStr)) {
			tableColumn.setModifyStr(modifyStr);
			dbMapper.modifyColumn(tableColumn);
		}
	}
	
	/**
	 * 数据修改
	 * @param tableColumn
	 * @throws CRUDException
	 */
	public void renameTableName(TableColumn tableColumn) throws CRUDException{
		tableColumn.preUpdate();
		tableColumnMapper.updateTableColumn(tableColumn);
	}
	
	/**
	 * 数据删除
	 * @param listId
	 * @throws CRUDException
	 */
	public void deleteTableColumn(List<String> listId) throws CRUDException {
		for(String id : listId) {
			TableColumn tableColumn = tableColumnMapper.findTableColumnById(id);
			dbMapper.dropColumn(tableColumn);
		}
		tableColumnMapper.deleteTableColumn(listId);
	}
	
}