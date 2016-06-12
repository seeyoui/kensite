/*
 * Powered By cuichen
 * Since 2014 - 2016
 */
package com.seeyoui.kensite.planManage.planTaskDelay.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.seeyoui.kensite.common.base.domain.DataEntity;
import com.seeyoui.kensite.common.util.excel.annotation.ExcelField;

/**
 * 任务延期
 * @author cuichen
 * @version 1.0
 * @since 1.0
 * @date 2016-06-06
 */
@JsonIgnoreProperties(ignoreUnknown = true)
public class PlanTaskDelay extends DataEntity<PlanTaskDelay> {
	private static final long serialVersionUID = 1L;

	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
	@ExcelField(title="延期日期", type=1, align=2, sort=7, mod="PLAN_TASK_DELAY|DELAY_DATE")
	private java.util.Date delayDate;//延期日期
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
	@ExcelField(title="延期完成日期", type=1, align=2, sort=8, mod="PLAN_TASK_DELAY|DELAY_FINISH_DATE")
	private java.util.Date delayFinishDate;//延期完成日期
	@ExcelField(title="延期原因", type=1, align=2, sort=9, mod="PLAN_TASK_DELAY|DELAY_REASON")
	private String delayReason;//延期原因
	@ExcelField(title="任务", type=1, align=2, sort=10, mod="PLAN_TASK_DELAY|TASK_ID")
	private String taskId;//任务

	public void setDelayDate(java.util.Date delayDate) {
		this.delayDate = delayDate;
	}

	public java.util.Date getDelayDate() {
		return this.delayDate;
	}
	public void setDelayFinishDate(java.util.Date delayFinishDate) {
		this.delayFinishDate = delayFinishDate;
	}

	public java.util.Date getDelayFinishDate() {
		return this.delayFinishDate;
	}
	public void setDelayReason(String delayReason) {
		this.delayReason = delayReason;
	}

	public String getDelayReason() {
		return this.delayReason;
	}
	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}

	public String getTaskId() {
		return this.taskId;
	}
}