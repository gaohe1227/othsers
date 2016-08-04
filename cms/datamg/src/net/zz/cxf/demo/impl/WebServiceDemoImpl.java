package net.zz.cxf.demo.impl;

import javax.jws.WebMethod;
import javax.jws.WebService;

import net.zz.cxf.demo.WebServiceDemoI;
import net.zz.utils.StringUtils;

/**
 * 
 * <b><code></code></b>
 * <p/>
 * Comment here
 * <p/>
 * <b>Creation Time:</b> 2014年5月31日
 * @author ZhangZhen
 * @version 1.0
 *
 * @since datamg 1.0
 */
@WebService(endpointInterface = "net.zz.cxf.demo.WebServiceDemoI", serviceName = "webServiceDemo")
public class WebServiceDemoImpl implements WebServiceDemoI {

	
	@WebMethod
	@Override
	public String helloWs(String name) {
		if (StringUtils.isEmpty(name)) {
			name = "ZhangZhen";
		}
		String str = "hello[" + name.trim() + "]WebService test ok!";
		System.out.println(str);
		return str;
	}
}
