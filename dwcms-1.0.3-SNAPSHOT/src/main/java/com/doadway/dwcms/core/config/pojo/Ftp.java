package com.doadway.dwcms.core.config.pojo;

import java.io.Serializable;

public class Ftp implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 9021952305240432401L;

	private Integer ftpId;

    private String ftpName;

    private String ip;

    private Integer port;

    private String username;

    private String password;

    private String encoding;

    private Integer timeout;

    private String ftpPath;

    private String url;

    public Integer getFtpId() {
        return ftpId;
    }

    public void setFtpId(Integer ftpId) {
        this.ftpId = ftpId;
    }

    public String getFtpName() {
        return ftpName;
    }

    public void setFtpName(String ftpName) {
        this.ftpName = ftpName == null ? null : ftpName.trim();
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip == null ? null : ip.trim();
    }

    public Integer getPort() {
        return port;
    }

    public void setPort(Integer port) {
        this.port = port;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getEncoding() {
        return encoding;
    }

    public void setEncoding(String encoding) {
        this.encoding = encoding == null ? null : encoding.trim();
    }

    public Integer getTimeout() {
        return timeout;
    }

    public void setTimeout(Integer timeout) {
        this.timeout = timeout;
    }

    public String getFtpPath() {
        return ftpPath;
    }

    public void setFtpPath(String ftpPath) {
        this.ftpPath = ftpPath == null ? null : ftpPath.trim();
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }
}