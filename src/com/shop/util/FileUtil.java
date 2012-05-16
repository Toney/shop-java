package com.shop.util;

import java.util.Date;

public class FileUtil {
	public static String getRandFileName(){
		Long randTime = new Date().getTime();
		return StringUtil.getMD5(randTime.toString().getBytes());
	}
	
	public static String getSuffix(String filename){
		return filename.substring(filename.lastIndexOf(".")).toLowerCase();
	}
	
	
}
