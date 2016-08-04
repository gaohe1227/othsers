package com.doadway.dwcms.assistant.pojo;

import java.io.Serializable;

public class AdvertisingSpace implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 7243244467265004797L;

	private Integer adspaceId;

    private Integer siteId;

    private String adName;

    private String description;

    private String isEnabled;

    public Integer getAdspaceId() {
        return adspaceId;
    }

    public void setAdspaceId(Integer adspaceId) {
        this.adspaceId = adspaceId;
    }

    public Integer getSiteId() {
        return siteId;
    }

    public void setSiteId(Integer siteId) {
        this.siteId = siteId;
    }

    public String getAdName() {
        return adName;
    }

    public void setAdName(String adName) {
        this.adName = adName == null ? null : adName.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public String getIsEnabled() {
        return isEnabled;
    }

    public void setIsEnabled(String isEnabled) {
        this.isEnabled = isEnabled == null ? null : isEnabled.trim();
    }
}