package com.shop.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/webmaster")
public class WebmasterController extends BaseController{

	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login() {
		return "admin/login";
	}
}
