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
import com.doadway.dwcms.maintain.biz.KeywordBiz;
import com.doadway.dwcms.maintain.pojo.Keyword;
@Controller
@RequestMapping("/admin/maintain/keyword")
public class KeywordControl {
	@Resource
	LogBiz logBiz;	
	@Resource
	KeywordBiz keywordBiz;
	@RequestMapping("v_list")
	public String findAllKeyword(HttpServletRequest request,HttpServletResponse response,Map<String, Object> model){
		model.put("keywordList", keywordBiz.findAllKeyword());
		return "keyword/keyword_list";
	}
	
	@RequestMapping("o_del")
	public String delKeyword(HttpServletRequest request){
		String[] ids = request.getParameterValues("ids");
		keywordBiz.batchDeleteKeyword(ids);
		return "redirect:/admin/maintain/keyword/v_list.do";
	}
	@RequestMapping("o_save")
	public String saveKeyword(@RequestParam String keywordName,@RequestParam String url,HttpServletRequest request){
		Keyword keyword = new Keyword();
		keyword.setKeywordName(keywordName);
		keyword.setUrl(url);
		keyword.setIsDisabled(false);
		keywordBiz.saveKeyword(keyword);
		logBiz.operating(request, "添加关键词管理", "keyword="+keywordName);
		return "redirect:/admin/maintain/keyword/v_list.do";
	}	
	@RequestMapping("o_update")
	public String updateKeyword(HttpServletRequest request){
		List<Keyword> keywordList=new ArrayList<Keyword>();
		String[] ids=request.getParameterValues("id");
		String[] keywordNames=request.getParameterValues("name");
		String[] urls=request.getParameterValues("url");
		String[] disableds = request.getParameterValues("disabled");
		for(int i=0;i<ids.length;i++){
			Keyword kword = new Keyword();
			kword.setKeywordId(Integer.parseInt(ids[i].trim()));
			kword.setKeywordName(keywordNames[i]);
			kword.setIsDisabled(new Boolean(disableds[i]));
			kword.setUrl(urls[i]);
			keywordList.add(kword);
		}
		keywordBiz.batchUpdateKeyword(keywordList);
		return "redirect:/admin/maintain/keyword/v_list.do";
	}		
}
