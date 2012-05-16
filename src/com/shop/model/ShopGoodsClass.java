package com.shop.model;

public class ShopGoodsClass {
    private Integer gcId;

    private String gcName;

    private Integer typeId;

    private String typeName;

    private Integer storeId;

    private Integer gcParentId;

    private Integer gcSort;

    private Integer gcShow;

    private Integer gcIndexShow;

    public Integer getGcId() {
        return gcId;
    }

    public void setGcId(Integer gcId) {
        this.gcId = gcId;
    }

    public String getGcName() {
        return gcName;
    }

    public void setGcName(String gcName) {
        this.gcName = gcName == null ? null : gcName.trim();
    }

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

    public Integer getStoreId() {
        return storeId;
    }

    public void setStoreId(Integer storeId) {
        this.storeId = storeId;
    }

    public Integer getGcParentId() {
        return gcParentId;
    }

    public void setGcParentId(Integer gcParentId) {
        this.gcParentId = gcParentId;
    }

    public Integer getGcSort() {
        return gcSort;
    }

    public void setGcSort(Integer gcSort) {
        this.gcSort = gcSort;
    }

    public Integer getGcShow() {
        return gcShow;
    }

    public void setGcShow(Integer gcShow) {
        this.gcShow = gcShow;
    }

    public Integer getGcIndexShow() {
        return gcIndexShow;
    }

    public void setGcIndexShow(Integer gcIndexShow) {
        this.gcIndexShow = gcIndexShow;
    }
}