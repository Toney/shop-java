package com.shop.model;

public class ShopPointsCart {
    private Integer pcartId;

    private Integer pmemberId;

    private Integer pgoodsId;

    private String pgoodsName;

    private Integer pgoodsPoints;

    private Integer pgoodsChoosenum;

    private String pgoodsImage;

    public Integer getPcartId() {
        return pcartId;
    }

    public void setPcartId(Integer pcartId) {
        this.pcartId = pcartId;
    }

    public Integer getPmemberId() {
        return pmemberId;
    }

    public void setPmemberId(Integer pmemberId) {
        this.pmemberId = pmemberId;
    }

    public Integer getPgoodsId() {
        return pgoodsId;
    }

    public void setPgoodsId(Integer pgoodsId) {
        this.pgoodsId = pgoodsId;
    }

    public String getPgoodsName() {
        return pgoodsName;
    }

    public void setPgoodsName(String pgoodsName) {
        this.pgoodsName = pgoodsName == null ? null : pgoodsName.trim();
    }

    public Integer getPgoodsPoints() {
        return pgoodsPoints;
    }

    public void setPgoodsPoints(Integer pgoodsPoints) {
        this.pgoodsPoints = pgoodsPoints;
    }

    public Integer getPgoodsChoosenum() {
        return pgoodsChoosenum;
    }

    public void setPgoodsChoosenum(Integer pgoodsChoosenum) {
        this.pgoodsChoosenum = pgoodsChoosenum;
    }

    public String getPgoodsImage() {
        return pgoodsImage;
    }

    public void setPgoodsImage(String pgoodsImage) {
        this.pgoodsImage = pgoodsImage == null ? null : pgoodsImage.trim();
    }
}