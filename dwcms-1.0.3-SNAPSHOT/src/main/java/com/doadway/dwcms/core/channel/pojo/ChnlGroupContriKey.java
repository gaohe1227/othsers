package com.doadway.dwcms.core.channel.pojo;

import java.io.Serializable;

public class ChnlGroupContriKey implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1087602270747205663L;

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