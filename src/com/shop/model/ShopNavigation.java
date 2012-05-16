package com.shop.model;

public class ShopNavigation {
    private Integer navId;

    private Boolean navType;

    private String navTitle;

    private String navUrl;

    private Boolean navLocation;

    private Boolean navNewOpen;

    private Byte navSort;

    private Integer itemId;

    public Integer getNavId() {
        return navId;
    }

    public void setNavId(Integer navId) {
        this.navId = navId;
    }

    public Boolean getNavType() {
        return navType;
    }

    public void setNavType(Boolean navType) {
        this.navType = navType;
    }

    public String getNavTitle() {
        return navTitle;
    }

    public void setNavTitle(String navTitle) {
        this.navTitle = navTitle == null ? null : navTitle.trim();
    }

    public String getNavUrl() {
        return navUrl;
    }

    public void setNavUrl(String navUrl) {
        this.navUrl = navUrl == null ? null : navUrl.trim();
    }

    public Boolean getNavLocation() {
        return navLocation;
    }

    public void setNavLocation(Boolean navLocation) {
        this.navLocation = navLocation;
    }

    public Boolean getNavNewOpen() {
        return navNewOpen;
    }

    public void setNavNewOpen(Boolean navNewOpen) {
        this.navNewOpen = navNewOpen;
    }

    public Byte getNavSort() {
        return navSort;
    }

    public void setNavSort(Byte navSort) {
        this.navSort = navSort;
    }

    public Integer getItemId() {
        return itemId;
    }

    public void setItemId(Integer itemId) {
        this.itemId = itemId;
    }
}