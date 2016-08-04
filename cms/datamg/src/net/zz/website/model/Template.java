package net.zz.website.model;

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
@Entity
@Table(name = "ws_template")
@DynamicInsert(true)
@DynamicUpdate(true)
@SuppressWarnings("serial")
public class Template implements Serializable {
	/** 模板ID */
	private String id;
	/** 模板名称 */
	private String name;
	/** 模板内容 */
	private String content;
	/** 创建时间 */
	private Date createTime;
	/** 描述 */
	private String description;

	@Id
	@Column(length = 32, unique = true, nullable = false)
	public String getId() {
		if (StringUtils.isEmpty(id)) {
			return StringUtils.getTimeString();
		}
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Column(length=20,nullable=false)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	
	@Column(nullable=false,columnDefinition="TEXT")
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Column(length=200)
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
}
