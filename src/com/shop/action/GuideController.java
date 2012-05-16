package com.shop.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.bean.Message;
import com.shop.model.ShopGuide;
import com.shop.service.GuideService;

@Controller
@RequestMapping(value = "admin/guide")
public class GuideController extends BaseController {
	private GuideService guideService;

	@Resource(name = "guideService")
	public void setGuideService(GuideService guideService) {
		this.guideService = guideService;
	}

	@RequestMapping(value = "/loadAll", method = RequestMethod.POST)
	@ResponseBody
	public String loadAll(HttpServletResponse response) {
		// 获取导航的数据
		List<ShopGuide> guidelist = this.guideService.loadAll();
		JSONArray jsonarray = JSONArray.fromObject(guidelist);
		return jsonarray.toString();
	}

	@RequestMapping(value = "/updateOrder", method = RequestMethod.POST)
	@ResponseBody
	public String updateOrder(int order, int neworder,
			HttpServletResponse response) {
		this.guideService.updateOrder(-1, neworder);
		this.guideService.updateOrder(neworder, order);
		this.guideService.updateOrder(order, -1);
		
		Message message = new Message();
		message.setMessage("排序修改成功！");
		message.setType("true");
		
		JSONObject jsonobj = JSONObject.fromObject(message);
		return jsonobj.toString();
	}
	
	@RequestMapping(value = "/deleteGuide", method = RequestMethod.POST)
	@ResponseBody
	public String deleteGuide(int order,HttpServletResponse response){
		int affectrow = this.guideService.deleteGuide(order);
		Message message = new Message();
		if(affectrow == 1){
			message.setMessage("删除成功！");
			message.setType("true");	
		}else{
			message.setMessage("删除失败！");
			message.setType("false");	
		}
		
		JSONObject jsonobj = JSONObject.fromObject(message);
		return jsonobj.toString();
	}
	
	@RequestMapping(value = "/config_guide", method = RequestMethod.GET)
	public String config_guide(@RequestParam("action") String action,@RequestParam("order") int order,ModelMap model){
		model.addAttribute("action",action);
		model.addAttribute("order",order == -1?"":order);
		
		if(order!=-1){
			ShopGuide guide = this.guideService.getByOrder(order);
			model.addAttribute("guide",guide);
		}
		
		return "admin/config/guide";
	}
	
	
	@RequestMapping(value = "/config_guide_do", method = RequestMethod.POST)
	@ResponseBody
	public String config_guide_do(ShopGuide guide,String action,HttpServletResponse response){
		int affectrow = 0;
		if(action.equals("add")){
			affectrow = this.guideService.insert(guide);
		}else{
			//修改
			affectrow = this.guideService.updateGuide(guide);
		}
		Message message = new Message();
		if(affectrow == 1){
			message.setMessage("编辑成功！");
			message.setType("true");	
		}else{
			message.setMessage("编辑失败！");
			message.setType("false");
		}
		JSONObject jsonobj = JSONObject.fromObject(message);
		return jsonobj.toString();
	}
	
	
}
