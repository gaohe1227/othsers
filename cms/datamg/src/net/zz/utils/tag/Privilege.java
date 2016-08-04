package net.zz.utils.tag;

import java.io.Writer;
import java.util.Map;

import javax.servlet.http.HttpSession;

import net.zz.utils.StringUtils;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.components.Component;
import org.apache.struts2.views.annotations.StrutsTag;
import org.apache.struts2.views.annotations.StrutsTagAttribute;

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
@StrutsTag(name="privilege",tldTagClass="net.zz.utils.tag.PrivilegeTag", description = "privilege tag")
public class Privilege extends Component {
	
	public static final String ANSWER = "struts.if.answer";
	
	private Boolean answer;

	/**
	 * 
	 * Constructs a <code>PrivilegeTag</code>
	 * 
	 * @param stack
	 * @since datamg 1.0
	 */
	public Privilege(ValueStack stack) {
		super(stack);
	}

	/**
	 * 权限路径
	 */
	private String privilege;

	@SuppressWarnings("unchecked")
	@Override
	public boolean start(Writer writer) {
		if (!StringUtils.isEmpty(this.privilege)) {
			HttpSession session = ServletActionContext.getRequest()
					.getSession();
			Integer type = Integer.parseInt(session.getAttribute("type")
					.toString());
			if (null != type && 0 == type) { // 超级管理员无视权限控制
				answer = true;
			} else {
				Map<String, String> privileges = (Map<String, String>) session
						.getAttribute("privileges");
				if (null != privileges.get(this.privilege)) { // 验证权限控制存在
					answer=true;
				}
			}
		}
        if (answer == null) {
            answer = Boolean.FALSE;
        }
        stack.getContext().put(ANSWER, answer);
        return answer.booleanValue();
	}
	
	

	@Override
	public boolean end(Writer writer, String body) {
		stack.getContext().put(ANSWER, answer);
        return super.end(writer, body);
	}
	
	@StrutsTagAttribute(description="Expression to determine if body of tag is to be displayed", type="String", required=true)
	public void setPrivilege(String privilege) {
		this.privilege = privilege;
	}
}
