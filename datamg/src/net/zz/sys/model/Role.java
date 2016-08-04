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
import javax.persistence.Table;

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
@Table(name = "sys_role")
public class Role implements Serializable {
	/**角色ID*/
	private String id;
	/**角色名称*/
	private String name;
	/**角色描述*/
	private String description;
	/**角色和菜单多对多*/
	private Set<Menu> menus = new HashSet<Menu>();
	/**用户和角色多对多*/
	private Set<LoginUser> users = new HashSet<LoginUser>();
	
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
	
	@Column(length=50)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Column(length=200)
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	@ManyToMany(fetch=FetchType.LAZY)
	@JoinTable(name="sys_rolemenu",joinColumns={@JoinColumn(name="role_id")},inverseJoinColumns={@JoinColumn(name="menu_id")})
	public Set<Menu> getMenus() {
		return menus;
	}
	public void setMenus(Set<Menu> menus) {
		this.menus = menus;
	}
	@ManyToMany(fetch=FetchType.LAZY,cascade=CascadeType.ALL)
	@JoinTable(name="sys_userrole",joinColumns={@JoinColumn(name="role_id")},inverseJoinColumns={@JoinColumn(name="user_id")})
	public Set<LoginUser> getUsers() {
		return users;
	}
	public void setUsers(Set<LoginUser> users) {
		this.users = users;
	}
}
