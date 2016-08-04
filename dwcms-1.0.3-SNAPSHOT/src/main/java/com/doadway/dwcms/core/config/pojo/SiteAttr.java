package com.doadway.dwcms.core.config.pojo;

import java.io.Serializable;

public class SiteAttr implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 6994383226667970434L;

	private Integer siteId;

    private String attrName;

    private String attrValue;

    public Integer getSiteId() {
        return siteId;
    }

    public void setSiteId(Integer siteId) {
        this.siteId = siteId;
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