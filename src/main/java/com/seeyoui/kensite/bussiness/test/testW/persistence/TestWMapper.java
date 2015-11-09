/*
 * Powered By cuichen
 * Since 2014 - 2015
 */
package com.seeyoui.kensite.bussiness.test.testW.persistence;  

import com.seeyoui.kensite.common.base.domain.EasyUIDataGrid;
import com.seeyoui.kensite.bussiness.test.testW.domain.TestW;
import java.util.*;

/**
 * 测试1
 * @author cuichen
 * @version 1.0
 * @since 1.0
 * @date 2015-11-09
 */
public interface TestWMapper {

	/**
	 * 根据ID查询单条数据
	 * @param id
	 * @return
	 */
	public TestW findTestWById(String id);
	
	/**
	 * 查询数据集合
	 * @param testW
	 * @return
	 */
	public List<TestW> findTestWList(TestW testW);
	
	/**
	 * 查询所有数据集合
	 * @param testW
	 * @return
	 */
	public List<TestW> findAllTestWList(TestW testW);
	
	/**
	 * 查询数据总数
	 * @param testW
	 * @return
	 */
	public EasyUIDataGrid findTestWListTotal(TestW testW);
	
	/**
	 * 查询数据总数
	 * @param testW
	 * @return
	 */
	public int findTestWTotal(TestW testW);
	
	/**
	 * 数据新增
	 * @param testW
	 */
	public void saveTestW(TestW testW);
	
	/**
	 * 数据修改
	 * @param testW
	 */
	public void updateTestW(TestW testW);
	
	/**
	 * 数据删除
	 * @param listId
	 */
	public void deleteTestW(List<String> listId);
}