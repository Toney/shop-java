package com.shop.front;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.shop.service.ArticleService;
import com.shop.util.CacheManager;
import com.shop.util.Constant;
import com.shop.util.StringUtil;

@Controller
@RequestMapping(value="/welcome")
public class WelcomeController extends BaseController{
	
	ArticleService articleService;
	@Resource(name="articleService")
	public void setArticleService(ArticleService articleService) {
		this.articleService = articleService;
	}

	@RequestMapping(value="/index", method=RequestMethod.GET)
	public String index(HttpServletRequest request,ModelMap modelMap){
		CacheManager.cachekey = StringUtil.getMD5("welcome/index".getBytes());

		Object toparticles = CacheManager.getKeyCache("toparticles",1000);
		if(toparticles == null){
			toparticles = this.articleService.load(5);
			CacheManager.putKeyCache("toparticles", toparticles);
		}
		modelMap.addAttribute("toparticles",toparticles);
		
		HashMap<String, String> hashconfig  = (HashMap<String, String>)CacheManager.getFromCache(Constant.SYSTEM_CONFIG);
		modelMap.addAttribute("webtitle",hashconfig.get("name"));
		
		return this.getPage("index",hashconfig.get("theme"));
	}
	
}
