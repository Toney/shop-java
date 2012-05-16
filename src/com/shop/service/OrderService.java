package com.shop.service;

import java.util.List;

import com.shop.model.ShopOrder;

public interface OrderService {
	List<ShopOrder> getByCreateTime();
}
