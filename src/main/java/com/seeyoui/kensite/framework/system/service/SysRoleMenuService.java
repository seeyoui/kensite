/*
 * Powered By cuichen
 * Since 2014 - 2015
 */package com.seeyoui.kensite.framework.system.service;  
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seeyoui.kensite.common.base.service.BaseService;

import java.util.*;

import com.seeyoui.kensite.common.base.domain.Attributes;
import com.seeyoui.kensite.common.base.domain.EasyUIDataGrid;
import com.seeyoui.kensite.common.base.domain.TreeJson;
import com.seeyoui.kensite.common.base.service.BaseService;
import com.seeyoui.kensite.common.exception.CRUDException;
import com.seeyoui.kensite.common.util.*;
import com.seeyoui.kensite.common.constants.StringConstant;
import com.seeyoui.kensite.framework.system.domain.SysMenu;
import com.seeyoui.kensite.framework.system.domain.SysRole;
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
	 * 查询数据TREE
	 * @param username
	 * @return
	 * @throws CRUDException
	 */
	public List<TreeJson> getTreeJson(SysRoleMenu sysRoleMenu) throws CRUDException {
		List<SysMenu> mList = sysRoleMenuMapper.getTreeJson(sysRoleMenu);
		List<TreeJson> tList = new ArrayList<TreeJson>();
		for(int i=0; i<mList.size(); i++) {
			TreeJson tj = new TreeJson();
			tj.setId(mList.get(i).getId());
			tj.setPid(mList.get(i).getParentid());
			tj.setText(mList.get(i).getName());
			tj.setChecked(mList.get(i).getTarget());
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
	 * 数据新增
	 * @param sysRoleMenu
	 * @throws CRUDException
	 */
	public void saveSysRoleMenu(SysRoleMenu sysRoleMenu) throws CRUDException {
		sysRoleMenuMapper.deleteSysRoleMenu(sysRoleMenu.getRoleid());
		if(sysRoleMenu.getMenuid() == null || StringUtils.isBlank(sysRoleMenu.getMenuid())) {
			return;
		}
		List<String> listId = Arrays.asList(sysRoleMenu.getMenuid().split(","));
		for(int i=0; i<listId.size(); i++) {
			sysRoleMenu.setMenuid(listId.get(i));
			sysRoleMenuMapper.saveSysRoleMenu(sysRoleMenu);
		}
	}
	
}