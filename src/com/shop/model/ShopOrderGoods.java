package com.shop.model;

public class ShopOrderGoods {
    private Integer id;

    private Integer orderId;

    private Integer goodsId;

    private Integer productId;

    private Float goodsPrice;

    private Float realPrice;

    private Integer goodsNums;

    private Float goodsWeight;

    private Integer shipments;

    private String goodsArray;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public Float getGoodsPrice() {
        return goodsPrice;
    }

    public void setGoodsPrice(Float goodsPrice) {
        this.goodsPrice = goodsPrice;
    }

    public Float getRealPrice() {
        return realPrice;
    }

    public void setRealPrice(Float realPrice) {
        this.realPrice = realPrice;
    }

    public Integer getGoodsNums() {
        return goodsNums;
    }

    public void setGoodsNums(Integer goodsNums) {
        this.goodsNums = goodsNums;
    }

    public Float getGoodsWeight() {
        return goodsWeight;
    }

    public void setGoodsWeight(Float goodsWeight) {
        this.goodsWeight = goodsWeight;
    }

    public Integer getShipments() {
        return shipments;
    }

    public void setShipments(Integer shipments) {
        this.shipments = shipments;
    }

    public String getGoodsArray() {
        return goodsArray;
    }

    public void setGoodsArray(String goodsArray) {
        this.goodsArray = goodsArray == null ? null : goodsArray.trim();
    }
}