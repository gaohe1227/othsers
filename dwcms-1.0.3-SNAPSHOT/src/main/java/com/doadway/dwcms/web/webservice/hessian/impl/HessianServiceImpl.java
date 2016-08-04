package com.doadway.dwcms.web.webservice.hessian.impl;

import com.doadway.dwcms.web.webservice.hessian.HessianService;
public class HessianServiceImpl implements HessianService {

	private static final long serialVersionUID = -6922475471566625967L;

	@Override
	public String sayHello(String username) {
		return "Hello, " + username;  
	}

}
