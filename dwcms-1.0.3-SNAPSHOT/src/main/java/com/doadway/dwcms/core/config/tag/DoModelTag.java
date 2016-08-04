package com.doadway.dwcms.core.config.tag;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.doadway.dwcms.core.config.biz.ModelBiz;
import com.doadway.dwcms.core.config.pojo.Model;

public class DoModelTag extends TagSupport {

	/**
	* @Fields serialVersionUID : TODO
	*/ 
	private static final long serialVersionUID = 2341457819577907336L;
	/*
	 * 不能通过注解生成DAO.可以通过ApplicationContext加载
	 * */
	ModelBiz modelBiz;
	ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:/config/dwcms-servlet-admin.xml");
	{
		modelBiz=(ModelBiz)ac.getBean("modelBizImpl");
	}
	private Integer modelId=-1;
	
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
			if(modelId!=-1){
					Model model = modelBiz.findModelById(modelId);
					out.println(model.getModelName());
			}else{
				out.println("不存在的模型!");
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

	public Integer getModelId() {
		return modelId;
	}

	public void setModelId(Integer modelId) {
		this.modelId = modelId;
	}

	

}
