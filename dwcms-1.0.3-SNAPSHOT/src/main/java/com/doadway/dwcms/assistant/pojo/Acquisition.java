package com.doadway.dwcms.assistant.pojo;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.lang.StringUtils;

public class Acquisition implements Serializable {
	private static final long serialVersionUID = -3736973962245067225L;
	/**
	 * 动态页翻页页号
	 */
	public static final String PAGE = "[page]";
	/**
	 * 停止状态
	 */
	public static final int STOP = 0;
	/**
	 * 采集状态
	 */
	public static final int START = 1;
	/**
	 * 暂停状态
	 */
	public static final int PAUSE = 2;

	/**
	 * 是否停止
	 * 
	 * @return
	 */
	public boolean isStop() {
		int status = getStatus();
		return status == 0;
	}

	/**
	 * 是否暂停
	 * 
	 * @return
	 */
	public boolean isPuase() {
		int status = getStatus();
		return status == 2;
	}

	/**
	 * 是否中断。停止和暂停都需要中断。
	 * 
	 * @return
	 */
	public boolean isBreak() {
		int status = getStatus();
		return status == 0 || status == 2;
	}
	public String[] getPlans() {
		String plan = getPlanList();
		if (!StringUtils.isBlank(plan)) {
			return StringUtils.split(plan);
		} else {
			return new String[0];
		}
	}	
	public String[] getAllPlans() {
		String[] plans = getPlans();
		Integer start = getDynamicStart();
		Integer end = getDynamicEnd();
		if (!StringUtils.isBlank(getDynamicAddr()) && start != null
				&& end != null && start >= 0 && end >= start) {
			int plansLen = plans.length;
			String[] allPlans = new String[plansLen + end - start + 1];
			for (int i = 0; i < plansLen; i++) {
				allPlans[i] = plans[i];
			}
			for (int i = 0, len = end - start + 1; i < len; i++) {
				allPlans[plansLen + i] = getDynamicAddrByNum(start + i);
			}
			return allPlans;
		} else {
			return plans;
		}
	}

	public String getDynamicAddrByNum(int num) {
		return StringUtils.replace(getDynamicAddr(), PAGE, String.valueOf(num));
	}

	public int getTotalNum() {
		int count = 0;
		Integer start = getDynamicStart();
		Integer end = getDynamicEnd();
		if (!StringUtils.isBlank(getDynamicAddr()) && start != null
				&& end != null) {
			count = end - start + 1;
		}
		if (!StringUtils.isBlank(getPlanList())) {
			count += getPlans().length;
		}
		return count;
	}

	public void init() {
		if (getStatus() == null) {
			setStatus(STOP);
		}
		if (getCurrNum() == null) {
			setCurrNum(0);
		}
		if (getCurrItem() == null) {
			setCurrItem(0);
		}
		if (getTotalItem() == null) {
			setTotalItem(0);
		}
		if (getPauseTime() == null) {
			setPauseTime(0);
		}
	}	
	private Integer acquisitionId;

    private Integer siteId;

    private Integer channelId;

    private Integer typeId;

    private Integer userId;

    private String acqName;

    private Date startTime;

    private Date endTime;

    private Integer status;

    private Integer currNum;

    private Integer currItem;

    private Integer totalItem;

    private Integer pauseTime;

    private String pageEncoding;

    private String dynamicAddr;

    private Integer dynamicStart;

    private Integer dynamicEnd;

    private String linksetStart;

    private String linksetEnd;

    private String linkStart;

    private String linkEnd;

    private String titleStart;

    private String titleEnd;

    private String keywordsStart;

    private String keywordsEnd;

    private String descriptionStart;

    private String descriptionEnd;

    private String contentStart;

    private String contentEnd;

    private String paginationStart;

    private String paginationEnd;

    private String planList;
    
    private String statusName;

    
    public Integer getAcquisitionId() {
        return acquisitionId;
    }

    public void setAcquisitionId(Integer acquisitionId) {
        this.acquisitionId = acquisitionId;
    }

    public Integer getSiteId() {
        return siteId;
    }

    public void setSiteId(Integer siteId) {
        this.siteId = siteId;
    }

    public Integer getChannelId() {
        return channelId;
    }

    public void setChannelId(Integer channelId) {
        this.channelId = channelId;
    }

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getAcqName() {
        return acqName;
    }

