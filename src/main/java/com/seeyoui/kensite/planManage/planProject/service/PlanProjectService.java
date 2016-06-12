/*
 * Powered By cuichen
 * Since 2014 - 2016
 */package com.seeyoui.kensite.planManage.planProject.service;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seeyoui.kensite.common.base.service.BaseService;

import java.util.*;

import com.seeyoui.kensite.common.base.domain.EasyUIDataGrid;
import com.seeyoui.kensite.common.base.service.BaseService;
import com.seeyoui.kensite.common.exception.CRUDException;
import com.seeyoui.kensite.common.util.*;
import com.seeyoui.kensite.common.constants.StringConstant;
import com.seeyoui.kensite.planManage.planProject.domain.PlanProject;
import com.seeyoui.kensite.planManage.planProject.persistence.PlanProjectMapper;

import com.seeyoui.kensite.common.exception.CRUDException;
import com.seeyoui.kensite.framework.act.idgenerator.GeneratorUUID;

/**
 * 项目
 * @author cuichen
 * @version 1.0
 * @since 1.0
 * @date 2016-06-01
 */
@Service
public class PlanProjectService extends BaseService {
	
	@Autowired
	private PlanProjectMapper planProjectMapper;

	/**
	 * 根据ID查询单条数据
	 * @param id
	 * @return
	 * @throws CRUDException
	 */
	public PlanProject findOne(String id) throws CRUDException{
		return planProjectMapper.findOne(id);
	}
	
	/**
	 * 查询数据集合
	 * @param planProject
	 * @return
	 * @throws CRUDException
	 */
	public List<PlanProject> findList(PlanProject planProject) throws CRUDException {
		return planProjectMapper.findList(planProject);
	}
	
	/**
	 * 查询所有数据集合
	 * @param planProject
	 * @return
	 * @throws CRUDException
	 */
	public List<PlanProject> findAll(PlanProject planProject) throws CRUDException {
		return planProjectMapper.findAll(planProject);
	}
	
	/**
	 * 查询数据总数
	 * @param planProject
	 * @return
	 * @throws CRUDException
	 */
	public int findTotal(PlanProject planProject) throws CRUDException {
		return planProjectMapper.findTotal(planProject);
	}
	
	/**
	 * 查询数据总数排除当前数据
	 * @param planProject
	 * @return
	 * @throws CRUDException
	 */
	public int findExTotal(PlanProject planProject) throws CRUDException {
		return planProjectMapper.findExTotal(planProject);
	}
	
	/**
	 * 数据新增
	 * @param planProject
	 * @throws CRUDException
	 */
	public void save(PlanProject planProject) throws CRUDException{
		planProject.preInsert();
		planProjectMapper.save(planProject);
	}
	
	/**
	 * 数据修改
	 * @param planProject
	 * @throws CRUDException
	 */
	public void update(PlanProject planProject) throws CRUDException{
		planProject.preUpdate();
		planProjectMapper.update(planProject);			
	}
	
	/**
	 * 数据删除
	 * @param listId
	 * @throws CRUDException
	 */
	public void delete(List<String> listId) throws CRUDException {
		planProjectMapper.delete(listId);
	}
}