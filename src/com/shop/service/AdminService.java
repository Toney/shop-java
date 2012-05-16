package com.shop.service;

import com.shop.model.ShopAdmin;

public interface AdminService {
	ShopAdmin findByName(String adminName);
}
