package com.shop.model;

public class ShopMemberWithBLOBs extends ShopMember {
    private String messageIds;

    private String prop;

    public String getMessageIds() {
        return messageIds;
    }

    public void setMessageIds(String messageIds) {
        this.messageIds = messageIds == null ? null : messageIds.trim();
    }

    public String getProp() {
        return prop;
    }

    public void setProp(String prop) {
        this.prop = prop == null ? null : prop.trim();
    }
}