package com.shop.model;

import java.math.BigDecimal;

public class ShopPredepositCash {
    private Integer pdcashId;

    private String pdcashSn;

    private Integer pdcashMemberid;

    private String pdcashMembername;

    private BigDecimal pdcashPrice;

    private String pdcashPayment;

    private String pdcashPaymentaccount;

    private String pdcashToname;

    private String pdcashTobank;

    private String pdcashMemberremark;

    private Integer pdcashAddtime;

    private Boolean pdcashState;

    private Boolean pdcashPaystate;

    private Integer pdcashAdminid;

    private String pdcashAdminname;

    private String pdcashAdminremark;

    private String pdcashRemark;

    public Integer getPdcashId() {
        return pdcashId;
    }

    public void setPdcashId(Integer pdcashId) {
        this.pdcashId = pdcashId;
    }

    public String getPdcashSn() {
        return pdcashSn;
    }

    public void setPdcashSn(String pdcashSn) {
        this.pdcashSn = pdcashSn == null ? null : pdcashSn.trim();
    }

    public Integer getPdcashMemberid() {
        return pdcashMemberid;
    }

    public void setPdcashMemberid(Integer pdcashMemberid) {
        this.pdcashMemberid = pdcashMemberid;
    }

    public String getPdcashMembername() {
        return pdcashMembername;
    }

    public void setPdcashMembername(String pdcashMembername) {
        this.pdcashMembername = pdcashMembername == null ? null : pdcashMembername.trim();
    }

    public BigDecimal getPdcashPrice() {
        return pdcashPrice;
    }

    public void setPdcashPrice(BigDecimal pdcashPrice) {
        this.pdcashPrice = pdcashPrice;
    }

    public String getPdcashPayment() {
        return pdcashPayment;
    }

    public void setPdcashPayment(String pdcashPayment) {
        this.pdcashPayment = pdcashPayment == null ? null : pdcashPayment.trim();
    }

    public String getPdcashPaymentaccount() {
        return pdcashPaymentaccount;
    }

    public void setPdcashPaymentaccount(String pdcashPaymentaccount) {
        this.pdcashPaymentaccount = pdcashPaymentaccount == null ? null : pdcashPaymentaccount.trim();
    }

    public String getPdcashToname() {
        return pdcashToname;
    }

    public void setPdcashToname(String pdcashToname) {
        this.pdcashToname = pdcashToname == null ? null : pdcashToname.trim();
    }

    public String getPdcashTobank() {
        return pdcashTobank;
    }

    public void setPdcashTobank(String pdcashTobank) {
        this.pdcashTobank = pdcashTobank == null ? null : pdcashTobank.trim();
    }

    public String getPdcashMemberremark() {
        return pdcashMemberremark;
    }

    public void setPdcashMemberremark(String pdcashMemberremark) {
        this.pdcashMemberremark = pdcashMemberremark == null ? null : pdcashMemberremark.trim();
    }

    public Integer getPdcashAddtime() {
        return pdcashAddtime;
    }

    public void setPdcashAddtime(Integer pdcashAddtime) {
        this.pdcashAddtime = pdcashAddtime;
    }

    public Boolean getPdcashState() {
        return pdcashState;
    }

    public void setPdcashState(Boolean pdcashState) {
        this.pdcashState = pdcashState;
    }

    public Boolean getPdcashPaystate() {
        return pdcashPaystate;
    }

    public void setPdcashPaystate(Boolean pdcashPaystate) {
        this.pdcashPaystate = pdcashPaystate;
    }

    public Integer getPdcashAdminid() {
        return pdcashAdminid;
    }

    public void setPdcashAdminid(Integer pdcashAdminid) {
        this.pdcashAdminid = pdcashAdminid;
    }

    public String getPdcashAdminname() {
        return pdcashAdminname;
    }

    public void setPdcashAdminname(String pdcashAdminname) {
        this.pdcashAdminname = pdcashAdminname == null ? null : pdcashAdminname.trim();
    }

    public String getPdcashAdminremark() {
        return pdcashAdminremark;
    }

    public void setPdcashAdminremark(String pdcashAdminremark) {
        this.pdcashAdminremark = pdcashAdminremark == null ? null : pdcashAdminremark.trim();
    }

    public String getPdcashRemark() {
        return pdcashRemark;
    }

    public void setPdcashRemark(String pdcashRemark) {
        this.pdcashRemark = pdcashRemark == null ? null : pdcashRemark.trim();
    }
}