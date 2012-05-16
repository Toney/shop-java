package com.shop.util.cache;

import java.util.HashMap;
import java.util.List;


import com.shop.model.ShopConfig;
import com.shop.service.ConfigService;

public class CacheStore {
	
	public HashMap<String, String> getSystemConfig(ConfigService configService){
		List<ShopConfig> shopConfig = configService.getAll();
		HashMap<String, String> hashconfig = new HashMap<String, String>();
		if(shopConfig.size()>=1){
			for(int i=0;i<shopConfig.size();i++){
				hashconfig.put(shopConfig.get(i).getSyskey(), shopConfig.get(i).getSysvalue());
			}
		}
		return hashconfig;
	}

}
