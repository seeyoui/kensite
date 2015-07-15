/*
 * Powered By cuichen
 * Since 2014 - 2015
 */
package com.seeyoui.kensite.framework.plugin.info.controller;  
 
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
import com.seeyoui.kensite.framework.plugin.info.domain.Information;
import com.seeyoui.kensite.framework.plugin.info.service.InformationService;
import com.seeyoui.kensite.framework.system.service.SysUserService;
import com.seeyoui.kensite.framework.system.util.UserUtils;
/**
 * @author cuichen
 * @version 1.0
 * @since 1.0
 */
@Controller
@RequestMapping(value = "information")
public class InformationController extends BaseController {
	
	@Autowired
	private InformationService informationService;
	@Autowired
	private SysUserService sysUserService;
	
	/**
	 * 展示列表页面
	 * @param modelMap
	 * @param module
	 * @return
	 * @throws Exception
	 */
	@RequiresUser
	@RequestMapping(value = "/showPageList")
	public ModelAndView showInformationPageList(HttpSession session,
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
	@RequiresUser
	@RequestMapping(value = "/getListData", method=RequestMethod.POST)
	@ResponseBody
	public String getListData(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, Information information) throws Exception{
		List<Information> informationList = informationService.findInformationList(information);
		EasyUIDataGrid eudg = informationService.findInformationListTotal(information);
		eudg.setRows(informationList);
		JSONObject jsonObj = JSONObject.fromObject(eudg);
		RequestResponseUtil.putResponseStr(session, response, request, jsonObj);
		return null;
	}
	
	/**
	 * 保存新增的数据
	 * @param modelMap
	 * @param information
	 * @return
	 * @throws Exception
	 */
	@RequiresUser
	@RequestMapping(value = "/saveByAdd", method=RequestMethod.POST)
	@ResponseBody
	public String saveInformationByAdd(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, Information information) throws Exception{
		informationService.saveInformation(information);
		RequestResponseUtil.putResponseStr(session, response, request, StringConstant.TRUE);
		return null;
	}
	
	/**
	 * 保存修改的数据
	 * @param modelMap
	 * @param information
	 * @return
	 * @throws Exception
	 */
	@RequiresUser
	@RequestMapping(value = "/saveByUpdate", method=RequestMethod.POST)
	@ResponseBody
	public String saveInformationByUpdate(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, Information information) throws Exception{
		informationService.updateInformation(information);
		RequestResponseUtil.putResponseStr(session, response, request, StringConstant.TRUE);
		return null;
	}
	
	/**
	 * 删除数据库
	 * @param modelMap
	 * @param informationId
	 * @return
	 * @throws Exception
	 */
	@RequiresUser
	@RequestMapping(value = "/delete", method=RequestMethod.POST)
	@ResponseBody
	public String delete(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, String delDataId) throws Exception {
		List<String> listId = Arrays.asList(delDataId.split(","));
		informationService.deleteInformation(listId);
		RequestResponseUtil.putResponseStr(session, response, request, StringConstant.TRUE);
		return null;
	}
	
	/**
	 * 获取当前用户系统消息
	 * @param session
	 * @param response
	 * @param request
	 * @param modelMap
	 * @param information
	 * @return
	 * @throws Exception
	 */
	@RequiresUser
	@RequestMapping(value = "/getUserInformation", method=RequestMethod.POST)
	@ResponseBody
	public String getUserInformation(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, Information information) throws Exception {
		String userName = UserUtils.getUser().getUsername();
		information.setReceiver(userName);
		List<Information> informationList = informationService.findInformationList(information);
		JSONArray jsonArr = JSONArray.fromObject(informationList);
		RequestResponseUtil.putResponseStr(session, response, request, jsonArr);
		return null;
	}
	
	/**
	 * 将消息标记为已读
	 * @param modelMap
	 * @param readIds
	 * @return
	 * @throws Exception
	 */
	@RequiresUser
	@RequestMapping(value = "/readInfo", method=RequestMethod.POST)
	@ResponseBody
	public String readInfo(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, String readIds) throws Exception {
		List<String> listId = Arrays.asList(readIds.split(","));
		informationService.readInfo(listId);
		RequestResponseUtil.putResponseStr(session, response, request, StringConstant.TRUE);
		return null;
	}
	
	@RequiresUser
	@RequestMapping(value = "/sendInfo", method=RequestMethod.POST)
	@ResponseBody
	public String sendInfo(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, Information information, String receiverUser, String receiverRole, String receiverDept) throws Exception {
		if(receiverUser!=null) {
			information.setReceiver(receiverUser);
			informationService.sendInformation(information);
		}
		if(receiverRole!=null) {
			
		}
		if(receiverDept!=null) {
			
		}
		RequestResponseUtil.putResponseStr(session, response, request, StringConstant.TRUE);
		return null;
	}
}