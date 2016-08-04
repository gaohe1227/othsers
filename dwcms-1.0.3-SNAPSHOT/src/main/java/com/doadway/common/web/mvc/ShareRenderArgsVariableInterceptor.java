package com.doadway.common.web.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.doadway.common.shiro.Permission;

public class ShareRenderArgsVariableInterceptor extends
		HandlerInterceptorAdapter {
	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		if(modelAndView==null) return ;
		modelAndView.addObject("shiro",new Permission());
		String viewName = modelAndView.getViewName();
		if(viewName != null && !viewName.startsWith("redirect:")) {
			modelAndView.addObject("httpInclude", new HttpInclude(request, response));
		}
	}
}
