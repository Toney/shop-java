package com.shop.model;

public class ShopZtcGlodlog {
    private Integer glogId;

    private Integer glogGoodsid;

    private String glogGoodsname;

    private Integer glogMemberid;

    private String glogMembername;

    private Integer glogStoreid;

    private String glogStorename;

    private Byte glogType;

    private Integer glogGoldnum;

    private Integer glogAddtime;

    private String glogDesc;

    public Integer getGlogId() {
        return glogId;
    }

    public void setGlogId(Integer glogId) {
        this.glogId = glogId;
    }

    public Integer getGlogGoodsid() {
        return glogGoodsid;
    }

    public void setGlogGoodsid(Integer glogGoodsid) {
        this.glogGoodsid = glogGoodsid;
    }

    public String getGlogGoodsname() {
        return glogGoodsname;
    }

    public void setGlogGoodsname(String glogGoodsname) {
        this.glogGoodsname = glogGoodsname == null ? null : glogGoodsname.trim();
    }

    public Integer getGlogMemberid() {
        return glogMemberid;
    }

    public void setGlogMemberid(Integer glogMemberid) {
        this.glogMemberid = glogMemberid;
    }

    public String getGlogMembername() {
        return glogMembername;
    }

    public void setGlogMembername(String glogMembername) {
        this.glogMembername = glogMembername == null ? null : glogMembername.trim();
    }

    public Integer getGlogStoreid() {
        return glogStoreid;
    }

    public void setGlogStoreid(Integer glogStoreid) {
        this.glogStoreid = glogStoreid;
    }

    public String getGlogStorename() {
        return glogStorename;
    }

    public void setGlogStorename(String glogStorename) {
        this.glogStorename = glogStorename == null ? null : glogStorename.trim();
    }

    public Byte getGlogType() {
        return glogType;
    }

    public void setGlogType(Byte glogType) {
        this.glogType = glogType;
    }

    public Integer getGlogGoldnum() {
        return glogGoldnum;
    }

    public void setGlogGoldnum(Integer glogGoldnum) {
        this.glogGoldnum = glogGoldnum;
    }

    public Integer getGlogAddtime() {
        return glogAddtime;
    }

    public void setGlogAddtime(Integer glogAddtime) {
        this.glogAddtime = glogAddtime;
    }

    public String getGlogDesc() {
        return glogDesc;
    }

    public void setGlogDesc(String glogDesc) {
        this.glogDesc = glogDesc == null ? null : glogDesc.trim();
    }
}