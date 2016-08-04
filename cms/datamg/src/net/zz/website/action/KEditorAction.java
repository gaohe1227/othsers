package net.zz.website.action;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.zz.utils.ConfigUtils;
import net.zz.utils.JSONUtils;
import net.zz.utils.StringUtils;

import org.apache.commons.io.FileUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;

import com.opensymphony.xwork2.ActionSupport;

/***
 * 编辑器(KindEditor4.1.10)上传附件Action <b><code></code></b>
 * <p/>
 * Comment here
 * <p/>
 * <b>Creation Time:</b> 2014年5月11日
 * 
 * @author ZhangZhen
 * @version 1.0
 * 
 * @since datamg 1.0
 */
@SuppressWarnings({ "serial", "rawtypes" })
@ParentPackage("defaultPackage")
@Namespace("/")
@Action(value = "kEditorAction")
public class KEditorAction extends ActionSupport {
	private static final Log LOG = LogFactory.getLog(KEditorAction.class);
	/** KindEditor文件目录 */
	private static final String KEDITOR_PATH = "/keditor/";
	/** KindEdtor文件保存根目录 */
	private String kEditorRealPath = null;
	/** KindEditor访问路径 */
	private String kEditorUrl = null;

	/** 上传文件 */
	private File imgFile;
	/** 上传文件名称 */
	private String imgFileFileName;
	/** 传过来文件夹名称 */
	private String dir;
	/**KEditor文件管理传过来路径*/
	private String path;
	/**KEditor文件管理文件排序方式 */
	private String order;
	
	/**
	 * 初始化KEditor上传文件目录和返回路径
	 * comment here
	 * @since datamg 1.0
	 */
	private void InitKEditorConfig() {
		LOG.debug("Init KindEditor Config...");
		String userName = (String) this.getRequest().getSession()
				.getAttribute("userName");
		userName = (StringUtils.isEmpty(userName) ? "admin" : userName) + "/";
		kEditorRealPath = ConfigUtils.getConfigValue("uploadRelaPath")
				+ KEDITOR_PATH + userName;

		kEditorUrl = getRequest().getContextPath() + KEDITOR_PATH + userName;
	}

	/**
	 * 编辑器KindEditor上传附件 
	 * comment here
	 * @since datamg 1.0
	 */
	public void doNotSecurityUploadFile() {
		LOG.debug("KindEdit开始上传附件...");
		try {
			InitKEditorConfig();
			if (null != this.imgFile) {
				LOG.debug("附件名称="+this.imgFileFileName);
				if (StringUtils.isEmpty(dir)) { // 如果没有获取到传过来的文件夹名称,就给默认值
					dir = "image";
				}
				// 文件保存目录和响应目录
				String dateDir = StringUtils.dateToString(
						new Date(System.currentTimeMillis()), "yyyyMMdd");
				kEditorRealPath += dir + "/" + dateDir + "/";
				kEditorUrl += dir + "/" + dateDir + "/";
				String extension = ""; // 文件扩展名
				if (!StringUtils.isEmpty(imgFileFileName)) {
					extension = imgFileFileName.substring(
							imgFileFileName.lastIndexOf(".") + 1).toLowerCase();
				}
				String newFileName = StringUtils.getUUID() + "." + extension;
				File saveFile = new File(kEditorRealPath + newFileName);
				if (!saveFile.exists() && !saveFile.getParentFile().exists()) { // 如果文件上层文件夹不存在就创建
					saveFile.getParentFile().mkdirs();
				}
				// 把文件写入磁盘
				FileUtils.copyFile(imgFile, saveFile);

				uploadWriteJson(0, kEditorUrl + newFileName);
			} else {
				uploadWriteJson(1, "没有获取到需要上传的文件,请选择文件!");
			}
		} catch (IOException e) {
			e.printStackTrace();
			LOG.debug("上传文件为空,导致上传失败...");
			uploadWriteJson(1, "上传文件失败,如果该问题重复出现,请联系管理员!");
		}
	}

