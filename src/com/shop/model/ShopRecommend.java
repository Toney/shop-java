package com.shop.model;

public class ShopRecommend {
    private Integer recommendId;

    private String recommendName;

    private String recommendCode;

    private String recommendDesc;

    private String recommendConfig;

    public Integer getRecommendId() {
        return recommendId;
    }

    public void setRecommendId(Integer recommendId) {
        this.recommendId = recommendId;
    }

    public String getRecommendName() {
        return recommendName;
    }

    public void setRecommendName(String recommendName) {
        this.recommendName = recommendName == null ? null : recommendName.trim();
    }

    public String getRecommendCode() {
        return recommendCode;
    }

    public void setRecommendCode(String recommendCode) {
        this.recommendCode = recommendCode == null ? null : recommendCode.trim();
    }

    public String getRecommendDesc() {
        return recommendDesc;
    }

    public void setRecommendDesc(String recommendDesc) {
        this.recommendDesc = recommendDesc == null ? null : recommendDesc.trim();
    }

    public String getRecommendConfig() {
        return recommendConfig;
    }

    public void setRecommendConfig(String recommendConfig) {
        this.recommendConfig = recommendConfig == null ? null : recommendConfig.trim();
    }
}