package com.daodway.dwcms.web.webservice.rop;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.junit.Test;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.doadway.dwcms.web.webservice.rop.request.LogonRequest;
import com.doadway.dwcms.web.webservice.rop.response.LogonResponse;
import com.doadway.dwcms.web.webservice.rop.response.LogoutResponse;
import com.rop.client.ClientRequest;
import com.rop.client.CompositeResponse;
import com.rop.client.DefaultRopClient;
import com.rop.client.RopClient;
import com.rop.utils.RopUtils;

public class UserServiceClient {
	 public static final String SERVER_URL = "http://localhost:8080/dwcms/router";   
	    public static final String APP_KEY = "00001";  
	    public static final String APP_SECRET = "abcdeabcdeabcdeabcdeabcde";  
	    private RopClient ropClient =  new DefaultRopClient(SERVER_URL, APP_KEY, APP_SECRET);  
	  
//	    @Test  
	    public void createSession() {  
	  
	        //②构造请求对象  
	        LogonRequest ropRequest = new LogonRequest();    
	        ropRequest.setUserName("zhoutanxin");  
	        ropRequest.setPassword("fdsafds");  
	        //③对服务发起调用并获取响应结果  
	        ClientRequest cRequest=ropClient.buildClientRequest();
	        CompositeResponse<?> response = cRequest  
	                       .get(ropRequest, LogonResponse.class, "user.logon", "1.0");  
	  
	        assertNotNull(response);  
	        assertTrue(response.isSuccessful());  
	        assertNotNull(response.getSuccessResponse());  
	        assertTrue(response.getSuccessResponse() instanceof LogonResponse);  
	        assertEquals(((LogonResponse) response.getSuccessResponse()).getSessionId(),   
	                     "sessionId");  
	    }  
//	    @Test  
	    public void logout() {  
	    	
	        LogonRequest ropRequest = new LogonRequest();    
	        ropRequest.setUserName("zhoutanxin");  
	        ropRequest.setPassword("fdsafds");  
	        
	    	//③对服务发起调用并获取响应结果  
	        ropClient.setSessionId("sessionId");
	    	ClientRequest cRequest=ropClient.buildClientRequest();
	    	CompositeResponse<?> response = cRequest.get(ropRequest, LogonResponse.class, "user.logon", "1.0"); 
	    	cRequest.get(ropRequest,LogoutResponse.class, "user.logout", "1.0");  
	    	
	    	assertNotNull(response);  
	    	assertTrue(response.isSuccessful());  
	 
	    }  
	    @Test  
	    public void restRequest() {  
//	    	createSession();
	        RestTemplate restTemplate = new RestTemplate();  
	        MultiValueMap<String, String> form = new LinkedMultiValueMap<String, String>();  

	        //指定服务名  
	        form.add("method", "user.logon");
	        form.add("appKey", APP_KEY);
	       //<--指定客户端应用的key,我们在rop.appSecret.properties  
	       //中预定义了两个appKey,服务端可通过实现AppSecretManager  
	       //定义自己的appKey管理策略。  
	        form.add("v", "1.0");  
	        form.add("sessionId", "mockSessionId");//真实系统时，必须是真正的sessionId.  
	        form.add("locale", "zh_CN"); 
	        form.add("format", "xml");  
	        /* 所有业务层需要签名的变量都要添加到sign方法之前,
	         * 不需要签名的变量放sign后面或者用sign方法排除掉
	         * 否则报 无效签名错误*/
	        form.add("userName", "tomson");  
	        form.add("password", "123456");  
	        //对请求参数进行签名，对于"00001" appKey的密钥是"abcdeabcdeabcdeabcdeabcde"  
//	        String sign = RopUtils.sign(form.toSingleValueMap(),new ArrayList<String>(form.keySet()),APP_SECRET);
	        String sign = RopUtils.sign(form.toSingleValueMap(),APP_SECRET);
	        form.add("sign", sign);   
	        

	        //发送请求，调用服务  
	        String response = restTemplate.postForObject("http://localhost:8080/dwcms/router", form, String.class);  
	        System.out.println("response:\n" + response);  
	    	
	    }

}
