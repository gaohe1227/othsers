package com.doadway.dwcms.core.content.pojo;

import java.io.Serializable;

public class ContentTag implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -9052316288479967991L;

	private Integer tagId;

    private String tagName;

    private Integer refCounter;

    public Integer getTagId() {
        return tagId;
    }

    public void setTagId(Integer tagId) {
        this.tagId = tagId;
    }

    public String getTagName() {
        return tagName;
    }

    public void setTagName(String tagName) {
        this.tagName = tagName == null ? null : tagName.trim();
    }

    public Integer getRefCounter() {
        return refCounter;
    }

    public void setRefCounter(Integer refCounter) {
        this.refCounter = refCounter;
    }
}