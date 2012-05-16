package com.shop.model;

public class ShopStoreWatermark {
    private Integer wmId;

    private Integer jpegQuality;

    private String wmImageName;

    private Boolean wmImagePos;

    private Integer wmImageTransition;

    private Integer wmTextSize;

    private Boolean wmTextAngle;

    private Boolean wmTextPos;

    private String wmTextFont;

    private String wmTextColor;

    private Boolean wmIsOpen;

    private Integer storeId;

    private String wmText;

    public Integer getWmId() {
        return wmId;
    }

    public void setWmId(Integer wmId) {
        this.wmId = wmId;
    }

    public Integer getJpegQuality() {
        return jpegQuality;
    }

    public void setJpegQuality(Integer jpegQuality) {
        this.jpegQuality = jpegQuality;
    }

    public String getWmImageName() {
        return wmImageName;
    }

    public void setWmImageName(String wmImageName) {
        this.wmImageName = wmImageName == null ? null : wmImageName.trim();
    }

    public Boolean getWmImagePos() {
        return wmImagePos;
    }

    public void setWmImagePos(Boolean wmImagePos) {
        this.wmImagePos = wmImagePos;
    }

    public Integer getWmImageTransition() {
        return wmImageTransition;
    }

    public void setWmImageTransition(Integer wmImageTransition) {
        this.wmImageTransition = wmImageTransition;
    }

    public Integer getWmTextSize() {
        return wmTextSize;
    }

    public void setWmTextSize(Integer wmTextSize) {
        this.wmTextSize = wmTextSize;
    }

    public Boolean getWmTextAngle() {
        return wmTextAngle;
    }

    public void setWmTextAngle(Boolean wmTextAngle) {
        this.wmTextAngle = wmTextAngle;
    }

    public Boolean getWmTextPos() {
        return wmTextPos;
    }

    public void setWmTextPos(Boolean wmTextPos) {
        this.wmTextPos = wmTextPos;
    }

    public String getWmTextFont() {
        return wmTextFont;
    }

    public void setWmTextFont(String wmTextFont) {
        this.wmTextFont = wmTextFont == null ? null : wmTextFont.trim();
    }

    public String getWmTextColor() {
        return wmTextColor;
    }

    public void setWmTextColor(String wmTextColor) {
        this.wmTextColor = wmTextColor == null ? null : wmTextColor.trim();
    }

    public Boolean getWmIsOpen() {
        return wmIsOpen;
    }

    public void setWmIsOpen(Boolean wmIsOpen) {
        this.wmIsOpen = wmIsOpen;
    }

    public Integer getStoreId() {
        return storeId;
    }

    public void setStoreId(Integer storeId) {
        this.storeId = storeId;
    }

    public String getWmText() {
        return wmText;
    }

    public void setWmText(String wmText) {
        this.wmText = wmText == null ? null : wmText.trim();
    }
}