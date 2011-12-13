package com.shop.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.shop.bean.ShopArea;
import com.shop.mapper.ShopAreaMapper;
import com.shop.service.ShopAreaService;
@Service("shopAreaService")
public class ShopAreaServiceImpl implements ShopAreaService {
	
	private ShopAreaMapper shopAreaMapper;
	@Resource(name="shopAreaMapper")
	public void setShopAreaMapper(ShopAreaMapper shopAreaMapper) {
		this.shopAreaMapper = shopAreaMapper;
	}

	public List<ShopArea> findByParentIdAndDeep(Integer areaParentId_id,
			Integer areaDeep) {
		
		return this.shopAreaMapper.findByParentIdAndDeep(areaParentId_id, areaDeep);
	}

}
