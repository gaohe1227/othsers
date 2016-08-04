package com.doadway.dwcms.core.resource.biz.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.doadway.dwcms.core.resource.biz.ResourceBiz;
@Service
public class ResourceBizImpl implements ResourceBiz {

	public List<Map<String, Object>> resFileZTree(String filePath) {
		File f = new File(filePath);
		File[] list = f.listFiles();
		List<Map<String,Object>> result = new ArrayList<Map<String,Object>>();
		for(File tf:list){
			Map<String,Object> node = new HashMap<String,Object>();
			node.put("id", tf.getAbsoluteFile().getName());
			String[] s=tf.getParentFile().getAbsolutePath().split("www");
			if(s.length>1){
				node.put("pId",ResourceBiz.root+s[1]);
			}else{
				node.put("pId",ResourceBiz.root);
				
			}
			
			node.put("name",  tf.getName());
			node.put("open", tf.isDirectory()?"closed":"open");
			if(tf.isDirectory()){
				node.put("children", resFileZTree(tf.getAbsolutePath()));
			}
			result.add(node);
		}
		
		return result;
	}

}
