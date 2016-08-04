package net.zz.sys.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import net.zz.utils.StringUtils;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

/**
 * 系统日志
 * <b><code></code></b>
 * <p/>
 * Comment here
 * <p/>
 * <b>Creation Time:</b> 2014年5月23日
 * @author ZhangZhen
 * @version 1.0
 *
 * @since datamg 1.0
 */
@Entity
@DynamicInsert(true)
@DynamicUpdate(true)
@Table(name = "sys_log")
@SuppressWarnings("serial")
public class Log implements Serializable {
	/**日志ID*/
	private String id;
	/**操作用户名*/
	private String loginName;
	/**操作模块名称*/
	private String moduleName;
	/**操作类型*/
	private String operation;
	/**操作IP*/
	private String ipAddress;
	/**模块地址*/
	private String moduleUrl;
	/**操作条件*/
	private String record;
	/**操作时间*/
	private Date createTime;
	
	@Id
	@Column(nullable=false,length=32,unique=true)
	public String getId() {
		if(StringUtils.isEmpty(id)){
			return StringUtils.getUUID();
		}
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Column(length=50,name="module_name")
	public String getModuleName() {
		return moduleName;
	}
	@Column(length=20,name="login_name")
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}
	@Column(length=50,name="operation")
	public String getOperation() {
		return operation;
	}
	public void setOperation(String operation) {
		this.operation = operation;
	}
	@Column(length=15,nullable=false,name="ip_address")
	public String getIpAddress() {
		return ipAddress;
	}
	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}
	@Column(name="module_url")
	public String getModuleUrl() {
		return moduleUrl;
	}
	public void setModuleUrl(String moduleUrl) {
		this.moduleUrl = moduleUrl;
	}
	@Column(name="record",length=800)
	public String getRecord() {
		return record;
	}
	public void setRecord(String record) {
		this.record = record;
	}
	@Temporal(TemporalType.TIMESTAMP)
	@Column
	public Date getCreateTime() {
		if(null == this.createTime){
			return new Date(System.currentTimeMillis());
		}
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
}
