/*
 * Powered By cuichen
 * Since 2014 - 2015
 */package com.seeyoui.kensite.bussiness.demo.testW.service;  
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seeyoui.kensite.common.base.service.BaseService;

import java.util.*;

import com.seeyoui.kensite.common.base.domain.EasyUIDataGrid;
import com.seeyoui.kensite.common.base.service.BaseService;
import com.seeyoui.kensite.common.exception.CRUDException;
import com.seeyoui.kensite.common.util.*;
import com.seeyoui.kensite.common.constants.StringConstant;
import com.seeyoui.kensite.bussiness.demo.testW.domain.TestW;
import com.seeyoui.kensite.bussiness.demo.testW.persistence.TestWMapper;
import com.seeyoui.kensite.framework.act.idgenerator.GeneratorUUID;

/**
 * 测试1
 * @author cuichen
 * @version 1.0
 * @since 1.0
 * @date 2015-11-11
 */
@Service
public class TestWService extends BaseService {
	
	@Autowired
	private TestWMapper testWMapper;

	/**
	 * 根据ID查询单条数据
	 * @param id
	 * @return
	 * @throws CRUDException
	 */
	public TestW findOne(String id) throws CRUDException{
		return testWMapper.findOne(id);
	}
	
	/**
	 * 查询数据集合
	 * @param testW
	 * @return
	 * @throws CRUDException
	 */
	public List<TestW> findList(TestW testW) throws CRUDException {
		return testWMapper.findList(testW);
	}
	
	/**
	 * 查询所有数据集合
	 * @param testW
	 * @return
	 * @throws CRUDException
	 */
	public List<TestW> findAll(TestW testW) throws CRUDException {
		return testWMapper.findAll(testW);
	}
	
	/**
	 * 查询数据总数
	 * @param testW
	 * @return
	 * @throws CRUDException
	 */
	public int findTotal(TestW testW) throws CRUDException {
		return testWMapper.findTotal(testW);
	}
	
	/**
	 * 数据新增
	 * @param testW
	 * @throws CRUDException
	 */
	public void save(TestW testW) throws CRUDException{
		testW.preInsert();
		testWMapper.save(testW);
	}
	
	/**
	 * 数据修改
	 * @param testW
	 * @throws CRUDException
	 */
	public void update(TestW testW) throws CRUDException{
		testW.preUpdate();
		testWMapper.update(testW);			
	}
	
	/**
	 * 数据删除
	 * @param listId
	 * @throws CRUDException
	 */
	public void delete(List<String> listId) throws CRUDException {
		testWMapper.delete(listId);
	}
	
}