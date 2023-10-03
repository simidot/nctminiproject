package com.nctclub.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.nctclub.model.NCTmemberDTO;
import com.nctclub.model.UserDTO;

public interface AdminService {
	
	// 모든 회원 가져오기
	List<UserDTO> selectAllUsers(HashMap<String, Integer> map);
	
	// 모든 회원 수 가져오기
	int getUserCount();
	
	public int deleteUser(String userId);
	
    public void addMemberWithGroups(NCTmemberDTO dto); 
	
	public File uploadFile(MultipartFile file, String uploadPath) throws Exception;

	public NCTmemberDTO selectMember(int memberId);
	
	
    public void updateMemberWithGroups(NCTmemberDTO dto);
    
	public int deleteMember(int memberId);

	public ArrayList<String> getAllGroups();
	
	
	// 회원가입 시에 아이디체크
	public NCTmemberDTO nameCheck(String name);
		
	/*
	 * public UserDTO getUserByUserId(String userId);
	 */	




}
