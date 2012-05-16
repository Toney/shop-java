package com.shop.model;

public class ShopGoldLog {
    private Integer glogId;

    private Integer glogMemberid;

    private String glogMembername;

    private Integer glogStoreid;

    private String glogStorename;

    private Integer glogAdminid;

    private String glogAdminname;

    private Integer glogGoldnum;

    private Byte glogMethod;

    private Integer glogAddtime;

    private String glogDesc;

    private String glogStage;

    public Integer getGlogId() {
        return glogId;
    }

    public void setGlogId(Integer glogId) {
        this.glogId = glogId;
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

    public Integer getGlogAdminid() {
        return glogAdminid;
    }

    public void setGlogAdminid(Integer glogAdminid) {
        this.glogAdminid = glogAdminid;
    }

    public String getGlogAdminname() {
        return glogAdminname;
    }

    public void setGlogAdminname(String glogAdminname) {
        this.glogAdminname = glogAdminname == null ? null : glogAdminname.trim();
    }

    public Integer getGlogGoldnum() {
        return glogGoldnum;
    }

    public void setGlogGoldnum(Integer glogGoldnum) {
        this.glogGoldnum = glogGoldnum;
    }

    public Byte getGlogMethod() {
        return glogMethod;
    }

    public void setGlogMethod(Byte glogMethod) {
        this.glogMethod = glogMethod;
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

    public String getGlogStage() {
        return glogStage;
    }

    public void setGlogStage(String glogStage) {
        this.glogStage = glogStage == null ? null : glogStage.trim();
    }
}