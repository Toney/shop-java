package com.shop.model;

import java.util.Date;

public class ShopLogSql {
    private Integer id;

    private String content;

    private Float runtime;

    private Date datetime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Float getRuntime() {
        return runtime;
    }

    public void setRuntime(Float runtime) {
        this.runtime = runtime;
    }

    public Date getDatetime() {
        return datetime;
    }

    public void setDatetime(Date datetime) {
        this.datetime = datetime;
    }
}