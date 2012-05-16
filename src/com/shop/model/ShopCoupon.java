package com.shop.model;

import java.math.BigDecimal;

public class ShopCoupon {
    private Integer couponId;

    private String couponTitle;

    private String couponType;

    private String couponPic;

    private String couponDesc;

    private Integer couponStartDate;

    private Integer couponEndDate;

    private BigDecimal couponPrice;

    private BigDecimal couponLimit;

    private Integer storeId;

    private String couponState;

    private Integer couponStorage;

    private Integer couponUsage;

    private String couponLock;

    private Integer couponAddDate;

    private Integer couponClassId;

    private Integer couponClick;

    private String couponPrintStyle;

    private Boolean couponRecommend;

    private Boolean couponAllowstate;

    private String couponAllowremark;

    public Integer getCouponId() {
        return couponId;
    }

    public void setCouponId(Integer couponId) {
        this.couponId = couponId;
    }

    public String getCouponTitle() {
        return couponTitle;
    }

    public void setCouponTitle(String couponTitle) {
        this.couponTitle = couponTitle == null ? null : couponTitle.trim();
    }

    public String getCouponType() {
        return couponType;
    }

    public void setCouponType(String couponType) {
        this.couponType = couponType == null ? null : couponType.trim();
    }

    public String getCouponPic() {
        return couponPic;
    }

    public void setCouponPic(String couponPic) {
        this.couponPic = couponPic == null ? null : couponPic.trim();
    }

    public String getCouponDesc() {
        return couponDesc;
    }

    public void setCouponDesc(String couponDesc) {
        this.couponDesc = couponDesc == null ? null : couponDesc.trim();
    }

    public Integer getCouponStartDate() {
        return couponStartDate;
    }

    public void setCouponStartDate(Integer couponStartDate) {
        this.couponStartDate = couponStartDate;
    }

    public Integer getCouponEndDate() {
        return couponEndDate;
    }

    public void setCouponEndDate(Integer couponEndDate) {
        this.couponEndDate = couponEndDate;
    }

    public BigDecimal getCouponPrice() {
        return couponPrice;
    }

    public void setCouponPrice(BigDecimal couponPrice) {
        this.couponPrice = couponPrice;
    }

    public BigDecimal getCouponLimit() {
        return couponLimit;
    }

    public void setCouponLimit(BigDecimal couponLimit) {
        this.couponLimit = couponLimit;
    }

    public Integer getStoreId() {
        return storeId;
    }

    public void setStoreId(Integer storeId) {
        this.storeId = storeId;
    }

    public String getCouponState() {
        return couponState;
    }

    public void setCouponState(String couponState) {
        this.couponState = couponState == null ? null : couponState.trim();
    }

    public Integer getCouponStorage() {
        return couponStorage;
    }

    public void setCouponStorage(Integer couponStorage) {
        this.couponStorage = couponStorage;
    }

    public Integer getCouponUsage() {
        return couponUsage;
    }

    public void setCouponUsage(Integer couponUsage) {
        this.couponUsage = couponUsage;
    }

    public String getCouponLock() {
        return couponLock;
    }

    public void setCouponLock(String couponLock) {
        this.couponLock = couponLock == null ? null : couponLock.trim();
    }

    public Integer getCouponAddDate() {
        return couponAddDate;
    }

    public void setCouponAddDate(Integer couponAddDate) {
        this.couponAddDate = couponAddDate;
    }

    public Integer getCouponClassId() {
        return couponClassId;
    }

    public void setCouponClassId(Integer couponClassId) {
        this.couponClassId = couponClassId;
    }

    public Integer getCouponClick() {
        return couponClick;
    }

    public void setCouponClick(Integer couponClick) {
        this.couponClick = couponClick;
    }

    public String getCouponPrintStyle() {
        return couponPrintStyle;
    }

    public void setCouponPrintStyle(String couponPrintStyle) {
        this.couponPrintStyle = couponPrintStyle == null ? null : couponPrintStyle.trim();
    }

    public Boolean getCouponRecommend() {
        return couponRecommend;
    }

    public void setCouponRecommend(Boolean couponRecommend) {
        this.couponRecommend = couponRecommend;
    }

    public Boolean getCouponAllowstate() {
        return couponAllowstate;
    }

    public void setCouponAllowstate(Boolean couponAllowstate) {
        this.couponAllowstate = couponAllowstate;
    }

    public String getCouponAllowremark() {
        return couponAllowremark;
    }

    public void setCouponAllowremark(String couponAllowremark) {
        this.couponAllowremark = couponAllowremark == null ? null : couponAllowremark.trim();
    }
}