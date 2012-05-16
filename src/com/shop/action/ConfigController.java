package com.shop.action;

import java.io.File;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.shop.bean.IndexSlide;
import com.shop.bean.Message;
import com.shop.service.ConfigService;
import com.shop.util.CacheManager;
import com.shop.util.Constant;
import com.shop.util.JsonUtil;
import com.shop.util.cache.CacheStore;

import java.util.*;

@Controller
@RequestMapping(value = "admin/config")
public class ConfigController extends BaseController implements
		ServletContextAware {

	private ServletContext servletContext;
	public void setServletContext(ServletContext servletContext) { // 实现接口中的setServletContext方法
		this.servletContext = servletContext;
	}
	
	private ConfigService configService;
	@Resource(name="configService")
	public void setConfigService(ConfigService configService) {
		this.configService = configService;
	}


	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(ModelMap model) {
		return "admin/config";
	}

	/**
	 * @param name
	 * @param url
	 * @param master
	 * @param qq
	 * @param email
	 * @param mobile
	 * @param phone
	 * @param address
	 * @param goods_no_pre
	 * @param index_seo_title
	 * @param index_seo_keywords
	 * @param index_seo_description
	 * @param logo
	 * @param response
	 */
	@RequestMapping(value = "/config_basic_do", method = RequestMethod.POST)
	@ResponseBody
	public String config_basic_do(@RequestParam("name") String name,@RequestParam("url") String url,@RequestParam("master") String master,
			@RequestParam("qq") String qq,@RequestParam("email") String email,@RequestParam("mobile") String mobile,@RequestParam("phone") String phone,
			@RequestParam("address") String address,@RequestParam("goods_no_pre") String goods_no_pre,@RequestParam("index_seo_title") String index_seo_title,
			@RequestParam("index_seo_keywords") String index_seo_keywords,@RequestParam("index_seo_description") String index_seo_description,
			@RequestParam("logo") CommonsMultipartFile logo,HttpServletResponse response
			) {

		HashMap<String, String> hashconfig = (HashMap<String, String>)CacheManager.getFromCache(Constant.SYSTEM_CONFIG);
		
		if (!logo.isEmpty()) {
			//修改LOGO
			String theme = hashconfig.get("theme");
			String path = this.servletContext.getRealPath("/resource/front/"+theme+"/images/logo.gif"); // 获取本地存储路径
			File file = new File(path); // 新建一个文件
			try {
				logo.getFileItem().write(file); // 将上传的文件写入新建的文件中
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if(name!=null){
			this.configService.updateConfig("name", name);
		}
		
		if(url!=null){
			this.configService.updateConfig("url", url);
		}
		
		if(master!=null){
			this.configService.updateConfig("master", master);
		}
		
		if(qq!=null){
			this.configService.updateConfig("qq", qq);
		}
		
		if(email!=null){
			this.configService.updateConfig("email", email);
		}
		
		if(mobile!=null){
			this.configService.updateConfig("mobile", mobile);
		}
		
		if(phone!=null){
			this.configService.updateConfig("phone", phone);
		}
		
		if(address!=null){
			this.configService.updateConfig("address", address);
		}
		
		if(goods_no_pre!=null){
			this.configService.updateConfig("goods_no_pre", goods_no_pre);
		}
		
		if(index_seo_title!=null){
			this.configService.updateConfig("index_seo_title", index_seo_title);
		}
		
		if(index_seo_keywords!=null){
			this.configService.updateConfig("index_seo_keywords", index_seo_keywords);
		}
		
		if(index_seo_description!=null){
			this.configService.updateConfig("index_seo_description", index_seo_description);
		}
		
		Message message = new Message();
		message.setMessage("基本配置修改成功！");
		message.setType("true");
		
		CacheManager.resetKey(Constant.SYSTEM_CONFIG,new CacheStore().getSystemConfig(configService));
		JSONObject jsonobj = JSONObject.fromObject(message);
		
		return jsonobj.toString();
		
	}
	
	/**
	 * 查询幻灯片列表
	 */ 
	@RequestMapping(value = "/config_indexSlide", method = RequestMethod.POST)
	public String config_indexSlide(CommonsMultipartFile imgFile,String title,String url,String order,String action,String savepath){
		HashMap<String, String> hashconfig = (HashMap<String, String>)CacheManager.getFromCache(Constant.SYSTEM_CONFIG);
		List<IndexSlide> slides = JsonUtil.getList4Json(hashconfig.get("indexSlide"), IndexSlide.class);
		
		Message message = new Message();
		if(action.equals("add")){
			
		}else if(action.equals("update")){
			
		}else if(action.equals("delete")){
			
		}
		
		return "";
	}
	
	
	/**
	 * 配置网站底部信息 
	 * @return string
	 */
	@RequestMapping(value = "/config_footer", method = RequestMethod.GET)
	public String config_footer(){
		return "admin/config/footer";
	}

	@RequestMapping(value = "/config_footer_do", method = RequestMethod.GET)
	@ResponseBody
	public String config_footer_do(@RequestParam("site_footer_code") String site_footer_code){
		this.configService.updateConfig("site_footer_code", site_footer_code);
		Message message = new Message();
		message.setMessage("底部信息修改成功！");
		message.setType("true");
		
		CacheManager.removeCache(Constant.SYSTEM_CONFIG);
		
		return JSONObject.fromObject(message).toString();
	}
	
	
	

}
