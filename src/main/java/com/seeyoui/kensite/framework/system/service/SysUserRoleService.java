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
import com.seeyoui.kensite.framework.system.domain.SysUserRole;
import com.seeyoui.kensite.framework.system.persistence.SysUserRoleMapper;

/**
 * @author cuichen
 * @version 1.0
 * @since 1.0
 */
@Service
public class SysUserRoleService extends BaseService {
	
	@Autowired
	private SysUserRoleMapper sysUserRoleMapper;

	/**
	 * 根据ID查询单条数据
	 * @param id
	 * @return
	 * @throws CRUDException
	 */
	public SysUserRole findSysUserRoleById(String id) throws CRUDException{
		return sysUserRoleMapper.findSysUserRoleById(id);
	}
	
	/**
	 * 查询数据集合
	 * @param sysUserRole
	 * @return
	 * @throws CRUDException
	 */
	public List<SysUserRole> findSysUserRoleList(SysUserRole sysUserRole) throws CRUDException {
		return sysUserRoleMapper.findSysUserRoleList(sysUserRole);
	}
	
	/**
	 * 查询数据总数
	 * @param userinfo
	 * @return
	 * @throws CRUDException
	 */
	public EasyUIDataGrid findSysUserRoleListTotal(SysUserRole sysUserRole) throws CRUDException {
		return sysUserRoleMapper.findSysUserRoleListTotal(sysUserRole);
	}
	
	/**
	 * 数据新增
	 * @param sysUserRole
	 * @throws CRUDException
	 */
	public void saveSysUserRole(SysUserRole sysUserRole) throws CRUDException{
		sysUserRoleMapper.saveSysUserRole(sysUserRole);
	}
	
	/**
	 * 数据修改
	 * @param sysUserRole
	 * @throws CRUDException
	 */
	public void updateSysUserRole(SysUserRole sysUserRole) throws CRUDException{
		sysUserRoleMapper.updateSysUserRole(sysUserRole);			
	}
	
	/**
	 * 数据删除
	 * @param listId
	 * @throws CRUDException
	 */
	public void deleteSysUserRole(List<String> listId) throws CRUDException {
		sysUserRoleMapper.deleteSysUserRole(listId);
	}
	
}