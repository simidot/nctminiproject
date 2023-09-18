package com.nctclub.service;

import java.util.List;

import com.nctclub.model.MemberDTO;
import com.nctclub.model.UserDTO;

public interface AdminService {
	
	List<UserDTO> selectAllUsers();
	
	public int deleteUser(String userId);
	
	public int memberRegister(MemberDTO dto);

	
	
}
