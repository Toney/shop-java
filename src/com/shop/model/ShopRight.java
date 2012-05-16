package com.shop.model;

public class ShopRight {
    private Integer id;

    private String name;

    private String right;

    private Boolean isDel;

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

    public String getRight() {
        return right;
    }

    public void setRight(String right) {
        this.right = right == null ? null : right.trim();
    }

    public Boolean getIsDel() {
        return isDel;
    }

    public void setIsDel(Boolean isDel) {
        this.isDel = isDel;
    }
}