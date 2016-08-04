package com.doadway.dwcms.assistant.pojo;

public class CommentExtWithBLOBs extends CommentExt {
    /**
	 * 
	 */
	private static final long serialVersionUID = -3050528669749911834L;

	private String text;

    private String reply;

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text == null ? null : text.trim();
    }

    public String getReply() {
        return reply;
    }

    public void setReply(String reply) {
        this.reply = reply == null ? null : reply.trim();
    }
}