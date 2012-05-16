package com.shop.model;

public class ShopArticleClass {
    private Integer acId;

    private String acCode;

    private String acName;

    private Integer acParentId;

    private Boolean acSort;

    public Integer getAcId() {
        return acId;
    }

    public void setAcId(Integer acId) {
        this.acId = acId;
    }

    public String getAcCode() {
        return acCode;
    }

    public void setAcCode(String acCode) {
        this.acCode = acCode == null ? null : acCode.trim();
    }

    public String getAcName() {
        return acName;
    }

    public void setAcName(String acName) {
        this.acName = acName == null ? null : acName.trim();
    }

    public Integer getAcParentId() {
        return acParentId;
    }

    public void setAcParentId(Integer acParentId) {
        this.acParentId = acParentId;
    }

    public Boolean getAcSort() {
        return acSort;
    }

    public void setAcSort(Boolean acSort) {
        this.acSort = acSort;
    }
}