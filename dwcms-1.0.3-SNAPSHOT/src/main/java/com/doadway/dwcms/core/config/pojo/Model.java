package com.doadway.dwcms.core.config.pojo;

import java.io.Serializable;

public class Model implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 4329365640516468195L;

	private Integer modelId;

    private String modelName;

    private String modelPath;

    private String tplChannelPrefix;

    private String tplContentPrefix;

    private Integer titleImgWidth;

    private Integer titleImgHeight;

    private Integer contentImgWidth;

    private Integer contentImgHeight;

    private Integer priority;

    private Boolean hasContent;

    private Boolean isDisabled;

    private Boolean isDef;

    public Integer getModelId() {
        return modelId;
    }

    public void setModelId(Integer modelId) {
        this.modelId = modelId;
    }

    public String getModelName() {
        return modelName;
    }

    public void setModelName(String modelName) {
        this.modelName = modelName == null ? null : modelName.trim();
    }

    public String getModelPath() {
        return modelPath;
    }

    public void setModelPath(String modelPath) {
        this.modelPath = modelPath == null ? null : modelPath.trim();
    }

    public String getTplChannelPrefix() {
        return tplChannelPrefix;
    }

    public void setTplChannelPrefix(String tplChannelPrefix) {
        this.tplChannelPrefix = tplChannelPrefix == null ? null : tplChannelPrefix.trim();
    }

    public String getTplContentPrefix() {
        return tplContentPrefix;
    }

    public void setTplContentPrefix(String tplContentPrefix) {
        this.tplContentPrefix = tplContentPrefix == null ? null : tplContentPrefix.trim();
    }

    public Integer getTitleImgWidth() {
        return titleImgWidth;
    }

    public void setTitleImgWidth(Integer titleImgWidth) {
        this.titleImgWidth = titleImgWidth;
    }

    public Integer getTitleImgHeight() {
        return titleImgHeight;
    }

    public void setTitleImgHeight(Integer titleImgHeight) {
        this.titleImgHeight = titleImgHeight;
    }

    public Integer getContentImgWidth() {
        return contentImgWidth;
    }

    public void setContentImgWidth(Integer contentImgWidth) {
        this.contentImgWidth = contentImgWidth;
    }

    public Integer getContentImgHeight() {
        return contentImgHeight;
    }

    public void setContentImgHeight(Integer contentImgHeight) {
        this.contentImgHeight = contentImgHeight;
    }

    public Integer getPriority() {
        return priority;
    }

    public void setPriority(Integer priority) {
        this.priority = priority;
    }

    public Boolean getHasContent() {
        return hasContent;
    }

    public void setHasContent(Boolean hasContent) {
        this.hasContent = hasContent;
    }

    public Boolean getIsDisabled() {
        return isDisabled;
    }

    public void setIsDisabled(Boolean isDisabled) {
        this.isDisabled = isDisabled;
    }

    public Boolean getIsDef() {
        return isDef;
    }

    public void setIsDef(Boolean isDef) {
        this.isDef = isDef;
    }
}