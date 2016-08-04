package net.zz.utils.base.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.zz.sys.model.Log;
import net.zz.sys.service.LogService;
import net.zz.utils.IpUtil;
import net.zz.utils.JSONUtils;
import net.zz.utils.StringUtils;
import net.zz.utils.base.service.BaseServiceI;
import net.zz.utils.base.vo.Grid;
import net.zz.utils.base.vo.Json;
import net.zz.utils.filter.HqlFilter;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;

/**
 * Action基类
 * <b><code></code></b>
 * <p/>
 * Comment here
 * <p/>
 * <b>Creation Time:</b> 2014年5月11日
 * @author ZhangZhen
 * @version 1.0
 *
 * @since datamg 1.0
 */
@SuppressWarnings({ "serial" })
@ParentPackage("defaultPackage")
@Namespace("/")
@Action
public class BaseAction<T> extends ActionSupport {
	/** 对象集合 */
	protected List<T> dataList = null;
	/** 对象 */
	protected T data;
	/**ID*/
	protected String id;
	/**IDS*/
	protected String ids;
	/**easyui grid传递的当前页数*/
	protected Integer page;
	/**easyui grid 传递的每页显示记录数目*/
	protected Integer rows;

	protected BaseServiceI<T> service;
	
	/**
	 * 新增数据
	 * 
	 */
	public void save() {
		Json json = new Json();
		json.setMsg("新增失败!");
		if (null != this.data) {
			service.save(this.data);
			json.setSuccess(true);
			json.setMsg("新增成功!");
		}
		this.addSysLog(Opt.添加一条记录, json.getMsg());
		WriteJSON(JSONUtils.ObjectToJson(json));
	}
	
	/**
	 * 修改数据
	 * 
	 */
	public void update(){
		Json json = new Json();
		json.setMsg("修改失败!");
		if (null != this.data) {
			service.update(this.data);
			json.setSuccess(true);
			json.setMsg("修改成功!");
		}
		this.addSysLog(Opt.修改一条记录, json.getMsg());
		WriteJSON(JSONUtils.ObjectToJson(json));
	}
	
	/**
	 * 删除一行
	 */
	public void delete(){
		Json json = new Json();
		json.setMsg("删除失败!");
		if (!StringUtils.isEmpty(id)) {
			T t = service.getById(this.id);
			service.delete(t);
			json.setSuccess(true);
			json.setMsg("删除成功!");
		}
		this.addSysLog(Opt.删除一条记录, "ID:"+this.id);
		WriteJSON(JSONUtils.ObjectToJson(json));
	}
	
	/**
	 * 批量删除
	 */
	public void deleteAll(){
		Json json = new Json();
		json.setMsg("批量删除失败!");
		if (!StringUtils.isEmpty(ids)) {
			List<T> pos = new ArrayList<T>();
			for(String id:ids.split(",")){
				T t = service.getById(id);
				pos.add(t);
			}
			service.deleteBatch(pos);
			json.setSuccess(true);
			json.setMsg("批量删除成功!");
		}
		this.addSysLog(Opt.批量删除, "IDS:"+this.ids);
		WriteJSON(JSONUtils.ObjectToJson(json));
	}
	
	/**
	 * 根据ID获取对象
	 */
	public void getById(){
		if(!StringUtils.isEmpty(this.id)){
			this.data = service.getById(this.id);
			this.addSysLog(Opt.查询一条记录, "ID:"+this.id);
			WriteJSON(JSONUtils.ObjectToJson(this.data));
		}else{
			Json json = new Json();
			json.setMsg("主键不可为空!");
			this.addSysLog(Opt.查询一条记录, "ID:"+json.getMsg());
			WriteJSON(JSONUtils.ObjectToJson(json));
		}
	}
	
	/**
	 * 查询grid数据列表分页
	 * 
	 */
	public void grid(){
		Grid grid = new Grid();
		HqlFilter hqlFilter = new HqlFilter(getRequest()); //参数过滤器
		grid.setTotal(service.countByFilter(hqlFilter));
		grid.setRows(service.findByFilter(hqlFilter, page, rows));
		this.addSysLog(Opt.查询列表分页记录, "SQL查询条件"+hqlFilter.getWhereAndOrderSql());
		WriteJSON(JSONUtils.ObjectToJson(grid));
	}
	
	/**
	 * 查询grid数据列表
	 */
	public void gridAll(){
		Grid grid = new Grid();
		HqlFilter hqlFilter = new HqlFilter(getRequest()); //参数过滤器
		this.dataList = service.findByFilter(hqlFilter);
		this.addSysLog(Opt.查询列表记录, "SQL查询条件"+hqlFilter.getWhereAndOrderSql());
		grid.setRows(dataList);
		grid.setTotal((long)dataList.size());
		WriteJSON(JSONUtils.ObjectToJson(grid));
	}
	
	/**
	 * 获得treeGrid不分页
	 */
	public void treeGrid() {
		Grid grid = new Grid();
		HqlFilter hqlFilter = new HqlFilter(getRequest());
		this.dataList = service.findByFilter(hqlFilter);
		this.addSysLog(Opt.查询树列表, "SQL查询条件"+hqlFilter.getWhereAndOrderSql());
		grid.setRows(this.dataList);
		grid.setTotal((long)this.dataList.size());
		WriteJSON(JSONUtils.ObjectToJson(grid));
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

	/**
	 * 获取servletContext
	 * 
	 * @return
	 */
	protected ServletContext getServletContext() {
		return ServletActionContext.getServletContext();
	}

	public List<T> getDataList() {
		return dataList;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getRows() {
		return rows;
	}

	public void setRows(Integer rows) {
		this.rows = rows;
	}
	
	/**模块名称*/
	protected String serviceName;
	
	protected enum Opt{
		添加一条记录,删除一条记录,批量删除,修改一条记录,查询树列表,查询列表记录,查询列表分页记录,查询一条记录,通过条件查询记录,通过条件查询分页记录,登录系统,导入数据,导出数据,重置登录密码,修改密码,退出系统,用户授权,角色授权
	}

	@Autowired
	private LogService logService;
	/**
	 * 添加日志记录
	 * comment here
	 * @since datamg 1.0
	 */
	public void addSysLog(Opt operation,String record){
		Log log = new Log();
		String loginName = (String)this.getSession().getAttribute("loginName");
		log.setLoginName(null!=loginName?loginName:"未知用户");
		log.setModuleName(this.serviceName);
		log.setIpAddress(IpUtil.getIpAddr(this.getRequest()));
		log.setModuleUrl(this.getRequest().getRequestURI());
		log.setOperation(operation.toString());
		log.setRecord(record);
		logService.save(log);
	}
}
