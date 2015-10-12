/*
 * Powered By cuichen
 * Since 2014 - 2015
 */package com.seeyoui.kensite.framework.cms.comment.service;  
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seeyoui.kensite.common.base.service.BaseService;

import java.util.*;

import com.seeyoui.kensite.common.base.domain.EasyUIDataGrid;
import com.seeyoui.kensite.common.base.service.BaseService;
import com.seeyoui.kensite.common.exception.CRUDException;
import com.seeyoui.kensite.common.util.*;
import com.seeyoui.kensite.common.constants.StringConstant;
import com.seeyoui.kensite.framework.cms.comment.domain.Comment;
import com.seeyoui.kensite.framework.cms.comment.persistence.CommentMapper;
import com.seeyoui.kensite.framework.act.idgenerator.GeneratorUUID;

/**
 * 评论
 * @author cuichen
 * @version 1.0
 * @since 1.0
 * @date 2015-10-12
 */
@Service
public class CommentService extends BaseService {
	
	@Autowired
	private CommentMapper commentMapper;

	/**
	 * 根据ID查询单条数据
	 * @param id
	 * @return
	 * @throws CRUDException
	 */
	public Comment findCommentById(String id) throws CRUDException{
		return commentMapper.findCommentById(id);
	}
	
	/**
	 * 查询数据集合
	 * @param comment
	 * @return
	 * @throws CRUDException
	 */
	public List<Comment> findCommentList(Comment comment) throws CRUDException {
		return commentMapper.findCommentList(comment);
	}
	
	/**
	 * 查询所有数据集合
	 * @param comment
	 * @return
	 * @throws CRUDException
	 */
	public List<Comment> findAllCommentList(Comment comment) throws CRUDException {
		return commentMapper.findAllCommentList(comment);
	}
	
	/**
	 * 查询数据总数
	 * @param comment
	 * @return
	 * @throws CRUDException
	 */
	public EasyUIDataGrid findCommentListTotal(Comment comment) throws CRUDException {
		return commentMapper.findCommentListTotal(comment);
	}
	
	/**
	 * 查询数据总数
	 * @param comment
	 * @return
	 * @throws CRUDException
	 */
	public int findCommentTotal(Comment comment) throws CRUDException {
		return commentMapper.findCommentTotal(comment);
	}
	
	/**
	 * 数据新增
	 * @param comment
	 * @throws CRUDException
	 */
	public void saveComment(Comment comment) throws CRUDException{
		comment.preInsert();
		commentMapper.saveComment(comment);
	}
	
	/**
	 * 数据修改
	 * @param comment
	 * @throws CRUDException
	 */
	public void updateComment(Comment comment) throws CRUDException{
		comment.preUpdate();
		commentMapper.updateComment(comment);			
	}
	
	/**
	 * 数据删除
	 * @param listId
	 * @throws CRUDException
	 */
	public void deleteComment(List<String> listId) throws CRUDException {
		commentMapper.deleteComment(listId);
	}
	
}