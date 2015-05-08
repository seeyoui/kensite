package com.seeyoui.kensite.framework.security.shiro;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.seeyoui.kensite.common.base.domain.TreeJson;
import com.seeyoui.kensite.common.util.SessionUtil;
import com.seeyoui.kensite.common.util.SpringContextHolder;
import com.seeyoui.kensite.framework.system.domain.SysMenu;
import com.seeyoui.kensite.framework.system.domain.SysPermission;
import com.seeyoui.kensite.framework.system.domain.SysRole;
import com.seeyoui.kensite.framework.system.domain.SysUser;
import com.seeyoui.kensite.framework.system.service.SysMenuService;
import com.seeyoui.kensite.framework.system.service.SysPermissionService;
import com.seeyoui.kensite.framework.system.service.SysRoleService;
import com.seeyoui.kensite.framework.system.service.SysUserService;
import com.seeyoui.kensite.framework.system.util.UserUtils;

/**
 * 系统安全认证实现类
 * @author ken
 * @version 2015-3-27
 */

public class SystemAuthorizingRealm extends AuthorizingRealm {

	private Logger logger = LoggerFactory.getLogger(getClass());
	
	private SysUserService sysUserService;
	
	private SysRoleService sysRoleService;
	
	private SysPermissionService sysPermissionService;
	
	private SysMenuService sysMenuService;

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
				SessionUtil.setSession("currentUser", user);
				SessionUtil.setSession("currentUsername", user.getUsername());
				List<TreeJson> menuList = getSysMenuService().findSysMenuTree(user);
				SessionUtil.setSession("menuList", menuList);
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
			SysUser sysUser = new SysUser();
			sysUser.setUsername(currentUsername);
			List<SysRole> sysRoleList = getSysRoleService().findSysUserRoleList(sysUser);
			// 添加用户角色
			for (SysRole sysRole : sysRoleList){
				info.addRole(sysRole.getShiro());
			}
			// 添加用户权限
			List<SysPermission> sysPermissionList = getSysPermissionService().findSysUserPermissionList(sysUser);
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
	 * 授权用户信息
	 */
	public static class Principal implements Serializable {

		private static final long serialVersionUID = 1L;
		
		private String id; // 编号
		private String loginName; // 登录名
		private String name; // 姓名
		private boolean mobileLogin; // 是否手机登录
		
//		private Map<String, Object> cacheMap;

		public Principal(SysUser sysUser, boolean mobileLogin) {
			this.id = sysUser.getId();
			this.loginName = sysUser.getUsername();
			this.name = sysUser.getName();
			this.mobileLogin = mobileLogin;
		}

		public String getId() {
			return id;
		}

		public String getLoginName() {
			return loginName;
		}

		public String getName() {
			return name;
		}

		public boolean isMobileLogin() {
			return mobileLogin;
		}

//		@JsonIgnore
//		public Map<String, Object> getCacheMap() {
//			if (cacheMap==null){
//				cacheMap = new HashMap<String, Object>();
//			}
//			return cacheMap;
//		}

		/**
		 * 获取SESSIONID
		 */
		public String getSessionid() {
			try{
				return (String) UserUtils.getSession().getId();
			}catch (Exception e) {
				return "";
			}
		}
		
		@Override
		public String toString() {
			return id;
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
	public SysMenuService getSysMenuService() {
		if (sysMenuService == null){
			sysMenuService = SpringContextHolder.getBean(SysMenuService.class);
		}
		return sysMenuService;
	}
	
}
