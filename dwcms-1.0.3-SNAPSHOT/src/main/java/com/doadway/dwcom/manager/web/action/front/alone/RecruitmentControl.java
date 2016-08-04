package com.doadway.dwcom.manager.web.action.front.alone;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RecruitmentControl {
	@RequestMapping(value="/v_recruit.vm")
	public String generateContact(Map<String, Object> model){
		return "alone/recruitment"; 	
	}
}
