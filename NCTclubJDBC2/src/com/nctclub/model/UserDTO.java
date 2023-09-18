package com.nctclub.model;

import java.sql.Date;

import com.nctclub.utils.UserRole;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
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
}