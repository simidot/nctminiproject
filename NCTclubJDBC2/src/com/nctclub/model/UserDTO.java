package com.nctclub.model;

import java.sql.Date;

import com.nctclub.utils.UserRole;

public class UserDTO {
       private Long id;  // Assuming that NUMBER type in Oracle is mapped to Long in Java
       private String userId;
       private String password;
       private String username;
       private String nickname;
       private Date birthdate;
       private String phone;
       private String email;
       private String address;
       private UserRole userrole;  // Enum for 'USER' and 'ADMIN'
       private Date regdate;
       
      
       
	public UserDTO() {
		super();
	}
	
	public UserDTO(Long id, String userId, String password, String username, String nickname, Date birthdate,
			String phone, String email, String address, UserRole userrole, Date regdate) {
		super();
		this.id = id;
		this.userId = userId;
		this.password = password;
		this.username = username;
		this.nickname = nickname;
		this.birthdate = birthdate;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.userrole = userrole;
		this.regdate = regdate;
	}
	public Long getId() {
		return id;
	}
	public String getUserId() {
		return userId;
	}
	public String getPassword() {
		return password;
	}
	public String getUsername() {
		return username;
	}
	public String getNickname() {
		return nickname;
	}
	public Date getBirthdate() {
		return birthdate;
	}
	public String getPhone() {
		return phone;
	}
	public String getEmail() {
		return email;
	}
	public String getAddress() {
		return address;
	}
	public UserRole getUserrole() {
		return userrole;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public void setBirthdate(Date birthdate) {
		this.birthdate = birthdate;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public void setUserrole(UserRole userrole) {
		this.userrole = userrole;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "UserDTO [id=" + id + ", userId=" + userId + ", password=" + password + ", username=" + username
				+ ", nickname=" + nickname + ", birthdate=" + birthdate + ", phone=" + phone + ", email=" + email
				+ ", address=" + address + ", userrole=" + userrole + ", regdate=" + regdate + "]";
	}
        
}