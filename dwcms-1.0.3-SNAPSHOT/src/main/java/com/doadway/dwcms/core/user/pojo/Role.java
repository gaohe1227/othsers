package com.doadway.dwcms.core.user.pojo;

import java.io.Serializable;

public class Role implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 3213917329456700478L;

	private Integer roleId;

    private Integer siteId;

    private String roleName;

    private Integer priority;

    private String isSuper;

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public Integer getSiteId() {
        return siteId;
    }

    public void setSiteId(Integer siteId) {
        this.siteId = siteId;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName == null ? null : roleName.trim();
    }

    public Integer getPriority() {
        return priority;
    }

    public void setPriority(Integer priority) {
        this.priority = priority;
    }

    public String getIsSuper() {
        return isSuper;
    }

    public void setIsSuper(String isSuper) {
        this.isSuper = isSuper == null ? null : isSuper.trim();
    }
}