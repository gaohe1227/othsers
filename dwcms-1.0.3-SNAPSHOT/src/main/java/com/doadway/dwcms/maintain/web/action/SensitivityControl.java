package com.doadway.dwcms.maintain.web.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.doadway.dwcms.core.user.biz.LogBiz;
import com.doadway.dwcms.maintain.biz.SensitivityBiz;
import com.doadway.dwcms.maintain.pojo.Sensitivity;
@Controller
@RequestMapping("/admin/maintain/sensitivity")
public class SensitivityControl {
	@Resource
	LogBiz logBiz;	
	@Resource
	SensitivityBiz sensitivityBiz;
	@RequestMapping("v_list")
	public String findAllKeyword(HttpServletRequest request,HttpServletResponse response,Map<String, Object> model){
		model.put("sensitivityList", sensitivityBiz.findAllSensitivity());
		return "sensitivity/sensitivity";
	}
	
	@RequestMapping("o_del")
	public String delKeyword(HttpServletRequest request){
		String[] ids = request.getParameterValues("ids");
		sensitivityBiz.batchDeleteSensitivity(ids);
		return "redirect:/admin/maintain/sensitivity/v_list.do";
	}
	@RequestMapping("o_save")
	public String saveKeyword(@RequestParam String search,@RequestParam String replacement,HttpServletRequest request){
		Sensitivity sensitivity = new Sensitivity();
		sensitivity.setSearch(search);
		sensitivity.setReplacement(replacement);
		sensitivityBiz.saveSensitivity(sensitivity);
		logBiz.operating(request, "添加敏感词管理", "id="+sensitivity.getSensitivityId()+";search="+sensitivity.getSearch());
		return "redirect:/admin/maintain/sensitivity/v_list.do";
	}	
	@RequestMapping("o_update")
	public String updateKeyword(HttpServletRequest request){
		List<Sensitivity> sensitivityList=new ArrayList<Sensitivity>();
		String[] ids=request.getParameterValues("id");
		String[] searchs=request.getParameterValues("search");
		String[] replacements=request.getParameterValues("replacement");
		for(int i=0;i<ids.length;i++){
			Sensitivity sensitivity = new Sensitivity();
			sensitivity.setSensitivityId(Integer.parseInt(ids[i].trim()));
			sensitivity.setSearch(searchs[i]);
			sensitivity.setReplacement(replacements[i]);
			sensitivityList.add(sensitivity);
		}
		sensitivityBiz.batchUpdateSensitivity(sensitivityList);
		return "redirect:/admin/maintain/sensitivity/v_list.do";
	}		
}
