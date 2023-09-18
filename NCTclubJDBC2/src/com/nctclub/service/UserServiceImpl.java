package com.nctclub.service;

import javax.servlet.http.HttpServletRequest;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.nctclub.mapper.UserMapper;
import com.nctclub.model.UserDTO;
import com.nctclub.utils.UserRole;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper mapper;
	
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
	@Override
	public int userRegister(UserDTO dto) {
		
		String inputPw = dto.getPassword();
		System.out.println("암호화전 : " + inputPw);
		
		String cipherPw = pwEncoder.encode(inputPw);
		System.out.println("암호화후 : " + cipherPw);
		
		dto.setPassword(cipherPw);
		dto.setUserrole(UserRole.USER);
		
		return mapper.insert(dto);
	}

	@Override
	public UserDTO userLogin(UserDTO dto) {
		
	    UserDTO loginDto = mapper.userLogin(dto);
	    if(loginDto == null) {
	        return null;
	    }
	    String inputPw = dto.getPassword(); 
	    String dbPw = loginDto.getPassword(); 
	    
	    if(pwEncoder.matches(inputPw, dbPw)) {
	        return loginDto;
	    }
	    return null;
	}
	
	@Override
	public UserDTO idCheck(String userId) {
		
		return mapper.idCheck(userId);
	}

}
