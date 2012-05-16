package com.shop.model;

public class ShopType {
    private Integer typeId;

    private String typeName;

    private Boolean typeSort;

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName == null ? null : typeName.trim();
    }

    public Boolean getTypeSort() {
        return typeSort;
    }

    public void setTypeSort(Boolean typeSort) {
        this.typeSort = typeSort;
    }
}