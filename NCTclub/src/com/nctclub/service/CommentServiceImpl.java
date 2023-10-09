package com.nctclub.service;

import java.util.HashMap;
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
	@Override
	public int removeComment(CommentDTO commentDto) {
		return mapper.delete(commentDto);
	}
	@Override
	public int updateComment(CommentDTO commentDto) {
	
		return mapper.update(commentDto);
	}
	@Override
	public int getCommentCountByMemberId(int nctmember_id) {
		return mapper.totalCnt(nctmember_id);
	}
	@Override
	public List<CommentDTO> getCommentsByMemberIdWithPagination(int nctmember_id, HashMap<String, Integer> map) {
	    return mapper.getCommentsByMemberIdWithPagination(nctmember_id, map);
	}
	

}