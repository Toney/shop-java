package com.shop.model;

public class ShopDocument {
    private Integer docId;

    private String docCode;

    private String docTitle;

    private Integer docTime;

    private String docContent;

    public Integer getDocId() {
        return docId;
    }

    public void setDocId(Integer docId) {
        this.docId = docId;
    }

    public String getDocCode() {
        return docCode;
    }

    public void setDocCode(String docCode) {
        this.docCode = docCode == null ? null : docCode.trim();
    }

    public String getDocTitle() {
        return docTitle;
    }

    public void setDocTitle(String docTitle) {
        this.docTitle = docTitle == null ? null : docTitle.trim();
    }

    public Integer getDocTime() {
        return docTime;
    }

    public void setDocTime(Integer docTime) {
        this.docTime = docTime;
    }

    public String getDocContent() {
        return docContent;
    }

    public void setDocContent(String docContent) {
        this.docContent = docContent == null ? null : docContent.trim();
    }
}