package com.shop.model;

public class ShopStoreGradelog {
    private Integer glId;

    private Integer glShopid;

    private String glShopname;

    private Integer glMemberid;

    private String glMembername;

    private Integer glSgid;

    private String glSgname;

    private Byte glSgconfirm;

    private Byte glSgsort;

    private Integer glAddtime;

    private Boolean glAllowstate;

    private Integer glAllowadminid;

    private String glAllowadminname;

    private String glAllowremark;

    public Integer getGlId() {
        return glId;
    }

    public void setGlId(Integer glId) {
        this.glId = glId;
    }

    public Integer getGlShopid() {
        return glShopid;
    }

    public void setGlShopid(Integer glShopid) {
        this.glShopid = glShopid;
    }

    public String getGlShopname() {
        return glShopname;
    }

    public void setGlShopname(String glShopname) {
        this.glShopname = glShopname == null ? null : glShopname.trim();
    }

    public Integer getGlMemberid() {
        return glMemberid;
    }

    public void setGlMemberid(Integer glMemberid) {
        this.glMemberid = glMemberid;
    }

    public String getGlMembername() {
        return glMembername;
    }

    public void setGlMembername(String glMembername) {
        this.glMembername = glMembername == null ? null : glMembername.trim();
    }

    public Integer getGlSgid() {
        return glSgid;
    }

    public void setGlSgid(Integer glSgid) {
        this.glSgid = glSgid;
    }

    public String getGlSgname() {
        return glSgname;
    }

    public void setGlSgname(String glSgname) {
        this.glSgname = glSgname == null ? null : glSgname.trim();
    }

    public Byte getGlSgconfirm() {
        return glSgconfirm;
    }

    public void setGlSgconfirm(Byte glSgconfirm) {
        this.glSgconfirm = glSgconfirm;
    }

    public Byte getGlSgsort() {
        return glSgsort;
    }

    public void setGlSgsort(Byte glSgsort) {
        this.glSgsort = glSgsort;
    }

    public Integer getGlAddtime() {
        return glAddtime;
    }

    public void setGlAddtime(Integer glAddtime) {
        this.glAddtime = glAddtime;
    }

    public Boolean getGlAllowstate() {
        return glAllowstate;
    }

    public void setGlAllowstate(Boolean glAllowstate) {
        this.glAllowstate = glAllowstate;
    }

    public Integer getGlAllowadminid() {
        return glAllowadminid;
    }

    public void setGlAllowadminid(Integer glAllowadminid) {
        this.glAllowadminid = glAllowadminid;
    }

    public String getGlAllowadminname() {
        return glAllowadminname;
    }

    public void setGlAllowadminname(String glAllowadminname) {
        this.glAllowadminname = glAllowadminname == null ? null : glAllowadminname.trim();
    }

    public String getGlAllowremark() {
        return glAllowremark;
    }

    public void setGlAllowremark(String glAllowremark) {
        this.glAllowremark = glAllowremark == null ? null : glAllowremark.trim();
    }
}