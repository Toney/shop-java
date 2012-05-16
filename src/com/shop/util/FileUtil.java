package com.shop.util;

import java.io.File;
import java.util.Date;

import javax.servlet.ServletContext;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class FileUtil {
	public static String getRandFileName(){
		Long randTime = new Date().getTime();
		return StringUtil.getMD5(randTime.toString().getBytes());
	}
	
	public static String getSuffix(String filename){
		return filename.substring(filename.lastIndexOf(".")).toLowerCase();
	}
	
	public static String saveFile(CommonsMultipartFile file,String savepath,ServletContext servletContext){
		try {
			
			File f = new File(servletContext.getRealPath(savepath)); // 新建一个文件
			file.getFileItem().write(f); // 将上传的文件写入新建的文件中
		} catch (Exception e) {
			e.printStackTrace();
		}
		return savepath;
	}
	
}
