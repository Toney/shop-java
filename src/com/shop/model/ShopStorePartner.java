package com.shop.model;

public class ShopStorePartner {
    private Integer spId;

    private Integer spStoreId;

    private String spTitle;

    private String spLink;

    private String spLogo;

    private Boolean spSort;

    public Integer getSpId() {
        return spId;
    }

    public void setSpId(Integer spId) {
        this.spId = spId;
    }

    public Integer getSpStoreId() {
        return spStoreId;
    }

    public void setSpStoreId(Integer spStoreId) {
        this.spStoreId = spStoreId;
    }

    public String getSpTitle() {
        return spTitle;
    }

    public void setSpTitle(String spTitle) {
        this.spTitle = spTitle == null ? null : spTitle.trim();
    }

    public String getSpLink() {
        return spLink;
    }

    public void setSpLink(String spLink) {
        this.spLink = spLink == null ? null : spLink.trim();
    }

    public String getSpLogo() {
        return spLogo;
    }

    public void setSpLogo(String spLogo) {
        this.spLogo = spLogo == null ? null : spLogo.trim();
    }

    public Boolean getSpSort() {
        return spSort;
    }

    public void setSpSort(Boolean spSort) {
        this.spSort = spSort;
    }
}