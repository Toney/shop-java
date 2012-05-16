package com.shop.model;

public class ShopGroupbuyJoin {
    private Integer groupId;

    private Integer memberId;

    private String memberName;

    private Boolean quantity;

    private String owner;

    private String tel;

    private Integer orderId;

    private Integer addTime;

    private String specQuantity;

    public Integer getGroupId() {
        return groupId;
    }

    public void setGroupId(Integer groupId) {
        this.groupId = groupId;
    }

    public Integer getMemberId() {
        return memberId;
    }

    public void setMemberId(Integer memberId) {
        this.memberId = memberId;
    }

    public String getMemberName() {
        return memberName;
    }

    public void setMemberName(String memberName) {
        this.memberName = memberName == null ? null : memberName.trim();
    }

    public Boolean getQuantity() {
        return quantity;
    }

    public void setQuantity(Boolean quantity) {
        this.quantity = quantity;
    }

    public String getOwner() {
        return owner;
    }

    public void setOwner(String owner) {
        this.owner = owner == null ? null : owner.trim();
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel == null ? null : tel.trim();
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Integer getAddTime() {
        return addTime;
    }

    public void setAddTime(Integer addTime) {
        this.addTime = addTime;
    }

    public String getSpecQuantity() {
        return specQuantity;
    }

    public void setSpecQuantity(String specQuantity) {
        this.specQuantity = specQuantity == null ? null : specQuantity.trim();
    }
}