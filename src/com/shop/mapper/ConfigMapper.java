package com.shop.mapper;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.shop.model.ShopConfig;

public interface ConfigMapper extends BaseMapper<ShopConfig>{
	List<ShopConfig> getAll();
	int updateConfig(@Param("key") String key,@Param("value") String value);
}
