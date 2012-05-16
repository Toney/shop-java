package com.shop.model;

public class ShopProducts {
    private Integer id;

    private Integer goodsId;

    private String productsNo;

    private Integer storeNums;

    private Float marketPrice;

    private Float sellPrice;

    private Float costPrice;

    private Float weight;

    private String goodsCode;

    private String specMd5;

    private String specArray;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    public String getProductsNo() {
        return productsNo;
    }

    public void setProductsNo(String productsNo) {
        this.productsNo = productsNo == null ? null : productsNo.trim();
    }

    public Integer getStoreNums() {
        return storeNums;
    }

    public void setStoreNums(Integer storeNums) {
        this.storeNums = storeNums;
    }

    public Float getMarketPrice() {
        return marketPrice;
    }

    public void setMarketPrice(Float marketPrice) {
        this.marketPrice = marketPrice;
    }

    public Float getSellPrice() {
        return sellPrice;
    }

    public void setSellPrice(Float sellPrice) {
        this.sellPrice = sellPrice;
    }

    public Float getCostPrice() {
        return costPrice;
    }

    public void setCostPrice(Float costPrice) {
        this.costPrice = costPrice;
    }

    public Float getWeight() {
        return weight;
    }

    public void setWeight(Float weight) {
        this.weight = weight;
    }

    public String getGoodsCode() {
        return goodsCode;
    }

    public void setGoodsCode(String goodsCode) {
        this.goodsCode = goodsCode == null ? null : goodsCode.trim();
    }

    public String getSpecMd5() {
        return specMd5;
    }

    public void setSpecMd5(String specMd5) {
        this.specMd5 = specMd5 == null ? null : specMd5.trim();
    }

    public String getSpecArray() {
        return specArray;
    }

    public void setSpecArray(String specArray) {
        this.specArray = specArray == null ? null : specArray.trim();
    }
}