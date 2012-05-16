package com.shop.model;

import java.util.Date;

public class ShopGoods {
    private Integer id;

    private String name;

    private String goodsNo;

    private Integer modelId;

    private Float sellPrice;

    private Float marketPrice;

    private Date upTime;

    private Date downTime;

    private Date createTime;

    private Integer storeNums;

    private String img;

    private Boolean isDel;

    private String keywords;

    private String description;

    private String tagIds;

    private Float weight;

    private Integer point;

    private String unit;

    private Integer brandId;

    private Integer visit;

    private Integer favorite;

    private Integer sort;

    private String listImg;

    private String smallImg;

    private Integer exp;

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

    public String getGoodsNo() {
        return goodsNo;
    }

    public void setGoodsNo(String goodsNo) {
        this.goodsNo = goodsNo == null ? null : goodsNo.trim();
    }

    public Integer getModelId() {
        return modelId;
    }

    public void setModelId(Integer modelId) {
        this.modelId = modelId;
    }

    public Float getSellPrice() {
        return sellPrice;
    }

    public void setSellPrice(Float sellPrice) {
        this.sellPrice = sellPrice;
    }

    public Float getMarketPrice() {
        return marketPrice;
    }

    public void setMarketPrice(Float marketPrice) {
        this.marketPrice = marketPrice;
    }

    public Date getUpTime() {
        return upTime;
    }

    public void setUpTime(Date upTime) {
        this.upTime = upTime;
    }

    public Date getDownTime() {
        return downTime;
    }

    public void setDownTime(Date downTime) {
        this.downTime = downTime;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getStoreNums() {
        return storeNums;
    }

    public void setStoreNums(Integer storeNums) {
        this.storeNums = storeNums;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img == null ? null : img.trim();
    }

    public Boolean getIsDel() {
        return isDel;
    }

    public void setIsDel(Boolean isDel) {
        this.isDel = isDel;
    }

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords == null ? null : keywords.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public String getTagIds() {
        return tagIds;
    }

    public void setTagIds(String tagIds) {
        this.tagIds = tagIds == null ? null : tagIds.trim();
    }

    public Float getWeight() {
        return weight;
    }

    public void setWeight(Float weight) {
        this.weight = weight;
    }

    public Integer getPoint() {
        return point;
    }

    public void setPoint(Integer point) {
        this.point = point;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit == null ? null : unit.trim();
    }

    public Integer getBrandId() {
        return brandId;
    }

    public void setBrandId(Integer brandId) {
        this.brandId = brandId;
    }

    public Integer getVisit() {
        return visit;
    }

    public void setVisit(Integer visit) {
        this.visit = visit;
    }

    public Integer getFavorite() {
        return favorite;
    }

    public void setFavorite(Integer favorite) {
        this.favorite = favorite;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public String getListImg() {
        return listImg;
    }

    public void setListImg(String listImg) {
        this.listImg = listImg == null ? null : listImg.trim();
    }

    public String getSmallImg() {
        return smallImg;
    }

    public void setSmallImg(String smallImg) {
        this.smallImg = smallImg == null ? null : smallImg.trim();
    }

    public Integer getExp() {
        return exp;
    }

    public void setExp(Integer exp) {
        this.exp = exp;
    }
}