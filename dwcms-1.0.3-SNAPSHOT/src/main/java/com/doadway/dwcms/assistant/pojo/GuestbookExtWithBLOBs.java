package com.doadway.dwcms.assistant.pojo;

public class GuestbookExtWithBLOBs extends GuestbookExt {
    /**
	 * 
	 */
	private static final long serialVersionUID = -4561161737047613013L;

	private String content;

    private String reply;

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public String getReply() {
        return reply;
    }

    public void setReply(String reply) {
        this.reply = reply == null ? null : reply.trim();
    }
}