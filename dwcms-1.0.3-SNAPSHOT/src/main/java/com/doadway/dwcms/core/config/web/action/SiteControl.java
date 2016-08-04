package com.doadway.dwcms.core.config.web.action;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.doadway.dwcms.core.config.biz.SiteBiz;
import com.doadway.dwcms.core.config.pojo.Site;
import com.doadway.dwcms.core.user.biz.LogBiz;
@Controller
@RequestMapping("/admin/core/config/site")
public class SiteControl {
	@Resource
	LogBiz logBiz;	
	@Resource
	private SiteBiz siteBiz;
	Site site =new Site();
	@RequestMapping("v_edit")
	public String findSite(HttpServletRequest request,Map<String, Object> model){
		Integer id = request.getParameter("siteId")!=null?Integer.parseInt(request.getParameter("siteId")):1;
		site=siteBiz.findSiteById(id);
		model.put("siteInfo", site);
		return "site/config_website";
	}
	@RequestMapping("o_save")
	public String setupSite(HttpServletRequest request,Site siteInfo,Map<String, Object> model){
		boolean flag =false;
		if(siteInfo.getSiteId()!=null&&!"".equals(siteInfo.getSiteId())){
			flag = siteBiz.setSite(siteInfo);
			model.put("siteInfo", siteInfo);
			model.put("status",flag);
			logBiz.operating(request, "修改网站", "id="+siteInfo.getSiteId()+";sitename="+siteInfo.getSiteName());
		}else{
			siteInfo.setSiteId(siteBiz.findMaxId()+1);
			logBiz.operating(request, "添加网站", "id="+siteInfo.getSiteId()+";sitename="+siteInfo.getSiteName());
			if(siteInfo.getConfigId()==null){
				siteInfo.setConfigId(1);
			}
			flag = siteBiz.saveSite(siteInfo);
			model.put("status",flag);
		}
		return "site/config_website";
	}
	@RequestMapping("v_list")
	public String findAllSite(Map<String, Object> model){
		model.put("allSite", siteBiz.findAllSite());
		return "site/config_website_list";
	}
	@RequestMapping("v_add")
	public String addWebsite(Map<String, Object> model){
		return "site/config_website";
	}
	
	@RequestMapping("o_del")
	public String delWebsite(HttpServletRequest request){
		Integer id = Integer.parseInt(request.getParameter("siteId"));
		if(id==1){
			return "redirect:/admin/core/config/site/v_list.do";
		}
		siteBiz.deleteSiteById(id);
		return "redirect:/admin/core/config/site/v_list.do";
	}
}
