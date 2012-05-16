package com.shop.model;

public class ShopZtcGoods {
    private Integer ztcId;

    private Integer ztcGoodsid;

    private String ztcGoodsname;

    private String ztcGoodsimage;

    private Integer ztcMemberid;

    private String ztcMembername;

    private Integer ztcStoreid;

    private String ztcStorename;

    private Integer ztcGold;

    private String ztcRemark;

    private Integer ztcAddtime;

    private Integer ztcStartdate;

    private Boolean ztcState;

    private Byte ztcPaystate;

    private Byte ztcType;

    public Integer getZtcId() {
        return ztcId;
    }

    public void setZtcId(Integer ztcId) {
        this.ztcId = ztcId;
    }

    public Integer getZtcGoodsid() {
        return ztcGoodsid;
    }

    public void setZtcGoodsid(Integer ztcGoodsid) {
        this.ztcGoodsid = ztcGoodsid;
    }

    public String getZtcGoodsname() {
        return ztcGoodsname;
    }

    public void setZtcGoodsname(String ztcGoodsname) {
        this.ztcGoodsname = ztcGoodsname == null ? null : ztcGoodsname.trim();
    }

    public String getZtcGoodsimage() {
        return ztcGoodsimage;
    }

    public void setZtcGoodsimage(String ztcGoodsimage) {
        this.ztcGoodsimage = ztcGoodsimage == null ? null : ztcGoodsimage.trim();
    }

    public Integer getZtcMemberid() {
        return ztcMemberid;
    }

    public void setZtcMemberid(Integer ztcMemberid) {
        this.ztcMemberid = ztcMemberid;
    }

    public String getZtcMembername() {
        return ztcMembername;
    }

    public void setZtcMembername(String ztcMembername) {
        this.ztcMembername = ztcMembername == null ? null : ztcMembername.trim();
    }

    public Integer getZtcStoreid() {
        return ztcStoreid;
    }

    public void setZtcStoreid(Integer ztcStoreid) {
        this.ztcStoreid = ztcStoreid;
    }

    public String getZtcStorename() {
        return ztcStorename;
    }

    public void setZtcStorename(String ztcStorename) {
        this.ztcStorename = ztcStorename == null ? null : ztcStorename.trim();
    }

    public Integer getZtcGold() {
        return ztcGold;
    }

    public void setZtcGold(Integer ztcGold) {
        this.ztcGold = ztcGold;
    }

    public String getZtcRemark() {
        return ztcRemark;
    }

    public void setZtcRemark(String ztcRemark) {
        this.ztcRemark = ztcRemark == null ? null : ztcRemark.trim();
    }

    public Integer getZtcAddtime() {
        return ztcAddtime;
    }

    public void setZtcAddtime(Integer ztcAddtime) {
        this.ztcAddtime = ztcAddtime;
    }

    public Integer getZtcStartdate() {
        return ztcStartdate;
    }

    public void setZtcStartdate(Integer ztcStartdate) {
        this.ztcStartdate = ztcStartdate;
    }

    public Boolean getZtcState() {
        return ztcState;
    }

    public void setZtcState(Boolean ztcState) {
        this.ztcState = ztcState;
    }

    public Byte getZtcPaystate() {
        return ztcPaystate;
    }

    public void setZtcPaystate(Byte ztcPaystate) {
        this.ztcPaystate = ztcPaystate;
    }

    public Byte getZtcType() {
        return ztcType;
    }

    public void setZtcType(Byte ztcType) {
        this.ztcType = ztcType;
    }
}