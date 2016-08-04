package com.doadway.dwcms.assistant.pojo.dto;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.doadway.dwcms.assistant.pojo.CommentExtWithBLOBs;

public class CommentDTO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 782060179629261149L;

	//comment模块
    private Integer commentId;

    private Integer commentUserId;
    private String  commentUsername="";
    private Integer replyUserId;
    private String  replyUsername="";
    private Integer contentId;
    private String  contentTitle="";
    private Integer siteId;

    private Date createTime;

    private Date replyTime;

    private Short ups;

    private Short downs;

    private Boolean isRecommend;

    private Boolean isChecked;
    
    //comment_ext模块
    private String ip;
    
    private String text;

    private String reply;
    
    private List<CommentExtWithBLOBs> commentExtWithBLOBsList=new ArrayList<CommentExtWithBLOBs>();

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

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

	public String getCommentUsername() {
		return commentUsername;
	}

	public void setCommentUsername(String commentUsername) {
		this.commentUsername = commentUsername;
	}

	public String getReplyUsername() {
		return replyUsername;
	}

	public void setReplyUsername(String replyUsername) {
		this.replyUsername = replyUsername;
	}

	public String getContentTitle() {
		return contentTitle;
	}

	public void setContentTitle(String contentTitle) {
		this.contentTitle = contentTitle;
	}

	public List<CommentExtWithBLOBs> getCommentExtWithBLOBsList() {
		return commentExtWithBLOBsList;
	}

	public void setCommentExtWithBLOBsList(
			List<CommentExtWithBLOBs> commentExtWithBLOBsList) {
		this.commentExtWithBLOBsList = commentExtWithBLOBsList;
	}


    
    
}
