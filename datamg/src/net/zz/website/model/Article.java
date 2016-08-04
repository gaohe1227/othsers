package net.zz.website.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
@Table(name = "ws_article")
@DynamicInsert(true)
@DynamicUpdate(true)
@SuppressWarnings("serial")
public class Article implements Serializable {
	/**文章ID*/
	private String id;
	/**文章标题*/
	private String title;
	/**文章作者*/
	private String author;
	/**文章类型 0 原创  1 转载*/
	private String type;
	/**文章内容*/
	private String content;
	/**文章分类*/
	private Category category;
	/**创建时间*/
	private Date createTime;
	/**评论条数*/
	private Integer reviewNum = 0;
	/**浏览次数*/
	private Integer browseNum = 0;
	/**文章附件路径 */
	private String accUrl;
	
	@Id
	@Column(unique=true,nullable=false,length=32)
	public String getId() {
		if(StringUtils.isEmpty(this.id)){
			return StringUtils.getTimeString();
		}
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Column(nullable = false,length=100)
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	@Column(nullable=false,length=20)
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	@Column
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	@Column(nullable=false,columnDefinition="TEXT")
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="categoryId")
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
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
	@Column(nullable=false)
	public Integer getReviewNum() {
		return reviewNum;
	}
	public void setReviewNum(Integer reviewNum) {
		this.reviewNum = reviewNum;
	}
	@Column(nullable=false)
	public Integer getBrowseNum() {
		return browseNum;
	}
	public void setBrowseNum(Integer browseNum) {
		this.browseNum = browseNum;
	}
	@Column(length=400)
	public String getAccUrl() {
		return accUrl;
	}
	public void setAccUrl(String accUrl) {
		this.accUrl = accUrl;
	}
}
