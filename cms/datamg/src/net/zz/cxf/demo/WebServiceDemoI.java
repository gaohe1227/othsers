package net.zz.cxf.demo;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;

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
@WebService
public interface WebServiceDemoI {

	@WebMethod
	public String helloWs(@WebParam(name = "userName") String name);

}
