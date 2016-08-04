package com.doadway.dwcms.core.content.pojo.dto;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.doadway.dwcms.core.content.enums.ContentStatusEnum;
import com.doadway.dwcms.core.content.enums.ContentTypeEnum;
import com.doadway.dwcms.core.content.pojo.ContentAttachment;
import com.doadway.dwcms.core.content.pojo.ContentAttr;
import com.doadway.dwcms.core.content.pojo.ContentGroupViewKey;
import com.doadway.dwcms.core.content.pojo.ContentPicture;
import com.doadway.dwcms.core.content.pojo.ContentTagRelate;
import com.doadway.dwcms.core.content.pojo.ContentTopicKey;

public class ContentDTO implements Serializable{
	/**
	* @Fields serialVersionUID : TODO
	*/ 
	private static final long serialVersionUID = 8884741856700986225L;

		/*
		 * 内容基本信息;
		 * */
	    private Integer contentId;
	
	    private Integer channelId;
	    private String 	channelName;
	    private Integer userId;
	
	    private Integer typeId;
	    private String  typeName;

		private Integer siteId;
	
	    private Date sortDate;
	
	    private Byte topLevel;
	
	    private Boolean hasTitleImg;
	
	    private Boolean isRecommend;
	
	    private Byte status;
	    private String statusName;

	    public String getStatusName() {
	    	ContentStatusEnum statusEnum=ContentStatusEnum.parseLabel(status.intValue());
	    	statusName=statusEnum.getLabel();
			return statusName;
		}
		public void setStatusName(String statusName) {
			this.statusName = statusName;
		}
		/*
	     * 文件附件部分
	     * */
		private List<ContentAttachment> attachmentList;
		/*
		 * 内容属性
		 * */
		private List<ContentAttr>       attrList;
		/*
		 * 审核部分
		 * */
	    private Byte checkStep;
	
	    private String checkOpinion;
	
	    private Boolean isRejected;
	    /*
	     * 统计部分
	     * */
     	private Integer views;

	    private Integer viewsMonth;

	    private Integer viewsWeek;

	    private Integer viewsDay;

	    private Integer comments;

	    private Integer commentsMonth;

	    private Short commentsWeek;

	    private Short commentsDay;

	    private Integer downloads;

	    private Integer downloadsMonth;

	    private Short downloadsWeek;

	    private Short downloadsDay;

	    private Integer ups;

	    private Integer upsMonth;

	    private Short upsWeek;

	    private Short upsDay;

	    private Integer downs;
	    
		/*
		 * 内容扩展部分
		 * */
	    private String title;
	
	    private String shortTitle;
	
	    private String author;
	
	    private String origin;
	
	    private String originUrl;
	
	    private String description;
	
	    private Date releaseDate;
	
	    private String mediaPath;
	
	    private String mediaType;
	
	    private String titleColor;
	
	    private Boolean isBold;
	
	    private String titleImg;
	
	    private String contentImg;
	
	    private String typeImg;
	
	    private String link;
	
	    private String tplContent;
	    
	    private String tagStr;
	    public String getTagStr() {
			return tagStr;
		}
		public void setTagStr(String tagStr) {
			this.tagStr = tagStr;
		}
		/*
	     *内容用户组部分 
	     */
		private List<ContentGroupViewKey>  groupViewList;
		/*
		 * 内容图片部分
		 * */
		private List<ContentPicture> pictureList;
		/*
		 * Tag标签部分;
		 * */
		private List<ContentTagRelate> tagRelateList;
		/*
		 * 内容文本部分;
		 * */	
		private String txt;
		
		private String txt1;
		
	    private String txt2;
		
