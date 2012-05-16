package com.shop.model;

public class ShopRefundmentDocWithBLOBs extends ShopRefundmentDoc {
    private String content;

    private String disposeIdea;

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public String getDisposeIdea() {
        return disposeIdea;
    }

    public void setDisposeIdea(String disposeIdea) {
        this.disposeIdea = disposeIdea == null ? null : disposeIdea.trim();
    }
}