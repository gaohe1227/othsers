package com.doadway.dwcms.assistant.pojo;

import java.io.Serializable;
import java.util.Date;

public class VoteRecord implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = -4887260085046082654L;

	private Integer voterecoredId;

    private Integer userId;

    private Integer votetopicId;

    private Date voteTime;

    private String voteIp;

    private String voteCookie;

    public Integer getVoterecoredId() {
        return voterecoredId;
    }

    public void setVoterecoredId(Integer voterecoredId) {
        this.voterecoredId = voterecoredId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getVotetopicId() {
        return votetopicId;
    }

    public void setVotetopicId(Integer votetopicId) {
        this.votetopicId = votetopicId;
    }

    public Date getVoteTime() {
        return voteTime;
    }

    public void setVoteTime(Date voteTime) {
        this.voteTime = voteTime;
    }

    public String getVoteIp() {
        return voteIp;
    }

    public void setVoteIp(String voteIp) {
        this.voteIp = voteIp == null ? null : voteIp.trim();
    }

    public String getVoteCookie() {
        return voteCookie;
    }

    public void setVoteCookie(String voteCookie) {
        this.voteCookie = voteCookie == null ? null : voteCookie.trim();
    }
}