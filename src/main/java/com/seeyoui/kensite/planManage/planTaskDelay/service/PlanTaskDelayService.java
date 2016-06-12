/*
 * Powered By cuichen
 * Since 2014 - 2016
 */package com.seeyoui.kensite.planManage.planTaskDelay.service;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seeyoui.kensite.common.base.service.BaseService;

import java.util.*;

import com.seeyoui.kensite.common.base.domain.EasyUIDataGrid;
import com.seeyoui.kensite.common.base.service.BaseService;
import com.seeyoui.kensite.common.exception.CRUDException;
import com.seeyoui.kensite.common.util.*;
import com.seeyoui.kensite.common.constants.StringConstant;
import com.seeyoui.kensite.planManage.planTaskDelay.domain.PlanTaskDelay;
import com.seeyoui.kensite.planManage.planTaskDelay.persistence.PlanTaskDelayMapper;

import com.seeyoui.kensite.common.exception.CRUDException;
import com.seeyoui.kensite.framework.act.idgenerator.GeneratorUUID;

/**
 * 任务延期
 * @author cuichen
 * @version 1.0
 * @since 1.0
 * @date 2016-06-06
 */
@Service
public class PlanTaskDelayService extends BaseService {
	
	@Autowired
	private PlanTaskDelayMapper planTaskDelayMapper;

	/**
	 * 根据ID查询单条数据
	 * @param id
	 * @return
	 * @throws CRUDException
	 */
	public PlanTaskDelay findOne(String id) throws CRUDException{
		return planTaskDelayMapper.findOne(id);
	}
	
	/**
	 * 查询数据集合
	 * @param planTaskDelay
	 * @return
	 * @throws CRUDException
	 */
	public List<PlanTaskDelay> findList(PlanTaskDelay planTaskDelay) throws CRUDException {
		return planTaskDelayMapper.findList(planTaskDelay);
	}
	
	/**
	 * 查询所有数据集合
	 * @param planTaskDelay
	 * @return
	 * @throws CRUDException
	 */
	public List<PlanTaskDelay> findAll(PlanTaskDelay planTaskDelay) throws CRUDException {
		return planTaskDelayMapper.findAll(planTaskDelay);
	}
	
	/**
	 * 查询数据总数
	 * @param planTaskDelay
	 * @return
	 * @throws CRUDException
	 */
	public int findTotal(PlanTaskDelay planTaskDelay) throws CRUDException {
		return planTaskDelayMapper.findTotal(planTaskDelay);
	}
	
	/**
	 * 查询数据总数排除当前数据
	 * @param planTaskDelay
	 * @return
	 * @throws CRUDException
	 */
	public int findExTotal(PlanTaskDelay planTaskDelay) throws CRUDException {
		return planTaskDelayMapper.findExTotal(planTaskDelay);
	}
	
	/**
	 * 数据新增
	 * @param planTaskDelay
	 * @throws CRUDException
	 */
	public void save(PlanTaskDelay planTaskDelay) throws CRUDException{
		planTaskDelay.preInsert();
		planTaskDelayMapper.save(planTaskDelay);
	}
	
	/**
	 * 数据修改
	 * @param planTaskDelay
	 * @throws CRUDException
	 */
	public void update(PlanTaskDelay planTaskDelay) throws CRUDException{
		planTaskDelay.preUpdate();
		planTaskDelayMapper.update(planTaskDelay);			
	}
	
	/**
	 * 数据删除
	 * @param listId
	 * @throws CRUDException
	 */
	public void delete(List<String> listId) throws CRUDException {
		planTaskDelayMapper.delete(listId);
	}
}