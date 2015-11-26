/*
 * Powered By cuichen
 * Since 2014 - 2015
 */
package com.seeyoui.kensite.framework.system.controller;  
 
import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.seeyoui.kensite.common.base.controller.BaseController;
import com.seeyoui.kensite.common.base.domain.EasyUIDataGrid;
import com.seeyoui.kensite.common.base.domain.TreeJson;
import com.seeyoui.kensite.common.constants.StringConstant;
import com.seeyoui.kensite.common.util.FileUtils;
import com.seeyoui.kensite.common.util.RequestResponseUtil;
import com.seeyoui.kensite.framework.plugin.skins.domain.Skins;
import com.seeyoui.kensite.framework.plugin.skins.service.SkinsService;
import com.seeyoui.kensite.framework.system.domain.SysMenu;
import com.seeyoui.kensite.framework.system.service.SysMenuService;
import com.seeyoui.kensite.framework.system.util.SkinsUtils;
/**
 * @author cuichen
 * @version 1.0
 * @since 1.0
 */
@Controller
@RequestMapping(value = "sysMenu")
public class SysMenuController extends BaseController {
	
	@Autowired
	private SysMenuService sysMenuService;
	@Autowired
	private SkinsService skinsService;
	
	/**
	 * 展示列表页面
	 * @param modelMap
	 * @param module
	 * @return
	 * @throws Exception
	 */
	@RequiresPermissions("sysMenu:view")
	@RequestMapping(value = "/showPageList")
	public ModelAndView showSysMenuPageList(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap) throws Exception {
		String ctxPath = request.getSession().getServletContext().getRealPath("/"); 
		List<String> menuIconList = new ArrayList<String>();
		Skins skin = SkinsUtils.getCurSysSkins();
		String skinsUrl = "";
    	if(skin!=null && !"".equals(skin.getUrl())) {
    		skinsUrl = skin.getUrl();
    	}
		String url = ctxPath + "/static/skins/"+skinsUrl+"/img/menu/";
		url = FileUtils.path(url);
		File file = new File(url);
		if(file.exists() && file.isDirectory()) {
			File[] fs = file.listFiles();
			for(int i=0; i<fs.length; i++){
				if(fs[i].isFile()) {
					menuIconList.add(skinsUrl+"/img/menu/"+fs[i].getName());
				}
			}
		}
		modelMap.put("menuIconList", menuIconList);
		return new ModelAndView("framework/system/sysMenu", modelMap);
	}
	
	/**
	 * 获取列表展示数据
	 * @param modelMap
	 * @param sysMenu
	 * @return
	 * @throws Exception
	 */
	@RequiresPermissions("sysMenu:select")
	@RequestMapping(value = "/getListData", method=RequestMethod.POST)
	@ResponseBody
	public String getListData(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, SysMenu sysMenu) throws Exception{
		List<SysMenu> sysMenuList = sysMenuService.findSysMenuList(sysMenu);
		EasyUIDataGrid eudg = sysMenuService.findSysMenuListTotal(sysMenu);
		eudg.setRows(sysMenuList);
		JSONObject jsonObj = JSONObject.fromObject(eudg);
		RequestResponseUtil.putResponseStr(session, response, request, jsonObj);
		return null;
	}
	
	/**
	 * 获取模块TREE页面JSON数据
	 * @return
	 * @throws Exception
	 */
	@RequiresPermissions("sysMenu:select")
	@RequestMapping(value = "/getTreeJson", method=RequestMethod.POST)
	@ResponseBody
	public String getTreeJson(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, String username) throws Exception {
		List<TreeJson> tList = sysMenuService.getTreeJson();
		JSONArray jsonObj = JSONArray.fromObject(tList);
		return jsonObj.toString();
	}
	
	/**
	 * 保存新增的数据
	 * @param modelMap
	 * @param sysMenu
	 * @return
	 * @throws Exception
	 */
	@RequiresPermissions("sysMenu:insert")
	@RequestMapping(value = "/saveByAdd", method=RequestMethod.POST)
	@ResponseBody
	public String saveSysMenuByAdd(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, SysMenu sysMenu) throws Exception{
		if (!beanValidator(modelMap, sysMenu)){
			RequestResponseUtil.putResponseStr(session, response, request, modelMap, StringConstant.FALSE);
			return null;
		}
		sysMenuService.saveSysMenu(sysMenu);
		RequestResponseUtil.putResponseStr(session, response, request, modelMap, StringConstant.TRUE);
		return null;
	}
	
	/**
	 * 保存修改的数据
	 * @param modelMap
	 * @param sysMenu
	 * @return
	 * @throws Exception
	 */
	@RequiresPermissions("sysMenu:update")
	@RequestMapping(value = "/saveByUpdate", method=RequestMethod.POST)
	@ResponseBody
	public String saveSysMenuByUpdate(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, SysMenu sysMenu) throws Exception{
		if (!beanValidator(modelMap, sysMenu)){
			RequestResponseUtil.putResponseStr(session, response, request, modelMap, StringConstant.FALSE);
			return null;
		}
		sysMenuService.updateSysMenu(sysMenu);
		RequestResponseUtil.putResponseStr(session, response, request, modelMap, StringConstant.TRUE);
		return null;
	}
	
	/**
	 * 删除数据库
	 * @param modelMap
	 * @param sysMenuId
	 * @return
	 * @throws Exception
	 */
	@RequiresPermissions("sysMenu:delete")
	@RequestMapping(value = "/delete", method=RequestMethod.POST)
	@ResponseBody
	public String delete(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, String delDataId) throws Exception {
		List<String> listId = Arrays.asList(delDataId.split(","));
		sysMenuService.deleteSysMenu(listId);
		RequestResponseUtil.putResponseStr(session, response, request, modelMap, StringConstant.TRUE);
		return null;
	}
}