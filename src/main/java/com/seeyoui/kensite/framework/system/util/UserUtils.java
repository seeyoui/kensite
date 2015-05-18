package com.seeyoui.kensite.framework.system.util;

import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.UnavailableSecurityManagerException;
import org.apache.shiro.session.InvalidSessionException;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

import com.seeyoui.kensite.common.util.CacheUtils;
import com.seeyoui.kensite.common.util.SpringContextHolder;
import com.seeyoui.kensite.framework.security.shiro.SystemAuthorizingRealm.Principal;
import com.seeyoui.kensite.framework.system.domain.SysDepartment;
import com.seeyoui.kensite.framework.system.domain.SysMenu;
import com.seeyoui.kensite.framework.system.domain.SysRole;
import com.seeyoui.kensite.framework.system.domain.SysUser;
import com.seeyoui.kensite.framework.system.persistence.SysDepartmentMapper;
import com.seeyoui.kensite.framework.system.persistence.SysMenuMapper;
import com.seeyoui.kensite.framework.system.persistence.SysRoleMapper;
import com.seeyoui.kensite.framework.system.persistence.SysUserMapper;

public class UserUtils {

	private static SysUserMapper sysUserMapper = SpringContextHolder.getBean(SysUserMapper.class);
	private static SysRoleMapper sysRoleMapper = SpringContextHolder.getBean(SysRoleMapper.class);
	private static SysMenuMapper sysMenuMapper = SpringContextHolder.getBean(SysMenuMapper.class);
//	private static AreaDao areaDao = SpringContextHolder.getBean(AreaDao.class);
	private static SysDepartmentMapper sysDepartmentMapper = SpringContextHolder.getBean(SysDepartmentMapper.class);

	public static final String USER_CACHE = "userCache";
	public static final String USER_CACHE_ID_ = "id_";
	public static final String USER_CACHE_LOGIN_NAME_ = "ln";
	public static final String USER_CACHE_LIST_BY_OFFICE_ID_ = "oid_";

	public static final String CACHE_ROLE_LIST = "roleList";
	public static final String CACHE_MENU_LIST = "menuList";
	public static final String CACHE_AREA_LIST = "areaList";
	public static final String CACHE_OFFICE_LIST = "officeList";
	public static final String CACHE_OFFICE_ALL_LIST = "officeAllList";
	
	/**
	 * 根据ID获取用户
	 * @param id
	 * @return 取不到返回null
	 */
	public static SysUser get(String username){
		SysUser sysUser = (SysUser)CacheUtils.get(USER_CACHE, USER_CACHE_ID_ + username);
		if (sysUser ==  null){
			sysUser = sysUserMapper.findSysUserByUsername(username);
			if (sysUser == null){
				return null;
			}
//			sysUser.setRoleList(sysRoleMapper.findSysUserRoleList(sysUser));
			CacheUtils.put(USER_CACHE, USER_CACHE_ID_ + sysUser.getId(), sysUser);
			CacheUtils.put(USER_CACHE, USER_CACHE_LOGIN_NAME_ + sysUser.getUsername(), sysUser);
		}
		return sysUser;
	}
	
	/**
	 * 根据登录名获取用户
	 * @param loginName
	 * @return 取不到返回null
	 */
	public static SysUser getByLoginName(String loginName){
		SysUser sysUser = (SysUser)CacheUtils.get(USER_CACHE, USER_CACHE_LOGIN_NAME_ + loginName);
		if (sysUser == null){
			sysUser = sysUserMapper.findSysUserByUserName(loginName);
			if (sysUser == null){
				return null;
			}
//			sysUser.setRoleList(sysRoleMapper.findList(new SysRole(sysUser)));
			CacheUtils.put(USER_CACHE, USER_CACHE_ID_ + sysUser.getId(), sysUser);
			CacheUtils.put(USER_CACHE, USER_CACHE_LOGIN_NAME_ + sysUser.getUsername(), sysUser);
		}
		return sysUser;
	}
	
	/**
	 * 清除当前用户缓存
	 */
	public static void clearCache(){
		removeCache(CACHE_ROLE_LIST);
		removeCache(CACHE_MENU_LIST);
		removeCache(CACHE_AREA_LIST);
		removeCache(CACHE_OFFICE_LIST);
		removeCache(CACHE_OFFICE_ALL_LIST);
		UserUtils.clearCache(getUser());
	}
	
	/**
	 * 清除指定用户缓存
	 * @param sysUser
	 */
	public static void clearCache(SysUser sysUser){
		CacheUtils.remove(USER_CACHE, USER_CACHE_ID_ + sysUser.getId());
		CacheUtils.remove(USER_CACHE, USER_CACHE_LOGIN_NAME_ + sysUser.getUsername());
		if (sysUser.getDepartmentid() != null){
			CacheUtils.remove(USER_CACHE, USER_CACHE_LIST_BY_OFFICE_ID_ + sysUser.getDepartmentid());
		}
	}
	
