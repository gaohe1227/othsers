package com.doadway.dwcms.core.config.enums;

public enum ModelEnum {
	ChanelModel("栏目模型",1),ContentModel("内容模型",2);
	public String label;
	public Integer value;
	private ModelEnum(String lable,Integer value){
		this.label= lable;
		this.value = value;
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

	public static ModelEnum parseValue(String label){
		for(ModelEnum mEnum:ModelEnum.values()){
			if(mEnum.getLabel().equals(label)){
				return  mEnum;
			}
		}
		return null;
	}
	public static ModelEnum parseLabel(Integer value){
		for(ModelEnum mEnum:ModelEnum.values()){
			if(mEnum.getValue()==value){
				return  mEnum;
			}
		}
		return null;		
	}
}
