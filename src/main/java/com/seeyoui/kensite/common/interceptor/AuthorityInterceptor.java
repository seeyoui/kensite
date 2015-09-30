package com.seeyoui.kensite.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.seeyoui.kensite.common.base.service.BaseService;
import com.seeyoui.kensite.common.util.SessionUtil;

/**
 * Session拦截器
 * @author SeeYoui
 * @version 2015-09-25
 */
public class AuthorityInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, 
			Object handler) throws Exception {
		String path = request.getServletPath();
		System.out.println("===================session");
		System.out.println("===================");
		System.out.println(SessionUtil.getSession("currentUserName")+"=="+path);
		System.out.println(String.valueOf(request.getSession().getAttribute("currentUserName"))+"=="+path);
		System.out.println("===================");
		System.out.println("===================");
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, 
			ModelAndView modelAndView) throws Exception {
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, 
			Object handler, Exception ex) throws Exception {
	}

}
