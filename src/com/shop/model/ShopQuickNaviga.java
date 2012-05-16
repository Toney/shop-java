package com.shop.model;

public class ShopQuickNaviga {
    private Integer id;

    private Integer adminid;

    private String navigaName;

    private String url;

    private Boolean isDel;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getAdminid() {
        return adminid;
    }

    public void setAdminid(Integer adminid) {
        this.adminid = adminid;
    }

    public String getNavigaName() {
        return navigaName;
    }

    public void setNavigaName(String navigaName) {
        this.navigaName = navigaName == null ? null : navigaName.trim();
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    public Boolean getIsDel() {
        return isDel;
    }

    public void setIsDel(Boolean isDel) {
        this.isDel = isDel;
    }
}