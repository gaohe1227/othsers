package com.doadway.dwcms.assistant.pojo;

import java.io.Serializable;
import java.util.Date;

public class Advertising implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 5775661353131988406L;

	private Integer advertisingId;

    private Integer adspaceId;

    private Integer siteId;

    private String adName;

    private String category;

    private Integer adWeight;

    private Long displayCount;

    private Long clickCount;

    private Date startTime;

    private Date endTime;

    private String isEnabled;

    private String adCode;

    public Integer getAdvertisingId() {
        return advertisingId;
    }

    public void setAdvertisingId(Integer advertisingId) {
        this.advertisingId = advertisingId;
    }

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

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category == null ? null : category.trim();
    }

    public Integer getAdWeight() {
        return adWeight;
    }

    public void setAdWeight(Integer adWeight) {
        this.adWeight = adWeight;
    }

    public Long getDisplayCount() {
        return displayCount;
    }

    public void setDisplayCount(Long displayCount) {
        this.displayCount = displayCount;
    }

    public Long getClickCount() {
        return clickCount;
    }

    public void setClickCount(Long clickCount) {
        this.clickCount = clickCount;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public String getIsEnabled() {
        return isEnabled;
    }

    public void setIsEnabled(String isEnabled) {
        this.isEnabled = isEnabled == null ? null : isEnabled.trim();
    }

    public String getAdCode() {
        return adCode;
    }

    public void setAdCode(String adCode) {
        this.adCode = adCode == null ? null : adCode.trim();
    }
}