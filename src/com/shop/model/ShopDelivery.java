package com.shop.model;

public class ShopDelivery {
    private Integer id;

    private String name;

    private String description;

    private Boolean type;

    private Integer firstWeight;

    private Integer secondWeight;

    private Float firstPrice;

    private Float secondPrice;

    private Boolean status;

    private Integer sort;

    private Boolean isSavePrice;

    private Integer saveRate;

    private Float lowPrice;

    private Boolean priceType;

    private Boolean openDefault;

    private Boolean isDelete;

    private Integer freightId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public Boolean getType() {
        return type;
    }

    public void setType(Boolean type) {
        this.type = type;
    }

    public Integer getFirstWeight() {
        return firstWeight;
    }

    public void setFirstWeight(Integer firstWeight) {
        this.firstWeight = firstWeight;
    }

    public Integer getSecondWeight() {
        return secondWeight;
    }

    public void setSecondWeight(Integer secondWeight) {
        this.secondWeight = secondWeight;
    }

    public Float getFirstPrice() {
        return firstPrice;
    }

    public void setFirstPrice(Float firstPrice) {
        this.firstPrice = firstPrice;
    }

    public Float getSecondPrice() {
        return secondPrice;
    }

    public void setSecondPrice(Float secondPrice) {
        this.secondPrice = secondPrice;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public Boolean getIsSavePrice() {
        return isSavePrice;
    }

    public void setIsSavePrice(Boolean isSavePrice) {
        this.isSavePrice = isSavePrice;
    }

    public Integer getSaveRate() {
        return saveRate;
    }

    public void setSaveRate(Integer saveRate) {
        this.saveRate = saveRate;
    }

    public Float getLowPrice() {
        return lowPrice;
    }

    public void setLowPrice(Float lowPrice) {
        this.lowPrice = lowPrice;
    }

    public Boolean getPriceType() {
        return priceType;
    }

    public void setPriceType(Boolean priceType) {
        this.priceType = priceType;
    }

    public Boolean getOpenDefault() {
        return openDefault;
    }

    public void setOpenDefault(Boolean openDefault) {
        this.openDefault = openDefault;
    }

    public Boolean getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(Boolean isDelete) {
        this.isDelete = isDelete;
    }

    public Integer getFreightId() {
        return freightId;
    }

    public void setFreightId(Integer freightId) {
        this.freightId = freightId;
    }
}