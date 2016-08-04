package net.zz.website.model;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

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
@Entity
@Table(name = "ws_category")
@DynamicInsert(true)
@DynamicUpdate(true)
@SuppressWarnings("serial")
public class Category implements Serializable {
	/** 分类ID */
	private String id;
	/** 分类名称 */
	private String name;
	/** 描述 */
	private String description;
	/** 创建时间 */
	private Date createTime;
	/** 父级分类 */
	private Category parentCategory;
	/** 自身一对多 */
	private Set<Category> childCategories = new HashSet<Category>();
	/** 父级ID */
	private String parentId;
	/**文章集合*/
	private Set<Article> articles = new HashSet<Article>();

	@Id
	@Column(length = 32, nullable = false, unique = true)
	public String getId() {
		if (StringUtils.isEmpty(id)) {
			return StringUtils.getTimeString();
		}
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Column(length = 50, nullable = false)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(length = 200, nullable = true)
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column
	public Date getCreateTime() {
		if(null==this.createTime){
			return new Date(System.currentTimeMillis());
		}
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "parentCategoryId", nullable = true)
	public Category getParentCategory() {
		return parentCategory;
	}

	public void setParentCategory(Category parentCategory) {
		this.parentCategory = parentCategory;
	}

	@OneToMany(mappedBy = "parentCategory", fetch = FetchType.LAZY)
	public Set<Category> getChildCategories() {
		return childCategories;
	}

	public void setChildCategories(Set<Category> childCategories) {
		this.childCategories = childCategories;
	}

	@Transient
	public String getParentId() {
		if (null != this.parentCategory) {
			return this.parentCategory.getId();
		}
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	@OneToMany(mappedBy="category",fetch=FetchType.LAZY)
	public Set<Article> getArticles() {
		return articles;
	}

	public void setArticles(Set<Article> articles) {
		this.articles = articles;
	}
}
