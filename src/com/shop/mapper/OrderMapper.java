package com.shop.mapper;

import java.util.List;

import com.shop.model.ShopOrder;
import org.apache.ibatis.annotations.Param;
public interface OrderMapper extends BaseMapper<ShopOrder>{
	List<ShopOrder> getByCreateTime(@Param("size") int size);
}
