package com.doadway.dwcms.core.content.pojo.dto;

import java.io.Serializable;

public class PictureDTO implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 2548718064613527601L;

	private String imgPath;

    private String description;
    
    private Integer contentId;

    private Integer priority;

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getContentId() {
		return contentId;
	}

	public void setContentId(Integer contentId) {
		this.contentId = contentId;
	}

	public Integer getPriority() {
		return priority;
	}

	public void setPriority(Integer priority) {
		this.priority = priority;
	}
    
}
