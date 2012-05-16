package com.shop.model;

import java.math.BigDecimal;

public class ShopRefundLog {
    private Integer logId;

    private Integer orderId;

    private String refundSn;

    private String orderSn;

    private Integer sellerId;

    private Integer storeId;

    private String storeName;

    private Integer buyerId;

    private String buyerName;

    private Integer addTime;

    private BigDecimal orderAmount;

    private BigDecimal orderRefund;

    private String refundPaymentname;

    private String refundPaymentcode;

    private String refundMessage;

    public Integer getLogId() {
        return logId;
    }

    public void setLogId(Integer logId) {
        this.logId = logId;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public String getRefundSn() {
        return refundSn;
    }

    public void setRefundSn(String refundSn) {
        this.refundSn = refundSn == null ? null : refundSn.trim();
    }

    public String getOrderSn() {
        return orderSn;
    }

    public void setOrderSn(String orderSn) {
        this.orderSn = orderSn == null ? null : orderSn.trim();
    }

    public Integer getSellerId() {
        return sellerId;
    }

    public void setSellerId(Integer sellerId) {
        this.sellerId = sellerId;
    }

    public Integer getStoreId() {
        return storeId;
    }

    public void setStoreId(Integer storeId) {
        this.storeId = storeId;
    }

    public String getStoreName() {
        return storeName;
    }

    public void setStoreName(String storeName) {
        this.storeName = storeName == null ? null : storeName.trim();
    }

    public Integer getBuyerId() {
        return buyerId;
    }

    public void setBuyerId(Integer buyerId) {
        this.buyerId = buyerId;
    }

    public String getBuyerName() {
        return buyerName;
    }

    public void setBuyerName(String buyerName) {
        this.buyerName = buyerName == null ? null : buyerName.trim();
    }

    public Integer getAddTime() {
        return addTime;
    }

    public void setAddTime(Integer addTime) {
        this.addTime = addTime;
    }

    public BigDecimal getOrderAmount() {
        return orderAmount;
    }

    public void setOrderAmount(BigDecimal orderAmount) {
        this.orderAmount = orderAmount;
    }

    public BigDecimal getOrderRefund() {
        return orderRefund;
    }

    public void setOrderRefund(BigDecimal orderRefund) {
        this.orderRefund = orderRefund;
    }

    public String getRefundPaymentname() {
        return refundPaymentname;
    }

    public void setRefundPaymentname(String refundPaymentname) {
        this.refundPaymentname = refundPaymentname == null ? null : refundPaymentname.trim();
    }

    public String getRefundPaymentcode() {
        return refundPaymentcode;
    }

    public void setRefundPaymentcode(String refundPaymentcode) {
        this.refundPaymentcode = refundPaymentcode == null ? null : refundPaymentcode.trim();
    }

    public String getRefundMessage() {
        return refundMessage;
    }

    public void setRefundMessage(String refundMessage) {
        this.refundMessage = refundMessage == null ? null : refundMessage.trim();
    }
}