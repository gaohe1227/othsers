package com.doadway.dwcms.assistant.pojo;

import java.io.Serializable;

public class Friendlink implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 7333295477770067882L;

	private Integer friendlinkId;

    private Integer siteId;

    private Integer friendlinkctgId;

    private String siteName;

    private String domain;

    private String logo;

    private String email;

    private String description;

    private Integer views;

    private String isEnabled;

    private Integer priority;

    public Integer getFriendlinkId() {
        return friendlinkId;
    }

    public void setFriendlinkId(Integer friendlinkId) {
        this.friendlinkId = friendlinkId;
    }

    public Integer getSiteId() {
        return siteId;
    }

    public void setSiteId(Integer siteId) {
        this.siteId = siteId;
    }

    public Integer getFriendlinkctgId() {
        return friendlinkctgId;
    }

    public void setFriendlinkctgId(Integer friendlinkctgId) {
        this.friendlinkctgId = friendlinkctgId;
    }

    public String getSiteName() {
        return siteName;
    }

    public void setSiteName(String siteName) {
        this.siteName = siteName == null ? null : siteName.trim();
    }

    public String getDomain() {
        return domain;
    }

    public void setDomain(String domain) {
        this.domain = domain == null ? null : domain.trim();
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo == null ? null : logo.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public Integer getViews() {
        return views;
    }

    public void setViews(Integer views) {
        this.views = views;
    }

    public String getIsEnabled() {
        return isEnabled;
    }

    public void setIsEnabled(String isEnabled) {
        this.isEnabled = isEnabled == null ? null : isEnabled.trim();
    }

    public Integer getPriority() {
        return priority;
    }

    public void setPriority(Integer priority) {
        this.priority = priority;
    }
}