package com.shop.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.shop.mapper.GuideMapper;
import com.shop.model.ShopGuide;
import com.shop.service.GuideService;
@Service("guideService")
public class GuideServiceImpl implements GuideService {

	private GuideMapper guideMapper;
	@Resource(name="guideMapper")
	public void setGuideMapper(GuideMapper guideMapper) {
		this.guideMapper = guideMapper;
	}

	public List<ShopGuide> loadAll() {
		return this.guideMapper.loadAll();
	}

	public int updateOrder(int new_order, int order) {
		return this.guideMapper.updateOrder(new_order, order);
	}


	public ShopGuide getByOrder(int order) {
		return this.guideMapper.getByOrder(order);
	}

	public int deleteGuide(int order) {
		int affectrow = this.guideMapper.deleteGuideByOrder(order);
		List<ShopGuide> guides = this.guideMapper.loadAll();
		int i = 0;
		for (ShopGuide guide :guides){
			this.guideMapper.updateOrder(i, guide.getOrder());
			i++;
		}
		return affectrow;
	}


	public int insert(ShopGuide guide) {
		int max = this.guideMapper.getMaxOrder();
		guide.setOrder(max+1);
		int affectrow = this.guideMapper.insert(guide);
		return affectrow;
	}

	public int updateGuide(ShopGuide guide) {
		int affectrow = this.guideMapper.update(guide);
		return affectrow;
	}



}
