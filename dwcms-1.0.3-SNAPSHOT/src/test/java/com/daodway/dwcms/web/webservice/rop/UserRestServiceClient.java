package com.daodway.dwcms.web.webservice.rop;

import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.rop.utils.RopUtils;

public class UserRestServiceClient {
	public static void main(String[] args) {  
        RestTemplate restTemplate = new RestTemplate();  
        MultiValueMap<String, String> form = new LinkedMultiValueMap<String, String>();  

        //指定服务名  
        form.add("method", "user.logon");
        form.add("appKey", "00001");
       //<--指定客户端应用的key,我们在rop.appSecret.properties  
       //中预定义了两个appKey,服务端可通过实现AppSecretManager  
       //定义自己的appKey管理策略。  
        form.add("v", "1.0");  
        form.add("sessionId", "sessionId");//真实系统时，必须是真正的sessionId.  
        form.add("format", "json");  
        form.add("locale", "zh_CN");  
        /* 所有业务层需要签名的变量都要添加到sign方法之前,
         * 不需要签名的变量放sign后面或者用sign方法排除掉
         * 否则报 无效签名错误*/
        form.add("userName", "tomson");  
        form.add("password", "123456");  
        //对请求参数进行签名，对于"00001" appKey的密钥是"abcdeabcdeabcdeabcdeabcde"  
//        String sign = RopUtils.sign(form.toSingleValueMap(),new ArrayList<String>(form.keySet()),"abcdeabcdeabcdeabcdeabcde");
        String sign = RopUtils.sign(form.toSingleValueMap(),"abcdeabcdeabcdeabcdeabcde");
        form.add("sign", sign);  
  
  
        //发送请求，调用服务  
        String response = restTemplate.postForObject("http://localhost:8080/dwcms/router", form, String.class);  
        System.out.println("response:\n" + response);  
    }  
}
