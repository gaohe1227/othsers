package com.doadway.common.web.action;

import java.io.File;
import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.doadway.common.email.SendMail;
import com.doadway.common.file.FileNameUtils;
import com.doadway.common.util.ImageHelper;
@Controller
@RequestMapping("common")
public class CommonControl {
	@Resource
	private SendMail sendMail;
	@RequestMapping(value = "/o_upload_image")
	public void uploadAjax(@RequestParam(value = "uploadFile") MultipartFile file,
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
	
	@RequestMapping(value = "/v_image_area_select")
	public String imageAreaSelect(){
		return "common/img_cute";	
	}
	
	@RequestMapping(value = "/cuteImage")
	public String cuteImag(HttpServletRequest request,@RequestParam String imgSrcPath,@RequestParam Integer imgWidth,@RequestParam Integer imgHeight,@RequestParam Integer imgLeft,@RequestParam Integer imgTop){
		try {
			String imagePath = request.getSession().getServletContext().getRealPath(imgSrcPath);
			ImageHelper.cutImage(imagePath,imagePath,imgLeft,imgTop,imgWidth,imgHeight);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}   
		return "common/img_cute";	
	}
	
	@RequestMapping(value = "/sendEmail")
	@ResponseBody
	public String sendEmail(){
		sendMail.send();
		return "ok";
	}	
}
