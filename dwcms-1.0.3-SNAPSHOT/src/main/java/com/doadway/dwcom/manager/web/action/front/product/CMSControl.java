package com.doadway.dwcom.manager.web.action.front.product;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.doadway.dwcms.core.channel.biz.ChannelBiz;
import com.doadway.dwcom.manager.biz.TopBiz;

@Controller
public class CMSControl {
	@Resource
	private ChannelBiz channelBiz;	
	@Resource
	private TopBiz topBiz;		
	@RequestMapping(value="/v_cms.vm")
	public String  cmsProduct(HttpServletRequest request, HttpServletResponse response,Map<String, Object> model){
		model.put("cms", topBiz.findCmsProductById());
		return "product/cms"; 			
	}
}
