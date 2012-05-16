package com.shop.action;


import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.shop.model.ShopAdmin;
import com.shop.service.AdminService;
import com.shop.util.CacheManager;
import com.shop.util.Constant;
import com.shop.util.StringUtil;

@Controller
@RequestMapping(value="admin/webmaster")
public class WebmasterController extends BaseController{

	private AdminService adminService;
	@Resource(name="adminService")
	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}
	

	@RequestMapping(value="/index", method=RequestMethod.GET)
	public String index(HttpSession session,ModelMap modelMap) {
		if(session.getAttribute(Constant.ADMIN_USER)!=null){
			return "redirect:/admin/webmaster/console";
		}
		HashMap<String, String> hashconfig = (HashMap<String, String>)CacheManager.getFromCache(Constant.SYSTEM_CONFIG);
		modelMap.addAttribute("webtitle",hashconfig.get("name"));
		return "admin/index";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(@RequestParam("user_name")String user_name,@RequestParam("password")String password,String verify, ModelMap modelMap,HttpSession session){
		String kaptchaExpected = (String)session.getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
		if (kaptchaExpected == null || !kaptchaExpected.equalsIgnoreCase(verify))
		{
			modelMap.addAttribute("message","验证码错误！");
		    return "admin/index";
		}
		ShopAdmin exist = this.adminService.findByName(user_name);
		if(exist!=null){
			if(exist.getPassword().equalsIgnoreCase(StringUtil.getMD5(password.getBytes()))){
				ShopAdmin a = new ShopAdmin();
				a.setId(exist.getId());
				a.setAdminName(exist.getAdminName());
				a.setRoleId(exist.getRoleId());
				a.setLastIp(exist.getLastIp());
				a.setLastTime(exist.getLastTime());
				session.setAttribute(Constant.ADMIN_USER, a);
				return "redirect:/admin/webmaster/console";
			}
			modelMap.addAttribute("message","用户密码错误！");
			return "admin/index";
		}
		modelMap.addAttribute("message","用户名不存在！");
		return "admin/index";
	}
	
	@RequestMapping(value="/loginout", method=RequestMethod.GET)
	public String loginout(HttpSession session){
		session.removeAttribute(Constant.ADMIN_USER);
		return "redirect:/admin/webmaster/index";
	}
	
	@RequestMapping(value="/console")
	public String console(HttpSession session,ModelMap modelMap){
		HashMap<String, String> hashconfig = (HashMap<String, String>)CacheManager.getFromCache(Constant.SYSTEM_CONFIG);
		modelMap.addAttribute("webtitle",hashconfig.get("name"));
		return "admin/console";
	}
	
	@RequestMapping(value="/menu")
	public String menu(@RequestParam("item") String item,ModelMap modelMap){
		if(item == null){
			item = "myhomepage";
		}
		return "admin/"+item;
	}
	
}
