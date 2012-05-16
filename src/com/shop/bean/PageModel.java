package com.shop.bean;

public class PageModel {
	private int pagenow;
	private int pagesize;
	private int pagecount;
	private int start;
	
	public int getPagenow() {
		return pagenow;
	}
	public void setPagenow(int pagenow) {
		this.pagenow = pagenow;
	}
	public int getPagesize() {
		return pagesize;
	}
	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}
	public int getPagecount() {
		return pagecount;
	}
	public void setPagecount(int pagecount) {
		this.pagecount = pagecount;
	}
	public int getStart() {
		return (this.pagenow-1)*this.pagesize;
	}
	public void setStart(int start) {
		this.start = start;
	}
	
}
