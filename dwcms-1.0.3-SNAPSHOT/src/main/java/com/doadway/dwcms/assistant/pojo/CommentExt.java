package com.doadway.dwcms.assistant.pojo;

import java.io.Serializable;

public class CommentExt implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = -2171362871065591405L;

	private Integer commentId;

    private String ip;

    public Integer getCommentId() {
        return commentId;
    }

    public void setCommentId(Integer commentId) {
        this.commentId = commentId;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip == null ? null : ip.trim();
    }
}