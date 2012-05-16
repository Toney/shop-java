package com.shop.model;

public class ShopHelpCategory {
    private Short id;

    private String name;

    private Short sort;

    private Byte positionLeft;

    private Byte positionFoot;

    public Short getId() {
        return id;
    }

    public void setId(Short id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Short getSort() {
        return sort;
    }

    public void setSort(Short sort) {
        this.sort = sort;
    }

    public Byte getPositionLeft() {
        return positionLeft;
    }

    public void setPositionLeft(Byte positionLeft) {
        this.positionLeft = positionLeft;
    }

    public Byte getPositionFoot() {
        return positionFoot;
    }

    public void setPositionFoot(Byte positionFoot) {
        this.positionFoot = positionFoot;
    }
}