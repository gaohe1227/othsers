package net.zz.utils.interceptor;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

@SuppressWarnings("serial")
public class PrivilegeInterceptor extends MethodFilterInterceptor {
	private static final Log log = LogFactory
			.getLog(PrivilegeInterceptor.class);

	@SuppressWarnings("unchecked")
	@Override
	protected String doIntercept(ActionInvocation actionInvocation)
			throws Exception {
		boolean isPrivilege = false;
		String servletPath = ServletActionContext.getRequest().getServletPath();
		servletPath = servletPath.substring(0, servletPath.indexOf("."));
		log.debug("进入权限拦截器->访问的资源为：[" + servletPath + "]");
		HttpSession session = ServletActionContext.getRequest().getSession();
		Integer type = Integer
				.parseInt(null != session.getAttribute("type") ? session
						.getAttribute("type").toString() : "1");
		if (null != type && 0 == type) { // 超级管理员无视权限控制
			isPrivilege = true;
		} else {
			Map<String, String> privileges = (Map<String, String>) session
					.getAttribute("privileges");
			if (null != privileges && null != privileges.get(servletPath)) { // 验证权限控制存在
				isPrivilege = true;
			}
		}
		if (isPrivilege) {
			actionInvocation.invoke();
			return "";
		} else {
			String errMsg = "您没有访问此功能的权限！功能路径为[" + servletPath
					+ "]请联系管理员给你赋予相应权限。";
			log.debug(errMsg);
			ServletActionContext.getRequest().setAttribute("msg", errMsg);
			return "noPrivilege";
		}
	}

}
