package com.shop.model;

public class ShopPointsOrdergoods {
    private Integer pointRecid;

    private Integer pointOrderid;

    private Integer pointGoodsid;

    private String pointGoodsname;

    private Integer pointGoodspoints;

    private Integer pointGoodsnum;

    private String pointGoodsimage;

    public Integer getPointRecid() {
        return pointRecid;
    }

    public void setPointRecid(Integer pointRecid) {
        this.pointRecid = pointRecid;
    }

    public Integer getPointOrderid() {
        return pointOrderid;
    }

    public void setPointOrderid(Integer pointOrderid) {
        this.pointOrderid = pointOrderid;
    }

    public Integer getPointGoodsid() {
        return pointGoodsid;
    }

    public void setPointGoodsid(Integer pointGoodsid) {
        this.pointGoodsid = pointGoodsid;
    }

    public String getPointGoodsname() {
        return pointGoodsname;
    }

    public void setPointGoodsname(String pointGoodsname) {
        this.pointGoodsname = pointGoodsname == null ? null : pointGoodsname.trim();
    }

    public Integer getPointGoodspoints() {
        return pointGoodspoints;
    }

    public void setPointGoodspoints(Integer pointGoodspoints) {
        this.pointGoodspoints = pointGoodspoints;
    }

    public Integer getPointGoodsnum() {
        return pointGoodsnum;
    }

    public void setPointGoodsnum(Integer pointGoodsnum) {
        this.pointGoodsnum = pointGoodsnum;
    }

    public String getPointGoodsimage() {
        return pointGoodsimage;
    }

    public void setPointGoodsimage(String pointGoodsimage) {
        this.pointGoodsimage = pointGoodsimage == null ? null : pointGoodsimage.trim();
    }
}