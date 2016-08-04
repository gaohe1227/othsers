package com.doadway.dwcms.core.content.pojo;

import java.io.Serializable;

public class ContentAttr implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = -9140422091448207185L;

	private Integer contentId;

    private String attrName;

    private String attrValue;

    public Integer getContentId() {
        return contentId;
    }

    public void setContentId(Integer contentId) {
        this.contentId = contentId;
    }

    public String getAttrName() {
        return attrName;
    }

    public void setAttrName(String attrName) {
        this.attrName = attrName == null ? null : attrName.trim();
    }

    public String getAttrValue() {
        return attrValue;
    }

    public void setAttrValue(String attrValue) {
        this.attrValue = attrValue == null ? null : attrValue.trim();
    }
}