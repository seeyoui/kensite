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
import com.seeyoui.kensite.framework.system.domain.SysRoleMenu;
import com.seeyoui.kensite.framework.system.persistence.SysRoleMenuMapper;

/**
 * @author cuichen
 * @version 1.0
 * @since 1.0
 */
@Service
public class SysRoleMenuService extends BaseService {
	
	@Autowired
	private SysRoleMenuMapper sysRoleMenuMapper;

	/**
	 * 根据ID查询单条数据
	 * @param id
	 * @return
	 * @throws CRUDException
	 */
	public SysRoleMenu findSysRoleMenuById(String id) throws CRUDException{
		return sysRoleMenuMapper.findSysRoleMenuById(id);
	}
	
	/**
	 * 查询数据集合
	 * @param sysRoleMenu
	 * @return
	 * @throws CRUDException
	 */
	public List<SysRoleMenu> findSysRoleMenuList(SysRoleMenu sysRoleMenu) throws CRUDException {
		return sysRoleMenuMapper.findSysRoleMenuList(sysRoleMenu);
	}
	
	/**
	 * 查询数据总数
	 * @param userinfo
	 * @return
	 * @throws CRUDException
	 */
	public EasyUIDataGrid findSysRoleMenuListTotal(SysRoleMenu sysRoleMenu) throws CRUDException {
		return sysRoleMenuMapper.findSysRoleMenuListTotal(sysRoleMenu);
	}
	
	/**
	 * 数据新增
	 * @param sysRoleMenu
	 * @throws CRUDException
	 */
	public void saveSysRoleMenu(SysRoleMenu sysRoleMenu) throws CRUDException{
		sysRoleMenuMapper.saveSysRoleMenu(sysRoleMenu);
	}
	
	/**
	 * 数据修改
	 * @param sysRoleMenu
	 * @throws CRUDException
	 */
	public void updateSysRoleMenu(SysRoleMenu sysRoleMenu) throws CRUDException{
		sysRoleMenuMapper.updateSysRoleMenu(sysRoleMenu);			
	}
	
	/**
	 * 数据删除
	 * @param listId
	 * @throws CRUDException
	 */
	public void deleteSysRoleMenu(List<String> listId) throws CRUDException {
		sysRoleMenuMapper.deleteSysRoleMenu(listId);
	}
	
}