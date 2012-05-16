package com.shop.model;

public class ShopGoldPayment {
    private Boolean paymentId;

    private String paymentCode;

    private String paymentName;

    private String paymentInfo;

    private Boolean paymentOnline;

    private Boolean paymentState;

    private Boolean paymentSort;

    private String paymentConfig;

    public Boolean getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(Boolean paymentId) {
        this.paymentId = paymentId;
    }

    public String getPaymentCode() {
        return paymentCode;
    }

    public void setPaymentCode(String paymentCode) {
        this.paymentCode = paymentCode == null ? null : paymentCode.trim();
    }

    public String getPaymentName() {
        return paymentName;
    }

    public void setPaymentName(String paymentName) {
        this.paymentName = paymentName == null ? null : paymentName.trim();
    }

    public String getPaymentInfo() {
        return paymentInfo;
    }

    public void setPaymentInfo(String paymentInfo) {
        this.paymentInfo = paymentInfo == null ? null : paymentInfo.trim();
    }

    public Boolean getPaymentOnline() {
        return paymentOnline;
    }

    public void setPaymentOnline(Boolean paymentOnline) {
        this.paymentOnline = paymentOnline;
    }

    public Boolean getPaymentState() {
        return paymentState;
    }

    public void setPaymentState(Boolean paymentState) {
        this.paymentState = paymentState;
    }

    public Boolean getPaymentSort() {
        return paymentSort;
    }

    public void setPaymentSort(Boolean paymentSort) {
        this.paymentSort = paymentSort;
    }

    public String getPaymentConfig() {
        return paymentConfig;
    }

    public void setPaymentConfig(String paymentConfig) {
        this.paymentConfig = paymentConfig == null ? null : paymentConfig.trim();
    }
}