	/**
	 * KindEditor文件管理 comment here
	 * 
	 * @since datamg 1.0
	 */
	@SuppressWarnings("unchecked")
	public void doNotSecurityFileManager() {
		
		InitKEditorConfig();
		// 图片扩展名
		String[] fileTypes = new String[] { "gif", "jpg", "jpeg", "png", "bmp" };

		if (!StringUtils.isEmpty(dir)) {
			if (!Arrays.<String> asList(
					new String[] { "image", "flash", "media", "file" })
					.contains(dir)) {
				WriteJSON("Invalid Directory name.");
				return;
			}
			kEditorRealPath += dir + "/";
			kEditorUrl += dir + "/";
			File saveDirFile = new File(kEditorRealPath);
			if (!saveDirFile.exists()) {
				saveDirFile.mkdirs();
			}
		}
		// 根据path参数，设置各路径和URL
		path = StringUtils.isEmpty(path)?"":path;
		String currentPath = kEditorRealPath + path;
		String currentUrl = kEditorUrl + path;
		String currentDirPath = path;
		String moveupDirPath = "";
		if (!"".equals(path)) {
			String str = currentDirPath.substring(0,
					currentDirPath.length() - 1);
			moveupDirPath = str.lastIndexOf("/") >= 0 ? str.substring(0,
					str.lastIndexOf("/") + 1) : "";
		}

		// 排序形式，name or size or type
		order = StringUtils.isEmpty(order)?"name":(order.toLowerCase());
				

		// 不允许使用..移动到上一级目录
		if (path.indexOf("..") >= 0) {
			WriteJSON("Access is not allowed.");
			return;
		}
		// 最后一个字符不是/
		if (!"".equals(path) && !path.endsWith("/")) {
			WriteJSON("Parameter is not valid.");
			return;
		}
		// 目录不存在或不是目录
		File currentPathFile = new File(currentPath);
		if (!currentPathFile.isDirectory()) {
			WriteJSON("Directory does not exist.");
			return;
		}

		// 遍历目录取的文件信息
		List<Hashtable> fileList = new ArrayList<Hashtable>();
		if (currentPathFile.listFiles() != null) {
			for (File file : currentPathFile.listFiles()) {
				Hashtable<String, Object> hash = new Hashtable<String, Object>();
				String fileName = file.getName();
				if (file.isDirectory()) { //文件夹
					hash.put("is_dir", true);
					hash.put("has_file", (file.listFiles() != null));
					hash.put("filesize", 0L);
					hash.put("is_photo", false);
					hash.put("filetype", "");
				} else { //非文件夹
					String fileExt = fileName.substring(
							fileName.lastIndexOf(".") + 1).toLowerCase();
					hash.put("is_dir", false);
					hash.put("has_file", false);
					hash.put("filesize", file.length());
					hash.put("is_photo", Arrays.<String> asList(fileTypes)
							.contains(fileExt));
					hash.put("filetype", fileExt);
				}
				hash.put("filename", fileName);
				hash.put("datetime", StringUtils.dateToString(new Date(file.lastModified()), "yyyy-MM-dd HH:mm:ss"));
				fileList.add(hash);
			}
		}

		if ("size".equals(order)) {
			Collections.sort(fileList, new SizeComparator());
		} else if ("type".equals(order)) {
			Collections.sort(fileList, new TypeComparator());
		} else {
			Collections.sort(fileList, new NameComparator());
		}
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("moveup_dir_path", moveupDirPath);
		result.put("current_dir_path", currentDirPath);
		result.put("current_url", currentUrl);
		result.put("total_count", fileList.size());
		result.put("file_list", fileList);
		WriteJSON(JSONUtils.ObjectToJson(result));
	}

