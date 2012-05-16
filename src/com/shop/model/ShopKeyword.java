package com.shop.model;

public class ShopKeyword {
    private String word;

    private Integer goodsNums;

    private Boolean hot;

    private Integer order;

    public String getWord() {
        return word;
    }

    public void setWord(String word) {
        this.word = word == null ? null : word.trim();
    }

    public Integer getGoodsNums() {
        return goodsNums;
    }

    public void setGoodsNums(Integer goodsNums) {
        this.goodsNums = goodsNums;
    }

    public Boolean getHot() {
        return hot;
    }

    public void setHot(Boolean hot) {
        this.hot = hot;
    }

    public Integer getOrder() {
        return order;
    }

    public void setOrder(Integer order) {
        this.order = order;
    }
}