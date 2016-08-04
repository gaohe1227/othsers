package com.doadway.dwcms.core.config.pojo;

import java.io.Serializable;
import java.util.Date;

public class Config implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 5176712781496025689L;

	private Integer configId;

    private String contextPath;

    private String servletPoint;

    private Integer port;

    private String dbFileUri;

    private Boolean isUploadToDb;

    private String defImg;

    private String loginUrl;

    private String processUrl;

    private Boolean markOn;

    private Integer markWidth;

    private Integer markHeight;

    private String markImage;

    private String markContent;

    private Integer markSize;

    private String markColor;

    private Integer markAlpha;

    private Integer markPosition;

    private Integer markOffsetX;

    private Integer markOffsetY;

    private Date countClearTime;

    private Date countCopyTime;

    private String downloadCode;

    private Integer downloadTime;

    private String emailHost;

    private String emailEncoding;

    private String emailUsername;

    private String emailPassword;

    private String emailPersonal;

    public Integer getConfigId() {
        return configId;
    }

    public void setConfigId(Integer configId) {
        this.configId = configId;
    }

    public String getContextPath() {
        return contextPath;
    }

    public void setContextPath(String contextPath) {
        this.contextPath = contextPath == null ? null : contextPath.trim();
    }

    public String getServletPoint() {
        return servletPoint;
    }

    public void setServletPoint(String servletPoint) {
        this.servletPoint = servletPoint == null ? null : servletPoint.trim();
    }

    public Integer getPort() {
        return port;
    }

    public void setPort(Integer port) {
        this.port = port;
    }

    public String getDbFileUri() {
        return dbFileUri;
    }

    public void setDbFileUri(String dbFileUri) {
        this.dbFileUri = dbFileUri == null ? null : dbFileUri.trim();
    }

    public Boolean getIsUploadToDb() {
        return isUploadToDb;
    }

    public void setIsUploadToDb(Boolean isUploadToDb) {
        this.isUploadToDb = isUploadToDb;
    }

    public String getDefImg() {
        return defImg;
    }

    public void setDefImg(String defImg) {
        this.defImg = defImg == null ? null : defImg.trim();
    }

    public String getLoginUrl() {
        return loginUrl;
    }

    public void setLoginUrl(String loginUrl) {
        this.loginUrl = loginUrl == null ? null : loginUrl.trim();
    }

    public String getProcessUrl() {
        return processUrl;
    }

    public void setProcessUrl(String processUrl) {
        this.processUrl = processUrl == null ? null : processUrl.trim();
    }

    public Boolean getMarkOn() {
        return markOn;
    }

    public void setMarkOn(Boolean markOn) {
        this.markOn = markOn;
    }

    public Integer getMarkWidth() {
        return markWidth;
    }

    public void setMarkWidth(Integer markWidth) {
        this.markWidth = markWidth;
    }

    public Integer getMarkHeight() {
        return markHeight;
    }

    public void setMarkHeight(Integer markHeight) {
        this.markHeight = markHeight;
    }

    public String getMarkImage() {
        return markImage;
    }

    public void setMarkImage(String markImage) {
        this.markImage = markImage == null ? null : markImage.trim();
    }

    public String getMarkContent() {
        return markContent;
    }

    public void setMarkContent(String markContent) {
        this.markContent = markContent == null ? null : markContent.trim();
    }

    public Integer getMarkSize() {
        return markSize;
    }

    public void setMarkSize(Integer markSize) {
        this.markSize = markSize;
    }

    public String getMarkColor() {
        return markColor;
    }

    public void setMarkColor(String markColor) {
        this.markColor = markColor == null ? null : markColor.trim();
    }

    public Integer getMarkAlpha() {
        return markAlpha;
    }

    public void setMarkAlpha(Integer markAlpha) {
        this.markAlpha = markAlpha;
    }

    public Integer getMarkPosition() {
        return markPosition;
    }

    public void setMarkPosition(Integer markPosition) {
        this.markPosition = markPosition;
    }

    public Integer getMarkOffsetX() {
        return markOffsetX;
    }

    public void setMarkOffsetX(Integer markOffsetX) {
        this.markOffsetX = markOffsetX;
    }

    public Integer getMarkOffsetY() {
        return markOffsetY;
    }

    public void setMarkOffsetY(Integer markOffsetY) {
        this.markOffsetY = markOffsetY;
    }

    public Date getCountClearTime() {
        return countClearTime;
    }

    public void setCountClearTime(Date countClearTime) {
        this.countClearTime = countClearTime;
    }

    public Date getCountCopyTime() {
        return countCopyTime;
    }

    public void setCountCopyTime(Date countCopyTime) {
        this.countCopyTime = countCopyTime;
    }

    public String getDownloadCode() {
        return downloadCode;
    }

    public void setDownloadCode(String downloadCode) {
        this.downloadCode = downloadCode == null ? null : downloadCode.trim();
    }

    public Integer getDownloadTime() {
        return downloadTime;
    }

    public void setDownloadTime(Integer downloadTime) {
        this.downloadTime = downloadTime;
    }

    public String getEmailHost() {
        return emailHost;
    }

    public void setEmailHost(String emailHost) {
        this.emailHost = emailHost == null ? null : emailHost.trim();
    }

    public String getEmailEncoding() {
        return emailEncoding;
    }

    public void setEmailEncoding(String emailEncoding) {
        this.emailEncoding = emailEncoding == null ? null : emailEncoding.trim();
    }

    public String getEmailUsername() {
        return emailUsername;
    }

    public void setEmailUsername(String emailUsername) {
        this.emailUsername = emailUsername == null ? null : emailUsername.trim();
    }

    public String getEmailPassword() {
        return emailPassword;
    }

    public void setEmailPassword(String emailPassword) {
        this.emailPassword = emailPassword == null ? null : emailPassword.trim();
    }

    public String getEmailPersonal() {
        return emailPersonal;
    }

    public void setEmailPersonal(String emailPersonal) {
        this.emailPersonal = emailPersonal == null ? null : emailPersonal.trim();
    }
}