package com.shop.model;

import java.math.BigDecimal;

public class ShopVoucher {
    private Integer voucherId;

    private String voucherCode;

    private Integer voucherTId;

    private String voucherTitle;

    private String voucherDesc;

    private Integer voucherStartDate;

    private Integer voucherEndDate;

    private Integer voucherPrice;

    private BigDecimal voucherLimit;

    private Integer voucherStoreId;

    private Byte voucherState;

    private Integer voucherActiveDate;

    private Byte voucherType;

    private Integer voucherOwnerId;

    private String voucherOwnerName;

    private Integer voucherOrderId;

    public Integer getVoucherId() {
        return voucherId;
    }

    public void setVoucherId(Integer voucherId) {
        this.voucherId = voucherId;
    }

    public String getVoucherCode() {
        return voucherCode;
    }

    public void setVoucherCode(String voucherCode) {
        this.voucherCode = voucherCode == null ? null : voucherCode.trim();
    }

    public Integer getVoucherTId() {
        return voucherTId;
    }

    public void setVoucherTId(Integer voucherTId) {
        this.voucherTId = voucherTId;
    }

    public String getVoucherTitle() {
        return voucherTitle;
    }

    public void setVoucherTitle(String voucherTitle) {
        this.voucherTitle = voucherTitle == null ? null : voucherTitle.trim();
    }

    public String getVoucherDesc() {
        return voucherDesc;
    }

    public void setVoucherDesc(String voucherDesc) {
        this.voucherDesc = voucherDesc == null ? null : voucherDesc.trim();
    }

    public Integer getVoucherStartDate() {
        return voucherStartDate;
    }

    public void setVoucherStartDate(Integer voucherStartDate) {
        this.voucherStartDate = voucherStartDate;
    }

    public Integer getVoucherEndDate() {
        return voucherEndDate;
    }

    public void setVoucherEndDate(Integer voucherEndDate) {
        this.voucherEndDate = voucherEndDate;
    }

    public Integer getVoucherPrice() {
        return voucherPrice;
    }

    public void setVoucherPrice(Integer voucherPrice) {
        this.voucherPrice = voucherPrice;
    }

    public BigDecimal getVoucherLimit() {
        return voucherLimit;
    }

    public void setVoucherLimit(BigDecimal voucherLimit) {
        this.voucherLimit = voucherLimit;
    }

    public Integer getVoucherStoreId() {
        return voucherStoreId;
    }

    public void setVoucherStoreId(Integer voucherStoreId) {
        this.voucherStoreId = voucherStoreId;
    }

    public Byte getVoucherState() {
        return voucherState;
    }

    public void setVoucherState(Byte voucherState) {
        this.voucherState = voucherState;
    }

    public Integer getVoucherActiveDate() {
        return voucherActiveDate;
    }

    public void setVoucherActiveDate(Integer voucherActiveDate) {
        this.voucherActiveDate = voucherActiveDate;
    }

    public Byte getVoucherType() {
        return voucherType;
    }

    public void setVoucherType(Byte voucherType) {
        this.voucherType = voucherType;
    }

    public Integer getVoucherOwnerId() {
        return voucherOwnerId;
    }

    public void setVoucherOwnerId(Integer voucherOwnerId) {
        this.voucherOwnerId = voucherOwnerId;
    }

    public String getVoucherOwnerName() {
        return voucherOwnerName;
    }

    public void setVoucherOwnerName(String voucherOwnerName) {
        this.voucherOwnerName = voucherOwnerName == null ? null : voucherOwnerName.trim();
    }

    public Integer getVoucherOrderId() {
        return voucherOrderId;
    }

    public void setVoucherOrderId(Integer voucherOrderId) {
        this.voucherOrderId = voucherOrderId;
    }
}