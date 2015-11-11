/*
 * Powered By cuichen
 * Since 2014 - 2015
 */
package com.seeyoui.kensite.bussiness.demo.testW.persistence;  

import com.seeyoui.kensite.common.base.domain.EasyUIDataGrid;
import com.seeyoui.kensite.bussiness.demo.testW.domain.TestW;
import java.util.*;

/**
 * 测试1
 * @author cuichen
 * @version 1.0
 * @since 1.0
 * @date 2015-11-10
 */
public interface TestWMapper {

	/**
	 * 根据ID查询单条数据
	 * @param id
	 * @return
	 */
	public TestW findOne(String id);
	
	/**
	 * 查询数据集合
	 * @param testW
	 * @return
	 */
	public List<TestW> findList(TestW testW);
	
	/**
	 * 查询所有数据集合
	 * @param testW
	 * @return
	 */
	public List<TestW> findAll(TestW testW);
	
	/**
	 * 查询数据总数
	 * @param testW
	 * @return
	 */
	public int findTotal(TestW testW);
	
	/**
	 * 数据新增
	 * @param testW
	 */
	public void save(TestW testW);
	
	/**
	 * 数据修改
	 * @param testW
	 */
	public void update(TestW testW);
	
	/**
	 * 移除假删除
	 * @param testW
	 */
	public void remove(TestW testW);
	
	/**
	 * 数据删除
	 * @param listId
	 */
	public void delete(List<String> listId);
}