package com.nctclub.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.userdetails.UserDetails;

import com.nctclub.model.NCTmemberDTO;
import com.nctclub.model.UserDTO;

public interface UserService {
	
	// 유저 회원가입하기
	int userRegister(UserDTO dto);
	
	// 유저 로그인하기
	UserDetails userLogin(UserDTO dto);
	
	// 회원가입 시에 아이디체크
	public UserDTO idCheck(String userId);
	
	public UserDTO getUserByUserId(String userId);
	
	// 엔시티 전체 멤버 보기
	public List<NCTmemberDTO> selectAllMembers();
	
	// 엔시티 한 명 멤버 보기
	public NCTmemberDTO selectMember(int memberId);



}
