package com.nctclub.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.nctclub.model.UserDTO;

@Service
public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
    private UserServiceImpl userService;

    @Override
    public UserDetails loadUserByUsername(String userId) throws UsernameNotFoundException {
    	System.out.println("loadUserByUsername 실행......");
        UserDTO userDTO = userService.getUserByUserId(userId);
        if (userDTO == null) {
            throw new UsernameNotFoundException("User not found with userId (해당 아디로 가진 유저가 없음) : " + userId);
        }
        List<GrantedAuthority> authorities = new ArrayList<>();
        authorities.add(new SimpleGrantedAuthority("ROLE_" + userDTO.getUserrole()));
        return new org.springframework.security.core.userdetails.User(userDTO.getUserId(), userDTO.getPassword(), authorities);
    }
}

