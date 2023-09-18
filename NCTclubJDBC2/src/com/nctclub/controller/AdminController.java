package com.nctclub.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nctclub.model.UserDTO;
import com.nctclub.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	@RequestMapping(value = "/userlist", method = RequestMethod.GET)
	public String selectall(Model model) {
		List<UserDTO> members = adminService.selectAllUsers();

		model.addAttribute("memberList", members);
		
		return "userListForm";
		
		
	}
	
	

}
