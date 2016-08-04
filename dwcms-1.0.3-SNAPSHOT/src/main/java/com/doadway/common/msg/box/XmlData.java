package com.doadway.common.msg.box;

import java.io.Serializable;
/**
 * 
 * @ClassName XmlData 
 * @Description xml返回信息，进行状态码和xml信息组装类
 * @author ZhangZhongde
 * @date Oct 8, 2013 10:30:20 AM
 * @mail zhangzhongde@xinnet.com
 */
public class XmlData implements Serializable {

	private static final long serialVersionUID = 1L;
	private int statusCode;
	private String xmlInfo;
	/**
	 * 
	 * @Description 获取状态码
	 * @return int 返回状态码
	 * @author ZhangZhongde
	 * @date Oct 8, 2013 10:31:04 AM
	 * @throws
	 */
	public int getStatusCode() {
		return statusCode;
	}
	/**
	 * 
	 * @Description 状态码信息
	 * @author ZhangZhongde
	 * @date Oct 8, 2013 10:31:33 AM
	 * @throws
	 */
	public void setStatusCode(int statusCode) {
		this.statusCode = statusCode;
	}
	/**
	 * 
	 * @Description 获得xml信息
	 * @return String 返回xml信息
	 * @author ZhangZhongde
	 * @date Oct 8, 2013 10:32:15 AM
	 * @throws
	 */
	public String getXmlInfo() {
		return xmlInfo;
	}
	/**
	 * 
	 * @Description xml信息
	 * @author ZhangZhongde
	 * @date Oct 8, 2013 10:32:37 AM
	 * @throws
	 */
	public void setXmlInfo(String xmlInfo) {
		this.xmlInfo = xmlInfo;
	}

}
