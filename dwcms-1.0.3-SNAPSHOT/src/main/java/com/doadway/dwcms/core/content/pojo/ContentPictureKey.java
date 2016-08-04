package com.doadway.dwcms.core.content.pojo;

import java.io.Serializable;

public class ContentPictureKey implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = -5456279474484729516L;

	private Integer contentId;

    private Integer priority;

    public Integer getContentId() {
        return contentId;
    }

    public void setContentId(Integer contentId) {
        this.contentId = contentId;
    }

    public Integer getPriority() {
        return priority;
    }

    public void setPriority(Integer priority) {
        this.priority = priority;
    }
}