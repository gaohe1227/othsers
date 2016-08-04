package com.doadway.dwcms.web.webservice.action;

import java.net.MalformedURLException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.caucho.hessian.client.HessianProxyFactory;
import com.doadway.common.page.Page;
import com.doadway.common.util.HtmlUtils;
import com.doadway.common.web.CookieUtils;
import com.doadway.dwcms.core.channel.biz.ChannelBiz;
import com.doadway.dwcms.core.channel.pojo.dto.ChannelDTO;
import com.doadway.dwcms.core.content.biz.ContentBiz;
import com.doadway.dwcms.core.content.enums.ContentStatusEnum;
import com.doadway.dwcms.web.webservice.hessian.HessianService;
import com.doadway.dwcom.manager.biz.FrontConstants;
@Controller
@RequestMapping("/api")
public class CmsAPIControl {
	 String url = "http://localhost:8080/dwcms/remote/hessianService";  
	 HessianProxyFactory factory = new HessianProxyFactory();  
	 Map<String,Object> result = new HashMap<String,Object>();

	@Resource
	private ContentBiz contentBiz;	 
	@Resource
	private ChannelBiz channelBiz;	
	
	@RequestMapping("sayHello")
	@ResponseBody
	public String sayHello(HttpServletRequest request,HttpServletResponse response,Map<String, Object> model){
		response.setHeader("Access-Control-Allow-Origin", "*");
		String name = request.getParameter("name")!=null?request.getParameter("name"):"";
		  HessianService hessianServer;
		  String ret="" ;
			try {
				hessianServer = (HessianService)factory.create(HessianService.class, url);
				ret = hessianServer.sayHello(name);  		
			} catch (MalformedURLException e) {
				e.printStackTrace();
			}
			result.put("result", ret);
		JSONObject json=JSONObject.fromObject(result);
		return json.toString();
	}
	
	

	@RequestMapping(value="/content/v_profile",method = RequestMethod.POST)
	@ResponseBody
	public String v_content(HttpServletRequest request,HttpServletResponse response,Map<String, Object> model){
		response.setHeader("Access-Control-Allow-Origin", "*");
		ChannelDTO companyPro=channelBiz.findChannelById(FrontConstants.COMPANY_PROFILE_ID);
		companyPro.setTxt(HtmlUtils.htmlToText(companyPro.getTxt()));
		result.put("result", companyPro);
		JSONObject json=JSONObject.fromObject(result);
		return json.toString();
	}	
	
	@RequestMapping(value="/content/v_list",method = RequestMethod.POST)
	@ResponseBody
	public String v_list(HttpServletRequest request, HttpServletResponse response,Map<String, Object> model){
		response.setHeader("Access-Control-Allow-Origin", "*");
		Integer currentPage = 1;
		if(request.getParameter("showCount")!=null){
			CookieUtils.addCookie(request, response, CookieUtils.COOKIE_PAGE_SIZE, request.getParameter("showCount"), 10, "/front/content");
		}
		Integer showCount =10;
		if(request.getParameter("pageNo")!=null&&!"".equals(request.getParameter("pageNo"))){
			currentPage = Integer.parseInt(request.getParameter("pageNo"));
		}
		Page p=new Page();
		p.setCurrentPage(currentPage);
		p.setShowCount(showCount);

		Map<String, Object> params=new HashMap<String,Object>();
		if(request.getParameter("channelId")!=null&&!"".equals(request.getParameter("channelId"))){
			Integer channelId=Integer.parseInt(request.getParameter("channelId"));
			params.put("channelId", channelId);
		}else{
			params.put("channelId", FrontConstants.NEWS_ID);
		}
		
		params.put("status", ContentStatusEnum.checked.getValue());
		
		result.put("list", contentBiz.findContentByPage(p, params ));
		result.put("page", p);
		JSONObject json=JSONObject.fromObject(result);
		return json.toString();
	}
	
	@RequestMapping(value="/content/v_content",method = RequestMethod.POST)
	@ResponseBody
	public String viewContent(HttpServletRequest request, HttpServletResponse response,Map<String, Object> model){
		response.setHeader("Access-Control-Allow-Origin", "*");
		String contentId="";
		if(request.getParameter("contentId")!=null&&!"".equals(request.getParameter("contentId"))){
			 contentId=request.getParameter("contentId");
		}
		result.put("result", contentBiz.findContentById(contentId));
		JSONObject json=JSONObject.fromObject(result);
		return json.toString();
	}	
	
	
}
