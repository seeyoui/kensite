/*
 * Powered By cuichen
 * Since 2014 - 2015
 */package com.seeyoui.kensite.framework.system.service;  
 
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seeyoui.kensite.common.base.domain.EasyUIDataGrid;
import com.seeyoui.kensite.common.base.service.BaseService;
import com.seeyoui.kensite.common.constants.StringConstant;
import com.seeyoui.kensite.common.exception.CRUDException;
import com.seeyoui.kensite.common.util.MD5;
import com.seeyoui.kensite.framework.act.idgenerator.GeneratorUUID;
import com.seeyoui.kensite.framework.system.constants.SysUserConstants;
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
	 * 根据账号查询单条数据
	 * @param username
	 * @return
	 * @throws CRUDException
	 */
	public SysUser findSysUserByUsername(String username) throws CRUDException{
		return sysUserMapper.findSysUserByUsername(username);
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
	public String saveSysUser(SysUser sysUser) throws CRUDException{
		/*
		 *	判断用户名称是否为空。
		 *	(1)为空则直接返回提示信息；
		 *	(2)不为空，则根据名称查询用户，如果得到返回结果，证明系统中存在此用户，
		 *		直接返回提示信息，需要用户重新输入用户名称
		 * 
		 */
		if(sysUser.getUsername() != null && !sysUser.getUsername().equals("")){
			SysUser sysUserResult = sysUserMapper.findSysUserByUsername(sysUser.getUsername());
			if(sysUserResult != null 
				&& (sysUserResult.getId() != null && !sysUserResult.getId().equals(""))){
				return SysUserConstants.MESSAGE_ACCOUNT_EXIST;
			}
		}else{
			return SysUserConstants.MESSAGE_ACCOUNT_ISNULL;
		}
		sysUser.setId(GeneratorUUID.getId());
		sysUser.setState(StringConstant.STATE_ENABLE);
		if(sysUser.getPassword() != null && !"".equals(sysUser.getPassword()) && !"null".equals(sysUser.getPassword())) {
			sysUser.setPassword(MD5.md5(sysUser.getUsername()+sysUser.getPassword()));
		} else {
			sysUser.setPassword(MD5.md5(sysUser.getUsername()+StringConstant.INIT_PASSWORD));
		}
		sysUserMapper.saveSysUser(sysUser);
		return SysUserConstants.MESSAGE_SUCCESS;
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
	 * 修改用户密码
	 * @param sysUser
	 * @throws CRUDException
	 */
	public void updatePassword(SysUser sysUser) throws CRUDException{
		sysUserMapper.updatePassword(sysUser);			
	}
	
	/**
	 * 修改账号状态
	 * @param sysUser
	 * @throws CRUDException
	 */
	public void updateState(SysUser sysUser) throws CRUDException{
		sysUserMapper.updateState(sysUser);			
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