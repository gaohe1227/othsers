package com.doadway.dwcms.core.content.web.action;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.doadway.common.file.FileNameUtils;
import com.doadway.common.page.Page;
import com.doadway.common.web.CookieUtils;
import com.doadway.dwcms.core.channel.biz.ChannelBiz;
import com.doadway.dwcms.core.channel.pojo.dto.ChannelDTO;
import com.doadway.dwcms.core.config.biz.ModelBiz;
import com.doadway.dwcms.core.config.biz.SiteBiz;
import com.doadway.dwcms.core.config.pojo.Model;
import com.doadway.dwcms.core.content.biz.ContentBiz;
import com.doadway.dwcms.core.content.enums.ContentStatusEnum;
import com.doadway.dwcms.core.content.pojo.ContentAttachment;
import com.doadway.dwcms.core.content.pojo.ContentAttr;
import com.doadway.dwcms.core.content.pojo.ContentGroupViewKey;
import com.doadway.dwcms.core.content.pojo.ContentPicture;
import com.doadway.dwcms.core.content.pojo.ContentTopicKey;
import com.doadway.dwcms.core.content.pojo.dto.ContentDTO;
import com.doadway.dwcms.core.user.biz.LogBiz;

@Controller
@RequestMapping("/admin/core/content/")
public class ContentControl {
	@Resource
	LogBiz logBiz;	
	@Resource
	private ContentBiz contentBiz;
	@Resource
	private ChannelBiz channelBiz;
	@Resource
	private ModelBiz modelBiz;
	@Resource
	private SiteBiz siteBiz;
	
