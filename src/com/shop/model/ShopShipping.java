package com.shop.model;

import java.math.BigDecimal;

public class ShopShipping {
    private Integer shippingId;

    private String shippingName;

    private String shippingInfo;

    private Integer shippingIcfWeight;

    private BigDecimal shippingIcfFee;

    private Integer shippingIcfAddWeight;

    private BigDecimal shippingIcfAddFee;

    private Integer shippingOcfWeight;

    private BigDecimal shippingOcfFee;

    private Integer shippingOcfAddWeight;

    private BigDecimal shippingOcfAddFee;

    private BigDecimal shippingFee;

    private Integer shippingFee1;

    private Boolean shippingState;

    private Integer shippingSort;

    private Integer storeId;

    private String shippingArea;

    public Integer getShippingId() {
        return shippingId;
    }

    public void setShippingId(Integer shippingId) {
        this.shippingId = shippingId;
    }

    public String getShippingName() {
        return shippingName;
    }

    public void setShippingName(String shippingName) {
        this.shippingName = shippingName == null ? null : shippingName.trim();
    }

    public String getShippingInfo() {
        return shippingInfo;
    }

    public void setShippingInfo(String shippingInfo) {
        this.shippingInfo = shippingInfo == null ? null : shippingInfo.trim();
    }

    public Integer getShippingIcfWeight() {
        return shippingIcfWeight;
    }

    public void setShippingIcfWeight(Integer shippingIcfWeight) {
        this.shippingIcfWeight = shippingIcfWeight;
    }

    public BigDecimal getShippingIcfFee() {
        return shippingIcfFee;
    }

    public void setShippingIcfFee(BigDecimal shippingIcfFee) {
        this.shippingIcfFee = shippingIcfFee;
    }

    public Integer getShippingIcfAddWeight() {
        return shippingIcfAddWeight;
    }

    public void setShippingIcfAddWeight(Integer shippingIcfAddWeight) {
        this.shippingIcfAddWeight = shippingIcfAddWeight;
    }

    public BigDecimal getShippingIcfAddFee() {
        return shippingIcfAddFee;
    }

    public void setShippingIcfAddFee(BigDecimal shippingIcfAddFee) {
        this.shippingIcfAddFee = shippingIcfAddFee;
    }

    public Integer getShippingOcfWeight() {
        return shippingOcfWeight;
    }

    public void setShippingOcfWeight(Integer shippingOcfWeight) {
        this.shippingOcfWeight = shippingOcfWeight;
    }

    public BigDecimal getShippingOcfFee() {
        return shippingOcfFee;
    }

    public void setShippingOcfFee(BigDecimal shippingOcfFee) {
        this.shippingOcfFee = shippingOcfFee;
    }

    public Integer getShippingOcfAddWeight() {
        return shippingOcfAddWeight;
    }

    public void setShippingOcfAddWeight(Integer shippingOcfAddWeight) {
        this.shippingOcfAddWeight = shippingOcfAddWeight;
    }

    public BigDecimal getShippingOcfAddFee() {
        return shippingOcfAddFee;
    }

    public void setShippingOcfAddFee(BigDecimal shippingOcfAddFee) {
        this.shippingOcfAddFee = shippingOcfAddFee;
    }

    public BigDecimal getShippingFee() {
        return shippingFee;
    }

    public void setShippingFee(BigDecimal shippingFee) {
        this.shippingFee = shippingFee;
    }

    public Integer getShippingFee1() {
        return shippingFee1;
    }

    public void setShippingFee1(Integer shippingFee1) {
        this.shippingFee1 = shippingFee1;
    }

    public Boolean getShippingState() {
        return shippingState;
    }

    public void setShippingState(Boolean shippingState) {
        this.shippingState = shippingState;
    }

    public Integer getShippingSort() {
        return shippingSort;
    }

    public void setShippingSort(Integer shippingSort) {
        this.shippingSort = shippingSort;
    }

    public Integer getStoreId() {
        return storeId;
    }

    public void setStoreId(Integer storeId) {
        this.storeId = storeId;
    }

    public String getShippingArea() {
        return shippingArea;
    }

    public void setShippingArea(String shippingArea) {
        this.shippingArea = shippingArea == null ? null : shippingArea.trim();
    }
}