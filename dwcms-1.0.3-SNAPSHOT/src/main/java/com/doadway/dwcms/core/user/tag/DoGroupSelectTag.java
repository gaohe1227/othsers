package com.doadway.dwcms.core.user.tag;

import java.io.IOException;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.doadway.dwcms.core.user.dao.GroupMapper;
import com.doadway.dwcms.core.user.pojo.Group;
import com.doadway.dwcms.core.user.pojo.GroupExample;
import com.doadway.dwcms.core.user.pojo.GroupExample.Criteria;
public class DoGroupSelectTag extends TagSupport{
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
	private static String SELECT = "SELECT";
	private static String GROUPCONTRI = "GROUPCONTRI";
	private static String GROUPVIEW = "GROUPVIEW";
	
	private String showType=DoGroupSelectTag.SELECT;
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
//			Group group = groupDAO.selectByPrimaryKey(groupId);
			GroupExample example = new GroupExample();
			Criteria cri = example.createCriteria();
			cri.andGroupIdIsNotNull();
			List<Group> groups = groupDAO.selectByExample(example );
			if(this.showType.equals(DoGroupSelectTag.SELECT)){
				out.println("<select id=\"groupId\" name=\"groupId\">");
				for(Group group:groups){
					out.println("<option value=\""+group.getGroupId()+"\">"+group.getGroupName()+"</option>");
				}
				out.println("</select>");
			}else if(this.showType.equals(DoGroupSelectTag.GROUPVIEW)){
				for(Group group:groups){
					out.println("<label><input value=\""+group.getGroupId()+"\" name=\"viewGroupIds\" type=\"checkbox\">"+group.getGroupName()+"</label>");
				}
			}else if(this.showType.equals(DoGroupSelectTag.GROUPCONTRI)){
				for(Group group:groups){
					out.println("<label><input value=\""+group.getGroupId()+"\" name=\"groupContriIds\" type=\"checkbox\">"+group.getGroupName()+"</label>");
				}				
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

	public String getShowType() {
		return showType;
	}

	public void setShowType(String showType) {
		this.showType = showType;
	}

	
	

}
