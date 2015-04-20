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
import com.seeyoui.kensite.framework.system.domain.SysModulePermission;
import com.seeyoui.kensite.framework.system.persistence.SysModulePermissionMapper;

/**
 * @author cuichen
 * @version 1.0
 * @since 1.0
 */
@Service
public class SysModulePermissionService extends BaseService {
	
	@Autowired
	private SysModulePermissionMapper sysModulePermissionMapper;

	/**
	 * 根据ID查询单条数据
	 * @param id
	 * @return
	 * @throws CRUDException
	 */
	public SysModulePermission findSysModulePermissionById(String id) throws CRUDException{
		return sysModulePermissionMapper.findSysModulePermissionById(id);
	}
	
	/**
	 * 查询数据集合
	 * @param sysModulePermission
	 * @return
	 * @throws CRUDException
	 */
	public List<SysModulePermission> findSysModulePermissionList(SysModulePermission sysModulePermission) throws CRUDException {
		return sysModulePermissionMapper.findSysModulePermissionList(sysModulePermission);
	}
	
	/**
	 * 查询数据总数
	 * @param userinfo
	 * @return
	 * @throws CRUDException
	 */
	public EasyUIDataGrid findSysModulePermissionListTotal(SysModulePermission sysModulePermission) throws CRUDException {
		return sysModulePermissionMapper.findSysModulePermissionListTotal(sysModulePermission);
	}
	
	/**
	 * 数据新增
	 * @param sysModulePermission
	 * @throws CRUDException
	 */
	public void saveSysModulePermission(SysModulePermission sysModulePermission) throws CRUDException{
		sysModulePermissionMapper.saveSysModulePermission(sysModulePermission);
	}
	
	/**
	 * 数据修改
	 * @param sysModulePermission
	 * @throws CRUDException
	 */
	public void updateSysModulePermission(SysModulePermission sysModulePermission) throws CRUDException{
		sysModulePermissionMapper.updateSysModulePermission(sysModulePermission);			
	}
	
	/**
	 * 数据删除
	 * @param listId
	 * @throws CRUDException
	 */
	public void deleteSysModulePermission(List<String> listId) throws CRUDException {
		sysModulePermissionMapper.deleteSysModulePermission(listId);
	}
	
}