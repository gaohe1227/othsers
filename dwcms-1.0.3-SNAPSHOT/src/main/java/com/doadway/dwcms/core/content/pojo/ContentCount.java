package com.doadway.dwcms.core.content.pojo;

import java.io.Serializable;

public class ContentCount implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 6724648881884853154L;

	private Integer contentId;

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

    public Integer getContentId() {
        return contentId;
    }

    public void setContentId(Integer contentId) {
        this.contentId = contentId;
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
}