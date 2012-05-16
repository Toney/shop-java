package com.shop.model;

public class ShopSession {
    private String sessionId;

    private Integer updateTime;

    private Integer lastTime;

    private Byte ip1;

    private Byte ip2;

    private Byte ip3;

    private Byte ip4;

    public String getSessionId() {
        return sessionId;
    }

    public void setSessionId(String sessionId) {
        this.sessionId = sessionId == null ? null : sessionId.trim();
    }

    public Integer getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Integer updateTime) {
        this.updateTime = updateTime;
    }

    public Integer getLastTime() {
        return lastTime;
    }

    public void setLastTime(Integer lastTime) {
        this.lastTime = lastTime;
    }

    public Byte getIp1() {
        return ip1;
    }

    public void setIp1(Byte ip1) {
        this.ip1 = ip1;
    }

    public Byte getIp2() {
        return ip2;
    }

    public void setIp2(Byte ip2) {
        this.ip2 = ip2;
    }

    public Byte getIp3() {
        return ip3;
    }

    public void setIp3(Byte ip3) {
        this.ip3 = ip3;
    }

    public Byte getIp4() {
        return ip4;
    }

    public void setIp4(Byte ip4) {
        this.ip4 = ip4;
    }
}