package com.shop.model;

public class ShopGoodsWithBLOBs extends ShopGoods {
    private String content;

    private String specArray;

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public String getSpecArray() {
        return specArray;
    }

    public void setSpecArray(String specArray) {
        this.specArray = specArray == null ? null : specArray.trim();
    }
}