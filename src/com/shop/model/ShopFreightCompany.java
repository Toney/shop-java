package com.shop.model;

public class ShopFreightCompany {
    private Integer id;

    private String freightType;

    private String freightName;

    private String url;

    private Byte sort;

    private Byte isDel;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFreightType() {
        return freightType;
    }

    public void setFreightType(String freightType) {
        this.freightType = freightType == null ? null : freightType.trim();
    }

    public String getFreightName() {
        return freightName;
    }

    public void setFreightName(String freightName) {
        this.freightName = freightName == null ? null : freightName.trim();
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    public Byte getSort() {
        return sort;
    }

    public void setSort(Byte sort) {
        this.sort = sort;
    }

    public Byte getIsDel() {
        return isDel;
    }

    public void setIsDel(Byte isDel) {
        this.isDel = isDel;
    }
}