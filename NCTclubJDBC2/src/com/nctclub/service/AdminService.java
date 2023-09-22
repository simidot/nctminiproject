package com.nctclub.service;

import java.io.File;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.nctclub.model.NCTmemberDTO;
import com.nctclub.model.UserDTO;

public interface AdminService {
	
	List<UserDTO> selectAllUsers();
	
	public int deleteUser(String userId);
	
    public void addMemberWithGroups(NCTmemberDTO dto); 
	
	public File uploadFile(MultipartFile file, String uploadPath) throws Exception;

	/*
	 * public List<NCTmemberDTO> selectAllMembers();
	 */	
	public NCTmemberDTO selectMember(int memberId);
	
	/*
	 * public int updateMember(NCTmemberDTO dto); public int
	 * updateGroup(NCTmemberDTO dto);
	 */
	
    public void updateMemberWithGroups(NCTmemberDTO dto);
    
	public int deleteMember(int memberId);




}
