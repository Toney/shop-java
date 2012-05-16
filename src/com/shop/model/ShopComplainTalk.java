package com.shop.model;

public class ShopComplainTalk {
    private Integer talkId;

    private Integer complainId;

    private Integer talkMemberId;

    private String talkMemberName;

    private String talkMemberType;

    private String talkContent;

    private Byte talkState;

    private Integer talkAdmin;

    private Integer talkDatetime;

    public Integer getTalkId() {
        return talkId;
    }

    public void setTalkId(Integer talkId) {
        this.talkId = talkId;
    }

    public Integer getComplainId() {
        return complainId;
    }

    public void setComplainId(Integer complainId) {
        this.complainId = complainId;
    }

    public Integer getTalkMemberId() {
        return talkMemberId;
    }

    public void setTalkMemberId(Integer talkMemberId) {
        this.talkMemberId = talkMemberId;
    }

    public String getTalkMemberName() {
        return talkMemberName;
    }

    public void setTalkMemberName(String talkMemberName) {
        this.talkMemberName = talkMemberName == null ? null : talkMemberName.trim();
    }

    public String getTalkMemberType() {
        return talkMemberType;
    }

    public void setTalkMemberType(String talkMemberType) {
        this.talkMemberType = talkMemberType == null ? null : talkMemberType.trim();
    }

    public String getTalkContent() {
        return talkContent;
    }

    public void setTalkContent(String talkContent) {
        this.talkContent = talkContent == null ? null : talkContent.trim();
    }

    public Byte getTalkState() {
        return talkState;
    }

    public void setTalkState(Byte talkState) {
        this.talkState = talkState;
    }

    public Integer getTalkAdmin() {
        return talkAdmin;
    }

    public void setTalkAdmin(Integer talkAdmin) {
        this.talkAdmin = talkAdmin;
    }

    public Integer getTalkDatetime() {
        return talkDatetime;
    }

    public void setTalkDatetime(Integer talkDatetime) {
        this.talkDatetime = talkDatetime;
    }
}