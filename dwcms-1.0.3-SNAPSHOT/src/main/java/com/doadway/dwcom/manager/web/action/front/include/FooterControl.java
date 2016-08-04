package com.doadway.dwcom.manager.web.action.front.include;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.doadway.dwcom.manager.biz.FooterBiz;

@Controller
public class FooterControl {
	@Resource
	private FooterBiz footerBiz;	
	@RequestMapping(value="/footer.vm")
	public String generateFooter(Map<String, Object> model){
		model.put("partnerlink", footerBiz.findPartnerlink());	
		return "include/footer"; 	
	}
}
