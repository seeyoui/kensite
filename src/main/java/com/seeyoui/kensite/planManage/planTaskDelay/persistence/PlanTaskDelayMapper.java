/*
 * Powered By cuichen
 * Since 2014 - 2016
 */
package com.seeyoui.kensite.planManage.planTaskDelay.persistence;

import com.seeyoui.kensite.common.base.domain.EasyUIDataGrid;
import com.seeyoui.kensite.planManage.planTaskDelay.domain.PlanTaskDelay;

import java.util.*;

import com.seeyoui.kensite.common.exception.CRUDException;

/**
 * 任务延期
 * @author cuichen
 * @version 1.0
 * @since 1.0
 * @date 2016-06-06
 */
public interface PlanTaskDelayMapper {

	/**
	 * 根据ID查询单条数据
	 * @param id
	 * @return
	 */
	public PlanTaskDelay findOne(String id);
	
	/**
	 * 查询数据集合
	 * @param planTaskDelay
	 * @return
	 */
	public List<PlanTaskDelay> findList(PlanTaskDelay planTaskDelay);
	
	/**
	 * 查询所有数据集合
	 * @param planTaskDelay
	 * @return
	 */
	public List<PlanTaskDelay> findAll(PlanTaskDelay planTaskDelay);
	
	/**
	 * 查询数据总数
	 * @param planTaskDelay
	 * @return
	 */
	public int findTotal(PlanTaskDelay planTaskDelay);

	/**
	 * 查询数据总数排除当前数据
	 * @param planTaskDelay
	 * @return
	 */
	public int findExTotal(PlanTaskDelay planTaskDelay);
	
	/**
	 * 数据新增
	 * @param planTaskDelay
	 */
	public void save(PlanTaskDelay planTaskDelay);
	
	/**
	 * 数据修改
	 * @param planTaskDelay
	 */
	public void update(PlanTaskDelay planTaskDelay);
	
	/**
	 * 数据删除
	 * @param listId
	 */
	public void delete(List<String> listId);
}