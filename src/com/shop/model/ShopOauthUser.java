package com.shop.model;

import java.util.Date;

public class ShopOauthUser {
    private Integer id;

    private String oauthUserId;

    private Short oauthId;

    private Integer userId;

    private Date datetime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOauthUserId() {
        return oauthUserId;
    }

    public void setOauthUserId(String oauthUserId) {
        this.oauthUserId = oauthUserId == null ? null : oauthUserId.trim();
    }

    public Short getOauthId() {
        return oauthId;
    }

    public void setOauthId(Short oauthId) {
        this.oauthId = oauthId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Date getDatetime() {
        return datetime;
    }

    public void setDatetime(Date datetime) {
        this.datetime = datetime;
    }
}