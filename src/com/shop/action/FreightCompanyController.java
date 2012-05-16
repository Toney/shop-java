package com.shop.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "admin/freightcompany")
public class FreightCompanyController extends BaseController {
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(){
		
		return "admin/freightcompany";
	}
}