    public void setAcqName(String acqName) {
        this.acqName = acqName == null ? null : acqName.trim();
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getCurrNum() {
        return currNum;
    }

    public void setCurrNum(Integer currNum) {
        this.currNum = currNum;
    }

    public Integer getCurrItem() {
        return currItem;
    }

    public void setCurrItem(Integer currItem) {
        this.currItem = currItem;
    }

    public Integer getTotalItem() {
        return totalItem;
    }

    public void setTotalItem(Integer totalItem) {
        this.totalItem = totalItem;
    }

    public Integer getPauseTime() {
        return pauseTime;
    }

    public void setPauseTime(Integer pauseTime) {
        this.pauseTime = pauseTime;
    }

    public String getPageEncoding() {
        return pageEncoding;
    }

    public void setPageEncoding(String pageEncoding) {
        this.pageEncoding = pageEncoding == null ? null : pageEncoding.trim();
    }

    public String getDynamicAddr() {
        return dynamicAddr;
    }

    public void setDynamicAddr(String dynamicAddr) {
        this.dynamicAddr = dynamicAddr == null ? null : dynamicAddr.trim();
    }

    public Integer getDynamicStart() {
        return dynamicStart;
    }

    public void setDynamicStart(Integer dynamicStart) {
        this.dynamicStart = dynamicStart;
    }

    public Integer getDynamicEnd() {
        return dynamicEnd;
    }

    public void setDynamicEnd(Integer dynamicEnd) {
        this.dynamicEnd = dynamicEnd;
    }

    public String getLinksetStart() {
        return linksetStart;
    }

    public void setLinksetStart(String linksetStart) {
        this.linksetStart = linksetStart == null ? null : linksetStart.trim();
    }

    public String getLinksetEnd() {
        return linksetEnd;
    }

    public void setLinksetEnd(String linksetEnd) {
        this.linksetEnd = linksetEnd == null ? null : linksetEnd.trim();
    }

    public String getLinkStart() {
        return linkStart;
    }

    public void setLinkStart(String linkStart) {
        this.linkStart = linkStart == null ? null : linkStart.trim();
    }

    public String getLinkEnd() {
        return linkEnd;
    }

    public void setLinkEnd(String linkEnd) {
        this.linkEnd = linkEnd == null ? null : linkEnd.trim();
    }

    public String getTitleStart() {
        return titleStart;
    }

    public void setTitleStart(String titleStart) {
        this.titleStart = titleStart == null ? null : titleStart.trim();
    }

    public String getTitleEnd() {
        return titleEnd;
    }

    public void setTitleEnd(String titleEnd) {
        this.titleEnd = titleEnd == null ? null : titleEnd.trim();
    }

    public String getKeywordsStart() {
        return keywordsStart;
    }

    public void setKeywordsStart(String keywordsStart) {
        this.keywordsStart = keywordsStart == null ? null : keywordsStart.trim();
    }

    public String getKeywordsEnd() {
        return keywordsEnd;
    }

    public void setKeywordsEnd(String keywordsEnd) {
        this.keywordsEnd = keywordsEnd == null ? null : keywordsEnd.trim();
    }

    public String getDescriptionStart() {
        return descriptionStart;
    }

    public void setDescriptionStart(String descriptionStart) {
        this.descriptionStart = descriptionStart == null ? null : descriptionStart.trim();
    }

    public String getDescriptionEnd() {
        return descriptionEnd;
    }

    public void setDescriptionEnd(String descriptionEnd) {
        this.descriptionEnd = descriptionEnd == null ? null : descriptionEnd.trim();
    }

    public String getContentStart() {
        return contentStart;
    }

    public void setContentStart(String contentStart) {
        this.contentStart = contentStart == null ? null : contentStart.trim();
    }

    public String getContentEnd() {
        return contentEnd;
    }

    public void setContentEnd(String contentEnd) {
        this.contentEnd = contentEnd == null ? null : contentEnd.trim();
    }

    public String getPaginationStart() {
        return paginationStart;
    }

    public void setPaginationStart(String paginationStart) {
        this.paginationStart = paginationStart == null ? null : paginationStart.trim();
    }

    public String getPaginationEnd() {
        return paginationEnd;
    }

    public void setPaginationEnd(String paginationEnd) {
        this.paginationEnd = paginationEnd == null ? null : paginationEnd.trim();
    }

    public String getPlanList() {
        return planList;
    }

    public void setPlanList(String planList) {
        this.planList = planList == null ? null : planList.trim();
    }

	public String getStatusName() {
		if(status==0){
			setStatusName("停止");
		}else if(status==1){
			setStatusName("运行中");
		}else if(status==2){
			setStatusName("暂停");
		}
		return statusName;
	}

	public void setStatusName(String statuName) {
		this.statusName = statuName;
	}
    
}