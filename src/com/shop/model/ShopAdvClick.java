package com.shop.model;

public class ShopAdvClick {
    private Integer advId;

    private Integer apId;

    private Integer clickYear;

    private Integer clickMonth;

    private Integer clickNum;

    private String advName;

    private String apName;

    public Integer getAdvId() {
        return advId;
    }

    public void setAdvId(Integer advId) {
        this.advId = advId;
    }

    public Integer getApId() {
        return apId;
    }

    public void setApId(Integer apId) {
        this.apId = apId;
    }

    public Integer getClickYear() {
        return clickYear;
    }

    public void setClickYear(Integer clickYear) {
        this.clickYear = clickYear;
    }

    public Integer getClickMonth() {
        return clickMonth;
    }

    public void setClickMonth(Integer clickMonth) {
        this.clickMonth = clickMonth;
    }

    public Integer getClickNum() {
        return clickNum;
    }

    public void setClickNum(Integer clickNum) {
        this.clickNum = clickNum;
    }

    public String getAdvName() {
        return advName;
    }

    public void setAdvName(String advName) {
        this.advName = advName == null ? null : advName.trim();
    }

    public String getApName() {
        return apName;
    }

    public void setApName(String apName) {
        this.apName = apName == null ? null : apName.trim();
    }
}