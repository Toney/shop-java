package com.shop.model;

public class ShopGroupbuyClass {
    private Integer classId;

    private String className;

    private Integer classParentId;

    private Boolean sort;

    private Boolean deep;

    public Integer getClassId() {
        return classId;
    }

    public void setClassId(Integer classId) {
        this.classId = classId;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className == null ? null : className.trim();
    }

    public Integer getClassParentId() {
        return classParentId;
    }

    public void setClassParentId(Integer classParentId) {
        this.classParentId = classParentId;
    }

    public Boolean getSort() {
        return sort;
    }

    public void setSort(Boolean sort) {
        this.sort = sort;
    }

    public Boolean getDeep() {
        return deep;
    }

    public void setDeep(Boolean deep) {
        this.deep = deep;
    }
}