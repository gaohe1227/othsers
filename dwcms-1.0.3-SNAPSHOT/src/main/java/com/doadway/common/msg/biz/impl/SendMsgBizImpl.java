/**
 * Copyright (c) 2014-2016 xinnet.com All Rights Reserved
 * File:SendMsgBizImpl.java Project:xinnet_cloud_new
 * Creator:huangning@xinnet.com
 * Date:2014-8-28上午10:24:09
 */
package com.doadway.common.msg.biz.impl;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.doadway.common.msg.biz.SendMsgBiz;
import com.doadway.common.msg.box.HttpWebClient;
import com.doadway.common.msg.box.InterfaceProtocolConstants;
import com.doadway.common.msg.box.XmlData;
import com.doadway.common.util.CodeUtil;

/**
 * @author huangning@xinnet.com
 * @version Revision: 1.0 
 * @since 2014-8-28上午10:24:09
 */
@Service
public class SendMsgBizImpl  implements SendMsgBiz {
	protected transient final Log log = LogFactory.getLog(getClass());
	/* (non-Javadoc)
	 * @see cn.ce.msg.biz.SendMsgBiz#sendMsgVerifyCode(java.lang.String, java.lang.String)
	 */
	/**
	 * 
	 * @Description 给手机发送验证码，成功返回200状态码
	 * @param @param mobileNumber
	 * @param @param contentStr
	 * @param @return 设定文件 
	 * @return  
	 * @author ZhangZhongde
	 * @date Mar 25, 2014 9:35:26 AM
	 * @throws
	 */
	public int sendMsgVerifyCode(String mobileNumber, String contentStr) {
		HttpWebClient httpWebClient = new HttpWebClient();
		XmlData xmlData = httpWebClient.getServerResponse(httpWebClient.getMsgUrl(), InterfaceProtocolConstants.HTTP_POST, mobileNumber, contentStr);
		return xmlData.getStatusCode();
	}

	/* (non-Javadoc)
	 * @see cn.ce.msg.biz.SendMsgBiz#setVerifyCode(java.lang.String, java.lang.String, java.lang.String)
	 */
	/**
	 * 
	 * @Description 发送手机验证码
	 * @param @param mobileNumber
	 * @param @param contentStr
	 * @param @param verifyCode 设定文件 
	 * @return String 返回类型 
	 * @author ZhangZhongde
	 * @date Mar 25, 2014 10:03:18 AM
	 * @throws
	 */
	public String setVerifyCode(String mobileNumber, String contentStr) {
		String flag = "error";
		try{
			int status = this.sendMsgVerifyCode(mobileNumber, contentStr);
			log.info("msg send status :"+status);
			if(status == 200){
				//this.memcachedService.setVerifyCode(mobileNumber, verifyCode);
				flag = "success";
			}else{
				flag = "error";
			}
		}catch(Exception e){
			log.info("msg send exception :"+e.getStackTrace());
			flag = "error";
		}
		log.info("msg send flag :"+flag);
		return flag;
	}
	public static void main(String args[]){
		SendMsgBizImpl sendMsg = new SendMsgBizImpl();
		sendMsg.sendMsgVerifyCode("13683027377", "Hi,your new password is:"+CodeUtil.getNewPassword());
	}
}
