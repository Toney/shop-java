package com.shop.model;

public class ShopGroupbuyTemplate {
    private Integer templateId;

    private String templateName;

    private Integer startTime;

    private Integer endTime;

    private Integer joinEndTime;

    private Boolean state;

    public Integer getTemplateId() {
        return templateId;
    }

    public void setTemplateId(Integer templateId) {
        this.templateId = templateId;
    }

    public String getTemplateName() {
        return templateName;
    }

    public void setTemplateName(String templateName) {
        this.templateName = templateName == null ? null : templateName.trim();
    }

    public Integer getStartTime() {
        return startTime;
    }

    public void setStartTime(Integer startTime) {
        this.startTime = startTime;
    }

    public Integer getEndTime() {
        return endTime;
    }

    public void setEndTime(Integer endTime) {
        this.endTime = endTime;
    }

    public Integer getJoinEndTime() {
        return joinEndTime;
    }

    public void setJoinEndTime(Integer joinEndTime) {
        this.joinEndTime = joinEndTime;
    }

    public Boolean getState() {
        return state;
    }

    public void setState(Boolean state) {
        this.state = state;
    }
}