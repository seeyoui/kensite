/*
 * Powered By cuichen
 * Since 2014 - 2016
 */package com.seeyoui.kensite.planManage.planTask.service;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seeyoui.kensite.common.base.service.BaseService;

import java.util.*;

import com.seeyoui.kensite.common.base.domain.EasyUIDataGrid;
import com.seeyoui.kensite.common.base.service.BaseService;
import com.seeyoui.kensite.common.exception.CRUDException;
import com.seeyoui.kensite.common.util.*;
import com.seeyoui.kensite.common.constants.StringConstant;
import com.seeyoui.kensite.planManage.planTask.domain.PlanTask;
import com.seeyoui.kensite.planManage.planTask.persistence.PlanTaskMapper;

import com.seeyoui.kensite.common.exception.CRUDException;
import com.seeyoui.kensite.framework.act.idgenerator.GeneratorUUID;

/**
 * 任务
 * @author cuichen
 * @version 1.0
 * @since 1.0
 * @date 2016-06-01
 */
@Service
public class PlanTaskService extends BaseService {
	
	@Autowired
	private PlanTaskMapper planTaskMapper;

	/**
	 * 根据ID查询单条数据
	 * @param id
	 * @return
	 * @throws CRUDException
	 */
	public PlanTask findOne(String id) throws CRUDException{
		return planTaskMapper.findOne(id);
	}
	
	/**
	 * 查询数据集合
	 * @param planTask
	 * @return
	 * @throws CRUDException
	 */
	public List<PlanTask> findList(PlanTask planTask) throws CRUDException {
		return planTaskMapper.findList(planTask);
	}
	
	/**
	 * 查询所有数据集合
	 * @param planTask
	 * @return
	 * @throws CRUDException
	 */
	public List<PlanTask> findAll(PlanTask planTask) throws CRUDException {
		return planTaskMapper.findAll(planTask);
	}
	
	/**
	 * 查询数据总数
	 * @param planTask
	 * @return
	 * @throws CRUDException
	 */
	public int findTotal(PlanTask planTask) throws CRUDException {
		return planTaskMapper.findTotal(planTask);
	}
	
	/**
	 * 查询数据总数排除当前数据
	 * @param planTask
	 * @return
	 * @throws CRUDException
	 */
	public int findExTotal(PlanTask planTask) throws CRUDException {
		return planTaskMapper.findExTotal(planTask);
	}
	
	/**
	 * 数据新增
	 * @param planTask
	 * @throws CRUDException
	 */
	public void save(PlanTask planTask) throws CRUDException{
		planTask.preInsert();
		planTaskMapper.save(planTask);
	}
	
	/**
	 * 数据修改
	 * @param planTask
	 * @throws CRUDException
	 */
	public void update(PlanTask planTask) throws CRUDException{
		planTask.preUpdate();
		planTaskMapper.update(planTask);			
	}
	
	/**
	 * 数据删除
	 * @param listId
	 * @throws CRUDException
	 */
	public void delete(List<String> listId) throws CRUDException {
		planTaskMapper.delete(listId);
	}
}