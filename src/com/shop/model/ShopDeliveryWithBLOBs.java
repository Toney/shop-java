package com.shop.model;

public class ShopDeliveryWithBLOBs extends ShopDelivery {
    private String area;

    private String areaGroupid;

    private String firstprice;

    private String secondprice;

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area == null ? null : area.trim();
    }

    public String getAreaGroupid() {
        return areaGroupid;
    }

    public void setAreaGroupid(String areaGroupid) {
        this.areaGroupid = areaGroupid == null ? null : areaGroupid.trim();
    }

    public String getFirstprice() {
        return firstprice;
    }

    public void setFirstprice(String firstprice) {
        this.firstprice = firstprice == null ? null : firstprice.trim();
    }

    public String getSecondprice() {
        return secondprice;
    }

    public void setSecondprice(String secondprice) {
        this.secondprice = secondprice == null ? null : secondprice.trim();
    }
}