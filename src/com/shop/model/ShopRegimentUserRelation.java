package com.shop.model;

import java.util.Date;

public class ShopRegimentUserRelation {
    private Integer id;

    private Integer userId;

    private Integer regimentId;

    private Date joinTime;

    private Byte isOver;

    private String hash;

    private String orderNo;

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

    public Integer getRegimentId() {
        return regimentId;
    }

    public void setRegimentId(Integer regimentId) {
        this.regimentId = regimentId;
    }

    public Date getJoinTime() {
        return joinTime;
    }

    public void setJoinTime(Date joinTime) {
        this.joinTime = joinTime;
    }

    public Byte getIsOver() {
        return isOver;
    }

    public void setIsOver(Byte isOver) {
        this.isOver = isOver;
    }

    public String getHash() {
        return hash;
    }

    public void setHash(String hash) {
        this.hash = hash == null ? null : hash.trim();
    }

    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo == null ? null : orderNo.trim();
    }
}