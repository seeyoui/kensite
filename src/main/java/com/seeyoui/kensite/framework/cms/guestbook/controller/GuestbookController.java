/*
 * Powered By cuichen
 * Since 2014 - 2015
 */
package com.seeyoui.kensite.framework.cms.guestbook.controller;  
 
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
import com.seeyoui.kensite.framework.cms.guestbook.domain.Guestbook;
import com.seeyoui.kensite.framework.cms.guestbook.service.GuestbookService;
/**
 * 留言板
 * @author cuichen
 * @version 1.0
 * @since 1.0
 * @date 2015-10-12
 */
@Controller
@RequestMapping(value = "cms/guestbook")
public class GuestbookController extends BaseController {
	
	@Autowired
	private GuestbookService guestbookService;
	
	/**
	 * 展示列表页面
	 * @param modelMap
	 * @param module
	 * @return
	 * @throws Exception
	 */
	@RequiresPermissions("cms:guestbook:view")
	@RequestMapping(value = "/showPageList")
	public ModelAndView showGuestbookPageList(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap) throws Exception {
		return new ModelAndView("framework/cms/guestbook/guestbook", modelMap);
	}
	
	/**
	 * 获取列表展示数据
	 * @param modelMap
	 * @param guestbook
	 * @return
	 * @throws Exception
	 */
	@RequiresPermissions("cms:guestbook:select")
	@RequestMapping(value = "/getListData", method=RequestMethod.POST)
	@ResponseBody
	public String getListData(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, Guestbook guestbook) throws Exception{
		List<Guestbook> guestbookList = guestbookService.findGuestbookList(guestbook);
		EasyUIDataGrid eudg = guestbookService.findGuestbookListTotal(guestbook);
		eudg.setRows(guestbookList);
		JSONObject jsonObj = JSONObject.fromObject(eudg);
		RequestResponseUtil.putResponseStr(session, response, request, jsonObj);
		return null;
	}
	
	/**
	 * 获取所有数据
	 * @param modelMap
	 * @param guestbook
	 * @return
	 * @throws Exception
	 */
	@RequiresPermissions("cms:guestbook:select")
	@RequestMapping(value = "/getAllListData", method=RequestMethod.POST)
	@ResponseBody
	public String getAllListData(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, Guestbook guestbook) throws Exception{
		List<Guestbook> guestbookList = guestbookService.findAllGuestbookList(guestbook);
		JSONArray jsonObj = JSONArray.fromObject(guestbookList);
		RequestResponseUtil.putResponseStr(session, response, request, jsonObj);
		return null;
	}
	
	/**
	 * 保存新增的数据
	 * @param modelMap
	 * @param guestbook
	 * @return
	 * @throws Exception
	 */
	@RequiresPermissions("cms:guestbook:insert")
	@RequestMapping(value = "/saveByAdd", method=RequestMethod.POST)
	@ResponseBody
	public String saveGuestbookByAdd(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, Guestbook guestbook) throws Exception{
		if (!beanValidator(modelMap, guestbook)){
			RequestResponseUtil.putResponseStr(session, response, request, modelMap, StringConstant.FALSE);
			return null;
		}
		guestbookService.saveGuestbook(guestbook);
		RequestResponseUtil.putResponseStr(session, response, request, modelMap, StringConstant.TRUE);
		return null;
	}
	
	/**
	 * 保存修改的数据
	 * @param modelMap
	 * @param guestbook
	 * @return
	 * @throws Exception
	 */
	@RequiresPermissions("cms:guestbook:update")
	@RequestMapping(value = "/saveByUpdate", method=RequestMethod.POST)
	@ResponseBody
	public String saveGuestbookByUpdate(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, Guestbook guestbook) throws Exception{
		if (!beanValidator(modelMap, guestbook)){
			RequestResponseUtil.putResponseStr(session, response, request, modelMap, StringConstant.FALSE);
			return null;
		}
		guestbookService.updateGuestbook(guestbook);
		RequestResponseUtil.putResponseStr(session, response, request, modelMap, StringConstant.TRUE);
		return null;
	}
	
	/**
	 * 删除数据库
	 * @param modelMap
	 * @param guestbookId
	 * @return
	 * @throws Exception
	 */
	@RequiresPermissions("cms:guestbook:delete")
	@RequestMapping(value = "/delete", method=RequestMethod.POST)
	@ResponseBody
	public String delete(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, String delDataId) throws Exception {
		List<String> listId = Arrays.asList(delDataId.split(","));
		guestbookService.deleteGuestbook(listId);
		RequestResponseUtil.putResponseStr(session, response, request, modelMap, StringConstant.TRUE);
		return null;
	}
}