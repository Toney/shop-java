package com.shop.model;

import java.util.Date;

public class ShopWithdraw {
    private Integer id;

    private Integer userId;

    private Date time;

    private Float amount;

    private String account;

    private Boolean type;

    private String name;

    private String accountBank;

    private String belongBank;

    private Boolean status;

    private String note;

    private String reNote;

    private Boolean isDel;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Float getAmount() {
        return amount;
    }

    public void setAmount(Float amount) {
        this.amount = amount;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account == null ? null : account.trim();
    }

    public Boolean getType() {
        return type;
    }

    public void setType(Boolean type) {
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getAccountBank() {
        return accountBank;
    }

    public void setAccountBank(String accountBank) {
        this.accountBank = accountBank == null ? null : accountBank.trim();
    }

    public String getBelongBank() {
        return belongBank;
    }

    public void setBelongBank(String belongBank) {
        this.belongBank = belongBank == null ? null : belongBank.trim();
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note == null ? null : note.trim();
    }

    public String getReNote() {
        return reNote;
    }

    public void setReNote(String reNote) {
        this.reNote = reNote == null ? null : reNote.trim();
    }

    public Boolean getIsDel() {
        return isDel;
    }

    public void setIsDel(Boolean isDel) {
        this.isDel = isDel;
    }
}