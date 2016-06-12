/*
 * Powered By cuichen
 * Since 2014 - 2016
 */
package com.seeyoui.kensite.planManage.planManage.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.seeyoui.kensite.common.base.controller.BaseController;
import com.seeyoui.kensite.common.constants.StringConstant;
import com.seeyoui.kensite.common.util.DBUtils;
import com.seeyoui.kensite.common.util.RequestResponseUtil;
import com.seeyoui.kensite.common.util.StringUtils;
import com.seeyoui.kensite.planManage.planTask.domain.PlanTask;
import com.seeyoui.kensite.planManage.planTask.service.PlanTaskService;
/**
 * 计划管理
 * @author cuichen
 * @version 1.0
 * @since 1.0
 * @date 2016-06-01
 */
@Controller
@RequestMapping(value = "planManage")
public class PlanManageController extends BaseController {
	
	@Autowired
	private PlanTaskService planTaskService;
	
	/**
	 * 当天任务列表
	 * @param modelMap
	 * @param module
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/taskList")
	public ModelAndView taskList(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap) throws Exception {
		String sql = "select * from v_task_details where finish_date is null and trunc(start_date)<=trunc(sysdate) and trunc(end_date)>=trunc(sysdate)";
		List<Map<Object, Object>> currentTaskList = DBUtils.executeQuery(sql);
		modelMap.put("currentTaskList", currentTaskList);
		sql = "select * from v_task_details where finish_date is null and trunc(start_date)=trunc(sysdate)";
		List<Map<Object, Object>> todayStartTaskList = DBUtils.executeQuery(sql);
		sql = "select * from v_task_details where finish_date is null and trunc(end_date)=trunc(sysdate)";
		List<Map<Object, Object>> todayEndTaskList = DBUtils.executeQuery(sql);
		sql = "select * from v_task_details where finish_date is null and trunc(end_date)<trunc(sysdate)";
		List<Map<Object, Object>> delayTaskList = DBUtils.executeQuery(sql);
		modelMap.put("currentTaskList", currentTaskList);
		modelMap.put("todayStartTaskList", todayStartTaskList);
		modelMap.put("todayEndTaskList", todayEndTaskList);
		modelMap.put("delayTaskList", delayTaskList);
		return new ModelAndView("planManage/planManage/taskList", modelMap);
	}
	
	/**
	 * 任务完成
	 * @param session
	 * @param response
	 * @param request
	 * @param modelMap
	 * @param taskId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/taskFinish")
	public Object taskFinish(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, String taskId) throws Exception {
		PlanTask planTask = new PlanTask();
		planTask.setId(taskId);
		planTask.setFinishDate(new Date());
		planTask.preUpdate();
		planTaskService.update(planTask);
		RequestResponseUtil.putResponseStr(session, response, request, modelMap, StringConstant.TRUE);
		return null;
	}
	
	/**
	 * 根据项目ID获取团队成员
	 * @param session
	 * @param response
	 * @param request
	 * @param modelMap
	 * @param projectId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getUserIdByProjectId")
	@ResponseBody
	public Object getUserIdByProjectId(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, String projectId) throws Exception {
		String sql = "select u.id,u.name from plan_project p left join plan_team t on p.team_id=t.id left join plan_team_leaguer tl on t.id=tl.team_id left join sys_user u on tl.user_id=u.id where p.id='"+projectId+"'";
		return JSONArray.fromObject(DBUtils.executeQuery(sql)).toString().toLowerCase();
	}
	
	/**
	 * 任务列表日历
	 * @param modelMap
	 * @param module
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/taskCalendar")
	public ModelAndView taskCalendar(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, String projectId, String userId) throws Exception {
		String sql = "select * from v_task_details where 1=1";
		if(StringUtils.isNoneBlank(projectId)) {
			sql += " and project_id='"+projectId+"'";
		}
		if(StringUtils.isNoneBlank(userId)) {
			sql += " and user_id='"+userId+"'";
		}
		List<Map<Object, Object>> taskList = DBUtils.executeQuery(sql);
		sql = "select id,name from plan_project";
		List<Map<Object, Object>> projectList = DBUtils.executeQuery(sql);
		sql = "select distinct id,name from V_USER_TEAM_PROJECT where 1=1";
		if(StringUtils.isNoneBlank(projectId)) {
			sql += " and project_id='"+projectId+"'";
		} else {
			sql += " and id in (select leader from plan_project)";
		}
		List<Map<Object, Object>> userList = DBUtils.executeQuery(sql);
		modelMap.put("taskList", taskList);
		modelMap.put("projectList", projectList);
		modelMap.put("userList", userList);
		return new ModelAndView("planManage/planManage/taskCalendar", modelMap);
	}
	
	/**
	 * 任务列表日历
	 * @param modelMap
	 * @param module
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/taskReport")
	public ModelAndView taskReport(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, String projectId, String project, String name,
			String startDate, String endDate, String status, String sequence) throws Exception {
		String sql = "select * from v_task_details where 1=1";
		if(StringUtils.isNoneBlank(projectId)) {
			sql += " and id='"+projectId+"'";
			modelMap.put("projectId", projectId);
		} else {
			modelMap.put("projectId", "");
		}
		if(StringUtils.isNoneBlank(project)) {
			sql += " and project like '%"+project+"%'";
			modelMap.put("project", project);
		} else {
			modelMap.put("project", "");
		}
		if(StringUtils.isNoneBlank(name)) {
			sql += " and name like '%"+name+"%'";
			modelMap.put("name", name);
		} else {
			modelMap.put("name", "");
		}
		if(StringUtils.isNoneBlank(status)) {
			sql += " and status like '"+status+"'";
			modelMap.put("status", status);
		} else {
			modelMap.put("status", "");
		}
		if(StringUtils.isNoneBlank(sequence)) {
			sql += " and sequence like '"+sequence+"'";
			modelMap.put("sequence", sequence);
		} else {
			modelMap.put("sequence", "");
		}
		if(StringUtils.isNoneBlank(startDate)) {
			sql += " and start_date >= to_date('"+startDate+"', 'yyyy-mm-dd')";
			modelMap.put("startDate", startDate);
		} else {
			modelMap.put("startDate", "");
		}
		if(StringUtils.isNoneBlank(endDate)) {
			sql += " and end_date <= to_date('"+endDate+"', 'yyyy-mm-dd')";
			modelMap.put("endDate", endDate);
		} else {
			modelMap.put("endDate", "");
		}
		sql += " order by project_id,user_id,sequence";
		List<Map<Object, Object>> taskList = DBUtils.executeQuery(sql);
		modelMap.put("taskList", taskList);
		return new ModelAndView("planManage/planManage/taskReport", modelMap);
	}
	
	/**
	 * 任务列表日历
	 * @param modelMap
	 * @param module
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/taskWeekReport")
	public ModelAndView taskWeekReport(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, String projectId, String project, String name,
			String startDate, String endDate, String status, String sequence) throws Exception {
//		String sql = "select * from V_USER_TASK_DETAILS where 1=1";
//		if(StringUtils.isNoneBlank(projectId)) {
//			sql += " and id='"+projectId+"'";
//			modelMap.put("projectId", projectId);
//		} else {
//			modelMap.put("projectId", "");
//		}
//		if(StringUtils.isNoneBlank(project)) {
//			sql += " and project like '%"+project+"%'";
//			modelMap.put("project", project);
//		} else {
//			modelMap.put("project", "");
//		}
//		if(StringUtils.isNoneBlank(name)) {
//			sql += " and name like '%"+name+"%'";
//			modelMap.put("name", name);
//		} else {
//			modelMap.put("name", "");
//		}
//		if(StringUtils.isNoneBlank(status)) {
//			sql += " and status like '"+status+"'";
//			modelMap.put("status", status);
//		} else {
//			modelMap.put("status", "");
//		}
//		if(StringUtils.isNoneBlank(sequence)) {
//			sql += " and sequence like '"+sequence+"'";
//			modelMap.put("sequence", sequence);
//		} else {
//			modelMap.put("sequence", "");
//		}
//		if(StringUtils.isNoneBlank(startDate)) {
//			sql += " and start_date >= to_date('"+startDate+"', 'yyyy-mm-dd')";
//			modelMap.put("startDate", startDate);
//		} else {
//			modelMap.put("startDate", "");
//		}
//		if(StringUtils.isNoneBlank(endDate)) {
//			sql += " and end_date <= to_date('"+endDate+"', 'yyyy-mm-dd')";
//			modelMap.put("endDate", endDate);
//		} else {
//			modelMap.put("endDate", "");
//		}
//		sql += " order by project_id,user_id,sequence";
//		List<Map<Object, Object>> taskList = DBUtils.executeQuery(sql);
//		modelMap.put("taskList", taskList);
		return new ModelAndView("planManage/planManage/taskWeekReport", modelMap);
	}
}