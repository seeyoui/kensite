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
	}
	
	/**
	 * 数据修改
	 * @param tableColumn
	 * @throws CRUDException
	 */
	public void updateTableColumn(TableColumn tableColumn) throws CRUDException{
		tableColumn.preUpdate();
		tableColumnMapper.updateTableColumn(tableColumn);			
	}
	
	/**
	 * 数据删除
	 * @param listId
	 * @throws CRUDException
	 */
	public void deleteTableColumn(List<String> listId) throws CRUDException {
		tableColumnMapper.deleteTableColumn(listId);
	}
	
}