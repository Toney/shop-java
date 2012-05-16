package com.shop.model;

public class ShopFittingRelation {
    private Integer id;

    private Integer fittingId;

    private Integer goodsId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getFittingId() {
        return fittingId;
    }

    public void setFittingId(Integer fittingId) {
        this.fittingId = fittingId;
    }

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }
}