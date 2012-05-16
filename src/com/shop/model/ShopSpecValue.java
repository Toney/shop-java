package com.shop.model;

public class ShopSpecValue {
    private Integer spValueId;

    private String spValueName;

    private Integer spId;

    private String spValueImage;

    private Boolean spValueSort;

    public Integer getSpValueId() {
        return spValueId;
    }

    public void setSpValueId(Integer spValueId) {
        this.spValueId = spValueId;
    }

    public String getSpValueName() {
        return spValueName;
    }

    public void setSpValueName(String spValueName) {
        this.spValueName = spValueName == null ? null : spValueName.trim();
    }

    public Integer getSpId() {
        return spId;
    }

    public void setSpId(Integer spId) {
        this.spId = spId;
    }

    public String getSpValueImage() {
        return spValueImage;
    }

    public void setSpValueImage(String spValueImage) {
        this.spValueImage = spValueImage == null ? null : spValueImage.trim();
    }

    public Boolean getSpValueSort() {
        return spValueSort;
    }

    public void setSpValueSort(Boolean spValueSort) {
        this.spValueSort = spValueSort;
    }
}