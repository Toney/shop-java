package com.shop.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shop.bean.ShopArea;
import com.shop.service.ShopAreaService;


@Controller
@RequestMapping(value="/shoparea")
public class ShopAreaController extends BaseController{
	
	private ShopAreaService shopAreaService;
	@Resource(name="shopAreaService")
	public void setShopAreaService(ShopAreaService shopAreaService) {
		this.shopAreaService = shopAreaService;
	}

	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String list(ModelMap model) {
		
		List<ShopArea> shopAreaList = this.shopAreaService.findByParentIdAndDeep(0, 1);
		model.addAttribute("shopAreaList",shopAreaList);
		
		return "admin/shoparea";
	}
}
