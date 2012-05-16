package com.shop.model;

public class ShopActivity {
    private Integer activityId;

    private String activityTitle;

    private String activityType;

    private String activityBanner;

    private String activityStyle;

    private String activityDesc;

    private Integer activityStartDate;

    private Integer activityEndDate;

    private Boolean activitySort;

    private Boolean activityState;

    public Integer getActivityId() {
        return activityId;
    }

    public void setActivityId(Integer activityId) {
        this.activityId = activityId;
    }

    public String getActivityTitle() {
        return activityTitle;
    }

    public void setActivityTitle(String activityTitle) {
        this.activityTitle = activityTitle == null ? null : activityTitle.trim();
    }

    public String getActivityType() {
        return activityType;
    }

    public void setActivityType(String activityType) {
        this.activityType = activityType == null ? null : activityType.trim();
    }

    public String getActivityBanner() {
        return activityBanner;
    }

    public void setActivityBanner(String activityBanner) {
        this.activityBanner = activityBanner == null ? null : activityBanner.trim();
    }

    public String getActivityStyle() {
        return activityStyle;
    }

    public void setActivityStyle(String activityStyle) {
        this.activityStyle = activityStyle == null ? null : activityStyle.trim();
    }

    public String getActivityDesc() {
        return activityDesc;
    }

    public void setActivityDesc(String activityDesc) {
        this.activityDesc = activityDesc == null ? null : activityDesc.trim();
    }

    public Integer getActivityStartDate() {
        return activityStartDate;
    }

    public void setActivityStartDate(Integer activityStartDate) {
        this.activityStartDate = activityStartDate;
    }

    public Integer getActivityEndDate() {
        return activityEndDate;
    }

    public void setActivityEndDate(Integer activityEndDate) {
        this.activityEndDate = activityEndDate;
    }

    public Boolean getActivitySort() {
        return activitySort;
    }

    public void setActivitySort(Boolean activitySort) {
        this.activitySort = activitySort;
    }

    public Boolean getActivityState() {
        return activityState;
    }

    public void setActivityState(Boolean activityState) {
        this.activityState = activityState;
    }
}