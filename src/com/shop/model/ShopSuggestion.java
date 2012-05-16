package com.shop.model;

import java.util.Date;

public class ShopSuggestion {
    private Integer id;

    private Integer userId;

    private String title;

    private Date time;

    private Integer adminId;

    private Date reTime;

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

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Integer getAdminId() {
        return adminId;
    }

    public void setAdminId(Integer adminId) {
        this.adminId = adminId;
    }

    public Date getReTime() {
        return reTime;
    }

    public void setReTime(Date reTime) {
        this.reTime = reTime;
    }
}