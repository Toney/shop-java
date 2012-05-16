package com.shop.model;

import java.math.BigDecimal;

public class ShopPointsOrder {
    private Integer pointOrderid;

    private String pointOrdersn;

    private Integer pointBuyerid;

    private String pointBuyername;

    private String pointBuyeremail;

    private Integer pointAddtime;

    private Integer pointPaymentid;

    private String pointPaymentname;

    private String pointPaymentcode;

    private Boolean pointPaymentdirect;

    private String pointOutsn;

    private Integer pointPaymenttime;

    private String pointPaymessage;

    private Integer pointShippingtime;

    private String pointShippingcode;

    private String pointShippingdesc;

    private String pointOutpaymentcode;

    private Integer pointFinnshedtime;

    private Integer pointAllpoint;

    private BigDecimal pointOrderamount;

    private Boolean pointShippingcharge;

    private BigDecimal pointShippingfee;

    private String pointOrdermessage;

    private Integer pointOrderstate;

    public Integer getPointOrderid() {
        return pointOrderid;
    }

    public void setPointOrderid(Integer pointOrderid) {
        this.pointOrderid = pointOrderid;
    }

    public String getPointOrdersn() {
        return pointOrdersn;
    }

    public void setPointOrdersn(String pointOrdersn) {
        this.pointOrdersn = pointOrdersn == null ? null : pointOrdersn.trim();
    }

    public Integer getPointBuyerid() {
        return pointBuyerid;
    }

    public void setPointBuyerid(Integer pointBuyerid) {
        this.pointBuyerid = pointBuyerid;
    }

    public String getPointBuyername() {
        return pointBuyername;
    }

    public void setPointBuyername(String pointBuyername) {
        this.pointBuyername = pointBuyername == null ? null : pointBuyername.trim();
    }

    public String getPointBuyeremail() {
        return pointBuyeremail;
    }

    public void setPointBuyeremail(String pointBuyeremail) {
        this.pointBuyeremail = pointBuyeremail == null ? null : pointBuyeremail.trim();
    }

    public Integer getPointAddtime() {
        return pointAddtime;
    }

    public void setPointAddtime(Integer pointAddtime) {
        this.pointAddtime = pointAddtime;
    }

    public Integer getPointPaymentid() {
        return pointPaymentid;
    }

    public void setPointPaymentid(Integer pointPaymentid) {
        this.pointPaymentid = pointPaymentid;
    }

    public String getPointPaymentname() {
        return pointPaymentname;
    }

    public void setPointPaymentname(String pointPaymentname) {
        this.pointPaymentname = pointPaymentname == null ? null : pointPaymentname.trim();
    }

    public String getPointPaymentcode() {
        return pointPaymentcode;
    }

    public void setPointPaymentcode(String pointPaymentcode) {
        this.pointPaymentcode = pointPaymentcode == null ? null : pointPaymentcode.trim();
    }

    public Boolean getPointPaymentdirect() {
        return pointPaymentdirect;
    }

    public void setPointPaymentdirect(Boolean pointPaymentdirect) {
        this.pointPaymentdirect = pointPaymentdirect;
    }

    public String getPointOutsn() {
        return pointOutsn;
    }

    public void setPointOutsn(String pointOutsn) {
        this.pointOutsn = pointOutsn == null ? null : pointOutsn.trim();
    }

    public Integer getPointPaymenttime() {
        return pointPaymenttime;
    }

    public void setPointPaymenttime(Integer pointPaymenttime) {
        this.pointPaymenttime = pointPaymenttime;
    }

    public String getPointPaymessage() {
        return pointPaymessage;
    }

    public void setPointPaymessage(String pointPaymessage) {
        this.pointPaymessage = pointPaymessage == null ? null : pointPaymessage.trim();
    }

    public Integer getPointShippingtime() {
        return pointShippingtime;
    }

    public void setPointShippingtime(Integer pointShippingtime) {
        this.pointShippingtime = pointShippingtime;
    }

    public String getPointShippingcode() {
        return pointShippingcode;
    }

    public void setPointShippingcode(String pointShippingcode) {
        this.pointShippingcode = pointShippingcode == null ? null : pointShippingcode.trim();
    }

    public String getPointShippingdesc() {
        return pointShippingdesc;
    }

    public void setPointShippingdesc(String pointShippingdesc) {
        this.pointShippingdesc = pointShippingdesc == null ? null : pointShippingdesc.trim();
    }

    public String getPointOutpaymentcode() {
        return pointOutpaymentcode;
    }

    public void setPointOutpaymentcode(String pointOutpaymentcode) {
        this.pointOutpaymentcode = pointOutpaymentcode == null ? null : pointOutpaymentcode.trim();
    }

    public Integer getPointFinnshedtime() {
        return pointFinnshedtime;
    }

    public void setPointFinnshedtime(Integer pointFinnshedtime) {
        this.pointFinnshedtime = pointFinnshedtime;
    }

    public Integer getPointAllpoint() {
        return pointAllpoint;
    }

    public void setPointAllpoint(Integer pointAllpoint) {
        this.pointAllpoint = pointAllpoint;
    }

    public BigDecimal getPointOrderamount() {
        return pointOrderamount;
    }

    public void setPointOrderamount(BigDecimal pointOrderamount) {
        this.pointOrderamount = pointOrderamount;
    }

    public Boolean getPointShippingcharge() {
        return pointShippingcharge;
    }

    public void setPointShippingcharge(Boolean pointShippingcharge) {
        this.pointShippingcharge = pointShippingcharge;
    }

    public BigDecimal getPointShippingfee() {
        return pointShippingfee;
    }

    public void setPointShippingfee(BigDecimal pointShippingfee) {
        this.pointShippingfee = pointShippingfee;
    }

    public String getPointOrdermessage() {
        return pointOrdermessage;
    }

    public void setPointOrdermessage(String pointOrdermessage) {
        this.pointOrdermessage = pointOrdermessage == null ? null : pointOrdermessage.trim();
    }

    public Integer getPointOrderstate() {
        return pointOrderstate;
    }

    public void setPointOrderstate(Integer pointOrderstate) {
        this.pointOrderstate = pointOrderstate;
    }
}