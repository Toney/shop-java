package com.shop.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.shop.mapper.AdminMapper;
import com.shop.model.ShopAdmin;
import com.shop.service.AdminService;
@Service("adminService")
public class AdminServiceImpl implements AdminService {

	public AdminMapper adminMapper;
	@Resource(name="adminMapper")
	public void setAdminMapper(AdminMapper adminMapper) {
		this.adminMapper = adminMapper;
	}

	public ShopAdmin findByName(String adminName){
		return this.adminMapper.findByName(adminName);
	}

}
