package com.shop.action.tool;

import java.io.File;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ServletContextAware;

import com.shop.bean.Message;
import com.shop.service.ConfigService;
import com.shop.util.CacheManager;
import com.shop.util.Configuration;
import com.shop.util.Constant;
import com.shop.util.cache.CacheStore;

@Controller
@RequestMapping(value="admin/cache")
public class CacheController implements ServletContextAware {
	
	private ServletContext servletContext;
	public void setServletContext(ServletContext servletContext) { // 实现接口中的setServletContext方法
		this.servletContext = servletContext;
	}
	
	public ConfigService configService;
	@Resource(name="configService")
	public void setConfigService(ConfigService configService) {
		this.configService = configService;
	}
	
	/**
	 * 重置全局缓存
	 */
	@RequestMapping(value="/index", method=RequestMethod.GET)
	public void resetGlobalCache(){
		CacheManager.resetKey(Constant.SYSTEM_CONFIG,new CacheStore().getSystemConfig(configService));
	}
	
	@RequestMapping(value="/clearCacheFile", method=RequestMethod.GET)
	@ResponseBody
	public String clearCacheFile(){
		
		
		Configuration os_cfg = new Configuration(this.servletContext.getRealPath("/WEB-INF/classes/oscache.properties"));
		File f = new File(os_cfg.getValue("cache.path"));
		
		Message message = new Message();
		message.setMessage("缓存文件删除成功！");
		message.setType("true");

		return JSONObject.fromObject(message).toString();
	}
	
}
