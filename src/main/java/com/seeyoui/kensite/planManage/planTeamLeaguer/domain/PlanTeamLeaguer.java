/*
 * Powered By cuichen
 * Since 2014 - 2016
 */
package com.seeyoui.kensite.planManage.planTeamLeaguer.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.seeyoui.kensite.common.base.domain.DataEntity;
import com.seeyoui.kensite.common.util.excel.annotation.ExcelField;

/**
 * 团队成员
 * @author cuichen
 * @version 1.0
 * @since 1.0
 * @date 2016-06-01
 */
@JsonIgnoreProperties(ignoreUnknown = true)
public class PlanTeamLeaguer extends DataEntity<PlanTeamLeaguer> {
	private static final long serialVersionUID = 1L;

	@ExcelField(title="团队", type=1, align=2, sort=7, mod="PLAN_TEAM_LEAGUER|TEAM_ID")
	private String teamId;//团队
	@ExcelField(title="成员", type=1, align=2, sort=8, mod="PLAN_TEAM_LEAGUER|USER_ID")
	private String userId;//成员

	public void setTeamId(String teamId) {
		this.teamId = teamId;
	}

	public String getTeamId() {
		return this.teamId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserId() {
		return this.userId;
	}
}