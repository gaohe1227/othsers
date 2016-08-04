package com.doadway.dwcms.assistant.web.action;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.doadway.dwcms.assistant.biz.AdvertisingSpaceBiz;
import com.doadway.dwcms.assistant.pojo.AdvertisingSpace;
import com.doadway.dwcms.core.config.biz.SiteBiz;
import com.doadway.dwcms.core.user.biz.LogBiz;
@Controller
@RequestMapping("/admin/assistant/advertising_space")
public class AdvertisingSpaceControl {
	@Resource
	LogBiz logBiz;	
	@Resource
	private AdvertisingSpaceBiz advertisingSpaceBiz;
	@Resource
	private SiteBiz siteBiz;	
	AdvertisingSpace advertisingSpace=new AdvertisingSpace();	
	@RequestMapping("o_save")
	public String saveFriendlinkCtg(HttpServletRequest request,AdvertisingSpace newAdvertisingSpace,Map<String, Object> model){
		boolean flag =false;
		if(newAdvertisingSpace.getSiteId()==null){
			newAdvertisingSpace.setSiteId(siteBiz.findAllSite().get(0).getSiteId());
		}
		if(newAdvertisingSpace.getIsEnabled()!=null&&newAdvertisingSpace.getIsEnabled().equals("true")){
			newAdvertisingSpace.setIsEnabled("1");
		}else{
			newAdvertisingSpace.setIsEnabled("0");
		}
		
		if(newAdvertisingSpace.getAdspaceId()!=null&&!"".equals(newAdvertisingSpace.getAdspaceId())){
			flag = advertisingSpaceBiz.saveOrUpdateAdvertisingSpace(newAdvertisingSpace);
			advertisingSpace=advertisingSpaceBiz.findAdvertisingSpaceById(newAdvertisingSpace.getAdspaceId());
			model.put("advertisingSpace", advertisingSpace);
			model.put("status",flag);
			logBiz.operating(request, "修改广告栏目", "id="+newAdvertisingSpace.getAdspaceId()+"adname"+newAdvertisingSpace.getAdName());
		}else{
			flag = advertisingSpaceBiz.saveOrUpdateAdvertisingSpace(newAdvertisingSpace);
			model.put("status",flag);
			logBiz.operating(request, "添加广告栏目", "id="+newAdvertisingSpace.getAdspaceId()+"adname"+newAdvertisingSpace.getAdName());
			return "redirect:/admin/assistant/advertising_space/v_add.do";
		}
		return "advertising_space/advertising_space_edit";
	}
	
	@RequestMapping("v_list")
	public String findAllFriendlinkCtg(HttpServletRequest request,HttpServletResponse response,Map<String, Object> model){
		model.put("advertisingSpaceList", advertisingSpaceBiz.findAllAdvertisingSpace());
		return "advertising_space/advertising_space_list";
	}
	
	@RequestMapping("o_del")
	public String delFriendlinkCtg(HttpServletRequest request){
		String[] ids = request.getParameterValues("ids");
		advertisingSpaceBiz.batchDeleteAdvertisingSpace(ids);
		return "redirect:/admin/assistant/advertising_space/v_list.do";
		
	}
	@RequestMapping("v_edit")
	public String findFriendlink(HttpServletRequest request,Map<String, Object> model){
		Integer id = request.getParameter("id")!=null?Integer.parseInt(request.getParameter("id")):1;
		advertisingSpace=advertisingSpaceBiz.findAdvertisingSpaceById(id);
		model.put("advertisingSpace", advertisingSpace);
		return "advertising_space/advertising_space_edit";
	}	
	@RequestMapping("v_add")
	public String showAddFriendlink(Map<String, Object> model){
		return "advertising_space/advertising_space_edit";
	}	
}
