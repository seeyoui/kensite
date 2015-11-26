/*
 * Powered By cuichen
 * Since 2014 - 2015
 */
package com.seeyoui.kensite.framework.plugin.db;  
 
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.seeyoui.kensite.common.base.controller.BaseController;
import com.seeyoui.kensite.common.util.DateUtils;
import com.seeyoui.kensite.common.util.excel.ExportExcel;
import com.seeyoui.kensite.framework.plugin.db.userTabColumns.domain.UserTabColumns;
import com.seeyoui.kensite.framework.plugin.db.userTabColumns.service.UserTabColumnsService;
/**
 * 数据库字典
 * @author cuichen
 * @version 1.0
 * @since 1.0
 * @date 2015-10-20
 */
@Controller
@RequestMapping(value = "sys/db")
public class DBColumnsController extends BaseController {
	
	@Autowired
	UserTabColumnsService userTabColumnsService;
	
	/**
	 * 展示列表页面
	 * @param modelMap
	 * @param module
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/{page}")
	public ModelAndView showDBPageList(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, @PathVariable String page) throws Exception {
		return new ModelAndView("framework/plugin/db/"+page, modelMap);
	}
	
	/**
	 * 导出所有数据
	 * @param modelMap
	 * @param userTabColumns
	 * @return
	 * @throws Exception
	 */
//	@RequiresPermissions("sys:userTabColumns:export")
	@RequestMapping(value = "/export")
	public String export(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, UserTabColumns userTabColumns) throws Exception{
		String fileName = "DATABASE_DICTIONARY"+DateUtils.getDate("yyyyMMddHHmmss")+".xlsx";
		List<UserTabColumns> userTabColumnsList = userTabColumnsService.findAll(userTabColumns);
		new ExportExcel(userTabColumns.getTableName(), UserTabColumns.class).setDataList(userTabColumnsList).write(response, fileName).dispose();
		return null;
	}
}