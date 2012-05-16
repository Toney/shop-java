package com.shop.model;

import java.util.Date;

public class ShopPromotion {
    private Integer id;

    private Date startTime;

    private Date endTime;

    private Integer condition;

    private Boolean type;

    private String awardValue;

    private String name;

    private Boolean awardType;

    private Boolean isClose;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Integer getCondition() {
        return condition;
    }

    public void setCondition(Integer condition) {
        this.condition = condition;
    }

    public Boolean getType() {
        return type;
    }

    public void setType(Boolean type) {
        this.type = type;
    }

    public String getAwardValue() {
        return awardValue;
    }

    public void setAwardValue(String awardValue) {
        this.awardValue = awardValue == null ? null : awardValue.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Boolean getAwardType() {
        return awardType;
    }

    public void setAwardType(Boolean awardType) {
        this.awardType = awardType;
    }

    public Boolean getIsClose() {
        return isClose;
    }

    public void setIsClose(Boolean isClose) {
        this.isClose = isClose;
    }
}