package com.shop.model;

public class ShopCouponClass {
    private Integer classId;

    private Integer classParentId;

    private String className;

    private Boolean classSort;

    private String classShow;

    public Integer getClassId() {
        return classId;
    }

    public void setClassId(Integer classId) {
        this.classId = classId;
    }

    public Integer getClassParentId() {
        return classParentId;
    }

    public void setClassParentId(Integer classParentId) {
        this.classParentId = classParentId;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className == null ? null : className.trim();
    }

    public Boolean getClassSort() {
        return classSort;
    }

    public void setClassSort(Boolean classSort) {
        this.classSort = classSort;
    }

    public String getClassShow() {
        return classShow;
    }

    public void setClassShow(String classShow) {
        this.classShow = classShow == null ? null : classShow.trim();
    }
}