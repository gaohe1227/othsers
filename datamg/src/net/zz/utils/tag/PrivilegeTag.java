package net.zz.utils.tag;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.components.Component;
import org.apache.struts2.views.jsp.ComponentTagSupport;

import com.opensymphony.xwork2.util.ValueStack;

/**
 * 权限控制标签 <b><code></code></b>
 * <p/>
 * Comment here
 * <p/>
 * <b>Creation Time:</b> 2014年5月20日
 * 
 * @author ZhangZhen
 * @version 1.0
 * 
 * @since datamg 1.0
 */
@SuppressWarnings("serial")
public class PrivilegeTag extends ComponentTagSupport {
	
	
	private String privilege;

	@Override
	public Component getBean(ValueStack stack, HttpServletRequest arg1,
			HttpServletResponse arg2) {
		return new Privilege(stack);
	}
	
	 protected void populateParams() {
	        ((Privilege) getComponent()).setPrivilege(this.privilege);
	   }

	public void setPrivilege(String privilege) {
		this.privilege = privilege;
	}
}
