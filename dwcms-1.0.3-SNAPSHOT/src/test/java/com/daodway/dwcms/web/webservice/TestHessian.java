package com.daodway.dwcms.web.webservice;

import java.net.MalformedURLException;

import com.caucho.hessian.client.HessianProxyFactory;
import com.doadway.dwcms.web.webservice.hessian.HessianService;

public class TestHessian {

	public static void main(String[] args) throws MalformedURLException {
		  String url = "http://localhost:8080/dwcms/remote/hessianService";  
		  HessianProxyFactory factory = new HessianProxyFactory();  
		  HessianService hessianServer;
			hessianServer = (HessianService)factory.create(HessianService.class, url);
			String ret = hessianServer.sayHello("zhoutanxin");  
			System.out.println(ret);  
	}

}
