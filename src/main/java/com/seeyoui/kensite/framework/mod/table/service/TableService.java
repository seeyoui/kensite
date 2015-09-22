/*
 * Powered By cuichen
 * Since 2014 - 2015
 */package com.seeyoui.kensite.framework.mod.table.service;  
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seeyoui.kensite.common.base.service.BaseService;

import java.util.*;

import com.seeyoui.kensite.common.base.domain.EasyUIDataGrid;
import com.seeyoui.kensite.common.base.service.BaseService;
import com.seeyoui.kensite.common.exception.CRUDException;
import com.seeyoui.kensite.common.util.*;
import com.seeyoui.kensite.common.constants.StringConstant;
import com.seeyoui.kensite.framework.mod.table.domain.Table;
import com.seeyoui.kensite.framework.mod.table.persistence.TableMapper;
import com.seeyoui.kensite.framework.act.idgenerator.GeneratorUUID;

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
	}
	
	/**
	 * 数据修改
	 * @param table
	 * @throws CRUDException
	 */
	public void updateTable(Table table) throws CRUDException{
		table.preUpdate();
		tableMapper.updateTable(table);			
	}
	
	/**
	 * 数据删除
	 * @param listId
	 * @throws CRUDException
	 */
	public void deleteTable(List<String> listId) throws CRUDException {
		tableMapper.deleteTable(listId);
	}
	
}