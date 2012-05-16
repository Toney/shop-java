package com.shop.model;

public class ShopGoodsClassStaple {
    private Integer stapleId;

    private String stapleName;

    private Integer gcId;

    private Integer typeId;

    private Integer storeId;

    public Integer getStapleId() {
        return stapleId;
    }

    public void setStapleId(Integer stapleId) {
        this.stapleId = stapleId;
    }

    public String getStapleName() {
        return stapleName;
    }

    public void setStapleName(String stapleName) {
        this.stapleName = stapleName == null ? null : stapleName.trim();
    }

    public Integer getGcId() {
        return gcId;
    }

    public void setGcId(Integer gcId) {
        this.gcId = gcId;
    }

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    public Integer getStoreId() {
        return storeId;
    }

    public void setStoreId(Integer storeId) {
        this.storeId = storeId;
    }
}