	/**
	 * 获取当前用户
	 * @return 取不到返回 new SysUser()
	 */
	public static SysUser getUser(){
		Principal principal = getPrincipal();
		if (principal!=null){
			SysUser sysUser = get(principal.getUserName());
			if (sysUser != null){
				return sysUser;
			}
			return new SysUser();
		}
		// 如果没有登录，则返回实例化空的User对象。
		return new SysUser();
	}

	/**
	 * 获取当前用户角色列表
	 * @return
	 */
	public static List<SysRole> getRoleList(){
		@SuppressWarnings("unchecked")
		List<SysRole> roleList = (List<SysRole>)getCache(CACHE_ROLE_LIST);
		if (roleList == null){
			SysUser sysUser = getUser();
//			if (sysUser.isAdmin()){
//				roleList = sysRoleMapper.findAllList(new SysRole());
//			}else{
//				SysRole sysRole = new SysRole();
//				roleList = sysRoleMapper.findList(sysRole);
//			}
			putCache(CACHE_ROLE_LIST, roleList);
		}
		return roleList;
	}
	
	/**
	 * 获取当前用户授权菜单
	 * @return
	 */
	public static List<SysMenu> getMenuList(){
		@SuppressWarnings("unchecked")
		List<SysMenu> menuList = (List<SysMenu>)getCache(CACHE_MENU_LIST);
		if (menuList == null){
			SysUser sysUser = getUser();
//			if (sysUser.isAdmin()){
//				menuList = sysMenuMapper.findAllList(new SysMenu());
//			}else{
//				menuList = sysMenuMapper.findSysMenuTree(sysUser);
//			}
			putCache(CACHE_MENU_LIST, menuList);
		}
		return menuList;
	}
	
	/**
	 * 获取当前用户有权限访问的部门
	 * @return
	 */
	public static List<SysDepartment> getOfficeList(){
		@SuppressWarnings("unchecked")
		List<SysDepartment> officeList = (List<SysDepartment>)getCache(CACHE_OFFICE_LIST);
		if (officeList == null){
			SysUser sysUser = getUser();
//			if (sysUser.isAdmin()){
//				officeList = sysDepartmentMapper.findAllList(new SysDepartment());
//			}else{
//				officeList = sysDepartmentMapper.findList(office);
//			}
			putCache(CACHE_OFFICE_LIST, officeList);
		}
		return officeList;
	}

	/**
	 * 获取当前用户有权限访问的部门
	 * @return
	 */
	public static List<SysDepartment> getOfficeAllList(){
		@SuppressWarnings("unchecked")
		List<SysDepartment> officeList = (List<SysDepartment>)getCache(CACHE_OFFICE_ALL_LIST);
		if (officeList == null){
//			officeList = sysDepartmentMapper.findAllList(new SysDepartment());
		}
		return officeList;
	}
	
	/**
	 * 获取授权主要对象
	 */
	public static Subject getSubject(){
		return SecurityUtils.getSubject();
	}
	
	/**
	 * 获取当前登录者对象
	 */
	public static Principal getPrincipal(){
		try{
			Subject subject = SecurityUtils.getSubject();
			SysUser sysUser = new SysUser();
			sysUser.setUsername(subject.getPrincipal().toString());
			Principal principal = new Principal(sysUser);
			if (principal != null){
				return principal;
			}
//			subject.logout();
		}catch (UnavailableSecurityManagerException e) {
			
		}catch (InvalidSessionException e){
			
		}
		return null;
	}
	
	public static Session getSession(){
		try{
			Subject subject = SecurityUtils.getSubject();
			Session session = subject.getSession(false);
			if (session == null){
				session = subject.getSession();
			}
			if (session != null){
				return session;
			}
//			subject.logout();
		}catch (InvalidSessionException e){
			
		}
		return null;
	}
	
	// ============== SysUser Cache ==============
	
	public static Object getCache(String key) {
		return getCache(key, null);
	}
	
	public static Object getCache(String key, Object defaultValue) {
//		Object obj = getCacheMap().get(key);
		Object obj = getSession().getAttribute(key);
		return obj==null?defaultValue:obj;
	}

	public static void putCache(String key, Object value) {
//		getCacheMap().put(key, value);
		getSession().setAttribute(key, value);
	}

	public static void removeCache(String key) {
//		getCacheMap().remove(key);
		getSession().removeAttribute(key);
	}
	
//	public static Map<String, Object> getCacheMap(){
//		Principal principal = getPrincipal();
//		if(principal!=null){
//			return principal.getCacheMap();
//		}
//		return new HashMap<String, Object>();
//	}
	
}
