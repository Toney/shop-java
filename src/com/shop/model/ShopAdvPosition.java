package com.shop.model;

public class ShopAdvPosition {
    private Integer apId;

    private String apName;

    private String apIntro;

    private Short apClass;

    private Short apDisplay;

    private Short isUse;

    private Integer apWidth;

    private Integer apHeight;

    private Integer apPrice;

    private Integer advNum;

    private Integer clickNum;

    private String defaultContent;

    public Integer getApId() {
        return apId;
    }

    public void setApId(Integer apId) {
        this.apId = apId;
    }

    public String getApName() {
        return apName;
    }

    public void setApName(String apName) {
        this.apName = apName == null ? null : apName.trim();
    }

    public String getApIntro() {
        return apIntro;
    }

    public void setApIntro(String apIntro) {
        this.apIntro = apIntro == null ? null : apIntro.trim();
    }

    public Short getApClass() {
        return apClass;
    }

    public void setApClass(Short apClass) {
        this.apClass = apClass;
    }

    public Short getApDisplay() {
        return apDisplay;
    }

    public void setApDisplay(Short apDisplay) {
        this.apDisplay = apDisplay;
    }

    public Short getIsUse() {
        return isUse;
    }

    public void setIsUse(Short isUse) {
        this.isUse = isUse;
    }

    public Integer getApWidth() {
        return apWidth;
    }

    public void setApWidth(Integer apWidth) {
        this.apWidth = apWidth;
    }

    public Integer getApHeight() {
        return apHeight;
    }

    public void setApHeight(Integer apHeight) {
        this.apHeight = apHeight;
    }

    public Integer getApPrice() {
        return apPrice;
    }

    public void setApPrice(Integer apPrice) {
        this.apPrice = apPrice;
    }

    public Integer getAdvNum() {
        return advNum;
    }

    public void setAdvNum(Integer advNum) {
        this.advNum = advNum;
    }

    public Integer getClickNum() {
        return clickNum;
    }

    public void setClickNum(Integer clickNum) {
        this.clickNum = clickNum;
    }

    public String getDefaultContent() {
        return defaultContent;
    }

    public void setDefaultContent(String defaultContent) {
        this.defaultContent = defaultContent == null ? null : defaultContent.trim();
    }
}