package com.nctclub.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nctclub.mapper.CommentMapper;
import com.nctclub.mapper.UserMapper;
import com.nctclub.model.CommentDTO;

@Service
public class CommentServiceImpl implements CommentService {
	
	@Autowired
	private CommentMapper mapper;

	@Override
	public int register(CommentDTO commentDto) {
		return mapper.insert(commentDto);
	}

	@Override
	public List<CommentDTO> getCommentsByMemberId(int nctmember_id) {
		
		return mapper.selectAll(nctmember_id);
	}
	

}
