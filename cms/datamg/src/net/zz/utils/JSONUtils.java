package net.zz.utils;

import java.util.Arrays;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;

/**
 * 
 * <b><code></code></b>
 * <p/>
 * Comment here
 * <p/>
 * <b>Creation Time:</b> Aug 7, 2012
 * 
 * @author ZhangZhen
 * @version 1.0
 * 
 * @since datamg 1.0
 */
public class JSONUtils {
	private static final Log log = LogFactory.getLog(JSONUtils.class);

	/**
	 * 将对象转换成JSON字符串，并响应回前台
	 * 
	 * @param object
	 * @param includesProperties
	 *            需要转换的属性
	 * @param excludesProperties
	 *            不需要转换的属性
	 */
	public static String ObjectToJsonByFilter(Object object, String[] includesProperties,
			String[] excludesProperties) {
		FastjsonFilter filter = new FastjsonFilter();// excludes优先于includes
		if (excludesProperties != null && excludesProperties.length > 0) {
			filter.getExcludes().addAll(
					Arrays.<String> asList(excludesProperties));
		}
		if (includesProperties != null && includesProperties.length > 0) {
			filter.getIncludes().addAll(
					Arrays.<String> asList(includesProperties));
		}
		log.debug("对象转JSON：要排除的属性[" + excludesProperties + "]要包含的属性["
				+ includesProperties + "]");
		// 使用SerializerFeature.WriteDateUseDateFormat特性来序列化日期格式的类型为yyyy-MM-dd
		// hh24:mi:ss
		// 使用SerializerFeature.DisableCircularReferenceDetect特性关闭引用检测和生成
		String json = JSON.toJSONString(object, filter,
				SerializerFeature.WriteDateUseDateFormat,
				SerializerFeature.DisableCircularReferenceDetect);
		log.debug("json="+json);
		return json;
	}
	
	/**
	 * 转换类里面所有属性 不包含Set集合
	 * @param object
	 * @return
	 */
	public static String ObjectToJson(Object object){
		return ObjectToJsonByFilter(object,null,null);
	}
	
	/**
	 * 转换类里面所有属性 不包含Set集合
	 * @param object
	 * @param includesProperties 必须包含的属性
	 * @return
	 */
	public static String ObjectToJsonByIncludesProperties(Object object,String[] includesProperties){
		return ObjectToJsonByFilter(object,includesProperties,null);
	}
	
	/**
	 * 转换类里面所有属性 不包含Set集合
	 * @param object
	 * @param includesProperties 必须包含的属性
	 * @return
	 */
	public static String ObjectToJsonByExcludesProperties(Object object,String[] excludesProperties){
		return ObjectToJsonByFilter(object,null,excludesProperties);
	}
}
