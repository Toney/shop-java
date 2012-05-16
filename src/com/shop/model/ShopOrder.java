package com.shop.model;

import java.util.Date;

public class ShopOrder {
    private Integer id;

    private String orderNo;

    private Integer userId;

    private String acceptName;

    private String payCode;

    private Integer payType;

    private Integer distribution;

    private Integer status;

    private Integer payStatus;

    private Integer distributionStatus;

    private String postcode;

    private String telphone;

    private Integer country;

    private Integer province;

    private Integer city;

    private Integer area;

    private String address;

    private String mobile;

    private Float payableAmount;

    private Float realAmount;

    private Float payableFreight;

    private Float realFreight;

    private Date payTime;

    private Date sendTime;

    private Date createTime;

    private Date completionTime;

    private Integer invoice;

    private String postscript;

    private Integer ifDel;

    private Float insured;

    private Integer ifInsured;

    private Float payFee;

    private String invoiceTitle;

    private Float taxes;

    private Float promotions;

    private Float discount;

    private Float orderAmount;

    private String ifPrint;

    private String prop;

    private String acceptTime;

    private Integer exp;

    private Integer point;

    private Integer type;

    private String note;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo == null ? null : orderNo.trim();
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getAcceptName() {
        return acceptName;
    }

    public void setAcceptName(String acceptName) {
        this.acceptName = acceptName == null ? null : acceptName.trim();
    }

    public String getPayCode() {
        return payCode;
    }

    public void setPayCode(String payCode) {
        this.payCode = payCode == null ? null : payCode.trim();
    }

    public Integer getPayType() {
        return payType;
    }

    public void setPayType(Integer payType) {
        this.payType = payType;
    }

    public Integer getDistribution() {
        return distribution;
    }

    public void setDistribution(Integer distribution) {
        this.distribution = distribution;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getPayStatus() {
        return payStatus;
    }

    public void setPayStatus(Integer payStatus) {
        this.payStatus = payStatus;
    }

    public Integer getDistributionStatus() {
        return distributionStatus;
    }

    public void setDistributionStatus(Integer distributionStatus) {
        this.distributionStatus = distributionStatus;
    }

    public String getPostcode() {
        return postcode;
    }

    public void setPostcode(String postcode) {
        this.postcode = postcode == null ? null : postcode.trim();
    }

    public String getTelphone() {
        return telphone;
    }

    public void setTelphone(String telphone) {
        this.telphone = telphone == null ? null : telphone.trim();
    }

    public Integer getCountry() {
        return country;
    }

    public void setCountry(Integer country) {
        this.country = country;
    }

    public Integer getProvince() {
        return province;
    }

    public void setProvince(Integer province) {
        this.province = province;
    }

    public Integer getCity() {
        return city;
    }

    public void setCity(Integer city) {
        this.city = city;
    }

    public Integer getArea() {
        return area;
    }

    public void setArea(Integer area) {
        this.area = area;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile == null ? null : mobile.trim();
    }

    public Float getPayableAmount() {
        return payableAmount;
    }

    public void setPayableAmount(Float payableAmount) {
        this.payableAmount = payableAmount;
    }

    public Float getRealAmount() {
        return realAmount;
    }

    public void setRealAmount(Float realAmount) {
        this.realAmount = realAmount;
    }

    public Float getPayableFreight() {
        return payableFreight;
    }

    public void setPayableFreight(Float payableFreight) {
        this.payableFreight = payableFreight;
    }

    public Float getRealFreight() {
        return realFreight;
    }

    public void setRealFreight(Float realFreight) {
        this.realFreight = realFreight;
    }

    public Date getPayTime() {
        return payTime;
    }

    public void setPayTime(Date payTime) {
        this.payTime = payTime;
    }

    public Date getSendTime() {
        return sendTime;
    }

    public void setSendTime(Date sendTime) {
        this.sendTime = sendTime;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getCompletionTime() {
        return completionTime;
    }

    public void setCompletionTime(Date completionTime) {
        this.completionTime = completionTime;
    }

    public Integer getInvoice() {
        return invoice;
    }

    public void setInvoice(Integer invoice) {
        this.invoice = invoice;
    }

    public String getPostscript() {
        return postscript;
    }

    public void setPostscript(String postscript) {
        this.postscript = postscript == null ? null : postscript.trim();
    }

    public Integer getIfDel() {
        return ifDel;
    }

    public void setIfDel(Integer ifDel) {
        this.ifDel = ifDel;
    }

    public Float getInsured() {
        return insured;
    }

    public void setInsured(Float insured) {
        this.insured = insured;
    }

    public Integer getIfInsured() {
        return ifInsured;
    }

    public void setIfInsured(Integer ifInsured) {
        this.ifInsured = ifInsured;
    }

    public Float getPayFee() {
        return payFee;
    }

    public void setPayFee(Float payFee) {
        this.payFee = payFee;
    }

    public String getInvoiceTitle() {
        return invoiceTitle;
    }

    public void setInvoiceTitle(String invoiceTitle) {
        this.invoiceTitle = invoiceTitle == null ? null : invoiceTitle.trim();
    }

    public Float getTaxes() {
        return taxes;
    }

    public void setTaxes(Float taxes) {
        this.taxes = taxes;
    }

    public Float getPromotions() {
        return promotions;
    }

    public void setPromotions(Float promotions) {
        this.promotions = promotions;
    }

    public Float getDiscount() {
        return discount;
    }

    public void setDiscount(Float discount) {
        this.discount = discount;
    }

    public Float getOrderAmount() {
        return orderAmount;
    }

    public void setOrderAmount(Float orderAmount) {
        this.orderAmount = orderAmount;
    }

    public String getIfPrint() {
        return ifPrint;
    }

    public void setIfPrint(String ifPrint) {
        this.ifPrint = ifPrint == null ? null : ifPrint.trim();
    }

    public String getProp() {
        return prop;
    }

    public void setProp(String prop) {
        this.prop = prop == null ? null : prop.trim();
    }

    public String getAcceptTime() {
        return acceptTime;
    }

    public void setAcceptTime(String acceptTime) {
        this.acceptTime = acceptTime == null ? null : acceptTime.trim();
    }

    public Integer getExp() {
        return exp;
    }

    public void setExp(Integer exp) {
        this.exp = exp;
    }

    public Integer getPoint() {
        return point;
    }

    public void setPoint(Integer point) {
        this.point = point;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note == null ? null : note.trim();
    }
}