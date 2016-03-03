/*
 * Powered By cuichen
 * Since 2014 - 2015
 */
package com.seeyoui.kensite.weixin.controller;  
 
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.seeyoui.kensite.common.base.controller.BaseController;
import com.seeyoui.kensite.weixin.service.CoreService;
import com.seeyoui.kensite.weixin.util.SignUtil;
/**
 * 请求处理的核心类
 * @author cuichen
 * @version 1.0
 * @since 1.0
 * @date 2015-11-16
 */
@Controller
@RequestMapping(value = "weixin")
public class WXCoreController extends BaseController {
	
	/**
	 * 请求校验（确认请求来自微信服务器）
	 * @param session
	 * @param response
	 * @param request
	 * @param modelMap
	 * @param signature微信加密签名
	 * @param timestamp时间戳
	 * @param nonce随机数
	 * @param echostr随机字符串
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/core", method=RequestMethod.GET)
	@ResponseBody
	public Object doGet(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, String signature, String timestamp, String nonce, String echostr) throws Exception {
		if (SignUtil.checkSignature(signature, timestamp, nonce)) {
			return echostr;
		}
		return null;
	}

	/**
	 * 请求校验与处理
	 * @param session
	 * @param response
	 * @param request
	 * @param modelMap
	 * @param signature微信加密签名
	 * @param timestamp时间戳
	 * @param nonce随机数
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/core", method=RequestMethod.POST)
	@ResponseBody
	public void doPost(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, String signature, String timestamp, String nonce) throws Exception {
		// 将请求、响应的编码均设置为UTF-8（防止中文乱码）
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		if (SignUtil.checkSignature(signature, timestamp, nonce)) {
			String respXml = CoreService.processRequest(request);
			out.print(respXml);
		}
		out.close();
	}
}