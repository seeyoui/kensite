/*
 * Powered By cuichen
 * Since 2014 - 2015
 */package com.seeyoui.kensite.framework.plugin.db.userTables.service;  
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seeyoui.kensite.common.base.service.BaseService;

import java.util.*;

import com.seeyoui.kensite.common.base.domain.EasyUIDataGrid;
import com.seeyoui.kensite.common.base.service.BaseService;
import com.seeyoui.kensite.common.exception.CRUDException;
import com.seeyoui.kensite.common.util.*;
import com.seeyoui.kensite.common.constants.StringConstant;
import com.seeyoui.kensite.framework.plugin.db.userTables.domain.UserTables;
import com.seeyoui.kensite.framework.plugin.db.userTables.persistence.UserTablesMapper;
import com.seeyoui.kensite.framework.act.idgenerator.GeneratorUUID;

/**
 * UserTables
 * @author cuichen
 * @version 1.0
 * @since 1.0
 * @date 2015-10-20
 */
@Service
public class UserTablesService extends BaseService {
	
	@Autowired
	private UserTablesMapper userTablesMapper;

	/**
	 * 根据ID查询单条数据
	 * @param id
	 * @return
	 * @throws CRUDException
	 */
	public UserTables findUserTablesById(String tableName) throws CRUDException{
		return userTablesMapper.findUserTablesById(tableName);
	}
	
	/**
	 * 查询数据集合
	 * @param userTables
	 * @return
	 * @throws CRUDException
	 */
	public List<UserTables> findUserTablesList(UserTables userTables) throws CRUDException {
		return userTablesMapper.findUserTablesList(userTables);
	}
	
	/**
	 * 查询所有数据集合
	 * @param userTables
	 * @return
	 * @throws CRUDException
	 */
	public List<UserTables> findAllUserTablesList(UserTables userTables) throws CRUDException {
		return userTablesMapper.findAllUserTablesList(userTables);
	}
	
	/**
	 * 查询数据总数
	 * @param userTables
	 * @return
	 * @throws CRUDException
	 */
	public EasyUIDataGrid findUserTablesListTotal(UserTables userTables) throws CRUDException {
		return userTablesMapper.findUserTablesListTotal(userTables);
	}
	
	/**
	 * 查询数据总数
	 * @param userTables
	 * @return
	 * @throws CRUDException
	 */
	public int findUserTablesTotal(UserTables userTables) throws CRUDException {
		return userTablesMapper.findUserTablesTotal(userTables);
	}
	
}