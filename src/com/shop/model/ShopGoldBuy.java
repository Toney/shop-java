package com.shop.model;

import java.math.BigDecimal;

public class ShopGoldBuy {
    private Integer gbuyId;

    private Integer gbuyMid;

    private String gbuyMembername;

    private Integer gbuyStoreid;

    private String gbuyStorename;

    private Integer gbuyNum;

    private BigDecimal gbuyPrice;

    private Integer gbuyAddtime;

    private Byte gbuyIspay;

    private Integer gbuyAdminid;

    private String gbuySysRemark;

    private String gbuyUserRemark;

    private String gbuyCheckType;

    public Integer getGbuyId() {
        return gbuyId;
    }

    public void setGbuyId(Integer gbuyId) {
        this.gbuyId = gbuyId;
    }

    public Integer getGbuyMid() {
        return gbuyMid;
    }

    public void setGbuyMid(Integer gbuyMid) {
        this.gbuyMid = gbuyMid;
    }

    public String getGbuyMembername() {
        return gbuyMembername;
    }

    public void setGbuyMembername(String gbuyMembername) {
        this.gbuyMembername = gbuyMembername == null ? null : gbuyMembername.trim();
    }

    public Integer getGbuyStoreid() {
        return gbuyStoreid;
    }

    public void setGbuyStoreid(Integer gbuyStoreid) {
        this.gbuyStoreid = gbuyStoreid;
    }

    public String getGbuyStorename() {
        return gbuyStorename;
    }

    public void setGbuyStorename(String gbuyStorename) {
        this.gbuyStorename = gbuyStorename == null ? null : gbuyStorename.trim();
    }

    public Integer getGbuyNum() {
        return gbuyNum;
    }

    public void setGbuyNum(Integer gbuyNum) {
        this.gbuyNum = gbuyNum;
    }

    public BigDecimal getGbuyPrice() {
        return gbuyPrice;
    }

    public void setGbuyPrice(BigDecimal gbuyPrice) {
        this.gbuyPrice = gbuyPrice;
    }

    public Integer getGbuyAddtime() {
        return gbuyAddtime;
    }

    public void setGbuyAddtime(Integer gbuyAddtime) {
        this.gbuyAddtime = gbuyAddtime;
    }

    public Byte getGbuyIspay() {
        return gbuyIspay;
    }

    public void setGbuyIspay(Byte gbuyIspay) {
        this.gbuyIspay = gbuyIspay;
    }

    public Integer getGbuyAdminid() {
        return gbuyAdminid;
    }

    public void setGbuyAdminid(Integer gbuyAdminid) {
        this.gbuyAdminid = gbuyAdminid;
    }

    public String getGbuySysRemark() {
        return gbuySysRemark;
    }

    public void setGbuySysRemark(String gbuySysRemark) {
        this.gbuySysRemark = gbuySysRemark == null ? null : gbuySysRemark.trim();
    }

    public String getGbuyUserRemark() {
        return gbuyUserRemark;
    }

    public void setGbuyUserRemark(String gbuyUserRemark) {
        this.gbuyUserRemark = gbuyUserRemark == null ? null : gbuyUserRemark.trim();
    }

    public String getGbuyCheckType() {
        return gbuyCheckType;
    }

    public void setGbuyCheckType(String gbuyCheckType) {
        this.gbuyCheckType = gbuyCheckType == null ? null : gbuyCheckType.trim();
    }
}