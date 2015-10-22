/*
 * Powered By cuichen
 * Since 2014 - 2015
 */
package com.seeyoui.kensite.framework.cms.site.persistence;  

import com.seeyoui.kensite.common.base.domain.EasyUIDataGrid;
import com.seeyoui.kensite.framework.cms.site.domain.Site;
import java.util.*;

/**
 * 站点表
 * @author cuichen
 * @version 1.0
 * @since 1.0
 * @date 2015-10-13
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
	 * 查询所有数据集合
	 * @param site
	 * @return
	 */
	public List<Site> findAllSiteList(Site site);
	
	/**
	 * 查询数据总数
	 * @param site
	 * @return
	 */
	public EasyUIDataGrid findSiteListTotal(Site site);
	
	/**
	 * 查询数据总数
	 * @param site
	 * @return
	 */
	public int findSiteTotal(Site site);
	
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