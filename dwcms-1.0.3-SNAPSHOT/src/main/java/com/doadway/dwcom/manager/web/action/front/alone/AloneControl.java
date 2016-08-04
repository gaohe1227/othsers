package com.doadway.dwcom.manager.web.action.front.alone;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.doadway.dwcms.core.channel.biz.ChannelBiz;
import com.doadway.dwcms.core.channel.pojo.dto.ChannelDTO;

@Controller
public class AloneControl {
	@Resource
	private ChannelBiz channelBiz;	
	@RequestMapping(value="/v_alone.vm")
	public String  channelAlone(HttpServletRequest request, HttpServletResponse response,Map<String, Object> model){
		String channelId="";
		if(request.getParameter("channelId")!=null&&!"".equals(request.getParameter("channelId"))){
			channelId=request.getParameter("channelId");
		}
		ChannelDTO channelDto=channelBiz.findChannelById(Integer.parseInt(channelId));
		if(channelDto.getLink()!=null&&!channelDto.getLink().equals("")){
			return "redirect:"+channelDto.getLink(); 
		}
		model.put("alonePage", channelDto);
		return "alone/single"; 			
	}
}
