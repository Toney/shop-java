package com.shop.mapper;

import com.shop.model.ShopAdmin;

public interface AdminMapper extends BaseMapper<ShopAdmin>{
	ShopAdmin findByName(String adminName);
}
