package com.shop.service;

import java.util.List;

import com.shop.model.ShopConfig;

public interface ConfigService {
	List<ShopConfig> getAll();
	int updateConfig(String key,String value);
}
