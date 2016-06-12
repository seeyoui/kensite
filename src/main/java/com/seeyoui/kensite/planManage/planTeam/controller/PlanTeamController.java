/*
 * Powered By cuichen
 * Since 2014 - 2016
 */
package com.seeyoui.kensite.planManage.planTeam.controller;

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

import com.seeyoui.kensite.planManage.planTeam.domain.PlanTeam;
import com.seeyoui.kensite.planManage.planTeam.service.PlanTeamService;
/**
 * 团队
 * @author cuichen
 * @version 1.0
 * @since 1.0
 * @date 2016-06-01
 */
@Controller
@RequestMapping(value = "planManage/planTeam")
public class PlanTeamController extends BaseController {
	
	@Autowired
	private PlanTeamService planTeamService;
	
	/**
	 * 展示列表页面
	 * @param modelMap
	 * @param module
	 * @return
	 * @throws Exception
	 */
	//@RequiresPermissions("planManage:planTeam:view")
	@RequestMapping(value = "/{page}")
	public ModelAndView view(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, @PathVariable String page) throws Exception {
		return new ModelAndView("planManage/planTeam/"+page, modelMap);
	}
	
	/**
	 * 根据ID查询单条数据
	 * @param modelMap
	 * @param module
	 * @return
	 * @throws Exception
	 */
	//@RequiresPermissions("planManage:planTeam:select")
	@RequestMapping(value = "/data/{id}")
	@ResponseBody
	public Object data(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, @PathVariable String id) throws Exception {
		PlanTeam planTeam = planTeamService.findOne(id);
		return planTeam;
	}
	
	/**
	 * 获取列表展示数据
	 * @param modelMap
	 * @param planTeam
	 * @return
	 * @throws Exception
	 */
	//@RequiresPermissions("planManage:planTeam:select")
	@RequestMapping(value = "/list/data", method=RequestMethod.POST)
	@ResponseBody
	public Object listData(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, PlanTeam planTeam) throws Exception {
		List<PlanTeam> planTeamList = planTeamService.findList(planTeam);
		int total = planTeamService.findTotal(planTeam);
		EasyUIDataGrid eudg = new EasyUIDataGrid();
		eudg.setTotal(String.valueOf(total));
		eudg.setRows(planTeamList);
		return eudg;
	}
	
	/**
	 * 获取所有数据
	 * @param modelMap
	 * @param planTeam
	 * @return
	 * @throws Exception
	 */
	//@RequiresPermissions("planManage:planTeam:select")
	@RequestMapping(value = "/list/all", method=RequestMethod.POST)
	@ResponseBody
	public Object listAll(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, PlanTeam planTeam) throws Exception {
		List<PlanTeam> planTeamList = planTeamService.findAll(planTeam);
		return planTeamList;
	}
	
	/**
	 * 保存新增的数据
	 * @param modelMap
	 * @param planTeam
	 * @return
	 * @throws Exception
	 */
	//@RequiresPermissions("planManage:planTeam:insert")
	@RequestMapping(value = "/save", method=RequestMethod.POST)
	@ResponseBody
	public String save(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, PlanTeam planTeam) throws Exception {
		if (!beanValidator(modelMap, planTeam)){
			RequestResponseUtil.putResponseStr(session, response, request, modelMap, StringConstant.FALSE);
			return null;
		}
		planTeamService.save(planTeam);
		RequestResponseUtil.putResponseStr(session, response, request, modelMap, StringConstant.TRUE);
		return null;
	}
	
	/**
	 * 保存修改的数据
	 * @param modelMap
	 * @param planTeam
	 * @return
	 * @throws Exception
	 */
	//@RequiresPermissions("planManage:planTeam:update")
	@RequestMapping(value = "/update", method=RequestMethod.POST)
	@ResponseBody
	public String update(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, PlanTeam planTeam) throws Exception {
		if (!beanValidator(modelMap, planTeam)){
			RequestResponseUtil.putResponseStr(session, response, request, modelMap, StringConstant.FALSE);
			return null;
		}
		planTeamService.update(planTeam);
		RequestResponseUtil.putResponseStr(session, response, request, modelMap, StringConstant.TRUE);
		return null;
	}
	
	/**
	 * 删除数据库
	 * @param modelMap
	 * @param planTeamId
	 * @return
	 * @throws Exception
	 */
	//@RequiresPermissions("planManage:planTeam:delete")
	@RequestMapping(value = "/delete", method=RequestMethod.POST)
	@ResponseBody
	public String delete(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, String id) throws Exception {
		List<String> listId = Arrays.asList(id.split(","));
		planTeamService.delete(listId);
		RequestResponseUtil.putResponseStr(session, response, request, modelMap, StringConstant.TRUE);
		return null;
	}

	/**
	 * 导出Excel数据
	 * @param modelMap
	 * @param planTeam
	 * @return
	 * @throws Exception
	 */
	//@RequiresPermissions("planManage:planTeam:export")
	@RequestMapping(value = "/export")
	public String export(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, PlanTeam planTeam) throws Exception {
		String fileName = DateUtils.getDate("yyyyMMddHHmmss")+".xlsx";
		List<PlanTeam> planTeamList = planTeamService.findAll(planTeam);
		new ExportExcel(null, PlanTeam.class).setDataList(planTeamList).write(response, fileName).dispose();
		return null;
	}
}