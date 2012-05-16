package com.shop.model;

public class ShopGroupbuyPriceRange {
    private Integer rangeId;

    private String rangeName;

    private Integer rangeStart;

    private Integer rangeEnd;

    public Integer getRangeId() {
        return rangeId;
    }

    public void setRangeId(Integer rangeId) {
        this.rangeId = rangeId;
    }

    public String getRangeName() {
        return rangeName;
    }

    public void setRangeName(String rangeName) {
        this.rangeName = rangeName == null ? null : rangeName.trim();
    }

    public Integer getRangeStart() {
        return rangeStart;
    }

    public void setRangeStart(Integer rangeStart) {
        this.rangeStart = rangeStart;
    }

    public Integer getRangeEnd() {
        return rangeEnd;
    }

    public void setRangeEnd(Integer rangeEnd) {
        this.rangeEnd = rangeEnd;
    }
}