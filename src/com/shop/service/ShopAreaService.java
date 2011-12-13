package com.shop.service;

import java.util.List;

import com.shop.bean.ShopArea;

public interface ShopAreaService {
	List<ShopArea> findByParentIdAndDeep(Integer areaParentId_id,Integer areaDeep);
}
