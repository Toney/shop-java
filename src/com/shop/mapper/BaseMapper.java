package com.shop.mapper;

import java.util.List;

public interface BaseMapper<T> { 
	List<T> loadAll();
	int insert(T record);
	int update(T record);
}
