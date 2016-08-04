package com.doadway.dwcms.assistant.web.action;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.doadway.common.file.FileNameUtils;
import com.doadway.common.page.Page;
import com.doadway.common.web.CookieUtils;
import com.doadway.dwcms.assistant.biz.AdvertisingBiz;
import com.doadway.dwcms.assistant.pojo.AdvertisingAttr;
import com.doadway.dwcms.assistant.pojo.dto.AdvertisingDTO;
import com.doadway.dwcms.core.config.biz.SiteBiz;
import com.doadway.dwcms.core.user.biz.LogBiz;
@Controller
@RequestMapping("/admin/assistant/advertising")
public class AdvertisingControl {
	@Resource
	LogBiz logBiz;		
	@Resource
	private AdvertisingBiz advertisingBiz;
	@Resource
	private SiteBiz siteBiz;	
	AdvertisingDTO advertisingDto=new AdvertisingDTO();	
	@RequestMapping("o_save")
	public String saveFriendlinkCtg(HttpServletRequest request,AdvertisingDTO newAdvertisingDTO,Map<String, Object> model){
		boolean flag =false;
		if(newAdvertisingDTO.getAdvertisingId()==null||newAdvertisingDTO.getAdvertisingId().equals("")){
			newAdvertisingDTO.setAdvertisingId(advertisingBiz.findMaxId()+1);
		}		
		if(newAdvertisingDTO.getSiteId()==null){
			newAdvertisingDTO.setSiteId(siteBiz.findAllSite().get(0).getSiteId());
		}
		if(newAdvertisingDTO.getIsEnabled()!=null&&newAdvertisingDTO.getIsEnabled().equals("true")){
			newAdvertisingDTO.setIsEnabled("1");
		}else{
			newAdvertisingDTO.setIsEnabled("0");
		}
		
		List<AdvertisingAttr> advertisingAttrList = new ArrayList<AdvertisingAttr>();
		if(newAdvertisingDTO.getCategory().equals("image")){
			if(request.getParameter("attr_image_url")!=null&&!"".equals(request.getParameter("attr_image_url"))){
				AdvertisingAttr adAttr =new AdvertisingAttr();
				adAttr.setAttrName("image_url");
				adAttr.setAttrValue(request.getParameter("attr_image_url"));
				advertisingAttrList.add(adAttr);
			}
			if(request.getParameter("attr_image_width")!=null&&!"".equals(request.getParameter("attr_image_width"))){
				AdvertisingAttr adAttr =new AdvertisingAttr();
				adAttr.setAttrName("image_width");
				adAttr.setAttrValue(request.getParameter("attr_image_width"));
				advertisingAttrList.add(adAttr);
			}
			if(request.getParameter("attr_image_height")!=null&&!"".equals(request.getParameter("attr_image_height"))){
				AdvertisingAttr adAttr =new AdvertisingAttr();
				adAttr.setAttrName("image_height");
				adAttr.setAttrValue(request.getParameter("attr_image_height"));
				advertisingAttrList.add(adAttr);
			}
			if(request.getParameter("attr_image_link")!=null&&!"".equals(request.getParameter("attr_image_link"))){
				AdvertisingAttr adAttr =new AdvertisingAttr();
				adAttr.setAttrName("image_link");
				adAttr.setAttrValue(request.getParameter("attr_image_link"));
				advertisingAttrList.add(adAttr);
			}
			if(request.getParameter("attr_image_title")!=null&&!"".equals(request.getParameter("attr_image_title"))){
				AdvertisingAttr adAttr =new AdvertisingAttr();
				adAttr.setAttrName("image_title");
				adAttr.setAttrValue(request.getParameter("attr_image_title"));
				advertisingAttrList.add(adAttr);
			}
			if(request.getParameter("attr_image_target")!=null&&!"".equals(request.getParameter("attr_image_target"))){
				AdvertisingAttr adAttr =new AdvertisingAttr();
				adAttr.setAttrName("image_target");
				adAttr.setAttrValue(request.getParameter("attr_image_target"));
				advertisingAttrList.add(adAttr);
			}
		}

		if(newAdvertisingDTO.getCategory().equals("flash")){
			if(request.getParameter("attr_flash_url")!=null&&!"".equals(request.getParameter("attr_flash_url"))){
				AdvertisingAttr adAttr =new AdvertisingAttr();
				adAttr.setAttrName("flash_url");
				adAttr.setAttrValue(request.getParameter("attr_flash_url"));
				advertisingAttrList.add(adAttr);
			}
			if(request.getParameter("attr_flash_width")!=null&&!"".equals(request.getParameter("attr_flash_width"))){
				AdvertisingAttr adAttr =new AdvertisingAttr();
				adAttr.setAttrName("flash_width");
				adAttr.setAttrValue(request.getParameter("attr_flash_width"));
				advertisingAttrList.add(adAttr);
			}
			if(request.getParameter("attr_flash_height")!=null&&!"".equals(request.getParameter("attr_flash_height"))){
				AdvertisingAttr adAttr =new AdvertisingAttr();
				adAttr.setAttrName("flash_height");
				adAttr.setAttrValue(request.getParameter("attr_flash_height"));
				advertisingAttrList.add(adAttr);
			}
		}		

		if(newAdvertisingDTO.getCategory().equals("text")){
			if(request.getParameter("attr_text_title")!=null&&!"".equals(request.getParameter("attr_text_title"))){
				AdvertisingAttr adAttr =new AdvertisingAttr();
				adAttr.setAttrName("text_title");
				adAttr.setAttrValue(request.getParameter("attr_text_title"));
				advertisingAttrList.add(adAttr);
			}
			if(request.getParameter("attr_text_link")!=null&&!"".equals(request.getParameter("attr_text_link"))){
				AdvertisingAttr adAttr =new AdvertisingAttr();
				adAttr.setAttrName("text_link");
				adAttr.setAttrValue(request.getParameter("attr_text_link"));
				advertisingAttrList.add(adAttr);
			}
			if(request.getParameter("attr_text_color")!=null&&!"".equals(request.getParameter("attr_text_color"))){
				AdvertisingAttr adAttr =new AdvertisingAttr();
				adAttr.setAttrName("text_color");
				adAttr.setAttrValue(request.getParameter("attr_text_color"));
				advertisingAttrList.add(adAttr);
			}
			if(request.getParameter("attr_text_font")!=null&&!"".equals(request.getParameter("attr_text_font"))){
				AdvertisingAttr adAttr =new AdvertisingAttr();
				adAttr.setAttrName("text_font");
				adAttr.setAttrValue(request.getParameter("attr_text_font"));
				advertisingAttrList.add(adAttr);
			}
			if(request.getParameter("attr_text_target")!=null&&!"".equals(request.getParameter("attr_text_target"))){
				AdvertisingAttr adAttr =new AdvertisingAttr();
				adAttr.setAttrName("text_target");
				adAttr.setAttrValue(request.getParameter("attr_text_target"));
				advertisingAttrList.add(adAttr);
			}
		}

		if(newAdvertisingDTO.getCategory().equals("code")){
			if(request.getParameter("code")!=null&&!"".equals(request.getParameter("code"))){
				AdvertisingAttr adAttr =new AdvertisingAttr();
				adAttr.setAttrName("code");
				adAttr.setAttrValue(request.getParameter("code"));
				advertisingAttrList.add(adAttr);
			}
		}
		newAdvertisingDTO.setAdvertisingAttrList(advertisingAttrList);
		if(newAdvertisingDTO.getAdvertisingId()!=null&&!"".equals(newAdvertisingDTO.getAdvertisingId())){
			flag = advertisingBiz.saveOrUpdateAdvertising(newAdvertisingDTO);
			advertisingDto=advertisingBiz.findAdvertisingById(newAdvertisingDTO.getAdvertisingId());
			model.put("advertisingDto", advertisingDto);
			model.put("status",flag);
			logBiz.operating(request, "修改广告", "id="+newAdvertisingDTO.getAdvertisingId()+"adname"+newAdvertisingDTO.getAdName());
		}else{
			flag = advertisingBiz.saveOrUpdateAdvertising(newAdvertisingDTO);
			model.put("status",flag);
			logBiz.operating(request, "发布广告", "id="+newAdvertisingDTO.getAdvertisingId()+"adname"+newAdvertisingDTO.getAdName());
			return "redirect:/admin/assistant/advertising/v_add.do";
		}
		return "redirect:/admin/assistant/advertising/v_edit.do?id="+newAdvertisingDTO.getAdvertisingId()+"";
	}
	
