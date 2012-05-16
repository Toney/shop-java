package com.shop.action.tool;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shop.service.ConfigService;
import com.shop.util.CacheManager;
import com.shop.util.Constant;
import com.shop.util.cache.CacheStore;

@Controller
@RequestMapping(value="cache/")
public class CacheController {
	
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
	

}
