package com.shop.model;

public class ShopShareLink {
    private Integer slId;

    private String slName;

    private String slPic;

    private String slInterface;

    private Boolean slType;

    private Boolean slSort;

    public Integer getSlId() {
        return slId;
    }

    public void setSlId(Integer slId) {
        this.slId = slId;
    }

    public String getSlName() {
        return slName;
    }

    public void setSlName(String slName) {
        this.slName = slName == null ? null : slName.trim();
    }

    public String getSlPic() {
        return slPic;
    }

    public void setSlPic(String slPic) {
        this.slPic = slPic == null ? null : slPic.trim();
    }

    public String getSlInterface() {
        return slInterface;
    }

    public void setSlInterface(String slInterface) {
        this.slInterface = slInterface == null ? null : slInterface.trim();
    }

    public Boolean getSlType() {
        return slType;
    }

    public void setSlType(Boolean slType) {
        this.slType = slType;
    }

    public Boolean getSlSort() {
        return slSort;
    }

    public void setSlSort(Boolean slSort) {
        this.slSort = slSort;
    }
}