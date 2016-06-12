/*
 * Powered By cuichen
 * Since 2014 - 2016
 */package com.seeyoui.kensite.planManage.planTeamLeaguer.service;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seeyoui.kensite.common.base.service.BaseService;

import java.util.*;

import com.seeyoui.kensite.common.base.domain.EasyUIDataGrid;
import com.seeyoui.kensite.common.base.service.BaseService;
import com.seeyoui.kensite.common.exception.CRUDException;
import com.seeyoui.kensite.common.util.*;
import com.seeyoui.kensite.common.constants.StringConstant;
import com.seeyoui.kensite.planManage.planTeamLeaguer.domain.PlanTeamLeaguer;
import com.seeyoui.kensite.planManage.planTeamLeaguer.persistence.PlanTeamLeaguerMapper;

import com.seeyoui.kensite.common.exception.CRUDException;
import com.seeyoui.kensite.framework.act.idgenerator.GeneratorUUID;

/**
 * 团队成员
 * @author cuichen
 * @version 1.0
 * @since 1.0
 * @date 2016-06-01
 */
@Service
public class PlanTeamLeaguerService extends BaseService {
	
	@Autowired
	private PlanTeamLeaguerMapper planTeamLeaguerMapper;

	/**
	 * 根据ID查询单条数据
	 * @param id
	 * @return
	 * @throws CRUDException
	 */
	public PlanTeamLeaguer findOne(String id) throws CRUDException{
		return planTeamLeaguerMapper.findOne(id);
	}
	
	/**
	 * 查询数据集合
	 * @param planTeamLeaguer
	 * @return
	 * @throws CRUDException
	 */
	public List<PlanTeamLeaguer> findList(PlanTeamLeaguer planTeamLeaguer) throws CRUDException {
		return planTeamLeaguerMapper.findList(planTeamLeaguer);
	}
	
	/**
	 * 查询所有数据集合
	 * @param planTeamLeaguer
	 * @return
	 * @throws CRUDException
	 */
	public List<PlanTeamLeaguer> findAll(PlanTeamLeaguer planTeamLeaguer) throws CRUDException {
		return planTeamLeaguerMapper.findAll(planTeamLeaguer);
	}
	
	/**
	 * 查询数据总数
	 * @param planTeamLeaguer
	 * @return
	 * @throws CRUDException
	 */
	public int findTotal(PlanTeamLeaguer planTeamLeaguer) throws CRUDException {
		return planTeamLeaguerMapper.findTotal(planTeamLeaguer);
	}
	
	/**
	 * 查询数据总数排除当前数据
	 * @param planTeamLeaguer
	 * @return
	 * @throws CRUDException
	 */
	public int findExTotal(PlanTeamLeaguer planTeamLeaguer) throws CRUDException {
		return planTeamLeaguerMapper.findExTotal(planTeamLeaguer);
	}
	
	/**
	 * 数据新增
	 * @param planTeamLeaguer
	 * @throws CRUDException
	 */
	public void save(PlanTeamLeaguer planTeamLeaguer) throws CRUDException{
		planTeamLeaguer.preInsert();
		planTeamLeaguerMapper.save(planTeamLeaguer);
	}
	
	/**
	 * 数据修改
	 * @param planTeamLeaguer
	 * @throws CRUDException
	 */
	public void update(PlanTeamLeaguer planTeamLeaguer) throws CRUDException{
		planTeamLeaguer.preUpdate();
		planTeamLeaguerMapper.update(planTeamLeaguer);			
	}
	
	/**
	 * 数据删除
	 * @param listId
	 * @throws CRUDException
	 */
	public void delete(List<String> listId) throws CRUDException {
		planTeamLeaguerMapper.delete(listId);
	}
}