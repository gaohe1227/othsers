package net.zz.data.model;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
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
@Table(name="d_units")
public class BaseUnit implements Serializable {
	/**单位ID*/
	private String id;
	/**单位名称*/
	private String name;
	/**单位编码*/
	private String serialNumber;
	/**父单位*/
	private BaseUnit parentUnit;
	/**子单位集合*/
	private Set<BaseUnit> subUnits = new HashSet<BaseUnit>();
	/**描述说明*/
	private String description;
	/**是否是最后级单位*/
	private Boolean isleaf;
	/**父单位ID*/
	private String parentId;
	/**创建时间*/
	private Date createTime;
	/**机构用户一对多*/
	private Set<BaseUser> users = new HashSet<BaseUser>();

	@Id
	@Column(length=32)
	public String getId() {
		if(StringUtils.isEmpty(id)){
			return StringUtils.getTimeString();
		}
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Column(length=50,nullable=false)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(length=50,nullable=false)
	public String getSerialNumber() {
		return serialNumber;
	}

	public void setSerialNumber(String serialNumber) {
		this.serialNumber = serialNumber;
	}

	@ManyToOne(cascade=CascadeType.REFRESH,fetch=FetchType.LAZY)
	@JoinColumn(name="parentUnitId",nullable=true)
	public BaseUnit getParentUnit() {
		return parentUnit;
	}

	public void setParentUnit(BaseUnit parentUnit) {
		this.parentUnit = parentUnit;
	}

	@OneToMany(mappedBy="parentUnit",cascade=CascadeType.ALL,fetch=FetchType.LAZY)
	public Set<BaseUnit> getSubUnits() {
		return subUnits;
	}

	public void setSubUnits(Set<BaseUnit> subUnits) {
		this.subUnits = subUnits;
	}

	@Column(length=500,nullable=true)
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

	@Transient
	public String getParentId() {
		if(null!=this.parentUnit){
			return this.parentUnit.getId();
		}
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	@Column
	@Temporal(TemporalType.TIMESTAMP)
	public Date getCreateTime() {
		if(null==this.createTime){
			return new Date(System.currentTimeMillis());
		}
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@OneToMany(mappedBy="unit",cascade=CascadeType.ALL,fetch=FetchType.LAZY)
	public Set<BaseUser> getUsers() {
		return users;
	}

	public void setUsers(Set<BaseUser> users) {
		this.users = users;
	}
}
