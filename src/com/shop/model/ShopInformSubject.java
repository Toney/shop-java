package com.shop.model;

public class ShopInformSubject {
    private Integer informSubjectId;

    private String informSubjectContent;

    private Integer informSubjectTypeId;

    private String informSubjectTypeName;

    private Byte informSubjectState;

    public Integer getInformSubjectId() {
        return informSubjectId;
    }

    public void setInformSubjectId(Integer informSubjectId) {
        this.informSubjectId = informSubjectId;
    }

    public String getInformSubjectContent() {
        return informSubjectContent;
    }

    public void setInformSubjectContent(String informSubjectContent) {
        this.informSubjectContent = informSubjectContent == null ? null : informSubjectContent.trim();
    }

    public Integer getInformSubjectTypeId() {
        return informSubjectTypeId;
    }

    public void setInformSubjectTypeId(Integer informSubjectTypeId) {
        this.informSubjectTypeId = informSubjectTypeId;
    }

    public String getInformSubjectTypeName() {
        return informSubjectTypeName;
    }

    public void setInformSubjectTypeName(String informSubjectTypeName) {
        this.informSubjectTypeName = informSubjectTypeName == null ? null : informSubjectTypeName.trim();
    }

    public Byte getInformSubjectState() {
        return informSubjectState;
    }

    public void setInformSubjectState(Byte informSubjectState) {
        this.informSubjectState = informSubjectState;
    }
}