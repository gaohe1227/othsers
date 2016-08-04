package net.zz.utils.freemark;

import java.util.ArrayList;
import java.util.List;

import freemarker.template.Configuration;
import freemarker.template.TemplateModelException;

public class FreemarkerExtends {
	
	/**
	 * 扩展model集合
	 */
	private static List<AbstractTmplateModel> extModels = new ArrayList<AbstractTmplateModel>();
	
	/**
	 * 装载所有扩展Model
	 */
	static{
		extModels.add(new TemplateDateModel());
	}
	

	/**
	 * 注册自定义扩展Model
	 * @param config Freemarker配置
	 * @param models 扩展Model
	 * @throws Exception 异常信息
	 */
	public static void registerExt(Configuration config) throws Exception{
		for(AbstractTmplateModel atm : extModels){
			try {
				config.setSharedVariable(atm.getModelExpression(), atm);
			} catch (TemplateModelException e) {
				throw new Exception("Register customer extends error.");
			}
		}
	}
}
