/*
 * Powered By cuichen
 * Since 2014 - 2015
 */
package com.seeyoui.kensite.framework.plugin.dict.controller;  
 
import java.sql.*;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresUser;
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
import com.seeyoui.kensite.common.base.domain.TreeJson;
import com.seeyoui.kensite.common.base.controller.BaseController;
import com.seeyoui.kensite.common.util.RequestResponseUtil;
import com.seeyoui.kensite.framework.plugin.dict.domain.Dict;
import com.seeyoui.kensite.framework.plugin.dict.service.DictService;
import com.seeyoui.kensite.framework.system.domain.SysDepartment;
import com.seeyoui.kensite.framework.system.util.DictUtils;
/**
 * @author cuichen
 * @version 1.0
 * @since 1.0
 */
@Controller
@RequestMapping(value = "sys/dict")
public class DictController extends BaseController {
	
	@Autowired
	private DictService dictService;
	
	/**
	 * 展示列表页面
	 * @param modelMap
	 * @param module
	 * @return
	 * @throws Exception
	 */
	@RequiresPermissions("dict:view")
	@RequestMapping(value = "/showPageList")
	public ModelAndView showDictPageList(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap) throws Exception {
		return new ModelAndView("framework/plugin/dict/dict", modelMap);
	}
	
	/**
	 * 获取列表展示数据
	 * @param modelMap
	 * @param dict
	 * @return
	 * @throws Exception
	 */
	@RequiresPermissions("dict:select")
	@RequestMapping(value = "/getListData", method=RequestMethod.POST)
	@ResponseBody
	public String getListData(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, Dict dict) throws Exception{
		List<Dict> dictList = dictService.findDictList(dict);
		EasyUIDataGrid eudg = dictService.findDictListTotal(dict);
		eudg.setRows(dictList);
		JSONObject jsonObj = JSONObject.fromObject(eudg);
		RequestResponseUtil.putResponseStr(session, response, request, jsonObj);
		return null;
	}
	
	/**
	 * 获取所有数据
	 * @param modelMap
	 * @param dict
	 * @return
	 * @throws Exception
	 */
	@RequiresPermissions("dict:select")
	@RequestMapping(value = "/getAllListData", method=RequestMethod.POST)
	@ResponseBody
	public String getAllListData(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, Dict dict) throws Exception{
		List<Dict> dictList = dictService.findDictList(dict);
		JSONArray jsonObj = JSONArray.fromObject(dictList);
		RequestResponseUtil.putResponseStr(session, response, request, jsonObj);
		return null;
	}
	
	/**
	 * 获取模块TREE页面JSON数据
	 * @return
	 * @throws Exception
	 */
	@RequiresUser
	@RequestMapping(value = "/getTreeJson", method=RequestMethod.POST)
	@ResponseBody
	public String getTreeJson(Dict dict) throws Exception {
		List<Dict> mList = dictService.getTreeJson(dict);
		List<TreeJson> tList = new ArrayList<TreeJson>();
		for(int i=0; i<mList.size(); i++) {
			TreeJson tj = new TreeJson();
			tj.setId(mList.get(i).getId());
			tj.setPid(mList.get(i).getParentId());
			tj.setText(mList.get(i).getLabel()+"["+mList.get(i).getCategory()+"]");
			tList.add(tj);
		}
		TreeJson root = new TreeJson();
		root.setId(StringConstant.ROOT_ID_32);
		root.setText("系统字典");
		TreeJson.getTree(tList, root);
		JSONArray jsonObj = JSONArray.fromObject(root);
		return jsonObj.toString();
	}
	
	/**
	 * 获取字典JSON数据
	 * @return
	 * @throws Exception
	 */
	@RequiresUser
	@RequestMapping(value = "/getDictJson")
	@ResponseBody
	public String getDictJson(Dict dict) throws Exception {
		return DictUtils.getDictListJson(dict.getCategory());
	}
	
	/**
	 * 获取字典LIST数据
	 * @return
	 * @throws Exception
	 */
	@RequiresUser
	@RequestMapping(value = "/getDictList")
	@ResponseBody
	public List<Dict> getDictList(Dict dict) throws Exception {
		return DictUtils.getDictList(dict.getCategory());
	}
	
	/**
	 * 获取字典LABEL数据
	 * @return
	 * @throws Exception
	 */
	@RequiresUser
	@RequestMapping(value = "/getDictLabel")
	@ResponseBody
	public String getDictLabel(Dict dict) throws Exception {
		return DictUtils.getDictLabel(dict.getValue(), dict.getCategory(), dict.getDefaultKey());
	}
	
	/**
	 * 获取字典VALUE数据
	 * @return
	 * @throws Exception
	 */
	@RequiresUser
	@RequestMapping(value = "/getDictValue")
	@ResponseBody
	public String getDictValue(Dict dict) throws Exception {
		return DictUtils.getDictValue(dict.getLabel(), dict.getCategory(), dict.getDefaultKey());
	}
	
	/**
	 * 保存新增的数据
	 * @param modelMap
	 * @param dict
	 * @return
	 * @throws Exception
	 */
	@RequiresPermissions("dict:insert")
	@RequestMapping(value = "/saveByAdd", method=RequestMethod.POST)
	@ResponseBody
	public String saveDictByAdd(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, Dict dict) throws Exception{
		if (!beanValidator(modelMap, dict)){
			RequestResponseUtil.putResponseStr(session, response, request, modelMap, StringConstant.FALSE);
			return null;
		}
		dictService.saveDict(dict);
		RequestResponseUtil.putResponseStr(session, response, request, modelMap, StringConstant.TRUE);
		return null;
	}
	
	/**
	 * 保存修改的数据
	 * @param modelMap
	 * @param dict
	 * @return
	 * @throws Exception
	 */
	@RequiresPermissions("dict:update")
	@RequestMapping(value = "/saveByUpdate", method=RequestMethod.POST)
	@ResponseBody
	public String saveDictByUpdate(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, Dict dict) throws Exception{
		if (!beanValidator(modelMap, dict)){
			RequestResponseUtil.putResponseStr(session, response, request, modelMap, StringConstant.FALSE);
			return null;
		}
		dictService.updateDict(dict);
		RequestResponseUtil.putResponseStr(session, response, request, modelMap, StringConstant.TRUE);
		return null;
	}
	
	/**
	 * 删除数据库
	 * @param modelMap
	 * @param dictId
	 * @return
	 * @throws Exception
	 */
	@RequiresPermissions("dict:delete")
	@RequestMapping(value = "/delete", method=RequestMethod.POST)
	@ResponseBody
	public String delete(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, String delDataId) throws Exception {
		List<String> listId = Arrays.asList(delDataId.split(","));
		dictService.deleteDict(listId);
		RequestResponseUtil.putResponseStr(session, response, request, modelMap, StringConstant.TRUE);
		return null;
	}
}