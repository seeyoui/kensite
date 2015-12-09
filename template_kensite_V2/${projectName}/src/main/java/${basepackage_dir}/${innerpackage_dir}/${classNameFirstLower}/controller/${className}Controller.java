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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ${basepackage}.common.util.DateUtils;
import ${basepackage}.common.constants.StringConstant;
import ${basepackage}.common.base.domain.EasyUIDataGrid;
import ${basepackage}.common.base.controller.BaseController;
import ${basepackage}.common.util.RequestResponseUtil;
import ${basepackage}.common.util.excel.ExportExcel;
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
	@RequestMapping(value = "/{page}")
	public ModelAndView view(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, @PathVariable String page) throws Exception {
		return new ModelAndView("${innerpackage_dir}/${table.classNameFirstLower}/"+page, modelMap);
	}
	
	/**
	 * 根据ID查询单条数据
	 * @param modelMap
	 * @param module
	 * @return
	 * @throws Exception
	 */
	@RequiresPermissions("${moduleP}${table.classNameFirstLower}:select")
	@RequestMapping(value = "/data/{id}")
	@ResponseBody
	public Object data(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, @PathVariable String id) throws Exception {
		${className} ${table.classNameFirstLower} = ${table.classNameFirstLower}Service.findOne(id);
		return ${table.classNameFirstLower};
	}
	
	/**
	 * 获取列表展示数据
	 * @param modelMap
	 * @param ${table.classNameFirstLower}
	 * @return
	 * @throws Exception
	 */
	@RequiresPermissions("${moduleP}${table.classNameFirstLower}:select")
	@RequestMapping(value = "/list/data", method=RequestMethod.POST)
	@ResponseBody
	public Object listData(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, ${className} ${table.classNameFirstLower}) throws Exception {
		List<${className}> ${table.classNameFirstLower}List = ${table.classNameFirstLower}Service.findList(${table.classNameFirstLower});
		int total = ${table.classNameFirstLower}Service.findTotal(${table.classNameFirstLower});
		EasyUIDataGrid eudg = new EasyUIDataGrid();
		eudg.setTotal(String.valueOf(total));
		eudg.setRows(${table.classNameFirstLower}List);
		return eudg;
	}
	
	/**
	 * 获取所有数据
	 * @param modelMap
	 * @param ${table.classNameFirstLower}
	 * @return
	 * @throws Exception
	 */
	@RequiresPermissions("${moduleP}${table.classNameFirstLower}:select")
	@RequestMapping(value = "/list/all", method=RequestMethod.POST)
	@ResponseBody
	public Object listAll(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, ${className} ${table.classNameFirstLower}) throws Exception {
		List<${className}> ${table.classNameFirstLower}List = ${table.classNameFirstLower}Service.findAll(${table.classNameFirstLower});
		return ${table.classNameFirstLower}List;
	}
	
	/**
	 * 保存新增的数据
	 * @param modelMap
	 * @param ${table.classNameFirstLower}
	 * @return
	 * @throws Exception
	 */
	@RequiresPermissions("${moduleP}${table.classNameFirstLower}:insert")
	@RequestMapping(value = "/save", method=RequestMethod.POST)
	@ResponseBody
	public String save(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, ${className} ${table.classNameFirstLower}) throws Exception {
		if (!beanValidator(modelMap, ${table.classNameFirstLower})){
			RequestResponseUtil.putResponseStr(session, response, request, modelMap, StringConstant.FALSE);
			return null;
		}
		${table.classNameFirstLower}Service.save(${table.classNameFirstLower});
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
	@RequestMapping(value = "/update", method=RequestMethod.POST)
	@ResponseBody
	public String update(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, ${className} ${table.classNameFirstLower}) throws Exception {
		if (!beanValidator(modelMap, ${table.classNameFirstLower})){
			RequestResponseUtil.putResponseStr(session, response, request, modelMap, StringConstant.FALSE);
			return null;
		}
		${table.classNameFirstLower}Service.update(${table.classNameFirstLower});
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
			ModelMap modelMap, String id) throws Exception {
		List<String> listId = Arrays.asList(id.split(","));
		${table.classNameFirstLower}Service.delete(listId);
		RequestResponseUtil.putResponseStr(session, response, request, modelMap, StringConstant.TRUE);
		return null;
	}

	/**
	 * 导出Excel数据
	 * @param modelMap
	 * @param ${table.classNameFirstLower}
	 * @return
	 * @throws Exception
	 */
	@RequiresPermissions("${moduleP}${table.classNameFirstLower}:export")
	@RequestMapping(value = "/export")
	public String export(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, ${className} ${table.classNameFirstLower}) throws Exception {
		String fileName = DateUtils.getDate("yyyyMMddHHmmss")+".xlsx";
		List<${className}> ${table.classNameFirstLower}List = ${table.classNameFirstLower}Service.findAll(${table.classNameFirstLower});
		new ExportExcel(null, ${className}.class).setDataList(${table.classNameFirstLower}List).write(response, fileName).dispose();
		return null;
	}
}