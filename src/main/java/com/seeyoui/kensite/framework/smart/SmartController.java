/*
 * Powered By cuichen
 * Since 2014 - 2015
 */
package com.seeyoui.kensite.framework.smart;  
 
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.shiro.authz.annotation.RequiresUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.seeyoui.kensite.common.base.controller.BaseController;
import com.seeyoui.kensite.common.base.domain.EasyUIDataGrid;
import com.seeyoui.kensite.common.constants.StringConstant;
import com.seeyoui.kensite.common.util.RequestResponseUtil;
import com.seeyoui.kensite.common.util.StringUtils;
import com.seeyoui.kensite.framework.act.idgenerator.GeneratorUUID;
import com.seeyoui.kensite.framework.plugin.info.domain.Information;
import com.seeyoui.kensite.framework.plugin.info.service.InformationService;
import com.seeyoui.kensite.framework.system.domain.SysUser;
import com.seeyoui.kensite.framework.system.service.SysUserService;
import com.seeyoui.kensite.framework.system.util.UserUtils;
/**
 * @author cuichen
 * @version 1.0
 * @since 1.0
 */
@Controller
@RequestMapping(value = "sys/smart")
public class SmartController extends BaseController {
	
	/**
	 * 展示列表页面
	 * @param modelMap
	 * @param module
	 * @return
	 * @throws Exception
	 */
//	@RequiresUser
	@RequestMapping(value = "/showPageList")
	public ModelAndView showPageList(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap) throws Exception {
		return new ModelAndView("framework/plugin/info/information", modelMap);
	}
	
	/**
	 * 获取列表展示数据
	 * @param modelMap
	 * @param information
	 * @return
	 * @throws Exception
	 */
//	@RequiresUser
	@RequestMapping(value = "/{module}/getListData", method=RequestMethod.POST)
	@ResponseBody
	public Object getListData(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, Information information, String module) throws Exception{
		InformationService informationService = new InformationService();
		List<Information> informationList = informationService.findInformationList(information);
		EasyUIDataGrid eudg = informationService.findInformationListTotal(information);
		eudg.setRows(informationList);
//		JSONObject jsonObj = JSONObject.fromObject(eudg);
//		RequestResponseUtil.putResponseStr(session, response, request, jsonObj);
		return eudg;
	}
	
}