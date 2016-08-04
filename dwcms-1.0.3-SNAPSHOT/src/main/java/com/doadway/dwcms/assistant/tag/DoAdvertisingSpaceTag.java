package com.doadway.dwcms.assistant.tag;

import java.io.IOException;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.doadway.dwcms.assistant.biz.AdvertisingSpaceBiz;
import com.doadway.dwcms.assistant.pojo.AdvertisingSpace;

public class DoAdvertisingSpaceTag  extends TagSupport {
	private static final long serialVersionUID = -6574630204504779780L;
	AdvertisingSpaceBiz advertisingSpaceBiz;
	ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:/config/dwcms-servlet-admin.xml");
	{
		advertisingSpaceBiz=(AdvertisingSpaceBiz)ac.getBean("advertisingSpaceBizImpl");
	}	
	@Override
	public int doEndTag() throws JspException {
		return EVAL_PAGE;
	}

	@Override
	public int doStartTag() throws JspException {
		JspWriter out = this.pageContext.getOut();
		List<AdvertisingSpace> advertisingSpaces = advertisingSpaceBiz.findAllAdvertisingSpace();
		try {
			out.println("<select id=\"adspaceId\" name=\"adspaceId\">");
			for(AdvertisingSpace advertisingSpace:advertisingSpaces){
				out.println("<option value=\""+advertisingSpace.getAdspaceId()+"\">"+advertisingSpace.getAdName()+"</option>");
			}
			out.println("</select>");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return SKIP_BODY;
	}

}
