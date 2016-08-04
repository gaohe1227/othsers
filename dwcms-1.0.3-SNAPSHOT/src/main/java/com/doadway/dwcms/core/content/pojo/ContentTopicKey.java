package com.doadway.dwcms.core.content.pojo;

import java.io.Serializable;

public class ContentTopicKey implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = -8377026296949170592L;

	private Integer contentId;

    private Integer topicId;

    public Integer getContentId() {
        return contentId;
    }

    public void setContentId(Integer contentId) {
        this.contentId = contentId;
    }

    public Integer getTopicId() {
        return topicId;
    }

    public void setTopicId(Integer topicId) {
        this.topicId = topicId;
    }
}