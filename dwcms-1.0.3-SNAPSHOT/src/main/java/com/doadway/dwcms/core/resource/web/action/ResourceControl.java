package com.doadway.dwcms.core.resource.web.action;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.doadway.common.file.FileWrap;
import com.doadway.dwcms.core.resource.biz.ResourceBiz;
import com.doadway.dwcms.core.user.biz.LogBiz;

@Controller
@RequestMapping("/admin/core/res")
public class ResourceControl {
	@Resource
	LogBiz logBiz;		
	@Resource
	ResourceBiz resBiz;
	@RequestMapping(value = "/v_ztree")
	public void createZTree(HttpServletRequest request,
			HttpServletResponse response) {
		String tmplPath = request.getParameter("root") == null
				||"".equals(request.getParameter("root")) ? ResourceBiz.root: request
						.getParameter("root");
		String realPath=request.getSession().getServletContext().getRealPath(tmplPath);
		JSONArray jsonArray = new JSONArray();
		jsonArray = JSONArray.fromObject(resBiz.resFileZTree(realPath));
		
		Map<String,Object> node = new HashMap<String,Object>();
		node.put("id", "");
		node.put("pId", ResourceBiz.root);
		node.put("name", "资源根目录");
		node.put("open", "true");
		node.put("children", jsonArray);
		response.setContentType("text/html;charset=utf-8");
		try {
			response.getWriter().println(JSONArray.fromObject(node).toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("v_list")
	public String findFileListByRoot(@RequestParam String root,@RequestParam String filename,HttpServletRequest request,Map<String, Object> model){
		String realPath=request.getSession().getServletContext().getRealPath(root+File.separator+filename);
		File file = new File(realPath);
		List<FileWrap> fWrapList = new ArrayList<FileWrap>();
		if(file.isDirectory()){
			File dir = new File(realPath);
			File[] files= dir.listFiles();
			for(File f:files){
				FileWrap tFWrap = new FileWrap(f);
				fWrapList.add(tFWrap);
			}
			model.put("fileList", fWrapList);
			model.put("root", (root+File.separator+filename).replaceAll("\\\\", "/"));
			return "resource/res_list";
		}
		
		String charEncoding=request.getCharacterEncoding();
		try {
			String txt="";
			InputStreamReader  fr = new InputStreamReader(new FileInputStream(file),charEncoding);
			BufferedReader br = new BufferedReader(fr);
			String s=br.readLine();
			while(s!=null){
				txt+=s+"\n";
				s=br.readLine();
			};
			model.put("txt", txt);
			
			fr.close();
			br.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		model.put("root", root.replaceAll("\\\\", "/"));
		model.put("file", new FileWrap(file));
		return "resource/res_edit";
	}

	@RequestMapping("v_add")
	public String addView(@RequestParam String root,HttpServletRequest request,Map<String, Object> model){
		model.put("root", root);
		return "resource/res_edit";
	}	

	@RequestMapping("v_edit")
	public String findFile(@RequestParam String root,@RequestParam String filename,HttpServletRequest request,Map<String, Object> model){
		String realPath=request.getSession().getServletContext().getRealPath(root+File.separator+filename);
		File file = new File(realPath);
		String charEncoding=request.getCharacterEncoding();
		try {
			String txt="";
			InputStreamReader  fr = new InputStreamReader(new FileInputStream(file),charEncoding);
			BufferedReader br = new BufferedReader(fr);
			String s=br.readLine();
			while(s!=null){
				txt+=s+"\n";
				s=br.readLine();
			};
			fr.close();
			br.close();
			model.put("txt", txt);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		model.put("root", root);
		model.put("file", new FileWrap(file));
		return "resource/res_edit";	
	}
	
	@RequestMapping("o_save")
	public String saveOrUpdateFile(@RequestParam String root,@RequestParam String filename,@RequestParam("source") String txt,HttpServletRequest request,Map<String, Object> model){
		String realPath=request.getSession().getServletContext().getRealPath(root+File.separator+filename);
		File file = new File(realPath);
		String charEncoding=request.getCharacterEncoding();
		try {
			if (!file.exists()){
				file.createNewFile();
				logBiz.operating(request, "创建资源文件", "filename="+root+File.separator+filename);
			}
			OutputStreamWriter osw = new OutputStreamWriter(new FileOutputStream(file),charEncoding);
			BufferedWriter bw = new BufferedWriter(osw);	
			bw.write(txt);

			logBiz.operating(request, "修改资源文件", "filename="+root+File.separator+filename);
			bw.close();
			osw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		model.put("txt", txt);
		model.put("file", new FileWrap(file));
		model.put("root", root);
		return "resource/res_edit";
	}

	@RequestMapping("o_del")
	public String delFile(@RequestParam String root,HttpServletRequest request){
		String[] names = request.getParameterValues("names");
		if(names!=null){
			for(String name:names){
				String realPath=request.getSession().getServletContext().getRealPath(name);
				File dir = new File(realPath);
				if(dir.exists()){
					dir.delete();
				}
			}
		}
		return "redirect:/admin/core/res/v_list.do?root="+root+"";
	}		
	@RequestMapping("o_delete_single")
	public String delSingleFile(@RequestParam String root,@RequestParam String name,HttpServletRequest request){
		String realPath=request.getSession().getServletContext().getRealPath(root+File.separator+name);
		File dir = new File(realPath);
		if (dir.exists()){
			dir.delete();
		}
		return "redirect:/admin/core/res/v_list.do?root="+root+"";
	}		
	@RequestMapping("v_rename")
	public String vFilename(HttpServletRequest request){
		return "template/file_rename";
	}		
	@RequestMapping("o_rename")
	public String oFilename(@RequestParam String root,@RequestParam String origName,@RequestParam String distName,HttpServletRequest request){
		File origFile= new File(request.getSession().getServletContext().getRealPath(root+File.separator+origName));
		File distFile= new File(request.getSession ().getServletContext().getRealPath(root+File.separator+distName));
		origFile.renameTo(distFile);
		return "redirect:/admin/core/res/v_list.do?root="+root+"";
	}		
	
	@RequestMapping("o_create_dir")
	public String createDir(@RequestParam String root,@RequestParam String dirName,HttpServletRequest request){
		String realPath=request.getSession().getServletContext().getRealPath(root+File.separator+dirName);
		File dir = new File(realPath);
		if (!dir.exists()){
			dir.mkdirs();
		}
		return "redirect:/admin/core/res/v_list.do?root="+root+"";
	}		
	@RequestMapping("o_swfupload")
	public String swfupload(String root,
			@RequestParam(value = "Filedata", required = false) MultipartFile file,
			HttpServletRequest request, HttpServletResponse response,
			ModelMap model){
		String realPath=request.getSession().getServletContext().getRealPath(root);
		File dir = new File(realPath);
		if (!dir.exists()){
			dir.mkdirs();
		}
		File destFile = new File(dir.getAbsoluteFile() + "/"+ file.getOriginalFilename());	
		try {
			FileCopyUtils.copy(file.getBytes(), destFile);
			logBiz.operating(request, "上传资源文件", "filename="+root+File.separator+destFile.getName());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "redirect:/admin/core/res/v_list.do?root="+root+"";
	}	
}
