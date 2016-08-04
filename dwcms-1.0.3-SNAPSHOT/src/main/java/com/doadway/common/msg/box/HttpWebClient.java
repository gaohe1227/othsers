package com.doadway.common.msg.box;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;


import org.apache.commons.codec.binary.Base64;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.cxf.common.util.Base64Exception;
import org.apache.cxf.common.util.Base64Utility;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpDelete;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpPut;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.dom4j.Document;

import com.doadway.common.util.XmlToolBox;
import com.doadway.common.util.XmlUtils;

/**
 * 
 * @ClassName HttpWebClient 
 * @Description HttpWebClient客户端操作类
 * @author ZhangZhongde
 * @date Oct 8, 2013 11:35:10 AM
 * @mail zhangzhongde@xinnet.com
 */
public class HttpWebClient {
	protected transient final Log log = LogFactory.getLog(getClass());
	private XmlUtils xmlUtils;
	private XmlToolBox xmlToolBox;
	/**
	 * 
	 * @Description 获取xml信息
	 * @param httpUrl
	 * @param interfaceProtocol
	 * @return XmlData 返回xml数据对象 
	 * @author ZhangZhongde
	 * @date Oct 8, 2013 11:35:51 AM
	 * @throws
	 */
	public XmlData getServerResponse(String httpUrl,String interfaceProtocol,String mobileNumber,String contentStr) {
		XmlData xmlData = new XmlData();
		try {
			//
			HttpResponse response = this.response(httpUrl, interfaceProtocol, mobileNumber, contentStr);
			// response statusCode
			int statusCode = response.getStatusLine().getStatusCode();
			// response entity
			HttpEntity entity = response.getEntity();
			//
			StringBuffer sb = new StringBuffer();
			if (entity != null) {
				BufferedReader bf = new BufferedReader(new InputStreamReader(
						entity.getContent(),"utf-8"));
				String str = null;
				while ((str = bf.readLine()) != null) {
					sb.append(str);
				}
			}
			//
			xmlData.setStatusCode(statusCode);
			log.info("formatXmlInfo:"+sb.toString());;
			Document doc = XmlUtils.xmlString2Doc(sb.toString());
			String xmlInfo = XmlUtils.doc2XmlString(doc);
			//xmlToolBox.setDoc(doc);
			//xmlToolBox.
			String formatXmlInfo = XmlUtils.formatXml(sb.toString());
			log.info("formatXmlInfo:"+formatXmlInfo);
			xmlData.setXmlInfo(formatXmlInfo);
			
		} catch (Exception e) {
			xmlData.setStatusCode(0);
			xmlData.setXmlInfo("");
		}
		return xmlData;
	}
	
	/**
	 * 
	 * @Description 获取返回报文
	 * @param httpUrl
	 * @param interfaceProtocol
	 * @return HttpResponse 返回response对象 
	 * @author ZhangZhongde
	 * @date Oct 8, 2013 11:36:20 AM
	 * @throws
	 */
	public HttpResponse response(String httpUrl,String interfaceProtocol,String mobileNumber,String contentStr) throws Exception{
		HttpGet httpGet = null;
		HttpPost httpPost = null;
		HttpPut httpPut = null;
		HttpDelete httpDelete = null;
		if(InterfaceProtocolConstants.HTTP_GET.equals(interfaceProtocol)){
			httpGet = new HttpGet(httpUrl);
		}else if(InterfaceProtocolConstants.HTTP_POST.equals(interfaceProtocol)){
			httpPost = new HttpPost(httpUrl);
		}else if(InterfaceProtocolConstants.HTTP_PUT.equals(interfaceProtocol)){
			httpPut = new HttpPut(httpUrl);
		}else if(InterfaceProtocolConstants.HTTP_DELETE.equals(interfaceProtocol)){
			httpDelete = new HttpDelete(httpUrl);
		}
		//获得用户验证字符串
		byte[] totalStr = this.authUserStr();
		log.info("base64:"+Base64.class.getProtectionDomain().getCodeSource().getLocation());
		log.info("测试字节信息："+totalStr);
		String authorizationHeader = "Basic "
				+ Base64.encodeBase64String(totalStr);
		log.info("authorizationHeader:"+authorizationHeader);
		HttpClient httpClient = new DefaultHttpClient();
		
		//
		HttpResponse response = null;
		
		if(InterfaceProtocolConstants.HTTP_GET.equals(interfaceProtocol)){
			httpGet.addHeader("Authorization", authorizationHeader);
			response = httpClient.execute(httpGet);
		}else if(InterfaceProtocolConstants.HTTP_POST.equals(interfaceProtocol)){
			httpPost.addHeader("Authorization", authorizationHeader);
			//
			List<NameValuePair> params = new ArrayList<NameValuePair>();

			params.add(new BasicNameValuePair("content", contentStr));
			params.add(new BasicNameValuePair("phone", mobileNumber));

			httpPost.setEntity(new UrlEncodedFormEntity(params, "UTF-8"));
			//
			response = httpClient.execute(httpPost);
		}else if(InterfaceProtocolConstants.HTTP_PUT.equals(interfaceProtocol)){
			httpPut.addHeader("Authorization", authorizationHeader);
			response = httpClient.execute(httpPut);
		}else if(InterfaceProtocolConstants.HTTP_DELETE.equals(interfaceProtocol)){
			httpDelete.addHeader("Authorization", authorizationHeader);
			response = httpClient.execute(httpDelete);
		}
		return response;
	}
	
