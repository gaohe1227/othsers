package com.doadway.dwcms.core.content.enums;

public enum ContentTypeEnum {
	common("普通",1),imageText("图文",2),focus("焦点",3),topLine("头条",4);
	public String label;
	public Integer value;
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
	private ContentTypeEnum(String label, Integer value) {
		this.label = label;
		this.value = value;
	}
	public static ContentTypeEnum parseValue(String label){
		for(ContentTypeEnum typeEnum:ContentTypeEnum.values()){
			if(typeEnum.getLabel().equals(label)){
				return  typeEnum;
			}
		}
		return null;
	}
	public static ContentTypeEnum parseLabel(Integer value){
		for(ContentTypeEnum typeEnum:ContentTypeEnum.values()){
			if(typeEnum.getValue()==value){
				return  typeEnum;
			}
		}
		return null;		
	}	
}
