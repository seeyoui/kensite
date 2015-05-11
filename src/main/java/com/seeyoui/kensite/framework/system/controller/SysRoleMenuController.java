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
import com.seeyoui.kensite.framework.system.domain.SysRoleMenu;
import com.seeyoui.kensite.framework.system.service.SysRoleMenuService;
/**
 * @author cuichen
 * @version 1.0
 * @since 1.0
 */
@Controller
@RequestMapping(value = "sysRoleMenu")
public class SysRoleMenuController extends BaseController {
	
	@Autowired
	private SysRoleMenuService sysRoleMenuService;
	
	/**
	 * 获取列表展示数据
	 * @param modelMap
	 * @param sysRoleMenu
	 * @return
	 * @throws Exception
	 */
	@RequiresPermissions("sysRoleMenu:select")
	@RequestMapping(value = "/getListData", method=RequestMethod.POST)
	@ResponseBody
	public String getListData(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, SysRoleMenu sysRoleMenu) throws Exception{
		List<SysRoleMenu> sysRoleMenuList = sysRoleMenuService.findSysRoleMenuList(sysRoleMenu);
		EasyUIDataGrid eudg = sysRoleMenuService.findSysRoleMenuListTotal(sysRoleMenu);
		eudg.setRows(sysRoleMenuList);
		JSONObject jsonObj = JSONObject.fromObject(eudg);
		RequestResponseUtil.putResponseStr(session, response, request, jsonObj);
		return null;
	}
	
	/**
	 * 获取列表展示数据
	 * @param modelMap
	 * @param sysRoleMenu
	 * @return
	 * @throws Exception
	 */
	@RequiresPermissions("sysRoleMenu:select")
	@RequestMapping(value = "/getTreeJson", method=RequestMethod.POST)
	@ResponseBody
	public String getTreeData(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, SysRoleMenu sysRoleMenu) throws Exception{
		List<TreeJson> tList = sysRoleMenuService.getTreeJson(sysRoleMenu);
		List<TreeJson> jList = TreeJson.formatTree(tList) ;
		JSONArray jsonObj = JSONArray.fromObject(jList.get(0));
		return jsonObj.toString();
	}
	
	/**
	 * 保存新增的数据
	 * @param modelMap
	 * @param sysRoleMenu
	 * @return
	 * @throws Exception
	 */
	@RequiresPermissions("sysRoleMenu:insert")
	@RequestMapping(value = "/saveByAdd", method=RequestMethod.POST)
	@ResponseBody
	public String saveSysRoleMenuByAdd(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, SysRoleMenu sysRoleMenu) throws Exception{
		sysRoleMenuService.saveSysRoleMenu(sysRoleMenu);
		RequestResponseUtil.putResponseStr(session, response, request, StringConstant.TRUE);
		return null;
	}
	
	/**
	 * 保存修改的数据
	 * @param modelMap
	 * @param sysRoleMenu
	 * @return
	 * @throws Exception
	 */
	@RequiresPermissions("sysRoleMenu:update")
	@RequestMapping(value = "/saveByUpdate", method=RequestMethod.POST)
	@ResponseBody
	public String saveSysRoleMenuByUpdate(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, SysRoleMenu sysRoleMenu) throws Exception{
		sysRoleMenuService.updateSysRoleMenu(sysRoleMenu);
		RequestResponseUtil.putResponseStr(session, response, request, StringConstant.TRUE);
		return null;
	}
	
	/**
	 * 删除数据库
	 * @param modelMap
	 * @param sysRoleMenuId
	 * @return
	 * @throws Exception
	 */
	@RequiresPermissions("sysRoleMenu:delete")
	@RequestMapping(value = "/delete", method=RequestMethod.POST)
	@ResponseBody
	public String delete(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, String delDataId) throws Exception {
		List<String> listId = Arrays.asList(delDataId.split(","));
		sysRoleMenuService.deleteSysRoleMenu(listId);
		RequestResponseUtil.putResponseStr(session, response, request, StringConstant.TRUE);
		return null;
	}
}