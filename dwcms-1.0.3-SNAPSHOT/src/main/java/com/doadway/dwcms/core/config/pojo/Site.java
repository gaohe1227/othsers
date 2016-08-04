package com.doadway.dwcms.core.config.pojo;

import java.io.Serializable;

public class Site implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = -4604564504527666168L;

	private Integer siteId;

    private Integer configId;

    private Integer ftpUploadId;

    private String domain;

    private String sitePath;

    private String siteName;

    private String shortName;

    private String protocol;

    private String dynamicSuffix;

    private String staticSuffix;

    private String staticDir;

    private String isIndexToRoot;

    private String isStaticIndex;

    private String localeAdmin;

    private String localeFront;

    private String tplSolution;

    private Byte finalStep;

    private Byte afterCheck;

    private String isRelativePath;

    private String isRecycleOn;

    private String domainAlias;

    private String domainRedirect;

    public Integer getSiteId() {
        return siteId;
    }

    public void setSiteId(Integer siteId) {
        this.siteId = siteId;
    }

    public Integer getConfigId() {
        return configId;
    }

    public void setConfigId(Integer configId) {
        this.configId = configId;
    }

    public Integer getFtpUploadId() {
        return ftpUploadId;
    }

    public void setFtpUploadId(Integer ftpUploadId) {
        this.ftpUploadId = ftpUploadId;
    }

    public String getDomain() {
        return domain;
    }

    public void setDomain(String domain) {
        this.domain = domain == null ? null : domain.trim();
    }

    public String getSitePath() {
        return sitePath;
    }

    public void setSitePath(String sitePath) {
        this.sitePath = sitePath == null ? null : sitePath.trim();
    }

    public String getSiteName() {
        return siteName;
    }

    public void setSiteName(String siteName) {
        this.siteName = siteName == null ? null : siteName.trim();
    }

    public String getShortName() {
        return shortName;
    }

    public void setShortName(String shortName) {
        this.shortName = shortName == null ? null : shortName.trim();
    }

    public String getProtocol() {
        return protocol;
    }

    public void setProtocol(String protocol) {
        this.protocol = protocol == null ? null : protocol.trim();
    }

    public String getDynamicSuffix() {
        return dynamicSuffix;
    }

    public void setDynamicSuffix(String dynamicSuffix) {
        this.dynamicSuffix = dynamicSuffix == null ? null : dynamicSuffix.trim();
    }

    public String getStaticSuffix() {
        return staticSuffix;
    }

    public void setStaticSuffix(String staticSuffix) {
        this.staticSuffix = staticSuffix == null ? null : staticSuffix.trim();
    }

    public String getStaticDir() {
        return staticDir;
    }

    public void setStaticDir(String staticDir) {
        this.staticDir = staticDir == null ? null : staticDir.trim();
    }

    public String getIsIndexToRoot() {
        return isIndexToRoot;
    }

    public void setIsIndexToRoot(String isIndexToRoot) {
        this.isIndexToRoot = isIndexToRoot == null ? null : isIndexToRoot.trim();
    }

    public String getIsStaticIndex() {
        return isStaticIndex;
    }

    public void setIsStaticIndex(String isStaticIndex) {
        this.isStaticIndex = isStaticIndex == null ? null : isStaticIndex.trim();
    }

    public String getLocaleAdmin() {
        return localeAdmin;
    }

    public void setLocaleAdmin(String localeAdmin) {
        this.localeAdmin = localeAdmin == null ? null : localeAdmin.trim();
    }

    public String getLocaleFront() {
        return localeFront;
    }

    public void setLocaleFront(String localeFront) {
        this.localeFront = localeFront == null ? null : localeFront.trim();
    }

    public String getTplSolution() {
        return tplSolution;
    }

    public void setTplSolution(String tplSolution) {
        this.tplSolution = tplSolution == null ? null : tplSolution.trim();
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

    public String getIsRelativePath() {
        return isRelativePath;
    }

    public void setIsRelativePath(String isRelativePath) {
        this.isRelativePath = isRelativePath == null ? null : isRelativePath.trim();
    }

    public String getIsRecycleOn() {
        return isRecycleOn;
    }

    public void setIsRecycleOn(String isRecycleOn) {
        this.isRecycleOn = isRecycleOn == null ? null : isRecycleOn.trim();
    }

    public String getDomainAlias() {
        return domainAlias;
    }

    public void setDomainAlias(String domainAlias) {
        this.domainAlias = domainAlias == null ? null : domainAlias.trim();
    }

    public String getDomainRedirect() {
        return domainRedirect;
    }

    public void setDomainRedirect(String domainRedirect) {
        this.domainRedirect = domainRedirect == null ? null : domainRedirect.trim();
    }
}