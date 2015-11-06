/*
 * Powered By cuichen
 * Since 2014 - 2015
 */
package com.seeyoui.kensite.framework.email.controller;  
 
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.seeyoui.kensite.common.base.controller.BaseController;
import com.seeyoui.kensite.common.util.DateUtils;
import com.seeyoui.kensite.common.util.SendMailUtil;
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
@RequestMapping(value = "sys/email")
public class EmailController extends BaseController {
	
	/**
	 * 发送邮件
	 * @param modelMap
	 * @param module
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/sendEmail")
	public String showDBPageList(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap) throws Exception {
		SendMailUtil.sendCommonMail("2624030701@qq.com", "主题", "内容<br/><a href=\"http://www.google.cn\">谷歌</a><br/>");
		return "";
	}
	
}