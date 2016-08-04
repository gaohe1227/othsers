package com.doadway.dwcms.core.content.pojo;

import java.io.Serializable;
import java.util.Date;

public class Content implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = -7075132393517914544L;

	private Integer contentId;

    private Integer channelId;

    private Integer userId;

    private Integer typeId;

    private Integer siteId;

    private Date sortDate;

    private Byte topLevel;

    private Boolean hasTitleImg;

    private Boolean isRecommend;

    private Byte status;

    private Integer viewsDay;

    private Short commentsDay;

    private Short downloadsDay;

    private Short upsDay;
    
    private ContentExt contentExt;
    public Integer getContentId() {
        return contentId;
    }

    public void setContentId(Integer contentId) {
        this.contentId = contentId;
    }

    public Integer getChannelId() {
        return channelId;
    }

    public void setChannelId(Integer channelId) {
        this.channelId = channelId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    public Integer getSiteId() {
        return siteId;
    }

    public void setSiteId(Integer siteId) {
        this.siteId = siteId;
    }

    public Date getSortDate() {
        return sortDate;
    }

    public void setSortDate(Date sortDate) {
        this.sortDate = sortDate;
    }

    public Byte getTopLevel() {
        return topLevel;
    }

    public void setTopLevel(Byte topLevel) {
        this.topLevel = topLevel;
    }

    public Boolean getHasTitleImg() {
        return hasTitleImg;
    }

    public void setHasTitleImg(Boolean hasTitleImg) {
        this.hasTitleImg = hasTitleImg;
    }

    public Boolean getIsRecommend() {
        return isRecommend;
    }

    public void setIsRecommend(Boolean isRecommend) {
        this.isRecommend = isRecommend;
    }

    public Byte getStatus() {
        return status;
    }

    public void setStatus(Byte status) {
        this.status = status;
    }

    public Integer getViewsDay() {
        return viewsDay;
    }

    public void setViewsDay(Integer viewsDay) {
        this.viewsDay = viewsDay;
    }

    public Short getCommentsDay() {
        return commentsDay;
    }

    public void setCommentsDay(Short commentsDay) {
        this.commentsDay = commentsDay;
    }

    public Short getDownloadsDay() {
        return downloadsDay;
    }

    public void setDownloadsDay(Short downloadsDay) {
        this.downloadsDay = downloadsDay;
    }

    public Short getUpsDay() {
        return upsDay;
    }

    public void setUpsDay(Short upsDay) {
        this.upsDay = upsDay;
    }

	public ContentExt getContentExt() {
		return contentExt;
	}

	public void setContentExt(ContentExt contentExt) {
		this.contentExt = contentExt;
	}
    
}