package net.zz.utils.freemark;

import net.zz.utils.CMSConstants;
import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapper;

/**                                                    
 * Freemarker模板配置
 * Copyright: Copyright (c) 2011                       
 * @author  TanDong              
 * @version 1.0 2011-6-20上午11:33:31                         
 * @see                                                
 *	HISTORY                                            
 * 2011-6-20上午11:33:31 创建文件                             
 **************************************************/
public class FreemarkConfiguration {
	
	private static Configuration config;
	
	/**
	 * 单列模式获取Freemarker的配
	 * @return
	 * @throws Exception 异常信息
	 */
    public synchronized static Configuration getConfiguration() throws Exception{
		if(null == config){
		    config = new Configuration();
	        //String dirc = Thread.currentThread().getContextClassLoader().getResource(Constants.TMP_DIRC).toURI().getPath();
	        //config.setDirectoryForTemplateLoading(new File(dirc));
	        config.setClassForTemplateLoading(FreemarkConfiguration.class, CMSConstants.TEMPLATE_PATH);
	        config.setDefaultEncoding("utf-8");

		    config.setObjectWrapper(new DefaultObjectWrapper());
			FreemarkerExtends.registerExt(config);
		}
		return config;
	}
}
