/*
 * Powered By cuichen
 * Since 2014 - 2015
 */
package com.seeyoui.kensite.framework.cms.persistence;  

import com.seeyoui.kensite.common.base.domain.EasyUIDataGrid;
import com.seeyoui.kensite.framework.cms.domain.Site;
import java.util.*;

/**
 * @author cuichen
 * @version 1.0
 * @since 1.0
 */
public interface SiteMapper {

	/**
	 * 根据ID查询单条数据
	 * @param id
	 * @return
	 */
	public Site findSiteById(String id);
	
	/**
	 * 查询数据集合
	 * @param site
	 * @return
	 */
	public List<Site> findSiteList(Site site);
	
	/**
	 * 查询数据总数
	 * @param userinfo
	 * @return
	 */
	public EasyUIDataGrid findSiteListTotal(Site site);
	
	/**
	 * 数据新增
	 * @param site
	 */
	public void saveSite(Site site);
	
	/**
	 * 数据修改
	 * @param site
	 */
	public void updateSite(Site site);
	
	/**
	 * 数据删除
	 * @param listId
	 */
	public void deleteSite(List<String> listId);
}