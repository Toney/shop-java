package com.shop.model;

import java.util.Date;

public class ShopOnlineRecharge {
    private Integer id;

    private Integer userId;

    private String rechargeNo;

    private Float account;

    private Date time;

    private String paymentName;

    private Boolean status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getRechargeNo() {
        return rechargeNo;
    }

    public void setRechargeNo(String rechargeNo) {
        this.rechargeNo = rechargeNo == null ? null : rechargeNo.trim();
    }

    public Float getAccount() {
        return account;
    }

    public void setAccount(Float account) {
        this.account = account;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getPaymentName() {
        return paymentName;
    }

    public void setPaymentName(String paymentName) {
        this.paymentName = paymentName == null ? null : paymentName.trim();
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }
}