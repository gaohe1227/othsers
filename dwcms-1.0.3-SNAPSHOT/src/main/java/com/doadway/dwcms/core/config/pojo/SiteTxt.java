package com.doadway.dwcms.core.config.pojo;

import java.io.Serializable;

public class SiteTxt implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = -1597386660249881543L;

	private Integer siteId;

    private String txtName;

    private String txtValue;

    public Integer getSiteId() {
        return siteId;
    }

    public void setSiteId(Integer siteId) {
        this.siteId = siteId;
    }

    public String getTxtName() {
        return txtName;
    }

    public void setTxtName(String txtName) {
        this.txtName = txtName == null ? null : txtName.trim();
    }

    public String getTxtValue() {
        return txtValue;
    }

    public void setTxtValue(String txtValue) {
        this.txtValue = txtValue == null ? null : txtValue.trim();
    }
}