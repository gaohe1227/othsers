package com.doadway.dwcms.core.user.pojo;

import java.io.Serializable;

public class UserSite implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = -975137126165801286L;

	private Integer usersiteId;

    private Integer userId;

    private Integer siteId;

    private Byte checkStep;

    private Boolean isAllChannel;

    public Integer getUsersiteId() {
        return usersiteId;
    }

    public void setUsersiteId(Integer usersiteId) {
        this.usersiteId = usersiteId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getSiteId() {
        return siteId;
    }

    public void setSiteId(Integer siteId) {
        this.siteId = siteId;
    }

    public Byte getCheckStep() {
        return checkStep;
    }

    public void setCheckStep(Byte checkStep) {
        this.checkStep = checkStep;
    }

    public Boolean getIsAllChannel() {
        return isAllChannel;
    }

    public void setIsAllChannel(Boolean isAllChannel) {
        this.isAllChannel = isAllChannel;
    }
}