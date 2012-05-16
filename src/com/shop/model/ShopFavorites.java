package com.shop.model;

public class ShopFavorites {
    private Integer memberId;

    private Integer favId;

    private String favType;

    private String favTime;

    public Integer getMemberId() {
        return memberId;
    }

    public void setMemberId(Integer memberId) {
        this.memberId = memberId;
    }

    public Integer getFavId() {
        return favId;
    }

    public void setFavId(Integer favId) {
        this.favId = favId;
    }

    public String getFavType() {
        return favType;
    }

    public void setFavType(String favType) {
        this.favType = favType == null ? null : favType.trim();
    }

    public String getFavTime() {
        return favTime;
    }

    public void setFavTime(String favTime) {
        this.favTime = favTime == null ? null : favTime.trim();
    }
}