package com.doadway.dwcms.core.config.tag;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import com.doadway.dwcms.core.config.enums.DataType;

public class DoDataTypeTag extends TagSupport {

	/**
	* @Fields serialVersionUID : TODO
	*/ 
	private static final long serialVersionUID = -1183073652760079932L;
	private Integer dataTypeValue=-1;
	
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
			if(dataTypeValue!=-1){
					out.println(DataType.parseLabel(dataTypeValue).getLabel());
			}else{
				out.println(dataTypeValue);
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

	
	public Integer getDataTypeValue() {
		return dataTypeValue;
	}

	public void setDataTypeValue(Integer dataTypeValue) {
		this.dataTypeValue = dataTypeValue;
	}
	

}
