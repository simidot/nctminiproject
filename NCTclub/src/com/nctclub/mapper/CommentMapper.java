package com.nctclub.mapper;

import java.util.List;

import com.nctclub.model.CommentDTO;

public interface CommentMapper {
	public int insert(CommentDTO commentDto);
	public List<CommentDTO> selectAll(int nctmember_id);
	public int delete(int commentid);
}
