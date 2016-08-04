package com.doadway.dwcms.core.config.web.action;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.doadway.dwcms.core.config.biz.ConfigBiz;
import com.doadway.dwcms.core.config.pojo.Config;
import com.doadway.dwcms.core.user.biz.LogBiz;
@Controller
@RequestMapping("/admin/core/config/config")
public class ConfigControl {
	@Resource
	LogBiz logBiz;	
	@Resource
	private ConfigBiz configBiz;
	Config config =new Config();
	@RequestMapping("v_edit")
	public String findConfigSystem(HttpServletRequest request,Map<String, Object> model){
		Integer id = request.getParameter("configId")!=null?Integer.parseInt(request.getParameter("configId")):1;
		config=configBiz.findConfigById(id);
		model.put("configInfo", config);
		return "config/config_system";
	}
	@RequestMapping("o_save")
	public String setupSystemInfo(HttpServletRequest request,Config configInfo,Map<String, Object> model){
		boolean flag = configBiz.setConfig(configInfo);
		model.put("configInfo", configInfo);
		model.put("status",flag);
		logBiz.operating(request, "保存系统配置", "id="+configInfo.getConfigId());
		return "config/config_system";
	}
}
