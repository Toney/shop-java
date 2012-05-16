package com.shop.model;

public class ShopFriend {
    private Integer friendId;

    private Integer memberId;

    private Integer friendMemberId;

    private String friendMemberName;

    private String friendAddTime;

    public Integer getFriendId() {
        return friendId;
    }

    public void setFriendId(Integer friendId) {
        this.friendId = friendId;
    }

    public Integer getMemberId() {
        return memberId;
    }

    public void setMemberId(Integer memberId) {
        this.memberId = memberId;
    }

    public Integer getFriendMemberId() {
        return friendMemberId;
    }

    public void setFriendMemberId(Integer friendMemberId) {
        this.friendMemberId = friendMemberId;
    }

    public String getFriendMemberName() {
        return friendMemberName;
    }

    public void setFriendMemberName(String friendMemberName) {
        this.friendMemberName = friendMemberName == null ? null : friendMemberName.trim();
    }

    public String getFriendAddTime() {
        return friendAddTime;
    }

    public void setFriendAddTime(String friendAddTime) {
        this.friendAddTime = friendAddTime == null ? null : friendAddTime.trim();
    }
}