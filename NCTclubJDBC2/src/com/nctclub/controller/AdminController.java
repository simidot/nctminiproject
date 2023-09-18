package com.nctclub.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@RequestMapping(value = "/deleteUser", method = RequestMethod.GET)
	@ResponseBody
	public String deleteUser(@RequestParam("userId") String userId) {
		System.out.println(userId);
		int result = adminService.deleteUser(userId);
		if (result ==1) {
			return "yes";
		} else {
			return "no";
		}
	}
	
	

}