	/**
	 * 
	 * @Description 返回entity对象
	 * @param @param httpUrl url路径
	 * @param @param interfaceProtocol 接口协议
	 * @param @return
	 * @param @throws Exception 设定文件 
	 * @return HttpEntity 返回类型 
	 * @author ZhangZhongde
	 * @date Oct 10, 2013 1:40:40 PM
	 * @throws
	 */
	public HttpEntity getEntity(String httpUrl,String interfaceProtocol,String mobileNumber,String contentStr)  throws Exception{
		HttpResponse response = this.response(httpUrl, interfaceProtocol,mobileNumber,contentStr);
		// response statusCode
		int statusCode = response.getStatusLine().getStatusCode();
		// response entity
		HttpEntity entity = response.getEntity();
		
		//
		return entity;
	}
	/**
	 * 
	 * @Description 获得用户验证字符串
	 * @param @return 设定文件 
	 * @return String 返回类型 
	 * @author ZhangZhongde
	 * @throws UnsupportedEncodingException 
	 * @date Nov 15, 2013 5:15:01 PM
	 * @throws
	 */
	public byte[] authUserStr() throws UnsupportedEncodingException{
		Properties prop = new Properties();  
		InputStream in = this.getClass().getResourceAsStream("/romoteInterface.properties");
		String defaultUserName = "";
		String defaultPassword = "";
		try {
			prop.load(in);
		    defaultUserName = new String(Base64Utility.decode(prop.getProperty("remote.defaultUserName")));
		    defaultPassword = new String(Base64Utility.decode(prop.getProperty("remote.defaultPassword")));
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Base64Exception base64Exception){
			base64Exception.printStackTrace();
		}
		
		
		String dot = ":";
		String totalStr = defaultUserName+dot+defaultPassword;
		log.info("userAuthStr:"+totalStr);
		return totalStr.getBytes("UTF8");
	}
	public XmlUtils getXmlUtils() {
		return xmlUtils;
	}
	public void setXmlUtils(XmlUtils xmlUtils) {
		this.xmlUtils = xmlUtils;
	}
	public XmlToolBox getXmlToolBox() {
		return xmlToolBox;
	}
	public void setXmlToolBox(XmlToolBox xmlToolBox) {
		this.xmlToolBox = xmlToolBox;
	}
	/**
	 * 
	 * @Description 加载配置文件测试
	 * @param  设定文件 
	 * @return void 返回类型 
	 * @author ZhangZhongde
	 * @date Nov 18, 2013 1:56:00 PM
	 * @throws
	 */
	public void testProperties(){
		Properties prop = new Properties();  
		InputStream in = this.getClass().getResourceAsStream("/romoteInterface.properties");
		String defaultUserName = "";
		String defaultPassword = "";
		try {
			prop.load(in);
			defaultUserName = new String(prop.getProperty("remote.defaultUserName"));
		    defaultPassword = new String(prop.getProperty("remote.defaultPassword"));
		
		    log.info("defaultUserName:"+defaultUserName);
		    log.info("defaultPassword:"+defaultPassword);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 
	 * @Description 获得短信url
	 * @param @return 设定文件 
	 * @return String 返回类型 
	 * @author ZhangZhongde
	 * @date Mar 25, 2014 9:25:08 AM
	 * @throws
	 */
	public String getMsgUrl(){
		Properties prop = new Properties();  
		InputStream in = this.getClass().getResourceAsStream("/romoteInterface.properties");
		String ip = "";
		String url = "";
		try {
			prop.load(in);
			ip = new String(prop.getProperty("remote.ip"));
		    url = new String(prop.getProperty("remote.url"));
		} catch (IOException e) {
			e.printStackTrace();
		}
		return ip+url;
	}
	/**
	 * 
	 * @Description 测试加载配置文件属性信息
	 * @param @param args 设定文件 
	 * @return void 返回类型 
	 * @author ZhangZhongde
	 * @date Nov 18, 2013 1:56:14 PM
	 * @throws
	 */
	public static void main(String args[]){
//		HttpWebClient httpWebClient = new HttpWebClient();
//		System.out.println(httpWebClient.getMsgUrl());
//		httpWebClient.testProperties();
//		XmlData xmlData = httpWebClient.getServerResponse(httpWebClient.getMsgUrl(), "post","15811169257","您好1111");
//		System.out.println(xmlData.getXmlInfo());
	}
}