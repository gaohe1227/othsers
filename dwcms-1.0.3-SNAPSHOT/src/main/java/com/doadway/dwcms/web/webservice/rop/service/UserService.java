package com.doadway.dwcms.web.webservice.rop.service;


import com.doadway.dwcms.web.webservice.rop.request.LogonRequest;
import com.doadway.dwcms.web.webservice.rop.response.LogonResponse;
import com.doadway.dwcms.web.webservice.rop.response.LogoutResponse;
import com.rop.RopRequest;
import com.rop.annotation.IgnoreSignType;
import com.rop.annotation.NeedInSessionType;
import com.rop.annotation.ServiceMethod;
import com.rop.annotation.ServiceMethodBean;
import com.rop.session.SimpleSession;
@ServiceMethodBean
public class UserService {
	@ServiceMethod(method = "user.logon", version = "1.0", needInSession = NeedInSessionType.NO, ignoreSign = IgnoreSignType.NO)  
	public Object logon(LogonRequest request) {  
	    SimpleSession session = new SimpleSession();  
	    session.setAttribute("userName",request.getUserName());  
	    request.getRopRequestContext().addSession("mockSessionId", session);  
	  
	    LogonResponse logonResponse = new LogonResponse();  
	    logonResponse.setSessionId("sessionId");  
	    return logonResponse;  
	}  
	@ServiceMethod(method = "user.logout", version = "1.0")
	public Object logout(RopRequest request){
		request.getRopRequestContext().removeSession();
		LogoutResponse response = new LogoutResponse();
		response.setSuccessful(true);
		return response;
	}
}
