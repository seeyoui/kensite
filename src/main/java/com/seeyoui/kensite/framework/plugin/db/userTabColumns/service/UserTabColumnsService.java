/*
 * Powered By cuichen
 * Since 2014 - 2015
 */package com.seeyoui.kensite.framework.plugin.db.userTabColumns.service;  
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seeyoui.kensite.common.base.service.BaseService;

import java.util.*;

import com.seeyoui.kensite.common.base.domain.EasyUIDataGrid;
import com.seeyoui.kensite.common.base.service.BaseService;
import com.seeyoui.kensite.common.exception.CRUDException;
import com.seeyoui.kensite.common.util.*;
import com.seeyoui.kensite.common.constants.StringConstant;
import com.seeyoui.kensite.framework.plugin.db.userTabColumns.domain.UserTabColumns;
import com.seeyoui.kensite.framework.plugin.db.userTabColumns.persistence.UserTabColumnsMapper;
import com.seeyoui.kensite.framework.act.idgenerator.GeneratorUUID;

/**
 * UserTabColumns
 * @author cuichen
 * @version 1.0
 * @since 1.0
 * @date 2015-10-20
 */
@Service
public class UserTabColumnsService extends BaseService {
	
	@Autowired
	private UserTabColumnsMapper userTabColumnsMapper;

	/**
	 * 根据ID查询单条数据
	 * @param id
	 * @return
	 * @throws CRUDException
	 */
	public UserTabColumns findUserTabColumnsById(String columnName) throws CRUDException{
		return userTabColumnsMapper.findUserTabColumnsById(columnName);
	}
	
	/**
	 * 查询数据集合
	 * @param userTabColumns
	 * @return
	 * @throws CRUDException
	 */
	public List<UserTabColumns> findUserTabColumnsList(UserTabColumns userTabColumns) throws CRUDException {
		return userTabColumnsMapper.findUserTabColumnsList(userTabColumns);
	}
	
	/**
	 * 查询所有数据集合
	 * @param userTabColumns
	 * @return
	 * @throws CRUDException
	 */
	public List<UserTabColumns> findAllUserTabColumnsList(UserTabColumns userTabColumns) throws CRUDException {
		return userTabColumnsMapper.findAllUserTabColumnsList(userTabColumns);
	}
	
	/**
	 * 查询数据总数
	 * @param userTabColumns
	 * @return
	 * @throws CRUDException
	 */
	public EasyUIDataGrid findUserTabColumnsListTotal(UserTabColumns userTabColumns) throws CRUDException {
		return userTabColumnsMapper.findUserTabColumnsListTotal(userTabColumns);
	}
	
	/**
	 * 查询数据总数
	 * @param userTabColumns
	 * @return
	 * @throws CRUDException
	 */
	public int findUserTabColumnsTotal(UserTabColumns userTabColumns) throws CRUDException {
		return userTabColumnsMapper.findUserTabColumnsTotal(userTabColumns);
	}
	
}