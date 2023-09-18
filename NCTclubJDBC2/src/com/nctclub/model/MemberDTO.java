package com.nctclub.model;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class MemberDTO {
       private Long id;  // Assuming that NUMBER type in Oracle is mapped to Long in Java
       private String name;
       private Date birthdate;
       private String nationality;
       private List<String> positionList;
       private String mbti;
       private String image;
       private Date regdate;
       private List<String> groupList;
       
}


