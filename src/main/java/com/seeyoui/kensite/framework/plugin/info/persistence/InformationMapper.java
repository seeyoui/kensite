/*
 * Powered By cuichen
 * Since 2014 - 2015
 */
package com.seeyoui.kensite.framework.plugin.info.persistence;  

import com.seeyoui.kensite.common.base.domain.EasyUIDataGrid;
import com.seeyoui.kensite.framework.plugin.info.domain.Information;
import java.util.*;

/**
 * @author cuichen
 * @version 1.0
 * @since 1.0
 */
public interface InformationMapper {

	/**
	 * 根据ID查询单条数据
	 * @param id
	 * @return
	 */
	public Information findInformationById(String id);
	
	/**
	 * 查询数据集合
	 * @param information
	 * @return
	 */
	public List<Information> findInformationList(Information information);
	
	/**
	 * 查询数据总数
	 * @param userinfo
	 * @return
	 */
	public EasyUIDataGrid findInformationListTotal(Information information);
	
	/**
	 * 数据新增
	 * @param information
	 */
	public void saveInformation(Information information);
	
	/**
	 * 数据修改
	 * @param information
	 */
	public void updateInformation(Information information);
	
	/**
	 * 数据删除
	 * @param listId
	 */
	public void deleteInformation(List<String> listId);
	
	/**
	 * 将消息标记为已读
	 * @param listId
	 */
	public void readInfo(List<String> listId);
}