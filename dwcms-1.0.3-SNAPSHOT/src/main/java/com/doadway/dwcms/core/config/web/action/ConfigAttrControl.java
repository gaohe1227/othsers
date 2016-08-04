package com.doadway.dwcms.core.config.web.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.doadway.dwcms.core.config.biz.ConfigAttrBiz;
import com.doadway.dwcms.core.config.pojo.ConfigAttr;
@Controller
@RequestMapping("/admin/core/config/configAttr")
public class ConfigAttrControl {
	@Resource
	private ConfigAttrBiz configAttrBiz;
	Map<String, Object> configAttrMap =new HashMap<String,Object>();
	@RequestMapping("v_edit")
	public String findConfigUser(HttpServletRequest request,Map<String, Object> model){
		Integer id = request.getParameter("config_id")!=null?Integer.parseInt(request.getParameter("id")):1;
		configAttrMap=configAttrBiz.findAllByConfigId(id);
		model.put("configAttrInfo", configAttrMap);
		return "config/config_user";
	}
	@RequestMapping("o_save")
	public String setupConfigUser(HttpServletRequest request,Map<String, Object> model){
		List<ConfigAttr> configAttrInfo = new ArrayList<ConfigAttr>();
		
		ConfigAttr memberOnConfig = new ConfigAttr();
		memberOnConfig.setAttrName(ConfigAttrBiz.MEMBER_ON);
		memberOnConfig.setAttrValue(request.getParameter(ConfigAttrBiz.MEMBER_ON));
		memberOnConfig.setConfigId(Integer.parseInt(request.getParameter(ConfigAttrBiz.CONFIG_ID)));
		configAttrInfo.add(memberOnConfig);
		
		ConfigAttr passWordMinLenConfig = new ConfigAttr();
		passWordMinLenConfig.setAttrName(ConfigAttrBiz.PASSWORD_MIN_LEN);
		passWordMinLenConfig.setAttrValue(request.getParameter(ConfigAttrBiz.PASSWORD_MIN_LEN));
		passWordMinLenConfig.setConfigId(Integer.parseInt(request.getParameter(ConfigAttrBiz.CONFIG_ID)));
		configAttrInfo.add(passWordMinLenConfig);
		
		ConfigAttr registerOnConfig = new ConfigAttr();
		registerOnConfig.setAttrName(ConfigAttrBiz.REGISTER_ON);
		registerOnConfig.setAttrValue(request.getParameter(ConfigAttrBiz.REGISTER_ON));
		registerOnConfig.setConfigId(Integer.parseInt(request.getParameter(ConfigAttrBiz.CONFIG_ID)));
		configAttrInfo.add(registerOnConfig);
		
		ConfigAttr userNameMinLenConfig = new ConfigAttr();
		userNameMinLenConfig.setAttrName(ConfigAttrBiz.USERNAME_MIN_LEN);
		userNameMinLenConfig.setAttrValue(request.getParameter(ConfigAttrBiz.USERNAME_MIN_LEN));
		userNameMinLenConfig.setConfigId(Integer.parseInt(request.getParameter(ConfigAttrBiz.CONFIG_ID)));
		configAttrInfo.add(userNameMinLenConfig);
		
		ConfigAttr usernameReservedConfig = new ConfigAttr();
		usernameReservedConfig.setAttrName(ConfigAttrBiz.USERNAME_RESERVED);
		usernameReservedConfig.setAttrValue(request.getParameter(ConfigAttrBiz.USERNAME_RESERVED));
		usernameReservedConfig.setConfigId(Integer.parseInt(request.getParameter(ConfigAttrBiz.CONFIG_ID)));
		configAttrInfo.add(usernameReservedConfig);
		
		boolean flag = configAttrBiz.saveConfigAttr(configAttrInfo);
		configAttrMap=configAttrBiz.findAllByConfigId(Integer.parseInt(request.getParameter(ConfigAttrBiz.CONFIG_ID)));
		model.put("configAttrInfo", configAttrMap);
		model.put("status",flag);
		return "config/config_user";
	}
}
