package com.shop.model;

public class ShopMailMsgTemlates {
    private String code;

    private String name;

    private String title;

    private Boolean type;

    private Boolean mailSwitch;

    private String content;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code == null ? null : code.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public Boolean getType() {
        return type;
    }

    public void setType(Boolean type) {
        this.type = type;
    }

    public Boolean getMailSwitch() {
        return mailSwitch;
    }

    public void setMailSwitch(Boolean mailSwitch) {
        this.mailSwitch = mailSwitch;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}