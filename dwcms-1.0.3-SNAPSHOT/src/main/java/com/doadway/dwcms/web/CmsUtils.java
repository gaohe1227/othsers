package com.doadway.dwcms.web;

import javax.servlet.http.HttpServletRequest;

import com.doadway.common.shiro.Permission;
import com.doadway.common.shiro.UserRealm.ShiroUser;
import com.doadway.dwcms.core.config.pojo.Site;
import com.doadway.dwcms.core.user.pojo.dto.UserDTO;

/**
 * 提供一些CMS系统中使用到的共用方法
 * 
 * 比如获得会员信息,获得后台站点信息
 * 
 * @author zhoutanxin
 * 
 */
public class CmsUtils {
	/**
	 * 用户KEY
	 */
	public static final String USER_KEY = "_user_key";
	/**
	 * 站点KEY
	 */
	public static final String SITE_KEY = "_site_key";
	/**
	 * Shiro授权
	 */
	public static final Permission persission = new Permission();
	/**
	 * 获得用户
	 * 
	 * @param request
	 * @return
	 */
	public static UserDTO getUser(HttpServletRequest request) {
		return (UserDTO) request.getAttribute(USER_KEY);
	}
	/**
	 * 获得用户令牌信息
	 * @return
	 */
	public static ShiroUser getShiroUser() {
		return (ShiroUser)persission.getPrincipal();
	}
	/**
	 * 获得用户ID
	 * 
	 * @param request
	 * @return
	 */
	public static Integer getUserId(HttpServletRequest request) {
		UserDTO user = getUser(request);
		if (user != null) {
			return user.getUserId();
		} else {
			return null;
		}
	}

	/**
	 * 设置用户
	 * 
	 * @param request
	 * @param user
	 */
	public static void setUser(HttpServletRequest request, UserDTO user) {
		request.setAttribute(USER_KEY, user);
	}

	/**
	 * 获得站点
	 * 
	 * @param request
	 * @return
	 */
	public static Site getSite(HttpServletRequest request) {
		return (Site) request.getAttribute(SITE_KEY);
	}

	/**
	 * 设置站点
	 * 
	 * @param request
	 * @param site
	 */
	public static void setSite(HttpServletRequest request, Site site) {
		request.setAttribute(SITE_KEY, site);
	}

	/**
	 * 获得站点ID
	 * 
	 * @param request
	 * @return
	 */
	public static Integer getSiteId(HttpServletRequest request) {
		return getSite(request).getSiteId();
	}
}
