package com.doadway.dwcms.core.resource.biz;

import java.io.File;
import java.util.List;
import java.util.Map;

public interface ResourceBiz {
	public static final String root =File.separator+"r"+File.separator+"cms"+File.separator+"www";	
	public List<Map<String,Object>> resFileZTree(String filePath);
}
