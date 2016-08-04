package net.zz.utils.freemark;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import freemarker.template.TemplateMethodModel;
import freemarker.template.TemplateModelException;

public class TemplateDateModel extends AbstractTmplateModel implements TemplateMethodModel {

	/**
	 * 默认时间格式
	 */
	private static final String DEFAULT_DATE_PATTERN = "yyyy-MM-dd HH:mm:ss"; 

	/* (non-Javadoc)
	 * @see freemarker.template.TemplateMethodModel#exec(java.util.List)
	 */
	@SuppressWarnings("rawtypes")
	public Object exec(List args) throws TemplateModelException {
		Date date = new Date();         
		String pattern = args.get(0).toString();         
		try {             
			return new SimpleDateFormat(pattern).format(date);         
		} catch (RuntimeException e) {             
			return new SimpleDateFormat(DEFAULT_DATE_PATTERN).format(date);  
		}
	}

	/* (non-Javadoc)
	 * @see com.travelsky.tjf.studio.template.ext.AbstractTmplateModel#getModelExpression()
	 */
	@Override
	public String getModelExpression() {
		return "dateTime";
	}
}
