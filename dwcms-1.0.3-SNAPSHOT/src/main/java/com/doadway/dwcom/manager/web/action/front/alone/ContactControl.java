package com.doadway.dwcom.manager.web.action.front.alone;

import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.doadway.dwcom.crm.biz.CustomerBiz;
import com.doadway.dwcom.crm.pojo.Customer;
@Controller
public class ContactControl {
	@Resource
	CustomerBiz customerBiz; 
	@RequestMapping(value="/v_contact.vm")
	public String generateContact(HttpServletRequest request,Map<String, Object> model){
		if(request.getParameter("flag")!=null&&!"".equals(request.getParameter("flag"))){
			model.put("flag", request.getParameter("flag"));
		}
		return "alone/contact"; 	
	}
	@RequestMapping(value="/customer/o_save.vm")
	public String saveCustomer(HttpServletRequest request, HttpServletResponse response,Customer customer){
		boolean flag = false;
		customer.setIp(request.getLocalAddr());
		customer.setRegisterTime(new Date(System.currentTimeMillis()));
		customer.setStatus(0);
		customer.setRemarks("");
		flag=customerBiz.saveOrUpdateCustomer(customer);
		
		return "redirect:/v_contact.vm?flag="+flag;
	}
}
