/*
 * Powered By cuichen
 * Since 2014 - 2015
 */
package com.seeyoui.kensite.framework.plugin.skins.persistence;  

import com.seeyoui.kensite.common.base.domain.EasyUIDataGrid;
import com.seeyoui.kensite.framework.plugin.skins.domain.Skins;
import java.util.*;

/**
 * @author cuichen
 * @version 1.0
 * @since 1.0
 */
public interface SkinsMapper {

	/**
	 * 根据ID查询单条数据
	 * @param id
	 * @return
	 */
	public Skins findSkinsById(String id);
	
	/**
	 * 查询数据集合
	 * @param skins
	 * @return
	 */
	public List<Skins> findSkinsList(Skins skins);
	
	/**
	 * 查询所有数据集合
	 * @param skins
	 * @return
	 */
	public List<Skins> findAllSkinsList(Skins skins);
	
	/**
	 * 查询数据总数
	 * @param skins
	 * @return
	 */
	public EasyUIDataGrid findSkinsListTotal(Skins skins);
	
	/**
	 * 查询数据总数
	 * @param skins
	 * @return
	 */
	public int findSkinsTotal(Skins skins);
	
	/**
	 * 数据新增
	 * @param skins
	 */
	public void saveSkins(Skins skins);
	
	/**
	 * 数据修改
	 * @param skins
	 */
	public void updateSkins(Skins skins);
	
	/**
	 * 数据删除
	 * @param listId
	 */
	public void deleteSkins(List<String> listId);
	
	/**
	 * 查询当前系统皮肤
	 * @return
	 */
	public Skins findCurrentSkins();
	
	/**
	 * 选中
	 * @param skins
	 */
	public void choseSkins(Skins skins);
	
	/**
	 * 清空
	 * @param skins
	 */
	public void unchoseSkins(Skins skins);
}