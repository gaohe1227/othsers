package com.doadway.dwcms.core.channel.pojo;

import java.io.Serializable;

public class ChannelExt implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 5410050564145942149L;

	private Integer channelId;

    private String channelName;

    private Byte finalStep;

    private Byte afterCheck;

    private String isStaticChannel;

    private String isStaticContent;

    private String isAccessByDir;

    private String isListChild;

    private Integer pageSize;

    private String channelRule;

    private String contentRule;

    private String link;

    private String tplChannel;

    private String tplContent;

    private String titleImg;

    private String contentImg;

    private Boolean hasTitleImg;

    private Boolean hasContentImg;

    private Integer titleImgWidth;

    private Integer titleImgHeight;

    private Integer contentImgWidth;

    private Integer contentImgHeight;

    private Integer commentControl;

    private Boolean allowUpdown;

    private Boolean isBlank;

    private String title;

    private String keywords;

    private String description;

    public Integer getChannelId() {
        return channelId;
    }

    public void setChannelId(Integer channelId) {
        this.channelId = channelId;
    }

    public String getChannelName() {
        return channelName;
    }

    public void setChannelName(String channelName) {
        this.channelName = channelName == null ? null : channelName.trim();
    }

    public Byte getFinalStep() {
        return finalStep;
    }

    public void setFinalStep(Byte finalStep) {
        this.finalStep = finalStep;
    }

    public Byte getAfterCheck() {
        return afterCheck;
    }

    public void setAfterCheck(Byte afterCheck) {
        this.afterCheck = afterCheck;
    }

    public String getIsStaticChannel() {
        return isStaticChannel;
    }

    public void setIsStaticChannel(String isStaticChannel) {
        this.isStaticChannel = isStaticChannel == null ? null : isStaticChannel.trim();
    }

    public String getIsStaticContent() {
        return isStaticContent;
    }

    public void setIsStaticContent(String isStaticContent) {
        this.isStaticContent = isStaticContent == null ? null : isStaticContent.trim();
    }

    public String getIsAccessByDir() {
        return isAccessByDir;
    }

    public void setIsAccessByDir(String isAccessByDir) {
        this.isAccessByDir = isAccessByDir == null ? null : isAccessByDir.trim();
    }

    public String getIsListChild() {
        return isListChild;
    }

    public void setIsListChild(String isListChild) {
        this.isListChild = isListChild == null ? null : isListChild.trim();
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public String getChannelRule() {
        return channelRule;
    }

    public void setChannelRule(String channelRule) {
        this.channelRule = channelRule == null ? null : channelRule.trim();
    }

    public String getContentRule() {
        return contentRule;
    }

    public void setContentRule(String contentRule) {
        this.contentRule = contentRule == null ? null : contentRule.trim();
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link == null ? null : link.trim();
    }

    public String getTplChannel() {
        return tplChannel;
    }

    public void setTplChannel(String tplChannel) {
        this.tplChannel = tplChannel == null ? null : tplChannel.trim();
    }

    public String getTplContent() {
        return tplContent;
    }

    public void setTplContent(String tplContent) {
        this.tplContent = tplContent == null ? null : tplContent.trim();
    }

    public String getTitleImg() {
        return titleImg;
    }

    public void setTitleImg(String titleImg) {
        this.titleImg = titleImg == null ? null : titleImg.trim();
    }

    public String getContentImg() {
        return contentImg;
    }

    public void setContentImg(String contentImg) {
        this.contentImg = contentImg == null ? null : contentImg.trim();
    }

    public Boolean getHasTitleImg() {
        return hasTitleImg;
    }

    public void setHasTitleImg(Boolean hasTitleImg) {
        this.hasTitleImg = hasTitleImg;
    }

    public Boolean getHasContentImg() {
        return hasContentImg;
    }

    public void setHasContentImg(Boolean hasContentImg) {
        this.hasContentImg = hasContentImg;
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

    public Integer getCommentControl() {
        return commentControl;
    }

    public void setCommentControl(Integer commentControl) {
        this.commentControl = commentControl;
    }

    public Boolean getAllowUpdown() {
        return allowUpdown;
    }

    public void setAllowUpdown(Boolean allowUpdown) {
        this.allowUpdown = allowUpdown;
    }

    public Boolean getIsBlank() {
        return isBlank;
    }

    public void setIsBlank(Boolean isBlank) {
        this.isBlank = isBlank;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords == null ? null : keywords.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }
}