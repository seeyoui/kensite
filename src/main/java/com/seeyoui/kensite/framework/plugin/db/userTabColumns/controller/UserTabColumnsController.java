/*
 * Powered By cuichen
 * Since 2014 - 2015
 */
package com.seeyoui.kensite.framework.plugin.db.userTabColumns.controller;  
 
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
import com.seeyoui.kensite.common.util.RequestResponseUtil;

import com.seeyoui.kensite.common.constants.StringConstant;
import com.seeyoui.kensite.common.base.domain.EasyUIDataGrid;
import com.seeyoui.kensite.common.base.controller.BaseController;
import com.seeyoui.kensite.common.util.RequestResponseUtil;
import com.seeyoui.kensite.framework.plugin.db.userTabColumns.domain.UserTabColumns;
import com.seeyoui.kensite.framework.plugin.db.userTabColumns.service.UserTabColumnsService;
/**
 * UserTabColumns
 * @author cuichen
 * @version 1.0
 * @since 1.0
 * @date 2015-10-20
 */
@Controller
@RequestMapping(value = "sys/userTabColumns")
public class UserTabColumnsController extends BaseController {
	
	@Autowired
	private UserTabColumnsService userTabColumnsService;
	
	/**
	 * 获取列表展示数据
	 * @param modelMap
	 * @param userTabColumns
	 * @return
	 * @throws Exception
	 */
	@RequiresPermissions("sys:userTabColumns:select")
	@RequestMapping(value = "/list/data", method=RequestMethod.POST)
	@ResponseBody
	public Object listData(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, UserTabColumns userTabColumns) throws Exception{
		List<UserTabColumns> userTabColumnsList = userTabColumnsService.findList(userTabColumns);
		int total = userTabColumnsService.findTotal(userTabColumns);
		EasyUIDataGrid eudg = new EasyUIDataGrid();
		eudg.setRows(userTabColumnsList);
		eudg.setTotal(String.valueOf(total));
		return eudg;
	}
	
	/**
	 * 获取所有数据
	 * @param modelMap
	 * @param userTabColumns
	 * @return
	 * @throws Exception
	 */
	@RequiresPermissions("sys:userTabColumns:select")
	@RequestMapping(value = "/list/all", method=RequestMethod.POST)
	@ResponseBody
	public Object listAll(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, UserTabColumns userTabColumns) throws Exception{
		List<UserTabColumns> userTabColumnsList = userTabColumnsService.findAll(userTabColumns);
		return userTabColumnsList;
	}
	
}