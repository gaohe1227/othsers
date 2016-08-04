package com.doadway.dwcms.core.user.tag;

import java.io.IOException;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.doadway.dwcms.core.user.dao.RoleMapper;
import com.doadway.dwcms.core.user.pojo.Role;
import com.doadway.dwcms.core.user.pojo.RoleExample;
import com.doadway.dwcms.core.user.pojo.RoleExample.Criteria;
public class DoRoleTag extends TagSupport{
	/**
	* @Fields serialVersionUID : TODO
	*/ 
	private static final long serialVersionUID = 2341457819577907336L;
	/*
	 * 不能通过注解生成DAO.可以通过ApplicationContext加载
	 * */
	RoleMapper roleDAO;
	ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:/config/dwcms-servlet-admin.xml");
	{
		roleDAO=(RoleMapper)ac.getBean("roleMapper");
	}
	private Integer roleId=-1;
	private boolean isCheckbox = false;
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
			if(isCheckbox){
				RoleExample example=new RoleExample();
				Criteria cri = example.createCriteria();
				cri.andRoleIdIsNotNull();
				List<Role> roleList =roleDAO.selectByExample(example);
				for(Role role:roleList){
					out.println("<label><input value=\""+role.getRoleId()+"\" name=\"roleIds\" type=\"checkbox\">"+role.getRoleName()+"</label>");
				}
			}else{
				if(roleId!=-1){
					Role role = roleDAO.selectByPrimaryKey(roleId);
					out.println(role.getRoleName()+"&nbsp;");
				}else{
					out.println("不存在的用户组!");
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

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public boolean getIsCheckbox() {
		return isCheckbox;
	}

	public void setIsCheckbox(boolean isCheckbox) {
		this.isCheckbox = isCheckbox;
	}






	
	

}
