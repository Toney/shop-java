package com.shop.model;

public class ShopInformSubjectType {
    private Integer informTypeId;

    private String informTypeName;

    private String informTypeDesc;

    private Byte informTypeState;

    public Integer getInformTypeId() {
        return informTypeId;
    }

    public void setInformTypeId(Integer informTypeId) {
        this.informTypeId = informTypeId;
    }

    public String getInformTypeName() {
        return informTypeName;
    }

    public void setInformTypeName(String informTypeName) {
        this.informTypeName = informTypeName == null ? null : informTypeName.trim();
    }

    public String getInformTypeDesc() {
        return informTypeDesc;
    }

    public void setInformTypeDesc(String informTypeDesc) {
        this.informTypeDesc = informTypeDesc == null ? null : informTypeDesc.trim();
    }

    public Byte getInformTypeState() {
        return informTypeState;
    }

    public void setInformTypeState(Byte informTypeState) {
        this.informTypeState = informTypeState;
    }
}