	    private String txt3;	
		/*
		 * 内容主题部分;
		 * */	
	    private List<ContentTopicKey> topicList;
		public Integer getContentId() {
			return contentId;
		}
		public void setContentId(Integer contentId) {
			this.contentId = contentId;
		}
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
			this.channelName = channelName;
		}
		public Integer getUserId() {
			return userId;
		}
		public void setUserId(Integer userId) {
			this.userId = userId;
		}
		public Integer getTypeId() {
			return typeId;
		}
	    public void setTypeName(String typeName) {
			this.typeName = typeName;
		}		
		public String getTypeName() {
			ContentTypeEnum typeEnum=ContentTypeEnum.parseLabel(typeId);
			typeName=typeEnum.getLabel();
			return typeName;
		}		
		public void setTypeId(Integer typeId) {
			this.typeId = typeId;
		}
		public Integer getSiteId() {
			return siteId;
		}
		public void setSiteId(Integer siteId) {
			this.siteId = siteId;
		}
		public Date getSortDate() {
			return sortDate;
		}
		public void setSortDate(Date sortDate) {
			this.sortDate = sortDate;
		}
		public Byte getTopLevel() {
			return topLevel;
		}
		public void setTopLevel(Byte topLevel) {
			this.topLevel = topLevel;
		}
		public Boolean getHasTitleImg() {
			return hasTitleImg;
		}
		public void setHasTitleImg(Boolean hasTitleImg) {
			this.hasTitleImg = hasTitleImg;
		}
		public Boolean getIsRecommend() {
			return isRecommend;
		}
		public void setIsRecommend(Boolean isRecommend) {
			this.isRecommend = isRecommend;
		}
		public Byte getStatus() {
			return status;
		}
		public void setStatus(Byte status) {
			this.status = status;
		}
		public List<ContentAttachment> getAttachmentList() {
			return attachmentList;
		}
		public void setAttachmentList(List<ContentAttachment> attachmentList) {
			this.attachmentList = attachmentList;
		}
		public List<ContentAttr> getAttrList() {
			return attrList;
		}
		public void setAttrList(List<ContentAttr> attrList) {
			this.attrList = attrList;
		}
		public Byte getCheckStep() {
			return checkStep;
		}
		public void setCheckStep(Byte checkStep) {
			this.checkStep = checkStep;
		}
		public String getCheckOpinion() {
			return checkOpinion;
		}
		public void setCheckOpinion(String checkOpinion) {
			this.checkOpinion = checkOpinion;
		}
		public Boolean getIsRejected() {
			return isRejected;
		}
		public void setIsRejected(Boolean isRejected) {
			this.isRejected = isRejected;
		}
		public Integer getViews() {
			return views;
		}
		public void setViews(Integer views) {
			this.views = views;
		}
		public Integer getViewsMonth() {
			return viewsMonth;
		}
		public void setViewsMonth(Integer viewsMonth) {
			this.viewsMonth = viewsMonth;
		}
		public Integer getViewsWeek() {
			return viewsWeek;
		}
		public void setViewsWeek(Integer viewsWeek) {
			this.viewsWeek = viewsWeek;
		}
		public Integer getViewsDay() {
			return viewsDay;
		}
		public void setViewsDay(Integer viewsDay) {
			this.viewsDay = viewsDay;
		}
		public Integer getComments() {
			return comments;
		}
		public void setComments(Integer comments) {
			this.comments = comments;
		}
		public Integer getCommentsMonth() {
			return commentsMonth;
		}
		public void setCommentsMonth(Integer commentsMonth) {
			this.commentsMonth = commentsMonth;
		}
		public Short getCommentsWeek() {
			return commentsWeek;
		}
		public void setCommentsWeek(Short commentsWeek) {
			this.commentsWeek = commentsWeek;
		}
		public Short getCommentsDay() {
			return commentsDay;
		}
		public void setCommentsDay(Short commentsDay) {
			this.commentsDay = commentsDay;
		}
		public Integer getDownloads() {
			return downloads;
		}
		public void setDownloads(Integer downloads) {
			this.downloads = downloads;
		}
		public Integer getDownloadsMonth() {
			return downloadsMonth;
		}
		public void setDownloadsMonth(Integer downloadsMonth) {
			this.downloadsMonth = downloadsMonth;
		}
		public Short getDownloadsWeek() {
			return downloadsWeek;
		}
		public void setDownloadsWeek(Short downloadsWeek) {
			this.downloadsWeek = downloadsWeek;
		}
		public Short getDownloadsDay() {
			return downloadsDay;
		}
		public void setDownloadsDay(Short downloadsDay) {
			this.downloadsDay = downloadsDay;
		}
		public Integer getUps() {
			return ups;
		}
		public void setUps(Integer ups) {
			this.ups = ups;
		}
		public Integer getUpsMonth() {
			return upsMonth;
		}
		public void setUpsMonth(Integer upsMonth) {
			this.upsMonth = upsMonth;
		}
		public Short getUpsWeek() {
			return upsWeek;
		}
		public void setUpsWeek(Short upsWeek) {
			this.upsWeek = upsWeek;
		}
		public Short getUpsDay() {
			return upsDay;
		}
		public void setUpsDay(Short upsDay) {
			this.upsDay = upsDay;
		}
		public Integer getDowns() {
			return downs;
		}
		public void setDowns(Integer downs) {
			this.downs = downs;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getShortTitle() {
			return shortTitle;
		}
		public void setShortTitle(String shortTitle) {
			this.shortTitle = shortTitle;
		}
		public String getAuthor() {
			return author;
		}
		public void setAuthor(String author) {
			this.author = author;
		}
		public String getOrigin() {
			return origin;
		}
		public void setOrigin(String origin) {
			this.origin = origin;
		}
		public String getOriginUrl() {
			return originUrl;
		}
		public void setOriginUrl(String originUrl) {
			this.originUrl = originUrl;
		}
		public String getDescription() {
			return description;
		}
		public void setDescription(String description) {
			this.description = description;
		}
		public Date getReleaseDate() {
			return releaseDate;
		}
		public void setReleaseDate(Date releaseDate) {
			this.releaseDate = releaseDate;
		}
		public String getMediaPath() {
			return mediaPath;
		}
		public void setMediaPath(String mediaPath) {
			this.mediaPath = mediaPath;
		}
		public String getMediaType() {
			return mediaType;
		}
		public void setMediaType(String mediaType) {
			this.mediaType = mediaType;
		}
		public String getTitleColor() {
			return titleColor;
		}
		public void setTitleColor(String titleColor) {
			this.titleColor = titleColor;
		}
		public Boolean getIsBold() {
			return isBold;
		}
		public void setIsBold(Boolean isBold) {
			this.isBold = isBold;
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
		public String getTypeImg() {
			return typeImg;
		}
		public void setTypeImg(String typeImg) {
			this.typeImg = typeImg;
		}
		public String getLink() {
			return link;
		}
		public void setLink(String link) {
			this.link = link;
		}
		public String getTplContent() {
			return tplContent;
		}
		public void setTplContent(String tplContent) {
			this.tplContent = tplContent;
		}
		public List<ContentGroupViewKey> getGroupViewList() {
			return groupViewList;
		}
		public void setGroupViewList(List<ContentGroupViewKey> groupViewList) {
			this.groupViewList = groupViewList;
		}


		public List<ContentPicture> getPictureList() {
			return pictureList;
		}
		public void setPictureList(List<ContentPicture> pictureList) {
			this.pictureList = pictureList;
		}
		public List<ContentTagRelate> getTagRelateList() {
			return tagRelateList;
		}
		public void setTagRelateList(List<ContentTagRelate> tagRelateList) {
			this.tagRelateList = tagRelateList;
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
		public List<ContentTopicKey> getTopicList() {
			return topicList;
		}
		public void setTopicList(List<ContentTopicKey> topicList) {
			this.topicList = topicList;
		}
	    
	
	
}
