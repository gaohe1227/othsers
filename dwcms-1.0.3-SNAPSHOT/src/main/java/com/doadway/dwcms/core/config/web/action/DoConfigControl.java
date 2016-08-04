package com.doadway.dwcms.core.config.web.action;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.doadway.dwcms.core.config.biz.DoConfigBiz;
@Controller
@RequestMapping("/admin/core/config/doConfig")
public class DoConfigControl {
	@Resource
	private DoConfigBiz doConfigBiz;
	Map<String,Object> doConfigMap =new HashMap<String,Object>();
	@RequestMapping("v_edit")
	public String findDoConfigMap(Map<String, Object> model){
		doConfigMap=doConfigBiz.findAllDoConfig();
		model.put("doConfigInfo", doConfigMap);
		return "config/config_login";
	}
	@RequestMapping("o_save")
	public String setupConfigLogin(HttpServletRequest request,Map<String, Object> model){
		doConfigMap.put(DoConfigBiz.EMAIL_ENCODING, request.getParameter(DoConfigBiz.EMAIL_ENCODING));
		doConfigMap.put(DoConfigBiz.EMAIL_HOST, request.getParameter(DoConfigBiz.EMAIL_HOST));
		doConfigMap.put(DoConfigBiz.EMAIL_PASSWORD, request.getParameter(DoConfigBiz.EMAIL_PASSWORD));
		doConfigMap.put(DoConfigBiz.EMAIL_PERSONAL, request.getParameter(DoConfigBiz.EMAIL_PERSONAL));
		doConfigMap.put(DoConfigBiz.EMAIL_PORT, request.getParameter(DoConfigBiz.EMAIL_PORT));
		doConfigMap.put(DoConfigBiz.EMAIL_USERNAME, request.getParameter(DoConfigBiz.EMAIL_USERNAME));
		doConfigMap.put(DoConfigBiz.LOGIN_ERROR_INTERVAL, request.getParameter(DoConfigBiz.LOGIN_ERROR_INTERVAL));
		doConfigMap.put(DoConfigBiz.LOGIN_ERROR_TIMES, request.getParameter(DoConfigBiz.LOGIN_ERROR_TIMES));
		doConfigMap.put(DoConfigBiz.MESSAGE_SUBJECT, request.getParameter(DoConfigBiz.MESSAGE_SUBJECT));
		doConfigMap.put(DoConfigBiz.MESSAGE_TEXT, request.getParameter(DoConfigBiz.MESSAGE_TEXT));
		boolean flag = doConfigBiz.saveDoConfig(doConfigMap);
		model.put("doConfigInfo", doConfigMap);
		model.put("status", flag);
		return "config/config_login";
	}
}
