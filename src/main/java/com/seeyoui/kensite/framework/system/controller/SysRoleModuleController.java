/*
 * Powered By cuichen
 * Since 2014 - 2015
 */package com.seeyoui.kensite.framework.system.controller;  
 
import java.sql.*;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.seeyoui.kensite.common.base.controller.BaseController;
import com.seeyoui.kensite.common.constants.StringConstant;
import com.seeyoui.kensite.common.base.domain.EasyUIDataGrid;
import com.seeyoui.kensite.common.base.domain.TreeJson;
import com.seeyoui.kensite.common.base.controller.BaseController;
import com.seeyoui.kensite.common.util.RequestResponseUtil;
import com.seeyoui.kensite.framework.system.domain.SysRoleModule;
import com.seeyoui.kensite.framework.system.domain.SysRoleModule;
import com.seeyoui.kensite.framework.system.service.SysRoleModuleService;
/**
 * @author cuichen
 * @version 1.0
 * @since 1.0
 */
@Controller
@RequestMapping(value = "sysRoleModule")
public class SysRoleModuleController extends BaseController {
	
	@Autowired
	private SysRoleModuleService sysRoleModuleService;
	
	/**
	 * 获取列表展示数据
	 * @param modelMap
	 * @param sysRoleModule
	 * @return
	 * @throws Exception
	 */
	@RequiresPermissions("sysRoleModule:select")
	@RequestMapping(value = "/getTreeJson", method=RequestMethod.POST)
	@ResponseBody
	public String getTreeData(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, SysRoleModule sysRoleModule) throws Exception{
		List<TreeJson> tList = sysRoleModuleService.getTreeJson(sysRoleModule);
		List<TreeJson> jList = TreeJson.formatTree(tList) ;
		JSONArray jsonObj = JSONArray.fromObject(jList.get(0).getChildren());
		return jsonObj.toString();
	}
	
	/**
	 * 保存新增的数据
	 * @param modelMap
	 * @param sysRoleModule
	 * @return
	 * @throws Exception
	 */
	@RequiresPermissions("sysRoleModule:insert")
	@RequestMapping(value = "/saveRoleModule", method=RequestMethod.POST)
	@ResponseBody
	public String saveRoleModule(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, SysRoleModule sysRoleModule) throws Exception{
		sysRoleModuleService.saveSysRoleModule(sysRoleModule);
		RequestResponseUtil.putResponseStr(session, response, request, StringConstant.TRUE);
		return null;
	}
}