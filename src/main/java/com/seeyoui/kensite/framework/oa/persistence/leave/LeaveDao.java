package com.seeyoui.kensite.framework.oa.persistence.leave;

import com.seeyoui.kensite.framework.oa.domain.leave.Leave;

public interface LeaveDao {
	
	/**
	 * 更新流程实例ID
	 * @param leave
	 * @return
	 */
	public int updateProcessInstanceId(Leave leave);
	
	/**
	 * 更新实际开始结束时间
	 * @param leave
	 * @return
	 */
	public int updateRealityTime(Leave leave);
	
}
