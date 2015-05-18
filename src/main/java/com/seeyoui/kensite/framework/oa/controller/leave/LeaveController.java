package com.seeyoui.kensite.framework.oa.controller.leave;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.common.collect.Maps;
import com.opensymphony.module.sitemesh.Page;
import com.seeyoui.kensite.common.base.controller.BaseController;
import com.seeyoui.kensite.common.base.persistence.JsonMapper;
import com.seeyoui.kensite.common.constants.StringConstant;
import com.seeyoui.kensite.common.util.RequestResponseUtil;
import com.seeyoui.kensite.framework.oa.domain.leave.Leave;
import com.seeyoui.kensite.framework.oa.service.leave.LeaveService;
import com.seeyoui.kensite.framework.system.util.UserUtils;

@Controller
@RequestMapping(value = "oa/leave")
public class LeaveController extends BaseController {

	private Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	protected LeaveService leaveService;

	@Autowired
	protected RuntimeService runtimeService;

	@Autowired
	protected TaskService taskService;

	@RequiresPermissions("oa:leave:view")
	@RequestMapping(value = {"form"})
	public ModelAndView form(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, Leave leave) {
		modelMap.put("leave", leave);
		return new ModelAndView("/framework/oa/leave/leaveForm");
	}

	/**
	 * 启动请假流程
	 * @param leave	
	 */
	@RequiresPermissions("oa:leave:create")
	@RequestMapping(value = "start", method = RequestMethod.POST)
	public ModelAndView start(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, Leave leave) {
		try {
			Map<String, Object> variables = Maps.newHashMap();
			leaveService.start(leave, variables);
			logger.info("流程已启动，流程ID：" + leave.getBindid());
		} catch (Exception e) {
			logger.error("启动请假流程失败：", e);
		}
		RequestResponseUtil.putResponseStr(session, response, request, StringConstant.TRUE);
		return null;
	}

	/**
	 * 任务列表
	 * @param leave	
	 */
	@RequiresPermissions("oa:leave:view")
	@RequestMapping(value = {"list/task",""})
	public ModelAndView taskList(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap) {
		String userId = UserUtils.getUser().getUsername();//ObjectUtils.toString(UserUtils.getUser().getId());
		List<Leave> leaveList = leaveService.findTodoTasks(userId);
		modelMap.put("leaveList", leaveList);
		return new ModelAndView("modules/oa/leaveTask");
	}

	/**
	 * 读取所有流程
	 * @return
	 */
	@RequiresPermissions("oa:leave:view")
	@RequestMapping(value = {"list"})
	public ModelAndView list(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, Leave leave) {
        List<Leave> leaveList = leaveService.find(leave); 
        modelMap.put("leaveList", leaveList);
		return new ModelAndView("framework/oa/leave/leaveList");
	}
	
	/**
	 * 读取详细数据
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "detail/{id}")
	@ResponseBody
	public String getLeave(@PathVariable("id") String id) {
		Leave leave = leaveService.findLeaveById(id);
		return JsonMapper.getInstance().toJson(leave);
	}

	/**
	 * 读取详细数据
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "detail-with-vars/{id}/{taskId}")
	@ResponseBody
	public String getLeaveWithVars(@PathVariable("id") String id, @PathVariable("taskId") String taskId) {
		Leave leave = leaveService.findLeaveById(id);
		Map<String, Object> variables = taskService.getVariables(taskId);
		leave.setVariables(variables);
		return JsonMapper.getInstance().toJson(leave);
	}

}
