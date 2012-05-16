package com.shop.action;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.model.ShopOrder;
import com.shop.service.OrderService;
import com.shop.util.JsonDateValueProcessor;
@Controller
@RequestMapping(value="admin/order")
public class OrderController extends BaseController {
	private OrderService orderService;
	@Resource(name="orderService")
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	
	@RequestMapping(value="/getByCreateTime", method=RequestMethod.POST)
	@ResponseBody
	public String getByCreateTime(HttpServletResponse response){
		List<ShopOrder> list = this.orderService.getByCreateTime();
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.util.Date.class, new JsonDateValueProcessor("yyyy-MM-dd HH:mm:ss"));
		
		JSONArray jsonarray = JSONArray.fromObject(list,jsonConfig);
		return jsonarray.toString();
	}
	
}
