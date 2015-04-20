/*
 * Powered By cuichen
 * Since 2014 - 2015
 */package com.seeyoui.kensite.framework.system.service;  
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seeyoui.kensite.common.base.service.BaseService;

import java.util.*;

import com.seeyoui.kensite.common.base.domain.EasyUIDataGrid;
import com.seeyoui.kensite.common.base.service.BaseService;
import com.seeyoui.kensite.common.exception.CRUDException;
import com.seeyoui.kensite.common.util.*;
import com.seeyoui.kensite.common.constants.StringConstant;
import com.seeyoui.kensite.framework.system.domain.SysDepartment;
import com.seeyoui.kensite.framework.system.persistence.SysDepartmentMapper;

/**
 * @author cuichen
 * @version 1.0
 * @since 1.0
 */
@Service
public class SysDepartmentService extends BaseService {
	
	@Autowired
	private SysDepartmentMapper sysDepartmentMapper;

	/**
	 * 根据ID查询单条数据
	 * @param id
	 * @return
	 * @throws CRUDException
	 */
	public SysDepartment findSysDepartmentById(String id) throws CRUDException{
		return sysDepartmentMapper.findSysDepartmentById(id);
	}
	
	/**
	 * 查询数据集合
	 * @param sysDepartment
	 * @return
	 * @throws CRUDException
	 */
	public List<SysDepartment> findSysDepartmentList(SysDepartment sysDepartment) throws CRUDException {
		return sysDepartmentMapper.findSysDepartmentList(sysDepartment);
	}
	
	/**
	 * 查询数据总数
	 * @param userinfo
	 * @return
	 * @throws CRUDException
	 */
	public EasyUIDataGrid findSysDepartmentListTotal(SysDepartment sysDepartment) throws CRUDException {
		return sysDepartmentMapper.findSysDepartmentListTotal(sysDepartment);
	}
	
	/**
	 * 数据新增
	 * @param sysDepartment
	 * @throws CRUDException
	 */
	public void saveSysDepartment(SysDepartment sysDepartment) throws CRUDException{
		sysDepartment.setId(String.valueOf(UUID.randomUUID()).replaceAll("-", ""));
		sysDepartmentMapper.saveSysDepartment(sysDepartment);
	}
	
	/**
	 * 数据修改
	 * @param sysDepartment
	 * @throws CRUDException
	 */
	public void updateSysDepartment(SysDepartment sysDepartment) throws CRUDException{
		sysDepartmentMapper.updateSysDepartment(sysDepartment);			
	}
	
	/**
	 * 数据删除
	 * @param listId
	 * @throws CRUDException
	 */
	public void deleteSysDepartment(List<String> listId) throws CRUDException {
		sysDepartmentMapper.deleteSysDepartment(listId);
	}
	
}