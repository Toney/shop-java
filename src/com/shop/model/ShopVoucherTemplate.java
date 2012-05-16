package com.shop.model;

import java.math.BigDecimal;

public class ShopVoucherTemplate {
    private Integer voucherTId;

    private String voucherTTitle;

    private String voucherTDesc;

    private Integer voucherTStartDate;

    private Integer voucherTEndDate;

    private Integer voucherTPrice;

    private BigDecimal voucherTLimit;

    private Integer voucherTStoreId;

    private Integer voucherTCreatorId;

    private Byte voucherTState;

    private Integer voucherTTotal;

    private Integer voucherTGiveout;

    private Integer voucherTUsed;

    private Integer voucherTAddDate;

    private Byte voucherTType;

    public Integer getVoucherTId() {
        return voucherTId;
    }

    public void setVoucherTId(Integer voucherTId) {
        this.voucherTId = voucherTId;
    }

    public String getVoucherTTitle() {
        return voucherTTitle;
    }

    public void setVoucherTTitle(String voucherTTitle) {
        this.voucherTTitle = voucherTTitle == null ? null : voucherTTitle.trim();
    }

    public String getVoucherTDesc() {
        return voucherTDesc;
    }

    public void setVoucherTDesc(String voucherTDesc) {
        this.voucherTDesc = voucherTDesc == null ? null : voucherTDesc.trim();
    }

    public Integer getVoucherTStartDate() {
        return voucherTStartDate;
    }

    public void setVoucherTStartDate(Integer voucherTStartDate) {
        this.voucherTStartDate = voucherTStartDate;
    }

    public Integer getVoucherTEndDate() {
        return voucherTEndDate;
    }

    public void setVoucherTEndDate(Integer voucherTEndDate) {
        this.voucherTEndDate = voucherTEndDate;
    }

    public Integer getVoucherTPrice() {
        return voucherTPrice;
    }

    public void setVoucherTPrice(Integer voucherTPrice) {
        this.voucherTPrice = voucherTPrice;
    }

    public BigDecimal getVoucherTLimit() {
        return voucherTLimit;
    }

    public void setVoucherTLimit(BigDecimal voucherTLimit) {
        this.voucherTLimit = voucherTLimit;
    }

    public Integer getVoucherTStoreId() {
        return voucherTStoreId;
    }

    public void setVoucherTStoreId(Integer voucherTStoreId) {
        this.voucherTStoreId = voucherTStoreId;
    }

    public Integer getVoucherTCreatorId() {
        return voucherTCreatorId;
    }

    public void setVoucherTCreatorId(Integer voucherTCreatorId) {
        this.voucherTCreatorId = voucherTCreatorId;
    }

    public Byte getVoucherTState() {
        return voucherTState;
    }

    public void setVoucherTState(Byte voucherTState) {
        this.voucherTState = voucherTState;
    }

    public Integer getVoucherTTotal() {
        return voucherTTotal;
    }

    public void setVoucherTTotal(Integer voucherTTotal) {
        this.voucherTTotal = voucherTTotal;
    }

    public Integer getVoucherTGiveout() {
        return voucherTGiveout;
    }

    public void setVoucherTGiveout(Integer voucherTGiveout) {
        this.voucherTGiveout = voucherTGiveout;
    }

    public Integer getVoucherTUsed() {
        return voucherTUsed;
    }

    public void setVoucherTUsed(Integer voucherTUsed) {
        this.voucherTUsed = voucherTUsed;
    }

    public Integer getVoucherTAddDate() {
        return voucherTAddDate;
    }

    public void setVoucherTAddDate(Integer voucherTAddDate) {
        this.voucherTAddDate = voucherTAddDate;
    }

    public Byte getVoucherTType() {
        return voucherTType;
    }

    public void setVoucherTType(Byte voucherTType) {
        this.voucherTType = voucherTType;
    }
}