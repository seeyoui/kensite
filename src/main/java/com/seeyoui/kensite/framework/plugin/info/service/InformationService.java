/*
 * Powered By cuichen
 * Since 2014 - 2015
 */package com.seeyoui.kensite.framework.plugin.info.service;  
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seeyoui.kensite.common.base.service.BaseService;

import java.util.*;

import com.seeyoui.kensite.common.base.domain.EasyUIDataGrid;
import com.seeyoui.kensite.common.base.service.BaseService;
import com.seeyoui.kensite.common.exception.CRUDException;
import com.seeyoui.kensite.common.util.*;
import com.seeyoui.kensite.common.constants.StringConstant;
import com.seeyoui.kensite.framework.plugin.info.domain.Information;
import com.seeyoui.kensite.framework.plugin.info.persistence.InformationMapper;
import com.seeyoui.kensite.framework.act.idgenerator.GeneratorUUID;

/**
 * @author cuichen
 * @version 1.0
 * @since 1.0
 */
@Service
public class InformationService extends BaseService {
	
	@Autowired
	private InformationMapper informationMapper;

	/**
	 * 根据ID查询单条数据
	 * @param id
	 * @return
	 * @throws CRUDException
	 */
	public Information findInformationById(String id) throws CRUDException{
		return informationMapper.findInformationById(id);
	}
	
	/**
	 * 查询数据集合
	 * @param information
	 * @return
	 * @throws CRUDException
	 */
	public List<Information> findInformationList(Information information) throws CRUDException {
		return informationMapper.findInformationList(information);
	}
	
	/**
	 * 查询数据总数
	 * @param userinfo
	 * @return
	 * @throws CRUDException
	 */
	public EasyUIDataGrid findInformationListTotal(Information information) throws CRUDException {
		return informationMapper.findInformationListTotal(information);
	}
	
	/**
	 * 数据新增
	 * @param information
	 * @throws CRUDException
	 */
	public void saveInformation(Information information) throws CRUDException{
		information.setId(GeneratorUUID.getId());
		informationMapper.saveInformation(information);
	}
	
	/**
	 * 数据修改
	 * @param information
	 * @throws CRUDException
	 */
	public void updateInformation(Information information) throws CRUDException{
		informationMapper.updateInformation(information);			
	}
	
	/**
	 * 数据删除
	 * @param listId
	 * @throws CRUDException
	 */
	public void deleteInformation(List<String> listId) throws CRUDException {
		informationMapper.deleteInformation(listId);
	}
	
	/**
	 * 将消息标记为已读
	 * @param listId
	 * @throws CRUDException
	 */
	public void readInfo(List<String> listId) throws CRUDException {
		informationMapper.readInfo(listId);
	}
	
	/**
	 * 消息发送
	 * @param information
	 * @throws CRUDException
	 */
	public void sendInformation(Information information) throws CRUDException{
		List<String> listUserName = Arrays.asList(information.getReceiver().split(","));
		for(int i=0; i<listUserName.size(); i++) {
			information.setId(GeneratorUUID.getId());
			information.setReceiver(listUserName.get(i));
			informationMapper.saveInformation(information);
		}
	}
}