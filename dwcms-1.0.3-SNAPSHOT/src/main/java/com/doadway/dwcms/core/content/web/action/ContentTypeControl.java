package com.doadway.dwcms.core.content.web.action;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.doadway.dwcms.core.content.biz.ContentTypeBiz;
import com.doadway.dwcms.core.content.pojo.ContentType;
import com.doadway.dwcms.core.user.biz.LogBiz;

@Controller
@RequestMapping("/admin/core/content/contentType")
public class ContentTypeControl {
	@Resource
	LogBiz logBiz;	
	@Resource
	private ContentTypeBiz contentTypeBiz;
	
	private ContentType contentType;
	
	@RequestMapping("v_list")
	public String findAllConfigFtp(Map<String, Object> model){
		model.put("contentTypeList", contentTypeBiz.findAllContentType());
		return "type/content_type_list";
	}	
	@RequestMapping("v_add")
	public String addConfigFtp(Map<String, Object> model){
		return "type/content_type_save";
	}	
	@RequestMapping("v_edit")
	public String findConfigWebsite(HttpServletRequest request,Map<String, Object> model){
		Integer id = request.getParameter("id")!=null?Integer.parseInt(request.getParameter("id")):1;
		contentType=contentTypeBiz.findContentTypeById(id);
		model.put("contentTypeInfo", contentType);
		return "type/content_type_save";
	}	
	@RequestMapping("o_save")
	public String saveOrUpdateConfigContentType(HttpServletRequest request,ContentType newContentType,Map<String, Object> model){
		boolean flag =false;
		if(newContentType.getTypeId()!=null&&!"".equals(newContentType.getTypeId())){
			ContentType tContentType =contentTypeBiz.findContentTypeById(newContentType.getTypeId());
			if(tContentType!=null){
				flag = contentTypeBiz.updateContentType(newContentType);
				model.put("contentTypeInfo", newContentType);
			}else{
				flag = contentTypeBiz.saveContentType(newContentType);
			}
			model.put("status",flag);
			logBiz.operating(request, "修改内容类型","id="+newContentType.getTypeId()+";typename="+newContentType.getTypeName());
		}else{
			newContentType.setTypeId(contentTypeBiz.findMaxId()+1);
			flag = contentTypeBiz.saveContentType(newContentType);
			model.put("status",flag);
			logBiz.operating(request, "添加内容类型","id="+newContentType.getTypeId()+";typename="+newContentType.getTypeName());
		}
		return "type/content_type_save";
	}

	@RequestMapping("o_del")
	public String delConfigFtp(HttpServletRequest request){
		Integer id = Integer.parseInt(request.getParameter("id"));
		contentTypeBiz.deleteContentTypeById(id);
		return "redirect:/admin/core/content/contentType/v_list.do";
	}		
}
