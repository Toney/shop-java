package com.shop.model;

public class ShopUpload {
    private Integer uploadId;

    private String fileName;

    private String fileThumb;

    private String fileWm;

    private Integer fileSize;

    private Integer storeId;

    private Boolean uploadType;

    private Integer uploadTime;

    private Integer itemId;

    public Integer getUploadId() {
        return uploadId;
    }

    public void setUploadId(Integer uploadId) {
        this.uploadId = uploadId;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName == null ? null : fileName.trim();
    }

    public String getFileThumb() {
        return fileThumb;
    }

    public void setFileThumb(String fileThumb) {
        this.fileThumb = fileThumb == null ? null : fileThumb.trim();
    }

    public String getFileWm() {
        return fileWm;
    }

    public void setFileWm(String fileWm) {
        this.fileWm = fileWm == null ? null : fileWm.trim();
    }

    public Integer getFileSize() {
        return fileSize;
    }

    public void setFileSize(Integer fileSize) {
        this.fileSize = fileSize;
    }

    public Integer getStoreId() {
        return storeId;
    }

    public void setStoreId(Integer storeId) {
        this.storeId = storeId;
    }

    public Boolean getUploadType() {
        return uploadType;
    }

    public void setUploadType(Boolean uploadType) {
        this.uploadType = uploadType;
    }

    public Integer getUploadTime() {
        return uploadTime;
    }

    public void setUploadTime(Integer uploadTime) {
        this.uploadTime = uploadTime;
    }

    public Integer getItemId() {
        return itemId;
    }

    public void setItemId(Integer itemId) {
        this.itemId = itemId;
    }
}