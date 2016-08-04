package com.doadway.dwcom.manager.web.action.front.cases;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.doadway.common.page.Page;
import com.doadway.common.web.CookieUtils;
import com.doadway.dwcms.core.channel.biz.ChannelBiz;
import com.doadway.dwcms.core.channel.pojo.dto.ChannelDTO;
import com.doadway.dwcms.core.content.biz.ContentBiz;
import com.doadway.dwcms.core.content.enums.ContentStatusEnum;
import com.doadway.dwcms.core.content.pojo.dto.ContentDTO;
@Controller
public class OurCasesControl {
	@Resource
	private ContentBiz  contentBiz;	
	@Resource
	private ChannelBiz  channelBiz;	
	@RequestMapping(value="/v_ourcases_list.vm")
	public String generateOurCases(HttpServletRequest request, HttpServletResponse response,Map<String, Object> model){
		Integer currentPage = 1;
		if(request.getParameter("showCount")!=null){
			CookieUtils.addCookie(request, response, CookieUtils.COOKIE_PAGE_SIZE, request.getParameter("showCount"), 10, "/front/content");
		}
		Integer showCount =CookieUtils.getPageSize(request);
		if(request.getParameter("pageNo")!=null&&!"".equals(request.getParameter("pageNo"))){
			currentPage = Integer.parseInt(request.getParameter("pageNo"));
		}
		Page p=new Page();
		p.setCurrentPage(currentPage);
		p.setShowCount(showCount);

		Map<String, Object> params=new HashMap<String,Object>();
		params.put("status", ContentStatusEnum.checked.getValue());
		if(request.getParameter("channelId")!=null&&!"".equals(request.getParameter("channelId"))){
			Integer channelId=Integer.parseInt(request.getParameter("channelId"));
			if(channelId!=0){
				List<ContentDTO> contentDtoList=new ArrayList<ContentDTO>();
				if(channelBiz.isParentChannel(channelId)){
					List<ChannelDTO> channelDtoList=channelBiz.findChannelsByParentId(channelId);
					for(ChannelDTO channelDto:channelDtoList){
						params.put("channelId", channelDto.getChannelId());
						model.put("channelId", channelId);
						contentDtoList.addAll(contentBiz.findContentByPage(p, params ));
					}
					p.setTotalResult(contentDtoList.size());
					p.setTotalPage(contentDtoList.size()%p.getShowCount()==0?contentDtoList.size()/p.getShowCount():contentDtoList.size()/p.getShowCount()+1);
					p.setCurrentPage(currentPage);
					Integer startIndex=p.getCurrentResult();
					Integer toIndex=p.getCurrentPage()*p.getShowCount();
					if(toIndex>contentDtoList.size()){
						toIndex=contentDtoList.size();
					}
					model.put("ourcasesList", contentDtoList.subList(startIndex,toIndex));
					model.put("page", p);		
					return "cases/ourcases";
				}else{
					params.put("channelId",channelId);
					model.put("channelId", channelId);
				}
			}
			
		}
		
		model.put("ourcasesList", contentBiz.findContentByPage(p, params ));
		model.put("page", p);		
		return "cases/ourcases"; 	
	}	
	@RequestMapping(value="/v_case.vm")
	public String viewContent(HttpServletRequest request, HttpServletResponse response,Map<String, Object> model){
		String contentId="";
		if(request.getParameter("contentId")!=null&&!"".equals(request.getParameter("contentId"))){
			 contentId=request.getParameter("contentId");
		}
		model.put("case",contentBiz.findContentById(contentId));
		return "cases/showcase"; 	
	}		
}
