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
import com.seeyoui.kensite.framework.system.domain.SysUser;
import com.seeyoui.kensite.framework.system.persistence.SysUserMapper;

/**
 * @author cuichen
 * @version 1.0
 * @since 1.0
 */
@Service
public class SysUserService extends BaseService {
	
	@Autowired
	private SysUserMapper sysUserMapper;

	/**
	 * 根据ID查询单条数据
	 * @param id
	 * @return
	 * @throws CRUDException
	 */
	public SysUser findSysUserById(String id) throws CRUDException{
		return sysUserMapper.findSysUserById(id);
	}
	
	/**
	 * 根据登录名查询单条数据
	 * @param username
	 * @return
	 */
	public SysUser findSysUserByUserName(String username) throws CRUDException{
		return sysUserMapper.findSysUserByUserName(username);
	}
	
	/**
	 * 查询数据集合
	 * @param sysUser
	 * @return
	 * @throws CRUDException
	 */
	public List<SysUser> findSysUserList(SysUser sysUser) throws CRUDException {
		return sysUserMapper.findSysUserList(sysUser);
	}
	
	/**
	 * 查询数据总数
	 * @param userinfo
	 * @return
	 * @throws CRUDException
	 */
	public EasyUIDataGrid findSysUserListTotal(SysUser sysUser) throws CRUDException {
		return sysUserMapper.findSysUserListTotal(sysUser);
	}
	
	/**
	 * 数据新增
	 * @param sysUser
	 * @throws CRUDException
	 */
	public void saveSysUser(SysUser sysUser) throws CRUDException{
		sysUser.setId(String.valueOf(UUID.randomUUID()).replaceAll("-", ""));
		sysUserMapper.saveSysUser(sysUser);
	}
	
	/**
	 * 数据修改
	 * @param sysUser
	 * @throws CRUDException
	 */
	public void updateSysUser(SysUser sysUser) throws CRUDException{
		sysUserMapper.updateSysUser(sysUser);			
	}
	
	/**
	 * 数据删除
	 * @param listId
	 * @throws CRUDException
	 */
	public void deleteSysUser(List<String> listId) throws CRUDException {
		sysUserMapper.deleteSysUser(listId);
	}
	
}