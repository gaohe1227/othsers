package com.doadway.dwcom.manager.web.action.front.index;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.doadway.common.util.HtmlUtils;
import com.doadway.dwcom.manager.biz.IndexBiz;
import com.doadway.dwcom.manager.biz.TopBiz;
import com.doadway.dwcms.core.channel.pojo.dto.ChannelDTO;
@Controller
public class IndexControl {
	@Resource
	private IndexBiz indexBiz;	
	@Resource
	private TopBiz topBiz;	
	@RequestMapping(value="/index.vm")
	public  String frontIndex(Map<String, Object> model)  {
		model.put("indexAds",indexBiz.findIndexAdvertisingByAdSpaceId());
		
		model.put("design",indexBiz.findDesignById());
		model.put("designChild", indexBiz.findChildsByDesignId());		
		
 		model.put("cmsProduct", indexBiz.findCmsProductById());
 		
		//技术研究	
		model.put("technologyStudy", topBiz.findTechnologyStudyById());
			model.put("technologyStudyChild", topBiz.findChildsByTechnologyStudyId());
		
		model.put("app", indexBiz.findAppById());
		
		ChannelDTO companyPro=indexBiz.findCompanyProfileById();
		companyPro.setTxt(HtmlUtils.delHTMLTag(companyPro.getTxt()));
		model.put("companyProfile", companyPro);
		
		model.put("cases", indexBiz.findUpToDateCase());
		
		return "index/index"; 		
	}
}
