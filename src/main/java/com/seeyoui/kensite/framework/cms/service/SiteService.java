/*
 * Powered By cuichen
 * Since 2014 - 2015
 */package com.seeyoui.kensite.framework.cms.service;  
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seeyoui.kensite.common.base.service.BaseService;

import java.util.*;

import com.seeyoui.kensite.common.base.domain.EasyUIDataGrid;
import com.seeyoui.kensite.common.base.service.BaseService;
import com.seeyoui.kensite.common.exception.CRUDException;
import com.seeyoui.kensite.common.util.*;
import com.seeyoui.kensite.common.constants.StringConstant;
import com.seeyoui.kensite.framework.cms.domain.Site;
import com.seeyoui.kensite.framework.cms.persistence.SiteMapper;
import com.seeyoui.kensite.framework.act.idgenerator.GeneratorUUID;

/**
 * @author cuichen
 * @version 1.0
 * @since 1.0
 */
@Service
public class SiteService extends BaseService {
	
	@Autowired
	private SiteMapper siteMapper;

	/**
	 * 根据ID查询单条数据
	 * @param id
	 * @return
	 * @throws CRUDException
	 */
	public Site findSiteById(String id) throws CRUDException{
		return siteMapper.findSiteById(id);
	}
	
	/**
	 * 查询数据集合
	 * @param site
	 * @return
	 * @throws CRUDException
	 */
	public List<Site> findSiteList(Site site) throws CRUDException {
		return siteMapper.findSiteList(site);
	}
	
	/**
	 * 查询数据总数
	 * @param userinfo
	 * @return
	 * @throws CRUDException
	 */
	public EasyUIDataGrid findSiteListTotal(Site site) throws CRUDException {
		return siteMapper.findSiteListTotal(site);
	}
	
	/**
	 * 数据新增
	 * @param site
	 * @throws CRUDException
	 */
	public void saveSite(Site site) throws CRUDException{
		site.preInsert();
		siteMapper.saveSite(site);
	}
	
	/**
	 * 数据修改
	 * @param site
	 * @throws CRUDException
	 */
	public void updateSite(Site site) throws CRUDException{
		site.preUpdate();
		siteMapper.updateSite(site);			
	}
	
	/**
	 * 数据删除
	 * @param listId
	 * @throws CRUDException
	 */
	public void deleteSite(List<String> listId) throws CRUDException {
		siteMapper.deleteSite(listId);
	}
	
}