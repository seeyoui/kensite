/*
 * Powered By cuichen
 * Since 2014 - 2016
 */
package com.seeyoui.kensite.planManage.planTeamLeaguer.persistence;

import com.seeyoui.kensite.common.base.domain.EasyUIDataGrid;
import com.seeyoui.kensite.planManage.planTeamLeaguer.domain.PlanTeamLeaguer;

import java.util.*;

import com.seeyoui.kensite.common.exception.CRUDException;

/**
 * 团队成员
 * @author cuichen
 * @version 1.0
 * @since 1.0
 * @date 2016-06-01
 */
public interface PlanTeamLeaguerMapper {

	/**
	 * 根据ID查询单条数据
	 * @param id
	 * @return
	 */
	public PlanTeamLeaguer findOne(String id);
	
	/**
	 * 查询数据集合
	 * @param planTeamLeaguer
	 * @return
	 */
	public List<PlanTeamLeaguer> findList(PlanTeamLeaguer planTeamLeaguer);
	
	/**
	 * 查询所有数据集合
	 * @param planTeamLeaguer
	 * @return
	 */
	public List<PlanTeamLeaguer> findAll(PlanTeamLeaguer planTeamLeaguer);
	
	/**
	 * 查询数据总数
	 * @param planTeamLeaguer
	 * @return
	 */
	public int findTotal(PlanTeamLeaguer planTeamLeaguer);

	/**
	 * 查询数据总数排除当前数据
	 * @param planTeamLeaguer
	 * @return
	 */
	public int findExTotal(PlanTeamLeaguer planTeamLeaguer);
	
	/**
	 * 数据新增
	 * @param planTeamLeaguer
	 */
	public void save(PlanTeamLeaguer planTeamLeaguer);
	
	/**
	 * 数据修改
	 * @param planTeamLeaguer
	 */
	public void update(PlanTeamLeaguer planTeamLeaguer);
	
	/**
	 * 数据删除
	 * @param listId
	 */
	public void delete(List<String> listId);
}