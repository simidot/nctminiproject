package com.nctclub.model;

import java.util.Date;

public class BoardDTO {
		
	private String name;
	private String email;
	
	public String getName() {
		return name;
	}
	
	public BoardDTO() {
		super();
	}

	public BoardDTO(String name, String email) {
		super();
		this.name = name;
		this.email = email;
	}

	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
}