	@RequestMapping("v_list")
	public String findAllContent(HttpServletRequest request,HttpServletResponse response,Map<String, Object> model){
		Integer currentPage = 1;
		if(request.getParameter("showCount")!=null){
			CookieUtils.addCookie(request, response, CookieUtils.COOKIE_PAGE_SIZE, request.getParameter("showCount"), 30, "/admin/core/content");
		}
		Integer showCount =CookieUtils.getPageSize(request);
		if(request.getParameter("pageNo")!=null&&!"".equals(request.getParameter("pageNo"))){
			currentPage = Integer.parseInt(request.getParameter("pageNo"));
		}
		Page p=new Page();
		p.setCurrentPage(currentPage);
		p.setShowCount(showCount);
		Map<String, Object> params =new HashMap<String,Object>();
		
		if(request.getParameter("queryTitle")!=null&&!"".equals(request.getParameter("queryTitle"))){
			params.put("title", "%"+request.getParameter("queryTitle")+"%");
			model.put("queryTitle", request.getParameter("queryTitle"));
		}
		if(request.getParameter("queryInputUsername")!=null&&!"".equals(request.getParameter("queryInputUsername"))){
			params.put("author","%"+request.getParameter("queryInputUsername")+"%");
			model.put("queryInputUsername", request.getParameter("queryInputUsername"));
		}
		if(request.getParameter("queryTypeId")!=null&&!"".equals(request.getParameter("queryTypeId"))){
			params.put("typeId", request.getParameter("queryTypeId"));
			model.put("queryTypeId", request.getParameter("queryTypeId"));
		}

		if(request.getParameter("queryTopLevel")!=null&&!"".equals(request.getParameter("queryTopLevel"))){
			if(request.getParameter("queryTopLevel").equals("true")){
				params.put("topLevel",0);
			}
			model.put("queryTopLevel", request.getParameter("queryTopLevel"));
		}
		if(request.getParameter("queryRecommend")!=null&&!"".equals(request.getParameter("queryRecommend"))){
			if(request.getParameter("queryRecommend").equals("true")){
				params.put("recommend",1);
			}else{
				params.put("recommend",0);
			}
			model.put("queryRecommend", request.getParameter("queryRecommend"));
		}
		if(request.getParameter("queryStatus")!=null&&!"".equals(request.getParameter("queryStatus"))){
			String queryStatus = request.getParameter("queryStatus");
			if(queryStatus.equals("all")){
				
			}else if(queryStatus.equals("draft")){
				params.put("status", 0);
			}else if(queryStatus.equals("prepared")){
				params.put("status", 1);
			}else if(queryStatus.equals("passed")){
				params.put("status", 2);
			}else if(queryStatus.equals("checked")){
				params.put("status", 3);
			}else if(queryStatus.equals("recycle")){
				params.put("status", 4);
				model.put("queryStatus", queryStatus);
				model.put("contentDtoList", contentBiz.findContentByPage(p, params));
				model.put("page", p);					
				return "content/content_rubbish_list";
			}else if(queryStatus.equals("rejected")){
				params.put("status", 5);
		}
			model.put("queryStatus", queryStatus);
		}

		if(request.getParameter("channelId")!=null&&!"".equals(request.getParameter("channelId"))){
			Integer channelId=Integer.parseInt(request.getParameter("channelId"));
			model.put("channelId", channelId);
			if(channelId!=0){
				List<ContentDTO> contentDtoList=new ArrayList<ContentDTO>();
				if(channelBiz.isParentChannel(channelId)){
					List<ChannelDTO> channelDtoList=channelBiz.findChannelsByParentId(channelId);
					for(ChannelDTO channelDto:channelDtoList){
						params.put("channelId", channelDto.getChannelId());
						contentDtoList.addAll(contentBiz.findContentByPage(p, params ));
					}
					p.setTotalResult(contentDtoList.size());
					p.setTotalPage(contentDtoList.size()%p.getShowCount()==0?contentDtoList.size()/p.getShowCount():contentDtoList.size()/p.getShowCount()+1);
					p.setCurrentPage(currentPage);
					Integer startIndex=p.getCurrentResult();
					Integer toIndex=p.getCurrentPage()*p.getShowCount();
					if(toIndex>contentDtoList.size()){
						toIndex=contentDtoList.size();
					}
					model.put("contentDtoList", contentDtoList.subList(startIndex,toIndex));
					model.put("page", p);		
					return "content/content_list";
				}else{
					params.put("channelId", request.getParameter("channelId"));
				}
			}
		}
		model.put("contentDtoList", contentBiz.findContentByPage(p, params ));
		model.put("page", p);		
		return "content/content_list";
	}	
	@RequestMapping("v_add")
	public String addContent(HttpServletRequest request,Map<String, Object> model){
		Integer id = request.getParameter("channelId")!=null&&!"".equals(request.getParameter("channelId"))?Integer.parseInt(request.getParameter("channelId")):1;
		if(id==0){id=1;}
		model.put("channelDto.channelId", request.getParameter("channelId"));
		return findContentModelView(modelBiz.findModelById(channelBiz.findChannelById(id).getModelId()));
	}	
	@RequestMapping("v_view")
	public String viewContent(@RequestParam String contentId,Map<String, Object> map){
		map.put("contentDto", contentBiz.findContentById(contentId));
		return "content/content_view";
	}		
	@RequestMapping("v_edit")
	public String findContent(@RequestParam String contentId,Map<String, Object> model){
		ContentDTO contentDTO =contentBiz.findContentById(contentId);
		ChannelDTO channelDTO = channelBiz.findChannelById(contentDTO.getChannelId());
		contentDTO.setTagStr(contentBiz.findTagString(contentId));
		model.put("contentDTO", contentDTO);
		model.put("channelDTO", channelDTO);
		return findContentModelView(modelBiz.findModelById(channelBiz.findChannelById(channelDTO.getChannelId()).getModelId()));
	}	
	@RequestMapping("o_save")
	public String saveOrUpdateContent(HttpServletRequest request,ContentDTO contentDto,Map<String, Object> model){
		if(contentDto.getSiteId()==null){
			contentDto.setSiteId(siteBiz.findAllSite().get(0).getSiteId());
		}
		if(contentDto.getUserId()==null){
			contentDto.setUserId(1);
		}
		if(contentDto.getContentId()==null||"".equals(contentDto.getContentId())){
			contentDto.setContentId(contentBiz.findMaxId()+1);
			logBiz.operating(request, "添加内容", "id="+contentDto.getContentId()+";title="+contentDto.getTitle());
		}else{
			logBiz.operating(request, "修改内容", "id="+contentDto.getContentId()+";title="+contentDto.getTitle());
		}
		
		String[] attachPaths=request.getParameterValues("attachmentPaths");
		List<String> noTrimattachPaths=new ArrayList<String>();
		for(String s:attachPaths){
			if(!"".equals(s)){
				noTrimattachPaths.add(s);
			}
		}		
		String[] attachNames=request.getParameterValues("attachmentNames");
		if(noTrimattachPaths.size()>0){
			List<ContentAttachment> cAttachmentList = new ArrayList<ContentAttachment>();
			for(int i=0;i<attachPaths.length;i++){
				ContentAttachment cAttachment = new ContentAttachment();
				cAttachment.setAttachmentName(attachNames[i]);
				cAttachment.setAttachmentPath(noTrimattachPaths.get(i));
				cAttachment.setDownloadCount(0);
				cAttachment.setFilename(attachNames[i]);
				cAttachment.setPriority(0);
				cAttachment.setContentId(contentDto.getContentId());
				cAttachmentList.add(cAttachment);
			}
			contentDto.setAttachmentList(cAttachmentList);
		}
		
		String[] viewGroupIds = request.getParameterValues("viewGroupIds");
		if(viewGroupIds!=null){
			List<ContentGroupViewKey> groupViewList=new ArrayList<ContentGroupViewKey>();
			for(int i=0;i<viewGroupIds.length;i++){
				ContentGroupViewKey groupView = new ContentGroupViewKey();
				groupView.setContentId(contentDto.getContentId());
				groupView.setGroupId(Integer.parseInt(viewGroupIds[i]));
				groupViewList.add(groupView);
			}
			contentDto.setGroupViewList(groupViewList);
		}
		
		String[] picPaths =request.getParameterValues("picPaths");
		List<String> noTrimPicPaths=new ArrayList<String>();
		if(picPaths!=null){
			for(String s:picPaths){
				if(!"".equals(s)){
					noTrimPicPaths.add(s);
				}
			}
		}
		String[] picDescs =request.getParameterValues("picDescs");
		if(noTrimPicPaths.size()>0){
			List<ContentPicture> pictureList=new ArrayList<ContentPicture>();
			Integer priorityId=contentBiz.findMaxPriorityForPic();
			for(int i=0;i<noTrimPicPaths.size();i++){
				priorityId++;
				ContentPicture pic = new ContentPicture();
				pic.setContentId(contentDto.getContentId());
				pic.setDescription(picDescs[i]);
				pic.setImgPath(noTrimPicPaths.get(i));
				pic.setPriority(priorityId);
				pictureList.add(pic);
			}
			contentDto.setPictureList(pictureList);
		}
		
		String[] topicIds = request.getParameterValues("topicId");
		List<ContentTopicKey> topicKeyList = new ArrayList<ContentTopicKey>();
		if(topicIds!=null){
			for(String topicId:topicIds){
				ContentTopicKey cTopic = new ContentTopicKey();
				cTopic.setTopicId(Integer.parseInt(topicId));
				cTopic.setContentId(contentDto.getContentId());
				topicKeyList.add(cTopic);
			}
			contentDto.setTopicList(topicKeyList);
		}
		
		List<ContentAttr> cAttrList= new ArrayList<ContentAttr>();
		String warrant=request.getParameter("attr_warrant");
		if(warrant!=null){
			ContentAttr warrantAttr = new ContentAttr();
			warrantAttr.setAttrName("warrant");
			warrantAttr.setAttrValue(warrant);
			warrantAttr.setContentId(contentDto.getContentId());
			cAttrList.add(warrantAttr);
		}
		String demoUrl=request.getParameter("attr_demoUrl");
		if(demoUrl!=null){
			ContentAttr demoUrlAttr = new ContentAttr();
			demoUrlAttr.setAttrName("demoUrl");
			demoUrlAttr.setAttrValue(demoUrl);
			demoUrlAttr.setContentId(contentDto.getContentId());
			cAttrList.add(demoUrlAttr);
		}	
		String relatedLink=request.getParameter("attr_relatedLink");
		if(relatedLink!=null){
			ContentAttr relatedLinkAttr = new ContentAttr();
			relatedLinkAttr.setAttrName("relatedLink");
			relatedLinkAttr.setAttrValue(relatedLink);
			relatedLinkAttr.setContentId(contentDto.getContentId());
			cAttrList.add(relatedLinkAttr);
		}
		String softType=request.getParameter("attr_softType");
		if(softType!=null){
			ContentAttr softTypeAttr = new ContentAttr();
			softTypeAttr.setAttrName("softType");
			softTypeAttr.setAttrValue(softType);
			softTypeAttr.setContentId(contentDto.getContentId());
			cAttrList.add(softTypeAttr);
		}
		
		contentDto.setAttrList(cAttrList);
		
		contentBiz.saveOrUpdateContents(contentDto);
		return findContentModelView(modelBiz.findModelById(channelBiz.findChannelById(contentDto.getChannelId()).getModelId()));
	}

