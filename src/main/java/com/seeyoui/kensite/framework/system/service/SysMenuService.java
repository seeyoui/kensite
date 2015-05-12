/*
 * Powered By cuichen
 * Since 2014 - 2015
 */package com.seeyoui.kensite.framework.system.service;  
 
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seeyoui.kensite.common.base.domain.Attributes;
import com.seeyoui.kensite.common.base.domain.EasyUIDataGrid;
import com.seeyoui.kensite.common.base.domain.TreeJson;
import com.seeyoui.kensite.common.base.service.BaseService;
import com.seeyoui.kensite.common.constants.StringConstant;
import com.seeyoui.kensite.common.exception.CRUDException;
import com.seeyoui.kensite.framework.act.idgenerator.GeneratorUUID;
import com.seeyoui.kensite.framework.system.domain.SysDepartment;
import com.seeyoui.kensite.framework.system.domain.SysMenu;
import com.seeyoui.kensite.framework.system.domain.SysRole;
import com.seeyoui.kensite.framework.system.domain.SysUser;
import com.seeyoui.kensite.framework.system.persistence.SysMenuMapper;

/**
 * @author cuichen
 * @version 1.0
 * @since 1.0
 */
@Service
public class SysMenuService extends BaseService {
	
	@Autowired
	private SysMenuMapper sysMenuMapper;

	/**
	 * 根据ID查询单条数据
	 * @param id
	 * @return
	 * @throws CRUDException
	 */
	public SysMenu findSysMenuById(String id) throws CRUDException{
		return sysMenuMapper.findSysMenuById(id);
	}
	
	/**
	 * 查询数据集合
	 * @param sysMenu
	 * @return
	 * @throws CRUDException
	 */
	public List<SysMenu> findSysMenuList(SysMenu sysMenu) throws CRUDException {
		return sysMenuMapper.findSysMenuList(sysMenu);
	}
	
	/**
	 * 查询数据TREE
	 * @param username
	 * @return
	 * @throws CRUDException
	 */
	public List<TreeJson> findSysMenuTree(SysUser sysUser) throws CRUDException {
		List<SysMenu> mList = sysMenuMapper.findSysMenuTree(sysUser);
		List<TreeJson> tList = new ArrayList<TreeJson>();
		for(int i=0; i<mList.size(); i++) {
			TreeJson tj = new TreeJson();
			tj.setId(mList.get(i).getId());
			tj.setPid(mList.get(i).getParentid());
			tj.setText(mList.get(i).getName());
			Attributes attributes = new Attributes();
			attributes.setUrl(mList.get(i).getUrl());
			attributes.setIcon(mList.get(i).getIcon());
			tj.setAttributes(attributes);
			tList.add(tj);
		}
		
		TreeJson root = new TreeJson();
		root.setId(StringConstant.ROOT_ID_32);
		TreeJson.getTree(tList, root);
		return root.getChildren();
	}
	
	/**
	 * 查询数据TREE
	 * @param username
	 * @return
	 * @throws CRUDException
	 */
	public List<TreeJson> getTreeJson() throws CRUDException {
		List<SysMenu> mList = sysMenuMapper.getTreeJson();
		List<TreeJson> tList = new ArrayList<TreeJson>();
		for(int i=0; i<mList.size(); i++) {
			TreeJson tj = new TreeJson();
			tj.setId(mList.get(i).getId());
			tj.setPid(mList.get(i).getParentid());
			tj.setText(mList.get(i).getName());
			Attributes attributes = new Attributes();
			attributes.setUrl(mList.get(i).getUrl());
			attributes.setIcon(mList.get(i).getIcon());
			tj.setAttributes(attributes);
			tList.add(tj);
		}
		TreeJson root = new TreeJson();
		root.setId(StringConstant.ROOT_ID_32);
		TreeJson.getTree(tList, root);
		return root.getChildren();
	}
	
	/**
	 * 查询数据总数
	 * @param userinfo
	 * @return
	 * @throws CRUDException
	 */
	public EasyUIDataGrid findSysMenuListTotal(SysMenu sysMenu) throws CRUDException {
		return sysMenuMapper.findSysMenuListTotal(sysMenu);
	}
	
	/**
	 * 数据新增
	 * @param sysMenu
	 * @throws CRUDException
	 */
	public void saveSysMenu(SysMenu sysMenu) throws CRUDException{
		sysMenu.setId(GeneratorUUID.getId());
		sysMenuMapper.saveSysMenu(sysMenu);
	}
	
	/**
	 * 数据修改
	 * @param sysMenu
	 * @throws CRUDException
	 */
	public void updateSysMenu(SysMenu sysMenu) throws CRUDException{
		sysMenuMapper.updateSysMenu(sysMenu);			
	}
	
	/**
	 * 数据删除
	 * @param listId
	 * @throws CRUDException
	 */
	public void deleteSysMenu(List<String> listId) throws CRUDException {
		sysMenuMapper.deleteSysMenu(listId);
	}
	
}