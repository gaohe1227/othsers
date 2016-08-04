package com.doadway.dwcms.core.config.pojo;

import java.io.Serializable;

public class ConfigAttr implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = -3879998237317490030L;

	private Integer configId;

    private String attrName;

    private String attrValue;

    public Integer getConfigId() {
        return configId;
    }

    public void setConfigId(Integer configId) {
        this.configId = configId;
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