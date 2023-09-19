package com.nctclub.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class NCTmemberDTO {
    private Long id;  
    private String name;
    private Date birthdate;
    private String nationality;
    private String position;  
    private String mbti;
    private String image;
    private Date regdate;
}