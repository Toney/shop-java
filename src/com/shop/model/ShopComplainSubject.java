package com.shop.model;

public class ShopComplainSubject {
    private Integer complainSubjectId;

    private String complainSubjectContent;

    private String complainSubjectDesc;

    private Byte complainSubjectType;

    private Byte complainSubjectState;

    public Integer getComplainSubjectId() {
        return complainSubjectId;
    }

    public void setComplainSubjectId(Integer complainSubjectId) {
        this.complainSubjectId = complainSubjectId;
    }

    public String getComplainSubjectContent() {
        return complainSubjectContent;
    }

    public void setComplainSubjectContent(String complainSubjectContent) {
        this.complainSubjectContent = complainSubjectContent == null ? null : complainSubjectContent.trim();
    }

    public String getComplainSubjectDesc() {
        return complainSubjectDesc;
    }

    public void setComplainSubjectDesc(String complainSubjectDesc) {
        this.complainSubjectDesc = complainSubjectDesc == null ? null : complainSubjectDesc.trim();
    }

    public Byte getComplainSubjectType() {
        return complainSubjectType;
    }

    public void setComplainSubjectType(Byte complainSubjectType) {
        this.complainSubjectType = complainSubjectType;
    }

    public Byte getComplainSubjectState() {
        return complainSubjectState;
    }

    public void setComplainSubjectState(Byte complainSubjectState) {
        this.complainSubjectState = complainSubjectState;
    }
}