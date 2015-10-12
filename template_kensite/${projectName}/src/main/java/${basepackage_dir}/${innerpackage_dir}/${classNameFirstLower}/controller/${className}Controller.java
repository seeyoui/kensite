<#include "/custom.include">
<#include "/java_copyright.include">
<#assign className = table.className>   
<#assign classNameLower = className?uncap_first>
<#assign module = table.className[3..]?uncap_first>

package ${basepackage}.${innerpackage}.${table.classNameFirstLower}.controller;  
 
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

import ${basepackage}.common.constants.StringConstant;
import ${basepackage}.common.base.domain.EasyUIDataGrid;
import ${basepackage}.common.base.controller.BaseController;
import ${basepackage}.common.util.RequestResponseUtil;
import ${basepackage}.${innerpackage}.${table.classNameFirstLower}.domain.${className};
import ${basepackage}.${innerpackage}.${table.classNameFirstLower}.service.${className}Service;
<#include "/java_imports.include">

@Controller
@RequestMapping(value = "${moduleC}${table.classNameFirstLower}")
public class ${className}Controller extends BaseController {
	
	@Autowired
	private ${className}Service ${table.classNameFirstLower}Service;
	
	/**
	 * 展示列表页面
	 * @param modelMap
	 * @param module
	 * @return
	 * @throws Exception
	 */
	@RequiresPermissions("${moduleP}${table.classNameFirstLower}:view")
	@RequestMapping(value = "/showPageList")
	public ModelAndView show${className}PageList(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap) throws Exception {
		return new ModelAndView("${innerpackage_dir}/${table.classNameFirstLower}/${table.classNameFirstLower}", modelMap);
	}
	
	/**
	 * 获取列表展示数据
	 * @param modelMap
	 * @param ${table.classNameFirstLower}
	 * @return
	 * @throws Exception
	 */
	@RequiresPermissions("${moduleP}${table.classNameFirstLower}:select")
	@RequestMapping(value = "/getListData", method=RequestMethod.POST)
	@ResponseBody
	public String getListData(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, ${className} ${table.classNameFirstLower}) throws Exception{
		List<${className}> ${table.classNameFirstLower}List = ${table.classNameFirstLower}Service.find${className}List(${table.classNameFirstLower});
		EasyUIDataGrid eudg = ${table.classNameFirstLower}Service.find${className}ListTotal(${table.classNameFirstLower});
		eudg.setRows(${table.classNameFirstLower}List);
		JSONObject jsonObj = JSONObject.fromObject(eudg);
		RequestResponseUtil.putResponseStr(session, response, request, jsonObj);
		return null;
	}
	
	/**
	 * 获取所有数据
	 * @param modelMap
	 * @param ${table.classNameFirstLower}
	 * @return
	 * @throws Exception
	 */
	@RequiresPermissions("${moduleP}${table.classNameFirstLower}:select")
	@RequestMapping(value = "/getAllListData", method=RequestMethod.POST)
	@ResponseBody
	public String getAllListData(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, ${className} ${table.classNameFirstLower}) throws Exception{
		List<${className}> ${table.classNameFirstLower}List = ${table.classNameFirstLower}Service.findAll${className}List(${table.classNameFirstLower});
		JSONArray jsonObj = JSONArray.fromObject(${table.classNameFirstLower}List);
		RequestResponseUtil.putResponseStr(session, response, request, jsonObj);
		return null;
	}
	
	/**
	 * 保存新增的数据
	 * @param modelMap
	 * @param ${table.classNameFirstLower}
	 * @return
	 * @throws Exception
	 */
	@RequiresPermissions("${moduleP}${table.classNameFirstLower}:insert")
	@RequestMapping(value = "/saveByAdd", method=RequestMethod.POST)
	@ResponseBody
	public String save${className}ByAdd(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, ${className} ${table.classNameFirstLower}) throws Exception{
		if (!beanValidator(modelMap, ${table.classNameFirstLower})){
			RequestResponseUtil.putResponseStr(session, response, request, modelMap, StringConstant.FALSE);
			return null;
		}
		${table.classNameFirstLower}Service.save${className}(${table.classNameFirstLower});
		RequestResponseUtil.putResponseStr(session, response, request, modelMap, StringConstant.TRUE);
		return null;
	}
	
	/**
	 * 保存修改的数据
	 * @param modelMap
	 * @param ${table.classNameFirstLower}
	 * @return
	 * @throws Exception
	 */
	@RequiresPermissions("${moduleP}${table.classNameFirstLower}:update")
	@RequestMapping(value = "/saveByUpdate", method=RequestMethod.POST)
	@ResponseBody
	public String save${className}ByUpdate(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, ${className} ${table.classNameFirstLower}) throws Exception{
		if (!beanValidator(modelMap, ${table.classNameFirstLower})){
			RequestResponseUtil.putResponseStr(session, response, request, modelMap, StringConstant.FALSE);
			return null;
		}
		${table.classNameFirstLower}Service.update${className}(${table.classNameFirstLower});
		RequestResponseUtil.putResponseStr(session, response, request, modelMap, StringConstant.TRUE);
		return null;
	}
	
	/**
	 * 删除数据库
	 * @param modelMap
	 * @param ${table.classNameFirstLower}Id
	 * @return
	 * @throws Exception
	 */
	@RequiresPermissions("${moduleP}${table.classNameFirstLower}:delete")
	@RequestMapping(value = "/delete", method=RequestMethod.POST)
	@ResponseBody
	public String delete(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, String delDataId) throws Exception {
		List<String> listId = Arrays.asList(delDataId.split(","));
		${table.classNameFirstLower}Service.delete${className}(listId);
		RequestResponseUtil.putResponseStr(session, response, request, modelMap, StringConstant.TRUE);
		return null;
	}
}