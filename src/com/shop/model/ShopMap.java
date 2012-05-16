package com.shop.model;

public class ShopMap {
    private Integer mapId;

    private Integer memberId;

    private String memberName;

    private Integer areaId;

    private String areaInfo;

    private String address;

    private Float pointLng;

    private Float pointLat;

    private String storeName;

    private Integer storeId;

    private String mapApi;

    public Integer getMapId() {
        return mapId;
    }

    public void setMapId(Integer mapId) {
        this.mapId = mapId;
    }

    public Integer getMemberId() {
        return memberId;
    }

    public void setMemberId(Integer memberId) {
        this.memberId = memberId;
    }

    public String getMemberName() {
        return memberName;
    }

    public void setMemberName(String memberName) {
        this.memberName = memberName == null ? null : memberName.trim();
    }

    public Integer getAreaId() {
        return areaId;
    }

    public void setAreaId(Integer areaId) {
        this.areaId = areaId;
    }

    public String getAreaInfo() {
        return areaInfo;
    }

    public void setAreaInfo(String areaInfo) {
        this.areaInfo = areaInfo == null ? null : areaInfo.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public Float getPointLng() {
        return pointLng;
    }

    public void setPointLng(Float pointLng) {
        this.pointLng = pointLng;
    }

    public Float getPointLat() {
        return pointLat;
    }

    public void setPointLat(Float pointLat) {
        this.pointLat = pointLat;
    }

    public String getStoreName() {
        return storeName;
    }

    public void setStoreName(String storeName) {
        this.storeName = storeName == null ? null : storeName.trim();
    }

    public Integer getStoreId() {
        return storeId;
    }

    public void setStoreId(Integer storeId) {
        this.storeId = storeId;
    }

    public String getMapApi() {
        return mapApi;
    }

    public void setMapApi(String mapApi) {
        this.mapApi = mapApi == null ? null : mapApi.trim();
    }
}