package com.shop.model;

import java.util.Date;

public class ShopRefundmentDoc {
    private Integer id;

    private String orderNo;

    private Integer orderId;

    private Integer userId;

    private Float amount;

    private Date time;

    private Boolean refundmentType;

    private String refundmentUsername;

    private String refundmentName;

    private String refundmentAccount;

    private Integer refundmentBank;

    private Integer adminId;

    private Byte payStatus;

    private Date disposeTime;

    private Byte ifDel;

    private String bankName;

    private String bankAccount;

    private Date bankTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo == null ? null : orderNo.trim();
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Float getAmount() {
        return amount;
    }

    public void setAmount(Float amount) {
        this.amount = amount;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Boolean getRefundmentType() {
        return refundmentType;
    }

    public void setRefundmentType(Boolean refundmentType) {
        this.refundmentType = refundmentType;
    }

    public String getRefundmentUsername() {
        return refundmentUsername;
    }

    public void setRefundmentUsername(String refundmentUsername) {
        this.refundmentUsername = refundmentUsername == null ? null : refundmentUsername.trim();
    }

    public String getRefundmentName() {
        return refundmentName;
    }

    public void setRefundmentName(String refundmentName) {
        this.refundmentName = refundmentName == null ? null : refundmentName.trim();
    }

    public String getRefundmentAccount() {
        return refundmentAccount;
    }

    public void setRefundmentAccount(String refundmentAccount) {
        this.refundmentAccount = refundmentAccount == null ? null : refundmentAccount.trim();
    }

    public Integer getRefundmentBank() {
        return refundmentBank;
    }

    public void setRefundmentBank(Integer refundmentBank) {
        this.refundmentBank = refundmentBank;
    }

    public Integer getAdminId() {
        return adminId;
    }

    public void setAdminId(Integer adminId) {
        this.adminId = adminId;
    }

    public Byte getPayStatus() {
        return payStatus;
    }

    public void setPayStatus(Byte payStatus) {
        this.payStatus = payStatus;
    }

    public Date getDisposeTime() {
        return disposeTime;
    }

    public void setDisposeTime(Date disposeTime) {
        this.disposeTime = disposeTime;
    }

    public Byte getIfDel() {
        return ifDel;
    }

    public void setIfDel(Byte ifDel) {
        this.ifDel = ifDel;
    }

    public String getBankName() {
        return bankName;
    }

    public void setBankName(String bankName) {
        this.bankName = bankName == null ? null : bankName.trim();
    }

    public String getBankAccount() {
        return bankAccount;
    }

    public void setBankAccount(String bankAccount) {
        this.bankAccount = bankAccount == null ? null : bankAccount.trim();
    }

    public Date getBankTime() {
        return bankTime;
    }

    public void setBankTime(Date bankTime) {
        this.bankTime = bankTime;
    }
}