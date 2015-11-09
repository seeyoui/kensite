/*
 * Powered By cuichen
 * Since 2014 - 2015
 */package com.seeyoui.kensite.bussiness.test.testW.service;  
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seeyoui.kensite.common.base.service.BaseService;

import java.util.*;

import com.seeyoui.kensite.common.base.domain.EasyUIDataGrid;
import com.seeyoui.kensite.common.base.service.BaseService;
import com.seeyoui.kensite.common.exception.CRUDException;
import com.seeyoui.kensite.common.util.*;
import com.seeyoui.kensite.common.constants.StringConstant;
import com.seeyoui.kensite.bussiness.test.testW.domain.TestW;
import com.seeyoui.kensite.bussiness.test.testW.persistence.TestWMapper;
import com.seeyoui.kensite.framework.act.idgenerator.GeneratorUUID;

/**
 * 测试1
 * @author cuichen
 * @version 1.0
 * @since 1.0
 * @date 2015-11-09
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
	public TestW findTestWById(String id) throws CRUDException{
		return testWMapper.findTestWById(id);
	}
	
	/**
	 * 查询数据集合
	 * @param testW
	 * @return
	 * @throws CRUDException
	 */
	public List<TestW> findTestWList(TestW testW) throws CRUDException {
		return testWMapper.findTestWList(testW);
	}
	
	/**
	 * 查询所有数据集合
	 * @param testW
	 * @return
	 * @throws CRUDException
	 */
	public List<TestW> findAllTestWList(TestW testW) throws CRUDException {
		return testWMapper.findAllTestWList(testW);
	}
	
	/**
	 * 查询数据总数
	 * @param testW
	 * @return
	 * @throws CRUDException
	 */
	public EasyUIDataGrid findTestWListTotal(TestW testW) throws CRUDException {
		return testWMapper.findTestWListTotal(testW);
	}
	
	/**
	 * 查询数据总数
	 * @param testW
	 * @return
	 * @throws CRUDException
	 */
	public int findTestWTotal(TestW testW) throws CRUDException {
		return testWMapper.findTestWTotal(testW);
	}
	
	/**
	 * 数据新增
	 * @param testW
	 * @throws CRUDException
	 */
	public void saveTestW(TestW testW) throws CRUDException{
		testW.preInsert();
		testWMapper.saveTestW(testW);
	}
	
	/**
	 * 数据修改
	 * @param testW
	 * @throws CRUDException
	 */
	public void updateTestW(TestW testW) throws CRUDException{
		testW.preUpdate();
		testWMapper.updateTestW(testW);			
	}
	
	/**
	 * 数据删除
	 * @param listId
	 * @throws CRUDException
	 */
	public void deleteTestW(List<String> listId) throws CRUDException {
		testWMapper.deleteTestW(listId);
	}
	
}