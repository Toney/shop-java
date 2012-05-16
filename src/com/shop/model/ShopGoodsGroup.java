package com.shop.model;

import java.math.BigDecimal;

public class ShopGoodsGroup {
    private Integer groupId;

    private String groupName;

    private Integer templateId;

    private String templateName;

    private String groupHelp;

    private Integer startTime;

    private Integer endTime;

    private Integer goodsId;

    private String goodsName;

    private Integer storeId;

    private String storeName;

    private String specPrice;

    private BigDecimal goodsPrice;

    private BigDecimal groupbuyPrice;

    private Boolean limitType;

    private Integer virtualQuantity;

    private Integer buyerCount;

    private Integer defQuantity;

    private Integer minQuantity;

    private Integer saleQuantity;

    private Integer maxNum;

    private Boolean state;

    private Boolean recommended;

    private Boolean published;

    private Integer views;

    private String cancelIntro;

    private Integer classId;

    private Integer areaId;

    private String groupPic;

    private BigDecimal rebate;

    private String remark;

    private String groupIntro;

    public Integer getGroupId() {
        return groupId;
    }

    public void setGroupId(Integer groupId) {
        this.groupId = groupId;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName == null ? null : groupName.trim();
    }

    public Integer getTemplateId() {
        return templateId;
    }

    public void setTemplateId(Integer templateId) {
        this.templateId = templateId;
    }

    public String getTemplateName() {
        return templateName;
    }

    public void setTemplateName(String templateName) {
        this.templateName = templateName == null ? null : templateName.trim();
    }

    public String getGroupHelp() {
        return groupHelp;
    }

    public void setGroupHelp(String groupHelp) {
        this.groupHelp = groupHelp == null ? null : groupHelp.trim();
    }

    public Integer getStartTime() {
        return startTime;
    }

    public void setStartTime(Integer startTime) {
        this.startTime = startTime;
    }

    public Integer getEndTime() {
        return endTime;
    }

    public void setEndTime(Integer endTime) {
        this.endTime = endTime;
    }

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName == null ? null : goodsName.trim();
    }

    public Integer getStoreId() {
        return storeId;
    }

    public void setStoreId(Integer storeId) {
        this.storeId = storeId;
    }

    public String getStoreName() {
        return storeName;
    }

    public void setStoreName(String storeName) {
        this.storeName = storeName == null ? null : storeName.trim();
    }

    public String getSpecPrice() {
        return specPrice;
    }

    public void setSpecPrice(String specPrice) {
        this.specPrice = specPrice == null ? null : specPrice.trim();
    }

    public BigDecimal getGoodsPrice() {
        return goodsPrice;
    }

    public void setGoodsPrice(BigDecimal goodsPrice) {
        this.goodsPrice = goodsPrice;
    }

    public BigDecimal getGroupbuyPrice() {
        return groupbuyPrice;
    }

    public void setGroupbuyPrice(BigDecimal groupbuyPrice) {
        this.groupbuyPrice = groupbuyPrice;
    }

    public Boolean getLimitType() {
        return limitType;
    }

    public void setLimitType(Boolean limitType) {
        this.limitType = limitType;
    }

    public Integer getVirtualQuantity() {
        return virtualQuantity;
    }

    public void setVirtualQuantity(Integer virtualQuantity) {
        this.virtualQuantity = virtualQuantity;
    }

    public Integer getBuyerCount() {
        return buyerCount;
    }

    public void setBuyerCount(Integer buyerCount) {
        this.buyerCount = buyerCount;
    }

    public Integer getDefQuantity() {
        return defQuantity;
    }

    public void setDefQuantity(Integer defQuantity) {
        this.defQuantity = defQuantity;
    }

    public Integer getMinQuantity() {
        return minQuantity;
    }

    public void setMinQuantity(Integer minQuantity) {
        this.minQuantity = minQuantity;
    }

    public Integer getSaleQuantity() {
        return saleQuantity;
    }

    public void setSaleQuantity(Integer saleQuantity) {
        this.saleQuantity = saleQuantity;
    }

    public Integer getMaxNum() {
        return maxNum;
    }

    public void setMaxNum(Integer maxNum) {
        this.maxNum = maxNum;
    }

    public Boolean getState() {
        return state;
    }

    public void setState(Boolean state) {
        this.state = state;
    }

    public Boolean getRecommended() {
        return recommended;
    }

    public void setRecommended(Boolean recommended) {
        this.recommended = recommended;
    }

    public Boolean getPublished() {
        return published;
    }

    public void setPublished(Boolean published) {
        this.published = published;
    }

    public Integer getViews() {
        return views;
    }

    public void setViews(Integer views) {
        this.views = views;
    }

    public String getCancelIntro() {
        return cancelIntro;
    }

    public void setCancelIntro(String cancelIntro) {
        this.cancelIntro = cancelIntro == null ? null : cancelIntro.trim();
    }

    public Integer getClassId() {
        return classId;
    }

    public void setClassId(Integer classId) {
        this.classId = classId;
    }

    public Integer getAreaId() {
        return areaId;
    }

    public void setAreaId(Integer areaId) {
        this.areaId = areaId;
    }

    public String getGroupPic() {
        return groupPic;
    }

    public void setGroupPic(String groupPic) {
        this.groupPic = groupPic == null ? null : groupPic.trim();
    }

    public BigDecimal getRebate() {
        return rebate;
    }

    public void setRebate(BigDecimal rebate) {
        this.rebate = rebate;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public String getGroupIntro() {
        return groupIntro;
    }

    public void setGroupIntro(String groupIntro) {
        this.groupIntro = groupIntro == null ? null : groupIntro.trim();
    }
}