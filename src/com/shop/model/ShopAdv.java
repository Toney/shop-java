package com.shop.model;

public class ShopAdv {
    private Integer advId;

    private Integer apId;

    private String advTitle;

    private String advContent;

    private Integer advStartDate;

    private Integer advEndDate;

    private Integer slideSort;

    private Integer memberId;

    private String memberName;

    private Integer clickNum;

    private Short isAllow;

    private String buyStyle;

    private Integer goldpay;

    public Integer getAdvId() {
        return advId;
    }

    public void setAdvId(Integer advId) {
        this.advId = advId;
    }

    public Integer getApId() {
        return apId;
    }

    public void setApId(Integer apId) {
        this.apId = apId;
    }

    public String getAdvTitle() {
        return advTitle;
    }

    public void setAdvTitle(String advTitle) {
        this.advTitle = advTitle == null ? null : advTitle.trim();
    }

    public String getAdvContent() {
        return advContent;
    }

    public void setAdvContent(String advContent) {
        this.advContent = advContent == null ? null : advContent.trim();
    }

    public Integer getAdvStartDate() {
        return advStartDate;
    }

    public void setAdvStartDate(Integer advStartDate) {
        this.advStartDate = advStartDate;
    }

    public Integer getAdvEndDate() {
        return advEndDate;
    }

    public void setAdvEndDate(Integer advEndDate) {
        this.advEndDate = advEndDate;
    }

    public Integer getSlideSort() {
        return slideSort;
    }

    public void setSlideSort(Integer slideSort) {
        this.slideSort = slideSort;
    }

    public Integer getMemberId() {
        return memberId;
    }

    public void setMemberId(Integer memberId) {
        this.memberId = memberId;
    }

    public String getMemberName() {
        return memberName;
    }

    public void setMemberName(String memberName) {
        this.memberName = memberName == null ? null : memberName.trim();
    }

    public Integer getClickNum() {
        return clickNum;
    }

    public void setClickNum(Integer clickNum) {
        this.clickNum = clickNum;
    }

    public Short getIsAllow() {
        return isAllow;
    }

    public void setIsAllow(Short isAllow) {
        this.isAllow = isAllow;
    }

    public String getBuyStyle() {
        return buyStyle;
    }

    public void setBuyStyle(String buyStyle) {
        this.buyStyle = buyStyle == null ? null : buyStyle.trim();
    }

    public Integer getGoldpay() {
        return goldpay;
    }

    public void setGoldpay(Integer goldpay) {
        this.goldpay = goldpay;
    }
}