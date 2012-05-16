package com.shop.model;

import java.math.BigDecimal;

public class ShopComplainGoods {
    private Integer complainGoodsId;

    private Integer complainId;

    private Integer goodsId;

    private String goodsName;

    private Integer specId;

    private String specInfo;

    private BigDecimal goodsPrice;

    private Integer goodsNum;

    private String goodsImage;

    private Boolean evaluation;

    private String comment;

    private String complainMessage;

    public Integer getComplainGoodsId() {
        return complainGoodsId;
    }

    public void setComplainGoodsId(Integer complainGoodsId) {
        this.complainGoodsId = complainGoodsId;
    }

    public Integer getComplainId() {
        return complainId;
    }

    public void setComplainId(Integer complainId) {
        this.complainId = complainId;
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

    public Integer getSpecId() {
        return specId;
    }

    public void setSpecId(Integer specId) {
        this.specId = specId;
    }

    public String getSpecInfo() {
        return specInfo;
    }

    public void setSpecInfo(String specInfo) {
        this.specInfo = specInfo == null ? null : specInfo.trim();
    }

    public BigDecimal getGoodsPrice() {
        return goodsPrice;
    }

    public void setGoodsPrice(BigDecimal goodsPrice) {
        this.goodsPrice = goodsPrice;
    }

    public Integer getGoodsNum() {
        return goodsNum;
    }

    public void setGoodsNum(Integer goodsNum) {
        this.goodsNum = goodsNum;
    }

    public String getGoodsImage() {
        return goodsImage;
    }

    public void setGoodsImage(String goodsImage) {
        this.goodsImage = goodsImage == null ? null : goodsImage.trim();
    }

    public Boolean getEvaluation() {
        return evaluation;
    }

    public void setEvaluation(Boolean evaluation) {
        this.evaluation = evaluation;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment == null ? null : comment.trim();
    }

    public String getComplainMessage() {
        return complainMessage;
    }

    public void setComplainMessage(String complainMessage) {
        this.complainMessage = complainMessage == null ? null : complainMessage.trim();
    }
}