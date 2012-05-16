package com.shop.model;

public class ShopCustomerService {
    private Integer csId;

    private String csName;

    private String csPassword;

    private String csUrl;

    private String csPhone;

    private String csEmail;

    private String csKey;

    public Integer getCsId() {
        return csId;
    }

    public void setCsId(Integer csId) {
        this.csId = csId;
    }

    public String getCsName() {
        return csName;
    }

    public void setCsName(String csName) {
        this.csName = csName == null ? null : csName.trim();
    }

    public String getCsPassword() {
        return csPassword;
    }

    public void setCsPassword(String csPassword) {
        this.csPassword = csPassword == null ? null : csPassword.trim();
    }

    public String getCsUrl() {
        return csUrl;
    }

    public void setCsUrl(String csUrl) {
        this.csUrl = csUrl == null ? null : csUrl.trim();
    }

    public String getCsPhone() {
        return csPhone;
    }

    public void setCsPhone(String csPhone) {
        this.csPhone = csPhone == null ? null : csPhone.trim();
    }

    public String getCsEmail() {
        return csEmail;
    }

    public void setCsEmail(String csEmail) {
        this.csEmail = csEmail == null ? null : csEmail.trim();
    }

    public String getCsKey() {
        return csKey;
    }

    public void setCsKey(String csKey) {
        this.csKey = csKey == null ? null : csKey.trim();
    }
}