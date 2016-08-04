package net.zz.sys.model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
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
@Table(name = "sys_menu")
public class Menu implements Serializable {
	/** 菜单 */
	private String id;
	/** 菜单名称 */
	private String name;
	/** 菜单连接地址 */
	private String href;
	/** 菜单描述 */
	private String description;
	/** 是否是最后级菜单 */
	private Boolean isleaf = false;
	/**url跳转类型*/
	private String skipType = "href";
	/** 菜单序号 */
	private Integer sort;
	/** 父菜单 */
	private Menu parentMenu;
	/** 子单位集合 */
	private Set<Menu> subMenus = new HashSet<Menu>();
	/** 菜单类型 1 菜单 0 是功能 */
	private Integer type = 1;
	/** 父菜单ID */
	private String parentId;
	/**菜单和角色多对多**/
	private Set<Role> roles = new HashSet<Role>();
	/**功能菜单和用户多对多*/
	private Set<LoginUser> users = new HashSet<LoginUser>();

	@Id
	@Column(unique=true, nullable=false, length=32)
	public String getId() {
		if (StringUtils.isEmpty(this.id)) {
			return StringUtils.getTimeString();
		}
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Column(length = 50)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(length = 200, nullable = true)
	public String getHref() {
		return href;
	}

	public void setHref(String href) {
		this.href = href;
	}

	@Column(length = 500, nullable = true)
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column
	public Boolean getIsleaf() {
		return isleaf;
	}

	public void setIsleaf(Boolean isleaf) {
		this.isleaf = isleaf;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "parentMenuId", nullable = true)
	public Menu getParentMenu() {
		return parentMenu;
	}

	public void setParentMenu(Menu parentMenu) {
		this.parentMenu = parentMenu;
	}

	@OneToMany(mappedBy = "parentMenu",fetch = FetchType.LAZY,cascade=CascadeType.ALL)
	public Set<Menu> getSubMenus() {
		return subMenus;
	}

	public void setSubMenus(Set<Menu> subMenus) {
		this.subMenus = subMenus;
	}

	@Column
	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	@Column(length=10)
	public String getSkipType() {
		return skipType;
	}

	public void setSkipType(String skipType) {
		this.skipType = skipType;
	}

	@Column
	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	@Transient  //数据库不维护字段
	public String getParentId() {
		if(null!=this.parentMenu){
			return this.getParentMenu().getId();
		}
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	@ManyToMany(fetch=FetchType.LAZY)
	@JoinTable(name="sys_rolemenu",joinColumns={@JoinColumn(name="menu_id")},inverseJoinColumns={@JoinColumn(name="role_id")})
	public Set<Role> getRoles() {
		return roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

	@ManyToMany(fetch=FetchType.LAZY,cascade=CascadeType.ALL)
	@JoinTable(name="sys_privilege",joinColumns={@JoinColumn(name="menu_id")},inverseJoinColumns={@JoinColumn(name="user_id")})
	public Set<LoginUser> getUsers() {
		return users;
	}

	public void setUsers(Set<LoginUser> users) {
		this.users = users;
	}

}
