/*
 * Powered By cuichen
 * Since 2014 - 2015
 */
package com.seeyoui.kensite.framework.mod.tableColumn.controller;  
 
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
import com.seeyoui.kensite.framework.mod.tableColumn.domain.TableColumn;
import com.seeyoui.kensite.framework.mod.tableColumn.service.TableColumnService;
/**
 * 业务表字段
 * @author cuichen
 * @version 1.0
 * @since 1.0
 * @date 2015-10-24
 */
@Controller
@RequestMapping(value = "sys/tableColumn")
public class TableColumnController extends BaseController {
	
	@Autowired
	private TableColumnService tableColumnService;
	
	/**
	 * 展示列表页面
	 * @param modelMap
	 * @return
	 * @throws Exception
	 */
	@RequiresPermissions("sys:tableColumn:view")
	@RequestMapping(value = "/showPageList")
	public ModelAndView showTableColumnPageList(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap) throws Exception {
		return new ModelAndView("framework/mod/tableColumn/tableColumn", modelMap);
	}
	
	/**
	 * 获取列表展示数据
	 * @param modelMap
	 * @param tableColumn
	 * @return
	 * @throws Exception
	 */
	@RequiresPermissions("sys:tableColumn:select")
	@RequestMapping(value = "/getListData", method=RequestMethod.POST)
	@ResponseBody
	public String getListData(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, TableColumn tableColumn) throws Exception{
		List<TableColumn> tableColumnList = tableColumnService.findTableColumnList(tableColumn);
		EasyUIDataGrid eudg = tableColumnService.findTableColumnListTotal(tableColumn);
		eudg.setRows(tableColumnList);
		JSONObject jsonObj = JSONObject.fromObject(eudg);
		RequestResponseUtil.putResponseStr(session, response, request, jsonObj);
		return null;
	}
	
	/**
	 * 获取所有数据
	 * @param modelMap
	 * @param tableColumn
	 * @return
	 * @throws Exception
	 */
	@RequiresPermissions("sys:tableColumn:select")
	@RequestMapping(value = "/getAllListData", method=RequestMethod.POST)
	@ResponseBody
	public String getAllListData(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, TableColumn tableColumn) throws Exception{
		List<TableColumn> tableColumnList = tableColumnService.findAllTableColumnList(tableColumn);
		JSONArray jsonObj = JSONArray.fromObject(tableColumnList);
		RequestResponseUtil.putResponseStr(session, response, request, jsonObj);
		return null;
	}
	
	/**
	 * 保存新增的数据
	 * @param modelMap
	 * @param tableColumn
	 * @return
	 * @throws Exception
	 */
	@RequiresPermissions("sys:tableColumn:insert")
	@RequestMapping(value = "/saveByAdd", method=RequestMethod.POST)
	@ResponseBody
	public String saveTableColumnByAdd(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, TableColumn tableColumn) throws Exception{
		if (!beanValidator(modelMap, tableColumn)){
			RequestResponseUtil.putResponseStr(session, response, request, modelMap, StringConstant.FALSE);
			return null;
		}
		tableColumnService.saveTableColumn(tableColumn);
		RequestResponseUtil.putResponseStr(session, response, request, modelMap, StringConstant.TRUE);
		return null;
	}
	
	/**
	 * 保存修改的数据
	 * @param modelMap
	 * @param tableColumn
	 * @return
	 * @throws Exception
	 */
	@RequiresPermissions("sys:tableColumn:update")
	@RequestMapping(value = "/saveByUpdate", method=RequestMethod.POST)
	@ResponseBody
	public String saveTableColumnByUpdate(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, TableColumn tableColumn) throws Exception{
		if (!beanValidator(modelMap, tableColumn)){
			RequestResponseUtil.putResponseStr(session, response, request, modelMap, StringConstant.FALSE);
			return null;
		}
		tableColumnService.updateTableColumn(tableColumn);
		RequestResponseUtil.putResponseStr(session, response, request, modelMap, StringConstant.TRUE);
		return null;
	}
	
	/**
	 * 删除数据库
	 * @param modelMap
	 * @param tableColumnId
	 * @return
	 * @throws Exception
	 */
	@RequiresPermissions("sys:tableColumn:delete")
	@RequestMapping(value = "/delete", method=RequestMethod.POST)
	@ResponseBody
	public String delete(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, String delDataId) throws Exception {
		List<String> listId = Arrays.asList(delDataId.split(","));
		tableColumnService.deleteTableColumn(listId);
		RequestResponseUtil.putResponseStr(session, response, request, modelMap, StringConstant.TRUE);
		return null;
	}
}