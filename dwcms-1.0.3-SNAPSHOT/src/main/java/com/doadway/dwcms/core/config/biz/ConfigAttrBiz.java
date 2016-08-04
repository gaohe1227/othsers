package com.doadway.dwcms.core.config.biz;

import java.util.List;
import java.util.Map;

import com.doadway.dwcms.core.config.pojo.ConfigAttr;

public interface ConfigAttrBiz {
	public static String PASSWORD_MIN_LEN="password_min_len";
	public static String USERNAME_RESERVED="username_reserved";
	public static String REGISTER_ON="register_on";
	public static String MEMBER_ON="member_on";
	public static String USERNAME_MIN_LEN="username_min_len";
	public static String VERSION="version";
	public static String CONFIG_ID="config_id";
	
	public boolean saveConfigAttr(List<ConfigAttr> configAttrList);
	public Map<String,Object> findAllByConfigId(Integer configId);
}
