package com.doadway.dwcom.manager.web.action.front.include;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.doadway.dwcom.manager.biz.TopBiz;
@Controller
public class TopControl {
	@Resource
	private TopBiz topBiz;	
	@RequestMapping(value="/top.vm")
	public  String generateHeader(Map<String, Object> model)  {
		//关于我们
		model.put("aboutUs", topBiz.findAboutUsById());
			model.put("aboutUsChild", topBiz.findChildsByAboutUsId());
			model.put("companyProfile", topBiz.findCompanyProfileById());
			model.put("news", topBiz.findNewsById());
			model.put("cases", topBiz.findCasesById());
		//	model.put("recruitment", topBiz.findRecruitmentById());
		//产品服务	
		model.put("productAndServic", topBiz.findProductAndService());
			model.put("productServiceChild", topBiz.findChildsByProductServiceId());
			model.put("design", topBiz.findDesignById());
				model.put("designChild", topBiz.findChildsByDesignId());
				
     		model.put("cmsProduct", topBiz.findCmsProductById());
//			model.put("solution", topBiz.findSolutionById());
//				model.put("solutionChild", topBiz.findChildsBySolutionId());
			model.put("app", topBiz.findAppById());
				
		//组织机构		
		model.put("organnize", topBiz.findOrgannizationById());
			model.put("organnizeChild", topBiz.findChildsByOrgannizeId());
		//技术研究	
		model.put("technologyStudy", topBiz.findTechnologyStudyById());
			model.put("technologyStudyChild", topBiz.findChildsByTechnologyStudyId());
		//联系我们
		model.put("contactUs", topBiz.findContactUsById());
		return "include/top"; 		
	}
}
