/*
 * Powered By cuichen
 * Since 2014 - 2015
 */package com.seeyoui.kensite.framework.log.service;  
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seeyoui.kensite.common.base.service.BaseService;

import java.util.*;

import com.seeyoui.kensite.common.base.domain.EasyUIDataGrid;
import com.seeyoui.kensite.common.base.service.BaseService;
import com.seeyoui.kensite.common.exception.CRUDException;
import com.seeyoui.kensite.common.util.*;
import com.seeyoui.kensite.common.constants.StringConstant;
import com.seeyoui.kensite.framework.log.domain.Log;
import com.seeyoui.kensite.framework.log.persistence.LogMapper;
import com.seeyoui.kensite.framework.act.idgenerator.GeneratorUUID;

/**
 * @author cuichen
 * @version 1.0
 * @since 1.0
 */
@Service
public class LogService extends BaseService {
	
	@Autowired
	private LogMapper logMapper;

	/**
	 * 根据ID查询单条数据
	 * @param id
	 * @return
	 * @throws CRUDException
	 */
	public Log findLogById(String id) throws CRUDException{
		return logMapper.findLogById(id);
	}
	
	/**
	 * 查询数据集合
	 * @param log
	 * @return
	 * @throws CRUDException
	 */
	public List<Log> findLogList(Log log) throws CRUDException {
		return logMapper.findLogList(log);
	}
	
	/**
	 * 查询数据总数
	 * @param userinfo
	 * @return
	 * @throws CRUDException
	 */
	public EasyUIDataGrid findLogListTotal(Log log) throws CRUDException {
		return logMapper.findLogListTotal(log);
	}
	
	/**
	 * 数据新增
	 * @param log
	 * @throws CRUDException
	 */
	public void saveLog(Log log) throws CRUDException{
		log.preInsert();
		logMapper.saveLog(log);
	}
	
}