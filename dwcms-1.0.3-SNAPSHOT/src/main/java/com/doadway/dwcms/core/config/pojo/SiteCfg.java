package com.doadway.dwcms.core.config.pojo;

import java.io.Serializable;

public class SiteCfg implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 2797146270553118376L;

	private Integer siteId;

    private String cfgName;

    private String cfgValue;

    public Integer getSiteId() {
        return siteId;
    }

    public void setSiteId(Integer siteId) {
        this.siteId = siteId;
    }

    public String getCfgName() {
        return cfgName;
    }

    public void setCfgName(String cfgName) {
        this.cfgName = cfgName == null ? null : cfgName.trim();
    }

    public String getCfgValue() {
        return cfgValue;
    }

    public void setCfgValue(String cfgValue) {
        this.cfgValue = cfgValue == null ? null : cfgValue.trim();
    }
}