package com.shop.model;

import java.util.Date;

public class ShopLogError {
    private Integer id;

    private String file;

    private Short line;

    private String content;

    private Date datetime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFile() {
        return file;
    }

    public void setFile(String file) {
        this.file = file == null ? null : file.trim();
    }

    public Short getLine() {
        return line;
    }

    public void setLine(Short line) {
        this.line = line;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Date getDatetime() {
        return datetime;
    }

    public void setDatetime(Date datetime) {
        this.datetime = datetime;
    }
}