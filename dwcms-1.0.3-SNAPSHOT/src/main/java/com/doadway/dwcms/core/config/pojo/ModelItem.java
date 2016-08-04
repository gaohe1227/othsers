package com.doadway.dwcms.core.config.pojo;

import java.io.Serializable;

public class ModelItem implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 8652767842822462658L;

	private Integer modelitemId;

    private Integer modelId;

    private String field;

    private String itemLabel;

    private Integer priority;

    private String defValue;

    private String optValue;

    private String textSize;

    private String areaRows;

    private String areaCols;

    private String help;

    private String helpPosition;

    private Integer dataType;

    private Boolean isSingle;

    private Boolean isChannel;

    private Boolean isCustom;

    private Boolean isDisplay;

    public Integer getModelitemId() {
        return modelitemId;
    }

    public void setModelitemId(Integer modelitemId) {
        this.modelitemId = modelitemId;
    }

    public Integer getModelId() {
        return modelId;
    }

    public void setModelId(Integer modelId) {
        this.modelId = modelId;
    }

    public String getField() {
        return field;
    }

    public void setField(String field) {
        this.field = field == null ? null : field.trim();
    }

    public String getItemLabel() {
        return itemLabel;
    }

    public void setItemLabel(String itemLabel) {
        this.itemLabel = itemLabel == null ? null : itemLabel.trim();
    }

    public Integer getPriority() {
        return priority;
    }

    public void setPriority(Integer priority) {
        this.priority = priority;
    }

    public String getDefValue() {
        return defValue;
    }

    public void setDefValue(String defValue) {
        this.defValue = defValue == null ? null : defValue.trim();
    }

    public String getOptValue() {
        return optValue;
    }

    public void setOptValue(String optValue) {
        this.optValue = optValue == null ? null : optValue.trim();
    }

    public String getTextSize() {
        return textSize;
    }

    public void setTextSize(String textSize) {
        this.textSize = textSize == null ? null : textSize.trim();
    }

    public String getAreaRows() {
        return areaRows;
    }

    public void setAreaRows(String areaRows) {
        this.areaRows = areaRows == null ? null : areaRows.trim();
    }

    public String getAreaCols() {
        return areaCols;
    }

    public void setAreaCols(String areaCols) {
        this.areaCols = areaCols == null ? null : areaCols.trim();
    }

    public String getHelp() {
        return help;
    }

    public void setHelp(String help) {
        this.help = help == null ? null : help.trim();
    }

    public String getHelpPosition() {
        return helpPosition;
    }

    public void setHelpPosition(String helpPosition) {
        this.helpPosition = helpPosition == null ? null : helpPosition.trim();
    }

    public Integer getDataType() {
        return dataType;
    }

    public void setDataType(Integer dataType) {
        this.dataType = dataType;
    }

    public Boolean getIsSingle() {
        return isSingle;
    }

    public void setIsSingle(Boolean isSingle) {
        this.isSingle = isSingle;
    }

    public Boolean getIsChannel() {
        return isChannel;
    }

    public void setIsChannel(Boolean isChannel) {
        this.isChannel = isChannel;
    }

    public Boolean getIsCustom() {
        return isCustom;
    }

    public void setIsCustom(Boolean isCustom) {
        this.isCustom = isCustom;
    }

    public Boolean getIsDisplay() {
        return isDisplay;
    }

    public void setIsDisplay(Boolean isDisplay) {
        this.isDisplay = isDisplay;
    }
}