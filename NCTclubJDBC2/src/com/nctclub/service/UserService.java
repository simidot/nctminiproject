package com.nctclub.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.userdetails.UserDetails;

import com.nctclub.model.UserDTO;

public interface UserService {
	
	int userRegister(UserDTO dto);
	
	UserDetails userLogin(UserDTO dto);
	
	public UserDTO idCheck(String userId);
	
	public UserDTO getUserByUserId(String userId);

}
