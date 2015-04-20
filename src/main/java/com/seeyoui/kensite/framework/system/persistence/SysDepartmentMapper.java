/*
 * Powered By cuichen
 * Since 2014 - 2015
 */
package com.seeyoui.kensite.framework.system.persistence;  

import com.seeyoui.kensite.common.base.domain.EasyUIDataGrid;
import com.seeyoui.kensite.framework.system.domain.SysDepartment;
import java.util.*;

/**
 * @author cuichen
 * @version 1.0
 * @since 1.0
 */
public interface SysDepartmentMapper {

	/**
	 * 根据ID查询单条数据
	 * @param id
	 * @return
	 */
	public SysDepartment findSysDepartmentById(String id);
	
	/**
	 * 查询数据集合
	 * @param sysDepartment
	 * @return
	 */
	public List<SysDepartment> findSysDepartmentList(SysDepartment sysDepartment);
	
	/**
	 * 查询数据总数
	 * @param userinfo
	 * @return
	 */
	public EasyUIDataGrid findSysDepartmentListTotal(SysDepartment sysDepartment);
	
	/**
	 * 数据新增
	 * @param sysDepartment
	 */
	public void saveSysDepartment(SysDepartment sysDepartment);
	
	/**
	 * 数据修改
	 * @param sysDepartment
	 */
	public void updateSysDepartment(SysDepartment sysDepartment);
	
	/**
	 * 数据删除
	 * @param listId
	 */
	public void deleteSysDepartment(List<String> listId);
}