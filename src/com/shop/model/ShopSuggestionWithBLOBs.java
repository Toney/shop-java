package com.shop.model;

public class ShopSuggestionWithBLOBs extends ShopSuggestion {
    private String content;

    private String reContent;

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public String getReContent() {
        return reContent;
    }

    public void setReContent(String reContent) {
        this.reContent = reContent == null ? null : reContent.trim();
    }
}