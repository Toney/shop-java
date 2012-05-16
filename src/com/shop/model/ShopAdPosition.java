package com.shop.model;

public class ShopAdPosition {
    private Integer id;

    private String name;

    private Integer width;

    private Integer height;

    private Boolean type;

    private Byte fashion;

    private Boolean status;

    private Integer adNums;

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

    public Integer getWidth() {
        return width;
    }

    public void setWidth(Integer width) {
        this.width = width;
    }

    public Integer getHeight() {
        return height;
    }

    public void setHeight(Integer height) {
        this.height = height;
    }

    public Boolean getType() {
        return type;
    }

    public void setType(Boolean type) {
        this.type = type;
    }

    public Byte getFashion() {
        return fashion;
    }

    public void setFashion(Byte fashion) {
        this.fashion = fashion;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public Integer getAdNums() {
        return adNums;
    }

    public void setAdNums(Integer adNums) {
        this.adNums = adNums;
    }
}