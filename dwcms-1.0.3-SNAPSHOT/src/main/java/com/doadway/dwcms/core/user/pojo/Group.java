package com.doadway.dwcms.core.user.pojo;

import java.io.Serializable;

public class Group implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1986023419567319213L;

	private Integer groupId;

    private String groupName;

    private Integer priority;

    private Boolean needCaptcha;

    private Boolean needCheck;

    private Integer allowPerDay;

    private Integer allowMaxFile;

    private String allowSuffix;

    private Boolean isRegDef;

    public Integer getGroupId() {
        return groupId;
    }

    public void setGroupId(Integer groupId) {
        this.groupId = groupId;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName == null ? null : groupName.trim();
    }

    public Integer getPriority() {
        return priority;
    }

    public void setPriority(Integer priority) {
        this.priority = priority;
    }

    public Boolean getNeedCaptcha() {
        return needCaptcha;
    }

    public void setNeedCaptcha(Boolean needCaptcha) {
        this.needCaptcha = needCaptcha;
    }

    public Boolean getNeedCheck() {
        return needCheck;
    }

    public void setNeedCheck(Boolean needCheck) {
        this.needCheck = needCheck;
    }

    public Integer getAllowPerDay() {
        return allowPerDay;
    }

    public void setAllowPerDay(Integer allowPerDay) {
        this.allowPerDay = allowPerDay;
    }

    public Integer getAllowMaxFile() {
        return allowMaxFile;
    }

    public void setAllowMaxFile(Integer allowMaxFile) {
        this.allowMaxFile = allowMaxFile;
    }

    public String getAllowSuffix() {
        return allowSuffix;
    }

    public void setAllowSuffix(String allowSuffix) {
        this.allowSuffix = allowSuffix == null ? null : allowSuffix.trim();
    }

    public Boolean getIsRegDef() {
        return isRegDef;
    }

    public void setIsRegDef(Boolean isRegDef) {
        this.isRegDef = isRegDef;
    }
}