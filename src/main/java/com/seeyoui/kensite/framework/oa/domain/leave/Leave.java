package com.seeyoui.kensite.framework.oa.domain.leave;

import java.util.Date;
import java.util.Map;

import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.seeyoui.kensite.common.base.domain.DataEntity;

public class Leave extends DataEntity<Leave> {
	
	private static final long serialVersionUID = 1L;
	private int page;
	private int rows;
	private int row;
	
	private String reason; 	// 请假原因
	private Date startTime;	// 请假开始日期
	private Date endTime;	// 请假结束日期
	private String leaveType;	// 假种
	
	//-- 临时属性 --//
	// 流程任务
	private Task task;
	private Map<String, Object> variables;
	// 运行中的流程实例
	private ProcessInstance processInstance;
	// 历史的流程实例
	private HistoricProcessInstance historicProcessInstance;
	// 流程定义
	private ProcessDefinition processDefinition;
	
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public String getLeaveType() {
		return leaveType;
	}
	public void setLeaveType(String leaveType) {
		this.leaveType = leaveType;
	}
	public Map<String, Object> getVariables() {
		return variables;
	}
	public void setVariables(Map<String, Object> variables) {
		this.variables = variables;
	}
	public ProcessInstance getProcessInstance() {
		return processInstance;
	}
	public void setProcessInstance(ProcessInstance processInstance) {
		this.processInstance = processInstance;
	}
	public HistoricProcessInstance getHistoricProcessInstance() {
		return historicProcessInstance;
	}
	public void setHistoricProcessInstance(
			HistoricProcessInstance historicProcessInstance) {
		this.historicProcessInstance = historicProcessInstance;
	}
	public ProcessDefinition getProcessDefinition() {
		return processDefinition;
	}
	public void setProcessDefinition(ProcessDefinition processDefinition) {
		this.processDefinition = processDefinition;
	}
	public Task getTask() {
		return task;
	}
	public void setTask(Task task) {
		this.task = task;
	}
	public int getPage() {
		if(page==0) {
			page = 1;
		}
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getRows() {
		if(rows==0) {
			rows = 10;
		}
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	public int getRow() {
		return (getPage()-1)*getRows();
	}
	
}