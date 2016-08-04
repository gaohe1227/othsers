package com.doadway.dwcms.core.content.pojo;

import java.io.Serializable;

public class ContentCheck implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 6451928294492804759L;

	private Integer contentId;

    private Byte checkStep;

    private String checkOpinion;

    private Boolean isRejected;

    public Integer getContentId() {
        return contentId;
    }

    public void setContentId(Integer contentId) {
        this.contentId = contentId;
    }

    public Byte getCheckStep() {
        return checkStep;
    }

    public void setCheckStep(Byte checkStep) {
        this.checkStep = checkStep;
    }

    public String getCheckOpinion() {
        return checkOpinion;
    }

    public void setCheckOpinion(String checkOpinion) {
        this.checkOpinion = checkOpinion == null ? null : checkOpinion.trim();
    }

    public Boolean getIsRejected() {
        return isRejected;
    }

    public void setIsRejected(Boolean isRejected) {
        this.isRejected = isRejected;
    }
}