package com.doadway.dwcms.maintain.tag;

import java.io.IOException;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.doadway.dwcms.maintain.dao.TopicMapper;
import com.doadway.dwcms.maintain.pojo.Topic;
import com.doadway.dwcms.maintain.pojo.TopicExample;

public class DoTopicTag extends TagSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6928132154735411533L;
	TopicMapper topicDAO;
	ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:/config/dwcms-servlet-admin.xml");
	{
		topicDAO=(TopicMapper)ac.getBean("topicMapper");
	}
	@Override
	public int doEndTag() throws JspException {
		return super.doEndTag();
	}
	@Override
	public int doStartTag() throws JspException {
		JspWriter out = this.pageContext.getOut();
		TopicExample example=new TopicExample();
		TopicExample.Criteria topicCrit=example.createCriteria();
		topicCrit.andIsRecommendEqualTo(true);
		List<Topic> topicList = topicDAO.selectByExample(example);
		try {
			for(Topic t:topicList){
				out.println("<label><input value=\""+t.getTopicId()+"\" name=\"topicId\" type=\"checkbox\">"+t.getTopicName()+"</label>");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return super.doStartTag();
	}
	
	
}
