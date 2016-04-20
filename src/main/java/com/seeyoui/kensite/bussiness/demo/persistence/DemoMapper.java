/*
 * Powered By cuichen
 * Since 2014 - 2016
 */
package com.seeyoui.kensite.bussiness.demo.persistence;

import com.seeyoui.kensite.common.base.domain.EasyUIDataGrid;
import com.seeyoui.kensite.bussiness.demo.domain.Demo;
import java.util.*;

/**
 * 演示
 * @author cuichen
 * @version 1.0
 * @since 1.0
 * @date 2016-04-20
 */
public interface DemoMapper {

	/**
	 * 根据ID查询单条数据
	 * @param id
	 * @return
	 */
	public Demo findOne(String id);
	
	/**
	 * 查询数据集合
	 * @param demo
	 * @return
	 */
	public List<Demo> findList(Demo demo);
	
	/**
	 * 查询所有数据集合
	 * @param demo
	 * @return
	 */
	public List<Demo> findAll(Demo demo);
	
	/**
	 * 查询数据总数
	 * @param demo
	 * @return
	 */
	public int findTotal(Demo demo);

	/**
	 * 查询数据总数排除当前数据
	 * @param demo
	 * @return
	 */
	public int findExTotal(Demo demo);
	
	/**
	 * 数据新增
	 * @param demo
	 */
	public void save(Demo demo);
	
	/**
	 * 数据修改
	 * @param demo
	 */
	public void update(Demo demo);
	
	/**
	 * 数据删除
	 * @param listId
	 */
	public void delete(List<String> listId);
	
	/**
	 * 全文检索查询所有数据集合
	 * @param listId
	 * @return
	 */
	public List<Demo> findLucene(List<String> listId);
}