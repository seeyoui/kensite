/*
 * Powered By cuichen
 * Since 2014 - 2015
 */
package com.seeyoui.kensite.framework.cms.guestbook.persistence;  

import com.seeyoui.kensite.common.base.domain.EasyUIDataGrid;
import com.seeyoui.kensite.framework.cms.guestbook.domain.Guestbook;
import java.util.*;

/**
 * 留言板
 * @author cuichen
 * @version 1.0
 * @since 1.0
 * @date 2015-10-12
 */
public interface GuestbookMapper {

	/**
	 * 根据ID查询单条数据
	 * @param id
	 * @return
	 */
	public Guestbook findGuestbookById(String id);
	
	/**
	 * 查询数据集合
	 * @param guestbook
	 * @return
	 */
	public List<Guestbook> findGuestbookList(Guestbook guestbook);
	
	/**
	 * 查询所有数据集合
	 * @param guestbook
	 * @return
	 */
	public List<Guestbook> findAllGuestbookList(Guestbook guestbook);
	
	/**
	 * 查询数据总数
	 * @param guestbook
	 * @return
	 */
	public EasyUIDataGrid findGuestbookListTotal(Guestbook guestbook);
	
	/**
	 * 查询数据总数
	 * @param guestbook
	 * @return
	 */
	public int findGuestbookTotal(Guestbook guestbook);
	
	/**
	 * 数据新增
	 * @param guestbook
	 */
	public void saveGuestbook(Guestbook guestbook);
	
	/**
	 * 数据修改
	 * @param guestbook
	 */
	public void updateGuestbook(Guestbook guestbook);
	
	/**
	 * 数据删除
	 * @param listId
	 */
	public void deleteGuestbook(List<String> listId);
}