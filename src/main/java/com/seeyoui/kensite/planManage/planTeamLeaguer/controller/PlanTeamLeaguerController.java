/*
 * Powered By cuichen
 * Since 2014 - 2016
 */
package com.seeyoui.kensite.planManage.planTeamLeaguer.controller;

import java.sql.*;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.lucene.index.Term;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.seeyoui.kensite.common.constants.StringConstant;
import com.seeyoui.kensite.common.util.RequestResponseUtil;
import com.seeyoui.kensite.framework.luence.domain.LuceneDocument;
import com.seeyoui.kensite.framework.luence.util.LuceneUtils;
import com.seeyoui.kensite.common.util.DateUtils;
import com.seeyoui.kensite.common.constants.StringConstant;
import com.seeyoui.kensite.common.base.domain.EasyUIDataGrid;
import com.seeyoui.kensite.common.base.controller.BaseController;
import com.seeyoui.kensite.common.util.RequestResponseUtil;
import com.seeyoui.kensite.common.util.excel.ExportExcel;
import com.seeyoui.kensite.framework.luence.domain.LuceneDocument;
import com.seeyoui.kensite.framework.luence.util.LuceneUtils;
import com.seeyoui.kensite.planManage.planTeamLeaguer.domain.PlanTeamLeaguer;
import com.seeyoui.kensite.planManage.planTeamLeaguer.service.PlanTeamLeaguerService;
/**
 * 团队成员
 * @author cuichen
 * @version 1.0
 * @since 1.0
 * @date 2016-06-01
 */
@Controller
@RequestMapping(value = "planManage/planTeamLeaguer")
public class PlanTeamLeaguerController extends BaseController {
	
	@Autowired
	private PlanTeamLeaguerService planTeamLeaguerService;
	
	/**
	 * 展示列表页面
	 * @param modelMap
	 * @param module
	 * @return
	 * @throws Exception
	 */
	//@RequiresPermissions("planManage:planTeamLeaguer:view")
	@RequestMapping(value = "/{page}")
	public ModelAndView view(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, @PathVariable String page) throws Exception {
		return new ModelAndView("planManage/planTeamLeaguer/"+page, modelMap);
	}
	
	/**
	 * 根据ID查询单条数据
	 * @param modelMap
	 * @param module
	 * @return
	 * @throws Exception
	 */
	//@RequiresPermissions("planManage:planTeamLeaguer:select")
	@RequestMapping(value = "/data/{id}")
	@ResponseBody
	public Object data(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, @PathVariable String id) throws Exception {
		PlanTeamLeaguer planTeamLeaguer = planTeamLeaguerService.findOne(id);
		return planTeamLeaguer;
	}
	
	/**
	 * 获取列表展示数据
	 * @param modelMap
	 * @param planTeamLeaguer
	 * @return
	 * @throws Exception
	 */
	//@RequiresPermissions("planManage:planTeamLeaguer:select")
	@RequestMapping(value = "/list/data", method=RequestMethod.POST)
	@ResponseBody
	public Object listData(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, PlanTeamLeaguer planTeamLeaguer) throws Exception {
		List<PlanTeamLeaguer> planTeamLeaguerList = planTeamLeaguerService.findList(planTeamLeaguer);
		int total = planTeamLeaguerService.findTotal(planTeamLeaguer);
		EasyUIDataGrid eudg = new EasyUIDataGrid();
		eudg.setTotal(String.valueOf(total));
		eudg.setRows(planTeamLeaguerList);
		return eudg;
	}
	
	/**
	 * 获取所有数据
	 * @param modelMap
	 * @param planTeamLeaguer
	 * @return
	 * @throws Exception
	 */
	//@RequiresPermissions("planManage:planTeamLeaguer:select")
	@RequestMapping(value = "/list/all", method=RequestMethod.POST)
	@ResponseBody
	public Object listAll(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, PlanTeamLeaguer planTeamLeaguer) throws Exception {
		List<PlanTeamLeaguer> planTeamLeaguerList = planTeamLeaguerService.findAll(planTeamLeaguer);
		return planTeamLeaguerList;
	}
	
	/**
	 * 保存新增的数据
	 * @param modelMap
	 * @param planTeamLeaguer
	 * @return
	 * @throws Exception
	 */
	//@RequiresPermissions("planManage:planTeamLeaguer:insert")
	@RequestMapping(value = "/save", method=RequestMethod.POST)
	@ResponseBody
	public String save(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, PlanTeamLeaguer planTeamLeaguer) throws Exception {
		if (!beanValidator(modelMap, planTeamLeaguer)){
			RequestResponseUtil.putResponseStr(session, response, request, modelMap, StringConstant.FALSE);
			return null;
		}
		PlanTeamLeaguer valid = new PlanTeamLeaguer();
		valid.setTeamId(planTeamLeaguer.getTeamId());
		valid.setUserId(planTeamLeaguer.getUserId());
		List<PlanTeamLeaguer> validList = planTeamLeaguerService.findAll(valid);
		if(validList != null && validList.size() > 0) {
			Map<String, String> result = new HashMap<String, String>();
			result.put("userId", "团队已存在该成员");
			modelMap.put("message", result);
			RequestResponseUtil.putResponseStr(session, response, request, modelMap, StringConstant.FALSE);
			return null;
		}
		planTeamLeaguerService.save(planTeamLeaguer);
		RequestResponseUtil.putResponseStr(session, response, request, modelMap, StringConstant.TRUE);
		return null;
	}
	
	/**
	 * 保存修改的数据
	 * @param modelMap
	 * @param planTeamLeaguer
	 * @return
	 * @throws Exception
	 */
	//@RequiresPermissions("planManage:planTeamLeaguer:update")
	@RequestMapping(value = "/update", method=RequestMethod.POST)
	@ResponseBody
	public String update(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, PlanTeamLeaguer planTeamLeaguer) throws Exception {
		if (!beanValidator(modelMap, planTeamLeaguer)){
			RequestResponseUtil.putResponseStr(session, response, request, modelMap, StringConstant.FALSE);
			return null;
		}
		planTeamLeaguerService.update(planTeamLeaguer);
		RequestResponseUtil.putResponseStr(session, response, request, modelMap, StringConstant.TRUE);
		return null;
	}
	
	/**
	 * 删除数据库
	 * @param modelMap
	 * @param planTeamLeaguerId
	 * @return
	 * @throws Exception
	 */
	//@RequiresPermissions("planManage:planTeamLeaguer:delete")
	@RequestMapping(value = "/delete", method=RequestMethod.POST)
	@ResponseBody
	public String delete(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, String id) throws Exception {
		List<String> listId = Arrays.asList(id.split(","));
		planTeamLeaguerService.delete(listId);
		RequestResponseUtil.putResponseStr(session, response, request, modelMap, StringConstant.TRUE);
		return null;
	}

	/**
	 * 导出Excel数据
	 * @param modelMap
	 * @param planTeamLeaguer
	 * @return
	 * @throws Exception
	 */
	//@RequiresPermissions("planManage:planTeamLeaguer:export")
	@RequestMapping(value = "/export")
	public String export(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, PlanTeamLeaguer planTeamLeaguer) throws Exception {
		String fileName = DateUtils.getDate("yyyyMMddHHmmss")+".xlsx";
		List<PlanTeamLeaguer> planTeamLeaguerList = planTeamLeaguerService.findAll(planTeamLeaguer);
		new ExportExcel(null, PlanTeamLeaguer.class).setDataList(planTeamLeaguerList).write(response, fileName).dispose();
		return null;
	}
}