	/**
	 * 响应消息KEditor comment here
	 * 
	 * @param errorCode
	 * @param message
	 * @since datamg 1.0
	 */
	private void uploadWriteJson(Integer errorCode, String message) {
		Map<String, Object> msg = new HashMap<String, Object>();
		msg.put("error", errorCode);
		if (0 != errorCode) {
			msg.put("message", message);
		} else {
			msg.put("url", message);
		}
		WriteJSON(JSONUtils.ObjectToJson(msg));
	}
	
	/**
	 * 响应JSON到客户端
	 * @param jsonStr
	 */
	protected void WriteJSON(String jsonStr) {
		getResponse().setCharacterEncoding("UTF-8");
		getResponse().setContentType("text/html;charset=utf-8");
		getResponse().setHeader("Access-Control-Allow-Origin", "*");
		getResponse().setHeader("Access-Control-Allow-Credentials", "true");
		getResponse().setHeader("Access-Control-Allow-Methods",
				"Access-Control-Request-Method");
		getResponse().setHeader("Access-Control-Allow-Headers",
				"Access-Control-Request-Headers");
		try {
			getResponse().getWriter().write(jsonStr);
			getResponse().getWriter().flush();
			getResponse().getWriter().close();
		} catch (Exception e) {
		}
	}

	/**
	 * 获取HttpSevletRequest
	 * 
	 * @return
	 */
	protected HttpServletRequest getRequest() {
		return ServletActionContext.getRequest();
	}

	/**
	 * 获取HttpSevletResponse
	 * 
	 * @return
	 */
	protected HttpServletResponse getResponse() {
		return ServletActionContext.getResponse();
	}

	/**
	 * 获取Session
	 * 
	 * @return
	 */
	protected HttpSession getSession() {
		return this.getRequest().getSession();
	}

	public class NameComparator implements Comparator {
		public int compare(Object a, Object b) {
			Hashtable hashA = (Hashtable) a;
			Hashtable hashB = (Hashtable) b;
			if (((Boolean) hashA.get("is_dir"))
					&& !((Boolean) hashB.get("is_dir"))) {
				return -1;
			} else if (!((Boolean) hashA.get("is_dir"))
					&& ((Boolean) hashB.get("is_dir"))) {
				return 1;
			} else {
				return ((String) hashA.get("filename"))
						.compareTo((String) hashB.get("filename"));
			}
		}
	}

	public class SizeComparator implements Comparator {
		public int compare(Object a, Object b) {
			Hashtable hashA = (Hashtable) a;
			Hashtable hashB = (Hashtable) b;
			if (((Boolean) hashA.get("is_dir"))
					&& !((Boolean) hashB.get("is_dir"))) {
				return -1;
			} else if (!((Boolean) hashA.get("is_dir"))
					&& ((Boolean) hashB.get("is_dir"))) {
				return 1;
			} else {
				if (((Long) hashA.get("filesize")) > ((Long) hashB
						.get("filesize"))) {
					return 1;
				} else if (((Long) hashA.get("filesize")) < ((Long) hashB
						.get("filesize"))) {
					return -1;
				} else {
					return 0;
				}
			}
		}
	}

	public class TypeComparator implements Comparator {
		public int compare(Object a, Object b) {
			Hashtable hashA = (Hashtable) a;
			Hashtable hashB = (Hashtable) b;
			if (((Boolean) hashA.get("is_dir"))
					&& !((Boolean) hashB.get("is_dir"))) {
				return -1;
			} else if (!((Boolean) hashA.get("is_dir"))
					&& ((Boolean) hashB.get("is_dir"))) {
				return 1;
			} else {
				return ((String) hashA.get("filetype"))
						.compareTo((String) hashB.get("filetype"));
			}
		}
	}

	public File getImgFile() {
		return imgFile;
	}

	public void setImgFile(File imgFile) {
		this.imgFile = imgFile;
	}

	public String getImgFileFileName() {
		return imgFileFileName;
	}

	public void setImgFileFileName(String imgFileFileName) {
		this.imgFileFileName = imgFileFileName;
	}

	public String getDir() {
		return dir;
	}

	public void setDir(String dir) {
		this.dir = dir;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}
}
