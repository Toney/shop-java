package com.shop.model;

import java.util.Date;

public class ShopProp {
    private Integer id;

    private String name;

    private String cardName;

    private String cardPwd;

    private Date startTime;

    private Date endTime;

    private Float value;

    private Boolean type;

    private String condition;

    private Boolean isClose;

    private String img;

    private Boolean isUserd;

    private Boolean isSend;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getCardName() {
        return cardName;
    }

    public void setCardName(String cardName) {
        this.cardName = cardName == null ? null : cardName.trim();
    }

    public String getCardPwd() {
        return cardPwd;
    }

    public void setCardPwd(String cardPwd) {
        this.cardPwd = cardPwd == null ? null : cardPwd.trim();
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

    public Float getValue() {
        return value;
    }

    public void setValue(Float value) {
        this.value = value;
    }

    public Boolean getType() {
        return type;
    }

    public void setType(Boolean type) {
        this.type = type;
    }

    public String getCondition() {
        return condition;
    }

    public void setCondition(String condition) {
        this.condition = condition == null ? null : condition.trim();
    }

    public Boolean getIsClose() {
        return isClose;
    }

    public void setIsClose(Boolean isClose) {
        this.isClose = isClose;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img == null ? null : img.trim();
    }

    public Boolean getIsUserd() {
        return isUserd;
    }

    public void setIsUserd(Boolean isUserd) {
        this.isUserd = isUserd;
    }

    public Boolean getIsSend() {
        return isSend;
    }

    public void setIsSend(Boolean isSend) {
        this.isSend = isSend;
    }
}