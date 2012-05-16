package com.shop.model;

import java.math.BigDecimal;

public class ShopGoodsSpec {
    private Integer specId;

    private Integer goodsId;

    private String specName;

    private BigDecimal specGoodsPrice;

    private Integer specGoodsStorage;

    private Integer specSalenum;

    private String specGoodsColor;

    private String specGoodsSerial;

    private String specGoodsSpec;

    public Integer getSpecId() {
        return specId;
    }

    public void setSpecId(Integer specId) {
        this.specId = specId;
    }

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    public String getSpecName() {
        return specName;
    }

    public void setSpecName(String specName) {
        this.specName = specName == null ? null : specName.trim();
    }

    public BigDecimal getSpecGoodsPrice() {
        return specGoodsPrice;
    }

    public void setSpecGoodsPrice(BigDecimal specGoodsPrice) {
        this.specGoodsPrice = specGoodsPrice;
    }

    public Integer getSpecGoodsStorage() {
        return specGoodsStorage;
    }

    public void setSpecGoodsStorage(Integer specGoodsStorage) {
        this.specGoodsStorage = specGoodsStorage;
    }

    public Integer getSpecSalenum() {
        return specSalenum;
    }

    public void setSpecSalenum(Integer specSalenum) {
        this.specSalenum = specSalenum;
    }

    public String getSpecGoodsColor() {
        return specGoodsColor;
    }

    public void setSpecGoodsColor(String specGoodsColor) {
        this.specGoodsColor = specGoodsColor == null ? null : specGoodsColor.trim();
    }

    public String getSpecGoodsSerial() {
        return specGoodsSerial;
    }

    public void setSpecGoodsSerial(String specGoodsSerial) {
        this.specGoodsSerial = specGoodsSerial == null ? null : specGoodsSerial.trim();
    }

    public String getSpecGoodsSpec() {
        return specGoodsSpec;
    }

    public void setSpecGoodsSpec(String specGoodsSpec) {
        this.specGoodsSpec = specGoodsSpec == null ? null : specGoodsSpec.trim();
    }
}