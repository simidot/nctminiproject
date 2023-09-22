package com.nctclub.mapper;

import java.sql.SQLException;
import java.util.List;

import com.nctclub.model.NCTmemberDTO;
import com.nctclub.model.UserDTO;

public interface UserMapper {
	
	// 회원 등록
	public int insert(UserDTO dto) ;
	
	// 회원 로그인
	UserDTO userLogin(UserDTO dto); 
	
	//아이디 체크
	public UserDTO idCheck(String userId);
	
	// 엔시티 멤버 전체선택하기
	public List<NCTmemberDTO> selectAllMembers();
	
	// 엔시티 멤버 한 명 선택하기
	public NCTmemberDTO selectMember(int memberId);


}
