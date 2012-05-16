package com.shop.model;

public class ShopActivityDetail {
    private Integer activityDetailId;

    private Integer activityId;

    private Integer itemId;

    private String itemName;

    private Integer storeId;

    private String storeName;

    private String activityDetailState;

    private Boolean activityDetailSort;

    public Integer getActivityDetailId() {
        return activityDetailId;
    }

    public void setActivityDetailId(Integer activityDetailId) {
        this.activityDetailId = activityDetailId;
    }

    public Integer getActivityId() {
        return activityId;
    }

    public void setActivityId(Integer activityId) {
        this.activityId = activityId;
    }

    public Integer getItemId() {
        return itemId;
    }

    public void setItemId(Integer itemId) {
        this.itemId = itemId;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName == null ? null : itemName.trim();
    }

    public Integer getStoreId() {
        return storeId;
    }

    public void setStoreId(Integer storeId) {
        this.storeId = storeId;
    }

    public String getStoreName() {
        return storeName;
    }

    public void setStoreName(String storeName) {
        this.storeName = storeName == null ? null : storeName.trim();
    }

    public String getActivityDetailState() {
        return activityDetailState;
    }

    public void setActivityDetailState(String activityDetailState) {
        this.activityDetailState = activityDetailState == null ? null : activityDetailState.trim();
    }

    public Boolean getActivityDetailSort() {
        return activityDetailSort;
    }

    public void setActivityDetailSort(Boolean activityDetailSort) {
        this.activityDetailSort = activityDetailSort;
    }
}