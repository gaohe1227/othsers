package com.doadway.dwcms.core.user.pojo.dto;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.doadway.dwcms.core.user.pojo.UserRoleKey;
import com.doadway.dwcms.core.user.pojo.UserSite;

public class ManagerDTO  implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 2848150721171245209L;

	/*
	 * DoUser模块
	 * */
    private Integer userId;

    private String username;

    private String email;

    private String password;

    private Date registerTime;

    private String registerIp;

    private Date lastLoginTime;

    private String lastLoginIp;

    private Integer loginCount;

    private String resetKey;

    private String resetPwd;

    private Date errorTime;

    private Integer errorCount;

    private String errorIp;
    
	/*
	 * DcUser模块
	 * */
    private Integer groupId;
    
    private Integer rank;

    private Long uploadTotal;

    private Integer uploadSize;

    private Date uploadDate;

    private Boolean isAdmin;

    private Boolean isViewonlyAdmin;

    private Boolean isSelfAdmin;

    private Boolean isDisabled;
    
	/*
	 * UserExt模块
	 * */
    private String realname;

    private Boolean gender;

    private Date birthday;

    private String intro;

    private String comefrom;

    private String qq;

    private String msn;

    private String phone;

    private String mobile;

    /*
     * UserRole模块
     * */
    private List<UserRoleKey> userRoleList;
    
    /*
     * UserSite模块
     * */
    private List<UserSite> userSiteList;
    
    /*
     * Group模块
     * */
    private String groupName;

    private Integer priority;

    private Boolean needCaptcha;

    private Boolean needCheck;

    private Integer allowPerDay;

    private Integer allowMaxFile;

    private String allowSuffix;

    private Boolean isRegDef;    
    
	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
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
		this.allowSuffix = allowSuffix;
	}

	public Boolean getIsRegDef() {
		return isRegDef;
	}

	public void setIsRegDef(Boolean isRegDef) {
		this.isRegDef = isRegDef;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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
		this.registerIp = registerIp;
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
		this.lastLoginIp = lastLoginIp;
	}

	public Integer getLoginCount() {
		return loginCount;
	}

	public void setLoginCount(Integer loginCount) {
		this.loginCount = loginCount;
	}

	public String getResetKey() {
		return resetKey;
	}

	public void setResetKey(String resetKey) {
		this.resetKey = resetKey;
	}

	public String getResetPwd() {
		return resetPwd;
	}

	public void setResetPwd(String resetPwd) {
		this.resetPwd = resetPwd;
	}

	public Date getErrorTime() {
		return errorTime;
	}

	public void setErrorTime(Date errorTime) {
		this.errorTime = errorTime;
	}

	public Integer getErrorCount() {
		return errorCount;
	}

	public void setErrorCount(Integer errorCount) {
		this.errorCount = errorCount;
	}

	public String getErrorIp() {
		return errorIp;
	}

	public void setErrorIp(String errorIp) {
		this.errorIp = errorIp;
	}

	public Integer getGroupId() {
		return groupId;
	}

	public void setGroupId(Integer groupId) {
		this.groupId = groupId;
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

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public Boolean getGender() {
		return gender;
	}

	public void setGender(Boolean gender) {
		this.gender = gender;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public String getComefrom() {
		return comefrom;
	}

	public void setComefrom(String comefrom) {
		this.comefrom = comefrom;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getMsn() {
		return msn;
	}

	public void setMsn(String msn) {
		this.msn = msn;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public List<UserRoleKey> getUserRoleList() {
		return userRoleList;
	}

	public void setUserRoleList(List<UserRoleKey> userRoleList) {
		this.userRoleList = userRoleList;
	}

	public List<UserSite> getUserSiteList() {
		return userSiteList;
	}

	public void setUserSiteList(List<UserSite> userSiteList) {
		this.userSiteList = userSiteList;
	}

    
    
}
