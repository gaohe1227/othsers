package com.doadway.dwcms.assistant.pojo;

import java.io.Serializable;

public class FriendlinkCtg implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = -915173673877896951L;

	private Integer friendlinkctgId;

    private Integer siteId;

    private String friendlinkctgName;

    private Integer priority;

    public Integer getFriendlinkctgId() {
        return friendlinkctgId;
    }

    public void setFriendlinkctgId(Integer friendlinkctgId) {
        this.friendlinkctgId = friendlinkctgId;
    }

    public Integer getSiteId() {
        return siteId;
    }

    public void setSiteId(Integer siteId) {
        this.siteId = siteId;
    }

    public String getFriendlinkctgName() {
        return friendlinkctgName;
    }

    public void setFriendlinkctgName(String friendlinkctgName) {
        this.friendlinkctgName = friendlinkctgName == null ? null : friendlinkctgName.trim();
    }

    public Integer getPriority() {
        return priority;
    }

    public void setPriority(Integer priority) {
        this.priority = priority;
    }
}