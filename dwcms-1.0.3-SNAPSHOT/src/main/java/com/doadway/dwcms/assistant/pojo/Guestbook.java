package com.doadway.dwcms.assistant.pojo;

import java.io.Serializable;
import java.util.Date;

public class Guestbook implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 8430923404491692470L;

	private Integer guestbookId;

    private Integer siteId;

    private Integer guestbookctgId;

    private Integer memberId;

    private Integer adminId;

    private String ip;

    private Date createTime;

    private Date replayTime;

    private Boolean isChecked;

    private Boolean isRecommend;

    public Integer getGuestbookId() {
        return guestbookId;
    }

    public void setGuestbookId(Integer guestbookId) {
        this.guestbookId = guestbookId;
    }

    public Integer getSiteId() {
        return siteId;
    }

    public void setSiteId(Integer siteId) {
        this.siteId = siteId;
    }

    public Integer getGuestbookctgId() {
        return guestbookctgId;
    }

    public void setGuestbookctgId(Integer guestbookctgId) {
        this.guestbookctgId = guestbookctgId;
    }

    public Integer getMemberId() {
        return memberId;
    }

    public void setMemberId(Integer memberId) {
        this.memberId = memberId;
    }

    public Integer getAdminId() {
        return adminId;
    }

    public void setAdminId(Integer adminId) {
        this.adminId = adminId;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip == null ? null : ip.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getReplayTime() {
        return replayTime;
    }

    public void setReplayTime(Date replayTime) {
        this.replayTime = replayTime;
    }

    public Boolean getIsChecked() {
        return isChecked;
    }

    public void setIsChecked(Boolean isChecked) {
        this.isChecked = isChecked;
    }

    public Boolean getIsRecommend() {
        return isRecommend;
    }

    public void setIsRecommend(Boolean isRecommend) {
        this.isRecommend = isRecommend;
    }
}