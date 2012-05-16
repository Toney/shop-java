package com.shop.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.shop.mapper.OrderMapper;
import com.shop.model.ShopOrder;
import com.shop.service.OrderService;
@Service("orderService")
public class OrderServiceImpl implements OrderService {

	private OrderMapper orderMapper;
	@Resource(name="orderMapper")
	public void setOrderMapper(OrderMapper orderMapper) {
		this.orderMapper = orderMapper;
	}

	public List<ShopOrder> getByCreateTime() {
		List<ShopOrder> list = this.orderMapper.getByCreateTime(10);
		return list;
	}

}
