package com.doadway.dwcms.core.content.pojo;

import java.io.Serializable;

public class ContentChannelKey implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 989577612217207313L;

	private Integer channelId;

    private Integer contentId;

    public Integer getChannelId() {
        return channelId;
    }

    public void setChannelId(Integer channelId) {
        this.channelId = channelId;
    }

    public Integer getContentId() {
        return contentId;
    }

    public void setContentId(Integer contentId) {
        this.contentId = contentId;
    }
}