/*
 * Powered By cuichen
 * Since 2014 - 2016
 */
package com.seeyoui.kensite.planManage.planProject.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.seeyoui.kensite.common.base.domain.DataEntity;
import com.seeyoui.kensite.common.util.excel.annotation.ExcelField;

/**
 * 项目
 * @author cuichen
 * @version 1.0
 * @since 1.0
 * @date 2016-06-01
 */
@JsonIgnoreProperties(ignoreUnknown = true)
public class PlanProject extends DataEntity<PlanProject> {
	private static final long serialVersionUID = 1L;

	@ExcelField(title="名称", type=1, align=2, sort=7, mod="PLAN_PROJECT|NAME")
	private String name;//名称
	@ExcelField(title="负责人", type=1, align=2, sort=8, mod="PLAN_PROJECT|LEADER")
	private String leader;//负责人
	@ExcelField(title="团队", type=1, align=2, sort=9, mod="PLAN_PROJECT|DESCRIBE")
	private String teamId;//团队
	@ExcelField(title="描述", type=1, align=2, sort=9, mod="PLAN_PROJECT|DESCRIBE")
	private String describe;//描述
	@ExcelField(title="状态", type=1, align=2, sort=10, mod="PLAN_PROJECT|STATUS")
	private String status;//状态

	public void setName(String name) {
		this.name = name;
	}

	public String getName() {
		return this.name;
	}
	public void setLeader(String leader) {
		this.leader = leader;
	}

	public String getLeader() {
		return this.leader;
	}
	public String getTeamId() {
		return teamId;
	}

	public void setTeamId(String teamId) {
		this.teamId = teamId;
	}

	public void setDescribe(String describe) {
		this.describe = describe;
	}

	public String getDescribe() {
		return this.describe;
	}
	public void setStatus(String status) {
		this.status = status;
	}

	public String getStatus() {
		return this.status;
	}
}