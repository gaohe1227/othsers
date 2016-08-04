package com.doadway.dwcms.core.content.web.action;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.doadway.common.page.Page;
import com.doadway.common.web.CookieUtils;
import com.doadway.dwcms.core.content.biz.TagBiz;
import com.doadway.dwcms.core.content.pojo.ContentTag;

@Controller
@RequestMapping("/admin/core/tag")
public class ContentTagControl {
	@Resource
	private TagBiz tagBiz;
	
	
	@RequestMapping("v_list")
	public String findTagsByPage(HttpServletRequest request,HttpServletResponse response,Map<String, Object> model){
		Integer currentPage = 1;
		if(request.getParameter("showCount")!=null){
			CookieUtils.addCookie(request, response, CookieUtils.COOKIE_PAGE_SIZE, request.getParameter("showCount"), 30, "/admin/core/tag");
		}
		Integer showCount =CookieUtils.getPageSize(request);
		if(request.getParameter("pageNo")!=null&&!"".equals(request.getParameter("pageNo"))){
			currentPage = Integer.parseInt(request.getParameter("pageNo"));
		}
		Page p=new Page();
		p.setCurrentPage(currentPage);
		p.setShowCount(showCount);
		Map<String, Object> params =new HashMap<String,Object>();
		
		if(request.getParameter("queryName")!=null&&!"".equals(request.getParameter("queryName"))){
			params.put("tagName", "%"+request.getParameter("queryName")+"%");
			model.put("queryName", request.getParameter("queryName"));
		}
		
		model.put("contentTagList", tagBiz.findContentTagByPage(p, params));
		model.put("page", p);
		return "tag/tag_list";
	}	
	@RequestMapping("v_add")
	public String addContentTag(Map<String, Object> model){
		return "tag/tag_save";
	}	
	@RequestMapping("v_edit")
	public String findContentTag(HttpServletRequest request,Map<String, Object> model){
		Integer tagId = request.getParameter("id")!=null?Integer.parseInt(request.getParameter("id")):1;
		ContentTag cTag = tagBiz.findContentTagById(tagId);
		model.put("tag", cTag);
		return "tag/tag_save";
	}	
	@RequestMapping("o_save")
	public String saveOrUpdateContentTag(ContentTag newContentTag,Map<String, Object> model){
		boolean flag =false;
		if(newContentTag.getTagId()!=null&&!"".equals(newContentTag.getTagId())){
			flag = tagBiz.saveOrUpdateContentTag(newContentTag);
			model.put("tag", newContentTag);
			model.put("status",flag);
		}else {
			newContentTag.setRefCounter(0);
			flag = tagBiz.saveOrUpdateContentTag(newContentTag);
			model.put("status",flag);
		}
		return "tag/tag_save";
	}

	@RequestMapping("o_del")
	public String delContentTag(HttpServletRequest request){
		String[] tagIds=request.getParameterValues("ids");
		tagBiz.batchDeleteContentTag(tagIds);
		return "redirect:/admin/core/tag/v_list.do?pageNo="+request.getParameter("pageNo")+"&queryName="+request.getParameter("queryName")+"";
	}		
}
