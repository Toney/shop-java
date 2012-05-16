package com.shop.model;

public class ShopUserGroup {
    private Integer id;

    private String groupName;

    private Float discount;

    private Integer minexp;

    private Integer maxexp;

    private String messageIds;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName == null ? null : groupName.trim();
    }

    public Float getDiscount() {
        return discount;
    }

    public void setDiscount(Float discount) {
        this.discount = discount;
    }

    public Integer getMinexp() {
        return minexp;
    }

    public void setMinexp(Integer minexp) {
        this.minexp = minexp;
    }

    public Integer getMaxexp() {
        return maxexp;
    }

    public void setMaxexp(Integer maxexp) {
        this.maxexp = maxexp;
    }

    public String getMessageIds() {
        return messageIds;
    }

    public void setMessageIds(String messageIds) {
        this.messageIds = messageIds == null ? null : messageIds.trim();
    }
}