package com.doadway.dwcms.core.content.enums;


public enum ContentStatusEnum {
	draft("草稿",0),prepared("待审",1),passed("已审",2),checked("已终审",3),recycle("回收站",4),reject("退回",5);
	public String label;
	public Integer value;
	private ContentStatusEnum(String label, Integer value) {
		this.label = label;
		this.value = value;
	}	
	public static ContentStatusEnum parseValue(String label){
		for(ContentStatusEnum statusEnum:ContentStatusEnum.values()){
			if(statusEnum.getLabel().equals(label)){
				return  statusEnum;
			}
		}
		return null;
	}
	public static ContentStatusEnum parseLabel(Integer value){
		for(ContentStatusEnum statusEnum:ContentStatusEnum.values()){
			if(statusEnum.getValue()==value){
				return  statusEnum;
			}
		}
		return null;		
	}
	public String getLabel() {
		return label;
	}
	public void setLabel(String label) {
		this.label = label;
	}
	public Integer getValue() {
		return value;
	}
	public void setValue(Integer value) {
		this.value = value;
	}	
	
	
}
