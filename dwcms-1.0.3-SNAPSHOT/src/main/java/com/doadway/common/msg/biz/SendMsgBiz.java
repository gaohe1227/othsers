/**
 * Copyright (c) 2014-2016 xinnet.com All Rights Reserved
 * File:SendMsgBiz.java Project:xinnet_cloud_new
 * Creator:huangning@xinnet.com
 * Date:2014-8-28上午10:20:07
 */
package com.doadway.common.msg.biz;

/**
 * @author huangning@xinnet.com
 * @version Revision:  1.0
 * @since 2014-8-28上午10:20:07
 */
public interface SendMsgBiz {

	/**
	 * 
	 * @param mobileNumber
	 * @param contentStr
	 * @return
	 */
	public int sendMsgVerifyCode(String mobileNumber,String contentStr);
	
	/**
	 * 
	 * @param mobileNumber
	 * @param contentStr
	 * @param verifyCode
	 * @return
	 */
	public String setVerifyCode(String mobileNumber, String contentStr);
}