	@RequestMapping("v_list")
	public String findAllFriendlinkCtg(HttpServletRequest request,HttpServletResponse response,Map<String, Object> model){
		Integer currentPage = 1;
		if(request.getParameter("showCount")!=null){
			CookieUtils.addCookie(request, response, CookieUtils.COOKIE_PAGE_SIZE, request.getParameter("showCount"), 30, "/admin/assistant/advertising");
		}
		Integer showCount =CookieUtils.getPageSize(request);
		if(request.getParameter("pageNo")!=null&&!"".equals(request.getParameter("pageNo"))){
			currentPage = Integer.parseInt(request.getParameter("pageNo"));
		}
		Page p=new Page();
		p.setCurrentPage(currentPage);
		p.setShowCount(showCount);
		model.put("advertisingDtoList", advertisingBiz.findAdvertisingByPage(p, null));
		model.put("page", p);
		return "advertising/advertising_list";
	}
	
	@RequestMapping("o_del")
	public String delFriendlinkCtg(HttpServletRequest request){
		String[] ids = request.getParameterValues("ids");
		advertisingBiz.batchDeleteAdvertising(ids);
		return "redirect:/admin/assistant/advertising/v_list.do";
		
	}
	@RequestMapping("v_edit")
	public String findFriendlink(HttpServletRequest request,Map<String, Object> model){
		Integer id = request.getParameter("id")!=null?Integer.parseInt(request.getParameter("id")):1;
		advertisingDto=advertisingBiz.findAdvertisingById(id);
		model.put("advertisingDto", advertisingDto);
		if(advertisingDto.getAdvertisingAttrList().size()>0){
			for(AdvertisingAttr adAttr:advertisingDto.getAdvertisingAttrList()){
				model.put(adAttr.getAttrName(), adAttr.getAttrValue());
			}
		}
		return "advertising/advertising_edit";
	}	
	@RequestMapping("v_add")
	public String showAddFriendlink(Map<String, Object> model){
		return "advertising/advertising_edit";
	}	
	@RequestMapping(value = "/o_upload_flash")
	public void uploadAjax(@RequestParam(value = "flashFile") MultipartFile file,
			HttpServletRequest request, HttpServletResponse response) {
		File uploadDirPath = new File(request.getSession().getServletContext()
				.getRealPath("/u/cms/www")+"/"+FileNameUtils.genPathName()+"/");

		MultipartFile image = file;
		String fileType=image.getOriginalFilename().substring(image.getOriginalFilename().lastIndexOf(".")+1);
		File destFile = new File(uploadDirPath.getAbsoluteFile() + "/"
				+ FileNameUtils.genFileName(fileType));
		try {
			if (!uploadDirPath.exists()) {
				uploadDirPath.mkdirs();
				uploadDirPath.setExecutable(true);
			}
			FileCopyUtils.copy(image.getBytes(), destFile);
			
			
			String destPath = "/u/cms/www/"+FileNameUtils.genPathName()+"/"
					+ destFile.getName();
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("path", destPath);
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().println(jsonObject.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}	
}
