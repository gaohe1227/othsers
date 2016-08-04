package com.doadway.dwcom.manager.web.action.front.alone;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.doadway.common.util.HtmlUtils;
import com.doadway.dwcom.manager.biz.IndexBiz;
import com.doadway.dwcms.core.channel.pojo.dto.ChannelDTO;

@Controller
public class CompanyProfileControl {
	@Resource
	private IndexBiz indexBiz;	
	@RequestMapping(value="/profile.vm")
	public String generateFooter(Map<String, Object> model){
		ChannelDTO companyPro=indexBiz.findCompanyProfileById();
		companyPro.setTxt(HtmlUtils.htmlToText(companyPro.getTxt()));
		model.put("companyProfile", companyPro);		
		return "alone/profile"; 	
	}
}
