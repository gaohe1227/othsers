package com.doadway.dwcms.core.content.pojo;

import java.io.Serializable;

public class ContentTagRelate implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6101520389895584037L;

	private Integer contentId;

    private Integer tagId;

    private Integer priority;

    public Integer getContentId() {
        return contentId;
    }

    public void setContentId(Integer contentId) {
        this.contentId = contentId;
    }

    public Integer getTagId() {
        return tagId;
    }

    public void setTagId(Integer tagId) {
        this.tagId = tagId;
    }

    public Integer getPriority() {
        return priority;
    }

    public void setPriority(Integer priority) {
        this.priority = priority;
    }
}