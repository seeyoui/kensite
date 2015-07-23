/*
 * Powered By cuichen
 * Since 2014 - 2015
 */package com.seeyoui.kensite.framework.plugin.dict.service;  
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seeyoui.kensite.common.base.service.BaseService;

import java.util.*;

import com.seeyoui.kensite.common.base.domain.EasyUIDataGrid;
import com.seeyoui.kensite.common.base.service.BaseService;
import com.seeyoui.kensite.common.exception.CRUDException;
import com.seeyoui.kensite.common.util.*;
import com.seeyoui.kensite.common.constants.StringConstant;
import com.seeyoui.kensite.framework.plugin.dict.domain.Dict;
import com.seeyoui.kensite.framework.plugin.dict.persistence.DictMapper;
import com.seeyoui.kensite.framework.system.domain.SysDepartment;
import com.seeyoui.kensite.framework.act.idgenerator.GeneratorUUID;

/**
 * @author cuichen
 * @version 1.0
 * @since 1.0
 */
@Service
public class DictService extends BaseService {
	
	@Autowired
	private DictMapper dictMapper;

	/**
	 * 根据ID查询单条数据
	 * @param id
	 * @return
	 * @throws CRUDException
	 */
	public Dict findDictById(String id) throws CRUDException{
		return dictMapper.findDictById(id);
	}
	
	/**
	 * 查询数据集合
	 * @param dict
	 * @return
	 * @throws CRUDException
	 */
	public List<Dict> findDictList(Dict dict) throws CRUDException {
		return dictMapper.findDictList(dict);
	}
	
	/**
	 * 查询所有数据集合
	 * @param dict
	 * @return
	 * @throws CRUDException
	 */
	public List<Dict> findAllDictList(Dict dict) throws CRUDException {
		return dictMapper.findAllDictList(dict);
	}
	
	/**
	 * 查询数据总数
	 * @param dict
	 * @return
	 * @throws CRUDException
	 */
	public EasyUIDataGrid findDictListTotal(Dict dict) throws CRUDException {
		return dictMapper.findDictListTotal(dict);
	}
	
	/**
	 * 查询数据总数
	 * @param dict
	 * @return
	 * @throws CRUDException
	 */
	public int findDictTotal(Dict dict) throws CRUDException {
		return dictMapper.findDictTotal(dict);
	}
	
	/**
	 * 获取生成TREE Json的
	 * @return
	 * @throws CRUDException
	 */
	public List<Dict> getTreeJson(Dict dict) throws CRUDException {
		return dictMapper.getTreeJson(dict);
	}
	
	/**
	 * 数据新增
	 * @param dict
	 * @throws CRUDException
	 */
	public void saveDict(Dict dict) throws CRUDException{
		dict.preInsert();
		dictMapper.saveDict(dict);
	}
	
	/**
	 * 数据修改
	 * @param dict
	 * @throws CRUDException
	 */
	public void updateDict(Dict dict) throws CRUDException{
		dict.preUpdate();
		dictMapper.updateDict(dict);			
	}
	
	/**
	 * 数据删除
	 * @param listId
	 * @throws CRUDException
	 */
	public void deleteDict(List<String> listId) throws CRUDException {
		dictMapper.deleteDict(listId);
	}
	
}