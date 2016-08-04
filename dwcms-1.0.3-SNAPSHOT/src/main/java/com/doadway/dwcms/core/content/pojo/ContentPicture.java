package com.doadway.dwcms.core.content.pojo;

public class ContentPicture extends ContentPictureKey {
    /**
	 * 
	 */
	private static final long serialVersionUID = 6873841985884660060L;

	private String imgPath;

    private String description;

    public String getImgPath() {
        return imgPath;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath == null ? null : imgPath.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }
}