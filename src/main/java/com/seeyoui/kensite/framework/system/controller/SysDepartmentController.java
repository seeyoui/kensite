/*
 * Powered By cuichen
 * Since 2014 - 2015
 */
package com.seeyoui.kensite.framework.system.controller;  
 
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
import org.springframework.web.bind.annotation.ModelAttribute;
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
import com.seeyoui.kensite.framework.system.domain.SysDepartment;
import com.seeyoui.kensite.framework.system.service.SysDepartmentService;
/**
 * @author cuichen
 * @version 1.0
 * @since 1.0
 */
@Controller
@RequestMapping(value = "sysDepartment")
public class SysDepartmentController extends BaseController {
	
	@Autowired
	private SysDepartmentService sysDepartmentService;
	
	/**
	 * 展示列表页面
	 * @param modelMap
	 * @param module
	 * @return
	 * @throws Exception
	 */
	@RequiresPermissions("sysDepartment:view")
	@RequestMapping(value = "/showPageList")
	public ModelAndView showSysDepartmentPageList(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap) throws Exception {
		return new ModelAndView("framework/system/sysDepartment", modelMap);
	}
	
	/**
	 * 获取列表展示数据
	 * @param modelMap
	 * @param sysDepartment
	 * @return
	 * @throws Exception
	 */
	@RequiresPermissions("sysDepartment:select")
	@RequestMapping(value = "/getListData", method=RequestMethod.POST)
	@ResponseBody
	public String getListData(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, SysDepartment sysDepartment) throws Exception{
		List<SysDepartment> sysDepartmentList = sysDepartmentService.findSysDepartmentList(sysDepartment);
		EasyUIDataGrid eudg = sysDepartmentService.findSysDepartmentListTotal(sysDepartment);
		eudg.setRows(sysDepartmentList);
		JSONObject jsonObj = JSONObject.fromObject(eudg);
		RequestResponseUtil.putResponseStr(session, response, request, jsonObj);
		return null;
	}
	
	/**
	 * 获取模块TREE页面JSON数据
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getTreeJson", method=RequestMethod.POST)
	@ResponseBody
	public String getTreeJson() throws Exception {
		List<SysDepartment> mList = sysDepartmentService.getTreeJson();
		List<TreeJson> tList = new ArrayList<TreeJson>();
		for(int i=0; i<mList.size(); i++) {
			TreeJson tj = new TreeJson();
			tj.setId(mList.get(i).getId());
			tj.setPid(mList.get(i).getParentid());
			tj.setText(mList.get(i).getName());
			tList.add(tj);
		}
		TreeJson root = new TreeJson();
		root.setId(StringConstant.ROOT_ID_32);
		TreeJson.getTree(tList, root);
		JSONArray jsonObj = JSONArray.fromObject(root.getChildren());
		return jsonObj.toString();
	}
	
	/**
	 * 保存新增的数据
	 * @param modelMap
	 * @param sysDepartment
	 * @return
	 * @throws Exception
	 */
	@RequiresPermissions("sysDepartment:insert")
	@RequestMapping(value = "/saveByAdd", method=RequestMethod.POST)
	@ResponseBody
	public String saveSysDepartmentByAdd(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, SysDepartment sysDepartment) throws Exception{
		sysDepartmentService.saveSysDepartment(sysDepartment);
		RequestResponseUtil.putResponseStr(session, response, request, StringConstant.TRUE);
		return null;
	}
	
	/**
	 * 保存修改的数据
	 * @param modelMap
	 * @param sysDepartment
	 * @return
	 * @throws Exception
	 */
	@RequiresPermissions("sysDepartment:update")
	@RequestMapping(value = "/saveByUpdate", method=RequestMethod.POST)
	@ResponseBody
	public String saveSysDepartmentByUpdate(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, SysDepartment sysDepartment) throws Exception{
		sysDepartmentService.updateSysDepartment(sysDepartment);
		RequestResponseUtil.putResponseStr(session, response, request, StringConstant.TRUE);
		return null;
	}
	
	/**
	 * 删除数据库
	 * @param modelMap
	 * @param sysDepartmentId
	 * @return
	 * @throws Exception
	 */
	@RequiresPermissions("sysDepartment:delete")
	@RequestMapping(value = "/delete", method=RequestMethod.POST)
	@ResponseBody
	public String delete(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, String delDataId) throws Exception {
		List<String> listId = Arrays.asList(delDataId.split(","));
		sysDepartmentService.deleteSysDepartment(listId);
		RequestResponseUtil.putResponseStr(session, response, request, StringConstant.TRUE);
		return null;
	}
}