package com.seeyoui.kensite.framework.act.controller;

import java.io.InputStream;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.activiti.engine.ProcessEngine;
import org.activiti.engine.ProcessEngines;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.task.Task;
import org.junit.Assert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.seeyoui.kensite.framework.act.service.ActModelService;

@Controller
@RequestMapping(value = "activiti")
public class ActivitiTest {
	
	@Resource
	private RepositoryService repositoryService;
	@Resource
	private RuntimeService runtimeService;
	@Resource 
	TaskService taskService;
	@Autowired
	private ActModelService actModelService;
	
	@RequestMapping(value = "/test")
	public ModelAndView showSysDepartmentPageList(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap) throws Exception {
//		ProcessEngine processEngine = ProcessEngines.getDefaultProcessEngine();
//		RepositoryService repositoryService = processEngine.getRepositoryService();
//		repositoryService.createDeployment().addClasspathResource("org/activiti/test/VacationRequest.bpmn20.xml").deploy();
//		System.out.println(repositoryService.createProcessDefinitionQuery().count());
//		String filePath="holidayRequest.bpmn";
//		InputStream is = Class.class.getClass().getResource("/"+filePath).openStream();
//		Assert.assertNotNull(is);
		//发布流程
//		Deployment deployment=repositoryService.createDeployment().addInputStream("bpmn20.xml", is).name("holidayRequest").deploy();
		Deployment deployment = repositoryService.createDeployment().addClasspathResource("act/diagrams/holidayRequest.bpmn").deploy();
		Assert.assertNotNull(deployment);
		System.out.println("deployId:" + deployment.getId());
		//查询流程定义
		ProcessDefinition processDefinition=repositoryService.createProcessDefinitionQuery().deploymentId(deployment.getId()).singleResult();
		
		Long businessKey=new Double(1000000*Math.random()).longValue();
		//启动流程
		runtimeService.startProcessInstanceById(processDefinition.getId(),businessKey.toString());
		//查询任务实例
		List<Task> taskList=taskService.createTaskQuery().processDefinitionId(processDefinition.getId()).list();
		Assert.assertNotNull(taskList==null);
		Assert.assertTrue(taskList.size()>0);
		for(Task task:taskList){
			System.out.println("task name is " + task.getName() + " ,task key is " + task.getTaskDefinitionKey());
		}
		return null;
	}
	
	@RequestMapping(value = "/addModel")
	public ModelAndView addModel(String name, String key, String description, String category,
			HttpSession session, HttpServletResponse response, HttpServletRequest request, ModelMap modelMap) throws Exception {
		try {
			org.activiti.engine.repository.Model modelData = actModelService.create(name, key, description, category);
			response.sendRedirect(request.getContextPath() + "/act/rest/service/editor?id=" + modelData.getId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
