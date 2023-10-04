package com.nctclub.model;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

import com.nctclub.model.NCTmemberDTO.NCTmemberDTOBuilder;
import com.nctclub.utils.UserRole;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;


@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class CommentDTO implements Serializable{
	
	private Long commentid;
    private Long nctmember_id;
    private Long userid;
    private Long parents_id;
    private String contents;
    private Date regdate;
    private int depth;
    private int is_deleted;
    
}
