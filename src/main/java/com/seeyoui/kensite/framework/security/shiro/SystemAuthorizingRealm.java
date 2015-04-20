package com.seeyoui.kensite.framework.security.shiro;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.seeyoui.kensite.common.util.SpringContextHolder;
import com.seeyoui.kensite.framework.system.domain.SysPermission;
import com.seeyoui.kensite.framework.system.domain.SysRole;
import com.seeyoui.kensite.framework.system.domain.SysUser;
import com.seeyoui.kensite.framework.system.service.SysPermissionService;
import com.seeyoui.kensite.framework.system.service.SysRoleService;
import com.seeyoui.kensite.framework.system.service.SysUserService;

/**
 * 系统安全认证实现类
 * @author ken
 * @version 2015-3-27
 */
@Service
public class SystemAuthorizingRealm extends AuthorizingRealm {

	private Logger logger = LoggerFactory.getLogger(getClass());
	
	private SysUserService sysUserService;
	
	private SysRoleService sysRoleService;
	
	private SysPermissionService sysPermissionService;

	/**
	 * 认证回调函数, 登录时调用
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken) {
		UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
		
//		int activeSessionSize = getSystemService().getSessionDao().getActiveSessions(false).size();
//		if (logger.isDebugEnabled()){
//			logger.debug("login submit, active session size: {}, username: {}", activeSessionSize, token.getUsername());
//		}
		
		// 校验登录验证码
//		if (LoginController.isValidateCodeLogin(token.getUsername(), false, false)){
//			Session session = UserUtils.getSession();
//			String code = (String)session.getAttribute(ValidateCodeServlet.VALIDATE_CODE);
//			if (token.getCaptcha() == null || !token.getCaptcha().toUpperCase().equals(code)){
//				throw new AuthenticationException("msg:验证码错误, 请重试.");
//			}
//		}
		
		// 校验用户名密码
		SysUser user = getSysUserService().findSysUserByUserName(token.getUsername());
		if (user != null) {
			if(user.getState() == null || "".equals(user.getState()) || "0".equals(user.getState())) {
				throw new LockedAccountException(); //帐号锁定
			} else {
				AuthenticationInfo authcInfo = new SimpleAuthenticationInfo(
						user.getUsername(), user.getPassword(), user.getName());
				this.setSession("currentUser", user);
				this.setSession("currentUsername", user.getUsername());
				return authcInfo;
			}
		} else {
			throw new UnknownAccountException();//没找到帐号
		}
	}

	/**
	 * 授权查询回调函数, 进行鉴权但缓存中无用户的授权信息时调用
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		String currentUsername = (String) super.getAvailablePrincipal(principals);
/*		// 获取当前已登录的用户
		if (!Global.TRUE.equals(Global.getConfig("user.multiAccountLogin"))){
			Collection<Session> sessions = getSystemService().getSessionDao().getActiveSessions(true, principal, UserUtils.getSession());
			if (sessions.size() > 0){
				// 如果是登录进来的，则踢出已在线用户
				if (UserUtils.getSubject().isAuthenticated()){
					for (Session session : sessions){
						getSystemService().getSessionDao().delete(session);
					}
				}
				// 记住我进来的，并且当前用户已登录，则退出当前用户提示信息。
				else{
					UserUtils.getSubject().logout();
					throw new AuthenticationException("msg:账号已在其它地方登录，请重新登录。");
				}
			}
		}*/
		SysUser user = getSysUserService().findSysUserByUserName(currentUsername);
		if (user != null) {
			SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
			Map<String, String> map = new HashMap<String, String>();
			map.put("username", currentUsername);
			List<SysRole> sysRoleList = getSysRoleService().findSysUserRoleList(map);
			// 添加用户角色
			for (SysRole sysRole : sysRoleList){
				info.addRole(sysRole.getShiro());
			}
			// 添加用户权限
			List<SysPermission> sysPermissionList = getSysPermissionService().findSysUserPermissionList(map);
			for (SysPermission sysPermission : sysPermissionList){
				info.addStringPermission(sysPermission.getId());
			}
			// 记录登录日志
			logger.info(currentUsername+"系统登录");
			return info;
		} else {
			return null;
		}
	}

	/**
	 * 获取系统业务对象
	 */
	public SysUserService getSysUserService() {
		if (sysUserService == null){
			sysUserService = SpringContextHolder.getBean(SysUserService.class);
		}
		return sysUserService;
	}
	public SysRoleService getSysRoleService() {
		if (sysRoleService == null){
			sysRoleService = SpringContextHolder.getBean(SysRoleService.class);
		}
		return sysRoleService;
	}
	public SysPermissionService getSysPermissionService() {
		if (sysPermissionService == null){
			sysPermissionService = SpringContextHolder.getBean(SysPermissionService.class);
		}
		return sysPermissionService;
	}
	
	/**
	 * 将一些数据放到ShiroSession中,以便于其它地方使用
	 * @see 比如Controller,使用时直接用HttpSession.getAttribute(key)就可以取到
	 */
	private void setSession(Object key, Object value){
		Subject currentUser = SecurityUtils.getSubject();
		if(null != currentUser){
			Session session = currentUser.getSession();
			System.out.println("Session默认超时时间为[" + session.getTimeout() + "]毫秒");
			if(null != session){
				session.setAttribute(key, value);
			}
		}
	}
	
}
