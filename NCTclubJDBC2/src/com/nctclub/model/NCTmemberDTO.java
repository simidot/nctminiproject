package com.nctclub.model;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class NCTmemberDTO {
    private Long memberId;  
    private String name;
    private Date birthdate;
    private String nationality;
    private String position;  
    private String mbti;
    private String image;
    private Date regdate;
    private List<String> groupList; 
}