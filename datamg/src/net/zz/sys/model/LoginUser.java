package net.zz.sys.model;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import net.zz.utils.StringUtils;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

/**
 * 
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
@SuppressWarnings("serial")
@Entity
@DynamicInsert(true)
@DynamicUpdate(true)
@Table(name = "sys_loginuser")
public class LoginUser implements Serializable {
	/**登录ID*/
	private String id;
	/**登录名*/
	private String loginName;
	/**登录密码*/
	private String password;
	/**是否锁定*/
	private Boolean isLock = false;
	/**用户类型*/
	private Integer type = 0;  /**0 超级管理员*/  
	/**创建时间*/
	private Date createTime;
	/**用户描述*/
	private String description;
	/**登录用户和角色多对多*/
	private Set<Role> roles = new HashSet<Role>();
	/***角色ID,中间逗号分隔*/
	private String roleIds;
	/**用户和菜单功能多对多*/
	private Set<Menu> menus = new HashSet<Menu>();
	
	@Id
	@Column(length=32,nullable=false,unique=true)
	public String getId() {
		if (StringUtils.isEmpty(this.id)) {
			return StringUtils.getTimeString();
		}
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	@Column(unique=true,nullable=false,length=30)
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	@Column(length=64)
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Column
	public Boolean getIsLock() {
		return isLock;
	}
	public void setIsLock(Boolean isLock) {
		this.isLock = isLock;
	}
	@Temporal(TemporalType.TIMESTAMP)
	@Column
	public Date getCreateTime() {
		return createTime;
	}
	
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	@ManyToMany(fetch=FetchType.LAZY)
	@JoinTable(name="sys_userrole",joinColumns={@JoinColumn(name="user_id")},inverseJoinColumns={@JoinColumn(name="role_id")})
	public Set<Role> getRoles() {
		return roles;
	}
	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}
	@Column(length=200,nullable=true)
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	@Column(nullable=false)
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	@ManyToMany(fetch=FetchType.LAZY,cascade=CascadeType.ALL)
	@JoinTable(name="sys_privilege",joinColumns={@JoinColumn(name="user_id")},inverseJoinColumns={@JoinColumn(name="menu_id")})
	public Set<Menu> getMenus() {
		return menus;
	}
	public void setMenus(Set<Menu> menus) {
		this.menus = menus;
	}
	@Transient //数据库不维护字段
	public String getRoleIds() {
		if(null!=this.roles && this.roles.size()>0 && StringUtils.isEmpty(this.roleIds)){
			Iterator<Role> it = roles.iterator();
			String roleIds="";
			while(it.hasNext()){
				Role role = it.next();
				if(!"".equals(roleIds)){
					roleIds+=",";
				}
				roleIds+=role.getId();
			}
			return roleIds;
		}
		return roleIds;
	}
	public void setRoleIds(String roleIds) {
		this.roleIds = roleIds;
	}
}
