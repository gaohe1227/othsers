package com.doadway.dwcms.assistant.pojo;

import java.io.Serializable;

public class AdvertisingAttr implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 4747625487105513847L;

	private Integer advertisingId;

    private String attrName;

    private String attrValue;

    public Integer getAdvertisingId() {
        return advertisingId;
    }

    public void setAdvertisingId(Integer advertisingId) {
        this.advertisingId = advertisingId;
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