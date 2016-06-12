/*
 * Powered By cuichen
 * Since 2014 - 2016
 */package com.seeyoui.kensite.planManage.planTeam.service;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seeyoui.kensite.common.base.service.BaseService;

import java.util.*;

import com.seeyoui.kensite.common.base.domain.EasyUIDataGrid;
import com.seeyoui.kensite.common.base.service.BaseService;
import com.seeyoui.kensite.common.exception.CRUDException;
import com.seeyoui.kensite.common.util.*;
import com.seeyoui.kensite.common.constants.StringConstant;
import com.seeyoui.kensite.planManage.planTeam.domain.PlanTeam;
import com.seeyoui.kensite.planManage.planTeam.persistence.PlanTeamMapper;
import com.seeyoui.kensite.planManage.planTeamLeaguer.domain.PlanTeamLeaguer;
import com.seeyoui.kensite.planManage.planTeamLeaguer.persistence.PlanTeamLeaguerMapper;
import com.seeyoui.kensite.common.exception.CRUDException;
import com.seeyoui.kensite.framework.act.idgenerator.GeneratorUUID;

/**
 * 团队
 * @author cuichen
 * @version 1.0
 * @since 1.0
 * @date 2016-06-01
 */
@Service
public class PlanTeamService extends BaseService {
	
	@Autowired
	private PlanTeamMapper planTeamMapper;
	@Autowired
	private PlanTeamLeaguerMapper planTeamLeaguerMapper;

	/**
	 * 根据ID查询单条数据
	 * @param id
	 * @return
	 * @throws CRUDException
	 */
	public PlanTeam findOne(String id) throws CRUDException{
		return planTeamMapper.findOne(id);
	}
	
	/**
	 * 查询数据集合
	 * @param planTeam
	 * @return
	 * @throws CRUDException
	 */
	public List<PlanTeam> findList(PlanTeam planTeam) throws CRUDException {
		return planTeamMapper.findList(planTeam);
	}
	
	/**
	 * 查询所有数据集合
	 * @param planTeam
	 * @return
	 * @throws CRUDException
	 */
	public List<PlanTeam> findAll(PlanTeam planTeam) throws CRUDException {
		return planTeamMapper.findAll(planTeam);
	}
	
	/**
	 * 查询数据总数
	 * @param planTeam
	 * @return
	 * @throws CRUDException
	 */
	public int findTotal(PlanTeam planTeam) throws CRUDException {
		return planTeamMapper.findTotal(planTeam);
	}
	
	/**
	 * 查询数据总数排除当前数据
	 * @param planTeam
	 * @return
	 * @throws CRUDException
	 */
	public int findExTotal(PlanTeam planTeam) throws CRUDException {
		return planTeamMapper.findExTotal(planTeam);
	}
	
	/**
	 * 数据新增
	 * @param planTeam
	 * @throws CRUDException
	 */
	public void save(PlanTeam planTeam) throws CRUDException{
		planTeam.preInsert();
		planTeamMapper.save(planTeam);
	}
	
	/**
	 * 数据修改
	 * @param planTeam
	 * @throws CRUDException
	 */
	public void update(PlanTeam planTeam) throws CRUDException{
		planTeam.preUpdate();
		planTeamMapper.update(planTeam);			
	}
	
	/**
	 * 数据删除
	 * @param listId
	 * @throws CRUDException
	 */
	public void delete(List<String> listId) throws CRUDException {
		planTeamMapper.delete(listId);
		planTeamLeaguerMapper.delete(listId);
	}
}