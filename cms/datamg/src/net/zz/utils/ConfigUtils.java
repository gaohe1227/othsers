package net.zz.utils;

import java.util.ResourceBundle;

/**
 * 配置文件读取类
 * <b><code></code></b>
 * <p/>
 * Comment here
 * <p/>
 * <b>Creation Time:</b> 2014年5月11日
 * @author ZhangZhen
 * @version 1.0
 *
 * @since datamg 1.0
 */
public class ConfigUtils {
	
	private static final ResourceBundle bundle = java.util.ResourceBundle.getBundle("config");
	
	/**
	 * 获取项目配置文件的值
	 * comment here
	 * @param key
	 * @return
	 * @since datamg 1.0
	 */
	public static String getConfigValue(String key){
		return bundle.getString(key);
	}
}
