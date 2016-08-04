package com.doadway.dwcms.assistant.pojo.dto;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.doadway.dwcms.assistant.pojo.AdvertisingAttr;

public class AdvertisingDTO implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer advertisingId;

    private Integer adspaceId;
    
    private String  adspaceName;
    
    private Integer siteId;

    private String adName;

    private String category;
    
    private String categoryName;

    private Integer adWeight;

    private Long displayCount;

    private Long clickCount;

    private Integer clickRate;
    
    private Date startTime;

    private Date endTime;

    private String isEnabled;

    private String adCode;
    
    List<AdvertisingAttr> advertisingAttrList = new ArrayList<AdvertisingAttr>();
    private String getAdAttrValueByName(String name){
    	if(advertisingAttrList.size()>0){
    		for(AdvertisingAttr adAttr:advertisingAttrList){
    			if(adAttr.getAttrName().equals(name)){
    				 return adAttr.getAttrValue();
    			}
    		}
    	}
    	return "";    	
    }
    public String getImageUrl(){
    	String name="image_url";
    	return getAdAttrValueByName(name);
    }
    public String getImageLink(){
    	String name="image_link";
    	return getAdAttrValueByName(name);
    }
    public String getImageTitle(){
    	String name="image_title";
    	return getAdAttrValueByName(name);
    }
    public String getImageHeight(){
    	String name="image_height";
    	return getAdAttrValueByName(name);
    }
    public String getImageWidth(){
    	String name="image_width";
    	return getAdAttrValueByName(name);
    }
	public Integer getClickRate() {
		Double cCount =new Double(getClickCount());
		Double dCount= new Double(getDisplayCount());
		setClickRate((int)(cCount/dCount*100));
		return clickRate;
	}

	public void setClickRate(Integer clickRate) {
		this.clickRate = clickRate;
	}

	public String getAdspaceName() {
		return adspaceName;
	}

	public void setAdspaceName(String adspaceName) {
		this.adspaceName = adspaceName;
	}

	public String getCategoryName() {
		if(category.equals("image")){
			setCategoryName("图片");
		}else if(category.equals("flash")){
			setCategoryName("FLASH");
		}else if(category.equals("text")){
			setCategoryName("文字");
		}else if(category.equals("code")){
			setCategoryName("代码");
		}else{
			setCategoryName("无类型");
		}		
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public Integer getAdvertisingId() {
		return advertisingId;
	}

	public void setAdvertisingId(Integer advertisingId) {
		this.advertisingId = advertisingId;
	}

	public Integer getAdspaceId() {
		return adspaceId;
	}

	public void setAdspaceId(Integer adspaceId) {
		this.adspaceId = adspaceId;
	}

	public Integer getSiteId() {
		return siteId;
	}

	public void setSiteId(Integer siteId) {
		this.siteId = siteId;
	}

	public String getAdName() {
		return adName;
	}

	public void setAdName(String adName) {
		this.adName = adName;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Integer getAdWeight() {
		return adWeight;
	}

	public void setAdWeight(Integer adWeight) {
		this.adWeight = adWeight;
	}

	public Long getDisplayCount() {
		return displayCount;
	}

	public void setDisplayCount(Long displayCount) {
		this.displayCount = displayCount;
	}

	public Long getClickCount() {
		return clickCount;
	}

	public void setClickCount(Long clickCount) {
		this.clickCount = clickCount;
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

	public String getIsEnabled() {
		return isEnabled;
	}

	public void setIsEnabled(String isEnabled) {
		this.isEnabled = isEnabled;
	}

	public String getAdCode() {
		return adCode;
	}

	public void setAdCode(String adCode) {
		this.adCode = adCode;
	}

	public List<AdvertisingAttr> getAdvertisingAttrList() {
		return advertisingAttrList;
	}

	public void setAdvertisingAttrList(List<AdvertisingAttr> advertisingAttrList) {
		this.advertisingAttrList = advertisingAttrList;
	}
    
    
}
