package net.zz.utils.servelt;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.zz.utils.ConfigUtils;
import net.zz.utils.JSONUtils;
import net.zz.utils.StringUtils;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * 组件plupload上传Servelt <b><code></code></b>
 * <p/>
 * Comment here
 * <p/>
 * <b>Creation Time:</b> 2014年9月18日
 * 
 * @author ZhangZhen
 * @version 1.0
 *
 * @since datamg 1.0
 */
@SuppressWarnings("serial")
public class PlUploadServlet extends HttpServlet {
	private static final Log LOG = LogFactory.getLog(PlUploadServlet.class);

	public PlUploadServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String path = ConfigUtils.getConfigValue("uploadPath") +"/"+ StringUtils.dateToString(new Date(), "yyyyMMdd");// 文件在服务器的相对路径+日期命名文件夹
		String realPath = ConfigUtils.getConfigValue("uploadRelaPath") + path;// 文件上传到服务器的真实路径
		LOG.debug("文件上传真实路径="+realPath);
		if (null == request.getSession()
				|| null == request.getSession().getAttribute("userId")) {// 如果用户没有登录，则不允许上传
			Map<String, Object> m = new HashMap<String, Object>();
			m.put("status", false);
			response.getWriter().write(JSONUtils.ObjectToJson(m));
		} else {
			File up = new File(realPath);
			if (!up.exists()) {
				up.mkdirs();
				LOG.debug("创建不存在文件夹完成!");
			}

			response.setCharacterEncoding("UTF-8");
			Integer chunk = null;// 分割块数
			Integer chunks = null;// 总分割数
			String tempFileName = null;// 上传到服务器的临时文件名
			String newFileName = null;// 最后合并后的新文件名
			BufferedOutputStream outputStream = null;
			if (ServletFileUpload.isMultipartContent(request)) {
				try {
					DiskFileItemFactory factory = new DiskFileItemFactory();
					factory.setSizeThreshold(1024);
					// factory.setRepository(new File(repositoryPath));// 设置临时目录
					ServletFileUpload upload = new ServletFileUpload(factory);
					upload.setHeaderEncoding("UTF-8");
					// upload.setSizeMax(5 * 1024 * 1024);//
					// 设置附件最大大小，超过这个大小上传会不成功
					List<FileItem> items = upload.parseRequest(request);
					for (FileItem item : items) {
						if (item.isFormField()) {// 是文本域
							if (item.getFieldName().equals("name")) {
								tempFileName = item.getString();
								// System.out.println("临时文件名：" + tempFileName);
							} else if (item.getFieldName().equals("chunk")) {
								chunk = Integer.parseInt(item.getString());
								// System.out.println("当前文件块：" + (chunk + 1));
							} else if (item.getFieldName().equals("chunks")) {
								chunks = Integer.parseInt(item.getString());
								// System.out.println("文件总分块：" + chunks);
							}
						} else {// 如果是文件类型
							if (tempFileName != null) {
								String chunkName = tempFileName;
								if (chunk != null) {
									chunkName = chunk + "_" + tempFileName;
								}
								File savedFile = new File(realPath, chunkName);
								item.write(savedFile);
							}
						}
					}

					newFileName = StringUtils.getUUID().concat(".").concat(FilenameUtils.getExtension(tempFileName));
					if (chunks == null) {// 如果不分块上传，那么只有一个名称，就是临时文件的名称
						newFileName = tempFileName;
					}
					if (chunk != null && chunk + 1 == chunks) {
						outputStream = new BufferedOutputStream(
								new FileOutputStream(new File(realPath,
										newFileName)));
						// 遍历文件合并
						for (int i = 0; i < chunks; i++) {
							File tempFile = new File(realPath, i + "_"
									+ tempFileName);
							byte[] bytes = FileUtils
									.readFileToByteArray(tempFile);
							outputStream.write(bytes);
							outputStream.flush();
							tempFile.delete();
						}
						outputStream.flush();
					}
					Map<String, Object> m = new HashMap<String, Object>();
					m.put("status", true);
					m.put("fileUrl", path + "/" + newFileName);
					response.getWriter().write(JSONUtils.ObjectToJson(m));
				} catch (FileUploadException e) {
					e.printStackTrace();
					Map<String, Object> m = new HashMap<String, Object>();
					m.put("status", false);
					response.getWriter().write(JSONUtils.ObjectToJson(m));
				} catch (Exception e) {
					e.printStackTrace();
					Map<String, Object> m = new HashMap<String, Object>();
					m.put("status", false);
					response.getWriter().write(JSONUtils.ObjectToJson(m));
				} finally {
					try {
						if (outputStream != null) {
							outputStream.close();
						}
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
	}
}
