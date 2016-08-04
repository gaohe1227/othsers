package com.doadway.dwcms.core.user.pojo;

import java.io.Serializable;
import java.util.Date;

public class DcUser  implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 4239408045446537318L;

	private Integer userId;

    private Integer groupId;

    private String username;

    private String email;

    private Date registerTime;

    private String registerIp;

    private Date lastLoginTime;

    private String lastLoginIp;

    private Integer loginCount;

    private Integer rank;

    private Long uploadTotal;

    private Integer uploadSize;

    private Date uploadDate;

    private Boolean isAdmin;

    private Boolean isViewonlyAdmin;

    private Boolean isSelfAdmin;

    private Boolean isDisabled;

    
    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getGroupId() {
        return groupId;
    }

    public void setGroupId(Integer groupId) {
        this.groupId = groupId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Date getRegisterTime() {
        return registerTime;
    }

    public void setRegisterTime(Date registerTime) {
        this.registerTime = registerTime;
    }

    public String getRegisterIp() {
        return registerIp;
    }

    public void setRegisterIp(String registerIp) {
        this.registerIp = registerIp == null ? null : registerIp.trim();
    }

    public Date getLastLoginTime() {
        return lastLoginTime;
    }

    public void setLastLoginTime(Date lastLoginTime) {
        this.lastLoginTime = lastLoginTime;
    }

    public String getLastLoginIp() {
        return lastLoginIp;
    }

    public void setLastLoginIp(String lastLoginIp) {
        this.lastLoginIp = lastLoginIp == null ? null : lastLoginIp.trim();
    }

    public Integer getLoginCount() {
        return loginCount;
    }

    public void setLoginCount(Integer loginCount) {
        this.loginCount = loginCount;
    }

    public Integer getRank() {
        return rank;
    }

    public void setRank(Integer rank) {
        this.rank = rank;
    }

    public Long getUploadTotal() {
        return uploadTotal;
    }

    public void setUploadTotal(Long uploadTotal) {
        this.uploadTotal = uploadTotal;
    }

    public Integer getUploadSize() {
        return uploadSize;
    }

    public void setUploadSize(Integer uploadSize) {
        this.uploadSize = uploadSize;
    }

    public Date getUploadDate() {
        return uploadDate;
    }

    public void setUploadDate(Date uploadDate) {
        this.uploadDate = uploadDate;
    }

    public Boolean getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(Boolean isAdmin) {
        this.isAdmin = isAdmin;
    }

    public Boolean getIsViewonlyAdmin() {
        return isViewonlyAdmin;
    }

    public void setIsViewonlyAdmin(Boolean isViewonlyAdmin) {
        this.isViewonlyAdmin = isViewonlyAdmin;
    }

    public Boolean getIsSelfAdmin() {
        return isSelfAdmin;
    }

    public void setIsSelfAdmin(Boolean isSelfAdmin) {
        this.isSelfAdmin = isSelfAdmin;
    }

    public Boolean getIsDisabled() {
        return isDisabled;
    }

    public void setIsDisabled(Boolean isDisabled) {
        this.isDisabled = isDisabled;
    }

}