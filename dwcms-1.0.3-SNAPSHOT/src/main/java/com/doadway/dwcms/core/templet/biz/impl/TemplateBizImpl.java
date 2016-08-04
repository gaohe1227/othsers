package com.doadway.dwcms.core.templet.biz.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.doadway.dwcms.core.templet.biz.ResourceBiz;
@Service
public class TemplateBizImpl implements ResourceBiz{
	public List<Map<String,Object>> templateFileTree(String filePath){
		File f = new File(filePath);
		File[] list = f.listFiles();
		List<Map<String,Object>> result = new ArrayList<Map<String,Object>>();
		for(File tf:list){
			Map<String,Object> node = new HashMap<String,Object>();
			node.put("id", tf.getAbsoluteFile());
			node.put("text", tf.getName());
			node.put("state", tf.isDirectory()?"closed":"open");
			if(tf.isDirectory()){
				node.put("children", templateFileTree(tf.getAbsolutePath()));
			}
			result.add(node);
		}
		
		return result;		
	}

	public List<Map<String, Object>> tmplFileZTree(String filePath) {
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
				node.put("children", tmplFileZTree(tf.getAbsolutePath()));
			}
			result.add(node);
		}
		
		return result;
	}
	public static void main(String args[]){
		TemplateBizImpl tBiz = new TemplateBizImpl();
		System.out.println(tBiz.tmplFileZTree("D:\\Tomcat-6.0.37\\webapps\\dwcms\\t\\cms\\www"));
	}
}
