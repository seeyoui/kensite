/*
 * Powered By cuichen
 * Since 2014 - 2015
 */package com.seeyoui.kensite.framework.cms.guestbook.service;  
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seeyoui.kensite.common.base.service.BaseService;

import java.util.*;

import com.seeyoui.kensite.common.base.domain.EasyUIDataGrid;
import com.seeyoui.kensite.common.base.service.BaseService;
import com.seeyoui.kensite.common.exception.CRUDException;
import com.seeyoui.kensite.common.util.*;
import com.seeyoui.kensite.common.constants.StringConstant;
import com.seeyoui.kensite.framework.cms.guestbook.domain.Guestbook;
import com.seeyoui.kensite.framework.cms.guestbook.persistence.GuestbookMapper;
import com.seeyoui.kensite.framework.act.idgenerator.GeneratorUUID;

/**
 * 留言板
 * @author cuichen
 * @version 1.0
 * @since 1.0
 * @date 2015-10-12
 */
@Service
public class GuestbookService extends BaseService {
	
	@Autowired
	private GuestbookMapper guestbookMapper;

	/**
	 * 根据ID查询单条数据
	 * @param id
	 * @return
	 * @throws CRUDException
	 */
	public Guestbook findGuestbookById(String id) throws CRUDException{
		return guestbookMapper.findGuestbookById(id);
	}
	
	/**
	 * 查询数据集合
	 * @param guestbook
	 * @return
	 * @throws CRUDException
	 */
	public List<Guestbook> findGuestbookList(Guestbook guestbook) throws CRUDException {
		return guestbookMapper.findGuestbookList(guestbook);
	}
	
	/**
	 * 查询所有数据集合
	 * @param guestbook
	 * @return
	 * @throws CRUDException
	 */
	public List<Guestbook> findAllGuestbookList(Guestbook guestbook) throws CRUDException {
		return guestbookMapper.findAllGuestbookList(guestbook);
	}
	
	/**
	 * 查询数据总数
	 * @param guestbook
	 * @return
	 * @throws CRUDException
	 */
	public EasyUIDataGrid findGuestbookListTotal(Guestbook guestbook) throws CRUDException {
		return guestbookMapper.findGuestbookListTotal(guestbook);
	}
	
	/**
	 * 查询数据总数
	 * @param guestbook
	 * @return
	 * @throws CRUDException
	 */
	public int findGuestbookTotal(Guestbook guestbook) throws CRUDException {
		return guestbookMapper.findGuestbookTotal(guestbook);
	}
	
	/**
	 * 数据新增
	 * @param guestbook
	 * @throws CRUDException
	 */
	public void saveGuestbook(Guestbook guestbook) throws CRUDException{
		guestbook.preInsert();
		guestbookMapper.saveGuestbook(guestbook);
	}
	
	/**
	 * 数据修改
	 * @param guestbook
	 * @throws CRUDException
	 */
	public void updateGuestbook(Guestbook guestbook) throws CRUDException{
		guestbook.preUpdate();
		guestbookMapper.updateGuestbook(guestbook);			
	}
	
	/**
	 * 数据删除
	 * @param listId
	 * @throws CRUDException
	 */
	public void deleteGuestbook(List<String> listId) throws CRUDException {
		guestbookMapper.deleteGuestbook(listId);
	}
	
}