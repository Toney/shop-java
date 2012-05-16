package com.shop.model;

import java.util.Date;

public class ShopAfterSell {
    private Integer id;

    private Integer orderId;

    private Integer userId;

    private Date time;

    private String cause;

    private Boolean done;

    private Boolean status;

    private String name;

    private String accountBank;

    private String belongBank;

    private Integer returnsType;

    private String account;

    private String content;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getCause() {
        return cause;
    }

    public void setCause(String cause) {
        this.cause = cause == null ? null : cause.trim();
    }

    public Boolean getDone() {
        return done;
    }

    public void setDone(Boolean done) {
        this.done = done;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getAccountBank() {
        return accountBank;
    }

    public void setAccountBank(String accountBank) {
        this.accountBank = accountBank == null ? null : accountBank.trim();
    }

    public String getBelongBank() {
        return belongBank;
    }

    public void setBelongBank(String belongBank) {
        this.belongBank = belongBank == null ? null : belongBank.trim();
    }

    public Integer getReturnsType() {
        return returnsType;
    }

    public void setReturnsType(Integer returnsType) {
        this.returnsType = returnsType;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account == null ? null : account.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}