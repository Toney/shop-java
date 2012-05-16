package com.shop.model;

import java.math.BigDecimal;

public class ShopPredepositRecharge {
    private Integer pdrId;

    private String pdrSn;

    private Integer pdrMemberid;

    private String pdrMembername;

    private BigDecimal pdrPrice;

    private String pdrPayment;

    private String pdrOnlinecode;

    private String pdrRemittancename;

    private String pdrRemittancebank;

    private Integer pdrRemittancedate;

    private String pdrMemberremark;

    private Integer pdrAddtime;

    private Boolean pdrState;

    private Boolean pdrPaystate;

    private Integer pdrAdminid;

    private String pdrAdminname;

    private String pdrAdminremark;

    public Integer getPdrId() {
        return pdrId;
    }

    public void setPdrId(Integer pdrId) {
        this.pdrId = pdrId;
    }

    public String getPdrSn() {
        return pdrSn;
    }

    public void setPdrSn(String pdrSn) {
        this.pdrSn = pdrSn == null ? null : pdrSn.trim();
    }

    public Integer getPdrMemberid() {
        return pdrMemberid;
    }

    public void setPdrMemberid(Integer pdrMemberid) {
        this.pdrMemberid = pdrMemberid;
    }

    public String getPdrMembername() {
        return pdrMembername;
    }

    public void setPdrMembername(String pdrMembername) {
        this.pdrMembername = pdrMembername == null ? null : pdrMembername.trim();
    }

    public BigDecimal getPdrPrice() {
        return pdrPrice;
    }

    public void setPdrPrice(BigDecimal pdrPrice) {
        this.pdrPrice = pdrPrice;
    }

    public String getPdrPayment() {
        return pdrPayment;
    }

    public void setPdrPayment(String pdrPayment) {
        this.pdrPayment = pdrPayment == null ? null : pdrPayment.trim();
    }

    public String getPdrOnlinecode() {
        return pdrOnlinecode;
    }

    public void setPdrOnlinecode(String pdrOnlinecode) {
        this.pdrOnlinecode = pdrOnlinecode == null ? null : pdrOnlinecode.trim();
    }

    public String getPdrRemittancename() {
        return pdrRemittancename;
    }

    public void setPdrRemittancename(String pdrRemittancename) {
        this.pdrRemittancename = pdrRemittancename == null ? null : pdrRemittancename.trim();
    }

    public String getPdrRemittancebank() {
        return pdrRemittancebank;
    }

    public void setPdrRemittancebank(String pdrRemittancebank) {
        this.pdrRemittancebank = pdrRemittancebank == null ? null : pdrRemittancebank.trim();
    }

    public Integer getPdrRemittancedate() {
        return pdrRemittancedate;
    }

    public void setPdrRemittancedate(Integer pdrRemittancedate) {
        this.pdrRemittancedate = pdrRemittancedate;
    }

    public String getPdrMemberremark() {
        return pdrMemberremark;
    }

    public void setPdrMemberremark(String pdrMemberremark) {
        this.pdrMemberremark = pdrMemberremark == null ? null : pdrMemberremark.trim();
    }

    public Integer getPdrAddtime() {
        return pdrAddtime;
    }

    public void setPdrAddtime(Integer pdrAddtime) {
        this.pdrAddtime = pdrAddtime;
    }

    public Boolean getPdrState() {
        return pdrState;
    }

    public void setPdrState(Boolean pdrState) {
        this.pdrState = pdrState;
    }

    public Boolean getPdrPaystate() {
        return pdrPaystate;
    }

    public void setPdrPaystate(Boolean pdrPaystate) {
        this.pdrPaystate = pdrPaystate;
    }

    public Integer getPdrAdminid() {
        return pdrAdminid;
    }

    public void setPdrAdminid(Integer pdrAdminid) {
        this.pdrAdminid = pdrAdminid;
    }

    public String getPdrAdminname() {
        return pdrAdminname;
    }

    public void setPdrAdminname(String pdrAdminname) {
        this.pdrAdminname = pdrAdminname == null ? null : pdrAdminname.trim();
    }

    public String getPdrAdminremark() {
        return pdrAdminremark;
    }

    public void setPdrAdminremark(String pdrAdminremark) {
        this.pdrAdminremark = pdrAdminremark == null ? null : pdrAdminremark.trim();
    }
}