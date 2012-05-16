package com.shop.model;

public class ShopConsult {
    private Integer consultId;

    private Integer goodsId;

    private Integer memberId;

    private Integer sellerId;

    private String email;

    private String consultContent;

    private Integer consultAddtime;

    private String consultReply;

    private Integer consultReplyTime;

    private String type;

    public Integer getConsultId() {
        return consultId;
    }

    public void setConsultId(Integer consultId) {
        this.consultId = consultId;
    }

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    public Integer getMemberId() {
        return memberId;
    }

    public void setMemberId(Integer memberId) {
        this.memberId = memberId;
    }

    public Integer getSellerId() {
        return sellerId;
    }

    public void setSellerId(Integer sellerId) {
        this.sellerId = sellerId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getConsultContent() {
        return consultContent;
    }

    public void setConsultContent(String consultContent) {
        this.consultContent = consultContent == null ? null : consultContent.trim();
    }

    public Integer getConsultAddtime() {
        return consultAddtime;
    }

    public void setConsultAddtime(Integer consultAddtime) {
        this.consultAddtime = consultAddtime;
    }

    public String getConsultReply() {
        return consultReply;
    }

    public void setConsultReply(String consultReply) {
        this.consultReply = consultReply == null ? null : consultReply.trim();
    }

    public Integer getConsultReplyTime() {
        return consultReplyTime;
    }

    public void setConsultReplyTime(Integer consultReplyTime) {
        this.consultReplyTime = consultReplyTime;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }
}