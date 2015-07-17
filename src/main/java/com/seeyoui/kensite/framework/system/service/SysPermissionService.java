/*
 * Powered By cuichen
 * Since 2014 - 2015
 */package com.seeyoui.kensite.framework.system.service;  
 
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seeyoui.kensite.common.base.domain.EasyUIDataGrid;
import com.seeyoui.kensite.common.base.service.BaseService;
import com.seeyoui.kensite.common.exception.CRUDException;
import com.seeyoui.kensite.framework.act.idgenerator.GeneratorUUID;
import com.seeyoui.kensite.framework.system.domain.SysPermission;
import com.seeyoui.kensite.framework.system.domain.SysUser;
import com.seeyoui.kensite.framework.system.persistence.SysPermissionMapper;

/**
 * @author cuichen
 * @version 1.0
 * @since 1.0
 */
@Service
public class SysPermissionService extends BaseService {
	
	@Autowired
	private SysPermissionMapper sysPermissionMapper;

	/**
	 * 根据ID查询单条数据
	 * @param id
	 * @return
	 * @throws CRUDException
	 */
	public SysPermission findSysPermissionById(String id) throws CRUDException{
		return sysPermissionMapper.findSysPermissionById(id);
	}
	
	/**
	 * 查询数据集合
	 * @param sysPermission
	 * @return
	 * @throws CRUDException
	 */
	public List<SysPermission> findSysPermissionList(SysPermission sysPermission) throws CRUDException {
		return sysPermissionMapper.findSysPermissionList(sysPermission);
	}
	
	/**
	 * 查询用户权限集合
	 * @param sysPermission
	 * @return
	 */
	public List<SysPermission> findSysUserPermissionList(SysUser sysUser) throws CRUDException {
		return sysPermissionMapper.findSysUserPermissionList(sysUser);
	}
	
	/**
	 * 查询数据总数
	 * @param userinfo
	 * @return
	 * @throws CRUDException
	 */
	public EasyUIDataGrid findSysPermissionListTotal(SysPermission sysPermission) throws CRUDException {
		return sysPermissionMapper.findSysPermissionListTotal(sysPermission);
	}
	
	/**
	 * 数据新增
	 * @param sysPermission
	 * @throws CRUDException
	 */
	public void saveSysPermission(SysPermission sysPermission) throws CRUDException{
		sysPermissionMapper.saveSysPermission(sysPermission);
	}
	
	/**
	 * 数据修改
	 * @param sysPermission
	 * @throws CRUDException
	 */
	public void updateSysPermission(SysPermission sysPermission) throws CRUDException{
		sysPermissionMapper.updateSysPermission(sysPermission);			
	}
	
	/**
	 * 数据删除
	 * @param listId
	 * @throws CRUDException
	 */
	public void deleteSysPermission(List<String> listId) throws CRUDException {
		sysPermissionMapper.deleteSysPermission(listId);
	}
	
}