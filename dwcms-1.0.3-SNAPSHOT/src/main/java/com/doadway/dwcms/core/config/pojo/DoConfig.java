package com.doadway.dwcms.core.config.pojo;

import java.io.Serializable;

public class DoConfig implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 6311706623801015067L;

	private String cfgKey;

    private String cfgValue;

    public String getCfgKey() {
        return cfgKey;
    }

    public void setCfgKey(String cfgKey) {
        this.cfgKey = cfgKey == null ? null : cfgKey.trim();
    }

    public String getCfgValue() {
        return cfgValue;
    }

    public void setCfgValue(String cfgValue) {
        this.cfgValue = cfgValue == null ? null : cfgValue.trim();
    }
}