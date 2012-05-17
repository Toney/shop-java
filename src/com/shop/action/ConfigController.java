package com.shop.action;

import java.io.File;

import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
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
import com.shop.util.FileUtil;
import com.shop.util.JsonUtil;
import com.shop.util.StringUtil;
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
	 * 设置幻灯片列表
	 */ 
	@RequestMapping(value = "/config_indexSlide", method = RequestMethod.POST)
	@ResponseBody
	public String config_indexSlide(@RequestParam("imgFile") CommonsMultipartFile imgFile,@RequestParam("title") String title,@RequestParam("url") String url,@RequestParam("action") String action,@RequestParam("savepath") String savepath,@RequestParam("rowindex") int rowindex){
		HashMap<String, String> hashconfig = (HashMap<String, String>)CacheManager.getFromCache(Constant.SYSTEM_CONFIG);
		List<IndexSlide> slides = JsonUtil.getList4Json(hashconfig.get("index_slide"), IndexSlide.class);
		
		Message message = new Message();
		if(action.equals("add")){
			savepath = savepath +"image/"+StringUtil.getTimeMD5()+FileUtil.getSuffix(imgFile.getOriginalFilename());
			String image = FileUtil.saveFile(imgFile, savepath, this.servletContext);
			
			IndexSlide slide = new IndexSlide();
			slide.setImage(image);
			slide.setTitle(title);
			slide.setUrl(url);
			
			slides.add(slide);
			
			
			this.configService.updateConfig("index_slide", JsonUtil.getJsonString4JavaArray(slides));
			CacheManager.removeCache(Constant.SYSTEM_CONFIG);
			
		}else if(action.equals("update")){
			
			if(!imgFile.isEmpty()){
				savepath = savepath +"image/"+StringUtil.getTimeMD5()+FileUtil.getSuffix(imgFile.getOriginalFilename());
				String image = FileUtil.saveFile(imgFile, savepath, this.servletContext);
				slides.get(rowindex).setImage(image);
			}
			
			slides.get(rowindex).setTitle(title);
			slides.get(rowindex).setUrl(url);
			
			this.configService.updateConfig("index_slide", JsonUtil.getJsonString4JavaArray(slides));
			CacheManager.removeCache(Constant.SYSTEM_CONFIG);
			
		}
		message.setMessage("基本配置修改成功！");
		message.setType("true");
		return JSONObject.fromObject(message).toString();
	}
	
	@RequestMapping(value = "/config_indexSlide_list", method = RequestMethod.POST)
	@ResponseBody
	public String config_indexSlide_list(){
		HashMap<String, String> hashconfig = (HashMap<String, String>)CacheManager.getFromCache(Constant.SYSTEM_CONFIG);
		List<IndexSlide> slides = JsonUtil.getList4Json(hashconfig.get("index_slide"), IndexSlide.class);
		
		return JSONArray.fromObject(slides).toString();
	}
	
	@RequestMapping(value = "/config_indexSlide_delete", method = RequestMethod.POST)
	@ResponseBody
	public String config_indexSlide_delete(@RequestParam("rowindex") int rowindex){
		HashMap<String, String> hashconfig = (HashMap<String, String>)CacheManager.getFromCache(Constant.SYSTEM_CONFIG);
		List<IndexSlide> slides = JsonUtil.getList4Json(hashconfig.get("index_slide"), IndexSlide.class);
		
		List<IndexSlide> newslides = new ArrayList<IndexSlide>();
		int i=0;
		for(IndexSlide s:slides){
			if(i!=rowindex){
				newslides.add(s);
			}
			i++;
		}
		this.configService.updateConfig("index_slide", JsonUtil.getJsonString4JavaArray(newslides));
		CacheManager.removeCache(Constant.SYSTEM_CONFIG);
		
		Message message = new Message();
		message.setMessage("幻灯片删除成功！");
		message.setType("true");
		return JSONObject.fromObject(message).toString();
	}
	
	@RequestMapping(value = "/config_indexSlide_Sort", method = RequestMethod.POST)
	@ResponseBody
	public String config_indexSlide_Sort(@RequestParam("action") String action,@RequestParam("rowindex") int rowindex){
		HashMap<String, String> hashconfig = (HashMap<String, String>)CacheManager.getFromCache(Constant.SYSTEM_CONFIG);
		List<IndexSlide> slides = JsonUtil.getList4Json(hashconfig.get("index_slide"), IndexSlide.class);
		List<IndexSlide> newslides = new ArrayList<IndexSlide>();
		
		
		IndexSlide temp = slides.get(rowindex);
		
		if(action.equals("up")){
			IndexSlide top = slides.get(rowindex-1);
			for(int i=0;i<slides.size();i++){
				if(i==rowindex){
					newslides.add(top);
				}else if(i==rowindex-1){
					newslides.add(temp);
				}else{
					newslides.add(slides.get(i));
				}
			}
			
		}else{
			//down
			IndexSlide btn = slides.get(rowindex+1);
			
			for(int i=0;i<slides.size();i++){
				if(i==rowindex){
					newslides.add(btn);
				}else if(i==rowindex+1){
					newslides.add(temp);
				}else{
					newslides.add(slides.get(i));
				}
			}
		}
		
		this.configService.updateConfig("index_slide", JsonUtil.getJsonString4JavaArray(newslides));
		CacheManager.removeCache(Constant.SYSTEM_CONFIG);
		
		Message message = new Message();
		message.setMessage("排序修改成功！");
		message.setType("true");
		return JSONObject.fromObject(message).toString();
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
		CacheManager.removeCache(Constant.SYSTEM_CONFIG);
		
		Message message = new Message();
		message.setMessage("底部信息修改成功！");
		message.setType("true");
		
		return JSONObject.fromObject(message).toString();
	}
	
	//购物设置
	@RequestMapping(value = "/config_shopcfg", method = RequestMethod.POST)
	@ResponseBody
	public String config_shopcfg(@RequestParam("tax") String tax,@RequestParam("stockup_time") String stockup_time,@RequestParam("regiment_time_limit") String regiment_time_limit){
		
		this.configService.updateConfig("tax", tax);
		this.configService.updateConfig("stockup_time", stockup_time);
		this.configService.updateConfig("regiment_time_limit", regiment_time_limit);
		CacheManager.removeCache(Constant.SYSTEM_CONFIG);
		
		Message message = new Message();
		message.setMessage("购物设置修改成功！");
		message.setType("true");
		
		return JSONObject.fromObject(message).toString();
	}
	
	

}
