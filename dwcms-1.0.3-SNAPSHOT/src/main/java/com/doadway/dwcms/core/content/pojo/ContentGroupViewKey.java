package com.doadway.dwcms.core.content.pojo;

import java.io.Serializable;

public class ContentGroupViewKey implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 6178503131829688914L;

	private Integer contentId;

    private Integer groupId;

    public Integer getContentId() {
        return contentId;
    }

    public void setContentId(Integer contentId) {
        this.contentId = contentId;
    }

    public Integer getGroupId() {
        return groupId;
    }

    public void setGroupId(Integer groupId) {
        this.groupId = groupId;
    }
}