package com.doadway.dwcms.assistant.pojo;

import java.io.Serializable;

public class GuestbookExt implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 8816449451920062817L;

	private Integer guestbookId;

    private String title;

    private String email;

    private String phone;

    private String qq;

    public Integer getGuestbookId() {
        return guestbookId;
    }

    public void setGuestbookId(Integer guestbookId) {
        this.guestbookId = guestbookId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq == null ? null : qq.trim();
    }
}