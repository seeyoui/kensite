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
import com.seeyoui.kensite.framework.system.domain.SysModule;
import com.seeyoui.kensite.framework.system.domain.SysRoleModule;
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
	 * 查询数据TREE
	 * @param username
	 * @return
	 * @throws CRUDException
	 */
	public List<TreeJson> getTreeJson(SysRoleModule sysRoleModule) throws CRUDException {
		List<SysModule> mList = sysRoleModuleMapper.getTreeJson(sysRoleModule);
		List<TreeJson> tList = new ArrayList<TreeJson>();
		TreeJson root = new TreeJson();
		root.setId(StringConstant.ROOT_ID_32);
		root.setText("ROOT");
		root.setPid("");
		tList.add(root);
		for(int i=0; i<mList.size(); i++) {
			TreeJson tj = new TreeJson();
			tj.setId(mList.get(i).getId());
			tj.setText(mList.get(i).getName());
			tj.setPid(StringConstant.ROOT_ID_32);
			tj.setChecked(mList.get(i).getShiro());
			Attributes attributes = new Attributes();
			tj.setAttributes(attributes);
			tList.add(tj);
		}
		List<TreeJson> jList = TreeJson.formatTree(tList);
		return jList;
	}
	
	/**
	 * 数据新增
	 * @param sysRoleModule
	 * @throws CRUDException
	 */
	public void saveSysRoleModule(SysRoleModule sysRoleModule) throws CRUDException {
		List<String> listId = Arrays.asList(sysRoleModule.getModuleid().split(","));
		sysRoleModuleMapper.deleteSysRoleModule(sysRoleModule.getRoleid());
		for(int i=0; i<listId.size(); i++) {
			sysRoleModule.setModuleid(listId.get(i));
			sysRoleModuleMapper.saveSysRoleModule(sysRoleModule);
		}
	}
}