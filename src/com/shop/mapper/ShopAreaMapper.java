package com.shop.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.shop.exception.ApplyException;
import com.shop.bean.ShopArea;

public interface ShopAreaMapper {
	int insert(ShopArea area) throws ApplyException;
	List<ShopArea> findByParentIdAndDeep(@Param("areaParentId_id") Integer areaParentId_id,@Param("areaDeep") Integer areaDeep );
}