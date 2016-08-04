package com.doadway.dwcms.assistant.web.action;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.doadway.common.shiro.UserRealm.ShiroUser;
import com.doadway.dwcms.assistant.biz.AcquisitionBiz;
import com.doadway.dwcms.assistant.biz.AcquisitionSvc;
import com.doadway.dwcms.assistant.pojo.Acquisition;
import com.doadway.dwcms.core.config.biz.SiteBiz;
import com.doadway.dwcms.core.user.biz.LogBiz;
@Controller
@RequestMapping("/admin/assistant/acquisition")
public class AcquisitionControl {
	@Resource
	LogBiz logBiz;		
	@Resource
	private AcquisitionBiz acquisitionBiz;
	@Resource
	private AcquisitionSvc acquisitionSvc;
	@Resource
	private SiteBiz siteBiz;	
	Acquisition acquisition=new Acquisition();	
	@RequestMapping("o_save")
	public String saveAcquisition(HttpServletRequest request,Acquisition newAcquisition,Map<String, Object> model){
		boolean flag = false;
		if(newAcquisition.getUserId()==null){
			Subject currentUser = SecurityUtils.getSubject(); 
			if(currentUser.getPrincipal() instanceof  ShiroUser){
				ShiroUser user = (ShiroUser)currentUser.getPrincipal();
				newAcquisition.setUserId(user.id);
			}else{
				newAcquisition.setUserId(1);
			}
		}
		if(newAcquisition.getSiteId()==null){
			newAcquisition.setSiteId(siteBiz.findAllSite().get(0).getSiteId());
		}
		if(newAcquisition.getStatus()==null){
			newAcquisition.setStatus(0);
		}
		if(newAcquisition.getCurrItem()==null){
			newAcquisition.setCurrItem(0);
		}
		if(newAcquisition.getCurrNum()==null){
			newAcquisition.setCurrNum(0);
		}
		if(newAcquisition.getTotalItem()==null){
			newAcquisition.setTotalItem(0);
		}
		if(newAcquisition.getAcquisitionId()!=null&&acquisitionBiz.queryAcquisitionById(newAcquisition.getAcquisitionId())!=null){
			flag=acquisitionBiz.saveOrUpdateAcquisition(newAcquisition);
			model.put("acquisition", acquisitionBiz.queryAcquisitionById(newAcquisition.getAcquisitionId()));
			model.put("status", flag);
			logBiz.operating(request, "修改采集器", "id="+newAcquisition.getAcquisitionId()+",acqName"+newAcquisition.getAcqName());
		}else{
			flag=acquisitionBiz.saveOrUpdateAcquisition(newAcquisition);
			model.put("status", flag);
			logBiz.operating(request, "添加采集器", "id="+newAcquisition.getAcquisitionId()+",acqName"+newAcquisition.getAcqName());
			return "redirect:/admin/assistant/acquisition/v_add.do";
		}
		return "acquisition/acquisition_edit";
	}
	
	@RequestMapping("v_list")
	public String findAllAcquisition(HttpServletRequest request,HttpServletResponse response,Map<String, Object> model){
		model.put("acqList", acquisitionBiz.queryAllAcquisition());
		return "acquisition/acquisition_list";
	}
	
	@RequestMapping("o_del")
	public String delAcquisition(HttpServletRequest request){
		String[] ids = request.getParameterValues("ids");
		acquisitionBiz.batchDeleteAcquisition(ids);
		return "redirect:/admin/assistant/acquisition/v_list.do";
		
	}
	@RequestMapping("v_edit")
	public String findAcquisition(HttpServletRequest request,Map<String, Object> model){
		Integer id = request.getParameter("id")!=null?Integer.parseInt(request.getParameter("id")):1;
		acquisition=acquisitionBiz.queryAcquisitionById(id);
		model.put("acquisition", acquisition);
		return "acquisition/acquisition_edit";
	}	
	@RequestMapping("v_add")
	public String showAddAcquisition(Map<String, Object> model){
		return "acquisition/acquisition_edit";
	}	
	@RequestMapping("o_start")
	public String start(Integer id, HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		acquisitionSvc.start(id);
		logBiz.operating(request,"开始采集 ","id=" +id);
		return "redirect:/admin/assistant/acquisition/v_list.do";
	}

	@RequestMapping("o_end")
	public String end(Integer id, HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		acquisitionBiz.endAcquisitionById(id);
		logBiz.operating(request,"结束采集","id=" +id);
		return "redirect:/admin/assistant/acquisition/v_list.do";
	}

	@RequestMapping("o_pause")
	public String pause(Integer id, HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		acquisitionBiz.pauseAcquisitionById(id);
		logBiz.operating(request,"暂停采集器 ","id=" +id);
		return "redirect:/admin/assistant/acquisition/v_list.do";
	}
	
}
