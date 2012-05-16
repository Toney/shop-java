package com.shop.model;

import java.math.BigDecimal;

public class ShopPredepositLog {
    private Integer pdlogId;

    private Integer pdlogMemberid;

    private String pdlogMembername;

    private Integer pdlogAdminid;

    private String pdlogAdminname;

    private String pdlogStage;

    private Boolean pdlogType;

    private BigDecimal pdlogPrice;

    private Integer pdlogAddtime;

    private String pdlogDesc;

    public Integer getPdlogId() {
        return pdlogId;
    }

    public void setPdlogId(Integer pdlogId) {
        this.pdlogId = pdlogId;
    }

    public Integer getPdlogMemberid() {
        return pdlogMemberid;
    }

    public void setPdlogMemberid(Integer pdlogMemberid) {
        this.pdlogMemberid = pdlogMemberid;
    }

    public String getPdlogMembername() {
        return pdlogMembername;
    }

    public void setPdlogMembername(String pdlogMembername) {
        this.pdlogMembername = pdlogMembername == null ? null : pdlogMembername.trim();
    }

    public Integer getPdlogAdminid() {
        return pdlogAdminid;
    }

    public void setPdlogAdminid(Integer pdlogAdminid) {
        this.pdlogAdminid = pdlogAdminid;
    }

    public String getPdlogAdminname() {
        return pdlogAdminname;
    }

    public void setPdlogAdminname(String pdlogAdminname) {
        this.pdlogAdminname = pdlogAdminname == null ? null : pdlogAdminname.trim();
    }

    public String getPdlogStage() {
        return pdlogStage;
    }

    public void setPdlogStage(String pdlogStage) {
        this.pdlogStage = pdlogStage == null ? null : pdlogStage.trim();
    }

    public Boolean getPdlogType() {
        return pdlogType;
    }

    public void setPdlogType(Boolean pdlogType) {
        this.pdlogType = pdlogType;
    }

    public BigDecimal getPdlogPrice() {
        return pdlogPrice;
    }

    public void setPdlogPrice(BigDecimal pdlogPrice) {
        this.pdlogPrice = pdlogPrice;
    }

    public Integer getPdlogAddtime() {
        return pdlogAddtime;
    }

    public void setPdlogAddtime(Integer pdlogAddtime) {
        this.pdlogAddtime = pdlogAddtime;
    }

    public String getPdlogDesc() {
        return pdlogDesc;
    }

    public void setPdlogDesc(String pdlogDesc) {
        this.pdlogDesc = pdlogDesc == null ? null : pdlogDesc.trim();
    }
}