	@RequestMapping("o_del")
	public String delContent(HttpServletRequest request){
		String[] contentIds=request.getParameterValues("ids");
		String queryStatus=request.getParameter("queryStatus")!=null?request.getParameter("queryStatus"):"";
		if(queryStatus.equals("recycle")){
			contentBiz.batchDeleteContents(contentIds);
			return "redirect:/admin/core/content/v_list.do?queryStatus=recycle&pageNo="+request.getParameter("pageNo")+"&queryTitle="+request.getParameter("queryTitle")+"&queryInputUsername="+request.getParameter("queryInputUsername")+"";
		}
		contentBiz.batchUpdateContentStatus(contentIds, ContentStatusEnum.recycle);
		return "redirect:/admin/core/content/v_list.do";
	}		
	@RequestMapping("o_check")
	public String checkContent(HttpServletRequest request){
		String[] contentIds=request.getParameterValues("ids");
		contentBiz.batchUpdateContentStatus(contentIds, ContentStatusEnum.checked);
		contentBiz.batchReject(contentIds, 0);
		return "redirect:/admin/core/content/v_list.do";
	}		
	@RequestMapping("o_reject")
	public String rejectContent(HttpServletRequest request){
		String[] contentIds=request.getParameterValues("ids");
		contentBiz.batchReject(contentIds, 1);
		return "redirect:/admin/core/content/v_list.do";
	}	
	@RequestMapping("o_recycle")
	public String recycleContent(@RequestParam("pageNo")String pageNo,@RequestParam String queryTitle,@RequestParam String queryInputUsername,HttpServletRequest request){
		String[] contentIds=request.getParameterValues("ids");
		contentBiz.batchUpdateContentStatus(contentIds,ContentStatusEnum.passed);
		return "redirect:/admin/core/content/v_list.do?queryStatus=recycle&pageNo="+pageNo+"&queryTitle="+queryTitle+"&queryInputUsername="+queryInputUsername+"";
	}	
	@RequestMapping("o_upload_attachment")
	public void uploadAttachment(@RequestParam(value = "attachmentFile") MultipartFile file,
			HttpServletRequest request, HttpServletResponse response){
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
			
			String attachmentName = image.getOriginalFilename();
			String destPath = "u/cms/www/"+FileNameUtils.genPathName()+"/"
					+ destFile.getName();
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("path", destPath);
			jsonObject.put("attachmentName", attachmentName);
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().println(jsonObject.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}		
	}
	
	
	@RequestMapping("o_upload_media")
	public void uploadMedia(@RequestParam(value = "mediaFile") MultipartFile file,
			HttpServletRequest request, HttpServletResponse response){
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
			
			String destPath = "u/cms/www/"+FileNameUtils.genPathName()+"/"
					+ destFile.getName();
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("path", destPath);
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().println(jsonObject.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}		
	}	

	@RequestMapping(value = "/o_groupview")
	public void findChnlContriView(@RequestParam String contentId,
			HttpServletResponse response) {
		JSONArray jsonObject = new JSONArray();
		jsonObject = JSONArray.fromObject(contentBiz.findContentGroupView(Integer.parseInt(contentId)));
		response.setContentType("text/html;charset=utf-8");
		try {
			response.getWriter().println(jsonObject.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}	
	@RequestMapping(value = "/o_topic")
	public void findTopicView(@RequestParam String contentId,
			HttpServletResponse response) {
		JSONArray jsonObject = new JSONArray();
		jsonObject = JSONArray.fromObject(contentBiz.findContentTopicKey(Integer.parseInt(contentId)));
		response.setContentType("text/html;charset=utf-8");
		try {
			response.getWriter().println(jsonObject.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public String findContentModelView(Model model){
		String contentModelView ="";
		if(model!=null){
			if(model.getModelName().equals("下载")){
				contentModelView="content/content_download";
				return contentModelView;
			}			
		}
		contentModelView="content/content_save_update";
		return contentModelView;
	}	
}
