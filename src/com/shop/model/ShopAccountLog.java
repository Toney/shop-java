package com.shop.model;

import java.util.Date;

public class ShopAccountLog {
    private Integer id;

    private Integer adminId;

    private Integer userId;

    private Boolean type;

    private Byte event;

    private Date time;

    private Float amount;

    private Float amountLog;

    private String note;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getAdminId() {
        return adminId;
    }

    public void setAdminId(Integer adminId) {
        this.adminId = adminId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Boolean getType() {
        return type;
    }

    public void setType(Boolean type) {
        this.type = type;
    }

    public Byte getEvent() {
        return event;
    }

    public void setEvent(Byte event) {
        this.event = event;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Float getAmount() {
        return amount;
    }

    public void setAmount(Float amount) {
        this.amount = amount;
    }

    public Float getAmountLog() {
        return amountLog;
    }

    public void setAmountLog(Float amountLog) {
        this.amountLog = amountLog;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note == null ? null : note.trim();
    }
}