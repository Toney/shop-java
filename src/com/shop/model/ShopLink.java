package com.shop.model;

public class ShopLink {
    private Integer linkId;

    private String linkTitle;

    private String linkUrl;

    private String linkPic;

    private Byte linkSort;

    public Integer getLinkId() {
        return linkId;
    }

    public void setLinkId(Integer linkId) {
        this.linkId = linkId;
    }

    public String getLinkTitle() {
        return linkTitle;
    }

    public void setLinkTitle(String linkTitle) {
        this.linkTitle = linkTitle == null ? null : linkTitle.trim();
    }

    public String getLinkUrl() {
        return linkUrl;
    }

    public void setLinkUrl(String linkUrl) {
        this.linkUrl = linkUrl == null ? null : linkUrl.trim();
    }

    public String getLinkPic() {
        return linkPic;
    }

    public void setLinkPic(String linkPic) {
        this.linkPic = linkPic == null ? null : linkPic.trim();
    }

    public Byte getLinkSort() {
        return linkSort;
    }

    public void setLinkSort(Byte linkSort) {
        this.linkSort = linkSort;
    }
}