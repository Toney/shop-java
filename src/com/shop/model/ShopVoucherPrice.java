package com.shop.model;

public class ShopVoucherPrice {
    private Integer voucherPriceId;

    private String voucherPriceDescribe;

    private Integer voucherPrice;

    public Integer getVoucherPriceId() {
        return voucherPriceId;
    }

    public void setVoucherPriceId(Integer voucherPriceId) {
        this.voucherPriceId = voucherPriceId;
    }

    public String getVoucherPriceDescribe() {
        return voucherPriceDescribe;
    }

    public void setVoucherPriceDescribe(String voucherPriceDescribe) {
        this.voucherPriceDescribe = voucherPriceDescribe == null ? null : voucherPriceDescribe.trim();
    }

    public Integer getVoucherPrice() {
        return voucherPrice;
    }

    public void setVoucherPrice(Integer voucherPrice) {
        this.voucherPrice = voucherPrice;
    }
}