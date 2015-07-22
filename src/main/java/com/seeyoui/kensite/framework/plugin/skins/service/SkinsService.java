/*
 * Powered By cuichen
 * Since 2014 - 2015
 */package com.seeyoui.kensite.framework.plugin.skins.service;  
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seeyoui.kensite.common.base.service.BaseService;

import java.util.*;

import com.seeyoui.kensite.common.base.domain.EasyUIDataGrid;
import com.seeyoui.kensite.common.base.service.BaseService;
import com.seeyoui.kensite.common.exception.CRUDException;
import com.seeyoui.kensite.common.util.*;
import com.seeyoui.kensite.common.constants.StringConstant;
import com.seeyoui.kensite.framework.plugin.skins.domain.Skins;
import com.seeyoui.kensite.framework.plugin.skins.persistence.SkinsMapper;
import com.seeyoui.kensite.framework.act.idgenerator.GeneratorUUID;

/**
 * @author cuichen
 * @version 1.0
 * @since 1.0
 */
@Service
public class SkinsService extends BaseService {
	
	@Autowired
	private SkinsMapper skinsMapper;

	/**
	 * 根据ID查询单条数据
	 * @param id
	 * @return
	 * @throws CRUDException
	 */
	public Skins findSkinsById(String id) throws CRUDException{
		return skinsMapper.findSkinsById(id);
	}
	
	/**
	 * 查询数据集合
	 * @param skins
	 * @return
	 * @throws CRUDException
	 */
	public List<Skins> findSkinsList(Skins skins) throws CRUDException {
		return skinsMapper.findSkinsList(skins);
	}
	
	/**
	 * 查询所有数据集合
	 * @param skins
	 * @return
	 * @throws CRUDException
	 */
	public List<Skins> findAllSkinsList(Skins skins) throws CRUDException {
		return skinsMapper.findAllSkinsList(skins);
	}
	
	/**
	 * 查询数据总数
	 * @param skins
	 * @return
	 * @throws CRUDException
	 */
	public EasyUIDataGrid findSkinsListTotal(Skins skins) throws CRUDException {
		return skinsMapper.findSkinsListTotal(skins);
	}
	
	/**
	 * 查询数据总数
	 * @param skins
	 * @return
	 * @throws CRUDException
	 */
	public int findSkinsTotal(Skins skins) throws CRUDException {
		return skinsMapper.findSkinsTotal(skins);
	}
	
	/**
	 * 数据新增
	 * @param skins
	 * @throws CRUDException
	 */
	public void saveSkins(Skins skins) throws CRUDException{
		skins.preInsert();
		skinsMapper.saveSkins(skins);
	}
	
	/**
	 * 数据修改
	 * @param skins
	 * @throws CRUDException
	 */
	public void updateSkins(Skins skins) throws CRUDException{
		skins.preUpdate();
		skinsMapper.updateSkins(skins);			
	}
	
	/**
	 * 数据删除
	 * @param listId
	 * @throws CRUDException
	 */
	public void deleteSkins(List<String> listId) throws CRUDException {
		skinsMapper.deleteSkins(listId);
	}
	
	/**
	 * 查询当前系统皮肤
	 * @return
	 * @throws CRUDException
	 */
	public Skins findCurrentSkins() throws CRUDException{
		return skinsMapper.findCurrentSkins();
	}
	
	/**
	 * 选中
	 * @param skins
	 * @throws CRUDException
	 */
	public void choseSkins(Skins skins) throws CRUDException{
		skins.preUpdate();
		skinsMapper.unchoseSkins(skins);
		skinsMapper.choseSkins(skins);			
	}
	
}