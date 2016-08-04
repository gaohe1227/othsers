package com.doadway.dwcms.maintain.pojo;

import java.io.Serializable;

public class Sensitivity implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = -5376934176713559545L;

	private Integer sensitivityId;

    private String search;

    private String replacement;

    public Integer getSensitivityId() {
        return sensitivityId;
    }

    public void setSensitivityId(Integer sensitivityId) {
        this.sensitivityId = sensitivityId;
    }

    public String getSearch() {
        return search;
    }

    public void setSearch(String search) {
        this.search = search == null ? null : search.trim();
    }

    public String getReplacement() {
        return replacement;
    }

    public void setReplacement(String replacement) {
        this.replacement = replacement == null ? null : replacement.trim();
    }
}