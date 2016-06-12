/*
 * Powered By cuichen
 * Since 2014 - 2016
 */
package com.seeyoui.kensite.planManage.planProject.persistence;

import com.seeyoui.kensite.common.base.domain.EasyUIDataGrid;
import com.seeyoui.kensite.planManage.planProject.domain.PlanProject;

import java.util.*;

import com.seeyoui.kensite.common.exception.CRUDException;

/**
 * 项目
 * @author cuichen
 * @version 1.0
 * @since 1.0
 * @date 2016-06-01
 */
public interface PlanProjectMapper {

	/**
	 * 根据ID查询单条数据
	 * @param id
	 * @return
	 */
	public PlanProject findOne(String id);
	
	/**
	 * 查询数据集合
	 * @param planProject
	 * @return
	 */
	public List<PlanProject> findList(PlanProject planProject);
	
	/**
	 * 查询所有数据集合
	 * @param planProject
	 * @return
	 */
	public List<PlanProject> findAll(PlanProject planProject);
	
	/**
	 * 查询数据总数
	 * @param planProject
	 * @return
	 */
	public int findTotal(PlanProject planProject);

	/**
	 * 查询数据总数排除当前数据
	 * @param planProject
	 * @return
	 */
	public int findExTotal(PlanProject planProject);
	
	/**
	 * 数据新增
	 * @param planProject
	 */
	public void save(PlanProject planProject);
	
	/**
	 * 数据修改
	 * @param planProject
	 */
	public void update(PlanProject planProject);
	
	/**
	 * 数据删除
	 * @param listId
	 */
	public void delete(List<String> listId);
}