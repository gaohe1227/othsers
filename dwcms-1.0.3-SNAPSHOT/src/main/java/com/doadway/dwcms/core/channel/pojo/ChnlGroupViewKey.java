package com.doadway.dwcms.core.channel.pojo;

import java.io.Serializable;

public class ChnlGroupViewKey implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = -2793212170842032520L;

	private Integer channelId;

    private Integer groupId;

    public Integer getChannelId() {
        return channelId;
    }

    public void setChannelId(Integer channelId) {
        this.channelId = channelId;
    }

    public Integer getGroupId() {
        return groupId;
    }

    public void setGroupId(Integer groupId) {
        this.groupId = groupId;
    }
}