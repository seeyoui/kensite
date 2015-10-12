/*
 * Powered By cuichen
 * Since 2014 - 2015
 */
package com.seeyoui.kensite.framework.cms.comment.persistence;  

import com.seeyoui.kensite.common.base.domain.EasyUIDataGrid;
import com.seeyoui.kensite.framework.cms.comment.domain.Comment;
import java.util.*;

/**
 * 评论
 * @author cuichen
 * @version 1.0
 * @since 1.0
 * @date 2015-10-12
 */
public interface CommentMapper {

	/**
	 * 根据ID查询单条数据
	 * @param id
	 * @return
	 */
	public Comment findCommentById(String id);
	
	/**
	 * 查询数据集合
	 * @param comment
	 * @return
	 */
	public List<Comment> findCommentList(Comment comment);
	
	/**
	 * 查询所有数据集合
	 * @param comment
	 * @return
	 */
	public List<Comment> findAllCommentList(Comment comment);
	
	/**
	 * 查询数据总数
	 * @param comment
	 * @return
	 */
	public EasyUIDataGrid findCommentListTotal(Comment comment);
	
	/**
	 * 查询数据总数
	 * @param comment
	 * @return
	 */
	public int findCommentTotal(Comment comment);
	
	/**
	 * 数据新增
	 * @param comment
	 */
	public void saveComment(Comment comment);
	
	/**
	 * 数据修改
	 * @param comment
	 */
	public void updateComment(Comment comment);
	
	/**
	 * 数据删除
	 * @param listId
	 */
	public void deleteComment(List<String> listId);
}