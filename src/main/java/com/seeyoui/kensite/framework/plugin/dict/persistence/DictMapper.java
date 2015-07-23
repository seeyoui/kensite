/*
 * Powered By cuichen
 * Since 2014 - 2015
 */
package com.seeyoui.kensite.framework.plugin.dict.persistence;  

import com.seeyoui.kensite.common.base.domain.EasyUIDataGrid;
import com.seeyoui.kensite.common.exception.CRUDException;
import com.seeyoui.kensite.framework.plugin.dict.domain.Dict;
import com.seeyoui.kensite.framework.system.domain.SysDepartment;

import java.util.*;

/**
 * @author cuichen
 * @version 1.0
 * @since 1.0
 */
public interface DictMapper {

	/**
	 * 根据ID查询单条数据
	 * @param id
	 * @return
	 */
	public Dict findDictById(String id);
	
	/**
	 * 查询数据集合
	 * @param dict
	 * @return
	 */
	public List<Dict> findDictList(Dict dict);
	
	/**
	 * 查询所有数据集合
	 * @param dict
	 * @return
	 */
	public List<Dict> findAllDictList(Dict dict);
	
	/**
	 * 查询数据总数
	 * @param dict
	 * @return
	 */
	public EasyUIDataGrid findDictListTotal(Dict dict);
	
	/**
	 * 查询数据总数
	 * @param dict
	 * @return
	 */
	public int findDictTotal(Dict dict);
	
	/**
	 * 获取生成TREE Json的
	 * @return
	 * @throws CRUDException
	 */
	public List<Dict> getTreeJson(Dict dict);
	
	/**
	 * 数据新增
	 * @param dict
	 */
	public void saveDict(Dict dict);
	
	/**
	 * 数据修改
	 * @param dict
	 */
	public void updateDict(Dict dict);
	
	/**
	 * 数据删除
	 * @param listId
	 */
	public void deleteDict(List<String> listId);
}