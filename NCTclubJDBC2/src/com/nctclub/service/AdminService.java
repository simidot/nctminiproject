package com.nctclub.service;

import java.util.List;

import com.nctclub.model.UserDTO;

public interface AdminService {
	
	List<UserDTO> selectAllUsers();
	
	public void deleteUser(String userId);
	
}
