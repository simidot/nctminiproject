package com.nctclub.mapper;

import java.util.List;

import com.nctclub.model.UserDTO;

public interface AdminMapper {
	
	
	// 전체 회원 선택
	public List<UserDTO> selectAllusers(); 
			
	// 회원 삭제
	public void deleteUser(String userId);

}
