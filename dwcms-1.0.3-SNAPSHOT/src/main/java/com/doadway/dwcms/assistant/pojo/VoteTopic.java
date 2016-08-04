package com.doadway.dwcms.assistant.pojo;

import java.io.Serializable;
import java.util.Date;

public class VoteTopic implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 7030807453598405522L;

	private Integer votetopicId;

    private Integer siteId;

    private String title;

    private String description;

    private Date startTime;

    private Date endTime;

    private Integer repeateHour;

    private Integer totalCount;

    private Integer multiSelect;

    private Boolean isRestrictMember;

    private Boolean isRestrictIp;

    private Boolean isRestrictCookie;

    private Boolean isDisabled;

    private Boolean isDef;

    public Integer getVotetopicId() {
        return votetopicId;
    }

    public void setVotetopicId(Integer votetopicId) {
        this.votetopicId = votetopicId;
    }

    public Integer getSiteId() {
        return siteId;
    }

    public void setSiteId(Integer siteId) {
        this.siteId = siteId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
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

    public Integer getRepeateHour() {
        return repeateHour;
    }

    public void setRepeateHour(Integer repeateHour) {
        this.repeateHour = repeateHour;
    }

    public Integer getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(Integer totalCount) {
        this.totalCount = totalCount;
    }

    public Integer getMultiSelect() {
        return multiSelect;
    }

    public void setMultiSelect(Integer multiSelect) {
        this.multiSelect = multiSelect;
    }

    public Boolean getIsRestrictMember() {
        return isRestrictMember;
    }

    public void setIsRestrictMember(Boolean isRestrictMember) {
        this.isRestrictMember = isRestrictMember;
    }

    public Boolean getIsRestrictIp() {
        return isRestrictIp;
    }

    public void setIsRestrictIp(Boolean isRestrictIp) {
        this.isRestrictIp = isRestrictIp;
    }

    public Boolean getIsRestrictCookie() {
        return isRestrictCookie;
    }

    public void setIsRestrictCookie(Boolean isRestrictCookie) {
        this.isRestrictCookie = isRestrictCookie;
    }

    public Boolean getIsDisabled() {
        return isDisabled;
    }

    public void setIsDisabled(Boolean isDisabled) {
        this.isDisabled = isDisabled;
    }

    public Boolean getIsDef() {
        return isDef;
    }

    public void setIsDef(Boolean isDef) {
        this.isDef = isDef;
    }
}