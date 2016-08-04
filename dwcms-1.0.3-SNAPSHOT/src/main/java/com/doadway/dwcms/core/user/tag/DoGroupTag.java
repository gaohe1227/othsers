package com.doadway.dwcms.core.user.tag;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.doadway.dwcms.core.user.dao.GroupMapper;
import com.doadway.dwcms.core.user.pojo.Group;
public class DoGroupTag extends TagSupport{
	/**
	* @Fields serialVersionUID : TODO
	*/ 
	private static final long serialVersionUID = 2341457819577907336L;
	/*
	 * 不能通过注解生成DAO.可以通过ApplicationContext加载
	 * */
	GroupMapper groupDAO;
	ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:/config/dwcms-servlet-admin.xml");
	{
		groupDAO=(GroupMapper)ac.getBean("groupMapper");
	}
	private Integer groupId=-1;
	
	@Override
	public int doEndTag() throws JspException {
		// TODO Auto-generated method stub
		return EVAL_PAGE;
	}

	@Override
	public int doStartTag() throws JspException {
		// TODO Auto-generated method stub
		JspWriter out = this.pageContext.getOut();
		
		try {
			if(groupId!=-1){
					Group group = groupDAO.selectByPrimaryKey(groupId);
					out.println(group.getGroupName());
			}else{
				out.println("不存在的用户组!");
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SKIP_BODY;
	}

	@Override
	public void release() {
		// TODO Auto-generated method stub
		super.release();
	}

	public Integer getGroupId() {
		return groupId;
	}

	public void setGroupId(Integer groupId) {
		this.groupId = groupId;
	}

	
	

}
