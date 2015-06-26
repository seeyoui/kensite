/*
 * Powered By cuichen
 * Since 2014 - 2015
 */
package com.seeyoui.kensite.framework.plugin.log.persistence;  

import com.seeyoui.kensite.common.base.domain.EasyUIDataGrid;
import com.seeyoui.kensite.framework.plugin.log.domain.Log;
import java.util.*;

/**
 * @author cuichen
 * @version 1.0
 * @since 1.0
 */
public interface LogMapper {

	/**
	 * 根据ID查询单条数据
	 * @param id
	 * @return
	 */
	public Log findLogById(String id);
	
	/**
	 * 查询数据集合
	 * @param log
	 * @return
	 */
	public List<Log> findLogList(Log log);
	
	/**
	 * 查询数据总数
	 * @param userinfo
	 * @return
	 */
	public EasyUIDataGrid findLogListTotal(Log log);
	
	/**
	 * 数据新增
	 * @param log
	 */
	public void saveLog(Log log);
	
}