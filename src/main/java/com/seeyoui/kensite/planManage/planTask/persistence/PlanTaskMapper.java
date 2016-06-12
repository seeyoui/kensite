/*
 * Powered By cuichen
 * Since 2014 - 2016
 */
package com.seeyoui.kensite.planManage.planTask.persistence;

import com.seeyoui.kensite.common.base.domain.EasyUIDataGrid;
import com.seeyoui.kensite.planManage.planTask.domain.PlanTask;

import java.util.*;

import com.seeyoui.kensite.common.exception.CRUDException;

/**
 * 任务
 * @author cuichen
 * @version 1.0
 * @since 1.0
 * @date 2016-06-01
 */
public interface PlanTaskMapper {

	/**
	 * 根据ID查询单条数据
	 * @param id
	 * @return
	 */
	public PlanTask findOne(String id);
	
	/**
	 * 查询数据集合
	 * @param planTask
	 * @return
	 */
	public List<PlanTask> findList(PlanTask planTask);
	
	/**
	 * 查询所有数据集合
	 * @param planTask
	 * @return
	 */
	public List<PlanTask> findAll(PlanTask planTask);
	
	/**
	 * 查询数据总数
	 * @param planTask
	 * @return
	 */
	public int findTotal(PlanTask planTask);

	/**
	 * 查询数据总数排除当前数据
	 * @param planTask
	 * @return
	 */
	public int findExTotal(PlanTask planTask);
	
	/**
	 * 数据新增
	 * @param planTask
	 */
	public void save(PlanTask planTask);
	
	/**
	 * 数据修改
	 * @param planTask
	 */
	public void update(PlanTask planTask);
	
	/**
	 * 数据删除
	 * @param listId
	 */
	public void delete(List<String> listId);
}