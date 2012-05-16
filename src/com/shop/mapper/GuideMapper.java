package com.shop.mapper;

import org.apache.ibatis.annotations.Param;

import com.shop.model.ShopGuide;

public interface GuideMapper extends BaseMapper<ShopGuide>{
	int updateOrder(@Param("new_order") int new_order,@Param("order") int order);
	ShopGuide getByOrder(@Param("order") int order);
	int deleteGuideByOrder(@Param("order") int order);
	int getMaxOrder();
}
