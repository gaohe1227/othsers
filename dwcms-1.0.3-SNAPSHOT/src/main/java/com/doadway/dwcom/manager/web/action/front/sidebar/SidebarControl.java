package com.doadway.dwcom.manager.web.action.front.sidebar;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.doadway.dwcom.manager.biz.TopBiz;

@Controller
public class SidebarControl {
	@Resource
	private TopBiz topBiz;	
	@RequestMapping(value="/v_sidebar.vm")
	public String generateSidebar(Map<String, Object> model){
		//关于我们
		model.put("aboutUs", topBiz.findAboutUsById());
			model.put("aboutUsChild", topBiz.findChildsByAboutUsId());
			model.put("companyProfile", topBiz.findCompanyProfileById());
			model.put("news", topBiz.findNewsById());
			model.put("cases", topBiz.findCasesById());
	//		model.put("recruitment", topBiz.findRecruitmentById());		
		return "sidebar/about_sidebar"; 	
	}
	@RequestMapping(value="/v_cases_sidebar.vm")
	public String generateCases(Map<String, Object> model){
		model.put("cases", topBiz.findCasesById());
		model.put("casesChild", topBiz.findChildsByCasesId());
		return "sidebar/cases_sidebar"; 	
	}	
	@RequestMapping(value="/v_research_sidebar.vm")
	public String generateResearch(Map<String, Object> model){
		//学院研究	
		model.put("technologyStudy", topBiz.findTechnologyStudyById());
			model.put("technologyStudyChild", topBiz.findChildsByTechnologyStudyId());
		return "sidebar/research_sidebar"; 	
	}	
}
