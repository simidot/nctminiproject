package com.nctclub.mapper;

import java.util.List;

import com.nctclub.model.NCTmemberDTO;
import com.nctclub.model.UserDTO;

public interface AdminMapper {
	
	
	// 전체 회원 선택
	public List<UserDTO> selectAllusers(); 
			
	// 회원 삭제
	public int deleteUser(String userId);
	
	// 엔시티 멤버 추가
	public int insertMember(NCTmemberDTO dto);

}
