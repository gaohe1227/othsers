package com.doadway.dwcom.manager.web.action.front.content;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.doadway.common.page.Page;
import com.doadway.common.web.CookieUtils;
import com.doadway.dwcom.manager.biz.FrontConstants;
import com.doadway.dwcms.core.content.biz.ContentBiz;
import com.doadway.dwcms.core.content.enums.ContentStatusEnum;
@Controller
public class NewsContentControl {
	@Resource
	private ContentBiz  contentBiz;	
	@RequestMapping(value="/v_news_list.vm")
	public String generateFooter(HttpServletRequest request, HttpServletResponse response,Map<String, Object> model){
		Integer currentPage = 1;
		if(request.getParameter("showCount")!=null){
			CookieUtils.addCookie(request, response, CookieUtils.COOKIE_PAGE_SIZE, request.getParameter("showCount"), 10, "/front/content");
		}
		Integer showCount =12;
		if(request.getParameter("pageNo")!=null&&!"".equals(request.getParameter("pageNo"))){
			currentPage = Integer.parseInt(request.getParameter("pageNo"));
		}
		Page p=new Page();
		p.setCurrentPage(currentPage);
		p.setShowCount(showCount);

		Map<String, Object> params=new HashMap<String,Object>();
		if(request.getParameter("channelId")!=null&&!"".equals(request.getParameter("channelId"))){
			Integer channelId=Integer.parseInt(request.getParameter("channelId"));
			params.put("channelId", channelId);
		}else{
			params.put("channelId", FrontConstants.NEWS_ID);
		}
		
		params.put("status", ContentStatusEnum.checked.getValue());
		
		model.put("contentDtoList", contentBiz.findContentByPage(p, params ));
		model.put("page", p);		
		return "channel/news"; 	
	}
	
	@RequestMapping(value="/v_content.vm")
	public String viewContent(HttpServletRequest request, HttpServletResponse response,Map<String, Object> model){
		String contentId="";
		if(request.getParameter("contentId")!=null&&!"".equals(request.getParameter("contentId"))){
			 contentId=request.getParameter("contentId");
		}
		
		model.put("content", contentBiz.findContentById(contentId));
		return "content/content"; 	
	}	
}
