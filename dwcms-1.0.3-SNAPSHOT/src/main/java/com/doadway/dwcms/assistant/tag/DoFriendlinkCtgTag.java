package com.doadway.dwcms.assistant.tag;

import java.io.IOException;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.doadway.dwcms.assistant.biz.FriendlinkCtgBiz;
import com.doadway.dwcms.assistant.pojo.FriendlinkCtg;

public class DoFriendlinkCtgTag  extends TagSupport {
	private static final long serialVersionUID = -6574630204504779780L;
	FriendlinkCtgBiz friendlinkCtgBiz;
	ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:/config/dwcms-servlet-admin.xml");
	{
		friendlinkCtgBiz=(FriendlinkCtgBiz)ac.getBean("friendlinkCtgBizImpl");
	}	
	@Override
	public int doEndTag() throws JspException {
		return EVAL_PAGE;
	}

	@Override
	public int doStartTag() throws JspException {
		JspWriter out = this.pageContext.getOut();
		List<FriendlinkCtg> friendlinkCtgs = friendlinkCtgBiz.findAllFriendlinkCtg();
		try {
			out.println("<select id=\"queryCtgId\" name=\"queryCtgId\">");
			out.println("<option value=\"\" selected=\"selected\">--所有类别--</option>");
			for(FriendlinkCtg friendlinkCtg:friendlinkCtgs){
				out.println("<option value=\""+friendlinkCtg.getFriendlinkctgId()+"\">"+friendlinkCtg.getFriendlinkctgName()+"</option>");
			}
			out.println("</select>");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return SKIP_BODY;
	}

}
