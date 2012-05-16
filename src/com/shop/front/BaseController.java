package com.shop.front;

public class BaseController {
	
	// 根据主题后返回对应页面的String
	public String getPage(String page,String theme) {
		return "front/"+theme+"/" + page;
	}
	
	public String getTitle(String name,String title){
		if(title!=null){
			return name+"-"+title;
		}else{
			return name;
		}
	}
}
