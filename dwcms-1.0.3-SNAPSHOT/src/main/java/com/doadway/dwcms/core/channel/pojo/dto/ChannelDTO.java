package com.doadway.dwcms.core.channel.pojo.dto;

import java.io.Serializable;
import java.util.List;

import com.doadway.dwcms.core.channel.pojo.ChnlGroupContriKey;
import com.doadway.dwcms.core.channel.pojo.ChnlGroupViewKey;

public class ChannelDTO implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = -8991574137065705300L;

	/*
     * 栏目:Channel
     * */
    private Integer channelId;

    private Integer modelId;

    private Integer siteId;

    private Integer parentId;

    private String channelPath;

    private Integer lft;

    private Integer rgt;

    private Integer priority;

    private Boolean hasContent;

    private Boolean isDisplay;
    

    /*
     * 栏目扩展:ChannelExt
     * */
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
    
    /*
     * 栏目文本:ChannelTxt
     * */
    private String txt;

    private String txt1;

    private String txt2;

    private String txt3;
    
    /**
     * 投稿权限：ChnlGroupContriKey
     * */
    private List<ChnlGroupContriKey> chnlContriGroupList;
    
    /**
     * 浏览权限: ChnlGroupViewKey
     * **/
    private List<ChnlGroupViewKey> chnlGroupViewList;
    
	public List<ChnlGroupContriKey> getChnlContriGroupList() {
		return chnlContriGroupList;
	}

	public void setChnlContriGroupList(List<ChnlGroupContriKey> chnlContriGroupList) {
		this.chnlContriGroupList = chnlContriGroupList;
	}

	public List<ChnlGroupViewKey> getChnlGroupViewList() {
		return chnlGroupViewList;
	}

	public void setChnlGroupViewList(List<ChnlGroupViewKey> chnlGroupViewList) {
		this.chnlGroupViewList = chnlGroupViewList;
	}

	public Integer getChannelId() {
		return channelId;
	}

	public void setChannelId(Integer channelId) {
		this.channelId = channelId;
	}

	public Integer getModelId() {
		return modelId;
	}

	public void setModelId(Integer modelId) {
		this.modelId = modelId;
	}

	public Integer getSiteId() {
		return siteId;
	}

	public void setSiteId(Integer siteId) {
		this.siteId = siteId;
	}

	public Integer getParentId() {
		return parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	public String getChannelPath() {
		return channelPath;
	}

	public void setChannelPath(String channelPath) {
		this.channelPath = channelPath;
	}

	public Integer getLft() {
		return lft;
	}

	public void setLft(Integer lft) {
		this.lft = lft;
	}

	public Integer getRgt() {
		return rgt;
	}

	public void setRgt(Integer rgt) {
		this.rgt = rgt;
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

	public Boolean getIsDisplay() {
		return isDisplay;
	}

	public void setIsDisplay(Boolean isDisplay) {
		this.isDisplay = isDisplay;
	}

	public String getChannelName() {
		return channelName;
	}

	public void setChannelName(String channelName) {
		this.channelName = channelName;
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
		this.isStaticChannel = isStaticChannel;
	}

	public String getIsStaticContent() {
		return isStaticContent;
	}

	public void setIsStaticContent(String isStaticContent) {
		this.isStaticContent = isStaticContent;
	}

	public String getIsAccessByDir() {
		return isAccessByDir;
	}

	public void setIsAccessByDir(String isAccessByDir) {
		this.isAccessByDir = isAccessByDir;
	}

	public String getIsListChild() {
		return isListChild;
	}

	public void setIsListChild(String isListChild) {
		this.isListChild = isListChild;
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
		this.channelRule = channelRule;
	}

	public String getContentRule() {
		return contentRule;
	}

	public void setContentRule(String contentRule) {
		this.contentRule = contentRule;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getTplChannel() {
		return tplChannel;
	}

	public void setTplChannel(String tplChannel) {
		this.tplChannel = tplChannel;
	}

	public String getTplContent() {
		return tplContent;
	}

	public void setTplContent(String tplContent) {
		this.tplContent = tplContent;
	}

	public String getTitleImg() {
		return titleImg;
	}

	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
	}

	public String getContentImg() {
		return contentImg;
	}

	public void setContentImg(String contentImg) {
		this.contentImg = contentImg;
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
		this.title = title;
	}

	public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getTxt() {
		return txt;
	}

	public void setTxt(String txt) {
		this.txt = txt;
	}

	public String getTxt1() {
		return txt1;
	}

	public void setTxt1(String txt1) {
		this.txt1 = txt1;
	}

	public String getTxt2() {
		return txt2;
	}

	public void setTxt2(String txt2) {
		this.txt2 = txt2;
	}

	public String getTxt3() {
		return txt3;
	}

	public void setTxt3(String txt3) {
		this.txt3 = txt3;
	}

    
    
}
