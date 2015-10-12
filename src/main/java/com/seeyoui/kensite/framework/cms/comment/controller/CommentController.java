/*
 * Powered By cuichen
 * Since 2014 - 2015
 */
package com.seeyoui.kensite.framework.cms.comment.controller;  
 
import java.sql.*;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.seeyoui.kensite.common.base.controller.BaseController;
import com.seeyoui.kensite.common.constants.StringConstant;
import com.seeyoui.kensite.common.util.RequestResponseUtil;

import com.seeyoui.kensite.common.constants.StringConstant;
import com.seeyoui.kensite.common.base.domain.EasyUIDataGrid;
import com.seeyoui.kensite.common.base.controller.BaseController;
import com.seeyoui.kensite.common.util.RequestResponseUtil;
import com.seeyoui.kensite.framework.cms.comment.domain.Comment;
import com.seeyoui.kensite.framework.cms.comment.service.CommentService;
/**
 * 评论
 * @author cuichen
 * @version 1.0
 * @since 1.0
 * @date 2015-10-12
 */
@Controller
@RequestMapping(value = "cms/comment")
public class CommentController extends BaseController {
	
	@Autowired
	private CommentService commentService;
	
	/**
	 * 展示列表页面
	 * @param modelMap
	 * @param module
	 * @return
	 * @throws Exception
	 */
	@RequiresPermissions("cms:comment:view")
	@RequestMapping(value = "/showPageList")
	public ModelAndView showCommentPageList(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap) throws Exception {
		return new ModelAndView("framework/cms/comment/comment", modelMap);
	}
	
	/**
	 * 获取列表展示数据
	 * @param modelMap
	 * @param comment
	 * @return
	 * @throws Exception
	 */
	@RequiresPermissions("cms:comment:select")
	@RequestMapping(value = "/getListData", method=RequestMethod.POST)
	@ResponseBody
	public String getListData(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, Comment comment) throws Exception{
		List<Comment> commentList = commentService.findCommentList(comment);
		EasyUIDataGrid eudg = commentService.findCommentListTotal(comment);
		eudg.setRows(commentList);
		JSONObject jsonObj = JSONObject.fromObject(eudg);
		RequestResponseUtil.putResponseStr(session, response, request, jsonObj);
		return null;
	}
	
	/**
	 * 获取所有数据
	 * @param modelMap
	 * @param comment
	 * @return
	 * @throws Exception
	 */
	@RequiresPermissions("cms:comment:select")
	@RequestMapping(value = "/getAllListData", method=RequestMethod.POST)
	@ResponseBody
	public String getAllListData(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, Comment comment) throws Exception{
		List<Comment> commentList = commentService.findAllCommentList(comment);
		JSONArray jsonObj = JSONArray.fromObject(commentList);
		RequestResponseUtil.putResponseStr(session, response, request, jsonObj);
		return null;
	}
	
	/**
	 * 保存新增的数据
	 * @param modelMap
	 * @param comment
	 * @return
	 * @throws Exception
	 */
	@RequiresPermissions("cms:comment:insert")
	@RequestMapping(value = "/saveByAdd", method=RequestMethod.POST)
	@ResponseBody
	public String saveCommentByAdd(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, Comment comment) throws Exception{
		if (!beanValidator(modelMap, comment)){
			RequestResponseUtil.putResponseStr(session, response, request, modelMap, StringConstant.FALSE);
			return null;
		}
		commentService.saveComment(comment);
		RequestResponseUtil.putResponseStr(session, response, request, modelMap, StringConstant.TRUE);
		return null;
	}
	
	/**
	 * 保存修改的数据
	 * @param modelMap
	 * @param comment
	 * @return
	 * @throws Exception
	 */
	@RequiresPermissions("cms:comment:update")
	@RequestMapping(value = "/saveByUpdate", method=RequestMethod.POST)
	@ResponseBody
	public String saveCommentByUpdate(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, Comment comment) throws Exception{
		if (!beanValidator(modelMap, comment)){
			RequestResponseUtil.putResponseStr(session, response, request, modelMap, StringConstant.FALSE);
			return null;
		}
		commentService.updateComment(comment);
		RequestResponseUtil.putResponseStr(session, response, request, modelMap, StringConstant.TRUE);
		return null;
	}
	
	/**
	 * 删除数据库
	 * @param modelMap
	 * @param commentId
	 * @return
	 * @throws Exception
	 */
	@RequiresPermissions("cms:comment:delete")
	@RequestMapping(value = "/delete", method=RequestMethod.POST)
	@ResponseBody
	public String delete(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, String delDataId) throws Exception {
		List<String> listId = Arrays.asList(delDataId.split(","));
		commentService.deleteComment(listId);
		RequestResponseUtil.putResponseStr(session, response, request, modelMap, StringConstant.TRUE);
		return null;
	}
}