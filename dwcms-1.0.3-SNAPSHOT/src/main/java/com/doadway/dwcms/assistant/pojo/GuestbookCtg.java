package com.doadway.dwcms.assistant.pojo;

import java.io.Serializable;

public class GuestbookCtg implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = -7970808412004372991L;

	private Integer guestbookctgId;

    private Integer siteId;

    private String ctgName;

    private Integer priority;

    private String description;

    public Integer getGuestbookctgId() {
        return guestbookctgId;
    }

    public void setGuestbookctgId(Integer guestbookctgId) {
        this.guestbookctgId = guestbookctgId;
    }

    public Integer getSiteId() {
        return siteId;
    }

    public void setSiteId(Integer siteId) {
        this.siteId = siteId;
    }

    public String getCtgName() {
        return ctgName;
    }

    public void setCtgName(String ctgName) {
        this.ctgName = ctgName == null ? null : ctgName.trim();
    }

    public Integer getPriority() {
        return priority;
    }

    public void setPriority(Integer priority) {
        this.priority = priority;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }
}