package com.nctclub.service;

import java.io.File;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.nctclub.model.NCTmemberDTO;
import com.nctclub.model.UserDTO;

public interface AdminService {
	
	List<UserDTO> selectAllUsers();
	
	public int deleteUser(String userId);
	
	public int memberRegister(NCTmemberDTO dto);
	
	public File uploadFile(MultipartFile file, String uploadPath) throws Exception;
}
