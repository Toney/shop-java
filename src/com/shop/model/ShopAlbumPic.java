package com.shop.model;

public class ShopAlbumPic {
    private Integer apicId;

    private String apicName;

    private String apicTag;

    private Integer aclassId;

    private String apicCover;

    private Integer apicSize;

    private String apicSpec;

    private Integer storeId;

    private Integer uploadTime;

    public Integer getApicId() {
        return apicId;
    }

    public void setApicId(Integer apicId) {
        this.apicId = apicId;
    }

    public String getApicName() {
        return apicName;
    }

    public void setApicName(String apicName) {
        this.apicName = apicName == null ? null : apicName.trim();
    }

    public String getApicTag() {
        return apicTag;
    }

    public void setApicTag(String apicTag) {
        this.apicTag = apicTag == null ? null : apicTag.trim();
    }

    public Integer getAclassId() {
        return aclassId;
    }

    public void setAclassId(Integer aclassId) {
        this.aclassId = aclassId;
    }

    public String getApicCover() {
        return apicCover;
    }

    public void setApicCover(String apicCover) {
        this.apicCover = apicCover == null ? null : apicCover.trim();
    }

    public Integer getApicSize() {
        return apicSize;
    }

    public void setApicSize(Integer apicSize) {
        this.apicSize = apicSize;
    }

    public String getApicSpec() {
        return apicSpec;
    }

    public void setApicSpec(String apicSpec) {
        this.apicSpec = apicSpec == null ? null : apicSpec.trim();
    }

    public Integer getStoreId() {
        return storeId;
    }

    public void setStoreId(Integer storeId) {
        this.storeId = storeId;
    }

    public Integer getUploadTime() {
        return uploadTime;
    }

    public void setUploadTime(Integer uploadTime) {
        this.uploadTime = uploadTime;
    }
}