package com.doadway.dwcms.core.templet.biz;

import java.io.File;
import java.util.List;
import java.util.Map;

public interface ResourceBiz {
	public static final String root =File.separator+"t"+File.separator+"cms"+File.separator+"www";	
	public List<Map<String,Object>> templateFileTree(String filePath);
	public List<Map<String,Object>> tmplFileZTree(String filePath);
}
