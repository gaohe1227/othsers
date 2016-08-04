package com.doadway.dwcms.assistant.pojo;

import java.io.Serializable;
import java.util.Date;

public class Comment implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = -1070378871228758089L;

	private Integer commentId;

    private Integer commentUserId;

    private Integer replyUserId;

    private Integer contentId;

    private Integer siteId;

    private Date createTime;

    private Date replyTime;

    private Short ups;

    private Short downs;

    private Boolean isRecommend;

    private Boolean isChecked;

    public Integer getCommentId() {
        return commentId;
    }

    public void setCommentId(Integer commentId) {
        this.commentId = commentId;
    }

    public Integer getCommentUserId() {
        return commentUserId;
    }

    public void setCommentUserId(Integer commentUserId) {
        this.commentUserId = commentUserId;
    }

    public Integer getReplyUserId() {
        return replyUserId;
    }

    public void setReplyUserId(Integer replyUserId) {
        this.replyUserId = replyUserId;
    }

    public Integer getContentId() {
        return contentId;
    }

    public void setContentId(Integer contentId) {
        this.contentId = contentId;
    }

    public Integer getSiteId() {
        return siteId;
    }

    public void setSiteId(Integer siteId) {
        this.siteId = siteId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getReplyTime() {
        return replyTime;
    }

    public void setReplyTime(Date replyTime) {
        this.replyTime = replyTime;
    }

    public Short getUps() {
        return ups;
    }

    public void setUps(Short ups) {
        this.ups = ups;
    }

    public Short getDowns() {
        return downs;
    }

    public void setDowns(Short downs) {
        this.downs = downs;
    }

    public Boolean getIsRecommend() {
        return isRecommend;
    }

    public void setIsRecommend(Boolean isRecommend) {
        this.isRecommend = isRecommend;
    }

    public Boolean getIsChecked() {
        return isChecked;
    }

    public void setIsChecked(Boolean isChecked) {
        this.isChecked = isChecked;
    }
}