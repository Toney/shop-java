package com.shop.model;

public class ShopPointsLog {
    private Integer plId;

    private Integer plMemberid;

    private String plMembername;

    private Integer plAdminid;

    private String plAdminname;

    private Integer plPoints;

    private Integer plAddtime;

    private String plDesc;

    private String plStage;

    public Integer getPlId() {
        return plId;
    }

    public void setPlId(Integer plId) {
        this.plId = plId;
    }

    public Integer getPlMemberid() {
        return plMemberid;
    }

    public void setPlMemberid(Integer plMemberid) {
        this.plMemberid = plMemberid;
    }

    public String getPlMembername() {
        return plMembername;
    }

    public void setPlMembername(String plMembername) {
        this.plMembername = plMembername == null ? null : plMembername.trim();
    }

    public Integer getPlAdminid() {
        return plAdminid;
    }

    public void setPlAdminid(Integer plAdminid) {
        this.plAdminid = plAdminid;
    }

    public String getPlAdminname() {
        return plAdminname;
    }

    public void setPlAdminname(String plAdminname) {
        this.plAdminname = plAdminname == null ? null : plAdminname.trim();
    }

    public Integer getPlPoints() {
        return plPoints;
    }

    public void setPlPoints(Integer plPoints) {
        this.plPoints = plPoints;
    }

    public Integer getPlAddtime() {
        return plAddtime;
    }

    public void setPlAddtime(Integer plAddtime) {
        this.plAddtime = plAddtime;
    }

    public String getPlDesc() {
        return plDesc;
    }

    public void setPlDesc(String plDesc) {
        this.plDesc = plDesc == null ? null : plDesc.trim();
    }

    public String getPlStage() {
        return plStage;
    }

    public void setPlStage(String plStage) {
        this.plStage = plStage == null ? null : plStage.trim();
    }
}