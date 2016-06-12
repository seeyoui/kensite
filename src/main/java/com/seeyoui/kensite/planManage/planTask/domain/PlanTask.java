/*
 * Powered By cuichen
 * Since 2014 - 2016
 */
package com.seeyoui.kensite.planManage.planTask.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.seeyoui.kensite.common.base.domain.DataEntity;
import com.seeyoui.kensite.common.util.excel.annotation.ExcelField;

/**
 * 任务
 * @author cuichen
 * @version 1.0
 * @since 1.0
 * @date 2016-06-01
 */
@JsonIgnoreProperties(ignoreUnknown = true)
public class PlanTask extends DataEntity<PlanTask> {
	private static final long serialVersionUID = 1L;

	@ExcelField(title="描述", type=1, align=2, sort=7, mod="PLAN_TASK|DESCRIBE")
	private String describe;//描述
	@ExcelField(title="完成人", type=1, align=2, sort=8, mod="PLAN_TASK|USER_ID")
	private String userId;//完成人
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
	@ExcelField(title="开始日期", type=1, align=2, sort=9, mod="PLAN_TASK|START_DATE")
	private java.util.Date startDate;//开始日期
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
	@ExcelField(title="结束日期", type=1, align=2, sort=10, mod="PLAN_TASK|END_DATE")
	private java.util.Date endDate;//结束日期
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
	@ExcelField(title="完成日期", type=1, align=2, sort=11, mod="PLAN_TASK|FINISH_DATE")
	private java.util.Date finishDate;//完成日期
	@ExcelField(title="优先级", type=1, align=2, sort=12, mod="PLAN_TASK|SEQUENCE")
	private String sequence;//优先级
	@ExcelField(title="说明", type=1, align=2, sort=13, mod="PLAN_TASK|EXPLAIN")
	private String explain;//说明
	@ExcelField(title="项目", type=1, align=2, sort=14, mod="PLAN_TASK|PROJECT_ID")
	private String projectId;//项目

	public void setDescribe(String describe) {
		this.describe = describe;
	}

	public String getDescribe() {
		return this.describe;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserId() {
		return this.userId;
	}
	public void setStartDate(java.util.Date startDate) {
		this.startDate = startDate;
	}

	public java.util.Date getStartDate() {
		return this.startDate;
	}
	public void setEndDate(java.util.Date endDate) {
		this.endDate = endDate;
	}

	public java.util.Date getEndDate() {
		return this.endDate;
	}
	public void setFinishDate(java.util.Date finishDate) {
		this.finishDate = finishDate;
	}

	public java.util.Date getFinishDate() {
		return this.finishDate;
	}
	public void setSequence(String sequence) {
		this.sequence = sequence;
	}

	public String getSequence() {
		return this.sequence;
	}
	public void setExplain(String explain) {
		this.explain = explain;
	}

	public String getExplain() {
		return this.explain;
	}
	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}

	public String getProjectId() {
		return this.projectId;
	}
}