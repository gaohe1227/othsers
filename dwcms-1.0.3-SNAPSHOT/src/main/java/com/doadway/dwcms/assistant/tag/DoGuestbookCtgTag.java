package com.doadway.dwcms.assistant.tag;

import java.io.IOException;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.doadway.dwcms.assistant.biz.GuestbookCtgBiz;
import com.doadway.dwcms.assistant.pojo.GuestbookCtg;

public class DoGuestbookCtgTag  extends TagSupport {
	private static final long serialVersionUID = -6574630204504779780L;
	GuestbookCtgBiz guestbookCtgBiz;
	ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:/config/dwcms-servlet-admin.xml");
	{
		guestbookCtgBiz=(GuestbookCtgBiz)ac.getBean("guestbookCtgBizImpl");
	}	
	@Override
	public int doEndTag() throws JspException {
		return EVAL_PAGE;
	}

	@Override
	public int doStartTag() throws JspException {
		JspWriter out = this.pageContext.getOut();
		List<GuestbookCtg> guestbookCtgs = guestbookCtgBiz.findAllGuestbookCtg();
		try {
			out.println("<select id=\"guestbookctgId\" name=\"guestbookctgId\">");
			for(GuestbookCtg guestbookCtg:guestbookCtgs){
				out.println("<option value=\""+guestbookCtg.getGuestbookctgId()+"\">"+guestbookCtg.getCtgName()+"</option>");
			}
			out.println("</select>");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return SKIP_BODY;
	}

}
