package com.shop.model;

public class ShopStoreClass {
    private Integer scId;

    private String scName;

    private Integer scParentId;

    private Boolean scSort;

    public Integer getScId() {
        return scId;
    }

    public void setScId(Integer scId) {
        this.scId = scId;
    }

    public String getScName() {
        return scName;
    }

    public void setScName(String scName) {
        this.scName = scName == null ? null : scName.trim();
    }

    public Integer getScParentId() {
        return scParentId;
    }

    public void setScParentId(Integer scParentId) {
        this.scParentId = scParentId;
    }

    public Boolean getScSort() {
        return scSort;
    }

    public void setScSort(Boolean scSort) {
        this.scSort = scSort;
    }
}