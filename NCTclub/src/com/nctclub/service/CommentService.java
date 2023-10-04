package com.nctclub.service;

import java.util.List;

import com.nctclub.model.CommentDTO;

public interface CommentService {
	
	public int register(CommentDTO commentDto);
	
	public List<CommentDTO> getCommentsByMemberId(int nctmember_id);

}
