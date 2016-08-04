package com.doadway.dwcms.core.channel.pojo;

import java.io.Serializable;

public class ChannelAttr implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 2532888849257121210L;

	private Integer channelId;

    private String attrName;

    private String attrValue;

    public Integer getChannelId() {
        return channelId;
    }

    public void setChannelId(Integer channelId) {
        this.channelId = channelId;
    }

    public String getAttrName() {
        return attrName;
    }

    public void setAttrName(String attrName) {
        this.attrName = attrName == null ? null : attrName.trim();
    }

    public String getAttrValue() {
        return attrValue;
    }

    public void setAttrValue(String attrValue) {
        this.attrValue = attrValue == null ? null : attrValue.trim();
    }
}