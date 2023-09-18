package com.nctclub.service;

import javax.servlet.http.HttpServletRequest;

import com.nctclub.model.UserDTO;

public interface UserService {
	
	int userRegister(UserDTO dto);
	
	UserDTO userLogin(UserDTO dto);
	
	public UserDTO idCheck(String userId);

}
