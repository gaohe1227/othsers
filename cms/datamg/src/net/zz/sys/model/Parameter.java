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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import net.zz.utils.StringUtils;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

/**
 * 系统参数表
 * <b><code></code></b>
 * <p/>
 * Comment here
 * <p/>
 * <b>Creation Time:</b> 2014年5月31日
 * @author ZhangZhen
 * @version 1.0
 *
 * @since datamg 1.0
 */
@Entity
@DynamicInsert(true)
@DynamicUpdate(true)
@Table(name = "sys_parameters")
@SuppressWarnings("serial")
public class Parameter implements Serializable {
	/**ID*/
	private String id;
	/**参数名称*/
	private String name;
	/**参数值*/
	private String code;
	/**参数描述*/
	private String description;
	/**自身一对多*/
	private Parameter parentParameter;
	private Set<Parameter> parameters = new HashSet<Parameter>();
	/**数据库不维护字段**/
	private String parentId;
	
	@Id
	@Column(length=32,nullable=false,unique=true)
	public String getId() {
		if(StringUtils.isEmpty(id)){
			return StringUtils.getTimeString();
		}
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Column(length=30)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Column(length=40)
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	@Column(length=200)
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="parentParameterId")
	public Parameter getParentParameter() {
		return parentParameter;
	}
	public void setParentParameter(Parameter parentParameter) {
		this.parentParameter = parentParameter;
	}
	@OneToMany(fetch=FetchType.LAZY,cascade=CascadeType.ALL,mappedBy="parentParameter")
	public Set<Parameter> getParameters() {
		return parameters;
	}
	public void setParameters(Set<Parameter> parameters) {
		this.parameters = parameters;
	}
	@Transient
	public String getParentId() {
		if(null!=this.parentParameter){
			return this.parentParameter.getId();
		}
		return parentId;
	}
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
}
