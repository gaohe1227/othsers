package com.doadway.dwcom.manager.web.action.front.product;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DesignControl {
	@RequestMapping(value="/v_design.vm")
	public String  cmsProduct(HttpServletRequest request, HttpServletResponse response,Map<String, Object> model){
		return "product/design"; 			
	}
}
