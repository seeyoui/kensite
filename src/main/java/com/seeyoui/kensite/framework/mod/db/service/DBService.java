/*
 * Powered By cuichen
 * Since 2014 - 2015
 */package com.seeyoui.kensite.framework.mod.db.service;  
 
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seeyoui.kensite.common.base.domain.EasyUIDataGrid;
import com.seeyoui.kensite.common.base.service.BaseService;
import com.seeyoui.kensite.common.exception.CRUDException;
import com.seeyoui.kensite.framework.mod.db.persistence.DBMapper;
import com.seeyoui.kensite.framework.mod.table.domain.Table;

/**
 * @author cuichen
 * @version 1.0
 * @since 1.0
 * @date 2015-09-22
 */
@Service
public class DBService extends BaseService {
	
	@Autowired
	private DBMapper dbMapper;

	/**
	 * 创建表
	 * @param table
	 * @throws CRUDException
	 */
	public void createTable(Table table) throws CRUDException{
		dbMapper.createTable(table);
	}
	
	/**
	 * 表重命名
	 * @param table
	 * @throws CRUDException
	 */
	public void renameTable(Table table) throws CRUDException{
		dbMapper.renameTable(table);
	}
	
	/**
	 * 给表添加注释
	 * @param table
	 * @throws CRUDException
	 */
	public void commentTable(Table table) throws CRUDException{
		dbMapper.commentTable(table);
	}
	
	/**
	 * 删除表
	 * @param table
	 * @throws CRUDException
	 */
	public void dropTable(Table table) throws CRUDException{
		dbMapper.dropTable(table);
	}
	
}