package com.doadway.dwcms.core.channel.pojo;

import java.io.Serializable;

public class ChannelUserKey implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer channelId;

    private Integer userId;

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
}