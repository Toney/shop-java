package com.shop.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

public class BaseController {
	
	public String getTitle(String name,String title){
		if(title!=null){
			return name+"-"+title;
		}else{
			return name;
		}
	}
	
	public void renderText(HttpServletResponse response, String result) throws IOException {
		PrintWriter out = response.getWriter();
		response.setHeader("Cache-Control", "no-store"); 
		response.setHeader("Pragma", "no-cache"); 
		response.setDateHeader("Expires", 0); 
		out.print(result);
		out.flush();
		out.close();
	}
}
