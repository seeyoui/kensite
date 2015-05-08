package com.hotent.test.bpm;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import javax.annotation.Resource;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.task.Task;
import org.junit.Assert;
import org.junit.Test;
import com.hotent.test.BaseTestCase;
public class BpmDefinitionTest extends BaseTestCase{
	@Resource
	private RepositoryService repositoryService;
	@Resource
	private RuntimeService runtimeService;
	@Resource 
	TaskService taskService;
	
	@Test
	public void testDeploy() throws IOException{
		InputStream is=readXmlFile();
		Assert.assertNotNull(is);
		//发布流程
		Deployment deployment=repositoryService.createDeployment().addInputStream("bpmn20.xml", is).name("holidayRequest").deploy();
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
	}
	
	public InputStream readXmlFile() throws IOException{
		String filePath="holidayRequest.bpmn";
		return Class.class.getClass().getResource("/"+filePath).openStream();
	}
}
