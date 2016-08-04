package com.doadway.dwcms.core.config.web.action;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.doadway.dwcms.core.config.biz.FtpBiz;
import com.doadway.dwcms.core.config.pojo.Ftp;
import com.doadway.dwcms.core.user.biz.LogBiz;

@Controller
@RequestMapping("/admin/core/config/ftp")
public class FtpControl {
	@Resource
	LogBiz logBiz;	
	@Resource
	private FtpBiz ftpBiz;
	
	private Ftp ftp;
	@RequestMapping("v_list")
	public String findAllFtp(Map<String, Object> model){
		model.put("allFtp", ftpBiz.findAllFtp());
		return "ftp/config_ftp_list";
	}	
	@RequestMapping("v_add")
	public String addFtp(Map<String, Object> model){
		return "ftp/config_ftp_save";
	}	
	@RequestMapping("v_edit")
	public String findFtp(HttpServletRequest request,Map<String, Object> model){
		Integer id = request.getParameter("id")!=null?Integer.parseInt(request.getParameter("id")):1;
		ftp=ftpBiz.findFtpById(id);
		model.put("ftpInfo", ftp);
		return "ftp/config_ftp_save";
	}	
	@RequestMapping("o_save")
	public String saveOrUpdateFtp(HttpServletRequest request,Ftp newFtp,Map<String, Object> model){
		boolean flag =false;
		if(newFtp.getFtpId()!=null&&!"".equals(newFtp.getFtpId())){
			flag = ftpBiz.updateFtp(newFtp);
			model.put("ftpInfo", newFtp);
			model.put("status",flag);
			logBiz.operating(request, "修改Ftp信息", "id="+newFtp.getFtpId()+";ftpname="+newFtp.getFtpName());
		}else{
			newFtp.setFtpId(ftpBiz.findMaxId()+1);
			flag = ftpBiz.saveFtp(newFtp);
			model.put("status",flag);
			logBiz.operating(request, "添加Ftp信息", "id="+newFtp.getFtpId()+";ftpname="+newFtp.getFtpName());
		}
		return "ftp/config_ftp_save";
	}

	@RequestMapping("o_del")
	public String delFtp(HttpServletRequest request){
		String[] ids = request.getParameterValues("ids");
		ftpBiz.batchDeleteFtp(ids);
		return "redirect:/admin/core/config/ftp/v_list.do";
	}	
}
