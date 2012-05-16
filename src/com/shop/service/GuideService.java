package com.shop.service;
import java.util.*;

import com.shop.model.ShopGuide;

public interface GuideService {
	List<ShopGuide> loadAll();
	int updateOrder(int new_order,int order);
	ShopGuide getByOrder(int order);
	int deleteGuide(int order);
	int insert(ShopGuide guide);
	int updateGuide(ShopGuide guide);
}
