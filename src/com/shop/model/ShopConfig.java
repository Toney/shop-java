package com.shop.model;

public class ShopConfig implements java.io.Serializable{

	private static final long serialVersionUID = -3927460586851310169L;

	private Integer id;

    private String syskey;

    private String sysvalue;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

	public String getSyskey() {
		return syskey;
	}

	public void setSyskey(String syskey) {
		this.syskey = syskey;
	}

	public String getSysvalue() {
		return sysvalue;
	}

	public void setSysvalue(String sysvalue) {
		this.sysvalue = sysvalue;
	}

}