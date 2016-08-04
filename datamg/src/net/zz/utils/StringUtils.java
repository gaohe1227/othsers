package net.zz.utils;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.security.MessageDigest;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * 
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
public class StringUtils {
	private static final Log LOG = LogFactory.getLog(StringUtils.class);
	
	/**
	 * 将字符串转为UTF-8编码
	 * @param str
	 * @return
	 */
	public static String encoder(String str) {
		try {
			return URLEncoder.encode(str, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return null;
		}
	}
	/**
	 * 将字符串转为指定编码
	 * @param str
	 * @param charSet
	 * @return
	 */
	public static String encoder(String str, String charSet) {
		try {
			return URLEncoder.encode(str, charSet);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * 日期转换为字符串
	 * comment here
	 * @param date
	 * @param pattern
	 * @return
	 * @since datamg 1.0
	 */
	public static String dateToString(Date date,String pattern){
		if(null!=date){
			SimpleDateFormat sdf = new SimpleDateFormat(pattern);
			return sdf.format(date);
		}
		return null;
	}
	
	/**
	 * 获取UUID
	 * @return
	 */
	public static String getUUID() {
		return UUID.randomUUID().toString().replace("-", "");
	}
	
	/**
	 * 指定加密方式对密码加密
	 * @param password
	 * @param algorithm
	 * @return
	 */
	public static String encodePassword(String password, String algorithm) {
		byte[] unencodedPassword = password.getBytes();
		MessageDigest md = null;
		try {
			// first create an instance, given the provider
			md = MessageDigest.getInstance(algorithm);
		} catch (Exception e) {
			LOG.error("Exception: " + e);
			return password;
		}
		md.reset();
		// call the update method one or more times
		// (useful when you don't know the size of your data, eg. stream)
		md.update(unencodedPassword);
		// now calculate the hash
		byte[] encodedPassword = md.digest();
		StringBuffer buf = new StringBuffer();
		for (int i = 0; i < encodedPassword.length; i++) {
			if ((encodedPassword[i] & 0xff) < 0x10) {
				buf.append("0");
			}
			buf.append(Long.toString(encodedPassword[i] & 0xff, 16));
		}
		return buf.toString();
	}

	/**
	 * 获取系统当前时间作为字符串
	 * @return
	 */
	public static String getTimeString() {
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmssSSSS");
		return format.format(new Timestamp(System.currentTimeMillis()));
	}
	
	/**
	 * 判断一个字符串是否NULL或者是空字符串
	 * @param str
	 * @return
	 */
	public static boolean isEmpty(String str) {
		if (str == null || "".equals(str) || "null".equals(str)) 
			return true;
		return false;
	}
}
