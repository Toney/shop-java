package com.shop.model;

public class ShopGoodsClassTag {
    private Integer gcTagId;

    private Integer gcId1;

    private Integer gcId2;

    private Integer gcId3;

    private String gcTagName;

    private Integer gcId;

    private Integer typeId;

    private String gcTagValue;

    public Integer getGcTagId() {
        return gcTagId;
    }

    public void setGcTagId(Integer gcTagId) {
        this.gcTagId = gcTagId;
    }

    public Integer getGcId1() {
        return gcId1;
    }

    public void setGcId1(Integer gcId1) {
        this.gcId1 = gcId1;
    }

    public Integer getGcId2() {
        return gcId2;
    }

    public void setGcId2(Integer gcId2) {
        this.gcId2 = gcId2;
    }

    public Integer getGcId3() {
        return gcId3;
    }

    public void setGcId3(Integer gcId3) {
        this.gcId3 = gcId3;
    }

    public String getGcTagName() {
        return gcTagName;
    }

    public void setGcTagName(String gcTagName) {
        this.gcTagName = gcTagName == null ? null : gcTagName.trim();
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

    public String getGcTagValue() {
        return gcTagValue;
    }

    public void setGcTagValue(String gcTagValue) {
        this.gcTagValue = gcTagValue == null ? null : gcTagValue.trim();
    }
}