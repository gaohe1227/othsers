package com.doadway.dwcms.core.config.biz;

import java.util.Map;

public interface DoConfigBiz {
	
	public static String EMAIL_ENCODING ="email_encoding";
	public static String EMAIL_HOST ="email_host";
	public static String EMAIL_PASSWORD ="email_password";
	public static String EMAIL_PERSONAL ="email_personal";
	public static String EMAIL_PORT ="email_port";
	public static String EMAIL_USERNAME ="email_username";
	public static String LOGIN_ERROR_INTERVAL ="login_error_interval";
	public static String LOGIN_ERROR_TIMES ="login_error_times";
	public static String MESSAGE_SUBJECT ="message_subject";
	public static String MESSAGE_TEXT ="message_text";
	
	public Map<String,Object> findAllDoConfig();
	public boolean saveDoConfig(Map<String,Object> doConfig);
}
