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
import com.seeyoui.kensite.framework.system.domain.SysRoleModule;
import com.seeyoui.kensite.framework.system.persistence.SysRoleModuleMapper;

/**
 * @author cuichen
 * @version 1.0
 * @since 1.0
 */
@Service
public class SysRoleModuleService extends BaseService {
	
	@Autowired
	private SysRoleModuleMapper sysRoleModuleMapper;

	/**
	 * 根据ID查询单条数据
	 * @param id
	 * @return
	 * @throws CRUDException
	 */
	public SysRoleModule findSysRoleModuleById(String id) throws CRUDException{
		return sysRoleModuleMapper.findSysRoleModuleById(id);
	}
	
	/**
	 * 查询数据集合
	 * @param sysRoleModule
	 * @return
	 * @throws CRUDException
	 */
	public List<SysRoleModule> findSysRoleModuleList(SysRoleModule sysRoleModule) throws CRUDException {
		return sysRoleModuleMapper.findSysRoleModuleList(sysRoleModule);
	}
	
	/**
	 * 查询数据总数
	 * @param userinfo
	 * @return
	 * @throws CRUDException
	 */
	public EasyUIDataGrid findSysRoleModuleListTotal(SysRoleModule sysRoleModule) throws CRUDException {
		return sysRoleModuleMapper.findSysRoleModuleListTotal(sysRoleModule);
	}
	
	/**
	 * 数据新增
	 * @param sysRoleModule
	 * @throws CRUDException
	 */
	public void saveSysRoleModule(SysRoleModule sysRoleModule) throws CRUDException{
		sysRoleModuleMapper.saveSysRoleModule(sysRoleModule);
	}
	
	/**
	 * 数据修改
	 * @param sysRoleModule
	 * @throws CRUDException
	 */
	public void updateSysRoleModule(SysRoleModule sysRoleModule) throws CRUDException{
		sysRoleModuleMapper.updateSysRoleModule(sysRoleModule);			
	}
	
	/**
	 * 数据删除
	 * @param listId
	 * @throws CRUDException
	 */
	public void deleteSysRoleModule(List<String> listId) throws CRUDException {
		sysRoleModuleMapper.deleteSysRoleModule(listId);
	}
	
}