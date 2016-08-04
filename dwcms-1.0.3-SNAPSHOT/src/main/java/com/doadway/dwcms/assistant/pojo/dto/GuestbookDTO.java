package com.doadway.dwcms.assistant.pojo.dto;

import java.io.Serializable;
import java.util.Date;

public class GuestbookDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8673555756758595878L;

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
    

    private String title;

    private String email;

    private String phone;

    private String qq;
    
    private String content;

    private String reply;

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
		this.ip = ip;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}    
    
    
}
