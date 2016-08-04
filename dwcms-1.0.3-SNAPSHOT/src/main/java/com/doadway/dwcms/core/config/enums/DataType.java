package com.doadway.dwcms.core.config.enums;

public enum DataType {
	String("字符串文本",1),Integer("整型文本",2),Area("文本区",4),
	SelectOption("下拉列表",6),CheckBox("单选框",8),Radio("复选框",7),
	Date("日期",5),Float("浮点型文本",3);
	
	public String label;
	public Integer value;
	
	private DataType(String lable,Integer value){
		this.label= lable;
		this.value = value;
	}
	
	public static DataType parseValue(String label){
		for(DataType dEnum:DataType.values()){
			if(dEnum.getLabel().equals(label)){
				return  dEnum;
			}
		}
		return null;
	}
	public static DataType parseLabel(Integer value){
		for(DataType dEnum:DataType.values()){
			if(dEnum.getValue()==value){
				return  dEnum;
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
