package com.shop.model;

public class ShopPayment {
    private Integer id;

    private String name;

    private Boolean type;

    private Float poundage;

    private Boolean status;

    private String pluginId;

    private Integer order;

    private Boolean poundageType;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Boolean getType() {
        return type;
    }

    public void setType(Boolean type) {
        this.type = type;
    }

    public Float getPoundage() {
        return poundage;
    }

    public void setPoundage(Float poundage) {
        this.poundage = poundage;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public String getPluginId() {
        return pluginId;
    }

    public void setPluginId(String pluginId) {
        this.pluginId = pluginId == null ? null : pluginId.trim();
    }

    public Integer getOrder() {
        return order;
    }

    public void setOrder(Integer order) {
        this.order = order;
    }

    public Boolean getPoundageType() {
        return poundageType;
    }

    public void setPoundageType(Boolean poundageType) {
        this.poundageType = poundageType;
    }
}