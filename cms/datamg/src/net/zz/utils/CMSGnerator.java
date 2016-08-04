package net.zz.utils;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.io.Writer;
import java.util.HashMap;
import java.util.Map;

import net.zz.cms.template.AbstractTemplate;
import net.zz.utils.freemark.FreemarkConfiguration;

/**
 * 
 * @author Dong
 *
 */
public class CMSGnerator {
	
	/**
	 * 根据模板生成静态的HTML页面
	 * @param temp 模板
	 * @throws CMSException
	 */
	@SuppressWarnings("resource")
	public static void gneratorHTMLByTemp(AbstractTemplate temp) throws CMSException{
		Map<String,Object> root=new HashMap<String,Object>();
		root.put(CMSConstants.TMP_ID, temp);
		
		FileOutputStream fs = null;
		try {
			fs = new FileOutputStream(temp.getSavePath());
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			throw new CMSException("Template file is not found.");
		}
		Writer out = null;
		try {
			out = new OutputStreamWriter(fs,"UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			throw new CMSException("Template encoding is error.");
		}
		try {
			FreemarkConfiguration.getConfiguration().getTemplate(temp.getTempName()).process(root , out);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
			throw new CMSException("Generate file error.");
		}
	}

}
