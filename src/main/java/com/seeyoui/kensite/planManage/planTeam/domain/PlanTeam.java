/*
 * Powered By cuichen
 * Since 2014 - 2016
 */
package com.seeyoui.kensite.planManage.planTeam.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.seeyoui.kensite.common.base.domain.DataEntity;
import com.seeyoui.kensite.common.util.excel.annotation.ExcelField;

/**
 * 团队
 * @author cuichen
 * @version 1.0
 * @since 1.0
 * @date 2016-06-01
 */
@JsonIgnoreProperties(ignoreUnknown = true)
public class PlanTeam extends DataEntity<PlanTeam> {
	private static final long serialVersionUID = 1L;

	@ExcelField(title="名称", type=1, align=2, sort=7, mod="PLAN_TEAM|NAME")
	private String name;//名称
	@ExcelField(title="描述", type=1, align=2, sort=8, mod="PLAN_TEAM|DESCRIBE")
	private String describe;//描述
	
	private int leaguerCou;//团队人数

	public void setName(String name) {
		this.name = name;
	}

	public String getName() {
		return this.name;
	}
	public void setDescribe(String describe) {
		this.describe = describe;
	}

	public String getDescribe() {
		return this.describe;
	}

	public int getLeaguerCou() {
		return leaguerCou;
	}

	public void setLeaguerCou(int leaguerCou) {
		this.leaguerCou = leaguerCou;
	}
}