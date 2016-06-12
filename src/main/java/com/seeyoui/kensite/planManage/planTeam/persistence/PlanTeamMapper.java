/*
 * Powered By cuichen
 * Since 2014 - 2016
 */
package com.seeyoui.kensite.planManage.planTeam.persistence;

import com.seeyoui.kensite.common.base.domain.EasyUIDataGrid;
import com.seeyoui.kensite.planManage.planTeam.domain.PlanTeam;

import java.util.*;

import com.seeyoui.kensite.common.exception.CRUDException;

/**
 * 团队
 * @author cuichen
 * @version 1.0
 * @since 1.0
 * @date 2016-06-01
 */
public interface PlanTeamMapper {

	/**
	 * 根据ID查询单条数据
	 * @param id
	 * @return
	 */
	public PlanTeam findOne(String id);
	
	/**
	 * 查询数据集合
	 * @param planTeam
	 * @return
	 */
	public List<PlanTeam> findList(PlanTeam planTeam);
	
	/**
	 * 查询所有数据集合
	 * @param planTeam
	 * @return
	 */
	public List<PlanTeam> findAll(PlanTeam planTeam);
	
	/**
	 * 查询数据总数
	 * @param planTeam
	 * @return
	 */
	public int findTotal(PlanTeam planTeam);

	/**
	 * 查询数据总数排除当前数据
	 * @param planTeam
	 * @return
	 */
	public int findExTotal(PlanTeam planTeam);
	
	/**
	 * 数据新增
	 * @param planTeam
	 */
	public void save(PlanTeam planTeam);
	
	/**
	 * 数据修改
	 * @param planTeam
	 */
	public void update(PlanTeam planTeam);
	
	/**
	 * 数据删除
	 * @param listId
	 */
	public void delete(List<String> listId);
}