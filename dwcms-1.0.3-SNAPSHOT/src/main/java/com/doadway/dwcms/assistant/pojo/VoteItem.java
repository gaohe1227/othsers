package com.doadway.dwcms.assistant.pojo;

import java.io.Serializable;

public class VoteItem implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = -3041160333913091132L;

	private Integer voteitemId;

    private Integer votetopicId;

    private String title;

    private Integer voteCount;

    private Integer priority;

    public Integer getVoteitemId() {
        return voteitemId;
    }

    public void setVoteitemId(Integer voteitemId) {
        this.voteitemId = voteitemId;
    }

    public Integer getVotetopicId() {
        return votetopicId;
    }

    public void setVotetopicId(Integer votetopicId) {
        this.votetopicId = votetopicId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public Integer getVoteCount() {
        return voteCount;
    }

    public void setVoteCount(Integer voteCount) {
        this.voteCount = voteCount;
    }

    public Integer getPriority() {
        return priority;
    }

    public void setPriority(Integer priority) {
        this.priority = priority;
    }
}