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
import com.seeyoui.kensite.framework.system.domain.SysRole;
import com.seeyoui.kensite.framework.system.persistence.SysRoleMapper;

/**
 * @author cuichen
 * @version 1.0
 * @since 1.0
 */
@Service
public class SysRoleService extends BaseService {
	
	@Autowired
	private SysRoleMapper sysRoleMapper;

	/**
	 * 根据ID查询单条数据
	 * @param id
	 * @return
	 * @throws CRUDException
	 */
	public SysRole findSysRoleById(String id) throws CRUDException{
		return sysRoleMapper.findSysRoleById(id);
	}
	
	/**
	 * 查询数据集合
	 * @param sysRole
	 * @return
	 * @throws CRUDException
	 */
	public List<SysRole> findSysRoleList(SysRole sysRole) throws CRUDException {
		return sysRoleMapper.findSysRoleList(sysRole);
	}
	
	/**
	 * 查询用户权限集合
	 * @param sysRole
	 * @return
	 * @throws CRUDException
	 */
	public List<SysRole> findSysUserRoleList(Map<String, String > map) throws CRUDException {
		return sysRoleMapper.findSysUserRoleList(map);
	}
	
	/**
	 * 查询数据总数
	 * @param userinfo
	 * @return
	 * @throws CRUDException
	 */
	public EasyUIDataGrid findSysRoleListTotal(SysRole sysRole) throws CRUDException {
		return sysRoleMapper.findSysRoleListTotal(sysRole);
	}
	
	/**
	 * 数据新增
	 * @param sysRole
	 * @throws CRUDException
	 */
	public void saveSysRole(SysRole sysRole) throws CRUDException{
		sysRole.setId(String.valueOf(UUID.randomUUID()).replaceAll("-", ""));
		sysRoleMapper.saveSysRole(sysRole);
	}
	
	/**
	 * 数据修改
	 * @param sysRole
	 * @throws CRUDException
	 */
	public void updateSysRole(SysRole sysRole) throws CRUDException{
		sysRoleMapper.updateSysRole(sysRole);			
	}
	
	/**
	 * 数据删除
	 * @param listId
	 * @throws CRUDException
	 */
	public void deleteSysRole(List<String> listId) throws CRUDException {
		sysRoleMapper.deleteSysRole(listId);
	}
	
}